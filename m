Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200857;
	b=mqTt48wDrx8vUcLOm6EJtl7O+yX1u648UPC4PKibkX2UA2udCrnRfDTRk2aZlluudGEy
	 YoeLWFEKmXceeErmmWpHi/SLtseROgGCxgstU+7rgAeoPQ3yZVIsFsOC9omB54JEnsnSl
	 A4gRvZXtG2QnKQaIIhQnBuLFRpP1bYUxIy+lIEdde43zDWyHXqxE3WkQtXK0meszlOIQQ
	 OdrPBAkEh634sATKYORjLTjxdDbOl+zNYTatW+s0bZLKD8X51BjN281KLT9TV3f7MaA77
	 p9pboC71OSdUA+MIhbyiGC3nkfX9TQZCGTuB4A21XBcbpAGa4fOfrWdeASzoyAp9H+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=3TIJERaTV4qqo3Qaf7X7DBvSVHX5WZA8v2UhZUqMwuPBlqZn2urAVAXV4/s5ORXg3nXi
	 bQShut9ggJlrzE8B28WYA8yzK608oaFm9+7B0ct6JuJ4GKBB/IoNiyimHzYLofEOM3R3D
	 S12gsWZaIf3dspdVNLLO2MWugZtflMKG6GrTHXtkjGXlAnqOFYa4oHTYXggziwdVDiaUC
	 VoM/tyd+1+e/8omm+EnyD9eN3g/cOZgY+oiUyAnLeow63wcptViEedf0PF12UV70dPiJ7
	 bfwgIUTQK7i5TAhBwuIo/kx3WG5ejuYKhk4ZdixDWJLLXXdMRcmwIDoXlR2JrXOO1Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZrh5Nxc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69272606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69272606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZrh5Nxc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAZS61458805
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=gaYc9k84PoLq9363
	VhsGb/OPFThRaWzzY3kdP5OVzSpQVOIm3Ang8GUVi7BBUZkHH7CUcYo01bbHs+Kc
	9KIftVFeIzwZNmVwgwXH8GXisyp+A6+9lWH80kMHHngwTD9wkt0k7YoZtRiNJiy4
	X+v9e0uyepI8RVdOQhbgeTVocIlR0Ya6iL9xvgNNsxrE6JT7x2gdpcDRELPlQIkU
	Vw/C6P54c3xea0+HhykvhPE8xBblIKDMkhiEpclRAcjFQOfWYbrZeOeDAdJ4nGYI
	6xllza0er8CNLBkq+mYdzGusuzuyz6GhcHhsddki5byGcbab4lZnecGxu7Ermz+P
	fBvaaA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttrm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-679aa1bb496so1886291d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200856; x=1793805656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=iZrh5Nxcg7bjlqo9uBRMOCl5zKFFvt3Hu/6UUz866QL0MRNa3NvHjNM2WN1WYhzSAG
         /JaU3/nvyAPcq4bJ6Wlne08FdCGNB5I+a00bUDmgrK9v/+DFMoyC1OGQxlyFAwQVoMYq
         g6IlNONX1Nl2ioR7khyu8p/bu60o/MeylYEnmYKGBp82mpZjXEI62OzVTObPkRztRi8D
         hAHGqLZ0Vu/gJFR/a5vUjeXOl9SnKTyyPWDn/iEZmAh6ZUht7PJHFuO1QzYTUMIsEfkX
         21YKwysxd3288n5LNqZ/i/+MtHf9cc5pAosq1pZfl0NFjF7hsIlx79D3Izz81T0/DmWR
         F/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200856; x=1793805656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=D4MxUxUAA7ebdFc32VDH8DYE2Jz2PpcZI+GoTp9/lxJ2d/nsgNxKoauBGzxOIAMLOl
         Ojo4p6NI4CGf109x5AAUt+2gDZtCYWVW4jpDfnEWgESF7QTIFtNtOLiN6WMk7n88dhAk
         q9xtVAKcqtHUNYTZ5whawp+/3B2H4Gr4fvX8bnVsAAK/mCbvC6zhTPDEybU9obgGIpDt
         TM6mMz864aQ66YK+5ms1VnckNSkWjQDoHa2ncM/d6FyQV/WL198qGsRCzTW9K70MrLcg
         Wcgwlzrz9bVktPV2i79bViWCJtzRWIvYaayVe1ALjoZp2mJvPOauqe7v8yW8Q7HDQwjk
         cb8w==
