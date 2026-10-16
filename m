Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7842EACF2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119763; cv=none; b=eXitw/SRT5+JOQLLwgG2JrVpfs+5Q6IkBlyr0UFNGWH7Zu/kszhGb44D/RKT6Updf8mXepmZtcT3WVPu26rwGuWMZzOOWk0CCZALIIy9mKIYfdNbHnWP1VjQISOVgdi0RMfSOqFsYNPncQJ+8EIE8XHQrITOqRRMnVIlx6v23aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119763; c=relaxed/simple;
	bh=L2CSYq3mCoqIUn6oPxJeobbnJD5kXI5TuxiahJaHTFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fy8Wit6jpj5ahLCEF9n/eBY5srSV9I21nnocsRXhw7hvRFnCzUM3o7NL5HbyreeQRIpdCqOrUCFFMdwKFJHPA0llt1G+Rm0+bT1WcXolfeHV35j2MbE48zTMgJrTDzz3wWJkBmOxWxDpVzb+TzBbs/mD3J/t9TA88xrWwcduzBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klsEHlY6; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klsEHlY6"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533778ab0bdso67757761cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792119761; x=1792724561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4D9yM14KvjVwR70sp6To7FJ7frrG/aute3zZt6nzPY=;
        b=klsEHlY6hJxsdb10Hz80kpuVCAljJEWLIbFLKLBMj3B/AUa2BE4IsR1lDQZhwIM9wQ
         MysNrG4TMY47JijxTpIgeuNWXgFw4JSu3X2rS8HOgznH5TmZoxz8stxcIIDdpI+uJz3D
         Hz0JO6QWtXKjffHnMWJ3DflXe6S9OrewHfOz8F/o+QULXWMZeobCunRJBhq9rKx8W9BU
         4kSVeDEAE0cUMNfxqpwoRlKpgEqUmAy0tm/NqUok050GTBSiohNAfO6t5OmcTZIBoEad
         Y1JNaAhbiNNb83gQCk+fNsYLRckVJDpRNlY/twozhEKGOcwLwxoWdsDzforFPdP27oVC
         Zm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119761; x=1792724561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4D9yM14KvjVwR70sp6To7FJ7frrG/aute3zZt6nzPY=;
        b=WbqbwhSzxlAO7mLR1I0xtssdMsD9ZqPvuAqIWd8bWTXon8hNfpM3oBK37TYDhcLgrF
         hJfaM2VIYAyjZKt8m3ZuD8VRRHObrsut8yYYMm2mZA8jf06GtN26R+0vFN+w5F3VBbrp
         MpN7/36md+Nns/bhuyNwjitGm2yBONFIpEFXLQar/H5FEPD3DpvQXYmMu6kQU2roOE8E
         P/YVV2cwbiZIEp8UrlQJZOUlDNp0b6cQJY8q4lQkWLBPf7FmpBt83kE7qBgRpjQcqhvZ
         2CP134pYgGHw3TWXlEZRzuwdRWxBTfeQeltdpRMOkaZNNP16MbIaw8VLlppiChh1wRj5
         4TJw==
X-Forwarded-Encrypted: i=1; AKwUvBwmOoa303vpKSiM8RnAky7eZ0R/Uby/Iv4irRCzcomn3EW/6AjMm1GIyOc2xf4mkHJT1dlElXQU5sk8rOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyV9CfKuCBSRS7Q/FzNkUIklIhns7YmzghP4mGASpkhkWGEBWH
	wpQmcepgBBGd0qJs1ky0YtfWDaQMqK6whDj2Wdj0Ebp0SCiC/JDRZiEh
X-Gm-Gg: AYBFou3FhBc4AYv6nG3Ro5Dbg1hFx9vobtN5S26kWED1cEKoypxbwbMkXUn3GWM9ety
	cmhNEnpAdLPdywIm5/9+fqdbQhqasBzRZYRlcnHV3CRIAqpQnM+BNByoEPLMrpz1BeSok8pPpli
	omi8w69HB8vW6Us80dFP5klyegiZGB0ShurESceorF6AQri121FTdw2PzC/JjSc4dnyn31glmYw
	7shdA7Xfif21UO6Je7PJ/UNErcQfsKRF0CVb5km7NcXR8tLynDucjWdCp4WdnsuqTeXSgSMXhmo
	z80toiPw/9ikP2ABmCY6rXe1oIqDXAd0yHkHGM2xwpvAVe7wfHy0ZIHXo6Zkf4s0T7ztOMptpq0
	oYshvbbV5RcjL0E1cpscRFAwFdal6aLVCrCgbQBOBo8qh09UOMHIBs7Tt3FowI/hG0W2HdIvJPR
	F7zKM2HmpY4mcqgzSf+Hvt6ewf9rrlVycGfDkZEjCmkXasPpDvbkv2CBhmnM6IhAPn9cCnNxyYZ
	cXLrKUySfXikn/2OWYR/Q==
X-Received: by 2002:ac8:5f4b:0:b0:533:43b1:5610 with SMTP id d75a77b69052e-5359fae165emr373990021cf.21.1792119761476;
        Thu, 15 Oct 2026 20:02:41 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa19a3asm10205701cf.24.2026.10.15.20.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:02:40 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Alexander Graf <graf@amazon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] misc: nsm: reset device before deleting the virtqueue on removal
Date: Thu, 15 Oct 2026 23:02:03 -0400
Message-ID: <20261016030235.758830-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nsm_device_remove() deletes the virtqueue without resetting the device
first.  del_vqs() frees the vring backing, but does not provide a generic
device quiesce operation.  In particular, modern virtio-pci keeps enabled
queues active until the device is reset, so the device can still access
the vring memory after it has been released.

It also leaves the device status at DRIVER_OK, so unbinding the driver
trips the WARN_ON_ONCE() in virtio_dev_remove() that checks the driver
has reset the device.

Reset the device before deleting the virtqueue.

Fixes: b9873755a6c8 ("misc: Add Nitro Secure Module driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/misc/nsm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/nsm.c b/drivers/misc/nsm.c
index a3a9f9bfc6b7..7193dfc4343b 100644
--- a/drivers/misc/nsm.c
+++ b/drivers/misc/nsm.c
@@ -483,6 +483,7 @@ static void nsm_device_remove(struct virtio_device *vdev)
 
 	hwrng_unregister(&nsm->hwrng);
 
+	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
 	misc_deregister(&nsm->misc);
 }

base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
-- 
2.43.0

