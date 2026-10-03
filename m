Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498930D401
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018156; cv=none; b=AvgX3ZSqbDAaPYdVsYTgNHBx043St+WtCb1hp6b5moUTp++bq1t6yxW6JlBwFqkN3QYRDYtRCJ0sAEFsx//ly2ugyNaoyGtooMURQbDZINd9XnZS+NNdOE4j/0X4w/rBZI0rMc8JTP9gmvfxiUnrFQElO2tavqoY5fPUa63cx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018156; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGQJw75xLzgF57qqK9snVJAr9axGNakjXpn1WQWFOZ2agKMUYOmoUIo+FVrKsOl66TGeO16Db1ha0qyQ5UiFbnHzeF/7E0g8u0xN6fkFkq5OF0TGdAyEml6PRUy02A5i3AWioLBxIB6aoW3TY9bKIUEfWfDtF/m0CzLvIwDb1ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogMdz9dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfhupzPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogMdz9dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfhupzPr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933e8qu3191152
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=ogMdz9dtnkNt9NiF
	mncBgZrkk/PbUD9dUTBN48uxQKZ0MjsE+/0BLq52kGWwc7i9SmWmQzLIkrHFfnkE
	Nk6ma7f+QHUDePJhOclAf2h1ztTTDa7MKGIzHhTf5VmLTjKW9MBTjlUx071rwrlc
	RuZC4foss+uuuRfWLTy/9T8hqGtqP2WngEbmDbulTbM+Co1/ml6oqQWWtQoWqDF+
	d1ozFkMRi8fUZ2r3llKFKziBjARrkFFbd/J001cC3Gw0umXEPpaXEfJ958jeAz7D
	brtcH9Hwyq0ZqX2hgbXh+/VfTh6e0eLgH6JwuWDy9uUMkDm2og5GozS/+X0gj1lK
	nPVFuA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06rgep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30f1b904861so479214eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018150; x=1791622950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=dfhupzPrsz73Eq+JCKZhojCkVafMtx0PiadT88EW3BeRkoGgfJezpic5CNM0HGFFgX
         xKCuLXuZi3uF83fWs8Nw6VMTpu8t0t8j+VLWZsdD3M0/WMFXRJnu9DRkGwsTvcr2cOCR
         wmyRELkYetBnvGuODxzlL7TxqBIbMJAo4TNlehqDovx5pIW/hCfWjBQx0tlni1PpcfNs
         VV9+9j3wL3FGMdHBecuU+eV/j7QpO9ICNSwLYNXYd/EjkQTF6gz+iFAS/CgdDtvBq6bg
         aLYL7NNU42acNmh3DMVNx6snPcXbDPA3hmHkdvdltnm++IpPw6GSYMqlHNBgReJJTeVf
         P/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018150; x=1791622950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=iT9krtQcRA9ui3q8fY/j7AHMYn7wO3rz/yOty2tII3XgnPS9JHCycAzp8vcfQlXv90
         5ChzRIgdWrZd5BU/ljRkcBfyC/m3hXkEd8j8HPMf2VpngzMBEx6RLxKv7mI/MxTHwIvZ
         MPwHuur0rn6Z7wP2xb/xJMXGPiLCZ0yLaWhlrGpny56+Pmm+bTRUsZa1i/NxCK7+8v32
         3tqz3SXs1vSeKFEkO7/n0SA+63qRQt0qY23GIgdljpEv7dFfNejRogjtgESqfMsq2l5s
         /gydfWGTc3neNTDWqTvOusIB5aYa2rPgis+cqd0c4/2mRfy12+RGfVf8hBxSXWIGbcFS
         QKqg==
X-Forwarded-Encrypted: i=1; AKwUvBwbAitPP1mu0CSiCuoDrqa5r0kwctw2mPAIN4LN2ErBmlQqUvkx/Imw4RZlk/315HE3hwHtyYTD/AlMask=@vger.kernel.org
X-Gm-Message-State: AFq9FYKygrc197458trvGu8YMjGHa8dMhr+q5Mg77u+98PV4D4/giJNs
	GtRDlOBihltw5sHjUrcXSHWaRduqOpR7wOE2p6o1JSvk03k1QgbkSxBu4m8AoD+vyGruxY4w/TN
	BTd7zLpwOp6jGZWCvwA7HCfSe6Ca5OdG/3xI/G4MlUDj6UyRxjfT45v1xDLQGgom/bYg=
X-Gm-Gg: AYBFou2WdfbDuTlJMm7YuwbcJXVrTlBNuX7vg6KkeUxPz7pIsW0JhAD47GrxSG/0PF9
	4heB/PfK5gNWLYVcgAVNTsdgRL+zBhdX5/Lh6qjzRtIEbcV8QFaZxoZUB7I1haINmpSow2YcL0u
	CjGng3rj105eE+OOQzMxxXkCiSvVh7DaiDJU8yIuYxOg7UajVKRq8PWFVEOrsrsUmviyRUIynZm
	3f++gT8PzK6kXePA0JtXi0JmGgTu1xOaJKYVgl49gYB31VUjYpWPAl8uf+P/DWESJI0P6uQ1ooe
	J3DgMBr4GiqHpZhDDV5XGybBoAeYsWVbX3bZLYp/3qqD7CGPgq0MZgxIB2WYuLDN8rwrKS6dMeV
	JiuQWCu0tAEjTsALD+LB7IfJsmDks5xiTbXvv568aLKgmWoOXPLPLkkp0r0NyBGgawulifbPx2v
	61YW+BmwbtqA==
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24981eec.21.1791018150139;
        Sat, 03 Oct 2026 02:02:30 -0700 (PDT)
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24919eec.21.1791018149567;
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:12 -0700
Subject: [PATCH v18 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-1-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac0c4a7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ounvAmhct5iEOiPvsYE4sR2U0zrq1nkK
X-Proofpoint-GUID: ounvAmhct5iEOiPvsYE4sR2U0zrq1nkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXyrzorrFvaRx2
 FH7ZNHDYHkS+rQanXObM4m7EXt73G1ZjGjRHiqn0rNzJJB0V6fulvMJeQEpmFto9yznjQJz+yGK
 MCctgx4FTKZKtUph5+P7tr8Hj9m6LwQdmNBis+IrzpHxQKRB/l4QEMUjSbmN8BCzVB3uNW9bLYS
 35Ldkw3KUNFLrqtpEFT9H1828rxjlzf7fARVjL5xY7u4YAIHw2tCmI63S048MvtjouvNmZsUkHC
 MHO+1jWY7BXr6xNq9Wf53Zxx3Bs1VcgdndLvFziWxXEiskI0i3+orewysOP2jBaxAb4j/hjvYan
 vfIDqPw4UjuZt4XHuAYqxpT9KLD1gTf/lxoS1yoNv1qcNCFCDefiMLK9mVBSmnlAxosI4QJ2SUw
 9Wcj5yUPu3R6n1mmmsV1ZJNpx0qAhBfKNxwo8y4CxdzFRH29jUjCVeCawjCMLP9k281SYW0rJOU
 yj4bqfP0q6wIcF7XxYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX3s53oy/+Jxzg
 fYzsBVVV3CtDO86HZRHkjffer/tRm6/0+3by9cp3WU07GYBx04e8gIJOEkD6PMEfXPCuO/v01Lr
 Zu4gNP+N/VJUkCZXaihbMWlO7sLSUqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

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

