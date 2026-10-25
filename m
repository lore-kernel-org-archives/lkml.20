Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958115;
	b=1O8hR2E72BW39I4jC3n9MezAYDj2JQCrbFYIxa+qu2z07eMLnblttWseWR2pZQTEKuy/
	 QEurWhR6F/l5r//CCc/lqOBQ4tGREhaIjpI9+LEkmdSWPTmyrEdhzdJc2Fj3ZxeZW/EeK
	 nmwiY0HXfMPJ8el71jtahevNJfs4HVE0BxGydHVWYPCSgz6XIQHCx77dc+ebL97LGQ0s1
	 wAUu2zcOVXZaiplPKjilN08k3Ew84JTNVepme/F9gvu0YBOOZ3HkzT5AUvgxSmg75yRai
	 CTx6mQSk5u0B0dJ+qZ/ePzIiXM0G+GLsQdyW+zHlC9p0yUXFiVkGcCADikdu4eS3buw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+1WmRUKl2XC7tOZfUGnVuLNn3O22106gnqmUD98+IBU=;
	b=ZxIn5kHsxvnEse2AY9jfdSVsklXVCweu5FIrlhdKgkdArGNzJ/ZCL1qSix5rk1rYL6Tz
	 Qrbj8iQG4P+LfsRMQukN+lrfSt3pJG6ITzXFtE4cWCct1OH2mfEEhQKVBR1HGHzQU9HMP
	 xXlYNETZKBS2AgiDH7MbORXRItMbmD6d9d3pShSgTO48f4c066Jg+j8Au0fFUITnHYzjk
	 CZPE5//v6h4VkW1lVJkimTqjPuT2UaNBOjs73wCahRnLXoZq3ciV3HpJ0Ftfvztt6QI7n
	 5fkWFeqb54hodqVNfUH4HWSMUv3rqD5YwpZoRFK0EjxoN180+h0EQ98BXr8MtkiTEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=cw7na4hB;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249BF606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249BF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=cw7na4hB
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso346312766b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958113; x=1793562913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1WmRUKl2XC7tOZfUGnVuLNn3O22106gnqmUD98+IBU=;
        b=cw7na4hBtndxzjyie97/5plvVxYOkNZk/kzxN3ZSxnOMusbnWGQCAd+L7bwMGrbJHG
         tP2F/I0n6/Bf/6uhWpK9Nuu9TodSMu2AGn19DEN1JMj3tEIYZQ32ZZnpzXCO/aTQcnZJ
         1wLVWCol+g7MqdQjCwervvd5poPDfeNlbppNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958113; x=1793562913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1WmRUKl2XC7tOZfUGnVuLNn3O22106gnqmUD98+IBU=;
        b=n6a9Dd2sa8pp2ub3hy2KUd6ZjjSQW90Et2feiDs+3T5C2c6COAlzHbjtpD8DHv2fGU
         8zjFIzWHSL4Tky1Dze4LuEtOSqhc2FRQBSmPJjmswP7nG92KFUqgNteID7aW3rvtiA7Q
         fc5hiNAafSnYlRfXjMHdlCsN/W4r6EDKjSNBSrbDCnr/W0xaVbvYkBYT67P7CHOAAenz
         uG8+kIktwIwVTqni3zNDjX4g8An9ArgqV7isd/GWgH23b3idKN3B1/2rq+EWxI3F40XY
         uOXDALp1TkN0kOEfMbarTIERJTDL7WKPkAP67rPZE4oN4rKY8DngLhFUKcuUZdj5+K//
         mHLw==
X-Forwarded-Encrypted: i=1; AKwUvBzJSrmDeyAkOav71ROhQ5OAT6UJL8qcNHtMd6I5Cpi/FwdfgM+S/jp3c/Ny5qjuDB0x/ZZF4rwpsDMgSGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbs5fSYDKbrUTH/DCEz0NmQbsGSkWfr7RQnrxDcayuG7hgYMW/
	yIE6PUWgu6dvKIYrlleP+7vcHci/z+TitZDj42bFxEywogZ6HrDc3fRcNoW556x32vk=
