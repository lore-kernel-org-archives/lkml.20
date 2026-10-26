Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016576;
	b=Q6T8g/0MUStmttUz+WwBf7JcH7TJ5Q6EkZITxUmSlSSgSyv4G+DkefYnO+QDFkbLtzZU
	 mKPLAFzF2jkn5VsJezyzDvSpYAi622TNzUkZlOWWB3itb4EedZpAHaek26KMmz2KvKV2B
	 rgthXUKkia/FDZt72g4CoQyNbnhqSHWiNBEc/GfNoUqhA/CLgOOoCM1CWklSuLAmbgI0S
	 VIImam/NiRuN3Q/ZWauSJQ7LNbBpl89vjED6KEOtGM8do/8TFWFdS7jgnLaqvrbE9asNm
	 oU3+tAovl/tieYCksv2vqJQuyeodxC1PgGA7wy1MPldVnQodi1EbHxEUaGKzSfvgAUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
	b=p8L7XqdySubs/ya9xzQlUZDjLyg6bNuOZP68aMhr65L09oyZRLN98A0f8FdlFXSKt8RM
	 M9H6SJqW+k16pMPykeFIUfCMvWunVQKF8EWOdkWu0yQX1whG9udKJMcY3IIYm2Oi9TbiC
	 1iWH5IC7aQyMv1DXsqc4QjzFI5zQeyQ3qt/VDJDBcSQwwHc3SVhoSUmI7+YhRMO+AbzQW
	 yYgEODfXJmRYWFASd6fbkxx169leQO3Wd17muIFJcMzOuMK7NeY059C210QKHBGVzHQaH
	 AZ8C2pZDKj2Y1zbz4bNYvkWmRpwO8czxW5mbEnSVPamHm5vpM8vGzbjPu4s/2zJPlUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iIUte97a;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E9606A333
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5E9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iIUte97a
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so27738385e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016574; x=1793621374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
        b=iIUte97aZggi1ofFx441f7srimg+KRDXl/VmYiuWpcYhadX+Ovwfl4Rh6DwuiJo3Yr
         B6X1SRL1QwmK1NMBD0B9Q443BGgzJTdLi+MZCawjeW8rN90arvLoMnrtTpJc7/mLluS4
         TVxwb82PiDs7/jGS9D5e5z+nMd4j2zGYcmvtwiqzFC9q+AzKtbc0u3feJuOs9cjhQyDl
         49qgIVHn1kly6YBjJCy9qpQpl8DOvzZFmpOBvIGdf5dbFTx4OKjtpmvG8CyNceLUNMSb
         JWMhYaKHBzu1TsYp5uIqVXGuUTnWEgON/ZpQPtZ8AhZAE3spwZVntcErtvMPpPR9vwzm
         fWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016574; x=1793621374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ldjmu4YxDeIPKd/4OJCM5t43rtkZTUWpd+k6Mdr7ueA=;
        b=rUTKshwNBvT0ju15J56JrT9CplKOuIWZvRGfR6xRhLfJpCQrK/ZUm1WkBKe/JhZzFA
         5q7DQZtg7AqKpMkcZ10e4hcIbTbjfm/XaDfpMTkqUYCcXV+FNKJGbeAioXNb986ol+w2
         4o808EfptIsvFcDkbztBKidjYLn9XRMWo3+qO2755ChjjWFAVG1DND2JdPwz9LJJO8TH
         kkwjdvm4asw7TrocMDKNF5HrAk6ZDkRuH7HYwvGsrVMTcGFr1qlsKU4ScZfppJR58+CZ
         oB5OE3YoGlWDus4kdAA86yGHbFXzzqmReK2mcy5EGu5n851/1XGmIC/kBED2EeWbqCEb
         rrLg==
X-Forwarded-Encrypted: i=1; AKwUvBxydzQ56RQGzd/UXl/EjuJjc9K8t2Mpk0QZqXme5DiN4Yx98ImjkxAFQn2QTxOH4g8K9iFepZCSkvdaP+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeCyLXBFnF+4zFvKAcdr4B5lAOrFVx35CfIv02dB0uW1PbOnnp
	MOAO2dJqDcwszAeeoORosJDcYDgqjeKIOKUsUBN8Je+HCPcOP50yDp73
