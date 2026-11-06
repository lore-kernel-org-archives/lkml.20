Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978205;
	b=oh+cQZrXC8eYhrbZj+2k2pTg4ZLeNnP5+nxXodHmmO6gJVYeXbBIer/rVnre2rs9yWQx
	 tCIe/OA5OEQKx82apTZqPLXls7Telbx/MFUw0IuXZIvi1JYpCCjjfSYgtiXaRmXWvMgnB
	 f2H0B1LdcEMKYDX/t6i59AZde6Rr0NZvQz6kSGPowPvQU9Fn6ivoiLPI87x88Ddhc4WCQ
	 qzCYO39YAWnMXF1p+bpmPBeAPiRC5+EWotssSxRaBuFZYFt4HFSG85qLLyW0YdnLWmclP
	 6TdTgiMOH9vjnNp58vyOjlONXIDTIqsCIO2i/anmmBd1N7EjW9owWxhjDvj3+fvYa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=c7DqBwfCOvSVsSgj/qzC/h4TOpHot16HRpVVgmGU0qw=;
	b=zg5JH71+if8a514VZjc8ep+mlrdu18oV7Vy7ILB3rPKaFRFkTbhPft6GTqShwTT8RX7c
	 Ha7Vt1G+S8/AdsGziW2Km+uM1hDjiv9wjeNcYUoQzFUUpjZBhP7hMr1n7zqgKzMbECuLC
	 cnn25P07hoELyMUwG7YQw/v8A4E8GQXXJKIpiUmdkkDRvzD1FRLMdxGy3yW5wY1IcyQJ5
	 Yg5v9C3K+LbqNzLSNJpV4TzKWDFuMVJ5AVsY2EwtQUykIO6reE7OY8/FFtCEQVsLUmjzy
	 DFLnsaLQK+ThhxLgiAl+txQ2ZFEflI3eb26rnkLJE9YkGCkviHN+WvRYVo4xq6RV56w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do0JzGhN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1E606D815
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB1E606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do0JzGhN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e795af1d4so654670eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978204; x=1794583004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7DqBwfCOvSVsSgj/qzC/h4TOpHot16HRpVVgmGU0qw=;
        b=Do0JzGhNzVIDY8BiFnEhm2v+P6LqjF8efTg+mpnLu/lGFVMhPLcudHIw0oZR6aMZmZ
         Cx2dqeLiuUKo/D8GjF+MC9SqOo1/YXUNojU8kQxfWXY6fLVKPP4tW0Xo1APUVk1K7r6x
         MnkoXfGtNWw1exePsnFJYAePhyDDGxp15gltREqoh6/M/IJiIC32HpJsuaFyb/pSabkq
         Lkm4Jr+SbdwB9UmY1lg3IsP4DQumhurcsx1rakZr7ue5Jb7azcTV2HrVmCqbb2SjKBMx
         mADi7qeWHLhFHaL4xGBbuqsgCoOSPwXavVa2JITRk98jG2hZfpQwtFBqfu/7B/5qZLxb
         whpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978204; x=1794583004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7DqBwfCOvSVsSgj/qzC/h4TOpHot16HRpVVgmGU0qw=;
        b=bu0tRPOx6qTd2eJwBSwlR/gKDh0f3BOY5783S7VMRwojY0b/t/lYTKZIqU/ljtR+iT
         gdiSJOFj3MGacEr3jFTqcac1QyzbGUCpeRnEkh5sn2NrU1a+hgQTcRj8cIf3x3mkTzF7
         FvgCnU2XGPR0XXd0GzXFBpW4IGJg8X809TwT0O/zOtqOzgk4COe0enund08cMYW0dEl8
         +rNjrerAc43shK5b1FAeHhVGZYLrvsMrtesrI89UVfFQRR1da20M6RRwblbdhPMj4ron
         gc0hkLkerBM0U3pSWuGnu/VgKAJSd8WSNkXv/Vn4QYCgSPk8lmUHpjcpxC78LUBpoRUG
         ZbsQ==
