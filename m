Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C1479860
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246489; cv=none; b=chRI8PuAFaiA5NJSlvGUFB9TmWBGu1xqgmtwwD/quu1JUsUjyofd/Nt0B82hHXGy6LNWOCwy9exbfpPg2863yqN7kkauLiNGq0gQwmgZK2SNGYLEumYVrlMctuHaM0mRvqDecWE01TTPylWXycx0HPAJTzzdmhjrtvuIOce1Imw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246489; c=relaxed/simple;
	bh=8HzxPS7FvDZ+M+LS3tklfzFn4EZhdMtCAvEsfyhCM74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GR00NXcjQKsETsaTMKKXn2E2tmpU14C7tV+EGfhoyhqhfZFX0QqDdbmygnUK80OQIxHbBWVIY5wLSS6/TqRVUirz9C+gIc64TBBSxlOrmGB23xiNqRI6Bden92EKv5s9yOtknJZT/srCS+vnhRaTwkymgQWTSdotRF3R6sT4zlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWpTyBHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF3pNkXy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWpTyBHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF3pNkXy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1SNb2858044
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=; b=bWpTyBHg7X6syvcD
	zVY0QC5ucHZaQP5F+eBPVYFT99OWW3T31hnDYAiXYzgwn73VaztF0oxsnknYKVmT
	GGTmkMVuUCuZhaIA9htDlE2wNl40wB8uAq+Q3u+Kd2bG9rn1nfOb9PrnARH+mBO+
	2I4oYKAm3Epl6MJhrUGhf03Q0PzPNMFjbXpPC+6lXNX0GITq0upmWE8JpKdB5qSe
	TS2n+T7Iqq+AkHB5zsR47V0lgs8+fYQZNZ898K7W5OkMfviENayHII7Qhb5yeq39
	LDe5kobYjYDonamnkV0qeRjlcwYmHYJDJlAanWHF86DhHr75G9C4ripI8sWpSMEV
	CJLYlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag59v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c292c2fc1so310785185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246485; x=1790851285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=;
        b=fF3pNkXy4l+5IcQ5wsYebm5r6jhuvvxMDcVqw45bhnh+ik5CY68GYdFcvpyEXXID26
         z2jYtMyl4iyI9iYaVOF/uTNUggO0821IvKRAwWNE+nagobKK0pX/hVywOEhlKXmJH6+V
         xJ/d3QC5fUSgJ05CqvR6UhVEvJbm9w7MdJ+a8xcQunoRnju3Jemdkk2QmXb/iHydih1Z
         8ZvL4Y9vVwecZ9cMTkB0Dr8JtIOuI3RfLjso5KtOp7I0ovqmf9HmGvmBJQ5mvl68GnT3
         39qdKf+5LTV/KqWBxY0ATBtcAotLvMTKJtLC3jBsF5nSrOPI5M7oroqfSUS4G8xC++dd
         wfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246485; x=1790851285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tN4gX89E0jlWF7kOOnp0F0vaWCM9BWDA8HEf/snB4A=;
        b=zB2z7bFDmjgTaAEAAWlVGrdpsI/lU1yAFKPyhYoi/7AAnUnerWDW34yj+1aIklS7FS
         QnxXnuqdHYaGFFfHW2i7xWFfkaOjTLWaflPDVa8s6JzOyX0Ub2m4sj1h4mZBwP9SIVh5
         ek/VoA/0qszEaYb8IfFVuYvhf+pG+CfwyiUhJbLvU47zhCDxWMp19SGxl0WOoR1pyws4
         eE5PWhCfXwekbLQuAHNz883OiHsnNKc2adFbwsLxhOti+I/8pmTu461nnyQFdMVhXFsn
         YHjBimkWU/cCA7MeQJNAob5hfYK4o2IHhcZ0/Mf2DfwpteS+0HCKxZlDeRuQAPcTUS2g
         z2Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzMGig0y4osjlOCQ/EyO30KQEPZ2h8mDw2nDAJu1ST7GiS5Bl6t7cMcMNxZz+7f3j8O7PUpMpmwBI91OC4=@vger.kernel.org
X-Gm-Message-State: AFuF++kuXJnsA5kmIGFw0HWNNkZR9NpF9hPjTROyejLJm7ty33co12ZL
	lW++U2jVmrw9fi2yZXv53Rnm2i2C1wQjxDoXn3EXsqmLHUk8ZGasl4r10cqHQjMJ213uuzk+OUr
	RK/2tONZjqVXknR6nMgynaNWwjc1kIDjqhxtZPM5ut++8hSmNkEjZtPJJGUaUP+09Pzhx5vqKhX
	M=
