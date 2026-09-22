Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B45304BF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071758; cv=none; b=AaXA+JnFOOlmYqRtfhg52PiYWtfxtINv1SZS9D8HFBVYMM/feDfFmKsjGH/vWkYFnhgIfhQL5K0INMQutr0wyZIQ32j8iWi97CcPC791mSZrZEGTaon08PothgK9YptEhxuV4/loSCANgYbDy5Gvna+KNn4Z9D2sJP7lDO8qoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071758; c=relaxed/simple;
	bh=bin85GVzIG8p1h9hsVqmNzGpM9b9n77cuUtgsjyHMyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2xJaPA4qUKojoNl3iZ3QZ4EppXLqW5VwjVkNU9nXF5X+qfmWWuCtwug+aLbqmZI5lf+vC6TJ0S4Hnug0cnGP2jjAl5HOIvcyRzSazTnCxptRRBEUzGOyniJoWnt0HD2HytY0u/PGsySTtJ0/L079uWABWJEKW2s8AOnwGmeMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeQawrQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e77rx6nT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeQawrQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e77rx6nT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M72opg2166198
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8
	Ql02EPbc=; b=TeQawrQvefgyEDKnAyvfU++Vx9PppAdi44quiyFeEe9PqYRzGad
	jonh7kD+Um8itaSJslHLJAUyfsQ77td6nyap2JXSALcPp+k6WAwc97+GXmunnZd8
	duIa59EMuw8/3rtQJ9a+XpPHhC6UcPsFfGlu7x/x/ariyEGkXsJD54K/cw2l1CGO
	OSw9iDh4CV0PQZNod4u8yFBwcaSd/WeDSFNx9WovTKEmvOcKNnPUlz4Vu/3W85cs
	SRAqg71ySceC0k4742xfzK+LHJ46oRcg9mxDKb1FkhmwpQ1HC5tu0GJQ0viGZUMC
	yZ5X8ZDIZpVwSUodI02OwsGW6c9OoNvnEQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeuem5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:09:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso66820875ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071751; x=1790676551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8Ql02EPbc=;
        b=e77rx6nTGADEMkkMJDVv9UQcnc0HJXcFbVGR2Gr3bMZvjDWH+KtVfaGX9jdtRZZzP3
         GNyszuUBIntC29gXd8wF8E21UTNEJO4NDApdkZmjaC6e7JFaaJmPBfWuoyNF8ATX5cVO
         fDqnXR4b8Jw0y9R6br90vGze2Q+GgPuC2UNXlEJhPe6VHAjY88BbgM0ZnoJSU24mEFIL
         X6sK5JM8MdMrn+g8RIYRzKS0rmN+xeXwz+Ym4fechYiQAWCt+EwDtrXFlBKKcF3ZQNrt
         y+s+MHp3EJLvcSUcf0ppCtrSn5DsfTEI4AVZPLaTvbMGJqnBZrPLS64ObnrR/32Nh116
         jLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071751; x=1790676551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE3vBUfsueLp6+xzBST6KK6eXznno2sjsZ8Ql02EPbc=;
        b=xlQi5O6Qo3PceIDSlA9EdhqTuFoSlNqf+aZCXoEhCp3BCrWIrP07VWpoZ+c7hO5zqG
         7Xf2rGmSCUwkt+y1xQsFfLqApZurevmrx1dVWZ7C6noodheW+2NtNdwoXo0pqhYWUdCP
         oDk0FRKyEV6Vyn69t44TMI1PhPLdfWOCThOa75AE6ThcxcHhIcFLVgEHs7VaIUoUDnPw
         ARV6NMn5QqeSB2abWw/0BUkRVic5/wIIS9yfaMg8TQTX5bKJEWneSnchHyWX6G6KLrvK
         fWK4Wt4tN9DrEuyDcc8DB4wz1Ig8ar8AsHcp8FUV+TRdFeYM0GXRvlb3uoyLogSWvHn9
         7QVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoD4+5DqDHE0vRHO0NjmqlKFQXluN9PepXNGsdh7Ozd2njpKUnpnA1xqS/Cc58r4T2m2r2Y9QfjpajP9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kS8XStzBIvNeIFE8URGcp1y9Rd3BxBo1pjSQJFw42pNeha3PSQ
	W+M7yV4KVe1sRCDCH9nDdg/jVw8KtFLkN54gpv0uloWOBDg+vYQPfi0dhOdnzym7EEgh6Nou0l4
	FxdMiEZJ4gEFpHdbWYdQHmH8djDugIuLQtYPKOHO7P6cC7HXi6VfO2f/R4CFsYJ7M6lo=
