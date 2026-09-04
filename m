Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2D73EDAA3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509821; cv=none; b=C+YGIGSD61LEeivW9J+mW7pUtv9tcucNCA6CmIWB0t+QHKTZEHY921jQVfJtSJDkQD8Gd/qpH3FqST/1JbC/8CLMpEpSXO9dOwH7OIcHYiPr8RFUv0B+myGVbHS9OA1IDtEDCZOsHG8tVrvZeSO9HHmtdlKuLs90cpEoGSsa3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509821; c=relaxed/simple;
	bh=OOscVmyFqYUCiz7c4uQpWAZrR9i2yNKDHAWX7fX2a4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5b1Ws97lw+8hIAu+N1Ou3F3dp2ZdzRQuCoRKK1nK2xJng2lewFOXIp1vuaPl7Jc9wJvJGEDqP0xccmCwtKsfCtG5vKKMYMtUD4FcL3sFB/XqV7bol7YSTaGaEZjTVZyUdJeWLktU0hNAHYrviFXareSnoBlUupX0BMxFKusJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oqz1NrvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgHj9xYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oqz1NrvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgHj9xYT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847n58c2977012
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=idakCR6eiUf
	MeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=; b=Oqz1NrvM8CFtnrXbaozAovGGKcl
	fjl6byuek6NZ8/BvMcZzMNR+flA5q8nvitiQnCHtKQn/b3uPDYPWIb1kbG5QoCX5
	kbV9I/x1sy/vvNhKsPb7Ncy2UPsspLnGi4D+e9fqKbeDmP/ia1egjdBiflUjZYBs
	I6eWEyErpfr9az5LvEPol4gmhKVfoFg20YEqrU9wCmMi+U7j+FI19CNygP5HfD3e
	ybskxA1vhcxp/Q+PQkRenPpe6blvKI0+gbZQvBKIk+VHNXXEdDuARjP5m7YO9iW/
	+TQVds1ws5ORlEFzkfFYHu9ROBNcQZt0HQXxqS1FWHee6R8c6BBj1Svjg5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjpcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1545450a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509818; x=1789114618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idakCR6eiUfMeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=;
        b=JgHj9xYT6ciKUhpFt3OB0T8UyeHI03NAKJI1I3uvK/1rk+dM9q5zgv/Q/TUIdyz/3s
         jX0l2QNbg0esuYDTlctkO6hEfapztJnMGtZv3cHj5n8Vufxt9yharnwm84199vFbqred
         31VAQYsXbuvoWXVd6Fwu9mgTLghQByHZy0chnn2O8dLHlWw8NB2mzua9Ez4L5wVAhVsO
         qth5NWUoD+PEDZmR2EyP8zSjJJaYtfGtRmiNUYu9/fKXT4HaxEoD6JJUNhcoL1v5OgnK
         SAK37GvEVswPTO4QUZ/GlHJlonZ75Z7zuZcJfFp1FEOhVtA/jwo0cPpOnEnFqKdFPAed
         I+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509818; x=1789114618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idakCR6eiUfMeM4OyC+t2HmgRfNsvqHamrnUXvWTUAw=;
        b=pdpK+0Py4OEgfRSPMA1pACBMiT4/hqhvfdygdS+AsBD/wbBq6MyKfFDtz2Hxj/qs5y
         n4haDzbpdMkE7RwYf9a1bk0oVD7n+PXPHRWRuLRAlmuv2cy1cybLxqPKewAlzXFzHAsi
         EP3JZtTYcFcdSDyw+jPqxTQLSdPYllP+/ZayjFZ+5C4tCT9EzdFrGMM51wFBiXE8P9c9
         6uwmo1eted+ixnXTOkVjzg/bAi4f9hxe97FttsiDXqqJSCtOOXqXNhUdB91gWrCglWEc
         wiH5aM12uEx9cLQPAX5OHk98vwErLnoSdDXHnDH+mH0w9l0VOPObf8Bvw75mkPYuilo8
         dung==
