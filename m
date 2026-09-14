Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8548CD59
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390195; cv=none; b=QOyUlTilt41GGAaCCPp9xBaqdkbV4WdAyjA3mEnrx3B4Bw7PB3sDcttXbtjNGG+vIBMGZM4DP8wTq6YfV/T6EGTkx08gn1W9DvoGGPFwd/W9UwY6XP6+FJN+zIBCwX8fqAyH8CpLNudDZ2G2g4m8ZWnZn2joFINajY3No5afXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390195; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUd//1GdiIWQodjVPsy/nrI+E5Fd7aeIajPWhm7ZmQiM8YUqiez1zX739aIml0d00k4NFSJLnNQx6+XMWdleQMvhzYsON2ZQXGHetTcZgP2vgTixbSDX1WKDg/MkdxjTVyuacagBRU0vuI2q+v9+IlHBErR6yDajqsxcWKNkZzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zk4OqhB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX5RBumB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zk4OqhB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX5RBumB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4hg1216150
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Zk4OqhB6sbEhwU/u
	q6TPL3/K8OenQRLsN2JqxvvwUh/NiG/Ji8B3cxf4Ad8d88CrNVwTtJ2f+Z6/H4aC
	OAZfiQETKTW7Ko4T5B/y5VGo8on8odD7a1cIie45i7bZRmO8AxSKOjg5bVdKpVeL
	ZR94jrdJNgksbofeXgvsv7BsfqnCNsoawLe4MLwtukC5r6BlbdF3CGkjh4efbS29
	Iw85XGclR1q26z7Dd/KduJ0vqTnp0CA1kM7ZMWIb5to5jMKzYEIex1ip5mPEC+KH
	qbVvrMld0zo/sJajXXQt33mNYVl4CyPshPn2q3gdQf5x9QhZ35mVSB60G8K+11BX
	uYdHDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ahvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so850102285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390192; x=1789994992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=RX5RBumBIisaDyZUjnox/libkbtzuE0uxfyMRahLO2Xjo0o/I/CZSqgQDg8lM07l5T
         +Z/1b6T6VEyN4yRXxuXZe5oYlB4hQ4831tolOPBAg+EjFf7SEtZ7RJ6uVormrpZJoMN9
         1Z0UIlVfHd4XrOl+T/vZ6IUWDFuzRsg4qSvI3yMGA6ZrJm56Pi1lz8RfX4eSwZvCJxIw
         WIFvb/O7Y9VHI9QDOu2RLo1D+48A6N4RE4H46ggyl9Iwbw0UV7WsgzuFptHBqhsYLlMc
         9c9l3D2xuk+taFmYQ+nVWVuoJWSxzbTgbfPRHVNHCVWHBzhbLbepZUym1L+nX+i35TWp
         U26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390192; x=1789994992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=b53x6Z1L7IOELxme2jIslJtTvtXPK796XsBAavn3OpzyBS9C2M+q4yExC2FEUBILhy
         7itpeWqO3+nvZ01f6Zh6k0qQhz5VVZx4t51z4L4pMmzNzYffCZ6DCicahzmds6QBFiGB
         XX6TfKpaGMKt3gf7ZeDU6FrjOS7lgLY2DEhOOFayTWlHF0zJAAs7STEP9c6bVmHnhj3l
         GpKKWOmgrb68taxfC+UdG8fNTE8McgDcVI0/iUU+ZUU8TNibUWCnwfZRT7X/LCPaOcPk
         cxo7IDAqxRk9CpL8kcUdpgBdToJHtXfcgBxLhdxq7UbUJ7Z5leBfiA+9ixdCJn0b2GLt
         WZbw==
X-Forwarded-Encrypted: i=1; AKwUvBwnxrGvHhG2i345re+g32DkOapOK0qYn8rYhBYWaPt1X/78Il4JoPRcckKlUWl4hXKRJuIxdQkq6mfiyUo=@vger.kernel.org
X-Gm-Message-State: AFuF++n50Dlrl+sPH6U4c7zarx1rWBeal6qyRvIzN+AWVfaBeX1JuL47
	8jypKlexZYGcrBw/8G7ihSp+ZaOSHksSYeCtUvkmbjDjlZXrccpgdAeoRkdEktOGXL6N3DW976R
	k8sh27/xQ1Oy6XIPzb9Uxni9pZgF++C1lSbpsJElBT+NxWmDrH9XCAak3Lf7TG2P/sh4=
