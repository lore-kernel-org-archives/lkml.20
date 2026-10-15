Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63E518129
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058182; cv=none; b=c7N0nlKxbNEQJL9BdcnHmRKgJ4x57BuJMNLW5hpqya+LYs6Do++1B/EA+6fRi5OpeNqnfhF5bGJNJKMEoCLU4ITbpgIKxzlmWq2Tyr+yLJ/pKjjTQghRKn71dTxmMrVrOLfQE+b5NVzMMmwaS11oFR/gc73rmNoVyWkwPwqbfcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058182; c=relaxed/simple;
	bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+75CdJUjUi4lVQkhmp7F/0IOHxx5nYPCLpVzMy38p2wDx8W67ZocWzqGU9NY7gyLflTe06Lbm8tOMwYjj1OjQp9ngnWlpih9D6xJOqSwJz1ZaFgPb5ElOlCOJz5UJCWZFfGCLBAeVlRBQNKRe7ZkrS+wnMxlxkvYHNq6eIo53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETHsZN1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLYO/FXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETHsZN1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLYO/FXD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTQR2809293
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=; b=ETHsZN1Ob0Wfk/Q5
	1JsHMXbn2Ob49GRZmn+Yg2nCWAzR0J9Vnu77a2Q1m+kSfPNaYUGrT8CSngAUA/3j
	YeIa47ba8qMyW4sRRx9HcaJHAJztba3lgPgHW6zBhCLt+9SsB5SWYtggi5uNwPLt
	3DKNINqjMxBgDaMMsHdEmHzf8/MybxKu4jAKmqoA5UsjJTFSh4X2cs3Q7kLyTHv/
	7t1M1kUe3sZbjT/29cqth8K4CsCMEZNr79tokVnJgdykHmaAI4hNYGnYpped2XmU
	4BFS7hnmD75PXgTXSU5JZvTTOmIeCl5U8eM+m6zxhWJ8XREgMmmpbD1oU5b80xke
	06y4qw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sxma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-155a75f91e1so1405081c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058178; x=1792662978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=XLYO/FXDEuGwNYDFfrAXw5F/ppqeKksq7GZjvbZJtc3WtX5wSYDNjcv1aHaNnMeJTJ
         SgDtTlg32SEwoWjAItH1I1hgCjaorS2kZdxbWCdPICl51FzxfhQNaAp1fBQA4kyJzmop
         q37Jt9JxWeibsjoLBbeQOtyKKeFmqwj6KML4HFlGGvn4FxvaSbqZ8vfQQ3mIlvIt+a9K
         iXSJWpL12cewtb5BEQZlFVOsdWPpzgxaoReU1k1w+/tKmjFbDh8Srs7Sk15pw8ASRuD5
         lYu6nzwqSzzs40f8ly+AUBPr7MMXdHp2uNBxO99pYR3c9JMeeZInXljXZjk3kt1B90hS
         wAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058178; x=1792662978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=H0170BugxVA9RAceGXf2UdQNzQRkWRG7Z5kSDWfmo5dmiUBn8wu3rJbnb4Aw3zmRGx
         of/VxVKPMsTLQKlw/LYPOPp42Q95eNPJ2gwdhAY3zR3gwRvXYbw4tAprWPX0cofnN15i
         //43y38wtF9BSV1DZzrlkEKS2md+teqLN7xWzv6WjBpjF6SMJepsJGGxEReEzHsKNvDY
         c6siUhhapC+bxfFnRgXI+GC9osqCrL96jk5rkBTvbfImwyj2bUWgTNxAQjfORkSV4w03
         oSDpXfIduQFMx7LKQP/gpmXOA919/NCANXq0o22BTE47bP/NBKGDsFCsuZn2DCkLcbtc
         VSkA==
X-Forwarded-Encrypted: i=1; AKwUvByubnLarwxvl5JtJ30KcE/ekJtbtsNqktJy7OiYAgG1Pf4xhXH8+sVIoTI7O1EpV9m4KYwggRoWjmg+gB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9yt1Dpr6FRbKek5/OOXWtO34RMkjJ3577Y88XfIdHpijo+GUh
	hEKXUK6LIlgrXeC//8a6W49hXx0J824ZLb9Fr/zOKB7kzAuDpv14ssbrB+j9sazVlDB32TENvq3
	L98xuZm4QErMFIbE8pgelliBoDoQ89l4eCucH9m5MwyWqPTs9CDlVxrCddCAqXG4l8gs=
