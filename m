Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E703D9DCC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587591; cv=none; b=VGVrUeAnhX1tkDYThDZDXE7CWbNvflsL7RhRzWTjvzVG/fxp5KsDP8JTlEk+JuG44I3HCP+ltoMfplt2LoFR2XP47WlEG/3u1qJEEAPwUiV6P/cQlHtf+55E8dB5dY4VU4Ti04ByY8RX3AzjACjmussFKcy7LV718BGMpl9DsH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587591; c=relaxed/simple;
	bh=KKWtxsa4+JxynoqTU3twhaxB29xf4CJ4YYZF5aGtZHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4lx3+23JE5VMDm1sVTcQ5b+U8Tk4QFNmPe+VvSStF47ESCIvTkOyJhk80om0inGrPMOmbEroi9W3joQPs6HrOsXyFI8q8H1iF1wzpgR7B2F5vb5cFAS1cZVfMpC3ywhhhVY3M0e2kytDLrebZWhkGVvgh/WiGPbJiCYdgqg2t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GiMiMMWE; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GiMiMMWE"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910ca5aa8so1068485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789587583; x=1790192383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLWCt+dlTo+bsva3Fw8pE5vrcV7G5HDlYsoQqT2I0wc=;
        b=GiMiMMWEd5C708KuSjNKTPc3sRMzRWGxgdOtrpJxZSmx+3D3s7A1OVs0kTKm8PJAIG
         TiTZ2TP0HxVhQaF/42xRQtUw2hG5eGoQoddH60q8pqC1ZroIijXyhV+1RWw9C0VVh+UV
         WcyRVVQuiEIFTBjw5c66hVUtpFINPFCHeZ7+q6OZu1MVFQtL+KPvvhF+5xPUWQGXdPkN
         ENnlsU74cN0cPdKYgEAl7LeI1bSu5KB7xIehfJx6krqEWnYLSbtSY82lzxEXtXwhyODn
         fl6sAoZcTg99pA1pfHAmRgOKivJIz26XQALJVaq/alupC+GWP5BbepgHVnsdOYng27pk
         E0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587583; x=1790192383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLWCt+dlTo+bsva3Fw8pE5vrcV7G5HDlYsoQqT2I0wc=;
        b=fZtuKjJ+wmVAEERlu64y/IRf5MWq56Y87noi2b7aXw1AYsxwWYu2t5lr1zCJgi5KhW
         BjzFyTvbtheQNJTNNz55vMfGjntu5+g3cVJUtNEuzbp2EO89AmoZcyH5zFojW2AVIgnY
         Xz4gusyafHoBYid+iDT60B1ryfqLZt+gARaq4B+AWLEDNN6YDpNVFm865msrFXEgq40x
         7UhrZY/qRU2130PcV4rCi3qrYcOaLSdB7i5guaMf/j2aUF7gO7rV4qRuMVMx9lvxoxLC
         NWHvdxTHxTomYmJs6lnwZ5BoRu62KEw+IOehOgsuW21RIb7GSwCX2y4VzTWK5KcewbhA
         lSBw==
X-Forwarded-Encrypted: i=1; AKwUvBwAAZ8hVNfOeBHpr1tSVBlkOgnA0Mf5LBvCdXWWx9P7floj5/UahE4083ih3LrNIuFXTagY4O6Zmki+ZQs=@vger.kernel.org
X-Gm-Message-State: AFuF++nJaPzI/HRLeCCbzKbqz6AoEceiTR2LUL23zvgRAdJl3H2jiBQT
	M/hDKIvsIAKtWQwyssURPQZ3M6WLqXrJpc/KgyCwmsKPafYUEj8LM46A0Ij6zAfNugL2OpVZLOF
	T3FPKaA==
