Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C1345EBB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355694; cv=none; b=D2EtPVipv3RyuDHQlWp9V4/TO+WPSTxWcE/bqGSmX+kxzu7tN28W6YbYNIici9b6MgptvXrHNc39fw6KAZ1hkjg1w+o9e7xMKfApahhvYuKmx0aZV5nzpNHDvGGcSjT/2uxoqU4RqNKoPyMKD3nA5xe4rceBj0eQ1qG+gug0KRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355694; c=relaxed/simple;
	bh=JgSErsi26zg54MOYpEmCXDaVXp39jM1QscQTntP/eaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZBExp90HOJbo6NPJ4mPgwLN5Cs/sTMsH5/KI+fF2kieuHJzRTjq/+BGsd7sCULkepRMf0hUjHZCQkF9ddhpqTWilsVHDkoutbri4kTpnl8LJKG8TTSYUJgrfr7wc8fJohJaRBcdF5iDodLpXmx+hOI+VUsXK9SvwS8R0S8jCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZihtD6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dw5EE8ZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZihtD6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dw5EE8ZB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2edmm3511297
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c/0YpGfZ0od
	ltJJBeDuWYSwAcG7JUvF6TS33dG0U/a4=; b=IZihtD6lZcsCs8+3l54hBjF+p5M
	nz/66Ex4K7WJV5YRcTTn8uHGdYa8sUeLcsrEQ4OCXh93HTxOXwyrKYpUnsY77zm0
	WIPspM/aPwPYSvp22bDrJkhLe/hulmTa8BaRMObzyu9bhpaf1riJE6oCXu8OV1UQ
	+aKvVbSLrxGJf8SGpfOLF25x2ER+ZA0+bAIVQMoV07zx7HBziucohsGpPGALzKJw
	qni6teYjuPVXDhg6olRLGpBCuiEyuJ+PBcRePS5eUZX20tSmGoz47f//iRTfcK28
	aOhmbtBwNXRHVODvbjam+AztoOPyoXnwR6hTnaZIlqjb9z8SaOkTgTrPOUA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d4t68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3674826a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355684; x=1789960484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/0YpGfZ0odltJJBeDuWYSwAcG7JUvF6TS33dG0U/a4=;
        b=dw5EE8ZBO+BNjMkRS8ug7cX9NngBn7LhKX/clp4gwc9m+Eeu/eUn7Tx+16lD5yyf1m
         /Gpkc+OyWmmGnPhZ9GXcBUzhgoIgLWP+8avED61OBwxFOuBukhENgfrhxy/tdPCJKZHD
         49HGJhWwfbbZD+SrqLymw/5Ga2qcbV8QmF5qrA7om2h0e+CU3HqRo4DQsWHyicSkLytb
         dpa7qDGaANVInvDz0BxUuqDGke2kp+9iVgzSLRyxv2oeXIQp65cQt4Nx92WoNg2WnTiA
         wF+Zntdqx6+AF2XQGPqZiGUIf+T1f6fPkL/Ob/XhKfrSzUJZ1p3T1P/8KzAWicFDRujp
         8gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355684; x=1789960484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/0YpGfZ0odltJJBeDuWYSwAcG7JUvF6TS33dG0U/a4=;
        b=No3TYIMiQuV7qPWFp7PQF4rWh9g8kRbErKp7SAiNqnTtvO0OMRQYnTXESm7P7FqDgY
         HFXuC5lTaaL37DIR7WcpceApqmPieyr7pMX9f/TLq+T7TErvSORIH2r1wy5TEo2CjNfc
         wsgkTA43XRDYqxXqo79wjD5HNTOvJ9nLweLkJ5J28sXBHH8fjJOtNiDIjwHr7ECfVKRe
         lgn64itE0GAgJ+zzoOcAbT03iOReNmrfYPPIJ5xMTK9gmoQAxDVLXkYxR20GXhR3IPAi
         PqoPOSKYFJRCHnREO45Z7Hy9sgnv0OLvHeak93Uf8TeH0o6NkVLeO0vqvmb+GEcXGMYW
         TVFg==