X-Gm-Gg: AYBFou1YMIzPNAlwXopqLFF+WvsjyPVtFFiG7ABug/FXUFX+LaBk891OzShH6UKuMbL
	txXl1CMZpKMRujoKDbsbchDUWFTCpyBruvFsx93g1YI75EyAsGeOwBwGijSOUke1KNh1aN8Gaqo
	9TQJdsfDnPbfb0VIbP12NDgyavz/iO0PEx6eGS7cQt+oR8XiX8vo5BlYcdkKDVk3T2IfMLZE6Uj
	kzu6uV99jt+NioqiXHUwREQWwEKja7XzomshvIbeMy1Hk6SlUEY3dpwyMwuJ+4AKZBybu7oNJPB
	g6wrqX0/HdTxijbghX9/tSp1ZX7lWF32nrwUliiwbNMRQvHICR60sXNirfahHpfZyElFAou768s
	AUjch+QRRcy/ojbYnKiAx9TY36rzBnYXSKU2zItn/D6bR1QE52gmD6f1tCZrzBnGF65pYX51TFl
	rKjkU4ZSl4VgeTmkzmraf7EAVFg/XoMsmEYzM8dtoImHaMzedh1AXgUb+XI1o3YkOwLtUQ+gu8i
	WMY10+lNB0qMp1m8nStS/L1yu+s9yIjwWqui2pIoKaJS4r01+o4IglT/ve0yh5x/g20rnT8FkV3
	cmm/DXz673LqynomXLe/wNw8lZ+Oz3h3htjXYHNqEH1/Mdy6O7KnJBZl4E/0V6VxdQYGWCnalMj
	3loFl
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr111607605e9.2.1793016574151;
        Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:33 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Mon, 26 Oct 2026 13:08:14 +0100
Message-ID: <20261026120920.1667982-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

The GCC binding names the CMN PLL inputs bias_pll_cc and
bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
clocks through DT references.

Keep the existing .name values as fallbacks for older device trees
without these optional inputs.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to align GCC parent lookups with the binding input names.

 drivers/clk/qcom/gcc-ipq8074.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 1329ea28d703..68c080d49154 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1132,7 +1132,7 @@ static const struct freq_tbl ftbl_nss_noc_bfdcd_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_pll_nss_noc_clk_gpll0_gpll2[] = {
 	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
+	{ .fw_name = "bias_pll_nss_noc", .name = "bias_pll_nss_noc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll2.clkr.hw },
 };
@@ -1357,7 +1357,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
 	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &nss_crypto_pll.clkr.hw },
@@ -1411,7 +1411,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_rx_clk", .name = "uniphy0_gcc_rx_clk" },
 	{ .fw_name = "uniphy0_gcc_tx_clk", .name = "uniphy0_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
@@ -1463,7 +1463,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_tx_clk", .name = "uniphy0_gcc_tx_clk" },
 	{ .fw_name = "uniphy0_gcc_rx_clk", .name = "uniphy0_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
@@ -1704,7 +1704,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bia
 	{ .fw_name = "uniphy1_gcc_rx_clk", .name = "uniphy1_gcc_rx_clk" },
 	{ .fw_name = "uniphy1_gcc_tx_clk", .name = "uniphy1_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -1774,7 +1774,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bia
 	{ .fw_name = "uniphy1_gcc_tx_clk", .name = "uniphy1_gcc_tx_clk" },
 	{ .fw_name = "uniphy1_gcc_rx_clk", .name = "uniphy1_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -1842,7 +1842,7 @@ static const struct clk_parent_data gcc_xo_uniphy2_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy2_gcc_rx_clk", .name = "uniphy2_gcc_rx_clk" },
 	{ .fw_name = "uniphy2_gcc_tx_clk", .name = "uniphy2_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy2_rx_tx_ubi32_bias_map[] = {
@@ -1907,7 +1907,7 @@ static const struct clk_parent_data gcc_xo_uniphy2_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy2_gcc_tx_clk", .name = "uniphy2_gcc_tx_clk" },
 	{ .fw_name = "uniphy2_gcc_rx_clk", .name = "uniphy2_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy2_tx_rx_ubi32_bias_map[] = {
-- 
2.56.0

