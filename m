Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655831;
	b=r9Ti13qSmjiluyv7D+2GqvkymjqMIu9lRnMy+IAp8RWp1KMLzPQ6Ca6LcOPquVPZBepG
	 rbf1PLqY4mgLDIvD162C/IJUqlNGGdpmpTVY5CcKYcIWhgpSYyzwEhnoqrUyYvXwnlWyt
	 +XpkpnLV7fQTZTWecxCeDCA0xYha3tYNjKJAFGOv93+FxXkpqImjtvn6hTjsG8opQLOhm
	 9r4jsJJPRiEkiSRSMRmK9/SOqcZCuangiZ+SDucd2Dm4JcEKhk2qOMYwiwt6s4Hujhka2
	 37GSt/A2GWQmHpRHAC0mXYSPOWzntXPQKpLrR/br37+BXdN9HOsXJq/b4NUC/TAXMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
	b=Kw0uDcqEn0SNuxqNpWVDRcTD3dbH35LYmLHDfW9MOrTWF5PHSgasVzNt0Mtbl0tqynyd
	 y7WcMSYUPwDC98TZe1IhAK5q5m5KG6mYPCeOVBDvjaRnalizy7lq5mTpZY5QivDCI39t1
	 CMLYLUizxP0nPFF/vlVcHDzX8uX3dWUY1f/Bm5sNyMZEFOykyE7GT9UtErFK8u8MBkj2f
	 LqgE6+XokjY1goC2bZdOSBrWcZ07DM+Rdg6m3tybds3jFhvAsni4D1b3QqP8BkLaMnVx9
	 TLfR2gE6V+drgiPCgL2cdT4NWEPC0knDmE1x+vDjOhuckvNEkKQouIWKu8aMYPPPuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B82606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B82606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wD1s3379152
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=; b=UMfat2ax+68EdAj/
	tN3OQH3rgy2YMQ7HZ3iUEIoolyUOFJyB9OYDkFHOJnY//GU0Sm5DsAPtFFtfFTmK
	yJABxKn4Xg07JqPfLUxDivHhVzddOr59fr+zdO0x11qOER0GaMcpI1YjU1W25wRi
	v84PQwwfWXgZyCr7yVP3GPZURGj/2H2kHmHATgOqN7iPXoQGnLdbE3zRitsZ1Uek
	2ar2e8nRTbxfbO9nYdXuZ7lSDraPgL4UK/7JbVWf0JJ3m9bOjc2gon+LtUNY8IqC
	XgZmR41ifzSDtkKWKcuoHsjf0yQvsHYyexFpQCe1JDVIZke8XaVWZ8BS0oS3Lq5S
	8SFPnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0n1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eacf20364so40700796d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655829; x=1795260629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=YAWRbO2XjwrEofSNKRgJ+tdVY94h2WEcUXl2+DrXlLWHmWmLTm7aXB66nqV9XQgYKU
         EVZ8DdA+TG6F8hUQ1Ox012hue13MF30WnNsmPNQDVnv3tqxclPU5fum6dNLcH42c5HLe
         UaX6S2Afyb2HvqfEQkA0LIoVBdgO5hUwo1XWIu2NnXeGIaAC/ipeFNffa2EYdC/c/jqe
         WaW3CSGUPc/056L6WYpyF3c0uXV0PhUHv4vwmjOGNR1TPWH6R6FN0Cocn0ONq3U584Cn
         7l3mzsFG6Hzhhxf+kO8paHNgVRPGkDPGgx5KUNu26QGg11QhnayfamenAnN0M1gyAq8b
         CR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655829; x=1795260629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=0dRNAnzrEeHEckGzzH1ug6VlxYYm8ckgWoKhpFB+Szkg7kB+Iv1Li5CEvNnlFqDhyg
         IbKu46qIBV5nQ3ZN0jsMiqt6Ygz5l9crLIke0Ir+deVCnpmHs81w4/8edhLZnPFIrjHS
         DyLuDztIRQjOx3D6gTEhi4PuiZPMHc7P6aUYfncOGGtalmvJhQkN/P8XFKqQju31eRU6
         SLgRzfYIlxkO3JTmnFy2N9XOm6/iw41q0+X2aVsNeJt/Eo6by+iFVQzsyDeZYwG8VWmy
         xBIY6SD5Oe6d7UYyRrD/p8NuVA8a+N7H8XMoE9NEuUcbX/SClb9Jw78ByNFryHI3jOm/
         Io9A==
