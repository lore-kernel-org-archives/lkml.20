Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F067E3C3F41
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895640; cv=pass; b=iV4Umx5m2fFBXzpRl+6sI1mhKqwA00M55mLFZzVCr/kFYKsI/BYr02Z5wC9+GbnXr8vtoZPlkudc4+mUnVYlxbRuHsMSRRBEtzY9ypbMHd3T2xsvRSFCbg801C2clNzuroSPjVJiRjMKBOWXpUvrVOag6bvWYmIqGhTp//VyFhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895640; c=relaxed/simple;
	bh=7MFD6a5UcICIN91+63n2xHiJ/bosqwow989wzJAVM3g=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Gsc+KmAzlYu8EYVor0YPMY2/CFauLM6t0k0Zv9Igl8mNWrYgjxS27E87aPZh9s5aaLJGrj5LlxyLGtKbdbTJrWa7av2h3TFpQyk+oXYHlhAIzSem59/KGjsC3l7IWWwZIsAhZbe/Aoj0nyCuAF5Jq+s1QE14ItytPNwLn0Bovz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=tWK4hjyS; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="tWK4hjyS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39652a6e963so1683325a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895638; cv=none;
        d=google.com; s=arc-20260327;
        b=mlvZ60F96bfHsdLbJFwC2KtX0BPRssytXzW1MTJgaeH1zypTTvrh68aExA1bMK7RRD
         qxmH2luheXUvKlDF6g7rslAifWwazEu75uGFhLuKZYI0D0AUjlGTNoQEskrSb709jYP9
         bCBxRAX8X6Hk7Citf0E4Dh7NOU0FonSTH4g/6PKLSGB60khT/wrqUqnf8ZiGuwY2Eyrd
         cjauGkZGzS3DnO8DHzx1Kezvl8CiCOAyqeSVPPcmMOJvg9lwP18rp5NgWyiuYzKamQ3d
         gtu/u9vxnklXBmjql6FAC/OLDaN0cP/vhp/mENqrqFM2rlWFw1OO1OdK7naheCtfV6wA
         FA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=jsenq/svfSpf875K1kOfPTKZMXOCv4+dehz8pL28IZ8=;
        fh=FG9VVP8WS+E/250qk5kCCOo/d0A4KGU/YR6XifI1mGE=;
        b=k3PC/vnXDzAGievo89UFZsqg2W3I5cl5pbfBuvZfjfDPrNXkNzrmogtVgJsVSJkAEJ
         ItPmlZwty/PmJFlOIu/1Ndi12sHCaQeJtDWmYm/251cYMGyUjbDBMGAh0w/gq0RCMFGJ
         os8/lRywvY693d/VqLtSpI1N6rT5kWhgrUgFvJ+XeUUC8lroz4PWeDC1sNgqik9OIOYb
         VqkLfPRUJ0ZlN4pSMGtiXuy/cVnt5pRI5nlO09tva3OguSpvGJBD8ZJYuvC7yQcrvLuh
         hgFR94dObPlJYnLC/OpTx3jbYZygB2ahwg9crS7bjjVhyjtadr9+ayGJAgZOfefULs2Y
         uOig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895638; x=1788500438; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsenq/svfSpf875K1kOfPTKZMXOCv4+dehz8pL28IZ8=;
        b=tWK4hjySFK2hDaBzdEsX0ZWRdfVO7gnfAHC30ZLrZAYQrsrk2qn+x/pmNGDE7tYTwW
         crTJ+W1JpuQMUOKp5By2kenEgQ4pAzOwHzWycV6LcK393lSAfBih8gb13W1kw+2fAYOY
         00EPAul8dBIb3AUSBN8fezzFnZK3FcmymiA3FzenkcSQl/+ELn0QZaivsuAFIgdykyOW
         Y8zPl+68vvwH/v2cT4hVf4X7TncSU8N0Twi8mBiKhkajjVphxq1U43dUvV7o2B/jdTOP
         /d7Ui7qVWWHwr/sjYG3/+ZUN84KOpie36rNz64RtbCBxEqbwzFyr4SJ++JwFP48SPnSP
         97UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895638; x=1788500438;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jsenq/svfSpf875K1kOfPTKZMXOCv4+dehz8pL28IZ8=;
        b=ZSNEF3rUUtmLT5j5wR+a4kOFedZNSuhAY2pjpDBaa+b4RT8YJoFrpy3z627JUcGEkl
         0G/e9bO68mnDhZccjss6FlHZlti+OzWjmDVmYW+WaN8X2jJ/qhoyIpPkdkAofurfo6p0
         PnX1yRj1iPH0SjyLNKBUoG1eiOPl8d2j8K0G9sPUhIAe6vC9mnfjejmtpEjgjWyA+zHM
         TdJgEr/gtZa0zIBEXervH+PVvz/R9/018A50KMD/GyfOLma1HtBXiSLpF6E5liK/Vsi5
         GZqhk41C+MrYhM8qgxbLQ9vZkibtwPyXCa9COWCVurMyCOXHz8Rad+NBYtm9Z0vudUK9
         7Vew==