X-Gm-Gg: AYBFou0pprGPBsXX/az2Hrm6ZaxW62gOZwfVtdUf1b4m31VB4J1mUGWzX8nxxJNfA2D
	PbKtqxt2dHdzhNjJ2Pq5pHQeZQr0DmVqdRFHibrARPT9vK/56qEVbny1JNUum2+Zm7/eW8+Qa3V
	OL73WqOUNLwdyMFx2QcU/l9370fZMBpt7GQmyVlZ0+2zEzkjRerLnOBDr+bTj0MLKzXdZskkFKU
	Zd6tgURH75fwHfkddko9cngWEJP7ngloP3oBNtfhvpLSmALGm54dLwOEPrnrPiv3F4W/EyhsMdY
	piZpoIna43ava9BLwhqsidAzBcT6GafkTWeQfllGJWifOyCxP3cwJ6Lzu6iJz0VHsfNB20zhRsP
	0zKA+nspkoxEZRAd8Mmtj1bgkPyPju3jekiYxQllqkgRrQRI1ZohmYR6ClqM=
X-Received: by 2002:a17:902:e88d:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df60b975b5mr6992435ad.60.1790071750510;
        Tue, 22 Sep 2026 03:09:10 -0700 (PDT)
X-Received: by 2002:a17:902:e88d:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df60b975b5mr6992315ad.60.1790071750092;
        Tue, 22 Sep 2026 03:09:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm5121502eec.17.2026.09.22.03.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:09:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Tue, 22 Sep 2026 18:08:48 +0800
Message-ID: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I-Wegd5aWIMwcoTZlcNtAf2JU_QQ8VXy
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab253c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R3va9QD4umMSEl8p30sA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: I-Wegd5aWIMwcoTZlcNtAf2JU_QQ8VXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX09r9Q5Lf/5dU
 Z1lxpvdyPbhpDmenGCyk5mTsueCL6muYIWISoMPkY3pyme6Pfy1kf65mSW8xylRvSeQ8l5fezxr
 U5tku9FdQm967wXbqXpeSTfhPiYef/uA9C38inarn25C2r92rMQ4tL7H6/0DVCTLiYMRPTf4Hnu
 /qqJGrLxrLKZP39m2qQvW+7aQPYXod+tqtmPLqNhhunvHfXFKhnsyHRrZvMuvbDwNatcmp5Cl9Z
 LTZOy16S26PWw7MLcXcNf3vVUSTa33Is/0qBOxEXFPElKQWPJXCRQXpdXntBwmEf23JnsXskm/i
 7cJv8X/hU0Hj3TApKUmlJhjypO4XuuiaVVBwV+JFdtS/Ca7vQyUSCL6XxdmoU92ocx3+7fnygt9
 LBAusL/AUKOSG8+B+DaT9kMw7S9Y7SyN4U/UDuRK4YSF7OL7P3ErHuw/Ga9AmPiSm7/YorF3NWR
 iXUN/Rc68ev8/uy7WxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX4uAUUOLu8Yne
 ezYLDSqPMH2pP8DDl1BFutAYsOLNqjoiJC/4WrzjvtEqL2TlM3WRqEmPdIla8jMliVaSLJkE2S0
 LbZ2Zilc1jK8yrH7lqKNpxdRbAIow50=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Dependencies:
- traceNoC probe fix: https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3540 +++++++++++++++--
 2 files changed, 3315 insertions(+), 226 deletions(-)

-- 
2.43.0

