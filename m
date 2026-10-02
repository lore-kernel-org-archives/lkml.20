Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E0F3DBD44
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970294; cv=none; b=FqkbHCWQ9HDKbiBAFaKSbfaTGJo2WvI9SYgCWQ+z0aOiCxzIYfrAU3aHnTGtC2E7bVeEkGqXHQzASQbwiVqVVy8GKUeUYtnrbhCgi1XSa0Y7Tcl2DF3xKOak/LBUp/PvVRdP2aZ5hPyhvZRqxE4A2rxkKedPnJt/Ni4wNlML+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970294; c=relaxed/simple;
	bh=L7Tyy9efQHGLlCDc8jRrhwb1lQWE6N58RL1qXGIOElg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIKrQwSySsISVywYrzbSMBa7uVHDWY/AT81C2QJzv7sOPg1LlySo4nNNbBnWRtDdfB4l5qX9RjoYmJWpTb/n/H8KLWV/4/3TiCOB5oCbuFIWMwAa21UJG8nUmXQSbLzeKgDo/nA181aT+2yp+/hx39etBC+IUhRI5dp65ILwr+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4cqpzJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMTCcVBv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4cqpzJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMTCcVBv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6IHl671582
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J32YgxFLTOq
	eInF4VnyIQBigrPxSypBHrP5/gix5Huo=; b=g4cqpzJjiD72Rok03WOV+u+AJDp
	jEeX7QPnuemuLqhSI1G4XGna1CF6cvm2alMxw41PNQb5euECcKFs8aPx1PM572cY
	+wPWFPG1/F9UFy86+feFacSgKbeTvup/pCJUoWRmz0OpkDarFB3mPRgWai/m4mn4
	+ydnA2Jy33Xv6ITRP6z5CgLplB1dYZ57UGL08kkyQHLgM4TDA0CuMQ8T60haDcb9
	0xQBxHJ6ijkygSMKHIKeA5wzRs3CvXU37u2AiXM2z273m0hsJNgxgT58Od4A1JR0
	0/TvHvtrA1WqU8rF15repSIH4rVYMoPaZ/5ggfyFYPfmItxazbuq0Rf7ifA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxectsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:44:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a438816dso4153156d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970291; x=1791575091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J32YgxFLTOqeInF4VnyIQBigrPxSypBHrP5/gix5Huo=;
        b=UMTCcVBv+tTj2Iue9xS1gFMi0J5C+rZb7QtVjpgjSsjqB6Quxk2G1dFIhTDHJuu3NB
         EhN6gTKVLQxkZXd8ypbnYik3/Ld+dKj+UaXezU5b7JZQCwZi43gb7WxmbSABILeRM05q
         gYOnE37rL988BdtCdzq/mimrYy1jtOsPwxuODCjb8ZEnF0sC55UW18Uolp4l0WoyFVZd
         65nCicmqDUqB5S9OcLRz0/wN7pDBcHGXzPYhSUobjn0k9QPCsnk5wKwCcoziCNK3Orsj
         NpNfEYCmitTyuel2znl2vYR2U3JxSTLOlPzSjfk02nCd/R4AiRlXUGzUzutzk450jzXv
         RCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970291; x=1791575091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J32YgxFLTOqeInF4VnyIQBigrPxSypBHrP5/gix5Huo=;
        b=X5s8RA588d+XWAB8+qOQF5L09Sv5rvLwrEcbxJ6uxgw3cRFQkSmK+WR3sijxCMILzk
         AmIp9AxaRT4NTk/6gXcBDa+l+zVphy/zOi0slN4k6wRnNXFpqXKIVcOCjWHlQiqKJqit
         maS3mLblphkglwKEcQGY4YD1w29Ic6oejtvkvtoEk3WQdmgmqN/THpcxlS8FmcPnfp5b
         I6p2khqSiwAHwalWiuIiD4pYRBGZixN7NVmCqqYPG+Ch4VrqiHymFM1FJ5GwOdHs36xm
         F5k57e7teJVQDHLwh78Ps9IrerCHUgTDFf7SE2UY9pVSQ7eEEo10EulB1dkU6xLResyO
         Kz8g==
