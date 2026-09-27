Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29803F1AD7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515801; cv=none; b=WtIcPq1kQldZ7WMrvl55/hLXidKZX0F0hj4FNrndcusVj7RZ7Ld76Ukjp1uAiezh09kIijV62BAnClIoLAdykLSyUAqhcHBZcLgLEAJdIy1FlKtBjkyxrUBJiS2ML2mXXuknTWrrx9lQgtTCj15Euw1MdAkk+7CIjo6xSZyHaTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515801; c=relaxed/simple;
	bh=VB1fq1RKiKGVJL/jXTuCtxqg6mIar30rpelwiVPPn4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWERljr6YtZacf/5AwacbpvEZZKC2z3VmNFe1SiJ/da0f/qekT9IdQodABI0paws9PZV4Ir83FQBK8w8Qa1ntE0bJPVILnYva3UPaw0f0Ugo5J2yVfsBA1DSQpY+05+WNNXKIBWTV8Zo+99Vq1NQgkaVDwD4Z2YoQ4pLEEpwS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mr/6PVM2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHT+V+j5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mr/6PVM2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHT+V+j5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R4JVUX1852733
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zd8H7pUQjwRPH2i35MnsVti9s3z6U0qbD41nLQ6bk4=; b=mr/6PVM2AsQHfIhB
	CokQjnwUAqwZFsbpIIcjJtaisWCK3U6Di37+egJkMX+DeHyQTG+C45i2BpAMsHo0
	fw41r7Rde/1/WIegLYAmPBJUidUJOEyGmZB0ZTz6jmBSpBAZxQQoKyPwtdUKqZ+m
	16HdjQ+PCFTMb6tVnCk/Mego1MMbc4imHMB/Ngci+hmhoWf/faKE/WyaNSwfXl2r
	hexs0a4gZq9dqJ5evys3NQ1JIuOy/D5XVCe1Tb+xpTv6BfLN/rj4CFW/RG+LHu+r
	vAGi2t3914/VmnUmIwnSiHlOv4e/Nb6O1v2eyku/AXcRJ5JxIol+AUNC3Gm/npcL
	xFZOww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx64uu5t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:29:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso484560785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790515797; x=1791120597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zd8H7pUQjwRPH2i35MnsVti9s3z6U0qbD41nLQ6bk4=;
        b=fHT+V+j5QTlTSoX11lM/RY6il3BTAvnGchK5fybRyDjJpSAtcK/X9fvBhfmS0Nl/aK
         C5KRqQfDNSQZ4tudBhosrTw2LnlTVFdEw0O7tzPyc3Oqs1R40wCPuCsnj55ex/tHKxdD
         sdXIfgf9frJSVpNpoMtCmIuxde8EUenK8sNikqlFpc2RSPjvq/6TFMHWYZ+5iFkdioCZ
         LWdno0/IhjIhVb97DyXAc3bHM6vfHkQhw8ZqOebtV/Pp25FOXATXYTguxfwp/AlSoGN5
         rXmqNdzYb1vjIw/5udC1hl3VfvovGtprxYi4YXU15jJjWQvvQgijOJLKxPyR+6eLopUb
         IsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515797; x=1791120597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zd8H7pUQjwRPH2i35MnsVti9s3z6U0qbD41nLQ6bk4=;
        b=h7/rjS1dQqz+tRFNavCLfrZbl/xj6Y8iuR8aUI83qNQP4JgLo48hKc3NKuWZgDn4Dz
         ON4zs7bjyCZvVhcsOl5Qo0QOn5DB+0L4OIYJBlAmgJ9kuUaII/gRFojfhkIGqv7JW/Xs
         RC4geBtXMj1DZnNYb03h+RwCJoZ+AAqJ7VQQqaLCWOTi9tMJ27I+kkDrOmmPx7p72YKq
         KQe5tg0BPwxD+1IHr/jBzqeFPHGR2h2qZSXkHh8GAncY5ORW/k6CGXORyxd8Y9V0Cf2y
         yeJfuBwDNiEAxZQXkuLxEfKpTGQBkEt10X002TaUzYKNlNin1uyYb3/uhw4Sv2U9nBDZ
         T/gw==
X-Forwarded-Encrypted: i=1; AKwUvBxvTNu4H8Jp7GGN7D4YdxDtBPMIjcUgSX5bQbgETU3y7W+57hWkkSyZYwyqk8kwJwGuXzV28cBWSuiXeBw=@vger.kernel.org
X-Gm-Message-State: AFuF++nKyfZu/Kd65G483fQp5aaHfil/oCMfy07D4+ykNapci5voZHkx
	sXT4lS5mU2dNNeCI87Ao2yzi9VBbzOYIUn6NQD/mxkzBKgBwka485ijtv8+ijmcGsTRZf+pbNC8
	33Wwb0T/JGV2rZs2PO8taSqNST+2SndOUEqA5+1jS1QjTvCBSxOs7Gw/w7F817dtWmDQ=
