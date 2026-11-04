Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819830;
	b=JRaZmMhgXNPnKZpGCcM/JCW+bu9jM+MG694awEHxhVIqAbr+LTOjFkW/zrxLw6e6lvzR
	 ziN9KAlQDgwF0cxRkPbXY7s9wJXSe7wxzUufGVQyxlhomOk7GerGLyrUoPcxBLYQ7vhEr
	 YjTIUp2ysT6lB7zPryYEz6J3BI3kklLQWAuCROm2oP6dDoqP3bVip8TPUf2+hi9SpoD45
	 haU3IAsjhycMXZhukiGIatgGWI/p+pdYskDm4Ns1uLzLWyo8tZSKur+EmKu1AtXSx346O
	 MG1VoHH+dVV0HJFEoEKo5Tg5Srg3UCQPinDILsoNbiIE3m6eKVqdTqjmg1EWPjX3NFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
	b=BKwzGFY6G0IlmYOjCuLBrQDBgPud04J7Y/BmAlISccH5XQk5V+PhMr5rrjKy6QyLide6
	 REKzrpuHUq8zYUIEK8+n0mKloOTrhHOQUgOcb0SbsT2xfWzZa0B1BaMSc/GuoJuKhJ6MB
	 CjC2vzEuxM5aecdCvUoDUtIZUAu4gbGvZsHPyM1A68FFz+qJt1n+W6YnTzMvOGlFvzaDA
	 JNOFP3MpC+gcLeH/hSTSeKAkQEqyNyCSm3xqQjkpdgjgjRcpZm3m1Lf4xnyUor7+rOvrc
	 mzSjVPMkwyRwLFlbJ0cEkIMaoinN/P+pDCmoxBmAWHeQwvgEFJvSf3emljtaAxrs8Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TijPpIUi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOVFsvdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFCC606D83C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DFCC606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TijPpIUi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOVFsvdj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4H33hw3031130
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 19:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q6Q8RcSBFVR
	rz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=; b=TijPpIUipHRTivzHQAa3LgY0TBG
	qumqd//eRj/B/nSVcI+gZZ9IqR/xeY1TxzvlqcWPx9dVfg5A7X+Nx+ok3D/me3YR
	KtGGweQYr9QbgjLw+BiHzzzC87mm/d0TLnIgQS2buogj4wdkTi1NfuEzl1vEp7yz
	ZCFTrSjMAr+msbDis+h91oChYNefUZS8EZ7PkeCD+0aJKCfrTrchtmcxYb3KvoxC
	V9suguRh8bf1BGCFxg9CxhGNq3gE9kN6FBdXW7IwD6yeXDl6xo1URmXW7sQpL0L+
	NBpueReca568o7Smd1NV2z/guJrfXsGAr5mVtYCJZOAZDyPqhoxih0mMPkA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv0p4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:17:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac1e41c2aso301354e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793819828; x=1794424628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
        b=gOVFsvdjTZuA+ZtnUgBYLddtB70mCmBnGaozLg4wlrzY688te8MumcVnxz6FAwESmz
         /JObwGAx+wqo2z2H1NES8IJgrLSC/RMqGQijFqTyNpFXoxwq8z1n4WzFaRWy4UjHWlEU
         nK7ZVOeur4yMeDK3qlUpPpas1KOqkgy5XMnQwNL0X6/PDLiR0+lYIANusPG80pGagkYh
         vdFNU7yj1Rbe/c+GGTxHofKv+s6Z4jkb6hPzNF+WnuIdrVY9o/+aUdZVh9QN/nuc72JR
         kv3JNDG5f+eke9UotosYXbeLCPAqXswklT1JkACJVaLjTyvQwQZH/NUWZY6bxeT7EjLn
         /AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819828; x=1794424628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6Q8RcSBFVRrz2BiSaH6D2CZNS5o9OOMDyy4jDyfvdY=;
        b=qc0h5axeofGic0qF2KnWoxX6i5gX+72wN1OddqUlCOLDM8C0ulwRXPvoPLgCT+/1Yg
         +bsmZgu8PPNFJnrFmQWD+GJvJcfmgQD44PfwR5xmZfLdxP56NfHjmHgqVLvboBEw12JS
         98BYS2hRH8j17UF+nCmyNWIaGOVmviyvR7SS+qFRykHsnFhH1ecgOyxx+se1UBcQAGWv
         g4cmUJSRTyDpU7BstVxx7NxDx9UFRKYbhIB4Blln9TbUsfu390V1nYRMcfB95z/rU0fT
         SnLZspXT6C83d8/k3uN8jDPWCpBgAGNLWkHT+vQpx4h6DHszo8TOSYmelxw1VnnIu1hc
         vIrA==
X-Forwarded-Encrypted: i=1; AKwUvBwyTUz7ubsH3O9wDakIrxLmjOiLG1lca5zEKmSKVURSVJOGEawfuDsS1Emtt6d2oG1Yl3Cfmpi1M+7ySeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bfxcS7qxc9mRfpt3Dz6rf0h0Jf5YGctS3v3v8hRezni/R8jmu
	7+N1GUXswTqDDGd9a0m9R0WRS8uOCJUgoDdZ7jINFEE+dyn9pqoY2NPLhTAiNFe4xhvfZmwgRs7
	FTlZly5YOR9zRv2zQmwU5dGOClEKjm35rnuCBA9g26ZL483S0XZ3CtRCi8FDy67wHEzGRZwRJnI
	I=