X-Forwarded-Encrypted: i=1; AKwUvBz13NvucVuJXUUjoO8UP2NDLjn2mv0Cjx6Cmglr3NOij4negU3FnsUEf88xlvHo/y2OP8b1G2c9DeyXj3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN1Rux1X8+LZCW3KlTiq5QXmUPR7L/LJU4D89xB2bKOnVW0MTV
	sQhPR8hV5JVbHSWjjZDtANCUs1jADXKJj5xyZRIG09FuvaMvZqhWVygO0uxMaRqcuziuca2oxv9
	dM8ELXUEWRePjdFChtmqN6yH8TTcPk4Z6TA6wRBiVS4drbquEH+s5X4Th0VFY4DszhhY=
X-Gm-Gg: AYBFou33zTFfhOaWLXE6+MVW8iP9L9pgbHB1r5WI7z9C8qpBgaMssJh8ry8rFU3bS5J
	Re4yh/kXfWxq25+ZbTKaMO095I1eEF1UvTsscMFPRX+e6O/WMNNtAo0jLEvP+61vjBGA7GX+SSh
	i+T/xKQbHB1sWa8uPdCCqGiUxwtrJKjiiG5yxwMX+9HYx2gJmE6b0e1E/QQ+N85zKMxZj1baBhv
	OwjMzF5Nr8gExGzLex/DUdyw7skq/r1av3Hwir14S4qFudWp/3qU0dug1CUGlE0TuDz1YtHjiY9
	ohEroc2UTzZBBME6cGo2fDmoT2SoPEnlNwYDwInciseTu1hX1RCalQXLJ0Anf1tPEVWCJfcfa+w
	aulcFuR6+MJTxKunkHJN2yYk0zWa9MXYYujBoFvi4dilzkVl30G2qaSw2U1okgXG8uTZ7zil+X7
	cMCJ1+bC2xDIJliSOZSbt9ZVnWkJnEn9RXXOMmJDCnOyUPa3AwoRomQQE7YGwl
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474813d50.39.1793200855486;
        Wed, 28 Oct 2026 08:20:55 -0700 (PDT)
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474784d50.39.1793200854685;
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:35 -0700
Subject: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: u8J2WhcWs7RVHX_u7mvHJCUCmAqpLW2c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0QdfPsJotUGE
 /qqdoygA9IaDMidr/Pj2trvjVf9926vOEWunZcw7jvu4VbZKpXaJFb4dFfz5EYzNb/Hm1cn6t8T
 BJpULszMHX3nGBQDf+qp8BJqMduUros=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae212d8 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: u8J2WhcWs7RVHX_u7mvHJCUCmAqpLW2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXylRqhx9l20rW
 BuBIpdjbH6FL0Ixry4J3Q9iZqo3v959PW15gIkczYVtuPSqUq4joKOLmwItpdH9OJmvQCAmBpax
 Wr5Bx3M3dc4MPKYr6N6FOmVq85xiPKSR01lodq5XYcooNqRiQ3V0qUv7ahcKdslJdDvdI3+9hlU
 /N/e2Zu5pTo4Oz8LsowmmFhpuhlCPzMJVZajlQVO/8a9oE6o3KoG404it09NFLnH8Sw8TqD261N
 WIUBMeWF3u1HEXcncMfTRR86pCRSBYYnEfWsGQN1y7RqIcqzP8VBQmMfc2NkMagi70WO3AWHjVX
 rF9tV2jFYprfzWBZV9sCLSEFi3MnFiOtTBa3IiYllCVx2d2Z+mdaC2dFfW0Q6VhiyA4mojzAQwg
 M839B0nSnmAJTEDmc2gBvxo+ZMwFkfx+D/OSH1A6OhkU7Nm6wa/xmowp3n5nBEOWIXlSWx6SoHo
 CIK7sdRdH2gWEirPKDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

