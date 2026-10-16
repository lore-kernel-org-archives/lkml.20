Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BC396D1C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116922; cv=none; b=fJyWBusylkhM8SRJebVsDMFlExZRSKbFZ8FBp85Do0cgwSF1WobCmfFZsF3M8oFncj4Tn6+RXwBCUzaoMlKTtTx0wzcf9yil7bbyjZTzi7+eJiN4ZTiAp+9VQyZoja8jhILAKFYR+eIh3WFq/jICOKfNyZL+fgywyLr6I43Nd7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116922; c=relaxed/simple;
	bh=brkVOHrBWqwYBSh4vVHXBq8X4XZ3NU20+5+9rKzi3Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BG2345OrAZmRMODdIpUiPup9AwvpqZdID5l250J3ty0VlD1mMb0Tj/O3eu5KzwWGQmuT2/oI6Fj+CmUNT7FSFcCpwdR1hTbl7pIUyS281bX/Qr4ackJxIA3hocnznpQu2NHExtS9NmD4HwpUUMq4MEo2AM32hnEQjqfKG5AnEa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=NnWgu7OE; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="NnWgu7OE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so708862eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792116920; x=1792721720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KetdpdwOSj7956r3ldfd9Rrxy2aA2uCf7cxzgWAH5cU=;
        b=NnWgu7OEV2E1Li20PRkbqSPkcWep5xv8fI1MW5pahOubHJrxUUKwrPcQV/MbT302zr
         F7uYl9USPUhCLbf0MBWIpVsAn0dl3QbqbKlfJusqdFFPNZYr92Tm3uGDtHGqWUQwweF6
         PjThNApX0ZJ3jkcrd1G0/v22Z2YQbUneG2E9u6yyNlh+1NpgClOkWISzAMcUDMUCo1vU
         D1HfnM3rhJCHtV2gShd0tSpijkpv/zJ3FMu9fvS8vLnTg6DELXoJSLCxxZ6tHBAw8ynm
         XnevBa8g2LBVv9jDq3D/YA/OcXJhL/6Q8Ba2jyuPE8dyYDLxsk6eJCIu70nf0wQUGZGS
         li9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116920; x=1792721720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KetdpdwOSj7956r3ldfd9Rrxy2aA2uCf7cxzgWAH5cU=;
        b=af5GZ6yJqT6vmvKQWARdkzW3Se4MGMgdW4L2cVQmXMBdAjIw9kDPa6TRYBHVGk+OV8
         5Zs6hoazREK8UjnhJpfyvFBcs6RlqDE+G+BbH5GLNHFYMVoXoZ+7TftOdsGmI4Ln1sji
         K53pTsSxYaMfS2vCfGUVnNGafXP0dL/yjEUWysYI/H3uMatxoMm4TZSfaBR8WZdxjt/f
         NauUQmuih5Q3mPzJSpffXuT6wGvezpdCplMzk/OmuywjXq2t78iWwgoXYOLtqs8zSisb
         no1mTJ8tq7uaRLU/v3XMIKZyFyK40H0ynCburlSzpRXEAAmNjH3v+xFoezY8WyjlRbOe
         XG+Q==
X-Forwarded-Encrypted: i=1; AKwUvByi4/FhMxxAvNjnNYSL42vcp11BSUO5r3WYLOZhrSihfOxWZNKrrdx+05PLhaUlP+gh1fNvo4HMZdxfgVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKydoznDjpM8CKYc9jN+Z+bGxRc95Mq9Gtaj3Dc3H18AKYf6aqz
	JnpZv3UgNs/dxEYd9Q5KY6Le+iOD9SYDsytBxX8QAfCVMnHtuma9ghMJt5de4PQhbYJ6nIEMmov
	kWOSbUDNBTA==
X-Gm-Gg: AYBFou2BbaYHszcixZTv7C/HRGV4OWhnzfP4K5UYOMJ5viT/Cu3eUDW3Vwg53ib6SWR
	GzJxCBp5KkuhoN+hv3d3Kt+rpQJtKX5kaXAUGTHUBnxLjUPSEOCS5+zzUSnWoYOUgxM90JRoPcJ
	7w8JUr7foZ7oejoKS7yOwaWDst5a6N0LrmTD7utz6e64TVPpDy1QtklOM0UnUd+kkHcql+SD3R3
	zvKZAXguLRLHbGo5vHbAYzm7dtP2RIPLXpob1l92D7oBHDSBNILRofkECzTfI1jSwtXTf8G26jZ
	PTuQcxhZbEl8pEVNhhJNYUlGZtFZWCwcQ+wUd9hrKxjxu0leUCH/Gidnvf+h93AL64+4DsyPFsT
	yfSvGTWL/EE6qzzSSxKswqbiC726UiA2yhGXYMaj46Gx2JdXDznmplsQrga9SOCSuQuHzHtZGp2
	CexewNo6TfPQ7XJu3PsFuIZaC4aGOVcPr/+mGw1Wg0oJji8+hr52+86asR/g9ZwCfIA9WetWVRl
	e8Qso+yaeuEpyR/aVznoUu5HUWjpTD0qv1RfGjtq43wo1iovnRAGy29uH639Qf8S9ti5Q==
