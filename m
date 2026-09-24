Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540F49B203
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246529; cv=none; b=ZRaYToS3JOPzp6i9Sf4Q1KwVvOuSWN2MAPUiTPQXxk0PodLR/vyaBovCaKLG6do7psnNLCLUjUCoL+OzMB+oU0EEtN5yRzBXq+HKDVZokJ5VAexZTXx9nKjIyJrQiWQDMG8WbUvC2zEskJPS3YvAJb0z3EJZlhwAbG05ycrN72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246529; c=relaxed/simple;
	bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ruoA2fCgLsL4IhoDc2b6VwCct/JFimLSQ9rTsvHLZ4TY6QEwfBJdMfE9svzpsApR+n04wATWxwZUNmKexJYJkmmJx1pFwrAJT9vRW9I363ZV/tKrxado9UR597fQ3EwDR1h0d0o/qYqb+7GFjsy2C9xEvL2UXSfxAZi2r3dmbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEzY9+p9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj5jcw+n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEzY9+p9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj5jcw+n"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PlGJ1644168
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=; b=KEzY9+p96m2/05kw
	3M+IS3GcTuf0aBcCR4tU9rQHZFAa8sstQYMhqJRIMfVgnpk8TgYOl2/3x0RDU+SJ
	5wqSz/OyDRAYaGKMIPrW7Scs5jxhjOIIkbgGrlzrUxqOh3oEKRZzwm8mamR174wT
	n6Cq5AuNLCx0rouKhFF0olt0+d9ajgu5w8ki5dSlaWgiCNPjeguwq+83c5GJ8RvS
	ELMBZsjqYO4cRx0hJMz3htD3set1yEymmLq6FiNPTsVJBxNxYVndWEU6OuYDoA/Y
	4AyA8GLEFepHdlhyVFm/E9jODG1demyCs5bnVoOEY8w3wQRi6c1ETw52kCV66kyO
	1XQUYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb46b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:42:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so389865885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246524; x=1790851324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=Qj5jcw+nDiYlqdyx4vZeAd5i+D+ZG+wgjNjwWkyEW6o2wi00I8+gKAJedVjJl06BPb
         N/oEAvXAdX5+6SrMDrIUSjmRcV5J8sH+LBPaRZhYkBZ/CqJ880qzlmetLi6nRGvRQLgA
         FHIhfJWOWD/yE0ArkJBZJy1W0QW7rh6KTP8lMmLv5YKndyVcniQ03NdIDV+R1IUSeMTk
         qeqRq6lhAD16eVCaepOt+7BFOKqZVv2HcZ3AUpVuyv3ecIQL62wDqSmy5A75nK8mHOPy
         R1K7p/xf9KoWoZzdrRCp12nI1vMFQY+FBBDThkZQNhlr0C0pIESLLF/s+EWr7IMXE2Cz
         HEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246524; x=1790851324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=ChPq5ZDYHHtMCshdvW/toJggYVejwziGi7jw7jUGAhWSeWLaNu50FuVhmBo34Nn996
         E0lB8vQlbiJbxC+6ijytiJiHX6lBZDCQHn4H8qnjZjvlO8jdyap1brNTnZ4AZ4rvwqZH
         uPT7SVe8WYsx536QXewqU6OEqvMp+Tto2/MxSUB57rausYdgEf2qfxmlYJDDtjfZeph2
         2F4hzuohKHNUI/eRgJDXrfgJPvoLnEXT6P2AsBy5nkWfMW5+dQ48LFF/qZTjpgsdmVaT
         Dshuwf97qZ62p/3P0F6xLfsA7BJ4DOCehQD8+cTHyRyOqyU2Ju3AevhOQJJZhA/MjzD7
         Vb1g==
X-Forwarded-Encrypted: i=1; AKwUvBy7imbMtTkdfA7QFv9ZKjfPWjhvaOEAN/bInjJGj7EI7+T2Wpicg6Rx6wfEOBbbTPrfX3sJvrDhGZV9pNs=@vger.kernel.org
X-Gm-Message-State: AFuF++m4w/Oqgq8ls72VlUoC6vuLP1AwX6egg81NhjqhptVDDXuf/OxK
	R5TIeKeGSgejoj1OAsPQZVshfTjp5NRqwtSSJ0tGC+AyQqiP+g/M2RM/6kFuE4ai95eLJHAejrU
	Hja9ROumeCY1cU4j2QfZy/S1z/gRAH0I3v439ezTmswVokeFj3QWHFHFVqyjo7P4VDmE=