X-Forwarded-Encrypted: i=1; AKwUvBzMOX72RyZagVESzDRDHU2nBwIKrEM6SCulH6J5arM/cs9CsK6ksSGKGx0jvL4OV9YMCwWJCxK+gV45e9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++khEF8k6TGOQT5ltu00qyyIXau0B9yPOza2qyCvc7RduNV8GsrS
	k/RJeMC8fr+DW6xxCtylVuMWePcmgV4zq9pwaKXtp+WHBRWlOmec1+VACe2If62b4VJ95TAAgut
	yyxs+4Ku0/5coBTddgE9P+q/pwelctUSCMgkPKXONECq4/tr3HD09N/biNwsfvx4qxgA=
X-Gm-Gg: AYBFou2cNVStbirJF/O3ETRy9Rp+5n+BVzGPNygEe7eC7EIaA5W/2U1XaUF0+XzynX9
	s9YvY9nFKIEIay3/gcHF4/mAjn5GIxGv3MG9fd/+hxA2nejkwCmEDd8aZJLu13kHXHwEzB1ACIw
	qMDIWCD+4Ya4f0A57WVnFEalFKvL3eNv1F4j9bJbZCUnb8V5iiKs9DPNyoVg6BqLOUyLwZwRjQK
	ozmGBF8MR90Bu1h88gYDb0/A/Upu4LY5JKWjRd52YsF4AWIjHYVm3jsTAAr4WRR3zeqjCJnQzHW
	xjHOf8M2g/0HiPWxGp7BwfG+SPceLZkLRAwKP5Fg9T6Xzc1aAYkGZiLzH2WQ1N/H4XYSoHi5Ik8
	zgp5xAO/zLt+MmwFi8h28ZqDUAIjRZ2khDlIfdFp+2hJr3TL3k4D6w5BazUmD
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr6620267a91.9.1788509818185;
        Fri, 04 Sep 2026 01:16:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr6620215a91.9.1788509817777;
        Fri, 04 Sep 2026 01:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Fri,  4 Sep 2026 16:16:18 +0800
Message-ID: <20260904081619.593602-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T1amJIKG_GHhhlIMnLfrkOpK-kQZrYal
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX5pzlDQI1VT3W
 4m4CGkJEEbHsIXH1lN1lWikBgooi5bJ3E54HURff4+9OPn8aiaijmVVntk1c7uwr65PVsqvbmqq
 FdchNt1IwyFtNXez99lpU/yuwVIAY0A=
X-Proofpoint-GUID: T1amJIKG_GHhhlIMnLfrkOpK-kQZrYal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX1PcC+AwjAz+z
 AlJgVvhyiZ0tLqAmGS7twMVzGc83W+ZfyfrYyjz+sfWqIOwQ1RMXSDtA4tSRnOvXC0qixPCs64v
 0LAYZTC6lfEmtjzEE/F78GEp0rVbrX+dH0WDR017piAjN+8YHyXr3Wr9FJH+NDlj0VSiBh6m+E8
 ICC1Yg7tUq/j8SJmuibbrbwa+Rjgj2mVXJDuL4TRFBWntrtzxxV/t6UuC/5bF+nxpkkdrp+7M0x
 pJkHH31/4ReDjlMwiWZ6BsVU7tOTP6d93l1syIxEQQJ4E5WtoiwcFRi7MHZijF3wFf5jBoIlYY7
 Vw1Ls96NnjwfJM/TvYUVGg1FqH8yC+KJqltg6uK2I9CwZd/mz/0B8UzKG5I33c0TH0A+qxnMNJi
 yfXjCToNTr/Q2UEfsM0e5H+D0eAewTVqrnNUZszNXv3mQHQh0+a8GlSiyOkGNgnfbouvzgkuYg8
 +CDpdpzCxJjqHUwoK5g==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a7e7a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2D4h3_R6Pk8q5fQxhhEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040075

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
based on the Nord SoC. This is the Embedded variant of the automotive
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0759969b8aa8..7efd837b0fe3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -407,6 +407,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

