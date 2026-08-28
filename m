Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FF2D8385
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895751; cv=pass; b=WJhnCv/6beWK6Xk+Ey4l4sgOQfwm5rhGKuh96CSAK8K8EpxQRyj9zCBFS5lpmjVyYl+RMkjEMb8jefgiKPExU5zh4ZVhvul20HOuAD5MRK57dfJgsxsx3M+CjJZ44QCboP25uIQyljOH/FUcfsCi2iP7XP8/voANmq3R44GYd6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895751; c=relaxed/simple;
	bh=Y099LsGeDhJEdqUZyB0FwQqHIQtnfQ3IJShmJmeDzvQ=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=EyY/1JSbf9nXdlJ0ZsDHdA411Ug8dPq8YWvdl4EiNSLbbtx80CWA8P4Z2AeffueLfoMVowinoPUxn8L603iY3b29/mHlZJ5DBo1Ef9OLCBLh5nrIHUSkcPTR9o9atCajDRKhMumeb0TYeUmGiUlwQhr2ubJ6cPO7t2npK0vfz6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=gYyrGy+5; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="gYyrGy+5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so4497575ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895749; cv=none;
        d=google.com; s=arc-20260327;
        b=YbMp2EMajeMBWL0+BVDkfjB+dePhGd8hPlIxCPqMWCWEFpXT9UbQXrd0UaW4JRfDXz
         DC7CR9lo3JEr0AQ/jK4HKD75aR1oHiZgo2nDpQn3w1y+yh/zw4WucIcKupADKkKwA9HV
         3NWVAKZAjhhgSstFnhOvOXZvLezoCCN/lKDSNSda5oBvMTAllc97GQ7gpGTpOlABt8yQ
         Uujd5EZNsySf6g+HTQaevuOHE6BtSCKIdjh4E8IjmBebmrSkig/BQCgL2p2MAsk5ovSn
         1gEiGuU0oyKwzyc4o+VIE3gRRIKFINygFGyaeQbzQ5DdRlPduJ+Em7l/zpbekhJYqBG3
         DJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=9HznZfGvMo9q3xXtU99FMAbiSHWBMXOMk58JvhywN84=;
        fh=vLiKRQ01Ll+9nOJ+Wol8YxOBiWDdMon+lui2OudSWpw=;
        b=NNiq2u+DtVpI5YzECHLIhBZt+QT9IUT4njNwPi2BlrUKlvU/sPu2+yoccBkYE0JJIU
         gnVjfY7RagfMlcxXx4EbEuxH0whsFXQCAZjp6Jeib49EemUxdxij+bGJgUahZXikIJ5A
         XhnS0luLq9cAY3EphtXHUvAfMnZebZ93XTtclz2izko2T8JTYRwd/X0+HpOstnh9HfSu
         NZrguet9T2QHV2P7beYqGsTHSChm0gDxhvCv9JK3zLT3Aq+2m1AmvcHvDQpRIZq4s4iY
         xFKyuFMysOyrzTi4OcFA4J9n1WK/3Q+p9/5xyWOUkmt+4V49DeTm2qHLJcaM3zbTjx/4
         O1Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895749; x=1788500549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HznZfGvMo9q3xXtU99FMAbiSHWBMXOMk58JvhywN84=;
        b=gYyrGy+5ZSclXZqC+KTLCv8pLKrVIoRX30Oc3IEzIjpt9UO8QrvZO9Aoma9f4k6Qra
         nAhoF5VkwpJLH13+TUcHTav1FHmOFNYp1HdQfd0TTvlBILbsGhjPwboCW7pzZndouTVI
         Dq5mgiw6wOtkDSZa43CSedVM8A8I4uiN8bidByhtCDfbs2WI0zGHmUKHHBrRnLuee+E7
         Zo+uYuZnKnwJ57bvEGIzTdXZz97Qv9N7V4rdsH0km6R/9vSI8HS89zZEK2kLuI6hTwB1
         tHR/G6Fj8SkNuRZf96Mo8GxixNvF5Pv7XMb9lvUEy1scpQUW2rSS3tBnGJl+ym1P8p9Y
         ruAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895749; x=1788500549;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9HznZfGvMo9q3xXtU99FMAbiSHWBMXOMk58JvhywN84=;
        b=DQhpGXl1Iwg7URi1VCU7vsce1OF5fPP4N6ead+50PnLlIsGpqOc+75Zy0oqfq/0rsy
         qRCWgQu0ttCpNdFqnsIpBaBEO2GuaXGJjkDK9ahZRkTsh8plKVF61WHzxplS7vKpE8zB
         C6c5gSI9sDprZIU5J/cN/vhy5AlLliBJayYoV9lHWme8LupI7L8M1kOHxMuRww8n/uKV
         XgmlX+lNFbP7aoYJ11Xx2jzm/JtTAGGT1bQrBWtLQEjsBA1AO/CwlKi0BUu1b1MDArcm
         mmX6INETEsY5qPMegpxuu8KkATdm+Cms+f4WJn3d/Hyp5E4T2IUPV8aSZfYZyG/phCfQ
         3EwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP7GvOv5t8ROv3zdo2O2tGuUS5l0Tyw98TmJ28zRXynDTf6TYG7npnkHxhtpXSkPyBKZ9BYSvfo3whLSE=@vger.kernel.org
