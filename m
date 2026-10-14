Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74E4718EF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960094; cv=none; b=JLZ20gHtR+rt3vl3mM9KhP3cQpnp9DuCiXtFBCRqOdTnxGKviPYkt/+Vu7Aij3WRl1Jq4v0adJFOzQWiEt6Q7t8se80hHl/hO1Oid4Rhu7eaZ/ilqudJRQmiwVjsB3ouo8AAWGMizmSDxSYJY4d3SSembQsSFTsQUYVK3nwhfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960094; c=relaxed/simple;
	bh=PN595rmuOJuScEjlON739IE6fb80MQUkhHO9UMMLQqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBDeRyqLqji0c3QKXq/9yUNJIRhh72VbHmRYSsl9PATUIKLoftrAWR0XGSK53FKjHvQkudFF00VAbanMtG694nEvvUufY1Xv3VGyknZIn98OU5Xuq8VNjNzPldJAqOznEsbGlOrfSvRhzUtoJcfZI4paOVuF32WxmlNMjtwxyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUBCVXle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asZJawRq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUBCVXle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asZJawRq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4ebsQ806699
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFw1EjbkJf+
	dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=; b=SUBCVXletbIExXyHwR7Dl9lorNd
	+U4xsRE43da1jae57bAm4DG5Tb+qkDSIh2wxhCuw5/EXQeKhK/TtyDgycnJq9K1n
	fcP2y1Zik9W6XyltivNjCVFxxWHt2YOwjxL5d2UETPxLeuVd33sCOvgM2mF2JCs7
	Ovba5gmXVWVz56rMZsj6uqKof9yuepv5No5YVLMqCO0Omzzni1XhJ3Tl7oLTjb1K
	Rig8FR9TqMdgGVa5eqaInaQ9uQqbqoLT1QZOtwTXZ+2kgtOvXu5wsgKttGQCwLDt
	mVHn/GvD4DXsWNhBn4HW0rcbPVog2SWsh1PvXaHzp74Q9sJKZK6SS9EkkXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6a1e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89b52a188c1so57634b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960091; x=1792564891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFw1EjbkJf+dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=;
        b=asZJawRqF6iWC5wC4eqT2mkTMExuIT4To2J4tcgzxXkxI96FszzK/cW8DE18dH+U8V
         yx0+PgQnLmpxjH3ObslFzKbfD2VPBWtSnoyxztB8xV2TQaMjop7YJkzYO8cR1o/97MCH
         cvIIkxaMjCxs3avCaZ2EOdppHGJmutXDDAdBHf4wkVBhZh3bhDW77tASh4saXTFjaI28
         mR3/iD+TX9y3gcgjwPD0PQVKTD4Z1tP90qEmWldMmmZZyBM3jkdixb0BUDELzBr0PqK1
         MgP3qEKekWvrJJkIiQO4+Tpfrk31OHtl9baD77TTviTIgA9nV8qdwwLuPT5zb8VA6IGR
         peAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960091; x=1792564891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFw1EjbkJf+dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=;
        b=hwOJQk1g13KjjzyqHimSxMVlgVLD+XpGCFbInwueIT+EUHnyeUDUctKSw1TtrdfYoW
         uatnroysxmlXhjcRbSDzWpD1kgic7UjkcR2rtpRnnJlIva7lmUVTMPM8axlxf6uoGtlW
         RgPLZINNsoHqmLvChHQt5t/dpXGAIOktr2+gmImp4MVk8urZYYm5ZpszOhH+PDoYgJKC
         vvcXZUbealtfNNgOgMQp8UP+fxsMmx8R5M0xPb6+MVRRw6TsWpITquQhOrBC0aBIaSnQ
         uJEXqQwX7ZA+XVqNep1+h/74ER4AFriekMozwNLvSKsFtNOqg4S1M0f8qAiJZ9qSBvti
         B2lA==