X-Forwarded-Encrypted: i=1; AL+hErEdsXte/KVjabIhtBsK+cinVNPETG8aC2Mzgks0U5uJwvNWr401fH6JGseXdk3CB3D6hbVkIfo0FpxKmVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RUphK3uPDpI75Ax1PeS2nrNeSTRTN9mFzkwP9II2WhzEfZ6iP
	EUypbQyD4UsJJkU3BLBrVYE341HXtaHuRDWfcw051JmE4HgAyNTKLVYN7icf9Y2YQWkDhUm9bjH
	VgCGxafCwwfCEoJKBDmQdOQ0gpzZn/WxCRvcFfAmUqYpzfTnDsQPO3Tk2gUazU+0tQ58=
X-Gm-Gg: AYBFou0esEKOMNtl39KpDiN8GS06CS39KiRXwFqh1C7dmn9tPj2mjAc0pAhL9GhJz7p
	d4qD4F9bk8m4CnS+0iUs+/asDJewKYlxjTqfkMjeL+hnpO726jDPCLrWCF0gG2ZotnWOEirwEqS
	NtZkro4HAA5mOvMt9QCBwX4kQ07aoXkO0gGiC4j9LmNZbjI36a9IY4Xln0qWufyfC+E+omTyJWY
	XIJJ4o9AptHzStwcTPgvra+XsBNXiWTPzwNBeyH9aNJ4cvNAXU+d0du5QxQiabPCzWPhmrwZlIi
	DwL0cCT7tc9Hy6Wyu5oQp8dlPDLN/WDiuM0tgF2liFyvBSx2T/ZkvFQCkPKL+IjJsiMTeFD7i9B
	IxtaAhhSy2oc44vx64GfZKlt4HFfNBT1w14LNzwFn0cCWKfR+g0Qeg2EsieGfUgKzOysnm2rrBk
	ixMn43fiaTI2/gK0ulLpSjLFjU7w==
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960596d6.58.1794655828857;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960156d6.58.1794655828431;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:27 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:22 +0800
Subject: [PATCH v7 05/23] dt-bindings: i2c: qcom-cci: Document Eliza
 compatible
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-5-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1069;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=61yDOYkYSQzcaMNW502STOCKhR8JM0wrwP3tqxLNiqY=;
 b=ZmGzJUN2j2tTw0MqwLjAcolX1NvdlwsYsUMfPFvO3fQNEEChYTiWO3sjeHeQOIt4y2OG5zUEe
 CeqCoKP/0ZpDr+LXQ7U4OzMgWHKzuzFtWvMJMaE+uaKoldTk+I1xiVq
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX7LeTlFTMMACR
 bumlC3Xkt/WgyXzJn/1oQkYBMGc6wPENvNDymoVk4AlPOt5GR+go0tXeI9XyMvj9SDIVUo57GX4
 Mv+1SO8VP137EKvSDbMBmzYN+SC8l547J5JZcDg6sPZ3a5eJMr6nrS7SLGq0l/kxKHzSp9PWl/F
 gRNS6b/BkCj84C85K/GYcU/wNxDgWRTE9EJz5ujVBawhezAdFCXfYiOx5l3hENBeVRps2SXeTxn
 6NR2dD7wPr566XakmikWjk15umf88sR3GpylqRPFIvOkFFYEnKmQ/6Ytl0vwxIhh8W/lb2g+0rC
 sV5JudrvH38oIoxprCfOpdgtPtYDm46CSVi5sSu8R9PUjr2rhTCuaDLMjfiHNaiIXproFBoSM+8
 keto4gOiTqWg+YDActH9qFYVGTMnmO7ymRhR6OzwciS7KnTGTdj6/Jxqt3GU0EcEK7aUQ4iMDd6
 MkBqwlPFqXEFH62qRlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX3wi9JcHZc79S
 Pv8s/J7UFodtEs/chO6g9j0oERtMXohcaModQdahDLS1O1cslPXi0Zy8+/Eiz3kS1KDfuX/Jdx9
 zrqhSoh228IzsGSOl7xZTw6pe+q5Awg=
X-Proofpoint-ORIG-GUID: xK5StwH6freJyKwSAwiE7zFlVoEIjCuR
X-Proofpoint-GUID: xK5StwH6freJyKwSAwiE7zFlVoEIjCuR
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af84655 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add Eliza compatible consistent with CAMSS CCI interfaces, falling back
to "qcom,msm8996-cci".

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..f16298d94177f906790c18831bfbcc5557a5accf 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
@@ -136,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci

-- 
2.34.1

