Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499103;
	b=UtxNYWbZvM/06uZfsdtVCvx1+ZUmf0reHiG5a2Ip5JqR6kaa7M7kfVhsny7rhDxG3hiU
	 aeyvMkboDZeJuhT8UBGGvQ28eBH95a27Zzwe6IhuxXtamPOVhMciNyxFea4HdZjdxm9gE
	 wFrKmjsxF9a1SCIUk6lHintVFk7uuBxtbX6XrbooPPp8c1Jmlfl6ELyicV12aKVt7Knjo
	 ppf2P6tsxAElL8a0WQWcwxGGtLHdQhwPKfxYuhoL/OdjCaQYI/HdhIzu/UAgL2u10Jc/k
	 OOYSV4v0o9pA4RtFi9rGDjjHSuTWeoQSzyFzXw2oaVU7pHJE20hPXOiNtfQr8cBZ4iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499103;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2ZK3Xt5KyUIXmWiuSN114/bnjD6MZrQYAmtxv4m7uMc=;
	b=Uh6hqiH20fvrR3U4kNL3udF2DINPEIliJSdAaJlOkjtveCFxu+n9qTV0g5KF7lbNOuPB
	 XXl3fhBM4ihwHIpeTynDT78yYXAMxWuXW2ovePXfcITBXoDs39c7cgsjp6nYfkOFLadLn
	 k1y5ZQOTRfg+8YAzOfP6C0A1XszrhZMHshZ02zpIlyJryJJHuBkpf56kYXf1N3051WcxR
	 adOAgPhYqAaLY/Ph31ar2/d030UVm8Gw2cofV5EWccE1FNzXJCpGRvb4IsYkDJk+MjkJP
	 M66UiPBba6eggNVVbWmfj5Xw26gJZ08Q5MkuzxmLCxstSAf2QzAgM4VqH47yx6UtCEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsg.is;
	spf=pass smtp.mailfrom=dsg.is;
	dkim=pass header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=B7bM5rOb;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89508606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89508606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsg.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=B7bM5rOb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsg.is;
	s=protonmail2; t=1794499099; x=1794758299;
	bh=2ZK3Xt5KyUIXmWiuSN114/bnjD6MZrQYAmtxv4m7uMc=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B7bM5rObGn1sQow8KG62ryMWfDcCV6gNrsqcqoxAP8qG81og4UdANP3Bjs9a/1Q2u
	 jW4ejcB68VnxaJmqUUoyviOslh4TWeXSxWmOHIaGAD83xc0L5Y9k5UrLgfNeTxtVjt
	 X2DLBOWdXb57T79e7LvBRDE3J637m0KFPRrhEdQf0kAj16+SfeqRkVGf3w6npaK5X+
	 qXr0QzYW8PamqTisom+Pb0MOXSVv5bIyt+TywFA65K4bNdbghUrz+IklGOWykWcKB2
	 pVKXvclf2YyhYxBvNKCasIxeNmXCMldNbcZL/8kwSdVgsu49vNbrXDYnJe0upPe2zF
	 Yo1wOajuW17rg==
X-Pm-Submission-Id: 4jQQ602Kk3z1DF5P
From: =?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
Subject: [PATCH] clk: qcom: gcc-ipq5018: fix swapped MDIO clocks and resets
Date: Thu, 12 Nov 2026 15:57:55 +0000
Message-ID: <20261112155801.610730-1-david@dsg.is>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GCC has a block reset (BCR) and an AHB clock branch for each of the
two MDIO controllers. The pair at 0x58000/0x58004 belongs to the
controller at 0x90000 (mdio1 in ipq5018.dtsi) and the pair at
0x58010/0x58014 belongs to the controller at 0x88000 (mdio0). The driver
maps the GCC_MDIO0_* IDs to the first pair and the GCC_MDIO1_* IDs to
the second, so each MDIO node gets the clock and reset of the other
controller.

ipq5018.dtsi enables mdio0 and leaves mdio1 disabled. On a board that
does not enable mdio1, clk_disable_unused() gates 0x58014 and the
controller at 0x88000 stops responding. Its registers then read back a
stale bus value, so MDIO reads return garbage instead of failing.

Observed on a Ubiquiti UniFi 6 Pro, which has the internal GE PHY on
mdio0 and nothing on mdio1:
- Gating 0x58004 leaves the 0x88000 controller working and every
  0x90000 register reads 0xffff. Gating 0x58014 does the reverse.
- Asserting the BCR at 0x58000 resets the 0x90000 controller and halts
  the 0x58004 branch. The BCR at 0x58010 resets the 0x88000 controller
  and halts the 0x58014 branch.

Swap the clock and reset offsets so that each ID controls the
controller it is named after. No in-tree DT uses the MDIO resets.

Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Davíð Steinn Geirsson <david@dsg.is>
---

Tested and confirmed working on the Ubiquiti U6 Pro with both
OpenWRT's v6.18.60 kernel and `qcom/clk-for-7.5`.

A comment in OpenWRT's `ipq5018-archer-ax55-v1.dts` indicates this
bug has bitten people before:
https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/dts/ipq5018-archer-ax55-v1.dts#L273-L279
That workaround should become unnecessary with this patch, though I
do not have the right hardware to confirm that.

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 37ccdc44a8..bf1a4745d1 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1969,28 +1969,28 @@
 };
 
 static struct clk_branch gcc_mdio0_ahb_clk = {
+	.halt_reg = 0x58014,
+	.clkr = {
+		.enable_reg = 0x58014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdioi0_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pcnoc_clk_src.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio1_ahb_clk = {
 	.halt_reg = 0x58004,
 	.clkr = {
 		.enable_reg = 0x58004,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
-			.name = "gcc_mdioi0_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&pcnoc_clk_src.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_mdio1_ahb_clk = {
-	.halt_reg = 0x58014,
-	.clkr = {
-		.enable_reg = 0x58014,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_mdio1_ahb_clk",
 			.parent_hws = (const struct clk_hw *[]) {
 				&pcnoc_clk_src.hw,
@@ -3585,8 +3585,8 @@
 	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
 	[GCC_IMEM_BCR] = { 0x0e000, 0 },
 	[GCC_LPASS_BCR] = { 0x2e000, 0 },
-	[GCC_MDIO0_BCR] = { 0x58000, 0 },
-	[GCC_MDIO1_BCR] = { 0x58010, 0 },
+	[GCC_MDIO0_BCR] = { 0x58010, 0 },
+	[GCC_MDIO1_BCR] = { 0x58000, 0 },
 	[GCC_MPM_BCR] = { 0x2c000, 0 },
 	[GCC_PCIE0_BCR] = { 0x75004, 0 },
 	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },
