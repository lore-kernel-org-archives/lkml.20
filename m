Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F74F30EF;
	Fri,  4 Sep 2026 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538750; cv=none; b=ViAo2JT4fw2h78XITXRH5Uc+dpSVRgYSHMa1BUkifwzZszVfHR1CIbCNFnZG82bE28X8MtrvHwL9ZiogFGsC9rJF8JIXqbqhPEy3091tjSOtgwUgGRYt1iyjFtFWjAi4772Ags3Vz3mJ55pYduNhy6hHfMhZbepKRC1RhuuwnOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538750; c=relaxed/simple;
	bh=3leRnt5Z3jaSIGZLlscs+XxIcQVqDUXPe61e7Nsm7FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF0Efb6KMIXS6jkxusGRcKl95L5yqnLiBRwgLSYsWheWl/dFyM03JCXzKN3BK92t3aEwspjjPovF/4IomusCdTqMsypwkQ30exumbXgDoRHGIQSR8gEEX8QxBLu3tYHqcxngjEQS/nF58VDHoiw482NZaa7Z6YIajdci/wN2WYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CRciIXoz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CRciIXoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35D31F00A3E;
	Fri,  4 Sep 2026 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788538748;
	bh=ZojOH5IEUTo1il48O0WmqTvZKhBJn7x4iHLyNdodtds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CRciIXoz4BBpgKmH0q0qTw6v21PUfdUl14kiIVr1WGDQBfc6cfmnnqhid6ci2WWzD
	 qFOJdcSWdb/C6STH6dESYPc3RR/RomlVAtkwgBhvy5L93BsLO/0IiX2IkFqdZ/hs3f
	 aoOFoyu3GdN4frA3y3+GdoNM4ur6lhbbzxvNKA2k=
Date: Fri, 4 Sep 2026 18:16:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cole Munz <Munzzyy1@proton.me>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: dwc3: gadget: don't error on dequeue of a
 completed request
Message-ID: <2026090406-unrevised-stays-4832@gregkh>
References: <20260904161344.2191362-1-Munzzyy1@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904161344.2191362-1-Munzzyy1@proton.me>

On Fri, Sep 04, 2026 at 04:13:55PM +0000, Cole Munz wrote:
> Dequeuing a request that has already been given back logs an error and
> returns -EINVAL:
> 
>   dwc3 23000000.usb: request 00000000ad92f1c4 was not queued to ep0out
> 
> f_fs hits this on every teardown. functionfs_unbind() dequeues ep0req
> unconditionally before freeing it, which
> commit ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is dequeued
> before free_request") made deliberate to close a use-after-free. By then
> the control transfer has long completed, so dwc3_gadget_ep_dequeue()
> finds the request on none of cancelled_list, pending_list or
> started_list and falls through to the error path.
> 
> Nothing is actually wrong. The request is not queued, which is what the
> caller asked for, and both callers ignore the return value and free the
> request straight after. The only effect is an error line in every gadget
> teardown, which buries real USB errors.
> 
> dwc3 already tracks enough to tell the two cases apart.
> dwc3_gadget_ep_alloc_request() sets DWC3_REQUEST_STATUS_UNKNOWN, both
> __dwc3_gadget_ep_queue() and __dwc3_gadget_ep0_queue() set
> DWC3_REQUEST_STATUS_QUEUED, and dwc3_gadget_giveback() sets
> DWC3_REQUEST_STATUS_COMPLETED. A request that reaches the end of dequeue
> with status COMPLETED was queued to this endpoint and has finished.
> Anything else was never queued here, or the driver lost track of it.
> Keep the error for those, and return success for a completed request.
> 
> A completed request still has to be dequeued on the endpoint it belongs
> to. req->dep is set once at allocation and never changes, and
> __dwc3_gadget_ep_queue() rejects the same mismatch with a WARN, so a
> wrong-endpoint dequeue stays on the error path here as well.
> 
> This is narrower than the cdnsp fix for the same caller,
> commit 34f08eb0ba6e ("usb: cdnsp: Fixes issue with dequeuing not queued
> requests"), which returns 0 whenever usb_request::status is not
> -EINPROGRESS. That also swallows a request that was never queued, since
> status is zero out of allocation. Going by dwc3's own request status
> keeps that case an error, which is what was asked for when a separate
> ep0 dequeue was proposed in 2022.
> 
> Link: https://lore.kernel.org/linux-usb/20221117054917.30104-1-quic_ugoswami@quicinc.com/
> Signed-off-by: Cole Munz <Munzzyy1@proton.me>

Did you forget an Assisted-by: tag?

A cc: stable?

A Fixes: tag?

thanks,

greg k-h
