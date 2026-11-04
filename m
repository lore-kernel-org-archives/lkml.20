Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783720;
	b=LD8BVZl7kB1orlyGmwVPYAL1ptm7/UtBBQXou/7WlcZi2QFpdzitDOe/IoZE9kxn1tHu
	 s45zZlpwChpXTrB6lrip+dQNhOXi8aEX6wtfvoAcooRZQMGb2dhmnWrF56vlXzwxt2USt
	 0znZ3H8EwoH2ZNjTKotGDMhrDpyqm/ahWuPxXwaSRaayI4NrbquCUFtYsZvKmy5kPWv7F
	 RDz9Yb/cCEgVSkWI2DEbABc/eY31cMJwVxVevB9tedJEpwTWbtotsIBQ5un7EWoVkV9la
	 TOL1gjbE5CEKd4P/4hX2k6jng4xXwmfy5I8MZfOqrNhhYdYGj7Eqtuhs4CjHz1xoMbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ojIG+YXNF+8W3d4RxdIrrt8BuR8OD/ZdW0UxU1duOuo=;
	b=L5oVN0pxSr0wmKAB3wZ//3OYmnpKXwf714+UD6yd9b6ul3dzYA4i+mRo0zfxlqVQQ1eL
	 uJsYhst1bMRhHzDOjmDrK1sAl25vJojv2Ks2KF5269OZtOF+uRmckaydExNeobAIibCgX
	 G4YumDHRQ3la2Fc+vwR3TGl0XrZj+QIL8pJVoHEYYBpOKXsgjnZAwqDCpsiFTJkvrHsCY
	 qCEEJPF0bNsrpOffCTIohYzmMHGoEdVEUQgQiEYpC1sCBrV8f40baQ0FkUGZ+VrGEQ74m
	 VGt9jH7dfYaauSSsNLSZFlafyaYv86q6vEWG+aCBNDRNJCWLEClZQY+0ELQkhOQtfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ds0XTRx+;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593CA606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593CA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ds0XTRx+
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df54150dfso262218f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783718; x=1794388518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojIG+YXNF+8W3d4RxdIrrt8BuR8OD/ZdW0UxU1duOuo=;
        b=ds0XTRx+T5Eun0aTIAAxtf8nhZUWPGhx68EQUu7L+Xh4wakccla1vFqplvh09PO0wd
         387NRaV4SVmEjVok66AEF6MUhj8ZaLKaTH2E2vJFWfjQMgQ7H07igsfwRgggT26svBpn
         ezwlIwB6dhR+6NK99ByppLCF7pjPJDy1Sr8bN3kCoLG8fHYHeIgH3JjU2j2fsktvc7g2
         g1USLOAWMPbyZjVJDT8qhZR5f/HWEyPku0OjuxWoB3RMNiX5jgrQozY0hEbjJmJcR6Uv
         Ve6sW0tQ+WJDL+L4/jRsV5LCQHzOjLvMEvnt7IDUq4LMIWun5SWU9RwbuMncyIrltOAk
         ccsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783718; x=1794388518;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojIG+YXNF+8W3d4RxdIrrt8BuR8OD/ZdW0UxU1duOuo=;
        b=cbsh9dNKfVvOTmzwgGz5YgZ4zihQOLet/9Jt3Wc0ReL/lb3VhFKVzWiUGpbbr25HqT
         8UntYEJ9rOuWDZgczo/nmG9bUGfOWxSm4EPnM775UtFGcAAN3CCddMUtmYq3CPnMaxm6
         gFGKAcwdzbzLfMiYVRZygKuP1HRY4oS97x+00gFjCg0afJyeBJPkBCEgHeD64Agu4tKZ
         J9v80mqo+b3q/PmK9t1uSBE7pAmbVCc5aKGJBDSMksxlx/W9v1/xW2D46cA+N40NP7XH
         bN8QF45gTxG+ran6/AJivmwrYC3X1V1Zfuf+M8G3SM9klI6+Ij4GrCFugGF2zPd32wWH
         M3mg==
X-Forwarded-Encrypted: i=1; AKwUvBx1/gp94TCnztmrMaNX+ZchIAaEs9eTd+zZa4nyIZ5AE+K3qVQF7xb7JZrzSfh6I6VPjsICWEhPpMlxtHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EQrWlbrJDDk1p6eLMHW0FOklGFAvVYc57K9zTCHgIR2UdAJME
	M8D547dAXIRl8IYza8b6pYS6pi2gvm31dhyAl681PXFZlJ3TjydYavtk
