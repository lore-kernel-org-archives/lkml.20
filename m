Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9E852845E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058186; cv=none; b=QVKR4n5KSrydO1zb+SYtAjmusJfUMgDzv7/tJhISCh8U/IMyCZ2sp5kQOPmz4oQQ0GXI9oJ5sbBfrXrM/JgXgJmRmte5jXU5PtOMu09dtiOdlb3/hj+M6n4dqZzh3I94OGRnzrp31giUhp2BalB4qlH/ve/fo/wsv7ALS5aAa/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058186; c=relaxed/simple;
	bh=xzu473Y7V24ggj3le/TfoZWNsp/SkGbTiLRw8aI+628=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vFgC2AtPNdFymzn17En09u6r1FAhS1FgEk/j1RLw0cAD52V1AL8Yau9bB7FEpgkHlCiODdd+NN47A5wrEi9VLbrOFfMQulLuQNU2MhC89D9++Tv6Q0xHLxKQ2eYXmiV958q+Bu+hIpso0T/rbpPc7uE2t1R/xFgvtlFeQjNs8Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HoW3znpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyO4rwqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HoW3znpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyO4rwqP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kH2Q1507267
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=; b=HoW3znptfsV8eKyQ
	3QCkwfF61sW0FHl7f8719XRyRCCQMyDnDSouGTBTJTSlO/jEEu3kQ2lqrbM/ZCSB
	3REObE5HTyZQpdzN7M6KoP81quM7ZXGOYNLxGhEybkUC6PCPIz1ARwzD//TrNx31
	YivnFTrWdxSksODz2YkzxqwsE40aqpB0zJODVKaPhFfRCUW7zvfiYGl93niQtNFp
	OJIpfqvTGBb6K3zNPINGzfwTL7NWbGN5pvxUQ3msev8COPW60pq0esQsAIB2ylOi
	bOVyYq6KzXzov8lHmPEQ0m0EpUVApah+XkB05S10QXQ/6V2C5SAuhuY5YwM7y/Qb
	aeb37g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bpmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:56:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so2863839eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058184; x=1792662984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=;
        b=JyO4rwqPNNesPVfETv1rFiFgA9WLe6IHuVVna7tU1QiaVlKtxwaD/n+EtMeIKgWJ7U
         NC9/WnsEf7UMKnmt/U7JANhymFVXeBXEG5iuDvVvfjnc6fSqcafBJNokmRFWMpuIw1sY
         GX9NRiKnq+1raXh8PbbyKGsGDlvWGXfvgUAa0r59jABSA6cKjHvcvT2zIBKXdqYNhUAL
         hl8IMpM72F7mSFrKTeuNaWTMpz3a1/30yNT0lKQAKoBLGxxI/40iEMeyAwOLofpBbdap
         ZLyEHmd6pOAcSOp03k7ne3X1zkMFhhOp3uj0pzFhrvbXtXCsiJOKLM35s+7xoXCkymV+
         cdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058184; x=1792662984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQQ8nviSaj+ci/GGMep8gLm46uLdgX7t+TFOvWm4SAc=;
        b=T41mMQjNzuR4w97ZU9R3evVtQwgtH7QmWueNe7YOJJuz5b8cCtrLNcCccb6XR9DJA1
         Bad/DQ0fwFqxM7GNxlv37C+mCoWKuk6RlyLczS5Y8to/MeRCApTEEuUWsJNy/w5cu4aW
         A/2M4yJAImCj4ixj4V7ZpeX1JGWwnDDonsUTc5EUiU34qKG3xgKfqEZopsYNl7c5AOtc
         f84Jitz49T8rfOA5j6g417u9ailbDK8u9md6Uav6x7lkuWnkDrmNZM57g6EUAJg7rZDi
         xC9Wbz7nHSALKhCwi3L7TIcrHOPr0tSY32UZAp2ne41G7csL5wnT1h1G3yuCv9RhVuHS
         I08A==