X-Gm-Gg: AYBFou0KcDa6bPLRQhkP64Y5pskKA4mWTnUFNrmG7/5WNmnkKwYXvJEJome9FeF2Dfa
	YaN1LbErtddRKYYR99MAxA3lVKkYA/6/joOurqLICIomIjk13WlQgdsM+bAxxZNbdC1x/CSTZ2U
	hSAEfYUaQRF0QDCH1FgsuNUMmuNxJ5mPK8I+eg6JdK9Txk+JXM9esatDfA9shEMPr7ljz3NAv59
	1G51W3hweHGeIyjcYzDjuE88e2yhUJ4dN2tAuiV8RwopNoYWMbb4DYb+8Js1VduZGMx+kVU5xLx
	9B6Rch9KBI6cgLgt9Tpg69690Bqa9kVyD/P4QzU3UuhCR2TSYQ2sWYK/PvQoWybComlyvc2zzEA
	unBZf1VE8STSRxyDueLrC+1pDbx+u8rsXEkEp/n7NN1dAhmrgxsF7mMfV1FZr8Qiws2w86HT4+E
	pc3e6yUDiY13PRqr3Or7pnpT2KrL9szWbuMVx5fp/jM2iD5+4t0qSATYEopHbC1iX92hWg5Flp0
	2X5k+LXUk/gcskqE8AKSKLU1dy8AP8JEzijcoxej6p+E+ZE7fBhMKemdWCyZmavxQTeIXqFqsdC
	AF2UM3VamQbHrcfJpkHv
X-Received: by 2002:a17:906:d553:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c46bd906647mr609742066b.0.1792958113579;
        Sun, 25 Oct 2026 12:55:13 -0700 (PDT)
Received: from xia (user-46-112-84-81.play-internet.pl. [46.112.84.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm238279666b.23.2026.10.25.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:55:12 -0700 (PDT)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Sun, 25 Oct 2026 20:54:56 +0100
Message-ID: <20261025195456.43414-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025195456.43414-1-chris@miget.com>
References: <20261025195456.43414-1-chris@miget.com>
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

bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
the PM core, which aborts the whole system suspend. This happens on any
machine whose firmware reports a SystemPerMode value that is missing
from its profile table, and on such a laptop with the lid closed logind
keeps retrying the suspend, so the machine stays awake and drains its
battery.

bitland_mifs_wmi_resume() likewise returns any error other than
-EOPNOTSUPP from restoring the profile, so the resume is reported as
failed although the machine is fully usable.

Saving and restoring the platform profile is best effort. Warn and
continue instead of failing the system transition, and skip the restore
when nothing was saved, so resume does not write a stale or default
profile.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the same machine with v13 and this patch, without patch 1,
    and the firmware in 0x04. v13 alone aborts a pm_test=devices suspend:
    
      bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
      PM: failed to suspend: error -22
    
    With this patch the suspend completes, "Failed to save platform
    profile: -22" is logged and the firmware is still in 0x04 after resume.
    
    This supersedes "platform/x86: bitland-mifs-wmi: Don't abort suspend
    when platform profile access fails" [1], reworked on top of v13 6/7.
    
    [1] https://lore.kernel.org/all/20260911182131.461415-1-chris@miget.com/

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 73be63146fd5..df9a931fa939 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -237,6 +237,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -408,10 +409,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 		return 0;
 
 	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
-		data->saved_profile = profile;
+	data->profile_saved = !ret;
+	if (ret) {
+		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
+		return 0;
+	}
 
-	return ret;
+	data->saved_profile = profile;
+
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
@@ -419,8 +425,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -436,8 +442,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 		}
 	}
 
-	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return ret;
+	if (ret)
+		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

