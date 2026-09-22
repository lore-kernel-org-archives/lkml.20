Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552E54B1B4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083086; cv=none; b=KgLecjuiklhYBL4NpBJJA4y1M8aJtN+FWG2EEDCt2YzawbjtW3I2p3LUxQ2e7JJJZCKdSIYpRK/VzreNr/Zg87GLLzoMLlRxH0s1Vxq3sz9rG0U6cj5MyQYidonl7LyQ/pBf6s2Qw4ky0dTHwUBz9wv+Cqe7ngcbnSLDcLmEKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083086; c=relaxed/simple;
	bh=K7BtVzN6po+S2COgmRkxMGzzT7rvJc80uqYEHixK68E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RdshfZ+NaMDP0r9l0CscA4+CkKjtGQLahg0BTkZQf42P3qjRHamHyGSuCmv3zJfIHwUO+fWM03m6jmJIeBRC1tpg92ge/5I/f3qE4BJBPFpzdsot+5IUBx6/anChpxGN3Uo0L5Kz288qjpynrl5ggTnJZo7eDqRe1ORVXeul7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyS6eb+1; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyS6eb+1"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2939b2e4caso43911066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083082; x=1790687882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Zjh9iTNK9ak9O81z1axMf4LnrFq9Uu6eTXFdZwaGIg=;
        b=gyS6eb+1LcYhkoFQeLA/NQFXX2bv2qzEXDBgi/6cfyNanOe0RNdLAOacCvfl0kgdzK
         CM16jTebOUV+y+VjFWdNUmp6kak2kYuSh6oo69LyzOiJtN026zdM7CjSdavjbwvxfgID
         f26Nc7Ih2PsmItpffGvxZ+4hhbvtC+eqSXG/ejnkBLhjb7HrEO913seqrIglaROJiFKD
         s6uvbkp/U2yzZmkugfnRJwhRg4ylabovz+K+wuV9ZxU2VyiF37rEq5G9FAVqWgDlmOz5
         JOxz3HGLbnnznz1+Zcmx7bplM7run+HhPNUbv2zQ/RY4yNqreIotq822yOqUKIiSZph1
         kNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083082; x=1790687882;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Zjh9iTNK9ak9O81z1axMf4LnrFq9Uu6eTXFdZwaGIg=;
        b=V1bf0z76SYtAfABZTIhlFbWydbJ2lVFKdR49EZ0HtCmk+Qd2HaFTh+1pVrl1uOOoH2
         c+JmxkH27F6NwXMomlYkh4tCZ/HGL6FSr0S5a1J6hxy7qh6siANajA5IcPlC2r9AO2e2
         EQzmcs0azomTRHkoeXA0aImeT+kSQnAV7kZl4pgpupcebrs0teF6m9bVs1wo3xWOwdzK
         Rm0ppfFUUWFt3A8SmYvC4/NxN1GxQZZHONd6nK8miLmrxo0I7dTYIFEke09Jm66kjuay
         +4ljYnuQjrwrcfKCrt3BQHyxS8ee93XTt6vJR1KOADexs9dH3WN0m3derxcLj8R1HuNq
         kjeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvgsIK+VaOCIWN/8cj6fmhBe1ojVb/10m60tRAfEH6TC+21gPEFN7mzKmGKjR2PP2FUh/Km1/1CNafL4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mKDvuRf99iafjrldvn312pddjXr+M0GApYMuH4MGc8+juLPl6U
	JYwCs/S+GwYZmdaFQtU4HA32dRzH6FLKd4+XZYJh2PPXp3Bpf7UWXmRcx5pPQA==
X-Gm-Gg: AYBFou0miQ3gTFgedwPf3IiytLmoO7vaMyA1+khDyNRcNpN/KUXOk5RM5y61/jr+N7C
	iR/0QSr2Bm+y06hWIreG4uK4eBnp4JBPrn8txIYfdA5wTJiZMdlYUJ1DGhyxaeWmgWGDKh8h7XH
	LXnrTEVyBCclYNitbhwphf7QTrZxoxNA0ZTIpHL6DOBEzxOn+dq1sXZCACrxFrq+vpVYWrg+xlc
	mv/kyCUWbRHH2Fa2DnT92JRcjrKI0Fs47CGvbW2RiCc7Ro6MfDVs386atsylmLMsmhGNJHPBz72
	noej9/YH62WZ54mDzJpSO5mpB+mAswh87TH9G1H9gBmHN+uPDd+ZB0vqFbHGkAj2hLm5qghvWDw
	R8PQH+Gpak2xsLJ1i2STHlTHCoLrMx5gqcIU3wnDkfXQEtEX1WBgOEd8MExQrbHXCzH54oYdcRl
	Ui7trHxOFunYhM5jaqJKe5iXDC44RfNUGNGex0ds1b4BXAtRRF1FFI/pP9R+8c30BOk5jbiKooj
	eyPlPzD0Ec9hjoxLsbYghNWel4bKDQaNWJYN8x776u3bXNnWgcXNQ==
X-Received: by 2002:a17:907:970c:b0:c29:4634:5c8f with SMTP id a640c23a62f3a-c2a1a450003mr1298250866b.0.1790083082411;
        Tue, 22 Sep 2026 06:18:02 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c62d4b4sm83416066b.57.2026.09.22.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:18:02 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tomasz.pakula.oficjalny@gmail.com
Subject: [PATCH] HID: universal-pidff: Add support for Turtle Beach VelocityOne Race
Date: Tue, 22 Sep 2026 15:17:58 +0200
Message-ID: <20260922131758.1242755-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add usb VID and device PID to hid-ids.h

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-ids.h             | 3 +++
 drivers/hid/hid-universal-pidff.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b3aca5aa9176..52b25d76cc2a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1504,6 +1504,9 @@
 #define USB_DEVICE_ID_ASUS_MD_5110	0x5110
 #define USB_DEVICE_ID_TURBOX_TOUCHSCREEN_MOSART	0x7100
 
+#define USB_VENDOR_ID_TURTLE_BEACH	0x10f5
+#define USB_DEVICE_ID_TB_VELOCITYONE_RACE	0x7077
+
 #define USB_VENDOR_ID_TWINHAN		0x6253
 #define USB_DEVICE_ID_TWINHAN_IR_REMOTE	0x0100
 
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 60180467a0bf..f1854cfe42d0 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -187,6 +187,7 @@ static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_FORTE) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_LA_PRIMA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_TONY_KANAAN) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TURTLE_BEACH, USB_DEVICE_ID_TB_VELOCITYONE_RACE)},
 	{}
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
-- 
2.55.0

