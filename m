Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801371;
	b=YXYpp+uzHlWHbO3yTC86CL5Y2Iqa5HFDccWf5YaN7UWtpZGK6vwPcwWMnBztTHSJ0ZnU
	 k6ZzoXoTuRyUhdxBnxO17Rao+1SDezMZmICGipbw5WZvo14pyu8pAeWsplMb7PkrZSz03
	 ZmLjT5NjlBT7sKLwJu3wtf2K525iKSgM/g5hYEg9uakxJyoSiOIeI7jW+hO1PCPv37PTB
	 Ob16Q80mBoAEjQumeTDeRXtUyMSqjYWd4IFUqZWfQ88jZbJWUVFQD0A8FTzaTtAGZECfN
	 +j+XZE6ThohsGYcRvzTwplIr8e0mO+1HTJsdU2VpNngOn3PXwZbZoiWAEyvMjZMXoLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
	b=G0K2cuYl+SYiHJ0eEz086Uc0+fOt7i8nDlemz51hQlqs8p0+XsDqBYi60LdQ1p6pbV2W
	 pcJuX1Ivz7FoiMvCF+nFtvB1EEWymUVn41siB8Ga9DxInaPGuh1SI3r4qdtD5EAu0WBfs
	 kCrZqwrbfDYvC83tLR+1AJH8+niEhwpGtThOc04UgqEaq8OxC7aPKNTQSkIboWRdT3G58
	 ibY5jbJKOYIzx8xLo3bVDjiSuYun6PiwmaVkdVIDpMUI4sZySoXV8lTt0eUxPKvUDWWrr
	 YXknadk20EYMo/nyi2bOnNVoThL4VtMyyiySYCjV+TkyJTwQlQBA/SbjqIE/Xh2++fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1KjPdAn;
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464D606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5464D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1KjPdAn
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so3093915e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801369; x=1794406169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
        b=s1KjPdAnYyMy1iRROee1OouXiivvuAG/RsHa1TnHBpdZEdZmryfksJthuvzAxDQapd
         djAq2y0NJizSdN2XgujDaxVXqFvrM7CRbQx7RUuDVRk7mC4Ucot611VQGMP1dfcPUUMg
         J2VrsIHUGKGcXEwqt93gH17iBZ3ZLXxsSN2x6XcCeid8StiKzVzx9W4tVUqpYac6ys5a
         Ob0fWvFb1FAPCN3C2h8T0GrnihsbXGcRV7vGBFx6qVXWXwhv9C94Oezq9OfpHAyjqOWZ
         RKAyd4q9GunzaHalSg0dPAbNu/KnrKSJHIMemt+Tema37Ytfl8sZ+26N9VFjzLzUWrPz
         ZzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801369; x=1794406169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feOTu3Fjg6/kqLdoArqxeRe79rB82tCPqWr5RYI27tE=;
        b=b4icQjcQU3hLy+jXJXayX5FEZsx4En34C0s0mNgqgUhhOzBVTvwp9a3i+TMHodJTT/
         GSNTlS0orWNLw7AuRFWSlQbFQvLnuq8vhhUk96RXIiw2ENLtnHBoZO01bbZy1o0McJxv
         CfWMsRfuMk8jVxzhuLORoC+7QgdagNbtBkx4DfGdGIilzZTIysAuO0Vh6nF7NIjlPSsB
         gFNz1Bp2iW7wW1oMjzXXAXXFkFPE0AZq9CdwEeIBe3GIRemRVvO6cdWjLTSC/X7x2Bp5
         SNIN0aMXVWg4fKIu1Ka3tRvjpMVc2fNCZnvSXPngv9r76ZuAhAap4YuN+Vd3X2zvfchi
         IMGg==
X-Forwarded-Encrypted: i=1; AKwUvBxKvnZSQgnW4nfcmlKkXLhNke6NmIHfoCKpcZCKk6ZlEralGaxg5x7LfvWpZ8xpAQD9IQ4PBJDd+xHODE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kfMlqGYmgcFrKH6LKZKsIFYfaqak0D1mANQX4WCr38BhNDAna
	/KKamKINSiVY9eDY8iauYhQ5d6n9hdY4LusXiDZz7VMuR4rKEf6KeTj0
X-Gm-Gg: AYBFou1TAqBbYQ1lbBbu2shfhR/N2KDORTNwJ1+goeRkbjbEShGM5+Apgk9D7al/ugM
	SYQDacXygrYuh/Fhx6iqLoaEewwQidP6/ClEiF87VLKdNWmJdjucBOZGk0D72jtl3rpLkJQzgBn
	FYumzhuGRbKQCSgSXK0/D1IgbnQArRLWdZ50I6tsUxoEIZ7D4RkdcY69KZX/Jht6IhtxrZaBjTR
	ZivbQQWN6GAXzRXu+m6oyX5qRE/UpqAL/yj7/jodeY4nxxv2HVrEtxF+3mqAAAvZN6IpRqumKqf
	AI1lrlghtqJ4npDD0IeUF1Ci/XqATU1h73koNHWRhHqRr+5sGvEvp7/gP/bHC3/VjC8sIBvddng
	SNRK9evzKHUOaWyCEv61DefujEjXtoWyOUblmPXNtVBQ5qjTVGDLhSRtEj4UtypYVdzlPctFsV9
	YIR9JEHjk2/cpIbvZbfKbj9HAEXbIi/v/Ok1jFWjo0XQ4AEyD8bptAYBZGSUT5Ly3xS0Umq6S52
	WQSULGvJSDuCVbwySF2glr9q+EzHmrFEN1N9IKyEedwCgwe1wVRYaSod939jwMKzoBXacOdtmV8
	8hR3lCAzWv4kmaBfgdQCWS42dLm6RCEnbTM6NZrGGq49UNIPeNY2Jg==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr177944795e9.29.1793801368473;
        Wed, 04 Nov 2026 06:09:28 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm40977605e9.0.2026.11.04.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:09:27 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-pci@vger.kernel.org
Cc: Ali Tariq <alitariq45892@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Alex Elder <elder@riscstar.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
Date: Wed,  4 Nov 2026 19:07:45 +0500
Message-Id: <20261104140750.761330-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
control logic register, which causes controller to reset itself once
PERST# signal is asserted even when acting as host.
On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
runs again, its first DBI access hangs the CPU.

Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
in k1_pcie_init() before enabling resources so controllers
dont end up resetting themselves when PERST# signal is asserted.

Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Hang log: https://kernelci.cloud-v.co/scheduler/job/420
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac3..af6028e8825a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -47,6 +47,7 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -131,11 +132,19 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
 	u32 reset_ctrl;
+	u32 ctrl_logic;
 	u32 val;
 	int ret;
 
 	k1_pcie_toggle_soft_reset(k1);
 
+	/*
+	 * Ignore the PERST# signal so the controller does not reset
+	 * itself when it pulls PERST# low.
+	 */
+	ctrl_logic = k1->pmu_off + PCIE_CONTROL_LOGIC;
+	regmap_set_bits(k1->pmu, ctrl_logic, PCIE_IGNORE_PERSTN);
+
 	ret = k1_pcie_enable_resources(k1);
 	if (ret)
 		return ret;
-- 
2.34.1

