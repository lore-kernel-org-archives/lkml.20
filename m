Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426672;
	b=rdFFvapvLWRQjQwnUTwKS8sbZ74bi0tHcfr/2VvP7sXxjVKfjVVEjRxoJjW1PbO4lPnS
	 BD61GhPYrKo3bE51L2jc8Wiis4w/MB+NQUv8udTBroj57K+lREMlaKH/iund0uGKuzjMI
	 R5x3wi+YgA1bH0jkMunMgo4SV0t3OMfrD/DLvwxPNXJq67d1ycLayOnc617goOChLt4ki
	 ElxytLl7h9fHTf4I1UxZFBL/fGXsk01OpUv9t2x1Ow8uzZXkygO3ftSf8zxBXcuzm26iZ
	 8intnqg5T0dXyRP9dUKuXxIIDLze7i+vbH2RIqrK+FEcblpEA+KsR3fJlnaHrUEgHtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
	b=FoW6G/2XjcFgI7GBeM89vPD3Tzh01Ek0iMRxLtVHRXitaPOEfcu9/mxCa+N7xQdEGqmQ
	 AKQ1D1uEBDgGttCoNoghJewERv5RlGcUK71XXKLPenXqTp7/TITOglbgMUdGjb02JPkcA
	 X1+8rdUfbiFB4cRx/6DJ2WBlDpOX6woT5XQjIZA39okOgciQArxVeiSHa0ZkwxYesL4qo
	 tqCWkV04J5L+as9oQ0ETq9kKfBq1BN1e+pvofqsIC8/Vrrn/9jwYtqNn0K6Ic9M7hRQ8G
	 p9WTsB9++nURQTjJaYunFLwh2/c/KafP4l1nXBP2EhRouNdbOIPWoFJQW9eEOi9x9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=doGmmNKp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56121606A332
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56121606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=doGmmNKp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2417797eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426671; x=1793031471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
        b=doGmmNKpO+KfJJ5r3TqqgIGoAZlAoA5zWP58ZbmjTfmUxdXoID7DGxLinQE7EMeZ0O
         k9RkEadNnUmUZxuvIqmh6AfCOkYozgubS359fVQAqAp/H8yUyFsXOi0ITaqwnZhvkTS4
         agRblBsa7sJRq2n0ttcUqzGBTESAHWjnNm2wUE0yBVBVQUZtzpalG0IPZ1g2JZoRdD5g
         a2+YI5pbIQO5opBwzO38VgLgqvS0RqRpvUrV9BxZMNrJ3HUOi1avl5ogaNlhjnm86NMe
         lsbCdr7DF6tXxzK3Uwg6girjlbNJHcAc/TsDlZxiG91e7Ofl/9PbZ98DR99UNFwVphHb
         YCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426671; x=1793031471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsDZepg8xw8s3IYf2oycHDXOymRS04NCMJOXtFzaXpU=;
        b=VMIDmDLEQ/Bii62fuX1nmJR2uMzHX/EK2m/Jun40IUfpTyjRKs0Aroi00SaQzosGhB
         vVrhXLL3ZrKXw8a3sZ15UUaIr+GkAWUSZE+BLia2WFMwcokbOSoiPPSXWManAMN803OP
         OxGI7hU+CzwREoh0YxQCTXo4NDY7GAT55wPc3wR9l7x2itDm+m1eUQZVHBo3GDdTyvdp
         LH8p5yqv7WMPFwop+NCGfBwPl4cjr1LN0JCe7IzdtJMVPS7EdDkKcdDu9LGkn3/A4dOw
         gATay80h4Fmvih18qu36A8ipPle5QIqGClPcaHj4BakcINj5smOtihXIbMMJfX7854WZ
         /vAg==
X-Forwarded-Encrypted: i=1; AKwUvBwFsTSL9F3GiRu836VWUglq9ryN6eAbczBI1Um6nOq5W4vZStmtoDqVYuGoEuRmAdqdriiS7NJYg0YPph8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtD/ylL//gRJP0yhkQUnQ9YsmrjDUD9uJQ72dcW/n+fxo1nI3q
	9xWrBbnx2N0iO5Ps7XcM8FeB3QUaH9c1NiXTsYd1qL1lkl9aSAu5ukET
X-Gm-Gg: AYBFou3ojXTYVA08H4i8lACAwwPewtO7b4d/TenjAWthkIZfLKsxnmzPAh9i3Hojc94
	7c7W9CAYFCtXkFV5gJ86fjiySLUFH2T3PozAIug6wGD6AaQU+jrZ1lRihddBJiEULdcxvR+2lU+
	/Q3jSKfNg6oKWsPDDZo2gryboS3e6hH0QeRd1hjyNcF22J6BASqhQ1NaaDHgJegM4XRYEZqtfea
	/FtOiCP5tbP/HJp9Goz32ZfR/2OOI+PKm52bMuUo92miH+ZXmPPC3nWfGgTEsDosMyVZ4MOkX0g
	CnnDFpOm5Elh/S/eZA1wgGasJEai15PW24J9ap3A3YHY6R8/SoxelYct9921DUKRROT8Z53gzsU
	vyWesCt1oUtHVKHtdQyChbSmhQ4m0SIpKtRRvBAchvgvLnNSxdxptwcOf0bc+VMgqQ3Vu4lMNld
	8jxi1DNXfxms6iMTFDWzWZSwA2iSNEukp8iyFSd+6pbK6jQ6v0+gf3rgT02mAv7G0oBTyerWtSv
	zlxMh23XrQ=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-361a274b361mr11482466eec.40.1792426670942;
        Mon, 19 Oct 2026 09:17:50 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:50 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
Date: Mon, 19 Oct 2026 16:17:38 +0000
Message-ID: <20261019161740.2384-2-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019161740.2384-1-sushmit718@gmail.com>
References: <20261019161740.2384-1-sushmit718@gmail.com>
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

gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
takes this clock as its reference and rejects a 0 Hz rate as
unsupported, so USB doesn't probe.

Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.

Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index cdae5d9c8aec..56503a45b64e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1500,6 +1500,10 @@ static struct clk_branch gcc_eusb3_0_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eusb3_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.43.0

