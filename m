Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1148F852
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246516; cv=none; b=NT+nsr7Y7BP+0csmg0QeY5nNwSF80DbQjXLM1IHF775sjT5Ll5BHxUcZzO77OSXHU2JTDhVx8+tiwjnb9JRVWAb2U0eOBZ8610U/5l/iP/d1PXh2Rrt0kJyY4SUj1KXMaL6BLs2wEIht5/aWDGZ6PWSC3eCioXT7mlL7IZEb65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246516; c=relaxed/simple;
	bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJJ78CXcMUR2aLWkaExgkrobtTZnDA59+sRUSId4z6FD/R2GaznO73u/ngwmVLoSYn/VG5shgK03dZpueHACu7yz65jHgMhFCrcUbxE56/GEyxApamQqoF+oh/wmTk3Fta4m36Mu7f0L3kOfOELn+dAo4dEixE9GwqQREUnZRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRjJTKwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZPZplmv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRjJTKwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZPZplmv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA1PXJ2857958
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=; b=lRjJTKwN+ZXv7vIJ
	Iisq21cLO66nfXpaHf+swYacWklmPeLusXrRrRmuLV2hBPvxfxotwlppyTTiWqd3
	ziTQoGVZIJ/NevmTajJt0HFwEL2gmitOWO8hzBDR8pXEGdttYwGN5gpBmlRhEXAZ
	bS8pn8hR1X/jfAGa0Ahx8d23ulAcsi3ppvNW8auxhAz7r4dYTMfzB6BG20HB8/DV
	hcMJTgYOJdlk7lNi+DiNtUdHPO2HGvHz4g9QJmymuOro8n8ASjy4BH2HBnhvHV6q
	lhH+hjxCD1CnrtzF1sTIlUicjywIR1UCQ6u0ONX2KuoqPN+wHsZ0JRRLiiWVppeR
	y5meIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rag5bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d912b923so34739731cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246512; x=1790851312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=XZPZplmv5z2iOCUWd76zL+EXR7anoTNyhIUUHt9mEbOMIt2W7aiH/cvlIRC1yTZsoT
         lGZTT1aolRCJP58EQt+lTkZN8hUBejqGo1gtvEdm49X94p3Dq/4m+31NNaypF9GgmK6v
         5m+r4Yj++WGCBXsEZFlg5v31F5zFNC0L9B1HtmUbqmajsp6bw6bSAPDP1pRpzn6oqLcQ
         yQEzREBg8YzXpWOPYmS6VCoRcwjdPHuPEDyW6llZp4nPy9DqlWOte1P+o6GtmfQ8W98X
         T1+KSL4SnB7FTUQfDTrDsXc8r+fKVFeUuMQeCcEkE1oO+CGCgZjk3ojYvE/KgMy9AEVn
         MDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246512; x=1790851312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=0jnxu+nHMkFw8OZYYyiWNJZax25r2P4/ZMjtWRuddHjUagXducz10XqtCyctAnF2jW
         xiHI6ieD669kMuXJ495Lcppn6/0uDGVwAySZg6pmgfqkJi2lEYddtppMlnJMKs+XUwU8
         OL5voiAUZN2KA+/0TSdYDgmA40RWSnAuu82Xcv8N/GcNqGpSy180A149oAsbnf7acAli
         sAKk3W3XTqTq157HYLklI8o4EVhCqX9YXugQ+sMFJMWliFMDYqAZYR1mwsZw6zdTxXVc
         qF9OEfm3zZyTV5sY8gYGnXIFLLigbmjCYVtj7oTlYnzQftjh3hihkA3yeAMPfYWKhkDq
         geLw==
X-Forwarded-Encrypted: i=1; AKwUvBw5RmqKVk4h47x1tIoZ3fUQY1N8bYEcSBZRak8HofNnIFFijqU2z5PAxvLmqZAh5m9UsxmXSxQjDUH7/d8=@vger.kernel.org
X-Gm-Message-State: AFuF++lMviC1H29Oh8zRrA02YOJprQhS1zU5bJ7K4AweR6xyD2rHYQrd
	j+4eDK2upbBKFxckFgCv4Y5dfhMv2O//B/AGICFPUIcMiaqi49XHLfwMYTcDrYu6cnjfJH+l+EQ
	WSv50uvUx7JOiKiK+E11GqZdFU2IzwcHA3F96nCjRqUd1ZENhsCjW+p4AcqtuuGSXrn0=