X-Gm-Gg: AYBFou2kBRkE6yfuinASL4MJ0CGvO5APp2DAjesmuVRNMZ9cQ0hltrNkSIHoHzV0Btf
	EGOiM1FCIhWBc9PZntAxgrRDpOmqK3WbqqtsjqOxyYQQG2vlKeQF7DpiwZUH1zddlbm6lKzv0UZ
	zY+iOtIB7aAVfZaVSGTkAlRiQgVvc6vU7MQe15TAS33xyd4sGKRdtl/phAqPjOoc8U9Cg1YyOy3
	T6fXeP03lZ7hs0/+FHFHJVT9ckUYizCaQknt3sRNLk5bGhXJrhBuaJ3TVdkA2t0VP/JI98x+qG+
	gfB+5pzbJyX1hIvi7g2QDwzkw2AbVVKdKKr0OyzLdS20n53FqNm524QH4D8ncJ3S/g8X/0jIhW1
	+jrUgHPXJX1P6JbgQTNo5VGEzANJVFI2FfmVdKmaH2f71WFn631XOYoUrbCY3DKGrIz1xYaxJ+y
	LTGpEw8H5kx278xmDU1OkgzOSd2f3WyBAp+WLkWOjYCQ5AxfNihJ9SwpGd3xBP2bk0owhsfAfs7
	da44g3WvnR/o+24nBq9L8IOe4E8eUzKAdiVFBhPG/HZxjN1+I4vz2L5QCg71m3TET/UUTXDaMux
	LvVVvSDtgyVwfsEeGGrW58fp86MNKIBc/TeO4bM=
X-Received: by 2002:a05:6000:1a85:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-48e7e1f8d39mr23949642f8f.12.1793783717414;
        Wed, 04 Nov 2026 01:15:17 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm2743947f8f.36.2026.11.04.01.15.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 01:15:17 -0800 (PST)
Date: Wed, 4 Nov 2026 10:15:06 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ambareesh Balaji <ambareeshbalaji@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR
 Dequeue timeout
Message-ID: <20261104101506.5ae19157.michal.pecio@gmail.com>
In-Reply-To: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 01:27:25 +0000, Ambareesh Balaji wrote:
> When a command times out, xhci_handle_command_timeout() aborts the
> command ring. The aborted command is turned into a No-Op TRB, so its
> completion is handled as a No-Op and the command's own handler never
> runs.
> 
> A timed out Stop Endpoint command already halts the host and tears it
> down. Reset Endpoint and Set TR Dequeue Pointer timeouts are not
> handled, so the endpoint stays halted (EP_HALTED or SET_DEQ_PENDING)
> and its cancelled TDs are never given back. A driver waiting for those
> URBs, such as usb_kill_urb() during unbind, then waits forever.
> 
> Reset Endpoint and Set TR Dequeue Pointer change endpoint state in the
> host controller only and never talk to the device, so a timeout means
> the host controller is not responding, as with Stop Endpoint. Handle
> them the same way: halt the host and give back all URBs with
> xhci_hc_died(). The endpoint state flags are not cleared here, because
> the endpoint handlers and URB dequeue check XHCI_STATE_DYING first.
> 
> The timeout was reproduced on an AMD xHCI controller passed through to a
> QEMU/KVM guest. An endpoint halt was set on a usbhid interrupt IN endpoint
> and the doorbell of the Set TR Dequeue Pointer command queued by the
> usbhid unbind was suppressed with a kprobe, to emulate a host that does
> not answer the command. Without this change the unbind blocks forever in
> usb_kill_urb(). With it the command times out, the host is torn down and
> the unbind completes. Normal unbind and rebind of the same device is
> unaffected.
> 
> Fixes: c311e391a7ef ("xhci: rework command timeout and cancellation,")
> Signed-off-by: Ambareesh Balaji <ambareeshbalaji@gmail.com>

If timeout of those commands is handled as poorly as you say it is
then it looks like nobody is actually running into those cases (or they
would have been reported), so it's not very urgent. But regression risk
is also low then.

I have long wondered if we shouldn't simply halt the HC on every
command timeout other than Address Device. Commands shouldn't be taking
5 seconds to complete. When they do, something unexpected must be going
on and it's unclear if the HC is still usable or capable of recovering
cleanly when we abort the command. (I recall that aborting Stop EP on
one old and dodgy HC leaves the endpoint in a bogus state).

I have been running with a local patch which turns command timeouts
into xhci_halt/xhci_hc_died and so far the only functional difference
I noticed is that the driver takes less time to "kill" hanged HCs.

Note that in practical workloads, there are usually many endpoints and
sooner or later somebody unlinks a URB and causes Stop EP timeout, so
we "kill" the HC anyway. I haven't seen cases when Reset EP or Set TR
Dequeue hang but other commands still work.

I could submit this patch for 7.5. It doesn't seem urgent and probably
doesn't deserve "Fixes" or "Cc:stable".

Regards,
Michal