X-Forwarded-Encrypted: i=1; AKwUvByDOlu/qzCY9xH0v4s3p+2bBCn8AAwpxpK36MWbIAa1cKzlJo9jCmmlmIDvTwI6WSk9IdzfKeUea0WXYzM=@vger.kernel.org
X-Gm-Message-State: AFuF++kCzbR2S0vfNvXshn/SgxsevER2ayPkyKDYnIWyaYZtKhud9Qn9
	tYD63YfP/S3Fncf7xxt+dq+OsRHc9Qjwr3o4cY8TeOSi2noR81mtqTPlqzFBKHD/McHv7KRUf2j
	m2CYebFot73z4vp2ydymlAGuFX53LXymJ3T5I6OBhJ8iECqpBUyn5wyfPYlKgyeKnj2s=
X-Gm-Gg: AYBFou1cOYXYX2jiZfxv7NZuXYNyWeFb6RdQEEE8LhFktBlWcvIBoZ4+fbnS6iVoBki
	yetbpFVRagvfUZMeFTkQ1wJj+GEYE0Cwpp2N/ZwUyEtjDV7uBHuaBjV82EhGLp4n8s3uyBPWib/
	5s/YQAFDDqRY2fke/RtQZ9IskpjoQo9VAGrEKBW6PsghqwdguynSbaMYYJNkQfwbpTgH9oKM4lv
	Vhny/8rd85A5kVDdiOoAKQEcqH2ZOgLOrg2bnBuZ0mx8Omz7HYYOERSIIupR8Aazao/BM6E4tXI
	wpBVH+5pkWTt+TVikGyASwuSlsBnD678VbNuRs9AfQKVrCX4IuhRhvgdMXms4WdGY3H9FCB1lCY
	Gh0IBnPAIZIIda4oAlSir+n3qXfTJwRPZM3/QP50VZik1XW8bddxs7WYxW6nK
X-Received: by 2002:a05:6a20:c88f:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3db4056794cmr1158550637.19.1789355683884;
        Sun, 13 Sep 2026 20:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:c88f:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3db4056794cmr1158496637.19.1789355683475;
        Sun, 13 Sep 2026 20:14:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v15 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Mon, 14 Sep 2026 11:14:09 +0800
Message-ID: <20260914031412.140856-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfXwIEZSszAZvIX
 nYLzFkF6POhWeP2haF1mWINMQpB/Ednm9gw82IgccQl03T6FMORkfiJ38o0XYpfpsv+yr6RGBBW
 +FUTSNVw9k/U9if3Po5mofzmA7iEx7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX0Oq4h32tRvqr
 O5u6b04DriRrNQa/rASd3zWD4P4I2Zi138YKdvvtvToT80jMZBjtlwTHM7f5kw/ns+4bCWuC2Cs
 xy1B/WZCAIl955YWsFUTKhF923sgMyedaK0OWSaR0DnNQwubzk43Czrojp+PAL4tO74/BR3YMwk
 PtGm2q6zyX3cOZAV21nAykr6mmjxeaAs7Iuf1oeq1OQ3rASmfRU3V8bHYdqHmQdHOQ5e3SIgpdr
 RFUvo4Yb3Zfb1bW8L/dxILV2cNyUiQHvV7o3meNtC0TO570BhOI/QyIw/7i3U1JNV/X0zCLAhSq
 OwNp+sUMKfv96bHNi4CXXYZ3LZrm9c+Meu6eClDd9n9d1D7mwK10BE9YRSbCkc/GHxVzfENQxe+
 kY8OJaiRw+NfOX/OnZ1YT+/T2P/2PYyVIaBnDbCXkLfLF8PdAByceQxzPrK9i1igiC7F5ZgTG+o
 YcYoFALWEjA/XgRo3yA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa766a4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Rr4fF_klladUe2y0qzq1x-YRvHZ9MdLv
X-Proofpoint-GUID: Rr4fF_klladUe2y0qzq1x-YRvHZ9MdLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140043

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..f93027caddb4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -409,6 +409,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

