Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491377;
	b=emo6NRPsF/G/Zd35Wiu3VcAos+ytQWpmgfKvDsjKVjrYraEF8NyHVBCLUJgmQCBWvFCA
	 SLnIGbEDCinC/CG2psMAQa5zY3gaFkXRe7twylm6fIPpOFpVhkpS9ePd3BsKKR/mWm7eR
	 6yvy7pltvU+fF03cL88jxKxMGqvI4uzXSGHPBJU/Qz1f0hAGMrxSbq4TMGEdg1/ZX6M+u
	 xnHgTuXMnp7PLOIDRmx1zf/6BnTgO6NqAVtMo3ErQmCXh7Wvm20g/IgiAwsySXRl66hSu
	 8MgfNiVSKISZsPIZQyiCblTuCuImiTtRD9Lx7C2m2ZigRmrhPJZDxhzJxuVQRtian/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2vHG4fjXWFVR+UOug7O+NH5YlX7OSBRB9SJwAE/JWnA=;
	b=vqukUODMK18p+t4TINVenwwMDUWRpAAzeKt8vkIyEBNGE3X0/qeGRlVh+avhdF51l7YU
	 HS6ACWOJc2gi0TLAG4AmlB91S9jpfTIfewgnxBvMSEGCBppnJoU9wTyhBawtzUu7ZYu5i
	 mhC3DgNDRq9zy7WbuHTOWwkyh1b6QXl80lvLiLz8RHmWsTVkOAqHKsZYK9sWPFGOTdFB5
	 9TkiRQb//Roim8fjeZ/AkZJp9MWwz+A59CQrHX1h6qK0XRuB8m+tgt0R187T2N9ZG/voV
	 gMyMzxPKNP6qRoO6jquFoxlcZwdKOHRz87xcLKzvZrBwGWOUC8eTyK0/olUgwN0wT/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b80b3/Xu";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C31606A8AA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C31606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b80b3/Xu
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2609911b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491376; x=1795096176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vHG4fjXWFVR+UOug7O+NH5YlX7OSBRB9SJwAE/JWnA=;
        b=b80b3/XucWAvkorPAcPXrSbu/T5ngQ7xU55B3sEoq0kWuXSr3jk/K95ufVNyALs1mQ
         It/fh4+/vaVtl+3W3nK3Tya3xGeZiyt6oOJlWDUNpsYz06WeERQfu9Fpf0cjH7EdprcO
         yyUvW9lm+MqFn/wp88qecQJXTfuo79RAuskBik7l7DKZm2tsDg4GRCWjJjfvl9kpQUCT
         Yc/MJUJenBluKUBKjJvWg4pUxa/L8YkSAWS9TkpalvUtS1oMNl2WirfmQIkY4YyRtUYc
         3BnAnnPVLjb+Og8rmMGS5AIK7yjpHVAQJXqQA+gs0XzmvuoDHcUfgEFeqMFZ+4L4X8rR
         SFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491376; x=1795096176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vHG4fjXWFVR+UOug7O+NH5YlX7OSBRB9SJwAE/JWnA=;
        b=S4W7U6B1vOQPyDkoL5rFfwIIKCs5SP2h22Gd/qbnxHmEe6jIu9YBWPafIdQwsY6kAY
         NiSe1IYxKT/NJEKl6fVpjKqwzM2iSnhnGpedlTo0i+x46XFrbFsmK5hRqfyHmC3yOeHZ
         03wTiDZThyska6KXU4JGYbbVcC7H58xIc1/09PR9VHHpK5RFVBLSNyJyTqNu9kBMpqDg
         nt0ryqCj0rMPpIjNqk4I/UazjMSo17gssTOKBceYGfCH7rym+YhPoCL5Lo7YtFp1p7Np
         nU2myYIluD5xMfSH1QiqV/T7utgxdJsk/oS7Euld/VaPBDAqQX3txvGM0zhue2nR/Nj/
         tGlg==
X-Forwarded-Encrypted: i=1; AL+hErFXk3LIePAr9poDAGbEvZCFPjv+Jq2PPIwJWbcHw0s3Rv1GPfUZCcbS6bMJxF2e2PKKeqiXmZg9DfhEYBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SOQG8KKHhFizfgPeBxWj9QqJSh2C1Y3eWfFWwI0MeXqPBR77V
	u886EiAHd1MoFIwob/ZrXK7DZgzE/2sNSAcyEiM7lBXhjLWC1RTa5umC