X-Forwarded-Encrypted: i=1; AHgh+RrgRenr5TXThq70GOH6NqX+P8GG64cITj2E2Xx8REqpWaDCPfhH5nMjCp5cSuj77LdU8Ab5it52yX1+PGY=@vger.kernel.org
X-Gm-Message-State: AFuF++kmFvi2eBK6lQzL/H0bFgc4M7NRJ2YPOqvq6IjaorUSWZ31VU53
	KiyRh+3OIvQQa3dGj4aMap2C27E3LQ7wq6Hz/X/u8D42g4VmGsq4VTmhWo5qykTHKeT9ZcUtLlJ
	X4X0z+IE3+5lKm5TP73K95aFE1QoRBld6yyX7no4M
X-Gm-Gg: AR+sD12Wo3D1pTxccK+Uv57xAhHeghDh9LeWw4p6Tes6TuQGDK+dPyZnGQYmDWk+YIo
	jiOJ5K/+TEwN68x8SZU0HEU7MmNNR1fUP6tXPEZyk0Vbn1D/WtEdopZEhopLD0iWPL27Kv/TBi8
	IwH3S2XENL8vDsu2xsrhWUeKuOwhcaynrZCnDy09FNt0QCqFjYDX9eMJkV8j29QeoHVnT2CM2LE
	QQ1xkZwakMQSg0aZNzfj4hxAiNZAJDUKcxhyxyJu0wImUL0CVaw9DR4uz151qiRx54fN57MkNYs
	bIGRNI3+adIPn9ScfLV4ygArmdv7OEQAB9zpiix6o7iOp4hUVA0+HHAWJBA6vqxBm7B0jzWc382
	OJkRzpJw7N2AsOf/bQS1vRYUcFIZmmOvWpIdJ/6fWYLs=
X-Received: by 2002:a17:90b:5866:b0:395:8124:ac53 with SMTP id
 98e67ed59e1d1-396d0ebcf2bmr4947908a91.6.1787895637222; Thu, 27 Aug 2026
 22:40:37 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:40:36 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:40:36 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:40:36 +0000
X-Gm-Features: AcwNN1XkTEj13XqKoskb6cDvrq-g1IZfLKRJ4nrZx7V9XG2vZIZqA0FIppbPi3w
Message-ID: <CA+0ovCj_MtGXFvyQwFiaLN0uqO9WprxXkAwhiqKA=JzBp40K=Q@mail.gmail.com>
Subject: [BUG] vdpa: use-after-free and WARN in _vdpa_unregister_device()
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>
Cc: falemi@asu.edu, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/163-warning-in-vdpa-unregister-device/

  BUG: KASAN: slab-use-after-free in _vdpa_unregister_device+0x35/0x60
drivers/vdpa/vdpa.c:250
  Read of size 8 at addr ffff88810eeef350 by task syz.1.2/11300
  Call Trace:
   _vdpa_unregister_device+0x35/0x60 drivers/vdpa/vdpa.c:250
   vp_vdpa_dev_del+0x3d/0x60 drivers/vdpa/virtio_pci/vp_vdpa.c:593
   vdpa_match_remove+0x97/0xb0 drivers/vdpa/vdpa.c:321
   bus_for_each_dev+0x23a/0x2c0 drivers/base/bus.c:383
   vdpa_mgmtdev_unregister+0x110/0x130 drivers/vdpa/vdpa.c:332
   vp_vdpa_remove+0x5e/0xa0 drivers/vdpa/virtio_pci/vp_vdpa.c:683
   pci_device_remove+0xa3/0x250 drivers/pci/pci-driver.c:512
   device_release_driver_internal+0x464/0x860 drivers/base/dd.c:1375

  WARNING: drivers/vdpa/vdpa.c:250 at
_vdpa_unregister_device+0x51/0x60 drivers/vdpa/vdpa.c:250, CPU#0:
syz.8.826/22808

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
