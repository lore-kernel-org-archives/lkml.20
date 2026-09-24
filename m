Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECE494A18
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246522; cv=none; b=lLMmnJm5Rpyfdb0vQkLXTsx5R0muqceYBggJXofJzJ0NrNwbXI9Y6ZOOgoNnR1DYOaRf9P+k/tjqKG+G21O9LYgtRKtL1bXYaJihJ1Ad3GcfqZt/UDsr+qVJlkNxWy0OWeg5qpP9HCm0BJOx+Qy5Z6vW8m8ilnBHYh1sHR9tDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246522; c=relaxed/simple;
	bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAfIO/bE4+IUJkZ3WZzdVjtQJ/nbsVwVuVFYq5ODM27h9Gno+X+f+XrBGVuRZuDUwY2/upSpFDnWR5Fz+EzjJaNrA9pnZ4u1G7cIDF/o7y044pd7jLt0/6QTDUrOoZvjXLRiwy1ivmnoHhfrJoEcy0hZyLm9GJHjOJ6wUi1uRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1/ftUJc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPUIAHCM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1/ftUJc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPUIAHCM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA64Mw2332988
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=; b=J1/ftUJcqw4NQepm
	Ve1CMqTKImAZear7QSAxiV0wIwJ0m/DuPL1BAK3vZy8dntbKaTFJEqJ4yOEJPyTW
	zfLJDnIN3e6HUyPY/1GsAn7USQhTXOscIVEt+5sryAwELB7MXAwU77po4XaNAaZW
	CA2ocTGDVqNRYgeztCp8Ipxk4XmOFii97L9G8qoa63Xarz1mtMBtXROYhXMQb9ZK
	nv1Zodf/k9l1YcZ7HtgmTxHlSsIt09DVl7S7/QgPBGgcUywUlOEiKJzCPJBaO2v5
	4IRoRmpeWHD/tTiMPJUDoOiGTSxfyJyqXlxpmMPBG4ATK5OAnzXEj5YE9tj1YH91
	SLBbrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg42n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso296949185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246519; x=1790851319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=iPUIAHCMDlg2UsOdEKxsxUDRN9h7U36sfKAqI6q8FaB+WZJsuc6IytWhkw1afYAxyH
         K0DoJb9vCb/5wIPdVbM5bI4FjxweV+M6R6JQVo1nZ5i31gKgqaTkevcSEXfLVo0YX1kd
         oNTUUJMrUQt6Mb0WtN+JSZYbkTOzcZdD37wuG162B3hS1yq/t9PIqRmIthx6QN62U7QP
         PgLWEe1k+ZHaZqmfFZKQD7o0SfuMaGl43fjT6kV1kwXRV5UhBzfc4cqCY5RQ1ajipCFa
         A4AqFx9jKHqmmK5moSnfPvZ5efhsEnQ5CRu2Fezi6zmbi7eh0996sHIFYf/gSs+Ofwbd
         bZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246519; x=1790851319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=lGVRGrnPJ990UwgAsa8Y1QWnoiTaaMSpssRDWC64Ntn7xKuoNaeLtamTDiZUi+0Jdr
         laXwXugq9FDCbGeU4+gq6dQxw0/yuk44PqoAtp2sMSNdgFQBsOyW4zZOm7ocV+7EBXKx
         QQ+VJvVfU6QDSIbfCje2ZDH5DeOJ16jqPTR/FzZqnHb9pvsS6qeIXw3XrSIVXiYj6fr7
         qlutMZjHvRvJcdz0W8oE0jqudarBegItW0oOqO6WYWrRXn3DnsKrJNcZd6UYYtn+Uafs
         iHPx/ErF6gHbqFZRoGPoAnxZQHvjtSd2DBTEWsMAHN5EfsinCQrAs4nOnveShNxRoNeW
         44vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI8CDEZL8ZcuU6W2R/kDc3fqp7QnKapA+wpXfGnlxer7buId3WXAnjacqQdzD/5A4nbO4gwsZTbvwWy2c=@vger.kernel.org
X-Gm-Message-State: AFuF++mMlFYV5hOJHg5Vo7Gv7TY6aOdnphvaxEKDgvr05pTK/GVibdB6
	5VRQh2bJmegTsdtsit4oPouRNzrIcV3CFlrhcR/FWef9j19Lc7qrp5d3WtNcaO6PLb1Hy16NDjA
	MPawKFfyIn3wlJ8Bct+UgUwszeyJ2ru43O35ZVupq+MokEI1TvuGRigJ2dafS/iIdDak=
