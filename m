Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6318E025
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906052; cv=none; b=FOPhOquVv/zcKOhtjI7kqn+84XoL1KsXD3CMxS10YNRKcfOqF5/rUlDZxXXnxMfDdkDE1QhVhBhOtTybBhHIdMIXLc9D4yaU0hneiw8Wut3yZRKHjAWiR4S8mONRrzM6L7u/KurF+VsJNHggboe1mazyxcllDzxWSml/n9UuNZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906052; c=relaxed/simple;
	bh=9qIwg5blpsGHBsHZmXwdu874kUyQf2EFzdGeRRw8hj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6XTm4QKiAjzQMhji+Ntb30lsdvZx9a/naTwkOV0NsbeQXt9vuyMeqwBInlOwdNldmCVbDwOFg+6DAlIe0nLuq9glv4sjQVBvVJlXq7MyGAlvK+aOl7j5mPJmmM5OK2pb64Kw2lkIduCirW2Hu21q20vKXIg2+DQfBNf7kojGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H62Bz+BL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H62Bz+BL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so6038565e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906049; x=1788510849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdG4ratxJr2h3SHdDRaAUz5b5worhsvaeMjq57np8Xg=;
        b=H62Bz+BLXTpxzzXzicBgFhbvA66G7UUDFN/qGWOLo2AAb+4yHrrjLTUYWxTOz+OHJc
         zVoiFFntkY0lKxXe72BnCbAoY0f24m4b4EmIybiPQUR5BuVZrgCr0N9hyBw4tNcyJVm6
         4QqakLHeLjyiLSdnoAOQrynf4LGr6M2N9uEfFXR+0zwKqF6TG7YQKjv4QJSpx1GUISOE
         T9ucenRwpDnVhBYmqTaYGYs5eUPbS33fztR3Qslckbvxo6vEHEo6gDT9nHG7heZs4qoN
         kcfXyV3P0U3nXWFyZ8C3uFcEMUG6I6NSXj/8iDom3NlYtc+SjBB43iW9aYkVEjSM1Rts
         jNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906049; x=1788510849;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdG4ratxJr2h3SHdDRaAUz5b5worhsvaeMjq57np8Xg=;
        b=fOrbJJc9yVp63mbNhEbXZv8IWh5d7QJ8iMr5TveaVP2NgKKkyxVSrAY8WhYXN1Eqzb
         yZL3OfG4hf7KdXZ9t+h3/5+EWHhA5RORdG7E98eKiOa11F9lfhbSaFLbdJwIUisrj1NG
         hXDN5x0Lp71tY8FtFdzqbu+eSINvFACediFzqBwFoMJY46ekaJwYvRTwSJyqfW2jRgYV
         o6V5kQFLy/+gGzZe/5chlKjQKcrEJmGpD8CDr/1x/EJUEgWeek5vv1I5bAPWT/7gbyfJ
         3Hm62AB8ntAszjmID1uVvIzV064CZkYashaOL5wYKuzJodjLdSyboZpB9K98edJ7k4Ct
         e3tg==
X-Forwarded-Encrypted: i=1; AHgh+RqMeouep+MaW71L/hRDVcThHsqCIafZLTyf1VpR3ADenVbgs3nCOAkLbxFWb8LLb44byOcPhV0mXYnMD0s=@vger.kernel.org
X-Gm-Message-State: AFuF++nVQJKLc6QwRcrUmakcqysV+mfDEJNCFrpMJxnUCF/NTRkBi95D
	belfr2+iGAUM3g7WqSJRdvYb7TdhSgEiU2bEs56VEFoSZZVsndnEjWVX
X-Gm-Gg: AR+sD10fZG3M5O7a4wfvZljaQhjp7rwj4a4JiW750nsql/e/ZNDnYM4R0nhqDLbdeuJ
	0iYxDQgPEZ2Qh9XuSgjn0e7PKE8GEMZ3Qv6s1AmCLEH1ebS4BLCxxLwIbBjDLZkQwWFLoE6Xitl
	fQYglFG7+0HElhwkFh7A2Vg/e9mZqiPZr/KIUcPGNj/crulfjPwaoaQ+P+6WzfD21N4BbxTBLYk
	XZsdH5M+v8LyOcY+R/JhruF0X9CANcKijhCDzBoHjFzdHhzg7q4tJVFToTzXsUA6QCeA34k3nOg
	g3WcVaYipKqPbWFAhLYBh3/LsoRP7kqDSlddGO63JfMbQyHhXMvGAOB5EMR8mSxfXl4P9Vddfdm
	4gHEtaexiinZUB0GOVUlIcz6iNflSG52rVXbPRcHTI8CjxMnvrnYO0eXWc7u885vbQhAPB13vQe
	Tkq3UPi0W0x76zBk9kDjV1nrzk9AbsaKDXc1nMo7494fLmBXMhBedNlvYKbVRXd+v/JFg=
X-Received: by 2002:a05:600c:1c0d:b0:499:a5fc:207e with SMTP id 5b1f17b1804b1-49b91c338dcmr82824855e9.8.1787906049245;
        Fri, 28 Aug 2026 01:34:09 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm38990515e9.2.2026.08.28.01.34.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 28 Aug 2026 01:34:09 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:34:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, Peter Chen
 <peter.chen@kernel.org>, falemi@asu.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
Message-ID: <20260828101926.086f97dc.michal.pecio@gmail.com>
In-Reply-To: <2026082846-lethargic-ability-93dd@gregkh>
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
	<2026082846-lethargic-ability-93dd@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 08:01:19 +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 27, 2026 at 10:34:56PM -0700, Farhad Alemi wrote:
> >
> >   BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
> >   Read of size 4 at addr ffff88810e9061c8 by task repro/9505
> >   Call Trace:
> >    ci_hdrc_add_device+0xb76/0xd10
> >    ci_hdrc_usb2_probe+0x22d/0x370
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    device_driver_attach+0xe0/0x1d0
> >    bind_store+0x1d0/0x220
> >    kernfs_fop_write_iter+0x3af/0x540
> >    vfs_write+0x61d/0xb90
> >    ksys_write+0x150/0x270

This would be more useful with decoded line numbers, like Syzbot does.

But it looks like you don't actually have this hardware and are trying
to bind the driver to a different device by means of 'driver_override'
or 'new_id'. Many others monkeying with this recently, hence...

> But again, stop messing around with root-only sysfs files without
> understanding that you get to keep the broken pieces of the kernel
> if you touch them :)
> 
> thanks,
> 
> greg k-h

And for the record, I still think that focusing on bind/unbind is
misguided because this interface can be used to trigger actual bugs
which would otherwise need connection or reboot cycles to trigger,
and they would still trigger after sufficient wasted time, with same
stack but 'init_module' or 'usb_new_device' instead of 'bind_store'.

Conversely, this splat could as well be caused by a PCI device with
spoofed IDs (think VM). Possibly even by adding a new ID and running
PCI rescan, so no custom VM needed. Too lazy to try it now...

Actual issue is that the kernel doesn't care about working around
platform/pci/insert/other/subsystems anomalies which don't actually
exist in the field, and I think that's what should be communicated.

Regards,
Michal