X-Forwarded-Encrypted: i=1; AKwUvBy10Hv5RS3UBFYDL+Fa7NvPxqUUVMknOiLP38sMNS/CuxJ9lbQfxJSQNR/G42r4adFWxwtZMqwPPzgInz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIghNZNcECfWwLl9PpHJfFmH6B1qCORieaB/XushVmKxPBniz2R
	e1kCdi5YRT7+zEtpVygghiZnA7bC5DBqUyHi/xNM3o4rgAPTDG4dtEM1a8A/lQjzAHe/3ZvzbWF
	tKGzGBtpNmZcVZeRkjiUm/d2dzjYXeMJBMTdpfv2vug4ErSs5FEXpgLS/x0XClBTCml0=
X-Gm-Gg: AYBFou0B4ACo66J01RC9tjPeEctOrEw/IB7WVmlS1LopolkffMkNwsLG6dnXacZfKku
	hXAQz2mrqwPV+D3By38koTue1Qx3TVb/ax0aeda4s0Pu7u379mUoDukdIengtgf5BQ4KlAdWLDJ
	pNrRJTbfrL8X7D+SMR8WmreJRuTxK1EMP+q21jiIL4VOpRkAuYxslqI8wM5KAC0sH2psiJEXVw/
	5oBwCKPtKe2F6flsJyrTz29u2MSjb70e+Ictm8L8RBY9I6/pHMKMCFxpIoGq2IP8b9P1D1YbZJF
	fABY65b93D+OahM+Y8UioljhQyweuX1opjO1imOuCoIdGL0juFyenmQkborqTgFwyrisoBKwYFp
	1nw/FkvRhzYZty64c5D5jk242H3re
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr23126189c88.6.1792058183442;
        Thu, 15 Oct 2026 02:56:23 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:136:c443:80e5 with SMTP id a92af1059eb24-16a586a31b5mr23126148c88.6.1792058182858;
        Thu, 15 Oct 2026 02:56:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:25 +0530
Subject: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1137;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=xzu473Y7V24ggj3le/TfoZWNsp/SkGbTiLRw8aI+628=;
 b=ObOaLXXfjGaKBaGzk5dvoHlmZEcF7kbr+L5I8bDEc+YKLttWH9KjHTmjJ9jEEInESNrKqR7u8
 zHBiWoG8WH4B3JMd+PazXFt2w88qQYlhWJK5ibhNPVGoUMWrxdw15/G
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0a348 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5xU5tZsdfkseTblZoQMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: qwa5nONKD13FAcpoEblqjHLpq0xIfHkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX3yY/SSz8RUOZ
 arwN3IBszcOyqVvRHqtHkhCb4h0st5BbMzCg5+cVVcRMfQE41FMDYIa4kE24rNzMZ59jh2TAWWl
 o7zV5AReYFYU3OdxpRx+nmqznCY+1enL/H6rCAd6g1GUJCUTH+4OQCcPbcQVi6DjMgvY+FBAwY2
 Kmy8IZS44QmX5xdcR3PWVXhg1vCSUomjGGj8Sph57O+ubUbUfNoUNMvadOSXlG30/EsUb3ZiJ5L
 vbAfq/UBqFmwiPVxsif5o4CVBorVnLrG0mu3/5QWw8vgkBlrsXfwQhakdiq1cLG8k/sxnaXIr6l
 ulImAQNoa0lh5/fw/wWIU2MtudsNR5sMBRjtvsHMZ3qDx03SWB2v0ukDKCdLwQtwg6PepgDD+Nc
 nW3aJ5WYa6e9Kq0TkIr/Pa3CMzbOXRjbRRUVREiqCzH4zr1CVUv165EuETZPMlxlxktMs+EUzlD
 FyrnW0BZ7VKNZJKu14w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXyQTX1oA0GrQR
 0dyU8H9cOZit004PfKzwdfj6rqW7IgJQAR+3DFkIshw7gk4x1Z7sf5Wlw8yGJ9FFwY/OhB6QuNb
 DmJJApq11AwoMug1bKVMFDFfBnMuMjc=
X-Proofpoint-ORIG-GUID: qwa5nONKD13FAcpoEblqjHLpq0xIfHkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index df4a7181ff80da0b75287bf4b96f82facb152b46..bb30bab28c24c02f4619a4dffd7132973356236c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -234,7 +234,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_apss_off>;
 		};
 	};
@@ -310,7 +309,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1