X-Gm-Gg: AYBFou0RQueBdpL6PtXKjjlZKXVvYissdEHa2b5DTc8RfrhpyyXr2hHsiUms/GGOQDo
	2hOkeY2Fx6WvHPbRgxNHw50abDRJOPUrXFNcWgpIY36Zjl5x+DwnqsqTSixCMKUlA0BBq8CTMvR
	6lMEU+gnqTrAPvVrrCFft2co0UTvc4v9TEO2SRQCVBNe4dbkx1h43y2zfHGsHUhd9mJZrc3CmWZ
	LQ6EXdqwcf5kTO0VKwIIH+dsfwiu6wURjFY9iNmOLr0Gs3tS38KnJOc9HaeVm/eA6mB2g6k05tv
	akSvfbz5lmEHBzepwDarHkPjqKKqL3VCfRlpGN3DFvSRKdSDXma3wsjG0YBF7ZBy1VU25LOP/Cd
	qm3imZWcFL02p/OjIy/6AGXvc8gPmgua3VKYsw9BZKNx3aMnb06YfaJSD/wph6hktZGQBOYliU7
	+bzAEn6J72hBL+Myj7VOwCIARlnFVqDBCDq0N7LnUs6s+MOEk3d0Q=
X-Received: by 2002:a05:620a:172a:b0:93c:23c0:c2b8 with SMTP id af79cd13be357-93c43b5bb4dmr1541096285a.7.1790515796917;
        Sun, 27 Sep 2026 06:29:56 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93c:23c0:c2b8 with SMTP id af79cd13be357-93c43b5bb4dmr1541091385a.7.1790515796413;
        Sun, 27 Sep 2026 06:29:56 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm94636745e9.15.2026.09.27.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:29:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 15:29:51 +0200
Subject: [PATCH v5 2/5] i2c: qcom-cci: Support per-mode CCI clock rates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-cci-clk-fix-v5-2-4cd498559ae5@oss.qualcomm.com>
References: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
In-Reply-To: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX7RlvZvm6n5dW
 L/AZecJ7Uv6rJmHaDJLapgIFBe6d2q1pPaQmKQxN8sL/WA4xowKkNsUeFvkFPCzQUq5vtlTGtGI
 1QimcomQcUOqCLOk9X/THCT7K1XGtck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfXxmzR2RGw05XS
 jVNEwzNME2oCdrBnFTYflG8ZIlVTWBTuMRX24NjZd92pscj+UJjnZqNbWwL/QF+QtEhY9QFpjLS
 cZxDHvpryikOI4HlTv5h+NQPr3+oCZh7Ig9GqwsxUeH0ka8HzJbktUh20X3jNKRJJfwOlo2yTW5
 +LXxlKJby5KaheiOfLm66N+7OOZoJM4rcgWsbf4VioI4FHlrPP8fJDQO/FQmuoQMXLK2iunyeS/
 eXoJg6cCsUhlHzfPqydULfCaZRSZR2fxienhf3krXiA1LiV03TxrzLbqpwK0+Vk57jM7nq7qegb
 6Uozyr/Rv7gk+pQnWCZb7wPAWzyTfLqdn/eKSRzuxRP5JWiVEbZBOjNPdrER1VJ6ZhTi+1YIZBT
 UJUfhYlJAC2/mC4lteiBDKQ95xtwPC6c1M0Wz88S7AvvbFNmpWMa3//nZspNnl5cNjwVEMYiebF
 jCUHVFlqGEB74WjYcbw==
X-Proofpoint-ORIG-GUID: dPugRYZaV7PWj64lJEi0bknxxYaRs97s
X-Authority-Analysis: v=2.4 cv=E6xYNqdl c=1 sm=1 tr=0 ts=6ab91a55 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xxoTSpZZo30Qa_5IT24A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dPugRYZaV7PWj64lJEi0bknxxYaRs97s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270053

The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
clock ticks and are only valid at the specific CCI clock rate they were
calibrated for. Different I2C modes may be calibrated for different
rates, and the single CCI clock is shared by all masters.

Turn the timing table into a two-dimensional [rate][mode] matrix so a
given rate can carry timing sets for each mode, and select the entry
matching the currently running clock rate at init time. The existing
per-variant values are moved under their calibrated rate (19.2 MHz for
v1/v1.5, 37.5 MHz for v2), no timing values are changed.

At this stage the driver only validates the running rate against the
table, the timings are only valid at the exact rate they were calibrated
for, so if the current rate has no matching entry for a master's mode,
fail initialization rather than program incorrect timings. A following
patch actively enforces the required rate so this becomes a safety net.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 74 +++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 0a216c4d08114f267c8441925e8811ca64f1a909..1092ce0371429ef64c7cc44cc23a42ba4c135af5 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -82,6 +82,13 @@ enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
 	I2C_MODE_FAST_PLUS,
