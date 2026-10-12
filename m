Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D03043CF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810062; cv=none; b=XjF2VTYfuPufz9eSHiwnJehaD5s/dIG8uGEOV6NGZjmW4WU0u9FAabS1mg3F5WMrFAed0JQrXvWb2qTO5LjTwoQy9oyHjVYh8dNPGJpmEO2DlRtwFKwi/n4X+5JR8YE+D1G/QfuL+nkbMj73KlmPQ+AA1nAu2Xorr/70mEyShIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810062; c=relaxed/simple;
	bh=+4zUTyq3J6D0WJWX/Ui2UZzNSTwF6xlek6vWAXjql6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+mGi4G+EC1FFSmxl88NWmb29H6K7NEWkaJM/erSCCzfMVzkoTSNroPi0HuOL1lqY6eeiZdoeCbEu9ZLfgXROhAk++owq2ag/TfOxCPL/UuGXL6plIsmLGCH10lUnn0JNtZsek9l0PR+pcIFfiaPZJveLWpNoJHI8+jwW1suGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkBG6TnH; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkBG6TnH"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso657825a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810058; x=1792414858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgN5EQTZPAe/8W26fAOdp25QZc56hSLNje2myOYBavI=;
        b=pkBG6TnHdrgGU7ztcFV75AZ28hr2eW0Xohdtxbprzdrs77tVL2CUe4qzfHMBGS7Uk9
         2/bby8kQwt4V+a3Dq4eJpJK7rA4uC1bPusqA7SSCr1SHLfDgtM9/d72rEliaNb10VAw1
         Q7aiigyxR4+Kfjrw8WLs3Nkb/bBFrzadGhY/crzsxklkczhi7e9jSgz03YfAce5MB3pP
         yYYEf3nvqSGcbvseaGowlJYJFCWrKfZhBTZWPi4Z2IDRGQtapDDeXsQ8y6aDdmINKlRz
         MPQe1X9jOcQQ8V1v6+WhQ55TJmDVg+lntdbg3TlkClTLEJDlLd4c4eKQUHm0syjrXvpT
         ICog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810058; x=1792414858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgN5EQTZPAe/8W26fAOdp25QZc56hSLNje2myOYBavI=;
        b=sULkWzYi5sM4txPbfAe5YaBSSzV5/R+01wFOTAAoVhO2IqYgeXPF2pKs+pvqpBJzt/
         QJnzL31pnJvFQ2O18KvXIpdELwG/H7Sb73sfrgQFyXGEzfh3R7OAlZTs1gA2NHGLOmHF
         SVg7ChcAv0agPWy3ci/dZwW041egI926/h5oSrVIBPK7x6T0ik7g5sdk/pk2Q/8TBTD7
         RJ5xJLdWF7jZVInHksXOZY+zNd4l9Sk4P/nUFdHD5yK5ggyKJxMr8SNXbz1HZpk974Me
         uRBNzq9dAxIW+I5zuf5No4iue6CeRMSR8iuNzLOvKz1jS4fwlaRE8oJ8rnh9R/avxSLF
         3AOA==
X-Forwarded-Encrypted: i=1; AKwUvBwQpN1yIXIA0iTUyFdFlCAQS+h0UrXcMTUOhhJvFuvtvGYa1QrT71VcdIbFrY76jooGeLEv9ye4Pw6MT8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM1aHfC6PDWhq46hozUx4+kKrnkl9McCSDUxjAbhIRKSwR6/J0
	qYy5AWsPus/ht9C+ashKmyBcROpKI5buPotX8KClXIGGYaEIdp7k+LzT
