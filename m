Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB3545FFAB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747766; cv=none; b=B4W4woEqMS5OMXQpDWlxQCdN6lsqd1btcEkxWZEx0ZZIyE7MAKwQSHZIMNgQFOtvkc4md4t+JGdEo08piDemHBshAIwKkkBrfdpa0PB2hWpZh5TlMMqVAlg8fkalBGYMJ+lMwH+4/44HgrSoun94PelAMfioILjbAgZ45KQk5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747766; c=relaxed/simple;
	bh=duwhY6Tg9tFTL1XOXarBBsKmWEqDi2jVDN3dH3CmJ4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmkYtf6sE+ha1iwVdNonH5I84/0GxOqF3WorbZAk2TC+sjQJE3PPRrMVz/JDbaP86D4yLaK9i6JOcOs7DD2hhtYonND18cRdR5SPAYQTKVppGnnfe1zL94XeZ9/abgoZZDn0+7thtMkFlPxV007t0WWLLqpy+sV/cHfgLPeWSv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h50CcZEV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h50CcZEV"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso166734066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791747760; x=1792352560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P57ESlsV9SvC7jAyaXBqTiZZ0EEN4K1kw22rWzkVaQw=;
        b=h50CcZEVKgMXP+VS13OBpeU9Qm+RLcRIl957khv4EIB90D/wHkS3s23xF6jwkK/gOr
         nu8PZbvUu8eHVE/u3Jzww8RN2G0GTDREMEamlkoPW+2Cfm9V2JlGIVTU3eBYiAB9c4rS
         V8qnLW2I2wy/7gZQhoB6RP3MClVrQ/tauQlx8poQbxfNkXYAVJHmc8fNwGRrQt5tXhTf
         XcDNRViDF4fvuZfT9tPR9nIHtiP1hBQ8Et2AvcfxiSOGc3PznsoIzO65fIPXpV6msB8M
         c8Ok3O55SpKc0/sFZfDPug60j6bvzaz+6l4fWLcZnIKDiwLGYZQZUNP5PV9xlOts8G2z
         DPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791747760; x=1792352560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P57ESlsV9SvC7jAyaXBqTiZZ0EEN4K1kw22rWzkVaQw=;
        b=iCaN4ZMs0LNRj//FWzd1obc9G79ELlTkucRxb3ZeZwkZWrOrjdANsY/LMuTAk0RSgb
         vAZbyewjhv3JcznQlH4Y4JZQgdBlHVMXVgxljgEe05wXJiX81J477uc+p4rnQqdXuLX/
         yuvV76uveLl0RLQ0bCFS9sm8pC/hPM4KdbVrcCOIKdEXrvY17/Ln1emZ94iN/S9ryA6P
         F32iYHEazPv6pCvDuWHLjNGAlw5uJoE/96majfHWeVDVJgGCgBRbZfpkxmy0jXHPhwHk
         NvaR2lpKo+vUCTSF20iZE+q3EQVPsdK0ZAc3MmDKUcp2b0dZZ6cLio4BIv5xrrWh00JP
         PgFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTYPFhsW67FSSoRXdbshBhNIiHeeCA/dky1TKFcLq8u09QotoPy8CiCSdwobbn62avh/00MfQd5fMjg2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+x+7SThqL3LLVY22dFU8Vncq93fYKMNv+U5Z33fAm+LyTH9oE
	AXU3Lo2IYap7P8gVoqTIpXemORutFbq7BZvqeIate5ORHKblZ540zUUO
X-Gm-Gg: AYBFou3spYH5Oy1UWJe+ClcwfGpBlsCX9sck6ZXb/NhosLlZCEFWBuzTBfmi5hHByid
	3zOSmPDnHpV5mC1H9/oarnM/aqW0nAEc8CYlGBTUriyfY5Ja8dsWhyKnJfyiOI/EHYBp4xzzeFJ
	JV4MSGmbSQw923W49BeH7l/m1W8JirQFCs1cu4eOoHg7u7xf0Lr8hPr+RAhApW4z2M+d1+rxBmA
	9Fs4bmctRVBlqkJzy3rKIEdYrURXbzIhKFQhM1XvfJABuzeEKD5rieQX+phDOe4sg3bsVDeAyNb
	WMQqBDFPpvdN+/XXYCmiZ2ZqksUe/eF0CvDkkJ3qZa6EooPcSveyvGAbA4UcQ/peGwYe5ZzVLKS
	RW4+VuNp8eskLKV7wmZZ3b3XTa/q88KId0+a6RR9Sphc7PmgjV+rrzKoNp2Dg5wbbLKexICxLZ/
	WdZScEqZS5hYaowviwyMH9TyYlRz37R1Y2NDtQudHk7sL6bFttRHX/fMEbc7IlZFhMu3tgfaALY
	oosPRSTJorZPm+EIOllL2nFIEKC4GvZSuTy6tAV
X-Received: by 2002:a17:907:968f:b0:c31:8c48:e18b with SMTP id a640c23a62f3a-c31a9afb3b6mr819944966b.14.1791747760150;
        Sun, 11 Oct 2026 12:42:40 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm387266166b.38.2026.10.11.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:42:38 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: pavan.chebbi@broadcom.com
Cc: andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH net-next v3] tg3: normalize inherited BCM5718 register byte order
Date: Sun, 11 Oct 2026 21:41:58 +0200
Message-ID: <20261011194228.981141-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware can leave BCM5718 vendor registers byte-swapped while standard
PCI fields retain normal byte order. Detect this from the host-control
revision marker, byte-swap bit and swapped product ID, without matching
a platform model or PCI subsystem. Prefer the normal revision marker
so already-normal controllers do not enter the normalization path.