X-Forwarded-Encrypted: i=1; AKwUvBxDx14dtl11Y+vPRXBQ/Y7TZxYXA+qYQ+igKLRVIXSHHOrwexZ7M+2pwp0AUu35vHS1jRLHUqIQNs/vdW8=@vger.kernel.org
X-Gm-Message-State: AFuF++lSpO5ScqltjfRY01Q4yd+kO1YjLydU5jDlId3o09SlnVO99BJg
	rS/uw4WLO9WW1EYNnolHQt7QCkL6olBJtQTyOr/mxcMyNkomNCvIjztXjyQ49NAKCuts5TFVsFs
	HWBks4xarbkpdW4ruu/sHIJRWmHE7Z/nN9UnRU+mpWrkzhTvxIhxzHpOzpSXFP1w5iBc=
X-Gm-Gg: AYBFou1qZ59Zh/Tl1PKusP48gwBYR3FLPSFEcdRcKb+4evACwkrCgiGrdRMvp0s9ysq
	MWoguwPQx5+RUzbnfNG3SnvMj/55JjINaVJnWAtlkhGKxH/4lZ7+2fkm0X785YhitRob/a14Tpd
	DYAJtCqPdBMrsTN49N2qt5CFHjFWDYaSpDsIrIHJLfQbj9Khpg21CbW4idzlzm0E/CG+F9ivpLp
	E1Zi8c11zwYTXF1tsONzr/01W4WEI46hKryQCr/zvZ1kSSsQRYb3bohe5KynLGraJT03xdssxGZ
	pdQj8jm+Vgz2LPXWOt2jLEyBJLfk/y/SmjUFQIqU4CBjRzHvghNAwslaRl3o999J7APN0Lf/wrU
	Xd73BiS0g9WAR
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr82721385a.30.1790970290780;
        Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr82716185a.30.1790970290257;
        Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller for Glymur
Date: Fri,  2 Oct 2026 20:44:33 +0100
Message-ID: <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6ac009b3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uR8O5Y6ZOet9NXHzM84A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: qzHxcLzX0iZRerrJym3Tb-mtEISVAVwu
X-Proofpoint-ORIG-GUID: qzHxcLzX0iZRerrJym3Tb-mtEISVAVwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX+I6p2BWLT6Ro
 ZCNhcLlt0rciYK6scv+AEutc228vSTqZHxMKz7zYQI/F9h9lAM9xktzdX6zHMGLR9ePEjaSR+Pb
 cEVVa1xDvDtuY5ToM+TktawjjAkoMjtpZBN/U9GvcRbFrNvV8oSz8/kqPcD90MZ4wBAaKWnL7hb
 lSFZODvBQUTv6lvU9S/7lQr6mn19W5G9c1d7Aq8y2grLOjCnHXdWMdFCPzx/67VqpO0xtDzwWuO
 6GkwU0hOg9mvMTWsZuwD3X1lk/EbzIj/6FhQs+f7AgeSohQ3L6h3q0tDJPUaY3zEsxG26BNFWZO
 5lk5PsPzjpL6c05JkjHLT1OkL8Tb6NJ9jrCjh+5fokS3EIZf5bzxbQsYyj+RWdTQNC8TmeDD4BS
 BXjIyAZU3NpT9EJE7Ppbe2Sg5NehtRj5VM76zn5WnUJ8B7r6ATjOgFlUjBeqcuWWjjOiRp/tqmx
 UojYTf/9/SR9VAEoJhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX1ns0ZwS0/O1E
 T7T0UfaoOmX+Kk0gfSuYw9xM6fMILYxGSLLdBLB8D5/A3Z47YHQ1TMD+6X+ZBfmVPUH/2lKIA3N
 l645UP/g+hP81wiO8oQygtCg/k3nM+E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