X-Gm-Gg: AYBFou1jWResCxo69U1HkNPDZl0Ryvk0myFnbRIOXf+PrKvh5Iz+uRoilzRacBV+PuQ
	rR4BrUDFKYSEo+DoIBeaEpBKqL0zJU/WVv87ygexg+mlWrRbIadXZ4TLe2beQuYhKfdRzZtw+ah
	MGe3U0gaIj4q1HRuDhrSPAGwZJOQbpk6zc4ugJgUFc3kdWSmpB+cbZQMihShIHnsy6GjammcgLA
	w6ppOa6S4lv+/KSEuojEDry26LFhwyE64II3PY55iPMkPGtDkp6WgEBy+hJxuYbTVjd3KXz/FyJ
	B5wtRLjlgTOWhYWX7fXSxYnOb+FUa+5hXWUeR8WZWqTpA0q8nyRrZMFoaKQPY7aU4z2KiUecuvP
	oRGTyREE7fiNO18d3Hf8FgKzZhc1OGIsnrvc3hOfnRasrZ+sHuqt4Az5arjYj8mzlVOiSsU9FYc
	wxgOVDMJ8FpZMXXXz/Bt4ZZRa6CgbB41py2nGDELSe+EGJkB6duRBvOXIbitkQIEMd9El6JEqWh
	3qf/KdHXwdGNw==
X-Received: by 2002:a17:90a:d2ce:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-3ab3a364f7emr7429624a91.5.1791810058210;
        Mon, 12 Oct 2026 06:00:58 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm19295887a91.11.2026.10.12.06.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:00:55 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] power: supply: qcom_battmgr: report the USB type from USB_ADAP_TYPE
Date: Mon, 12 Oct 2026 22:00:53 +0900
Message-ID: <20261012130053.442-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SM8350 and SM8550 class firmware the USB power supply reads its
usb_type from the USB_TYPE property. On a Kaanapali (SM8850) tablet that
property is 1 (SDP) whatever is plugged in, while USB_ADAP_TYPE reports
the adapter, using the same numbering as POWER_SUPPLY_USB_TYPE_*:

  PC port                  USB_TYPE 1   USB_ADAP_TYPE 1 (SDP)
  USB-C dock, 5 V PD       USB_TYPE 1   USB_ADAP_TYPE 6 (PD)
  65 W PPS charger         USB_TYPE 1   USB_ADAP_TYPE 8 (PD_PPS)

Qualcomm's downstream qti_battery_charger driver also maps
USB_ADAP_TYPE to POWER_SUPPLY_PROP_USB_TYPE.

Request USB_ADAP_TYPE for POWER_SUPPLY_PROP_USB_TYPE instead.

Tested on a Lenovo Legion Tab Y700 gen 5 (qcom,kaanapali-pmic-glink,
which uses the SM8550 path). Only tested on this device; the SM8350
variant shares the property map and was not tested.

Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
Reviewed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2: add Fixes tag, collect Kamal's Reviewed-by
v1: https://lore.kernel.org/all/20261007123932.1664-1-26rote@gmail.com/

 drivers/power/supply/qcom_battmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 7716eb9e1aff..b24860d2ded2 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -975,7 +975,7 @@ static const u8 sm8350_usb_prop_map[] = {
 	[POWER_SUPPLY_PROP_CURRENT_NOW] = USB_CURR_NOW,
 	[POWER_SUPPLY_PROP_CURRENT_MAX] = USB_CURR_MAX,
 	[POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT] = USB_INPUT_CURR_LIMIT,
-	[POWER_SUPPLY_PROP_USB_TYPE] = USB_TYPE,
+	[POWER_SUPPLY_PROP_USB_TYPE] = USB_ADAP_TYPE,
 };
 
 static int qcom_battmgr_usb_sm8350_update(struct qcom_battmgr *battmgr,
@@ -1513,7 +1513,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 		case USB_INPUT_CURR_LIMIT:
 			battmgr->usb.current_limit = le32_to_cpu(resp->intval.value);
 			break;
-		case USB_TYPE:
+		case USB_ADAP_TYPE:
 			battmgr->usb.usb_type = le32_to_cpu(resp->intval.value);
 			break;
 		default:
-- 
2.43.0