X-Gm-Message-State: AFuF++m3zxhSSar2kpbvZ7FV5GyI4Sy3Gb+a0HVZLozUCwDLOy1/8xwJ
	M+Mlw6iYZiSk3gKidUCX8L/qgT8TaCPYW6vXgieXvNPdTwGYV8OD5wl/mF1iPOUseTTrm2oT196
	+OpBMtMQNyei5vqctINBvvKdiH5U0vT1dNpNNv+Z0
X-Gm-Gg: AR+sD10JMoNbMlecc2wVzX7BMR51HcXmGzjvEV8SIAqd1Ug8/j0xxHuGQP8ML7ROC2B
	OCIeTJlpognEQeLznHBqgK3KAesFSqE8IRTl/TQhWK+vDQDAttR4IBVqgRyWQyefAknZHXqEV4C
	ZR0n9CgGP/l7kl+r/HCrQLVS/+I+RMAILblZuyFXTs3VIZzTTnZOesJLOxyCEj3+mtPBl1c657m
	CyGW6LvKzAguMXzS96f9zPTO+8Lq2xjiYxj88bTyQvrw/jdIH7hpCjvWXJ73WtlKHXAIY79phmY
	wt5dEb90o1nwbqb/6HjXygjwYERt8WuM+ICBXwvky6pWrp0w6U6Cjm237bhTcC0FZAiaPOE+oba
	NEru6+PDLZdnXPE3GzmOr3FsEZd1Ub0MQ
X-Received: by 2002:a17:903:228e:b0:2d6:fed1:7127 with SMTP id
 d9443c01a7336-2d74ce1ba62mr80003515ad.0.1787895748248; Thu, 27 Aug 2026
 22:42:28 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:42:25 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:42:25 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:42:25 -0700
X-Gm-Features: AcwNN1X3myL4EKpWJHN3_wF4e0tqttJOIHCfAWfSZlygdKG-rPcj-A_2o3HL_ew
Message-ID: <CA+0ovChDP9RtBDgTou=xz5Vmsk2hxaRryNCARO5h5JtiMS_OXQ@mail.gmail.com>
Subject: [BUG] greybus: ODEBUG free-active-timer in gb_operation_sync_timeout()
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/165-warning-odebug-bug-in-gb-operation-sync-timeout/

  ODEBUG: free active (active state 0) object: ffff888014747a70 object
type: timer_list hint: gb_operation_timeout+0x0/0x100
drivers/greybus/operation.c:1265
  WARNING: lib/debugobjects.c:632 at
debug_check_no_obj_freed+0x3fd/0x540 lib/debugobjects.c:1156, CPU#1:
kworker/u8:3/10201
  Call Trace:
   kmem_cache_free+0xcb/0x4d0 mm/slub.c:6378
   gb_operation_sync_timeout+0x1c7/0x270 drivers/greybus/operation.c:1172
   gb_operation_sync include/linux/greybus/operation.h:203 [inline]
   gb_svc_dme_peer_get+0x10a/0x250 drivers/greybus/svc.c:428
   gb_interface_read_and_clear_init_status
drivers/greybus/interface.c:380 [inline]
   gb_interface_enable+0x146/0x900 drivers/greybus/interface.c:1075
   gb_module_register_interface drivers/greybus/module.c:162 [inline]
   gb_module_add+0x1b3/0x3d0 drivers/greybus/module.c:209

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