X-Gm-Gg: AYBFou2/A7ZgrKAgBdFtoGlPVsATBaENYtGGmJLhncpdgnF4uaD27hMQttWyR9UQW3N
	y5a2lu1u7dL4D+/0xC37eM6/HAcNs54C5w+T4jBVOTj/WG+DyN46CkLYiuH0yaGyFf8ksdw2t0f
	6WGhBXaUH+vUimhouhx/iLLuatonBEaMwuK+qO1SMLlQjXi9i2nYRt3ZYkz3+dGcN5BCgtjoOzd
	i4Q/HZ2av3hI61t3sC41xOLdj1OBsCZeoS7u33UEHOzaikFJIuHejTfDH3+sL/MQW5wXLZp7o1s
	tbfgGcSCiEoLOq7mWpmPChM+cEqsUMyslvt8nD22LVSM6Y3hDZ6GE+j1CBUVvYOWwWAoTQ1hWij
	xdOvv6DYZ
X-Received: by 2002:a05:620a:1723:b0:939:ef88:4af4 with SMTP id af79cd13be357-93c362470f6mr228658785a.10.1790246523994;
        Thu, 24 Sep 2026 03:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:ef88:4af4 with SMTP id af79cd13be357-93c362470f6mr228653585a.10.1790246523355;
        Thu, 24 Sep 2026 03:42:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:42:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:58 +0300
Subject: [PATCH v5 42/42] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-42-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4CEcQLHpQHS/ss+HFG3cmzLfMFplWfVvXOt
 kxURLroZqeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AgAKCRAbX0TJAJUV
 VpNEEACzbLFp/j6k/PIrIZPYr8JSiBYM/EbMa+Oy+JpoDlTaonnJvQfavo19r4lbPH2jqBBiMM9
 YorezzSh329av+dZNrn8+YjK7Ugh+i0BXfxV312sjyymdnQ/AayKba+yGMR6Kp4wIwasvtZuTbK
 psgUa6jKpYXnuW6FpoGdh4k+Kz4C2+u12WE4n/cCKasqZAtJSs9f0NM6TOIU1Jv/kj508Ex/Xf2
 etK9WKRQPBIPyYIN8VeE6UsmezEMhUT9nuLrv5n5K6Sh7te7PEG59aLCNwdYaSBxqBDI3zrErnQ
 Vmi49soE8QCZND4rUZALqrMGNgfXiGbsqIsLVKFZQXxWnE89LwdyRUExcWdjdN7ZuKgXxDHkVg/
 SOcfVJiKnNKSXb3iz6ijFFDz8VFLwiLB6QJUpsBf/QW00GRIHlbzcAkBC4+GDpmzCqT2/2NZ+Zw
 83v55Z4ce9mjLYgvRA6yibfyCo+HFytGslkG/wgX/KSpK3aQ8YT1Iov/xP7bUlgnanRNg2RHzq1
 UJGi4v4wDmIHtm17oDkR5BZFj3TQgATb3/ux6xeRKEUJmlcq9CzfXrxTb2rgSWH1Mf4pNkiZLc9
 I3F7hOs5emTZQznX6pVmWO2OK5amp9pruIO7mtdflgKPbH/dh6HDH0tG0OJfgd+JQm+kGJ7HhaD
 R2wMOdzDsTGxUxQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3qIdKL/ftHsQ
 SkZrctJ6wZNNvUM0nzxQ8TDqb4weztanT9S/cHLQMIKn47TAHG3PqCOCMqW48xDIK1HjWy4u4kl
 NSJxXn9TvHNg0IPt/lrwH6i0dpjqd1Cwl+UcVhnAO942mCGrjKgn4wy8narlW/lTp+ivNlg75Eq
 VTyQbQ8A527tFMMk4mwskq0TAU/qMKNNflaXGfDn91mpW2Y0uU6rVlpNAkcDKr0i+FLgD7+CshD
 db82UR0RFunxHyTfFNdbXKzKxLJnOilZmDIloQOoQFIwbfiCoB2bvbQPKeGtlJnSQJlPTWn3qpp
 wnapx9jOaXmkLPouKk4f3+c2SI/t8RFjE2WQCLrnp1sGydJQI1nBgx5jSUvDatgNzUT5VXPkt+J
 syS0x5E5eoj4us5moTwSop+aCDTK1TMh1FsADVxfGAvfja3wEGuG4nHTRA232mNZvQYxysNXFi+
 h0/1jba0c9oepTqAyEw==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/Uly17MlJYOu
 lna7cvQQD3gbFpWDtZo3CwCfpJ53Cagouc4hTmtW+18RFmo9Gyju95mmu/HoYBLRVeTWI0riIxu
 9H8W7YJuPvSTh5t8kbFIW15AJNF6GeA=
X-Proofpoint-GUID: JKJdsD-uADWO6PPXznXmQ0TZrLm2Kl54
X-Proofpoint-ORIG-GUID: JKJdsD-uADWO6PPXznXmQ0TZrLm2Kl54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..860673697f1a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -705,6 +705,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