Hardware swapping can accommodate big-endian register accesses, but tg3
already initializes misc_host_ctrl with WORD_SWAP set and BYTE_SWAP clear
on both little- and big-endian builds. Its normal MMIO path uses
readl()/writel(); on SPARC64 these use little-endian accesses. Restore
that existing register mode rather than choosing a mode based on host
endianness. The swab32() on the initial write compensates for the device's
inherited state; subsequent accesses use the normal driver path.

DMA byte ordering is controlled separately through GRC_MODE. Leave those
settings, including the __BIG_ENDIAN handling for non-frame data,
unchanged. Check both register readbacks and keep this in probe so PCI
access or validation failures can abort initialization.

Limit detection to BCM5718, whose register layout and inherited state
were checked on M3000 hardware. Other controller families retain their
existing initialization path.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Changes since v2:
- Expand the commit message in response to Andrew Lunn's review: explain
  the existing register mode on both host endiannesses, the purpose of
  the initial swab32(), and the separate big-endian DMA configuration.
- No code changes; the diff is identical to the tested v2.

Changes since v1:
- Detect BCM5718 register state without OF model or subsystem matching.
- Prefer the normal revision marker and retain checked PCI accesses and
  product-ID/readback validation. Use dev_dbg() for successful correction.

The unchanged v2 code was tested on big-endian SPARC64 with M3000 v2:
normalization at boot on all four ports, rebind without further
normalization, three active-link cycles and a 16 MiB bidirectional
transfer with matching SHA-256. Kernel taint remained zero. Standalone
SPARC and x86-64 CONFIG_OF=n driver builds passed; no little-endian
hardware runtime test was performed.

 drivers/net/ethernet/broadcom/tg3.c | 72 ++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 73a4b569b03e..ef0f6e5f6440 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -16248,6 +16248,65 @@ static bool tg3_10_100_only_device(struct tg3 *tp,
 	return false;
 }
 
+static int tg3_fw_byteorder(struct tg3 *tp, u32 *misc_ctrl_reg)
+{
+	struct pci_dev *pdev = tp->pdev;
+	u32 prodid, expected_prodid, normalized, readback;
+	int reg, err;
+
+	/* Prefer the normal revision marker before testing the swapped state. */
+	if (pdev->device != TG3PCI_DEVICE_TIGON3_5718 ||
+	    (*misc_ctrl_reg >> 28) == ASIC_REV_USE_PROD_ID_REG ||
+	    (swab32(*misc_ctrl_reg) >> 28) != ASIC_REV_USE_PROD_ID_REG ||
+	    !(swab32(*misc_ctrl_reg) & MISC_HOST_CTRL_BYTE_SWAP))
+		return 0;
+
+	/* Standard PCI fields are normal; verify the swapped vendor registers. */
+	reg = TG3PCI_GEN2_PRODID_ASICREV;
+	err = pci_read_config_dword(pdev, reg, &prodid);
+	if (err)
+		goto config_error;
+	expected_prodid = swab32(prodid);
+	if ((expected_prodid >> 12) != ASIC_REV_5717) {
+		dev_err(&pdev->dev, "unexpected swapped BCM5718 product ID %08x\n",
+			prodid);
+		return -ENODEV;
+	}
+
+	normalized = (swab32(*misc_ctrl_reg) & MISC_HOST_CTRL_CHIPREV) |
+		     tp->misc_host_ctrl;
+	reg = TG3PCI_MISC_HOST_CTRL;
+	err = pci_write_config_dword(pdev, reg, swab32(normalized));
+	if (err)
+		goto config_error;
+	err = pci_read_config_dword(pdev, reg, &readback);
+	if (err)
+		goto config_error;
+	if (readback != normalized) {
+		dev_err(&pdev->dev, "BCM5718 host-control readback mismatch %08x\n",
+			readback);
+		return -EIO;
+	}
+
+	reg = TG3PCI_GEN2_PRODID_ASICREV;
+	err = pci_read_config_dword(pdev, reg, &prodid);
+	if (err)
+		goto config_error;
+	if (prodid != expected_prodid) {
+		dev_err(&pdev->dev, "BCM5718 product-ID readback mismatch %08x\n",
+			prodid);
+		return -EIO;
+	}
+	*misc_ctrl_reg = readback;
+	dev_dbg(&pdev->dev, "normalized firmware register byte order\n");
+	return 0;
+
+config_error:
+	dev_err(&pdev->dev, "BCM5718 PCI config access at %#x failed (%d)\n",
+		reg, err);
+	return pcibios_err_to_errno(err);
+}
+
 static int tg3_get_invariants(struct tg3 *tp, const struct pci_device_id *ent)
 {
 	u32 misc_ctrl_reg;
@@ -16272,8 +16331,17 @@ static int tg3_get_invariants(struct tg3 *tp, const struct pci_device_id *ent)
 	 * sure that indirect register accesses are enabled before
 	 * the first operation.
 	 */
-	pci_read_config_dword(tp->pdev, TG3PCI_MISC_HOST_CTRL,
-			      &misc_ctrl_reg);
+	err = pci_read_config_dword(tp->pdev, TG3PCI_MISC_HOST_CTRL,
+				    &misc_ctrl_reg);
+	if (err && tp->pdev->device == TG3PCI_DEVICE_TIGON3_5718) {
+		dev_err(&tp->pdev->dev, "PCI host-control read failed (%d)\n",
+			err);
+		return pcibios_err_to_errno(err);
+	}
+	err = tg3_fw_byteorder(tp, &misc_ctrl_reg);
+	if (err)
+		return err;
+
 	tp->misc_host_ctrl |= (misc_ctrl_reg &
 			       MISC_HOST_CTRL_CHIPREV);
 	pci_write_config_dword(tp->pdev, TG3PCI_MISC_HOST_CTRL,

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