+	NUM_I2C_MODES,
+};
+
+enum {
+	CCI_CLK_RATE_19_2MHZ,
+	CCI_CLK_RATE_37_5MHZ,
+	NUM_CCI_CLK_RATES,
 };
 
 enum cci_i2c_queue_t {
@@ -117,7 +124,7 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
-	struct hw_params params[3];
+	struct hw_params params[NUM_CCI_CLK_RATES][NUM_I2C_MODES];
 };
 
 struct cci {
@@ -127,6 +134,7 @@ struct cci {
 	const struct cci_data *data;
 	struct clk_bulk_data *clocks;
 	int nclocks;
+	struct clk *cci_clk;
 	struct cci_master master[NUM_MASTERS];
 };
 
@@ -225,7 +233,34 @@ static int cci_halt(struct cci *cci, u8 master_num)
 	return 0;
 }
 
-static void cci_init(struct cci *cci)
+static const unsigned long cci_clk_rates[NUM_CCI_CLK_RATES] = {
+	[CCI_CLK_RATE_19_2MHZ] = 19200000,
+	[CCI_CLK_RATE_37_5MHZ] = 37500000,
+};
+
+static int cci_clk_rate_idx(unsigned long rate)
+{
+	int i;
+
+	for (i = 0; i < NUM_CCI_CLK_RATES; i++)
+		if (cci_clk_rates[i] == rate)
+			return i;
+
+	return -EINVAL;
+}
+
+static const struct hw_params *cci_get_hw_params(struct cci *cci, int mode)
+{
+	unsigned long rate = clk_get_rate(cci->cci_clk);
+	int ri = cci_clk_rate_idx(rate);
+
+	if (ri >= 0 && cci->data->params[ri][mode].thigh)
+		return &cci->data->params[ri][mode];
+
+	return NULL;
+}
+
+static int cci_init(struct cci *cci)
 {
 	u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
 			CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
@@ -249,7 +284,12 @@ static void cci_init(struct cci *cci)
 		if (!cci->master[i].cci)
 			continue;
 
-		hw = &cci->data->params[mode];
+		hw = cci_get_hw_params(cci, mode);
+		if (!hw) {
+			dev_err(cci->dev, "no timing for mode %d at CCI clock %lu Hz\n",
+				mode, clk_get_rate(cci->cci_clk));
+			return -EOPNOTSUPP;
+		}
 
 		val = hw->thigh << 16 | hw->tlow;
 		writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));
@@ -266,6 +306,8 @@ static void cci_init(struct cci *cci)
 		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
 	}
+
+	return 0;
 }
 
 static int cci_reset(struct cci *cci)
@@ -283,9 +325,7 @@ static int cci_reset(struct cci *cci)
 		return -ETIMEDOUT;
 	}
 
-	cci_init(cci);
-
-	return 0;
+	return cci_init(cci);
 }
 
 static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
@@ -488,8 +528,7 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	if (ret)
 		return ret;
 
-	cci_init(cci);
-	return 0;
+	return cci_init(cci);
 }
 
 static const struct dev_pm_ops qcom_cci_pm = {
@@ -570,6 +609,11 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
 	cci->nclocks = ret;
 
+	cci->cci_clk = devm_clk_get(dev, "cci");
+	if (IS_ERR(cci->cci_clk))
+		return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
+				     "failed to get CCI clock\n");
+
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
@@ -652,7 +696,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
 		.tsu_sto = 28,
@@ -664,7 +708,7 @@ static const struct cci_data cci_v1_data = {
 		.trdhld = 6,
 		.tsp = 1
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
 		.thigh = 20,
 		.tlow = 28,
 		.tsu_sto = 21,
@@ -685,7 +729,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
 		.tsu_sto = 28,
@@ -697,7 +741,7 @@ static const struct cci_data cci_v1_5_data = {
 		.trdhld = 6,
 		.tsp = 1
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
 		.thigh = 20,
 		.tlow = 28,
 		.tsu_sto = 21,
@@ -718,7 +762,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,
 		.tsu_sto = 204,
@@ -730,7 +774,7 @@ static const struct cci_data cci_v2_data = {
 		.trdhld = 6,
 		.tsp = 3
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
 		.thigh = 38,
 		.tlow = 56,
 		.tsu_sto = 40,
@@ -742,7 +786,7 @@ static const struct cci_data cci_v2_data = {
 		.trdhld = 6,
 		.tsp = 3
 	},
-	.params[I2C_MODE_FAST_PLUS] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] = {
 		.thigh = 16,
 		.tlow = 22,
 		.tsu_sto = 17,

-- 
2.34.1