X-Gm-Gg: AYBFou1OURLAfJMRJCGwgSIC6y8ACwfM2iCuAD8znL3W9QFTpglQC+IwkptfUaYvmbo
	D0F+wnUgFgWAzG2q/oS+s48Hkpl90W/kr/m7tHFvg8xOS+VQe8F3+ZlODLMb/kfGnljW6S29BZu
	zoBri067KFXiNehqYQl7saLk5kiofxtxgDX5C5BzsYLF0VwZ4lWUAfXqP0au/CLs6ClX15LdrGX
	hZ8dZ+AAFq2jYSytpCSBq4mywYSEOPK+SI4pHvzZhdMQv6XH/FPr4K5yPOYYo3wIuW7GcXb0J1j
	TvuAQ376OdlCcOjr5StHz13Mdnwg6+3ElfMntOlxBpA7O8aJ8vHZROzIpTvv59VvCmSR6QvfCwu
	gHnkqOrQW
X-Received: by 2002:a05:620a:2b81:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93c362b968amr194924585a.21.1790246484791;
        Thu, 24 Sep 2026 03:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93c362b968amr194905885a.21.1790246479892;
        Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:42 +0300
Subject: [PATCH v5 26/42] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-26-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HzxPS7FvDZ+M+LS3tklfzFn4EZhdMtCAvEsfyhCM74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3zTqaaLIR6IS+G8pNzSXTJFeJZVyAyXD/cy
 vHiXvx9RTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98wAKCRAbX0TJAJUV
 VoiLD/9xwSzUyNT3uJPF4SPhh/GGQKrr4hG+Rm0WubE6MkehUtW54CQTTT2enl0XRCUhbWYksnC
 nRiHH6fRUNAtgyyWEC8u/9pir03bAKE6q6ZtJd2d2GuiLfBVSoyFkkI9rNJqu6CORGr1gxOCLEc
 pf1RD5EleMWfjpXGn2C1tc8+ORxH7zMii20a5uPbMg2AUw6bnc0Wr+76oA+ys9+uC89/gt3TK8G
 kzAUhxntJNRVfDJN1m6aQLv4EVeD0+rLC1MTqkHQyhi5H5BD7TK+5JbtJOqWie7PFFwPT90pwEy
 qIZlbT4YYhetEAHi20qjHDl57oGEkCXeuTLGg8J2vOQ8dtMTaUCN8x/HChNTKe8aaqtfoA1H/C1
 rTIX1fZ/8QqpDJe7Kw9THK1SoMQuzOha4u23fxrT8nyIBeMPAUSutCrdHTCdG9nC1iYETGRc8Ci
 Q9FEl+ybzG9yWcJdZ4FB30paV2pCIO7hBILCj9S56JnvK+XADUoD+lqNIZ4C0ecjPDIFXy8z2MC
 C1/VC9ZS9pI3/5rcMQkWsu516XZSvWWdxj8k+GiymAIFGJo7naJg/fpL6wbti6eF+fvJOyezGFR
 wFB0BWhOk6e+8iLMv6SQshnu1YyZhkAYUgYGSGooYU+3YBtvDj5ilCQZf3ryTzM+W1boWBOZ9f6
 FIQ9Ghg23TG6UEA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX91ioGj1UmTOO
 ddLj/pzdUqPDZapnGG2MMCWbDYKcrMuOseS8/7z6IrZW3un+EVt8IQrB14pFTHa5mSnRSw6oOgW
 rCgFV3qBBSOGoW4Pk22Llk5ZDndXWYmHBahUum8aT7Sho4JJ/ba/cO1LX1QtKH6jtcQO+TLd2Jd
 1PwoDUZTyi3wgdefNuS/GuSLOYijInLzoMLp6Ld/W8wHjFWzwjRdgClaSboByReqoN92LW/d8MV
 Ls7BbwseJbqXRYMO0R2MOq/6R2NvX477ytrS2w8gS3VW9OwjR1Wc45T/6GJg74kTNeaRV6dV7JJ
 4DluScu2O3kapBLaHNWFRjaVs4qgCf3Uambwh0ReqtYpbWCJl7StuqIn7VhiCHaonD33L5E0qgy
 idQyOxopyzM9G9sEItbw9+oSaIDsf+45TRDIwyO7X+e10wlHlPd2Iq3c2QSjAszn8PwGdpJbCZa
 RpbaWX/s159zKhP4LnQ==
X-Proofpoint-ORIG-GUID: Fk5hfTu80UR3pYQS359nT6qqBjpaJ5uM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2p+2/xm/ALiB
 ztfNZXkmjTJTU0OvkK1Qr9jp7p93JKaV1k5FZVY/oiFhqJYrT54I6eZKYmsaBWxthdeUHLI8qwh
 mISRp10Qv1smKxj6W7e/CQWLeGZy5So=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Fk5hfTu80UR3pYQS359nT6qqBjpaJ5uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index c08130218efe..14d44c51ca5d 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3196,6 +3196,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8750_match_table[] = {

-- 
2.54.0