X-Gm-Gg: AYBFou2WPPg9kwhODdMyTT41EYF6+bpMSuLyJc1eD74QwGdAcerSssnPl63nR9/1fxT
	Ecy5daXosvC6yjsP7XH64MV/KkIj4nN28LCayyjkc8SDxtHIxzHbDJaSRhd1pTYJ6vMJIBXB1GC
	F6zI6QL+7UnjYEaOIInaZsSsS8Rcs5yNGNQ+vHjcMUHFe1Nkz3TPAEOC0TlXD1UhS+vTUe11RR3
	Ai1HZhy4TJtwzfv5LASkyXXnGro3bfyLvKUE8Nn4YcS35GCgDUW63xJV1rjYm+Xx3BRZeZxxs1p
	9hh3bt5e8nLjY889+YE6PjrIv/mjkTysKpS7eoYrAbljASuxN4mmxdhK8DGYRiGDQO7SjluNyUj
	4yQ2rX6mM
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr663155985a.10.1789390191437;
        Mon, 14 Sep 2026 05:49:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr663151385a.10.1789390190949;
        Mon, 14 Sep 2026 05:49:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:40 +0300
Subject: [PATCH v4 41/52] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-41-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zzXgeiMIC3PdS9PxtHGEXnZzVRJ4hW+sh2v
 q6/vpB8LbKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8wAKCRAbX0TJAJUV
 VnfgD/9hU0liESyOT9aMS839L4uprrxstPm5r3AgNY5gPQlIkDz9uMdu2WFNuP2XQH4mQlqgu8f
 zgWo0K1fc/hlYtDq/14WDhWtXlHOjN/94/DBuseamNdIrHTQ/bo4jxqpzMX0aa4X87CQJvyD+xV
 3MY9DYSS3GI4JmkoJxO6mQ8xlM7RK8Dp7KpVisa4KEhaCa0iua53tanQt4Jx/W15HyPQu5jJANA
 MQFciJtgWMnkVTV/1pZF8BoE2LMV4ZBbISa5YEOJLMtN0X5nfRgO9BXBFHc7mfStp9joWr6OPq8
 6sug0B4jujS4oc7/tyN2FqFrW5V+muItamJEhvPOTD+uKLBjV/v0Cd9SOwLvMv3LE06vpEcoZRY
 r9BrvHlt0HQz2oZdqO64snM1ZheQnOsdpChffRrJRpok3b37DHqmtLinzwgcohbE6ipC7zgqCVG
 LFGdwaJzCK0XH9UwlaqCuSjViKFWvDGa4P8v22XplU2/VE7Z0xa1HNQlAV5/wYd9buDoCIhbSbi
 avFBwjMURyOrUGZP0BbO35wmzoXy4KphlImqVj/bPsqNpUMwLzIl5dpF9eeCL2GX1wp0sTynvgN
 LNj+RFYohujNU8QlJk7w7IUm/jLNkAdDUPfYg1yqnN6nALCj0ZzwT6LCBC4CQ7TRpTKyVpo+v9U
 aYsptZwId5e9K6Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0+0QJ24M/6HT
 kpRRqjD9ZDlwx2Lpb6lm6OKSZnZ6oFYPzPh0Dxi7gegQmP8gAYr2mAnVyjI5iAD/u4vUVx+atSf
 WJtAPMEp86ekYitJRlXOwSlbpfUj06w=
X-Proofpoint-GUID: YcvEIld3pGTDU_UjIvtCHycJs5Au8fqg
X-Proofpoint-ORIG-GUID: YcvEIld3pGTDU_UjIvtCHycJs5Au8fqg
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ed71 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXxMvTBX/vn3hn
 PYdXaFtFku36zb1QznTkmfd9maicVepRuWf7ngodCvA3fXwDOKBE1VmeSczJjU+BdmM4ezk0qLu
 IBU7zACyY/JAd5+ADPc6Xt9uMLbGxwqCp9hznWfR7cDNMil2ryH43p9qHtIrtGTHNhMTtLjp9LP
 mlaN70jo40qAmxNhyyKKUUZu0GO+3a2zG3cZXGA6xDfciGmkRmU8YVDfrLZsahqqLl0LCaP1UZF
 fWsmx3u26b8Y91swv0S3ec00iGbk6ZrfOz4hZGYYmMr3Kr5a2bAuNy90OkadWPFn50oRSqeKjoJ
 yHAiFcL68MC++2RKx+j+PGsZ7Gh9G0aitxqfejb+G19pQ8ymdKuHvLHoJbrDfsgc9MCikqngyzC
 lyoQ/PaUDfNUis5v1L9wEO7kpFY5QlalyKQai5/WOAZStlNz73M4QDJaOj3NWg/jJ7epCUeO1F5
 Kohic0LSk7k5txVI+4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

