Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AA372661
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154893; cv=none; b=JYMvDQRndcouZjQ1NTCUyjCZIGwfQrnMpA0yi0MhqUWOSifDfJW7Zon5y5IIn2dPw4TeDwaW0kHIY/OZJ0mLjDYdeetJ5FHsaxqBV0HMIsZ9H7izeEPvaLffSQBBTL8toSIYLwhXW2oqS1QSIvKhIIJ5GP1Xfe13o26dLUQKA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154893; c=relaxed/simple;
	bh=0TVCsmzY/81htvR++4cTAiAIRTvIj7D8gDHBKG4Q9Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuAMGbCqaHeVC3jpApfv2iV/BQxZPPoDUKoGLWIXG1mHZ3FYtbZl5OaE+C6Mb0VHXlkSl7uldTXz80/DMXErtsOZqOg2GOXabkiychRbqBy7p8LpaHgw/6JhZ38m2YYifRuTWx5NtMWYVdDNbo8P82nt3AMWiSwXkRwocr+DcHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqnnARWB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqnnARWB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e49fbf92aaso38181915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154891; x=1792759691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYFd/aXrTIJ5csfvBQlIimd/vU0Z6n10xKS50+9y7/Q=;
        b=HqnnARWBmBpdOt9hhczrE49hJ2bxO1Ygdftpc6HSfXsranao9xirqwsQ1SBqeR4aT9
         sHLIA2+x1LqY6lzjOSRMJE1Nil4Ni1/zcWCCHVt6cJqwVjB0aBNou6XkIjD9FJDwIYf1
         remnN3Qx/R/N2yXockUO6/lmjj4ONzKqfLFgNsiZxprBrH6EqVxh4xDiiT9yetgdK3e6
         rCgRKzI265Q4GI307mPCxeSzoFJnfqEl7jXHNw/AvsIgYY9K3Zbc0GU50+kGnZZ4OlRg
         7GRfpJVerG6SguSYDgD/CUuhoRXvR5sxZanJ6rjgPEhAcl8O66ujBY9g3UBXmrVHcKqp
         IR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154891; x=1792759691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYFd/aXrTIJ5csfvBQlIimd/vU0Z6n10xKS50+9y7/Q=;
        b=RHwZNzHtTfFgh/UmJ6jTecJ7sNChr2exurrU0mXXi/JllNCZe4iSNUnuCNzB/EcgMk
         90FxxksPJO+U36jB6vkMku56/VwdWSYB8E2DmyIDyop/rBgJhhY68Ygmo52N7GBapfWf
         2xg1Q/YdXncUAhOfwz9Mi3MgBwDAJkQurzgSqAkIXl4FlbvB4osDn18IKwfElg7rwmVV
         AQPTOMT3M0PVzPX2jqbFd+aFtUSvj/+XNh5ijMcQaD+1jbSLMdujKtNOGaSGF+DGIBHN
         eAX3bcblbC8LNt0CtuycNNgPF2GTXrZr9nwvm2U8F9cn3teMEl1/Gw99mPhjwWOa0jiJ
         zIJg==
X-Forwarded-Encrypted: i=1; AKwUvBwdEYZb1z0U1B432Y/vlCoSqlJLa8CU3Yn3fqEwaSbhmJqq3qNZtfu4n0IULTfog6VynZC57I8V2xCI0gU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0T0UeTS2A/oB4zyzr/y06szXIr4++BRiQ+TlE4mVNEin+zVLX
	/a25xUPCga4jqHlY2eldRWbOYHxcTx9VEfytle0OnISZIXXudA+S9WJ5
X-Gm-Gg: AYBFou3QNphkYrdI+fIAmt3v4lDsX2igK2KkIQ8Udf9QLgtDO3VseK5Y68F5WMIa5fG
	kIrIXrVKMl2vbT+Q9Xbcj09MlTAr1Oy1padx7NTFUmwC8jcI82uKHAmls+D8HBJdaiZBQFY3CRF
	0yIrKzfUpxP/YtI/pTvm1URPc/OOKNYAkupxM+fXCMRKT2EkOvko0Sv32MpMn2YZ4FSy5u+OAzM
	YLvZD+/pnLYzcroPAarpT5tyi5RrCdHN+NNq2yllBlnR/byHu190PpWnpxNnuoBY4IC4AikhdIG
	kxtNCrptl3WthlgqQyHOS3bq+jQz6blxg9wtpe61tUK0+/rffFdsi0isAKQ0RKT3FqGzYEyCrDS
	EBhVP+s7ga1JkfA8I0SzGc8WrUKVKlO0aWRxiqVEUWSt+8es1dPr13rRAvZ6Y7T941BrjQVqIws
	ojs5KWXUeHe7ScEjRTuN09pcI5UPj+8Rx8xcOSDvUwtl495hUVGIGGI+ncL0MKaLibNsEf+KLXf
	a/SM1NN8iUmqg==
X-Received: by 2002:a17:903:2b0c:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2e99a190debmr10184515ad.15.1792154891342;
        Fri, 16 Oct 2026 05:48:11 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834ef9sm9833775ad.42.2026.10.16.05.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:48:10 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] power: supply: qcom_battmgr: fix the battery current sign on Kaanapali
Date: Fri, 16 Oct 2026 21:48:05 +0900
Message-ID: <20261016124806.1789-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kaanapali battery firmware reports the battery current with
discharge positive: on a Lenovo Legion Tab Y700 Gen 5 current_now reads
-9.1 A while charging and +0.57 A on battery. The power_supply ABI has
charging positive, and upower reports such a charging battery as
discharging.

Other firmware behind the same callback uses the ABI sign [1], so
negate the value only for qcom,kaanapali-pmic-glink.

Fixes: 16a7c32e586e ("power: supply: qcom_battmgr: Add support for Glymur and Kaanapali")
Link: https://lore.kernel.org/all/20260829054546.86210-1-jan.brummer@tabos.org/ [1]
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
I could only check this on one device, not on MTP or QRD firmware.
Anjelique, could you confirm the sign there?

Both patches apply before or after my two battmgr patches still under
review (USB_ADAP_TYPE v2 and the USB input current limit).

 drivers/power/supply/qcom_battmgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index a7237ba09be1..0d55458b2881 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -313,6 +313,7 @@ struct qcom_battmgr {
 	struct pmic_glink_client *client;
 
 	enum qcom_battmgr_variant variant;
+	bool current_inverted;
 
 	struct power_supply *ac_psy;
 	struct power_supply *bat_psy;
@@ -1435,6 +1436,8 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 			break;
 		case BATT_CURR_NOW:
 			battmgr->status.current_now = le32_to_cpu(resp->intval.value);
+			if (battmgr->current_inverted)
+				battmgr->status.current_now = -battmgr->status.current_now;
 			break;
 		case BATT_TEMP:
 			val = le32_to_cpu(resp->intval.value);
@@ -1659,6 +1662,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	else
 		battmgr->variant = QCOM_BATTMGR_SM8350;
 
+	battmgr->current_inverted = device_is_compatible(dev->parent,
+							 "qcom,kaanapali-pmic-glink");
+
 	ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,

base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.43.0

