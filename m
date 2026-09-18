Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387051814C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751451; cv=none; b=uqauhJQDodY3Y7jo6b/AfJMOag1kaP6/2Qh5TnBY9mgYgmXYCYRCOOf1ky0gQWU6VdhKOFLvmx49UKm5OZRLA2OkYFI9wqiUGyVaKgCIvnWXWB81AvzOgNgVKlMGVy9Y4ZEFDkrOje/cIs+Ixz0tR603VOKBZjuAoKSYcAJSl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751451; c=relaxed/simple;
	bh=ucvUi70zYMSNKdpB5M9U4/0JPwWH9o5vYxQ/RxH4z38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDoaynh6GRK5HNJdaoldZ1wfvZ1cwnu0ycN+o9IIdwsk65BRZB/bv2Id/OLbjxcRbIHAFOWsKxzbrLH+n1iPqqhqVbiviHqivvuzlhDqRT+gecguEZRIwfviPVLbi6c7CdKczZrqDQsDNXYZjs/X4Gl364QzMq3oLcsXPFM46ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/3Gfra/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/3Gfra/"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db18fe459dso6409325ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789751449; x=1790356249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVg6kTrkQkmUGuiks//D1y2XA3XKuOl8NQNCerU5SkU=;
        b=X/3Gfra/nivtqCsk6pHkyBPJoOHZb/Q9AOv7S6Hz/RqNjy5ZMpa5/+iO3h7rf4z+Ju
         ZIFrygxxDdPld07CBab3jooOq3WZxvbF+2jNXSn1ARddELHeUEKcQX8tN6VPKr6t2ALx
         PiChhSnA13tlFokZqEf3jAQQXf8/NbAwSyoYRYQ06cutbgmM+elE4ONIem79UpfmvrSs
         Ob+2t24gYN0gj7wpOKRKgtkHDRxBOYIK1Jr3ovEGuHoZzhMyvVMAzlqE+EP9bQ15b6o+
         krVk5SIJwS+TwilOmWhDACDpW0MeJEibgBVhdtksZLGuctSJVwWbymsMmq70yUJ4WZxX
         M6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751449; x=1790356249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVg6kTrkQkmUGuiks//D1y2XA3XKuOl8NQNCerU5SkU=;
        b=rt5ZWM8gaEZEV4+/0884ppH6GjH1Ta4rdMggBpvDhAGF2x3V3c9LXnF6AvlUkS0CuB
         1emUpIMdgn5kgK0lC9R/6P6vyTTMJuoly2XqHLUI/zwXlcA/QP/voAK7iVe2QDMaQ0OA
         teng6XaTlV1+XhyNkNV5am3hGAmdokxTLEUGGvTbMeHVA3d849qF9+/BM5pRKIl6pPMx
         kymLH2Td/9ORWLgrLwbfwFQVGXOpEc31k7GmhTkl1EzDsP7UHFch2qiYpekM6R0cVWT7
         CkhiGVJVqg53lCdq3VQ61ltrFI/Xa8bRpFFigA57txCpD7GYb+yLLwQopJn5VXbq7zFh
         R1zw==
X-Forwarded-Encrypted: i=1; AKwUvBx5pH7dBFKGO+6irmfg5O7Iq6V2kvScdrSlCNxppv0W4Fn2W8iAZ2cn59h6p31kMrqqKmNX4nQ/VCg1kpE=@vger.kernel.org
X-Gm-Message-State: AFuF++k7axWlyakKjY0HsZRcXXM7+f+mEUp2DMJ3vYWVh+aiLVor2esJ
	Fwwa6Yg03/dfwPgBkVbdJOklt0URqbfd4A7ZaedvUIOJD0xXK7/+hxPw
X-Gm-Gg: AYBFou01knyTVGE47epRQX3EcshkO+CwG4TPm2Re0aoU2jSJS/V0tXBs9PMSJBsvCl8
	IOTvvuBLbwv1W3kIcDml9eBzrhiU2KRLVyXduhE06KbakUOs0wwx2EeaD0abj3XbcixA9H0XvPm
	n5KLMmntH7DBQzpMbCLRM3yYD7XbnRkRk6nIGX4QFz+LT5MzjuxxGqoXWwh0i4WAEk7Y/TJYMKc
	BbiOzPYwOQ798BBiA/+4krRGxzLwLfPU4IUpcd9KbhL4neuk3WYLIuvzKsaO4vLmoSdPJDwbIOM
	watcBe1DsZUc2zcK7NIykZSQE2ZKZZjwdXLVzyVc7riyTGjZZCSmMiz2FNYyS9aw6np52XDq8Hw
	DmpkycKefHV6lYVFgm/CrLp2WeNgPrFR8jokHMYoYyz8JXdRanzLHHyoCL2aOOr32wS8e+PzqrG
	yy00JFo/33CtD8vIb5xxWXr86xcwQeXLTt5VOzJtwafgHgCEW6Nphzug==
X-Received: by 2002:a17:903:1446:b0:2dd:c100:4b7a with SMTP id d9443c01a7336-2ddc1005ecbmr3691105ad.49.1789751448786;
        Fri, 18 Sep 2026 10:10:48 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75b6552sm11775625ad.61.2026.09.18.10.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:10:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: lasi700: put SCSI host on remove
Date: Sat, 19 Sep 2026 01:10:38 +0800
Message-ID: <20260918171038.3588395-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lasi700_probe() obtains a SCSI host through NCR_700_detect(). The
probe failure path drops the host reference with scsi_host_put(), but
the normal remove path does not perform the corresponding cleanup.

As a result, the SCSI host reference remains allocated after the
driver is removed.

Call scsi_host_put() after all users of the SCSI host have been torn
down to release the reference acquired during probe.

This issue was found by manual code inspection.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/lasi700.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/lasi700.c b/drivers/scsi/lasi700.c
index 6d1fb55cc3ad..1b4982cde210 100644
--- a/drivers/scsi/lasi700.c
+++ b/drivers/scsi/lasi700.c
@@ -146,6 +146,7 @@ lasi700_driver_remove(struct parisc_device *dev)
 	free_irq(host->irq, host);
 	iounmap(hostdata->base);
 	kfree(hostdata);
+	scsi_host_put(host);
 }
 
 static struct parisc_driver lasi700_driver __refdata = {
-- 
2.43.0

