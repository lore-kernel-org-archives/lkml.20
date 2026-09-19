Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB63C09F8;
	Sat, 19 Sep 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813826; cv=none; b=j1wRaU7Or8SaKzMDtUuGi7bhB8/Lp5fCm/t3glhltCKH8kmVPaBoTgc946WGMCv+kD1koaHRBlF+2bZ9OUIAMHRv67yibQeBvt1h/idrYN1McmKj7H4aceBIR+rxIjQMIRCJ1X+1gcD3RNFNsbSd76CdxmYssSmZbS5UchY3rB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813826; c=relaxed/simple;
	bh=bnqeks2YFYiVccFvMPnqWUTYFvjkTMvoAYudgdk0MBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azjIgw60/NOqbKXuCTkmfmvs/dUUYFLQF4DiOQjuK9dB1gyoHRD9HZVVJJmNfEmqDndsf7S8q72r6o9rSFCCAJbQAXD1RyHQNRkuHsZV0nPM6K7rDvedNoO1JSiWaeoi8puGHq+v05x4tAP1xdr9TkieMU6hDnaPLBFj3RIlni8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X91YAYto; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X91YAYto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A566B1F000FF;
	Sat, 19 Sep 2026 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789813824;
	bh=5K7QBPQaVYVZZuVzqvr4ABMig9uV6Rt0J/zWA248eBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X91YAYtoXVn4soBcyjV+g/uzKr0KKU5eH/1j+ISAx/kivldBumaQkdNGFMcIGgDNW
	 TiEH+ha0yMDT2w/vSJRGVG6e94ehKaXcnZfThp6f5lRVu/qi4ykRKmEuSh1aKf3YH5
	 2VnLp990bxwiTALYNdzP/Sl8c6lR3bFWe5G6NXEs=
Date: Sat, 19 Sep 2026 11:28:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: f_hid: don't call copy_from_user()
 under get_report_spinlock
Message-ID: <2026091905-humbling-swooned-c371@gregkh>
References: <20260919090724.3256109-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919090724.3256109-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:07:23AM +0000, Hui Peng wrote:
> f_hidg_get_report() already copies the incoming struct usb_hidg_report
> from userspace into the freshly allocated 'entry' before acquiring
> hidg->get_report_spinlock.
> 
> When a report with the same report_id is already present in
> hidg->report_list, the update path copies from userspace a second time,
> this time directly into ptr->report_data while the spinlock is held with
> interrupts disabled:
> 
> 	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
> 	ptr = f_hidg_search_for_report(hidg, report_id);
> 	if (ptr) {
> 		if (copy_from_user(&ptr->report_data, buffer,
> 				sizeof(struct usb_hidg_report))) {
> 
> copy_from_user() may fault and sleep, so this is a sleeping function
> called from atomic context, reported by CONFIG_DEBUG_ATOMIC_SLEEP as
> "BUG: sleeping function called from invalid context". Userspace can
> reach it at will by issuing GADGET_HID_WRITE_GET_REPORT twice with the
> same report_id on /dev/hidgN.
> 
> The second copy is also redundant: the same user buffer has already been
> copied into entry->report_data a few lines above, and report_id was
> derived from that copy. Assign from the already copied data instead,
> which removes the fault from the critical section and makes the update
> atomic with respect to the list lookup.
> 
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> Found by inspection while investigating the use-after-free fixed in
> patch 2/2, and build tested only; I do not have HID gadget hardware,
> but the path is reachable from /dev/hidgN with dummy_hcd.

what commit id does this fix?

thanks,

greg k-h
