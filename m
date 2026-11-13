Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608269;
	b=XYHOz5rMeetaA0cwrdx4WjFH0mDxu6Aw9XQ45UWdj63PMzocDtfPa2PCttMw6W5FgUUR
	 OepvuRiXk3qrevz8g0sEXCBjHhmG5DnE9IEofeHtJXO1P+C4MelGABL7WUx6wvD1hTYpm
	 bDIP5yxvZmIAIrxzdlPYm7Yazih1AfP6d60m716ldZYz12RgsDAqsbsj00KK3LS012A8P
	 j9U73ue3MPvhZVFes5hTyH9s1p9J8veMxkDIXhD3VVJLniIQP6ALyS6sqB8SpXEuv7Wtq
	 sh4NbZoyje5DJ5J4lsZSQhyhjMWi3BSFaTu4e0H89YADMJ4W0CeRt87WnZ7c6ge/h9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RoOMKJstRsz6kzVltt6LynRLltK4wJnMWDIO5lBxAHs=;
	b=VgVbtX6J2N3rsSwCgdCL+OAVVOvKrIfI7wLKAHeBWuNskxoaXbP49itDgveIxXET8TF6
	 xeouIsXsqqjxpEgOolEpgfAymCV1bJBogYQObjSaPr8AqSbq7tNC+gdKO38PJfnA4mm5b
	 giUnwv3NWZxZp9gFB1Qqrle3rEXK3pnrvxqhxkjAKm6YJvhPpcJuq5rBbM2nYcCd72bLW
	 IdJ5cBF0L2jV/lvbDA4nrQMaOmNRv15bkXpGQjJI9PXaVDuE+7yNHHUMrqhRFU8m3qEkm
	 mkUNezqeuKwfrfZFOiLpE2cqW5vOP/yJVN/p9DANyB5pT07XoKYWm5UIczqH88/epcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUm7RyM+;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8550F606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8550F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUm7RyM+
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so405262eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608268; x=1795213068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoOMKJstRsz6kzVltt6LynRLltK4wJnMWDIO5lBxAHs=;
        b=JUm7RyM+AXnjvlrIH2lobJSVH0t/Th2jSkDpo0OPg7nx87/mKmOc4/Y+3HOngLad3B
         O1GBloJGH/x7tNHFVTdP0y+A/2aZxz+nOV+Qy8hdKmVzwcUGBN2stSRPPaqbmvd42lyO
         v8mk3Ku0eL/v/nhnAgp5pucHc9Qk5NkSJCE5jCGtfLCI/poehuw5Z8YD5UfBdwog0rHE
         pQJeQieHsN0wksmeC2iEel4yEuYNnbUdNpAmNfOaQQ/GJ1Fjx4E7SnKu7Ezb9Fg0bS0P
         uqikaNy+J/mIloWXi+sX3FcbCuEjzNl00L3Faaz4FXfxkqQQk+kxq7wSz+XPnioI98uz
         +u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608268; x=1795213068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoOMKJstRsz6kzVltt6LynRLltK4wJnMWDIO5lBxAHs=;
        b=Ola17Wme3cFEL1c5rLn7lRYrHHVBlRa06o7Htho9TJiOLcd+bSUN0bGYPfatq372lE
         8x0mi6EvLZPhntElF3NtpooJr13doGgTRcNE2vN9DzebJADKbsmD55mybxVcz4uphuPE
         4z8gv6yk+HxNFKXEx+XgPagPrgMOsaEpyVGyo20mTvI6LguzseNbXzO9HqTgx7jheROa
         J2htWhWuuHzVJuDAmt3EE94OXVIcr/MEZx3WtrxBIxeco4geb+c2ai0nxRPmud/zbOMM
         EZrmhFfxaiE6SkhW4E6cdQnUsBzxCXeKcjgQYYFffLw6pjvwXZcd9HjJOhW3Mggq8Fcu
         rSzA==
X-Forwarded-Encrypted: i=1; AL+hErFwo9LqWBa5dB8OsHQqDtSdUCAIT3cDcYYGRPGj9jBUajC5N+W5QCl7kdDuXzfahzfYP91r2oel0rW8r1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QZx8S1E5f3YuNI6hPXS1tOPFSqHKyhTRvryNwTzpwGpEFEXx9
	bseDIJGPXrQaC3yWzjTS409gPd973E3XZu2LXGrwqdq0XF9bS5JgCQDq
X-Gm-Gg: AYBFou3J3aYQ4UR19/UxANVidYSviBjSTBTfOOJ+L9ObNFdao2RrlnEY89IGfpafmxo
	tSTXgiVRkPrDAaZ59GPZkvk00hn+cxNL0v8t3+66jRMc+2vslQp5o1Prhg3jFxL5c13Yp7OyjbF
	qw9ms2fVjv4STfd3uRyd25EgH+/o6zTa+fAHvwqhYUXHcPBOMY1Ls+2y6XQUXqQbF0MdVMEKFTU
	c9XxKg9lv1whwtwY9esBTHviAokbTLlYOip4cO5UyhWJHLgB9X1eqYmP90A63KYWCKz2hPWUS4a
	2ct/RsHlMxWNxN0rxdUeHLHQx25uPMhnVccDQgVS7gvmUrehBNJx/maTwU0gLBLr44NY9jspGFC
	ONhmpRg9N+GwbKLPq0xEqOwW/EGxEGBqsW0Zm0s0YjqicGyZRvh+TYDmYDnmMybikPGgbKiIRag
	infCEHXcLAmTsmM0sE25jRzltngUZlvfWIrGO95DB1ptOeDdjq3qXl4T21UjSW/kiPkxLmuq19i
	+RfGfAquIaFt1vH5Kw+sQrNJP49mXMVrDNm459Awv6v6qL/39+t20uovGFBgm1VTJUY5DYQdq7D
	pV5piP/k0q6BglMWNICs85J8zsC4oBQhYFoBSt7GHU1iGXWmYI46YMe1MDv4iUtjZrZz6X+Gcq+
	hCTEoiafYmyFvyYkgcwKduW7cXtULJVyaMSvo+Q==
X-Received: by 2002:a05:701b:230b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b510cff4a1mr939693c88.23.1794608267442;
        Fri, 13 Nov 2026 14:17:47 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm16886713c88.3.2026.11.13.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:17:47 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] power: supply: qcom_battmgr: return charge threshold write errors
Date: Fri, 13 Nov 2026 22:17:32 +0000
Message-ID: <20261113221732.97506-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Both charge threshold setters return success even when
qcom_battmgr_set_charge_control() fails. If the PMIC GLINK transport
returns an error or the firmware does not reply in time, the sysfs write
still reports that it consumed the input while the cached thresholds
retain their previous values.

Return the request status from both setters so userspace can detect the
failed write.

Fixes: cc3e883a0625 ("power: supply: qcom_battmgr: Add charge control support")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/power/supply/qcom_battmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 636d6f6acecc..f14d731e0283 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -704,7 +704,7 @@ static int qcom_battmgr_set_charge_start_threshold(struct qcom_battmgr *battmgr,
 		battmgr->info.charge_ctrl_end = target_soc;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, int end_soc)
@@ -725,7 +725,7 @@ static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, i
 		battmgr->info.charge_ctrl_end = end_soc;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *battmgr)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
