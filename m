Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479274;
	b=10tpieteqRRsI0d+4VnR+IZcdf3Mmfqh/SyirdcghvHirpkCcO2Gbpr+4/klMwTmqLcC
	 la99vFi7iYviLdnD459eAoxx5ruymZCB2m+ZPytVuYDLCn9GdBRThtOkGJgVPRkh91Lzv
	 FAJ5CJ2YCv0948v8uzFppIxD9HM/oPLFs/ZdUCqRGbbZn3RezottrXlADbp3nrOYIpZro
	 mICnbZ4a9R2J/SzwbIdVlZ1KHuLBfuYrjBC12/HZEyeNWDhdE4g2egiCFADhjyCbdGH1a
	 c5m7Zr4EBLMVffrARx6uTlNhFcam8JyG9IzgKb1FGmEea+vNdhHo77njdEjlmDECZ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
	b=VgL2CqPQNUWgbw4w6IN12eAw8KSGHQQiYWsvjjuvOTofQ+vFYlH7KRQ7MPc55ytNsvEb
	 RG5807V1EW5iWrlrlR6KadnztswQ2Yya+5yN+lwLZcSIniegRboLt91aHt7pZaAGW5beE
	 WfEtShVY0aYGZIeUF1YfuYuDMe31gWNdDp3uCZGQbihJzrK4H6INAohbL5OmOhUZ498W2
	 tqJ+0720uxsywq4TJqBdeO5hg4L0RarX1vIGxa/60IBlI8rWcX80u6Fix0Hwkjh9yTykY
	 I5DfMWB3cVO1cDN3uhSLAjWyZsiHTo9NE843uT1PULcjUNHHFPHB6k097yvSNTtIb0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="a2AMo/QM";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3928C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=a2AMo/QM
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so1762524a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792479272; x=1793084072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
        b=a2AMo/QMymtnv5ie+vYewdfNMKkN6lyKSHNxHHeG0rzLRfSkzkuxdawOZmNeGk0sV3
         PEaifSCIDOiXQEaQDQ4lERqky195FcAFGQlxwjd6pdaPlTQ5agX6VDBpIHviY1F8x/w3
         W4/bJmiZiHm0nlyEOeYGCuLc3XX/1xHtTjVb117Sw0+IE5TTN50P0XfZECym1ISC0AGS
         xwF47f/hehl98TI7P0Im8tSinnLKGs6WmnOFMt7mynGJ8hR7NJLiq9Kf45y5PHjv11av
         Oz6fy4PIpqzR3zKY3+WyyWlLp2Z5WCV+NuivX87S4oBIMz3KD/BCYKGbI3oTl0bZMNCw
         exww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479272; x=1793084072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
        b=cLVTODextNQJ6Jt/VDtk6tnvoeS4CvofgYGTphkMYA9pk7GtxJ5OF3KWWpmN7w+fyq
         cAyAXgvud8cUpkKxaHesQgqjzPGaPgo5MAWmxik8JT9Nhugkg/ZROEFOx2dYSzn46Vn5
         CjADznb3KT4IwwUbzRyNoI8kasUi1LW71ZZs9/3xB71OOz2ofQ791yxMRmkkmjNpSFjg
         QszIcqsuJ3QcHT4mIkUSuj8GaVEz99EI0qEtZ4t/15Jxew08ay63WpWccokDGfa/8zRJ
         tkDos4ecFBpUEogJzgSlLkM40Q5u5Bxm23Qgnjqpyu28MZUHlUrlOhK8KgcfRNQWsrAC
         YL3g==
X-Forwarded-Encrypted: i=1; AKwUvBwl3rIGrk9gilUa/nHqgCwjqIeCAOM6Y7MJDqKwqFYx5pUb32OIlHllKIafVf1pykJfGWwCo9K6ABwvh8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcLX21AaGUdlPdHoDtkmJy8Ow6/IeUpvERZnQ5JtgPGm+8k4h9
	8EW/2XLSG1LUO+/lKyMpiCVL6LZieGKyT5L+ezMnqvcwJ6q0LWChz+v5m8vtusAaHg==
X-Gm-Gg: AYBFou2u4POcIdJVDbINaRgTheYHm0i7mV/dhgmYBF5rhu4HHJFcinchmnwADRQjLzF
	V5NTI3NTFRlo/Jl3Ot/tTbkjLtzz+CJi+4Za0PZPGFKwQi3nf+6voIBXkegbU0GYNzPlpEt9vV8
	XWmIhpHka38llcEfGJ9tAGrV3c91pLPHWwUyyj89b++rte/KLL6vqsy1Ve27ubIoHjC1WKSVAzm
	SQUVbpAH+jwwNRZWbqvdD1hvxeADmGUxOviWholv453UKnpD61xx2cKF5sx93esUW47e1H6QNWj
	InHwybU14FWrC+PdjUDZ/4jCIuLgw5gnIqS2IcYQhscELIxN9k9R3IJ8WS1cwwuk/2f45h2oJiS
	dfQovrlo0n9Vgdw27x30hWAZglAvyd66JxqNVhnql6hK1o5i8RjvrbPd4WmQpCT+M4uQs6/mVAx
	ZxtlILGyXpATv0oB6ocoyxth3JCIMtmScFf4hXMcEGkZCov3cRwp+lCfZVhU41gnOZX5BmcD77o
	D2655KmB6QhakvOqTAun/FuU0uuvMPWEg/1b+/66Rc1lwY1VwvSgjBeNRwItQXzqJispJNIraUF
	o+UfTqyYL1tQ3GbxbWXWg4T2Czfpc0l52a7+pIKmTvt/z2IzKx2/xNkaxdlE55LW8QbEpGY1/5m
	xDD60jHweKdcPrz0MYgaQ+ipeOmMXauEdG4q1PiMPXPQvkKZJ0hDzj5wlQX+RSC8hx0y49fDB/p
	TWF9u81w==
X-Received: by 2002:a05:6402:1d54:b0:6b1:b1b9:482b with SMTP id 4fb4d7f45d1cf-6b3a8155676mr6443778a12.14.1792479272378;
        Mon, 19 Oct 2026 23:54:32 -0700 (PDT)
Received: from Desktop.fritz.box ([217.26.232.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm4689846a12.24.2026.10.19.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:54:31 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vladyslav Andreichykov <vladdrako007@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias PLL parents
Date: Tue, 20 Oct 2026 08:54:30 +0200
Message-ID: <20261020065430.1251541-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

From: Vladyslav Andreichykov <vladdrako007@gmail.com>

bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
which takes its AHB and SYS clocks from GCC, so the device tree does not
pass them back to GCC. With only .fw_name these parents never resolve,
nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
-EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.

Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
as gcc-ipq8074 already does.

Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/clk/qcom/gcc-ipq6018.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 6943dc511534f..f58000407d015 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -360,7 +360,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
 	{ .fw_name = "xo" },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &nss_crypto_pll.clkr.hw },
@@ -539,7 +539,7 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy1_gcc_rx_clk" },
 	{ .fw_name = "uniphy1_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -594,7 +594,7 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy1_gcc_tx_clk" },
 	{ .fw_name = "uniphy1_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -733,7 +733,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_rx_clk" },
 	{ .fw_name = "uniphy0_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
@@ -769,7 +769,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_tx_clk" },
 	{ .fw_name = "uniphy0_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
@@ -1920,7 +1920,7 @@ static const struct clk_parent_data
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll2.clkr.hw },
-	{ .fw_name = "bias_pll_nss_noc_clk" },
+	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
-- 
2.53.0

