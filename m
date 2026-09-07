Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB76342532
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790649; cv=none; b=c1bZlS4MRHJEzoSmzTzby/OfQyl6ljVGAmlvN9YQCEfYzJMWReTRME2tbVO4mBvBwwPGX0v8AmwtmXIu5SvyY2lm5J3kOTpAxmTbXoKApqyFPWHQLhGSjFsiYJlililIm1hCd/O3pYEZ4Ggcf70HLsev1+jBTc1+nrngqgbe3vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790649; c=relaxed/simple;
	bh=GZwA/MKtBxY3W7mT2sPBR1+zgdTlkURScZ02+uOP0RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rd3QZz/qYTctjTCqEgAq7yakmSeovUGwg6QPvPD6px4QWiG2h2svOehi95pj1qZ8EzuaEqyFwea/3TUcK5RkIFpktG2M1CWs2+9dxmKPh0QZiAyXjNJvy3Mm2OcPhMRORH4pNbzsy+qrKLm6SC9/sUm9yfGGfx398lPqOv7TE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osSy7y8g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osSy7y8g"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso14761555e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788790646; x=1789395446; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=;
        b=osSy7y8gmz/N7beGGn39hDQPSWY5+bFtyExIZpDXzkwBRDbbgcMA1Mwad0rF7HWYLb
         OxJ7plobHs/GQEQTFFKKHudnfN03Fj+Plc1HyXmbwPGSlXDucepsY9FBXxWZqQ7TxigU
         6jrrv39IVmOKjRW73DJZAoO3qVnwhbnysNFKYnYlyPYfqAp3C2/mGSoN511sqRyRKMNc
         Nm3/LlUNJuthqOqdjY/v1MR9uHvM93CGrnmk544iHrNb5vFkfjKg+TgfsVrYWejzhMMs
         +RWZWAhfFvq8/ws25bP0riJPEhJzQRMBnv5MlnOh3ggXoaveX3y1Qw4kBb0aMFDvlDWg
         cv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790646; x=1789395446;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vQtLGaBEb+xd41WLDmqvQf+F9Q3EMz9NEqhORQulUCo=;
        b=tHTD6qisxTqT5haPSEIYGdLXOi7L9uH4vWA7aZPD/XRqHbCP0OsmLUtji87cUtJJQP
         LvaIeisjE1GFUK/lTd0hsqzO40nS0ZNs6MBxGlQO/qUk34E8CkYqS6pgMbBWsvCqHpVk
         nFScuC5jEiwOGGhnDthNiYykxEQe/4pbjK6syvhm01j/cwnrDlXFknqvcJXsT3qX2HWs
         ArEsaLMkN9QCkQLA07pI1mfdS8ICDrOgGP7YAmhb6vyta1rB8jYoyZU25bqOYqduMFd3
         nfQAonbcQYrxCkXnfXOJbiMtVsKpo1y7REieomRxJf5BLVdpcCDCxnaka01Dnz4XBpKa
         gwHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8HBKTSDcqsevKraPqbxHo9gEDKT3GNv4sKF7L1JrUK+fO8Qnsw+flVCyPnw6Be73VKeoavRYECyNdsBM=@vger.kernel.org
X-Gm-Message-State: AFuF++kq+zZcHrE/31HhK4q694NKYfohOKIz4UxVCE3scmWz02of1WOO
	g9ygyXQJKL/biKxAw5K/oN/CLm2tgG8p1PuIiDFv+Tw6jjFdcMB0d5ue
X-Gm-Gg: AYBFou2UUS0p0rgldrX27ic1yR7LBwYGZca8mnW6T2ARQUqKnwdCLda/Y2RMNf8w1F0
	cw7PVwcotkL5JYdGx72GQuYdHWWmzwaEG3BMCCSxfkeM4iaWajbRKlwQ6YxjJAbGRKUuJ+klqUT
	gX9nbfHwVK6n2NfuFn7URMSNk3xgPSS1E33aHvrhtnOCJvWdL/NV3qHT4LyP98TZ4HGGzYjpZHb
	qGN4/txIMBmFe6xiJ1elw23uZgVdA21zqrLAVlINgs5i+LiNuaJ5+eBN7D85qSxpwTOP9laJmfF
	vWDOxNbpIH9nqd0kx+GOEh38LBVa2j2j0rgSdR2pLQ3iwAN1jK0QbJnuYrtY2s0c0TXuxU7RTIj
	XP01GzCvHaJOKm09QyM0O3JhGKUMNNRTuL3BznfeQkLccH4xtoOTNcBeitd9w7LLTjjuuuV+q5v
	URk1rrssNL89S5b/3w9UXXMvGla6MH+RH/obrnjfv22jm+7mTbMehHq3L/R2NnCXQbtQr4dj1rk
	p+DSRt9tV3jeqlJe6fIPepDhiOlBY/DJbHNqt0PsYM58tgiXuxZwIO2viQeeWmGQUYa9J+HFg==
X-Received: by 2002:a05:600c:1c29:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49d15f82becmr22689355e9.7.1788790645027;
        Mon, 07 Sep 2026 07:17:25 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm270473075e9.3.2026.09.07.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:17:24 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 16:17:20 +0200
Subject: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-B4-Tracking: v=1; b=H4sIAG/HnmoC/42NQQ7CIBBFr9LM2jGAUYwr72G6GGCwE7U1QEhN0
 7uLPYHL9/P/+wtkTsIZLt0CiatkmcYGZteBH2i8M0poDEaZk7JKI5VBmwd6eopLVFodKyWhsaC
 z56OKNsZgPTTBO3GUeZPf+saD5DKlz/ZV9S/9S1s1agwHDoHIxTa4NgsFnvd+ekG/rusX6bvm0
 8YAAAA=
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
selecting board-specific calibration data when the device identity alone
is ambiguous.

Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
device tree") implemented support for this property in the ath12k
driver.

WCN7850 can be used in systems where the PCI device ID and machine
compatible are identical across product variants, or across regions with
different regulations. For regulatory changes, the hardware description
does not change, but the vendor-provided calibration data can differ. In
that case neither the PCI identity nor the machine compatible can
identify the required data, so DT needs an explicit calibration variant.

The ath10k, ath11k and ath12k WSI bindings already allow this generic
property for the same class of board-data selection. Allow it for
WCN7850 PCIe devices as well.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Rebased
- Updated commit message
- Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd59988f..cf3e1fd99c12 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -54,6 +54,12 @@ properties:
   vddpcie1p8-supply:
     description: VDD_PCIE_1P8 supply regulator handle
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
 required:
   - compatible
   - reg

---
base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