X-Gm-Gg: AYBFou2kSHxCK4uDhWiwPep/yhnnKxO/y6Z/ywqwUmLlCiFyTde2za+Z0HYdse+zUEr
	wdHTaqVT7xDuszBU0uTpvNX9JlxWgBj5JV/k8o6ah207JZBVkBt1p6WRO1vd/gs/Np0HGC/QYte
	jfTkEMZxCMkV8bGPLLBp4EsIIe6zsIF7B8f0NbVo4nhZ8GFawpxRv9lqup+YBZiABxL9y95aFft
	DA/B/9cL7jJQVhrE/X4jDqkuL+FI/tlArO9solN+Y/BIO/u6wLaprSzdfIEUgCq5VXXLEl++BfY
	eRspyCe6ca97gA0ysvxGu13B0ESxhGIuhgBAxJLR577pch6fag4Uf2IjFODyNDK+DUJrOgYj5CQ
	8fsqCljACtE5K31kluZDlPdKOfyz6
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143301c88.20.1792058177732;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143254c88.20.1792058177099;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:16 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:24 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster
 low power mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-8-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=846;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
 b=DOguxFdDz8eXRwGTpwXmM914l69U245h6uQPMgNmIWIAFEd+ABsBGuwQIW21R3pvV2Ov9j9xI
 kT3ddKmka8EDL7zEPOGqasjxQb8I6e3QFrxqvgEBADuzNKOnUk8j7Gt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a342 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SQDDdHR85c743OeLlmwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4g5o1TeA7XiM
 J5y/x85sOTR46a1qHj8Zq+ITwGmW//Jx834mivDUPvBDcdqaZbKB8faPHrmn6we+wEQKFXSOSb4
 6sdDPac2MX6K9NdnIJ7AkRe7o1F0XJMfU7TwqmhA3Vw/iPNEamwJwVLSge5fgxiBVvobFHI/MOB
 YG41RMhn/v/lIU5Rl2LfNryZHMJTeWf7t4p8Df9Dp3qg30jFoVDHTMPg1M/WAqdDwTOT0PMn2AK
 6VMomdV3caYUmPftd8lKg7P+/Bm1KG/eCXRey3GfCm6XuXjRnASxAg49dOLKZBsvOhrEqn3Vfq6
 HwGJGVdWE8zM9qn6vecPFDH2LW/RtRmyiAIfRLDOwjjpcK9H0tv3qaIh58BcKZFPv+iRpJfErSo
 rfHpxhm85+J/KHeeTv4jCVgRjFqqHqfF2PmZJhBTQ8xzaBD0N/1mJIC2/X/OUyLeQXkoziguP8e
 p3nlkjIZ/hCH8veIDeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXzT1hKHLSnT+3
 Pb5/0Pozpv/d4r0UWwdJ6fEtCi9gu6zFKyQbuwvaeA8LEaqry8ZmsTxH8oxIiKGkHlE+zVJZX1K
 C0jD1QwIhleiLCLN7k2PAv/oWfJNYOI=
X-Proofpoint-GUID: HDfQ5kr-tKvLzjJyHGjQrxzeB25AyC3J
X-Proofpoint-ORIG-GUID: HDfQ5kr-tKvLzjJyHGjQrxzeB25AyC3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

After the recent refactoring of MPM driver to handle RPM notification
under CPU_PM callback, the CPU cluster low power mode works fine for this
board.

Enable CPU cluster low power mode by not deleting the cluster_pd power
domain node.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index da46e9d6552801631e668f7a43f5ae1c27639fd4..73c53af3eefd31c6b551f83f7675018d502f23e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -244,8 +244,6 @@ &cpu_pd3 {
 	/delete-property/ power-domains;
 };
 
-/delete-node/ &cluster_pd;
-
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.34.1

