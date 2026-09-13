Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323237A831
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789276047; cv=pass; b=u4DcZYQ4Vpu0X//2Hp74N6OniZzX8f/taLvtHqp+sLmz2iPH0N83wzGkyt+7OsyxJC5te54zv3MUg6FsYuqzfEFbKeWFR1Frqu2P4WaWk+Hy0XY3fR5Xq0Ww6EJFPOVjpF9SSziId8WsQLNm8Tg6UM0Xdaxy5cQ0DnxN3BsGn5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789276047; c=relaxed/simple;
	bh=ogfphTBQUQlV6omKxtkQ5kNPEgWY1UjFjmz628qVnRY=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bl/C8RaHhf1lbbNlxZdtpcl23Mm2bDSTFLOwq15RttlErvFfswfy83OvfVaOTm06QIYiPFmGOr+Q1MaPFIJ/VYWTgn5yEJF7Cu6YitMLHhcXS7oT/LSK0WMWEtNrpUQ5+EqC19utBgw0pj5Q10DqtSQ49pbEUzPWuTzpaAXSCMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XFvghlvI; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XFvghlvI"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so117741cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789276045; cv=none;
        d=google.com; s=arc-20260327;
        b=f20E5wU8MQZfJCoNCGVpW+cZqZrPJGxep5FICcrDzUtiP9tgkyfShZisIXkasxCp6T
         0YpDDk7rSus+ShleKe4u7cDRG76r4wN+oaByKcW2l9Qmoo0bCfk1gGC08pXnvWQitwVC
         sy7uvKfIUw3dFU98KcTxR1jzSCMX8f4rh5RjIZA4Us2aGI56lADCx44XWsXqurIV0ft+
         bhf0v/Hfz1T1Nki8Xoc14jU4K4Zf5v/uN5iC+AKKTTqke0GVKn7Nvuv/cfp2+83uHoCL
         SlZXUxi8Dl8JXsjQuOlUq1g4exTylC5glM1G89QsN9dxu0El5sIzIIDaSXF5xjKq3qao
         kYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=Pt7qi17wjMgs8QGCYVHxKxYn4O2l8zR0f/jJN8Gyipk=;
        fh=gy9U3TGNUjiFkFmBqbX8gPhdWYBtuoJqeYEv1iipzGY=;
        b=btV+TTNtPlQeC4xr0FeznApL6XMeYmfCXSM+PIKSqHK3/bZYWKwnXbnu7Z2sLRtok4
         liGiuy7JgyIpkWlqkayp5bwP6ygi8CGnJbhzPkZeceANdnHstfn8bnmcapIrHlV6oBQH
         /b2HeIh+eDcl6mPjCK1rlUn/ofTRNsuhEDsbpkkQilkCS27Lw7k76ALIqr+fiCeertDj
         MK6b/qwwxRYCz0z3bKWRXjRX2gDRRMUMGymUNhhk+bNbmeGQ1G8gvsAetUCmisG6zaXx
         aR/Jo1PO8ltstB+4Rg7lQHxSrmLKpMdpUF8Ee1nwZ98VKP/zq6mnFUR0o5PhnNDzgiQi
         CoPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789276045; x=1789880845; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt7qi17wjMgs8QGCYVHxKxYn4O2l8zR0f/jJN8Gyipk=;
        b=XFvghlvIrLJBc266ZwTjP6QyViyesp7iSuH6KzitV8KaAQzOfJuPNcFCYY5KJrK31O
         K/MaM/B7jQntPGA3a7ngiuu2mKF+YNX9eaH54iDwppJiWdLsPYEE1nBgmM3ydLlay9eK
         UTgwrZDEzbYb0GbRF2z1eLnNYDv0k8yp11PNCFtGlu5nvKTNnw0+ALqa2G+SSrqh+Fdv
         aEGW/+3Z8oeEQAMUh2VTVWcjBPRY+KjftSt4qgMzZgakggHwUic2nVIM8KmeAgLCAu81
         h6vuW2WKHqcgFTYLJR6GS/7/4au6ub1++5YxiKOt06OBj8fTtg+LslY8emu6NEQl81Wj
         zZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789276045; x=1789880845;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pt7qi17wjMgs8QGCYVHxKxYn4O2l8zR0f/jJN8Gyipk=;
        b=njTubWIS5HYYEwv7iqoNPH6oMRnY2T3lpOAAqYNIHZUrmKOsUhB4Q/r1QSTBBHCLb4
         Zu/Q6jlmq7EgWCxHNHMjK+N2wBIjlg55r4nbb0E2UEo/W+hOQJsEFBc/WyBZ4xWz+11b
         ebIhUg+L4PP6avf5j7gJOpSVJHeW8o8yI37SvDOymS04cGfa5KRwUZI/vb0yqbtmHv6H
         RHdO1gssq4u/YQn674ZZSdIrPl+Oc7ncFqGnaFd9WhfKkqDwh9ALTFFYMZRwrrDxtbF+
         2uBNcU79L6sOwgQ0URr59xYfuAqQpE02/aHdZ4wFgncMf2kZwa3O1o0D27VhTYrl+gp6
         Yyfw==
