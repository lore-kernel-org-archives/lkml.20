Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B63E5A1F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875416; cv=none; b=qD9Xp7MZ9HQtA58cbmerlThpwXcTkPPXiodUFpWHJqm8gwmQNk+277Ozd2/UNE/VvqoRw1kKJkjIZSNZSM11wpFzz64GnBH/rYaUlcxcT/0xAZIif5fIEGTzRRuKaWfAsqLENvH4dvdUvF1Hc+iGuFQkP72cB+f0EpOoh2em8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875416; c=relaxed/simple;
	bh=uKLWTrcDR7c+0GER3Ovnt8iy0jidYHa0ZNUnMq1N7iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKjcTik2EaTjDu+wiXmdePn4huoLF8FXFAdTnNthy85+u92ixSyoIA1Nzdz2L4EkyWWMNhILRAwlVkOfIIQBiE36f6BiqdzvzWZnlWNTBAd4f9d6BMxGzlrmIrRdWMbmzQ0UrRkG9wXPH+t6uqwKQFZZTF5bV5YZlB6dOvSRd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwIUozhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDW8Ckxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwIUozhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDW8Ckxi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21CBi3054806
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=; b=nwIUozhnlodgFMfQ
	fTrYp4goMiGU85bztPsWLGH/E8v2BkfnbUCRm3z7mTmbHApk96JFSSlODnC3HT0K
	v6T+VezMNnkAS48ETfQcnlQ8sq4eTJJ9xUsGKXBiE08KnXrwE2Yildj+YyISnzo1
	2ETyBIGO1GJLm2OEE5W6+R7bTPvqJQJHreswJob0ZiaInHtYOSJ7h68GNWDhgjZ2
	SYZY0znCcoFKqc/YALmwJpXtRxLxJsKwDdX5ziInM6D0HZ2DHhaDEg47a+Zx6hb7
	KCyJUw5L9Du13+rgbVSiHpa14tJ5P0bMw/SOBtj390Ph3zHcdgoH26USG91DuE6V
	GBrmlw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aetxw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6912956eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875413; x=1792480213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=TDW8Ckxi7B1ufv3nu/q7bjbX0y+CLiE+8D5ujcHyWS39SfkzKOg0L0qiQtKcpPzOOK
         z+jxIcnWyfgQi7AkOXPx/JzcsGQ71/yeIwJhHv7MTdElx17bsDTvgQFLnYOvJo8CjYtR
         u4dDZxpfDS4ZCew/RvGcAEQvGV/i4/XbH4Ew9qQUhkL5rj/J4lX5w/qnTghZXA6siGoV
         P8H/T9tKctlJmQXehPiAnBh92vIKs4kgU2Y683ikTVLWAkuzeqRSnmwAlaP/wqEregtJ
         n5RX69yVp99lHIK2vU6OhYT0U/fVwum4N/V7TM4hpeeHf+8ANLF9VzEWNMewA9tbtuoS
         KDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875413; x=1792480213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=gfKUzt3HHnvm1tfSR5qWRHfzVpimFJBdAHeDOl/Fawv9vHl8VE0AKNc0WTZde0PAwc
         xWJunsY6DLnQiCjHLR53dmTdr7xeV8oI0PzsL0cs/clhfTQQkObnEyqBK4Dff7sZbzBM
         fy4k5In7UVohrBD1fif/KUEiPTu5nJxlTUwka3+5/rA5135g6T3SogZh+EnP6xXQClV+
         6qeG2jMHbw+gqPLwc0pAMJ3iLdzA5cvXZYBz9JJeYyMhWAGxWYMl5w//qIpJXMBP3hma
         BW/eNr0C8R4NO4BwUZPJ82DnpUqDlyMvVcpDggVNR/iMarYKHIOEYJUo8BSqRKvkShvY
         TCCg==
X-Gm-Message-State: AFq9FYL1lMxiLtzlnPJ5uvI/DrYNuoMiNUD3y8BhA184dFhkeZ+AeGoJ
	LEj3GtOfZPCxRKKFsiNk6KzGYkVlj5QbQTrYl7+lrcJc8KWEWLjTnwKuDrryKkJ4gEcbut129Uy
	gxNa2AnBw/ql0HZOsTwzyhAg03Uzqegz45pVvUZQ9d7w5mnhaA89to50dxWUloHHvP1M=
X-Gm-Gg: AYBFou09kuZpNKLxlgQY1xVrT1LpsfquKyV9OmDV6UQvvCrCp7/0xGh+K1sYgR2tdcO
	4dmaZ0zp54fAMFL4m36uEkzOdSHQEFjPAhz5t2gTbaPa0TU71wg1HOsfGD2+/RnFfpoHmIB2vsU
	PkjXHzmpTn70uO8bVh34IGPVfaJRAEPkV0BVxfiCqm3PIcIB4QxkYegBisaOZlRHfs7frRcKsy7
	ZnKF2VNMMMdNCCIrZtj5aJRjsyiRLQaBLymY0mTRod9vsnL4cLmA8l8NH6NRkdIFhcplDACukdO
	AOwDjrwM21qyXH9HChP5+FHriRCS8eKPrnRyE84BdI4i0CpckVlMnoQaiicnyuqB4IRQS/3P6Zo
	mUUP3XA5A4lJA3wK1sYWhzvlc3EOe8tZMYvi9ElHJ3WnxnJ7TZN7GF1wNYt+M/j0DVdJCelwqmg
	7C+u4fSBuC20/bMrlhiB+tID/n6jYuQw==
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364095eec.5.1791875412970;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364064eec.5.1791875412510;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:45 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nOVcdAv55vd-3D80R5yLK4Hf4jdOPSyE
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdd956 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JR9XVsisKQFD673mhBYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfXy4vkFYP1FYJ4
 +ORNddFMEsGjCNVisSwL7qE6wozUNz2/CJsmchwoQcZ3L509DJaC4xpFQwTgtWVX4sF7q7iLpPQ
 QC52gQBrQPr5x9KI8N3eU9J19rWczdU=
X-Proofpoint-ORIG-GUID: nOVcdAv55vd-3D80R5yLK4Hf4jdOPSyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfXxrClwqs0xDbi
 8JnL4FrHMgNnF96/Jpy5Tq+jU4M2lmrGTVYOnGYQC5LRV703L2aJc5pFF4tdMlKOKmLc9BF9DuS
 3lFyBqblt3m3bgUC02+FkkdDrwc3Spr0aPMBRzPUMf+ySt1aep8I41TiZWaK1LjDLiKaBLVfVSQ
 OfmkOHnoeJ6YDQ7LXf77j28yuvF4LxTiC5TOIRw5QaTLswED08N/rkpce4DEKVld2V7ifzSi+Mv
 fMYHNSWZvQe1AcJugnWPqNj4WF7h0LRHIWvIKaFjP0lHXIcf6N+27bqvMv3MJkmt5dBi/HA+SMx
 tVc3DGarNPXarXinyFCt+pohc5IHt6G+aK35xbibKg4NCLzL+mtC+469i1obqqx4eZKSc8R/KA9
 tIizyRkj1TilgVvpFp8YiNNAKtMI2b4p+wSN6BCpIwbtVgy7Rz7iqgCGEiZAE+InHSoQzsZTun/
 jkk6B37No3l44comiKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130028

Add 'interconnect-cells' to the clock controller node. This will be
used for enabling NOC related clocks using icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..20e8b240642c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -152,6 +152,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.34.1