X-Gm-Gg: AYBFou2ua7mVXFEBllg07XD7JNjz/HD5qSVdQ2oVblYaT48bBi+Mvi+HkTiPhfZTE3L
	UJE4uqgrAmoxJSVCm3NH5UQR4bHfUILHl2zBvZlj7BOiRFAUZSTjUgTq6v3bH3GyxPYobDnctnv
	o64mf0r7CmLaSFyCRTwaoxrPxfMI+CixH3MtwBaYQmL1rNPBKmDcsC/ygq7u0RYMzfDJKgCVuIJ
	668lfslu1hvoBC8e5Oks4OKAcwcCeyQ34I10YPGM5aiU1mwH/td2LfHyhFA/iUoKE5zf+5yMr/O
	8ZyI7lpW9I1iqbDxk02PKMuxYGAafmpoXDt8pzCDHHdBzzE7Ykl87vUql2p7XhVlwa5ZxEZjt6w
	/g2ibtxXW
X-Received: by 2002:a05:620a:6f04:b0:939:a45b:76ee with SMTP id af79cd13be357-93c3632047cmr233895685a.23.1790246518473;
        Thu, 24 Sep 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6f04:b0:939:a45b:76ee with SMTP id af79cd13be357-93c3632047cmr233890285a.23.1790246517792;
        Thu, 24 Sep 2026 03:41:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:56 +0300
Subject: [PATCH v5 40/42] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-40-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4Atbx+Wq8nmvAg2M9gzxj/1yDvRvMg+Wfh8
 3FQTJccy2iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AAAKCRAbX0TJAJUV
 VsEvD/0VwTRiSAoNsOomuT38RQe9QRlWzecZEhPlozm9bQTW1n7i++uVZjQI2I43tVpKUzPHXb1
 gWiy864UFWXFFZuEtsPOKdGPHm/OO8z1pitUMYHuGOiG4SVmPUEclVbocQeoZK18UuXBC/wk7EL
 N5geXxLoYYqwJNIEAXl/09qJU8x/ab8SLHDEt534QV9AHFB0imx96dAZnykjLoUBBOAxJVgpRlv
 M30vx/Q0kMNJaHoKJHHM4Lb2VbAQW7nN9orVoKHh01KLQNSZNenVnZY/amThTd2IJgB6mQQUj6G
 XuXW5USSS1NEqYPCRcx8cxyur6hWbAUTlIdXFWLSLw8eKYpB49owY6+0pQhv3MzLmr8OkNV7Vl1
 CICcecvqYFGvjD2qG+bFStS9Kcw6OrxZ1Fp7w6uCIYH+2KlrsgN6AU78jOzVSlWQ9wqxtNL1CYt
 xUj894TCEUZ3hF5YznaMbt6EnGitNKHT4nlWYfGE+XGu9N6mXENl27nvHFLttgTsGR5Db5DSATr
 fzevuCg+Pyk8OgEsJvdog9TKGPFlPOArtzt/qI1Z1qq/8ZBgd9kD5LJd53aA3eb03t8hoap4sO9
 43q7u997zSmdKih4o+0Z4ikWbcZO1F6PhmQhlR7pQVrTdbeFQHamSKpepPNv8xBpTaFgWD/uSz5
 EYd6vntBx+TpD5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: w2S1tx-gSor6UxdErAdnoEzasVGkFMW7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2fVCuYxkRp3N
 54uyJMWLSGT4CbPDqUHGmfA3R3ZrykvKkI7TnJTepR8BTqQ1G87TnbHroANYueNlwgzJfO4mKUR
 whLauPNjpY7/htezlzirmvL93o7+FHTO6xqS+mqFYtrfF2W1usHXqc0f8EcKur9++O92YDDzJ0/
 jbMpw/+ySTbMzJWvB2Ia1k8P2iBwIEQlLJpkqRnWjTW2iyIECCTaRlAVl7PEHMm24VaAVSSKLUN
 3VOXy4JxknmwRqn+1AtAVNJpeKvdxUTWnlo5fF6AgQ8unzh54aWZ74s4Rf62b8HR+I7+EIkieeW
 AaqYRs4BMas6g4PViE38qJk8YXJ3Advqyn0xUyYCEkNU7J7h+sNhxJA8VsIzQVZs42fjXyXY1VK
 sNVLFIsicg5Jl6Z1k7fHxIPmqt1cw+pT6ZnqA6q4/QOMVLDhAdLVXoAWVD2Xc/c0ksbu8RLhkhn
 2aOScdwKQrlPLPuVhSQ==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fe77 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: w2S1tx-gSor6UxdErAdnoEzasVGkFMW7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6cZR/FNCzdwm
 Z6N785L0/36yhNp4auliN1u05+72NyySGOzg4MHiavfE+3RU6UGb5coGp2JeDT958Xypa1q7i3T
 JOWdZXXTTM8IzKDLiENrUPYjNdcU/UM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..9cf38a7e0b94 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2018,6 +2018,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