X-Gm-Gg: AYBFou0mAzJaMgmHGX7qVJy2aegBacWWYcasrZhet0jBzTrXZz255xttineJjxCwP4d
	EBTeFMJ6MF5hkKcRXIUX1ziNLgd0AH9vdJXnLtGdbRkVVcw/R8VsBuHDXnudGw8Zi1oDDpTThr8
	9u+8lg3w0pXVcaga5077VanrQtHbs31Dzkq45qezPB+AtLBEZj3EIIZYCX7MAugf6u3TT0mhyLS
	6pAziv+wo//BhZ4AjdxUzYinfUISVAsFfbFN5UK6Sp7tJe2G1204NogoHSmcU6oGpUFb1imkJmg
	sLODRAExqDhG818GOz6ArYJY/qp1gbdqt4hp3OzLdKUAxhc7rzhngHEC01A9qdM1X9El+6bxpFY
	xbSfpsavMMBslOQXSmCQ4Q1/zmV/Dr6BYmb0IBfnvU+bbp+7vtFhGDhGNKJiHMw==
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr7257074e0c.14.1793819828363;
        Wed, 04 Nov 2026 11:17:08 -0800 (PST)
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr7257056e0c.14.1793819827888;
        Wed, 04 Nov 2026 11:17:07 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm51276405e9.1.2026.11.04.11.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:17:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins in gpio-ranges
Date: Wed,  4 Nov 2026 20:17:02 +0100
Message-ID: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jLLCPmPoP/h1cOKVCJRT+QUvRn14cXBvj0hDECNRi80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq64St0KwQdk10nNiuJu0IKXMwnN1GB3Co40RF8
 Vp7pFqppwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauuErQAKCRDBN2bmhouD
 18eQD/44SiaWNngb5Fnb2pwmnEgJQmyepIOcaFb3bq/kiHT9OXJIuMCQmADCo3gvdbS15/gKp0g
 yc6iJiEWhLfjC9RQX4MsPkHLi/QVTx1b6sv/7c3kpszmPAQX8yqJABpq11/Ne6eMcNBuEh9ITN9
 omwA2NpCM6C5+GgBxt6VjG9cEWjabpPUebHJA/JNb8sLf8AXtWI7X+6jqh/At0vwc8B93kGKV5y
 TqLB+lQEbi2LWUeBQlEu3CKKwAaNI1ALlj+6pZ0kDNf373AlXXXzPnUjbjqveyyWj7XK5bglSH2
 OX/5lRyHuAGNX7nNjcGqoljGsAZFf2pcK2xw9AfvP7llIZCTHAnmh28FbjNyUUxtWxb3dCViIZ+
 UjBT2f34nPZpg2KoKYWcj0gyNOubryFGCBm8tj8oUDU/qiEq6MiQwEz0LaR4enPDwYSk70/JJ1N
 Ryxu0c0npj14iIghha1DJogJ8Qu7FOOfSKiWHP2M9UsTNVyTO2zskaqb0bFXpj2baLVYOASTKHt
 I6mJImrGJG4+YtKJxcKLvhjf3+GiQKs1jX2EfxEp7lbRZv+489krwiBJUAsN6v4WCTINdiQ2X9c
 KQE6z9ApUjaGrAfytjT7/01Z1IdLzu8055Www/5a6CHinPMmnRl09e+dtDQH1PavDQP5FIc2i71 cVld2nHRj3ATfTw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aeb84b5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R5-cwpJYxvnsFHObl-YA:9
 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfX2nSGmlVqMB/Z
 EsLNnhUjKlOHJbrsu3rsa/lGIy89LPcrLh0iFYNoTJ+Px6rumAE8/OVUhFhmN+G13vnxgEA+3HM
 DQ759ha9Hn1pRlFx+mgZZhjfjZQ0evA=
X-Proofpoint-ORIG-GUID: 0tT6nL2xMTzol_0ShC-LHYMgA8oI6xEo
X-Proofpoint-GUID: 0tT6nL2xMTzol_0ShC-LHYMgA8oI6xEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NiBTYWx0ZWRfX+SoCkte1mEwn
 UPxWF8SxbrND0ZEWNPjryuoai4YtJa7bFQN8bWRZgRZs/JUdk3dM0GYGVqdFgywe1Wk+kenV1P/
 G91TDngsUEE+pvysNVi5BX54qiNChUvS36ZCwpj2KGHkWTublwoBLl3qgE/sN+p9fuRwHLf7SIU
 IAfdO2tQo/V8dnLqLr27o5wLsNl5Tz9uBj26rDL8XgC5Z1Oi0gdFX0w359VkMwRNdh6KLGR/rlB
 sDwxsznIUgM9ARecL15FBjSq1zoVCzLDuf1P5yXmBeYNZLkkfL+Kdyvk+atrER8+BbjaGXT3vhk
 gK6jx/DgR2ohOEVc2gyH5I8DpaPjS+dFN6W7geF2eKQBAre2HtPY/H1b+ff8dcinq36bMQJ+FJy
 eJ37Y8bwUhh8Im6eMPW5s8ES1rXh+pPGGUHf9TnukhKyGATKiMcgToPw5kFrCLItMso7VPBEsFW
 1vYinZjRzCLRFnGCXSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040076

TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
in gpio-ranges, representing the number of pins in pinctrl, should be
186 so the last pins can be configured in pinctrl.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..df7426134722 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3577,7 +3577,7 @@ tlmm: pinctrl@f100000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
-			gpio-ranges = <&tlmm 0 0 184>;
+			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
 			pcie0_default_state: pcie0-default-state {
-- 
2.53.0

