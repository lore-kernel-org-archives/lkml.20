Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416661;
	b=FNorMNT348ubfQYJRUkhOYQbA5bzK//2vQqE10SlTaZkWU0grdxW2v8lZVdBs6LBEWuU
	 SgVkq8cZ7c7kMkMFe71+MV0hjSwNpGT59vhRZGxia/D/fqnuq+ExMbuXgjb3Qfu2J4jh+
	 hA2S/bQDDHMSzklfhVEKNgcQYro4W0E6LvVq0nNWcNWjTBpTCL9qNoI5M9XyQh4gHECQs
	 39/rJr+BC2r8qaskjVSBxP732hEtojkP555n3HSqP0XPSg8EdadDoe2G55vkomqU+rJVf
	 GK5KydbJi5WHN6NUOXAW+VRTBm6Ft4Iq3j/AeyV+yLlsof3ZjtVjygNtMGDB3hgBZ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rMEmv/A6Duu7pnLPFNCUIf+98+KnW9o/Ku/3It1i7Ek=;
	b=vGhONNsROgQaUGRhAhqEI7YS/Pm8H2M6sWIX4VpiujTMlAzjbkYmya13/F0hcdSajxhx
	 MNIdDe5TfcTzqMrPhJj8ku/irfHG6B+0lrL5pHZ/aH3NZWn8aMWrDJ/58uorNg3ySn6lf
	 FeoLsawK0oCCgPKs5RCYHjjDukBTqHKpdi8njYGkdoJZD8NrzsbrK8jJi0bPqWDsAWJRA
	 fRlgMXuQNreCU36zGfWpf8cCZNW4rw7NhhmWc8X9evPkpTsn9LYvMY2+uxG3hYEXV+jNl
	 dLksF6yMXfK5uTtX94svi0aKF+PesoeLtAxAtK+lYepKjpoF5rwVBnMoNVEAwD4eF5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=PtKhmspw;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0E606A89E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D0E606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=PtKhmspw
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so4345609a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416659; x=1795021459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMEmv/A6Duu7pnLPFNCUIf+98+KnW9o/Ku/3It1i7Ek=;
        b=PtKhmspwNsbtCwC/6OG7PqT/BSroPZoFWcH/5NLTSgNnhZx0+0dxkAh6ibiMB38RKL
         pZ5P4MgqclfbXqf8kK+GHk3RV/CiWdCYX8LoYuqIyHgbueVK0nRRm+UfwdSsHgB0d8GT
         C5vx5A/oCRxtYnJH6yVEow41XrkYFv9ic1xJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416659; x=1795021459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMEmv/A6Duu7pnLPFNCUIf+98+KnW9o/Ku/3It1i7Ek=;
        b=xCMBJI2Ff0Y0qqYf74jHJe+S9wj2YSaDv0Ks6FDgDMW+/DXKsBBZf5hHcj9PeyYN04
         ubWsLIXfIUtl8Pqx2l2JgArd6JoBQWKNh1VgYwFlKzjrwhscDq/kkye2DujDLiwwyRHo
         bYfm1Dhrv4mkCRcoiXOkjSLIxTc9FFYJSJoD7+teXA+LPCsyAH5kql0JRH/9VAYOsXxb
         TTqlCqfBF8En/dtmvx8b3No70R5SUiLenOtMsCMB+vxlr2gs4RZox9ngiRseF/68bQ/z
         8Vezy0Djd40gjFdO2JgsRsaOsdT7UNyTfosrCBRxUXX6dr/Jt5A/Up6zATHvQJhmDxFQ
         lxVQ==
X-Forwarded-Encrypted: i=1; AL+hErEY79miCuEAnrkA1qi4tUxXKxY74e4Scfhv3QuPIZJOSU13EwmHAbnMenKbyjt0G6f6qOcVJXuks0e58sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mI/OrxcMFhRYIYPL33EWlJ7x7fU/aN5E1J/eDxgW/2Y3Cc445
	8aSyHl4fQNNIA8g0DQCi884JILMKiYF6NCnghxlc/etVk5lFfVFgVz3LujvZn7jyTdM=
X-Gm-Gg: AYBFou01f4bCY+lZXocFcstq/fh7f5ElTfTuL9YajvJ7YzHw1Xfx47r6VZT+7zYX04I
	ArmYPN+/1n5FdgUuhNo1o6qHrVT7yEZJVORiAStOUxSD58BSbQoAVq/DDs0M5DdpZLlsPQLxkxk
	pHPdozvCzjfi2ZD/ZcXLxhmxLyq0AS74POHS7EF9U8LyYn0BJVs8FCSIJ0gwO00dCA0TkG8XGWJ
	zU814JJSv50v9HiaSQuioUCKlRmOHP5+7KOYdtU+QQ9mLA4snS/4otZLKc3o2IGsJr6IudnlQJf
	BDx0IGmZX27YgBXTfZ/i/PkaCF+Zc9kHT6btTvwDj3TZVAfLmVTOFrhDSGqCsxt8ChlDM/me0+G
	quxLN8UZXLNOw1xQID1p+84C1upnch+OVLQAXFVTY9T9FiVSdu8mF9Utcvp44+OPRTYBOu7q57H
	63na4wKlfWd2uEQmNlkl7kSBTVEWDiBQEGnLPdLMGlE2j+oOgbnkw3mVZXww+kw/FZ6yCMq5SlE
	fLiNvCYSP6QZKxCapE45At8g+w4Ai2Y2gVY1LVLRvaPsRtPSPMatXzK3R42j72KjPQZ6u9niAtJ
	Qr8JA71yoc58OQtorzqSxE/LqD4/3sVg4GrKt4y/sOunkWvyu79NYuAMuuwVXdNap7zpBYORl2y
	oOXAOKBFo2VNX08fsEzIof/LMDkI7WiLpW9Ml/TIzF27UCEocd/VyEf6stg==
X-Received: by 2002:aa7:c618:0:b0:6b1:a647:981e with SMTP id 4fb4d7f45d1cf-6b77780e335mr1822613a12.24.1794416658629;
        Wed, 11 Nov 2026 09:04:18 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:17 -0800 (PST)
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
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 1/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Wed, 11 Nov 2026 18:04:03 +0100
Message-ID: <20261111170406.1634428-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
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
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Unchanged since v4.

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 517bc241cdef..6217486fece8 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -213,6 +213,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -383,10 +384,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
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
@@ -394,8 +400,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -411,8 +417,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
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

