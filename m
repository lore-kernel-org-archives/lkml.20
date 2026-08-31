Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A723E3152
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170380; cv=none; b=sw0lhkAT907G45K3qHRTocJ0Q5+MpECH0JDsaJ4Pv63Ljb6mff+5ZRSMGlIY+hyDYNdwXYVM+YdRZH6jWG+KFei5MBTsHiLzQ/m20MJNECYGGLfB3jccd9dqDsY7LoQxisXqW8Zb2H9hcakZ2Y9tgsrN5WxjnngRbt8pOLshge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170380; c=relaxed/simple;
	bh=8oIoq3/BxEm7Bcl0GQ8KUIZQgDk0bEzaSgG154+Dchg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GD4YkgSXgTOwiDM/cJOKg4BUi9kHRH3Fh3nAPNFOLrR9ncQchx9vGWXA05iY3SdPiHKm0auqlLAGSxM8ba//2Pt/J41h8t4UUt/t85MGj/9rDNKaKVoAGmepvmrRqdR3JhudDWCC+jPI57xfF3itz/CuhKwXrJVomSlX+jQuJ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWrVi+6i; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWrVi+6i"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d7195706f1so31674385ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170379; x=1788775179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31EY+ggiKNRoWg2rQDHXLSRikiCKuhKgERxrI2qpU+M=;
        b=OWrVi+6iXR47cNS6+VM3OlpgOUkXSHfpL0LxGCxDx827Ets3+Nx+Gj/694y/mTrA/Y
         oz5t4WCnWdDAUriwRym7yvC8K3pzwO2uQmPZlJFXa2CAfG69q7RspsPstfz9d1M95pTJ
         OJKQNSmTNhQWJ2ZQ124OeX+iFJbKtapca8C/BZiWcPh7PjWtQt3HWWQB4qcqxL3xxExs
         STcMWzC4N8ob5Ucb17XkxgdZajW06/m3pFnltTLooyys/xLpBBUFXtgPY/o1B3Af72r/
         SDHB8+32rrUAZS8kzpgrHjRu/gZdbOgL9/Nz1t85N7STxLMXtiFrR0i5sy7c+jNuyUP2
         2dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170379; x=1788775179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=31EY+ggiKNRoWg2rQDHXLSRikiCKuhKgERxrI2qpU+M=;
        b=AiuG6Ta9Bb9AiTjlV+OCZmvpuKcukD/1h3eTnt+6kOjiunrSWSXGXcxEW1zunEXij7
         3iYxGeUk03FtivXSDs2sccYvfwKvPnzdMU1JN/pNxgdcZvyf6PeBxprEL/CcMY62Xiuu
         13ac/VqLMHKHwFYp8xVwt2ibkYuvsWkgC+6hWm1NszuIpEE37vdSlIP8foLtCwWYp7EQ
         XX7rr4jVUfRiTTTE3UhZsXXf7Lr9OvIAr8aUjmqlmLciOYpf5ngSODP/CDYGOUIk17uC
         ZO+J0iUGEb/Zlf8wWcPljKFN/DTNcJlpIbOTxnWv+7M6HLu3YUqnZhWJRap2IR4zXUhS
         1odA==
X-Forwarded-Encrypted: i=1; AHgh+RrAcsvcMr5dKNYN+IOBF2rsvZk6jORkz08vqyW2Qb1k3mKklla+eB8rtZL1yURycesm3qRuqPEYGW2FtkU=@vger.kernel.org
X-Gm-Message-State: AFuF++mTsawWxjdg+PTuMd8sbuJidniNH4WaRnHxaSyL76wpkDoKUKB1
	fmv2B1SE4wumY0fg/PHcBLrkc4EGqMrxNT898pXFZzRcMFQ05HDSjgtg
X-Gm-Gg: AYBFou2gARcZXOhUMIbND1K/rL9eCRzEeM5SAXMIb9gEH3G+ttvghowuoXu8BVmRc1S
	tGfHff7Uf+5gNDINvVe8iUEvCiDqq9T9ENWv17uBQKbB+hYxSk21X2punhzZQ5v7kuu/Jdp0P/s
	fVNMMML8GitSbo7jrmRQTqzxZ5lDHObLt9CqXs0gmY9SNqALCAOLXAncKljcWPMDnnUecfcHcyT
	a1iHcYwEGjH5IYIT6jTGak+on0d5T4IgcpmSu4mmHbI6n5UNVjfM5Y7DBxSU3fN5TPB2N/ssID5
	akUDMdrIFiUfVTA6b751OO0olZo9Nrzk4YA6odXA7h4NhXXLoGdpvEFntV9D1h26qqb/0rzTW5X
	rzDdMdy0pnrvbEDW94DMEKHJLON2KWhMN4kiefA9DOpiCu0AHtdsAS/e3JFXmEaJwyUg6xAFh3u
	vVUnPxAAOSyUFSfOaCVFom1jD2Vp9Xg9bElV3gF3FP0feLEwOq7TjekxpVVaoSWystEZ4yieWWp
	XiJNYGQ3QZzI43d7R30XWhGRxMUOziC+xIzpzmZRk1KtH3uRGZ7pWmdq1cPCqWgELopEvqVBrpV
	+3qu30BBM5kYW9ZIdUdTFdKtdxrCnq3GLIArdqtEkSGcp17bP1RPJ3XYE9RbPd4kOIkcXxsGYto
	gmmZBzJLTyud9l/T94pVOv5FBo/FWm8iUl4jl8JKYdlh0dN0=
