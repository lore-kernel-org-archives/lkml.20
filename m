Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381C3AA9D8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369249; cv=none; b=ezzQF/dVzc6c+3624AlZNDvU6xyKQUFK/U5l+BjL/w4frdvuyMrY1NDWyL8DEbW8z0tRnnyUr0kAuhih5evpaNEimU6+vA4evJIWCYHInplT8ulqybS0lhBYvQzNTVHtaTdlQ3CqHTyBHcPHEQ8e/yKOuihoNQsiARvubhsMU6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369249; c=relaxed/simple;
	bh=51p7nyGElmgActYmMrK60OEpvlyhQPR5CG3SvaR8tiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmUBJJwGdqH4NiP/cC1bOC3OEQZ9YgXVrxSbw+y9sm/KfRAx69NWyX4MWlZwhVKnu51ItVQPJz0TaAklrE6X+EgmpCuueBi5LLjf3GbvoC2Xp/IlL4I/g2mIu6Svo+UZDoFVkTMtjVHnw3ywH2E7zSFPTJ+o+4QKKElq/dXdEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYvolpj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLyRPGZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYvolpj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLyRPGZE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ieQe3368736
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VrjN16K6VeprRgLuXn5Re8HSbFUi3sOGJmdg2vwBNY=; b=lYvolpj8eXBMP3di
	fgC+c8ww6Vnb3WEJnTRfjYEwxBvHocAhnzpWdZks4gYqqTQZks2E12BcKOyVX3HD
	A9kz9Dyb83Kdpxhe+Hrb4LcOC9L2CwmJzPO+KRzC72/VAIfas3Jd1ZofFkCddf+R
	Q+3WgjfXdAVX8C9tCA9sYy0ICq/LgtgqaX8EtV/EhaXMoMqG0ne585sHqqkZqmp/
	xQMcCjBsrSJTnzEXUndb2dSoInwjzH2JO1A8dCbWgwfYAHQu8mal8BORm9yzsF7X
	EKbjBK71DZFZhr67EuvGEYfpwhFstNhewdykl1YDu+Ro/kCR8mcJYCMrx98izpnE
	7NTACg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5eap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94a158dc8so44285275ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369247; x=1789974047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VrjN16K6VeprRgLuXn5Re8HSbFUi3sOGJmdg2vwBNY=;
        b=DLyRPGZE5wiRszyhKTe9ZLtzqOE2qxmkoWACeWUOF6cIvvqvFCPVm+ArsGVfAI9zvq
         qGwyf0v244Hc8thWfyCnVxpd3D9y0T5Sq3/U2b+FoI0JtVKjYJfvXyNQB2R095/JhyOy
         h+5nQWuwJrCFM/YmRJkS+fvMmbpXAzJpNa436dJMsz+OkpCXe8+/mjHGCz49ktYV7MGR
         2Ne6MDIV0P+MsUvdQm7CRJF3L8lnP1oGXn2C2Lx6uxXaihkq0GhfsIU3LRAritajHFiY
         mImOqWacV6OAOAy7xzD1dqVkAYMTPSiCL2jO3WItiAisZdWaXTx9+WGpV6Tyya17k4Vt
         QpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369247; x=1789974047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VrjN16K6VeprRgLuXn5Re8HSbFUi3sOGJmdg2vwBNY=;
        b=RZ/eJh2EKyXRab9WHVddyBAOTBmjwrTYnDAF0slhbDni4DH1FAjDLSJ/0fps3E+18m
         suyp0m2PhHHynhin1mt0wJY0OivS99E+/3C5biD2n6WxxOG5vrkVcZgClUXhwVd3k3Gz
         ZS87TV4QK+yVIusXjxrX/xJDCnZcPXUaSRYHu4q30NY1ASky5ULwbV8HqLdrmTtbojZB
         UplHfthoK/RzJq4XLcOLpG8ZoH85F7ENmxQXCs/X7cxz2U8/uDD7UfXrnnnlHO8FBtTc
         USdB+YhXjzI6OCL5E5n7MJQmS1Et0DxdfRG5ecHuGh8vaJQJpfdGNCpZhITWkWHV9NPt
         t8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwiO2svsf3Yb7lr2yHnqcdvxNvZ7UwWc+YQlmxLkKFcdljdT+tNOxwnuzwRC/GxW/ATMXtfmegKXyaRsrA=@vger.kernel.org