X-Gm-Gg: AYBFou3BZo/2D/UTarDMAZzX8ZfrWnt1Ysw0OH29QZ9NdnA1YFOm+JmXds9rYa3ldvu
	nDI/MJQOMVDLdN3bpgkw1JpBvU9Lza+FuFDjem7U+b2YPiO9kvFAzAr9fIfnI9tkM/HFwzJx5Jc
	anXSgh32uCkGnjK8Dq/ktO3RIsf3QbQS6C3taAiWIhldjS1sF+mCmj7xablldJInFLUOBpNwofI
	QznTRL+2HtWGFmjDiotQkJ+20G7swSj0PLOR2ZghaP1QxxjKC5bQDcn43fA1bpqQKMcr0F3xsb3
	zGriE740liStnUwmJE/0xFkR1bW9X68hWeOAkpL5YfaWhC7pKgRoWn/b8++cgGQIrGzmM71bz/n
	ISarNXfIFpi0dbsMVoQko7JkfakfIrZoI9a3ccuYi53X6NsH0ZrFdnatVPxI8p38jWtXl85v6r8
	442mQvUj+xPVuIPPOHOKbRDE1emjfQxwWyK0pZ6iTp2Sbir00rUJRDyZQIUpJGEitNrpKqGGIv
X-Received: by 2002:a05:620a:3182:b0:939:bd4e:b2fd with SMTP id af79cd13be357-93bb791873bmr728894685a.43.1789587583154;
        Wed, 16 Sep 2026 12:39:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81cf2568sm279486985a.36.2026.09.16.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:39:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:39:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
References: <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
 <CAFmvuTXwUiap39-FHv6aqGbJVzORRx8tV1QfN0BDjJaPsbfKHg@mail.gmail.com>
 <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>

On Wed, Sep 16, 2026 at 11:00:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> > Hmmm.  Do you know where the unmount operation was getting stuck?  Was
> > it the usb_gadget_unregister_driver() call inside dev_release()?  I just
> > want to be sure about this.
> 
> In these reruns, I found that the unmount task was blocked in
> synchronize_rcu_expedited(), called from namespace_unlock(), rather than
> in usb_gadget_unregister_driver().
> 
> I reran the PWRITE callback tail test with both patches applied, using a
> resident helper whose main thread invoked umount2() directly. A monitor
> thread in the helper captured the blocked main thread's kernel stack. In
> three runs from fresh boots, the relevant frames were:
> 
>     synchronize_rcu_expedited
>     namespace_unlock
>     path_umount
>     __x64_sys_umount
> 
> In each of those three runs, the same umount2() call returned
> successfully after I released the callback gate.
> 
> USB gadget request completion callbacks run with interrupts disabled, and
> interrupt-disabled regions act as implicit RCU read-side critical
> sections. The observed wait is therefore consistent with the diagnostic
> gate delaying completion of the expedited grace period.
> 
> I also added diagnostic markers around dev_release() and
> usb_gadget_unregister_driver(). The test harness signaled the resident
> helper only after the reproducer had closed ep0. In five clean runs from
> fresh boots with these markers, both usb_gadget_unregister_driver() and
> dev_release() had returned before the resident helper invoked umount2(),
> while ep_aio_complete() was still held immediately after
> iocb->ki_complete().

Okay, that's not good.  We can't expect to rely on an unintended side 
effect.  All the completion handlers should finish before 
usb_gadget_unregister_driver() returns; we need to enforce that.

I believe this misbehavior is caused by an oversight in the dummy-hcd 
driver.  Can you repeat these tests with the patch below applied on top 
of the other two?  It should cause usb_gadget_unregister_driver() to 
wait until ep_aio_complete() returns (the actual wait loop is in 
dummy-hcd's dummy_udc_async_callbacks() routine).

Alan Stern


Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -343,9 +343,11 @@ static void dummy_giveback(struct dummy
 {
 	bool fifo = req == &dum->fifo_req;
 
+	++dum->callback_usage;
 	spin_unlock(&dum->lock);
 	usb_gadget_giveback_request(_ep, &req->req);
 	spin_lock(&dum->lock);
+	--dum->callback_usage;
 	if (fifo)
 		dum->fifo_req_busy = 0;
 }
@@ -759,11 +761,13 @@ static int dummy_queue(struct usb_ep *_e
 		req->req.complete = fifo_complete;
 
 		list_add_tail(&req->queue, &ep->queue);
+		++dum->callback_usage;
 		spin_unlock(&dum->lock);
 		_req->actual = _req->length;
 		_req->status = 0;
 		usb_gadget_giveback_request(_ep, _req);
 		spin_lock(&dum->lock);
+		--dum->callback_usage;
 	}  else
 		list_add_tail(&req->queue, &ep->queue);
 	spin_unlock_irqrestore(&dum->lock, flags);