X-Forwarded-Encrypted: i=1; AL+hErFnXmLsxY0DdAoIp2oM8ioBtCJsVLlTHToIwzzeqhfFRWPeewgf852PxVdG1QQL9Dph/5vFzabJb0uWGkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lZGeZ3MCpNq8qSl9OjDMKXPNldg9qFBwoJrfxw7pfVfLtxpbI
	H2vVKshKUU4/KqftI6l4FSDT7yH5Irgyy2KWiDxWIy41B2iA0n//Q/k0
X-Gm-Gg: AYBFou2rBWCOuv23xjSJmvueK3xZhwCoAbWtGBlC/ZlqXYjM5E7YBOW/EuXL3SVpAr6
	0fPmoI+rriFwB7KefJUqfXf7qQSF37GPKg5cPSNDj+5dfc2pM9ADtT59GX5y4gpMHt3JTiPqJH6
	M5AeD7CPAVJawZ0lI+7Mg6Zs4xCWBM84w15CoZbjYN1D3fpyNLBLZ4cypZJNFLhNaI7RpCr0TvT
	vksBXUOfGR1GSr1kOAD8gNPJbis/Z9Ckrv9c9iakLoAeoa6kQ3tZC53mnCSkj5tdIgmZHxeB26i
	UOZqvF7v9B3LlYT0j4lmQrkTe77mVf41XVw81pO0f0JngHikS9HQVpwJd8dIyzqern41Z+As5b2
	NyqjTe2yMIIY5qhCGSa2lq54y7o5CxKsSvGGGh+DlVfEGqTz5jb7Pnzrloyme9RINDyNUiPNLhp
	OEqtGBIpaTqQHw8lQ4XB6t+msS5VPvVGyrVl4CO5wKAZiU2cNi7+AOl3c2nEiMDOr3ATZjeyBYc
	N1gf6KWCC2KJKbe2DKWO0QYMuVoiMMYH36l2tLbjxkk3ExzUoHz4rse2wUUBR31zI3Y50XJPiQA
	Wz0krbNmNbzzBworro76PWycFt5nR85WOqnlkYD78pijcQyhj0U9a8dF9FUWhDgZKHhuSVen4eE
	/lbNkRP0=
X-Received: by 2002:a05:693c:87c6:20b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-36f786b80a3mr3656191eec.11.1793978204009;
        Fri, 06 Nov 2026 07:16:44 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:43 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:40 +0000
Subject: [PATCH v14 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-sm7250-v14-5-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=1842;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=nrvB5zH4Ws6lN2/TYy6n3q0Zl+5LhXT2AF19e7i0mWw=;
 b=Bg26cDWip0StNiuXBGFDPJOYA7KHd30tYkjhqU1XZP27OEap2sAlfVjbtRada9ecFjGKKD0gE
 WxgM/5NqCakBw7UEG/sJYuE/yYsOf69BwoP7gnV/1MR0D6xdbLwbf3h
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Qualcomm SM7250 features an asymmetric 6+2 core topology where the
Silver cluster consists of CPU 0 to CPU 5 and the Gold/Prime cluster
starts at logical CPU 6.

Add the SoC match data defining the CPU-to-node mapping (CPU 0 to
LMH_CLUSTER0_NODE_ID, and CPU 6 to LMH_CLUSTER1_NODE_ID), and register
the "qcom,sm7250-lmh" compatible string so both LMh cluster instances
can probe and register their respective DCVSh interrupt domains.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index e160ac477..d3e6084e9 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -110,12 +110,22 @@ static const struct lmh_soc_map sdm845_map[] = {
 	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
 };
 
+static const struct lmh_soc_map sm7250_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 6, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
 static const struct lmh_soc_data sdm845_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
 	.flags = LMH_ENABLE_ALGOS,
 };
 
+static const struct lmh_soc_data sm7250_data = {
+	.map = sm7250_map,
+	.num_nodes = ARRAY_SIZE(sm7250_map),
+};
+
 static const struct lmh_soc_data sm8150_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
@@ -124,6 +134,7 @@ static const struct lmh_soc_data sm8150_data = {
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm7250-lmh", .data = &sm7250_data },
 	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };

-- 
2.43.0