X-Forwarded-Encrypted: i=1; AKwUvBwgLuuyG2iRhUtewjKXrLNvnaOsY3k8X5Xlwi/i7i/N3ysXHp8F4rrxw1MkPh8nwCpnMpHP+uFMNIW1UME=@vger.kernel.org
X-Gm-Message-State: AFuF++nbqmQ6zD9tRfZu6JaG0IMEZykvY2t148tONfllTJtRGKYnHnzX
	tEL0IA8eUmpa6i9RkPUHKokiqwyMOkL0MgA9nVAt5+nD4CeDRKp9tPwShL9dIQXisKrmt1kMfte
	H8PK/EX9cwNhg3K9jvhKNr4eZy6v21fSsKiXNIOvR
X-Gm-Gg: AYBFou0MHbPRUO7gemya2+QShC0nDQgLe0rVQFWu2EltvbN6Qb7y1/kY8V4YO7VKF+d
	mu+1sEhnDKlESimnooRo2TMEAY8p04S8j9nl01WKU49IdYAS7ekjSfPOPFjydNVCi0T3C7FVrZn
	O0EpARs5BCstSV8PB9yOodt2QPzK/3EeB4VoUEnaJwL4hDPsM93zNNDnQAIqDMDd91QTL6b3JSM
	MLEEMlq8YpaSj1qZkKM6niyF6cUPo6fdG8YqEACGqTZiCE3PLLInNaxsHKLqqOSqEOTnGR2XnxN
	kzcEReTCuYQLf4vT4PvYKQCTqORabHWoJDSVjqjO2Yj0MEBwRdqR7EbVa0MjMwDvuXqS+0V4XWB
	qEsNrjwc=
X-Received: by 2002:a05:622a:480a:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-530fa2c7360mr2854921cf.15.1789276044642; Sat, 12 Sep 2026
 22:07:24 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 13 Sep 2026 00:07:24 -0500
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 13 Sep 2026 00:06:15 -0500
In-Reply-To: <20260913034726.28F751F000FF@smtp.kernel.org>
References: <20260913033633.3159296-1-stanleyjhu@google.com>
 <20260913033633.3159296-3-stanleyjhu@google.com> <20260913034726.28F751F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Sun, 13 Sep 2026 00:07:24 -0500
X-Gm-Features: AcwNN1WSVmOma9ruo-U5RCIYyzfUt5DRjt-E9at2LyBlBTaUFdC0yHbx4OhMuZo
Message-ID: <CAE14pdfTsqT0j1+GT7fEReJagZYC4Aa4gwBSmvw7xYJNSDEmcQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] scsi: ufs: rpmb: Decouple device lifecycle from
 devres to avoid UAF
To: sashiko-bot@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, mkp@kernel.org, 
	jenswi@kernel.org, bvanassche@acm.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sep 2026 03:47:25 +0000, sashiko-bot@kernel.org wrote:
> When ufs_rpmb_probe() calls scsi_device_get(), the following call chain occurs:
> ufs_rpmb_probe() -> scsi_device_get(sdev) -> try_module_get(sdev->host->hostt->module).
> Since this is called during the driver's probe sequence, and the SCSI host
> template module is likely this exact same module (ufshcd-core), it ends up
> taking a reference on itself. Because the reference won't be dropped until the
> device is released, and the device won't be released while the module is held
> active, doesn't this create a lifecycle deadlock where rmmod will permanently
> fail with -EBUSY?

The release point is not tied to module_exit, but to the glue driver's unbind
phase. Because ufshcd-core cannot be removed while a host glue driver (such as
ufshcd-pci) is active due to symbol dependencies, teardown inherently begins
with the glue driver. Unloading the glue driver initiates a hardware unbind
cascade that destroys the RPMB devices, synchronously dropping all dynamic
references on ufshcd-core. Once the glue driver finishes unloading and
relinquishes its static symbol dependency, ufshcd-core is left with zero
references and unloads cleanly.

This lifecycle was empirically verified under QEMU ARM64 with modular builds
(CONFIG_SCSI_UFSHCD=m, CONFIG_SCSI_UFSHCD_PCI=m), where the usecount comprises
both the static symbol dependency held by the glue driver (+1) and the dynamic
references acquired by the instantiated RPMB devices (+4):

  Phase                                      ufshcd_core usecount
  -----------------------------------------  --------------------
  1. insmod ufshcd-core                      0
  2. insmod ufshcd-pci (probes 4 RPMB devs)  5 (1 static symbol + 4
dynamic device)
  3. sysfs unbind 0000:00:02.0               1 (4 dynamic device refs dropped)
  4. sysfs rebind 0000:00:02.0               5 (4 dynamic device refs acquired)
  5. rmmod ufshcd_pci                        0 (RC=0; synchronous unbind)
  6. rmmod ufshcd_core                       0 (RC=0; unloaded cleanly)
  Kernel splats (KASAN, lockdep, WARN, BUG)  none

Therefore, the cyclic dependency concern raised by the analyzer is a false
positive, and the teardown sequence safely completes without deadlocks.

Thanks,
Stanley Jhu