X-Received: by 2002:a17:902:d2cb:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d93f9f7c7fmr28821375ad.10.1788170378759;
        Mon, 31 Aug 2026 02:59:38 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759640becsm32270775ad.36.2026.08.31.02.59.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 02:59:38 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	ali@iusegentoo.com,
	kiraank@gmail.com,
	kiran.k@intel.com,
	ravishankar.srivatsa@intel.com,
	amit.k.bag@intel.com,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Subject: [PATCH v3 1/3] Bluetooth: btintel: validate version TLV value lengths
Date: Mon, 31 Aug 2026 15:44:21 +0545
Message-ID: <20260831095923.18830-2-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260831095923.18830-1-acharyalaxman8848@gmail.com>
References: <20260814171503.42684-1-acharyalaxman8848@gmail.com>
 <20260831095923.18830-1-acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btintel_parse_version_tlv() verifies that a complete TLV is present in
the response, but it does not ensure that the value is long enough for
the specific TLV type. A short value can therefore cause an
out-of-bounds read through get_unaligned_le16(), get_unaligned_le32(),
or memcpy().

Reject values shorter than the minimum required by each known TLV type.
Also reject responses that do not contain the Command Complete Status
field.

Fixes: 57375beef71a ("Bluetooth: btintel: Add infrastructure to read controller information")
Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/bluetooth/btintel.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index cbeb27033..998c99b17 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -573,12 +573,44 @@ int btintel_version_info_tlv(struct hci_dev *hdev,
 }
 EXPORT_SYMBOL_GPL(btintel_version_info_tlv);
 
+static u8 btintel_version_tlv_min_len(u8 type)
+{
+	switch (type) {
+	case INTEL_TLV_CNVI_TOP:
+	case INTEL_TLV_CNVR_TOP:
+	case INTEL_TLV_CNVI_BT:
+	case INTEL_TLV_CNVR_BT:
+	case INTEL_TLV_BUILD_NUM:
+	case INTEL_TLV_GIT_SHA1:
+		return sizeof(u32);
+	case INTEL_TLV_DEV_REV_ID:
+	case INTEL_TLV_TIME_STAMP:
+		return sizeof(u16);
+	case INTEL_TLV_IMAGE_TYPE:
+	case INTEL_TLV_BUILD_TYPE:
+	case INTEL_TLV_SECURE_BOOT:
+	case INTEL_TLV_OTP_LOCK:
+	case INTEL_TLV_API_LOCK:
+	case INTEL_TLV_DEBUG_LOCK:
+	case INTEL_TLV_LIMITED_CCE:
+	case INTEL_TLV_SBE_TYPE:
+		return sizeof(u8);
+	case INTEL_TLV_MIN_FW:
+		return 3;
+	case INTEL_TLV_OTP_BDADDR:
+		return sizeof(bdaddr_t);
+	default:
+		return 0;
+	}
+}
+
 int btintel_parse_version_tlv(struct hci_dev *hdev,
 			      struct intel_version_tlv *version,
 			      struct sk_buff *skb)
 {
 	/* Consume Command Complete Status field */
-	skb_pull(skb, 1);
+	if (!skb_pull(skb, 1))
+		return -EINVAL;
 
 	/* Event parameters contain multiple TLVs. Read each of them
 	 * and only keep the required data. Also, it use existing legacy
@@ -598,6 +630,9 @@ int btintel_parse_version_tlv(struct hci_dev *hdev,
 		if (skb->len < tlv->len + sizeof(*tlv))
 			return -EINVAL;
 
+		if (tlv->len < btintel_version_tlv_min_len(tlv->type))
+			return -EINVAL;
+
 		switch (tlv->type) {
 		case INTEL_TLV_CNVI_TOP:
 			version->cnvi_top = get_unaligned_le32(tlv->val);
-- 
2.51.2