X-Forwarded-Encrypted: i=1; AKwUvByY+0clNytK3X1KsNjF1g+bmJxdmspSfyV18v0Ymcq+pENmjMVG+i7KWnbhsgtUsw08NIzk3ewhfdmLRzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMsGQZOD5aVOLXIz1EiVFOM9/1AR8VNIh/+3XL0OVIGsg+79ZZ
	1aw6uiYtol9yHTrUm8xos3ChCbp+wNoFwjq59OFKp3wA0avk3fHwAIRFzweUAcPN3S3m18QP68D
	MOT2dYOK7jpsqWR+ypOWl8TTOIJvJMkPcv1NmCAKXSaFyXneXx+JpbmWaN17BvJGIMC8=
X-Gm-Gg: AYBFou2aK1WmFgrFZPoX2gvCjP3CdQtyIl4F6fOkBVBXML1YwaJ2ed/uvC6AKAB94aT
	oV5IZNGvxqYAM619GtbHv/Y3jtlQg4gqRWEkuP7vstqEaRntKr9zfQBVM05oMqpFcvIl6ZSYBx+
	pnkYENaqHpOjapwSm4Yp0ydz7feENX3OPTDSFKhwgBr0dcai9l7LArat8g0P8+IZYCLi2Z1/bhG
	rOfxhkh7B9yc7raxmtussSp+21nVX5Pvebu3SZpv0St4Gx/yhWYouN8dG4nwnDpLw1oxX3d1R23
	erxs48M2ULToLwpsYhzi4UjRQWw5cxA9acZdmwUO7FWs2GrjajYquRKnfDnMiSiiZ9wyiFpxaAQ
	ZZ9wRBKF0WtWTXMiQid6U+DYEvLDhlx8dqt4P0wJgzyqyQJNFW5NjodAMdJo=
X-Received: by 2002:a05:6300:2287:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e16be3aa83mr13683418637.36.1791960091290;
        Tue, 13 Oct 2026 23:41:31 -0700 (PDT)
X-Received: by 2002:a05:6300:2287:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e16be3aa83mr13683387637.36.1791960090722;
        Tue, 13 Oct 2026 23:41:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:30 -0700 (PDT)
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
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Wed, 14 Oct 2026 14:39:51 +0800
Message-ID: <20261014063953.549379-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GGrPr-AMA8TIb67WBGD7MOhd6E_1-6tt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX/q45sPJS6/dH
 TYnpN8HZEJq7/X6YpNxEq17/25wMw//0ipGfiZgl6vZ5KvyPMUsxnsWf4/tLyRrsgVMPZe5tr69
 kaTknIAVezw4uZKU8ZSYYk4UHkpmlWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX3w4SqXKCVvxX
 8VR4SYaq3HWoSPCt2bvch1Y4Meq9R+szVV5XfbyosgNAq7i6ys5ksWwikoHYOL2nSee9SyluX3t
 lPujPZLEKKEpIEpdImtF5I0TBStUtm0wBMlZ40ur/3kOkEkCyPVBpyFBDvGGoQQf+gFGCwWeNqV
 RnSLAYVSa/LZEhyWsmCfG/k+YNN8R/Gt5irRFLg34GYTVBUX+uwQ/i5aUMAEvmjqM6z2hgs/ol5
 mfUxK5g38dhPSEpVMXW9OAIjvbmftplinbihjWnigN8qLLtBvffvWYhnR6t/x8SnGejMrjk1Cq7
 KeqT5wdoj1ewkYesZ9HOZ8Mf2l0HgRaeCFaTn+r/ntE8OITb0VU0+lRDTw98at/5Jxh4zrqrZIZ
 a+MeYvqw8imPylPuDis/c1lo/yS1u7YDqKRqb0aBAbbuJy/j0mwItgHMx4eJJLd9AsUTrp2Qoyl
 Z9/VbxDfCdlGDg1xoVw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf241c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Lrn1JOtORFUC_bamxP0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: GGrPr-AMA8TIb67WBGD7MOhd6E_1-6tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..7557efa4e168 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -434,6 +434,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