X-Gm-Gg: AYBFou1pU7P6KnpiK/cBYSi68JojG+NBvIUsTDUfWXSASzUC59JYIBkqd4esTObYIOm
	HTCW5IL9qeUK6wBF8diJU6WKmCn169GvEo/1Mdog2Y5W7BtPfjAXSEh+627okC/dUcHyx7PsITp
	Lv8qFFm9TCCGI6+KfI+pRtw0zf0awl5y23m5sdwd7JRZoSKgHymsjOoRyLamUt6SmUzOjhaQQvc
	Lqck7btiJiA9+YEFdA9E5m61nexhAtLEsp8Q3BU0DOBiJQVRhPBSSzTshhAc4j7Wii27+p9I6at
	ePGUzz82Ky15fCK/pkyHzqUuOstY30o0WzHq+9x0cSSNc4wy8LxhA59p+YBXry8G7aPsoz33hAP
	Vmlk7QUvGxY2QdiidKUueyp6UJqoiQK3FnOUeHVMc8jYNUiIGcgNz7PJlo3zumG6vPb3gqU3bzA
	ZvHzw9kxjLASXZ0eWVjF0u/v7XvvakF68m+V8S77jduR5GtcmPZaubpPAYuyUMhyAu+peFYxBE8
	Z9bTAxAd3MeRVPtSPlBgaGOAMKTX9i/NUw/uWytV+0l4bcXV43heUa8UjdD4tMLoZtsye1NkiTP
	Fk5NqHUTI5r2AkKF+sLMn5B33j2JCKgqBBrQLMIBpA==
X-Received: by 2002:a05:6a21:407:b0:3e2:7882:f14d with SMTP id adf61e73a8af0-3f2ffac4031mr5937239637.70.1794491376116;
        Thu, 12 Nov 2026 05:49:36 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm3550580b3a.14.2026.11.12.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:35 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] power: supply: qcom_battmgr: fix the battery current sign on Kaanapali
Date: Thu, 12 Nov 2026 22:49:26 +0900
Message-ID: <20261112134927.95-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112134927.95-1-26rote@gmail.com>
References: <20261112134927.95-1-26rote@gmail.com>
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

The Kaanapali battery firmware reports the battery current with
discharge positive: on a Lenovo Y700 Gen 5 (TB323FU) current_now reads
-9.1 A while charging and +0.57 A on battery. The power_supply ABI has
charging positive, and upower reports such a charging battery as
discharging.

Other firmware behind the same callback uses the ABI sign [1], so
negate the value only for qcom,kaanapali-pmic-glink.

Fixes: 16a7c32e586e ("power: supply: qcom_battmgr: Add support for Glymur and Kaanapali")
Link: https://lore.kernel.org/all/20260829054546.86210-1-jan.brummer@tabos.org/ [1]
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2: no code change; reworded the device name.

The sign is checked only on the Y700 Gen 5. On v1 Konrad asked Jingyi
to check QRD/MTP; no reply yet:
https://lore.kernel.org/all/0e5b7d2e-e141-4ce4-a873-b65bd9ef3c4a@oss.qualcomm.com/

 drivers/power/supply/qcom_battmgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index d6e3edbab..58e103e08 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -316,6 +316,7 @@ struct qcom_battmgr {
 	struct pmic_glink_client *client;
 
 	enum qcom_battmgr_variant variant;
+	bool current_inverted;
 
 	struct power_supply *ac_psy;
 	struct power_supply *bat_psy;
@@ -1574,6 +1575,8 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 			break;
 		case BATT_CURR_NOW:
 			battmgr->status.current_now = le32_to_cpu(resp->intval.value);
+			if (battmgr->current_inverted)
+				battmgr->status.current_now = -battmgr->status.current_now;
 			break;
 		case BATT_TEMP:
 			val = le32_to_cpu(resp->intval.value);
@@ -1804,6 +1807,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	else
 		battmgr->variant = QCOM_BATTMGR_SM8350;
 
+	battmgr->current_inverted = device_is_compatible(dev->parent,
+							 "qcom,kaanapali-pmic-glink");
+
 	ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
-- 
2.53.0

