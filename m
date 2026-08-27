Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10D456DF7;
	Thu, 27 Aug 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835039; cv=none; b=Eye2KnktLBWH85XdcI4gAZCbq82a8gz8mHeH59DumOSC92Pf0Lr0bfsR26z5R4oqo1b4LykIYq4QvPy4uRX5pRNOz6YDEOmY205jyp+hDRvExycEpyItdlu6pteMrYWAdr5vMpJ/vz+lJLIQrzDofaR1Fpi4taNB7N2uOhM4Sjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835039; c=relaxed/simple;
	bh=1iIpC9RkPuPku/UCFkG/HdiqF/EnhMoNVdpT9LubIwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abOinkjf8KO0JYE2MqPkMXgkNhfJJtmWJwRgWL27GA0w3BtvYQWm5BTA2M2ajkYJJZ6H9z20cyMgW8Wh4BPkEXEnCiRSbVpdv19p0QnphiXf3gJ8t9Et4Vl8Gt5bcwHY4K9ucgXvzrMLYnmuMNoYbwHEWmzx+XkbmpV8pFjrtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lES0SR6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lES0SR6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A63D1F000E9;
	Thu, 27 Aug 2026 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787835019;
	bh=gtS6q6O/w1dDUK31mqtpp0OkjQMD1ZAPP6gYriMN9xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lES0SR6u/MkJorNAwCbTun/UAL83NHvGMKDjnA7tlU4hQw3LIbsNuJTxJ3pVs533v
	 FwCNrM7DmkIPCyPWHdagxejRgP77RjR6KV0zqxMKEkZ3F8zTRWJSzqG4lsXAcx4BSH
	 7Bn6rtd5u5NyxFeKuzJHvMZKb5zZx4ZA25w6ReEQ=
Date: Thu, 27 Aug 2026 14:50:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: co <co+fd80bc5967eb22c3@bugs.sh>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <2026082732-flaccid-overpay-0985@gregkh>
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>

On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> We found a bug reachable in:
> 
>     path    drivers/usb/host
>     crash   out-of-bounds in xhci_queue_bulk_tx()
>     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> 
> Config, environment, the sanitizer report and a C reproducer follow.
> 
> == Notes ===============================================================
>     If you patch the bug based on our artifacts, a tag would be
>     appreciated:
> 
> Reported-by: co+fd80bc5967eb22c3@bugs.sh
> 
>     Everything in this mail is validated by the reproducer below.
> 
>     We also hold an LLM-generated root-cause analysis and a candidate
>     patch. The patch passes an A/B test: the same reproducer panics the
>     unpatched kernel and runs clean on the patched one. Neither has had
>     human review, so both still require validation before you send or
>     apply them. Available on:
> 
>         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
>         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md

Please validate and ensure that this is correct before sending this to
us.  No need for us to dig through random web links, right?

thanks,

greg k-h