X-Gm-Message-State: AFuF++nX6dx7+fhNsIFchZGicUf+nn2OyOX2IwyorPvh2eAKxk+ET/lh
	ojpIy/vkAgLpdktjd7E8SnsK/NX+eyTYCoYIj4zHl8NTGLiVCBHg3SqiE6nAbT7Zud/vOAtammZ
	U1pA22fFoPKO+fQ330bcRZFIswUVyD+hH7ZjCiHLbPMb09K3zYkwf8+qqI5lEaW4+sMk=
X-Gm-Gg: AYBFou0vaDD8zYm/QaHOKZ6hg8o3ewizBw0hlrA4/ZXYXSOycq1rr7CH5/NNktpCWMz
	S/hBLQFBh6pZEoxa7N+yeqRyaZEflqnhZgX+JxXFwyt6dJnC0s5kg5W8u0FeWIdjhpR+YWH9IJ/
	J/C/JHanJM3b+QWRCW2wnTYh5469VpgRvRec5S0grI/7KVCtHijY1zDsT3whkaCYCDxSqDYU41/
	kwPwI614UDcdThzl1s4OOW3/gL/hqtxXv7sMPxgTSfUNZ9e0b1n7CaEC6e1+u/O0YjjEehRJXnv
	UVTMOU0EibukLnpjrEoyA3SBv1q4nCtwd2hij+9q2CJELtyZLGiRExpJXf5uXdSgkAlz5MsQ+l+
	TIR/ZEGszRoG5DtElUK9mAVGxe6ug
X-Received: by 2002:a17:90a:1041:b0:39d:eca3:e296 with SMTP id 98e67ed59e1d1-39deca3e8e5mr1805154a91.17.1789369246801;
        Mon, 14 Sep 2026 00:00:46 -0700 (PDT)
X-Received: by 2002:a17:90a:1041:b0:39d:eca3:e296 with SMTP id 98e67ed59e1d1-39deca3e8e5mr1805110a91.17.1789369246305;
        Mon, 14 Sep 2026 00:00:46 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:45 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:44 +0530
Subject: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1602;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=51p7nyGElmgActYmMrK60OEpvlyhQPR5CG3SvaR8tiY=;
 b=t8fMI3x0qjs6FcvP9qMYZsjqNmTWSLtPw9r2hXXjueoTdkNZhqq6fPq1InOqbpi9nfOMVkIyX
 eomUPj7jul0BbhDyr9RFO9tCDXR/WHNoWiLDuQtq+b9BRVBX71z/6WL
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79b9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iQ26D1ncnj3ZTx_uDCoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyg+yhBdSnhGR
 TmuGx2edAJAAC87ImDooasxFewzQLFrmmZh9dQNtNFX7M67ZPrd2xwG7cTiou0Fit9BJmbXgXVe
 Av3AqcCRYDso5y8pWbUW4mHe9JD69hKmPkrkVzNP5eU2ICw78DFKa5PUSWQbH2PNN5lpPFJjBT4
 DOZn9IggvTkR441pcRcCcGlwbApBpTtSn0TrND0zQaJA5gz6PXYr900u6GN20m+lRpSLxeJzRIv
 WiA6l8kIggdaQKQDgh4hDaL5Gel/qIg/1fjFoEW6AMqFQOPo4ovqjg36AuE4z2I+a6P780zG5Na
 0TtZiP+fC+EFJsaTAkkIv360+SxZooYoKI0sXeTcIOAv/PhQjxmCLG11+DcodF76X8ULt42c3v/
 SP446dUTiPGjciSSW8QNSVg4HcLt/Pz18BNJOm/NLhcKf4BG4T4Ok3DG/gzR6oX9N+f2p5iEaep
 pTkr4A0P37Mr6dVGhog==
X-Proofpoint-ORIG-GUID: vJtD_j9JWdnlN2v6LxLEiDizUN6pLqSd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3VntUVCih/sK
 hxYpgEZXZsGTVbZbvspQ8IG1BfjGLv3pIV10kTJLIr15DJ9pXfyYjMgPAxXi6Cd2WP9LNxm1ni0
 PjJaDVHPkU1ZOZIUCPKvc0uVJiin91o=
X-Proofpoint-GUID: vJtD_j9JWdnlN2v6LxLEiDizUN6pLqSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..1d708f56e05d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -287,7 +287,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -297,7 +297,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <241>;
 				exit-latency-us = <1461>;
@@ -309,6 +309,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

