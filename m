Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417097;
	b=ax/XBSlbi8Ul5QMemX7K9wEuf0nks7+JfwKJkRuUwbJZTgockmkR26nfyhGX9vZ7nBAx
	 HmR9QRkY8jBEAmYpDpznVo+baP9TIeBRR+McN7gFv+EEn0xhGA71EqKxNbHPUhh3q8rzG
	 eQVv2KHhodvKGvLp8qxGwrShHBYWfM7JcK0lRKZrV0wwppr5Q+hOpvSCefqLC8meRMyeE
	 MRBV1Yapl4XuB9eVdaqnKxcY6bA6TunYOM819TICwyhnqUw6CK2AXpGcwOlLxak6/3zbq
	 ztMKJG0oYZWihfpP7mhqDjNU12kGAZM2Va4R4Dy+hHBA3isdkPNTyv0bR5fiA8pT69w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
	b=hzoky9ffbG8umsuUlTpUx1BuAQPUU+qSlA66c4qBqt9AHKwJwL9IrQcgMgi9caQYJsn7
	 EWYgw7g1vNtnQCQrfOIiav+tbyFfhl80KO+94Mgdrf2V02sQ8RrcrkEcsZtkgtN3Lae3/
	 1RIaVhkpRA+SiZzqS93U2UWDcJ1gscWJLR2qfkcLIUS1DPG1J+Do9RJgX9DsEjyZr5zns
	 fm28KwrBq+SP9/1Qj966/2laspNVwR61/e/Uqxq9xTPiZv1DuQnP9hXPSpecLeN/skNhv
	 mrItcP4o8mDVRske7Q+N+UURLYXMF0wGxQ5aKGDaK6OfCJ3gpqXMzHIwxMdO8edjFzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDgZ3UpT;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDgZ3UpT
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so655630a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793417096; x=1794021896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=aDgZ3UpToUzDOlnxjbE7VNaBZ7cdT+IEag6WoI9S/ekgWsEOfCHcDjkjKIS+JOhFTD
         /k3oUgD+3btUmUjvLioU1ab4F3dLBVtjW0AcoPwHZc7QLiB12xn/KNi+Msj3TLZX3+46
         XGbEG4pbl+KHZcoGpoKcgsg84bIybc2QqFpLTRnnQcutN8v6P6Z4aqQkHCzzYyvtlOvC
         aJak7nKtDXuOMX2GcPsjnZ2q3bMOuvq+Z3uDed9zW94UGkexgA+ZlxCfmvxmsHOu0uBR
         UZZxRRCaYekQ1gTEAg6a2hIot9TGmODssEuU//ODKx9v+/yeoeZQKFQfLRuQiXv6TRUC
         efBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417096; x=1794021896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=KXAcQWzeTGN4eWnrhE35xrDssI4wIr/6z1GTPp0nEzDndFhkpiHqioXgWEn+WWGvtV
         Rw8bGjIP2xHrjSqswiiRFU1kNYZC+N7inXvnjZ7lSbWMBvMxTrjVPGMvQRQLzXe/Pp51
         llAzdZsPnJXhNmhOxzrn/CmcgNm1w5poj+oaex943gkux0LLkxaWbH5f+dbyBWkSlRNt
         +GA3vBmy+kqZGczsXL/U3yNsnxPfZN5lmTPCXl35g2bNak5983fdD33KVpHeuJhjfYVP
         yskHu7ZDiL0ePOfzcWnm8X4whChQsN6zs+MmVdO8z/FiM8cgQyI28e2+0MO9U3aZsmtE
         F7cg==
X-Forwarded-Encrypted: i=1; AKwUvByDPu/+Fd1Jw3IRalm9AxzjeyoVwA2TgCH8sXqQpF07JZu59fIebh4oQY15Ti4/h1Lg4H8qwkvrw4jSaLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKujjQM4jG9xRKSGD6jKET57DLtYsC4yFSom+umbQwEcowdx+k8
	jKvZ6VfzCBAMbomsILnRQ1my+GDeKLjT/Ae/YctForGuZftORE0LZFxrZxwt5eD2Wg==
X-Gm-Gg: AYBFou0O4d9ZFdUTy3TnEbEL0aIIygw8r8mCa2z5URg750QZ/OygTESK8MNWNVyDNsS
	UwTI8BuyJJHHFqs4Cq81xAGe8uO1i5RjrRgzX/bgcSjLL9j731GpQKNWJk1FFazkgVMajFluhW+
	6/LGBQIHLU363s8sy7o8aftWHNhLhYs66lTH4s/PXVq0t0gCeNw1EaVCNs7DcqujGzip2hlrFqI
	0Nqvl8bIED0ckedUSTwYx3+i/jWFknEeEDpzgYNuuDTuld3WlZMSbjh5UD8Vl9NQI4elNg6V+UF
	aEnTasqeR6XR5E1SVrHc4kbyognRCCRuNN9aXc8xDOQ/FwSCItZbNpgYv4T71P1hhNRpsxlXGFM
	V3xnGNV4t3j6Fv4yBiQtSbZ998o2zVcaFeHHdGSgSJvJb+GCV7WPlA2In0g/7WWO6XVD9q8sDjj
	npzbePAhvz61uZaQFYZ+jI2KQZlutcSDqUigqQVVdvV2St9mtrqgSP0BapXNdjtR+/PgHrnbuMI
	Am0EVHH44IoR1RQ4BYWeHpjYmVcFZEWYVE3HskfA/6ht3Vs89lkXV5Bk2aWRVOjMRQIuc9ET2eC
	sSFLMt1kdcD+AzDVAMGlmUl4XG4wxW96akYSoaQS7MjDoKCBoAVhpYlXe5TBq/kscAkruRvNL6I
	ueoS9Z3+bQJONijWQiMZycd/eE3gCFE7N4VCpmg==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2974708a91.37.1793417096261;
        Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm2940976a91.2.2026.10.30.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:55 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Sat, 31 Oct 2026 10:24:49 +0700
Message-ID: <20261031032449.3536559-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-191184@kernel.org>
References: <20261030151919.3511106-1-jjc@jclark.com> <sashiko-outbox-191184@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> usb_unbind_device() does:
[...]
> Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> second time and emit a duplicate USB_DEVICE_ADD notification without an
> intervening USB_DEVICE_REMOVE?

Both of Sashiko's points are correct, but both are pre-existing and this
patch does not change them.

Before the patch, a probe() failure returned straight after
usb_generic_driver_probe() had run, with neither the configuration nor
the runtime PM reference undone. That has been so since commit
c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
The -ENODEV fallback has re-run the generic probe under
usb_generic_driver since commit 88b7381a939d ("USB: Select better
matching USB drivers when available").

The patch deliberately handles a pre_probe() error other than
-EPROBE_DEFER exactly as it handles the same error from probe(), so that
the fallback keeps working. This is stated in the kerneldoc. The only
new code on the error path is the disconnect() call, which undoes what
pre_probe() set up. A complete unwind in usb_probe_device() would be a
separate change.

James