X-Received: by 2002:a05:7300:fb17:b0:341:c383:9afb with SMTP id 5a478bee46e88-3602ef82f4emr2267276eec.20.1792116920170;
        Thu, 15 Oct 2026 19:15:20 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d66:d0e8:dae3:3257])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm2221123eec.2.2026.10.15.19.15.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 19:15:19 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com,
	luiz.von.dentz@intel.com,
	marcel@holtmann.org
Subject: [PATCH 6.6.y] Bluetooth: eir: Fix possible crashes on eir_create_adv_data
Date: Thu, 15 Oct 2026 22:15:17 -0400
Message-ID: <20261016021517.16686-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

[ Upstream commit 47c03902269aff377f959dc3fd94a9733aa31d6e ]

eir_create_adv_data may attempt to add EIR_FLAGS and EIR_TX_POWER
without checking if that would fit.

Link: https://github.com/bluez/bluez/issues/1117#issuecomment-2958244066
Fixes: 01ce70b0a274 ("Bluetooth: eir: Move EIR/Adv Data functions to its own file")
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Assisted-by: LLM
[ Backport to 6.6.y: The extended advertising PDU is stack allocated here,
  rather than addressed through pdu->data. Pass pdu.data and
  sizeof(pdu.data), the actual HCI_MAX_EXT_AD_LENGTH capacity, so all
  optional advertising additions remain bounded by their caller buffer. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2025-38303 to 6.6.y.

The code changes follow upstream, except the extended advertising call
uses its stack buffer and sizeof(pdu.data); see the backport note.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 net/bluetooth/eir.c      |    7 ++++---
 net/bluetooth/eir.h      |    2 +-
 net/bluetooth/hci_sync.c |    5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/eir.c b/net/bluetooth/eir.c
index 7a28baa2b71feccc8bd7ff3f1d45b6b1f39984f7..2f695f1c69b36b129d9e52ed1453c91f3e2662b0 100644
--- a/net/bluetooth/eir.c
+++ b/net/bluetooth/eir.c
@@ -242,7 +242,7 @@ u8 eir_create_per_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr)
 	return ad_len;
 }
 
-u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr)
+u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 size)
 {
 	struct adv_info *adv = NULL;
 	u8 ad_len = 0, flags = 0;
@@ -286,7 +286,7 @@ u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr)
 		/* If flags would still be empty, then there is no need to
 		 * include the "Flags" AD field".
 		 */
-		if (flags) {
+		if (flags && (ad_len + eir_precalc_len(1) <= size)) {
 			ptr[0] = 0x02;
 			ptr[1] = EIR_FLAGS;
 			ptr[2] = flags;
@@ -316,7 +316,8 @@ skip_flags:
 		}
 
 		/* Provide Tx Power only if we can provide a valid value for it */
-		if (adv_tx_power != HCI_TX_POWER_INVALID) {
+		if (adv_tx_power != HCI_TX_POWER_INVALID &&
+		    (ad_len + eir_precalc_len(1) <= size)) {
 			ptr[0] = 0x02;
 			ptr[1] = EIR_TX_POWER;
 			ptr[2] = (u8)adv_tx_power;
diff --git a/net/bluetooth/eir.h b/net/bluetooth/eir.h
index 0df19f2f4af94499defe78897e8c78fd0dbc2daf..4497f8fd5fefb5eed4d70477fb0fdf9feebe7fe4 100644
--- a/net/bluetooth/eir.h
+++ b/net/bluetooth/eir.h
@@ -9,7 +9,7 @@
 
 void eir_create(struct hci_dev *hdev, u8 *data);
 
-u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr);
+u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr, u8 size);
 u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr);
 u8 eir_create_per_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr);
 
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 607667cc357558ffefa812e1cf001ca923fdbf78..e73b4021dc6505924d6befaf667dadcaca6f0526 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -1334,7 +1334,8 @@ static int hci_set_ext_adv_data_sync(struct hci_dev *hdev, u8 instance)
 		}
 	}
 
-	len = eir_create_adv_data(hdev, instance, pdu.data);
+	len = eir_create_adv_data(hdev, instance, pdu.data,
+				  sizeof(pdu.data));
 
 	pdu.cp.length = len;
 	pdu.cp.handle = instance;
@@ -1376,7 +1377,7 @@ static int hci_set_adv_data_sync(struct hci_dev *hdev, u8 instance)
 
 	memset(&cp, 0, sizeof(cp));
 
-	len = eir_create_adv_data(hdev, instance, cp.data);
+	len = eir_create_adv_data(hdev, instance, cp.data, sizeof(cp.data));
 
 	/* There's nothing to do if the data hasn't changed */
 	if (hdev->adv_data_len == len &&