X-Gm-Gg: AYBFou2Fl8mNkB81txxh5+JNdsrLl1pNPWwTir7a8VfS8aTM+5jxkT4+UvuyNK7N7JJ
	Hec4IQhC2xRKplCwCk72Hfs1DWa5I5PhpfRh9YywVyU3yesAGHt8gPZu/EIix98B0qzz6OE8mwH
	knfVVXVsuaMieIYhpa0CydpzVZo1m4wKSZkotKLsOC0ZGFIQ3FATLOdZhvV0TX9TMW1+ULBLiH8
	2DCYgL8o/GIrcg7Pj250q4PTUupKVwPFm3iOEuT2NjhY434kUN4+vAh7jY3L5UrSvEAaYeGz8m/
	oebbiMMRhgzDQDiU3wHJBvfgt9rRlthsql+GYe9XXJr2+SreHHznWqmh26ddQuOOxJuoqH5domL
	9aEfEz73etDG4OpUj1Wg=
X-Received: by 2002:a05:620a:40cc:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93c362d13e3mr214522585a.23.1790246511520;
        Thu, 24 Sep 2026 03:41:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93c362d13e3mr214516085a.23.1790246510730;
        Thu, 24 Sep 2026 03:41:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:53 +0300
Subject: [PATCH v5 37/42] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-37-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP39ZvRqRESQpet0hv+eeeTldHR2FFELbQd06
 5IR6qLYz9qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/QAKCRAbX0TJAJUV
 VjevD/9JslzkyvWXLtC3dWMMxtN96omHxR9ekIqMynXnEu/gcrYWQ+h6nKhv9rNJRqlYxa2pjNQ
 nDQcM3QS2Xk8pMF7L6q9YPbaxKE8tz2LuHMUmXgDB/56dpXtIOsdtjAIgZ66WtJhyDRuQwfwyuV
 TjK+JfF728gLMLMmXa++Zs3ytJo9/WnObGvTIgDMk4T/ABP/9StU31jKDDsJdMcXJRtzDxJJ29o
 oWTRum4DMps0W05DRlLZE9l3c/KfePyMyUtf1O0yexIE5lrRcSNJruR8Azhqz8/qWMKoX2ngrUc
 9k8S0WuowgM152WUlhbhbuE/VeLBitP/ctiK8v7aLacciknxnQ7VcmnnLSrV+aHfYZCs0m4gvZU
 9+nLTH0eocmTz768kjxuKRHJxHw+kSQNwQs9QP70mJCJKf/B3APQwuvOCiV5bm6gWBcEX+iiylX
 kByQF2C791hpTFTrcM60AMOZkQGunwZDujD2nuGw9SBzDR7LU1zChC/pAZXqtkFNh7QyBjZ3ZwO
 aszaAUvWXcdL82loNQrWxovHFhDAxkup89K8CkrSkwydMoZiV6XfkA8gqTiwwi1XupAtOQ7Lxqe
 s0s2VoSNShh0jiHO1QovDKkXwtJ7J58lfrH9K5pbnjRG1DCqoq6nnY39xNsEQVSOPdWJoJrFqGQ
 N8BNQvusAUNQE0g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXyxTu2UAR4t4c
 o+sruUW/rgHpq6cNruspHZAt/J7IkfaXQdUgNn+YMzkA/S4F0hZeXRes47h1sS9OKhwQI1GdDdT
 SG8QK36z9/SlzwDO3iBum8YC/WFkGsnSLOWC23hR6eG6YKIf17UANtv5IVJ7Xwtm1DFuhx/XqJL
 mdWM0wfxTFXIVhmqdSzKvJyLsOAzRUTzUKKL7N78onCpiYR9D27V/i/ctRAe4sOXmhnRr42rW4P
 RNCfG2WDIXTT1v3Nhysf7mHgo1AIZjZxrNZB+VcLXYkeCFXznApMbVGt4Oqd5Ican/tbFAqNQzJ
 6YP/NoXOHQ1W9XTV4g3tZWFRCLpLFafHce5iRBKVtBkHl6F3CWX3/lzYw+uAzULDjVNnaxAwHqq
 pqX86T1EppBvViLrAsLyWfVmpHpXFi4jOiJF9+BKZkpXz+90AlDh57znNNG0ZtxG2/Tt9dZw79B
 AkDAE1wfMR9vWeHTgtw==
X-Proofpoint-ORIG-GUID: Xf0_MymVLxfkb9Zv7XViRcnY1Qz-1I7y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXw56ptJkdoqpu
 9aYs+d6EU+Ee7a+9Ns1ausDTXLwxi+mwPSA61zrQ33kNeXBMhiAX3g7hUDb1CD3rnsTCVzT0qeW
 7LSyPjlnD01IC+wrzXe/qM5cmd4NEAI=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab4fe70 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Xf0_MymVLxfkb9Zv7XViRcnY1Qz-1I7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 100faea925a3..2a7c6621ece2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -698,6 +698,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

