Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999A495ADC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376788; cv=none; b=IElTQOXffFqiRrPaJwppBoWsrE9ZIS0ILwsrPwfk3PyhUJ/tXxXGGK7J8H7tjv7sSf5rrAVeb5SlJx4ErT7Xb9EnMuhx8Az43kWnXueDl799x1RRd7d7NjrRJnY3EaX4EKXT+No2QLlV9aryweBuzQW5J3ckOY3TwtdtDAS25Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376788; c=relaxed/simple;
	bh=mom8r0YS0EZhzz/orKBr4e9/5hrJpBPsv9fITv6YHR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfpWPosoSWLoB0XHjdAwstAqdNazqr6gc2TBWPrD9TIXcRnGe6rTBk6VXXhaY2kP8G66yVfMtVGQr0VFIyoqDAsbUtAe/4NIeZRzrJo+0pK6KF7m8/ofLVTvVissdd18yHYjecipB4ohmEmyHz8VLrRwOrlfhFdEa7SNiEk5fyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xp7on0Fc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xp7on0Fc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1675926a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376779; x=1791981579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=msUPTm3NaUqy6JLWAJkoOm4SH9dcLxgJqgFDMGXq3zA=;
        b=Xp7on0FcKNw1IPPUjIZmCxcZ/oQbGD171oeWbzCy5AeeTciulQ4u39YKiNkY0yZNyl
         7y2326gWKaxWxi7LjgP+gfyHgHeEWatvok6Sa6n7o2nBhuHXA4Bx4LmLoEjD/vq0k1bp
         4flGUwh6nAOCbvAiQJ2vOUdWl9jqMytrHF59QmejdYmyw2uuLq81lmkq15jpmsPilolr
         focjbpbr8+cJO12iHp/7zckZjOADd36gZ2f8gz+Ej67Ffwk0U9uhkmlrA/Mi9zSge2md
         4kTOHPExeneRpRbqrI21UTWQnLw29x9SYJJiIVleKKjfqEylvLTHGlulVTWkwlhxabH+
         3R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376779; x=1791981579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msUPTm3NaUqy6JLWAJkoOm4SH9dcLxgJqgFDMGXq3zA=;
        b=DAQ14vOGiR+4K31/ZO6hipCahuol1PBOvHdp8LeWzhDHuwDvepYwUFb4fw6fnq4r0S
         AY3qkzWmaBiUfGwvJtCvpzbU6a6y1hr0kRDY3d47N3E4D0lxG94BCmieInoxJhXZxOej
         mk9yVmzbZ/vBVrRJhhFezDV4UI3xkmiu4g/w9qbqA0zjmOZ35WTdmbasQ+pJG2BEjkXa
         ZqhgLY6DJjkq/YP3OzdTZDsGyVfCnrgaB9IdBBiRbbl0P6ecdBLWY28ijE6he7Lmy/13
         msLQepTJwgH1poi4pB8tO9G3jPOTc47YynZF7T9ScmEfg39AXLfhnaaFtgN6C+N85U0o
         9RXA==
X-Forwarded-Encrypted: i=1; AKwUvBw6KubxvDsEP3ljqgzr1z/AqZNBTi+o+1e4qGIWBRn501B9XAei2+GFD9p/7THC4EFWkniJVoByeD3yYbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdkTF/oDUG4lcmNZwYPoqi5dHCjprMOyLzLoRHuZwRifE8dbxJ
	an8XLQbjrGJm4Lojh00e6rQboI+eWR3fG3hiT5jnTrjPxacKa28d5QyL
X-Gm-Gg: AYBFou2+cBhLCRpK49xSQJGCgI3eCqJDNUiIiz0aSRKpT/URf8sSIEvgQpbqJmFLt73
	d1I1gjbBz9r7RVDtrmJQufkE1Qb0Sq/QnzFADXV+Ud6xFOYFqZdx9Azxc9pnmaq60jkL6ynizHa
	QCuG4Y1mBMyNUZOISY3z/TMONu/YkOxDcqINPX8LOmcOOvelEOvcbAO1OB0f2vWh2bHSSKDzGhN
	bWrK4Vv8kAxPgi5meiKjvFzXIPmyKqXMK5WmzDJ/l1ocOqWBcBmXyw95qXqtcQnwjx+tMsJD5l3
	g3HtY7GSgpuZwrO2DgoUMqgLe/U6ZtQn4AtZCwg4Gs9Wrv4h/PfzqQr+vkDrsNC0iae7noMyIFw
	3VpSsI1Q4GmHZ5YMuegnMfdBHYVLe2n3pRbaDS4dnyPbNL3vl8V4MbyLE8x/tM2YE6ZH4pVTqRr
	LeKJevNqyPfdNajJ3yW0DewKNI9LmswE2ojtWTZYPMtUv91+OVFC6C8qby8VgIyBtOUDs0AP+9p
	GOYwr7lOG+KXw==
X-Received: by 2002:a17:90b:2b44:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3a8a16b38ecmr1293196a91.43.1791376778598;
        Wed, 07 Oct 2026 05:39:38 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm9767564a91.12.2026.10.07.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:39:37 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: supply: qcom_battmgr: report the USB type from USB_ADAP_TYPE
Date: Wed,  7 Oct 2026 21:39:32 +0900
Message-ID: <20261007123932.1664-1-26rote@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The downstream qti_battery_charger in SM8350, SM8450, SM8550, SM8650 and
SM7635 vendor kernels uses the same property ids, maps USB_ADAP_TYPE to
POWER_SUPPLY_PROP_USB_TYPE and reads it on every USB change, so the
firmware of this family should implement it. Like downstream, values
outside the enum (QC chargers, 0x80 and up there) are passed through.

Not tested with a plain DCP or a QC charger. Once, when the USB gadget
did not connect to the PC after plugging, USB_ADAP_TYPE read 4 (ACA)
until the cable was plugged again; when the gadget connects, the PC
port reads 1 (SDP).

Kamal Wadhwa's multi-port series makes the same switch for X1E80100
(a new x1e80100_usb_prop_map) [1]; this patch is for the shared SM8350/
SM8550 map, which that series leaves on USB_TYPE.

[1] https://lore.kernel.org/all/20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com/

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

