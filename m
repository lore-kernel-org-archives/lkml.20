Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986652;
	b=rxVWfviBQfwaTShYi/SxL4w8jHQ0BXVPIwFmIFFUeTLppE5YhLOoFSC30cGcqVh9ILGf
	 r48qaFnuX74gJmCxcLPKn/bKP/bHC2mbLIO5xnos0ARLigFNIrgJkyk0JoqoeAksxmvx5
	 yxzj/nIgvppuK3PXJA7i9tWh+hbxvMSP71kQ80UyiNbkIOzob6Tym2rM1PVzye1+TsaTL
	 y41gLCWoaCW/jNkpRqZY1qCGc3bRRu9Zcs1w+bZTT7x7JriI2L5hv+bBniFonplD2WxdP
	 GAWqELroeNLKRhaETx5+uhqLrgsMq0QpnGXMXGsNv784+PZVIOqCU+OJ/pwsdoFNP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
	b=4PhMg05aOi7Ihf56usfM2MJFO6WCgUwvQ1DJyasvTx6ktZS+pZcLVa17YEUq5VOu1NlM
	 vGDu9/mdwQVR1kVXT5r43OZYC8gsOxgpMYcqAN0qjT2SZx91YVC1/5ZDtJ5/ZBF4TQcnl
	 u9iJ5I5rvTtZLIkPM6hL+k1Vkc7Q/o/EJuI8uvHBkiMNy2MDLmj7kYwhqsYDXElQkgzTR
	 AnOFx0VtnLKfwouooWghKIaJ+hGqLuFghdcI52zDdEpeXPrH4sDUIewxrpDMFcLHZgb3V
	 U5Cn9b7kgPyyqUXiR6uOaIqjRVdvMml4w9TyQQ3taVoULwpbT7xs/EB00BLHzc/44FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQ7V2gyM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYxGzbqS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD1606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AD1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQ7V2gyM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYxGzbqS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExnLc3324685
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSWoH1B3xqS
	+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=; b=TQ7V2gyM6iMPqHgI+DTRf65TdRR
	tfCdKTJHDhdmWI7Ckk923laIqq1zSVIVhBT1NbKMKuBUxLhgdb0b0/QmCdqckJIE
	msXYnA446NPHdGKU96zbcUbEHHVTTELZQZ/TUCOjB2qjdkJRJq1TEglD55eiJrUg
	/owUE0Z3LLsYFo+1Jbwd/Z/20G3yZRxG8+EXfDqGOFeipp+e5Ik+zQtBUfu1s7bL
	heEC9cQZKHPlPkp1rlSTyfGoGE9rnk+NPJULpaw6UTrrJfyp2MC1rGTpiM/5BmNt
	PJtTyqy0qPNzqxMg86DUtPMujgqoKDmdg8T2BsJnzQNuOe90vHI6pijABpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9c000-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:37:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso374974185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793986650; x=1794591450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
        b=eYxGzbqS3qCQalCYnDYdr+KbJuy2DbzSnQVqqG1Aaz7k7rHGtB+9OTJkrUu8a+ZclA
         acyFdljDZvtlerK1T1JL/Gr7XSQt9kVAGlLVApwnVDSNeP5IZeKxgDAYQvvla8WgFdMZ
         VOfuYKqefkk4PEY6MXKjlGn5HR4+VUck6EUn/sn2fc+ONqyC7U/86YrO2ftCgFrlSVqt
         WgwByGCCDo0/daKEKmZIVKzAJyr6NevkwaAgWYAdcJBv9cchIoMdP2DFhO7+La4IxMMY
         9Vk6DhZkGWuHv8pUwlybm6wonx6Yu+ulsitON3yI52UlosNCe1n6mI5Ug9841YhpDlO7
         R+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986650; x=1794591450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
        b=IiwO05x9/QEclP4KXV+BWAKVeV0Q/hM9EjXs5NOToyq0Uedq394q5pEH7RkAtLYY+1
         6xZeJVAp5GLTkPO2t815YfO/gxeNV0rPYW0wA5qXMnoM/ZoezSQBnGRlQGxNY+6WQcuU
         WOu4t0MGi8zKXGaIIiBBgY/iIl7xp5pPzsPwENT328c2XZXgJtZZvBU/G8R0XUcMepLS
         wvfwnf862ImZUSpiDUePyxSHNP+BusZ8unuPSh0ba1LVmCBZlDFeO/DNCxVKEXjSz/Oe
         cnRnL/lPqJHlARt0iCLaD4zV2uM3LpXUJKEet95IyvpWWWS8Tk+T8T61+VABTdXpO6FC
         da0w==
X-Forwarded-Encrypted: i=1; AKwUvByByFPF01+40pHGDhdbFkaK1YKZf1i9g7WPVDZxr4OOYcEMg+2RTkMZnVRX/EBULVb+YIhIwS815wvY0WM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SBBY9GzVZYSXcuDqF31aV+t1mbCN/v0I1BB6jCWKQKqoOP+WS
	bA7fRCsGWLmYfBZZjZ5xLt6bccRh23vHv0ULERgjckFMLUrP0gsAAvnw92acze9wKRFd/ayeHcB
	N1FRMhwZUaaDT/Q6nn1uELYfRs/yxC2cMF1qlNWtoqrlZSy29S4cngRzIHH4aRMiqKzs=
X-Gm-Gg: AYBFou3qWwA56mtTO/g567qM8mShFa5ro3camGFKBLbSDspDbQW6nXfx+6wzRZ4gF/V
	McXikUujvKReo7yxLDGnbF7Zzp340NDlAK1GgUALFzRDlene7OplSkdR/4YojOfLqieaehuM1Av
	VB4F2wTxsKJmAXnjGhSgW0QWMpQ9m2mGlHBUofVqwHpH1gWRltYdaza08I1A26dwG3YDHOnhpsr
	k3J0uw3BSXqx04oSeNttGFeghhlQuKfUNKiBoTW56DPqn1RogAvUYCxueNduzBSGkyCD4FS5Knf
	8UDLUXeoYKKmgngL9pNj4SpgoFN9K/K3bLH7dROsvXkZhP4aEZYCEM8KHYVy2Vs0gma9Fr6SmxL
	eDohVALf2tASsJq50ZRB3LePf0sSCKdutwMFkj+iPC2VQG2D/vkrh2AEbaDqo0w==
X-Received: by 2002:a05:620a:414c:b0:93a:1196:ce5 with SMTP id af79cd13be357-945e17a4111mr990646785a.33.1793986650373;
        Fri, 06 Nov 2026 09:37:30 -0800 (PST)
X-Received: by 2002:a05:620a:414c:b0:93a:1196:ce5 with SMTP id af79cd13be357-945e17a4111mr990642485a.33.1793986649931;
        Fri, 06 Nov 2026 09:37:29 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm84256135e9.6.2026.11.06.09.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Drop non-existing enable-gpio in PCI
Date: Fri,  6 Nov 2026 18:37:21 +0100
Message-ID: <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zu0EGxqMzGFfmSiOqNguX77I5A+Rd5yuUAj5togeDfQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7hBTLvRS9GqylAYZy1MZs4vw5sOSDN77Iqwep
 HNfxJCyqV6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau4QUwAKCRDBN2bmhouD
 189VEACUl1zynl1sPCOeD8PtdyJm8Pb38cw6x2OCQvaXXxo5Jh6VwK7LA1erYWMOk//WzV02Wra
 fWf0CJviB+BWIY7ZrYnjFSQf38ouCGGiyfHp11luWpdsyz3FrNHsUG4UQbnDWFRxXAIYV4kP7M8
 cMm/U9LkhtGIFSyNleiaUZqjrX19aNPdPo5GXw0x88aqXVfenmorlBMqolvqd8A0CI5PxfrOFKY
 J8qEQylNZ8GN0GLXZpqwnH6JS6h7+ET4/3K+ZCznt6kN0R7WYpHJiDI+RkPwyBfsVPPTN3JG6X/
 muMtRzHs8yxio6eE4DJpCdoHkzWhYB3DL7r3zcCR6RUhUYhh9KKNJdOdeVf5DBPCqCCI6wvSdC7
 tutovzFBI/IU+L7UKKh0pmqTadkpfZvoCl4ZsnAlrPGjKCswJqVkz25Y+SBslm8v7Rpu4wGBzZL
 /9LXBp++/Ahz6j1KaAdcx9TN1ER5BuCPhdFttBOL+lyOEm3wTBGxe4V+2VjjTyt39wd+dlEHVEf
 5jiuXKCtjEWnQ1zdIVIVXMCtRg1L0L7NdUczSrfYI5vF90TZ/rZyHlhdnXrFsY25/ljjW+5HyKO
 3zAWYYLzDc11qoLtx+LgefUbwv22bXL25lpAMPsKGCIhhEDScXbrQdQUQlo6Lcn2EB/Go4s6RhC 5BOZVRFZG/NrLCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yXxd2ASw8Zzcfr6vdkgDQeTcyEuwbD6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX1cQPfW6Ub+Va
 15ZJMG3cdZZubDmHNroMoaZfXxxOa3jloxRLtZ+b+x/cN8F6s+JssbtEzCPI3kxoMxineyTkgyQ
 qlOvF344wuML2IslXj5oopCsUcGXqUhzJLliZEDO7Vtg798xpi33rpJTF9rUtVU8l2KPJl7cNya
 6xRgWANeFSNgrbUR/+bkmUdN4LW/dO90sNQQqXkyAoKVDuWAaCFEkWsrpcT3iDlaO0JZ7GpQ2cH
 cELItB2EkoKGVP0doi3/Jw1XIQ4JMrRlmLL0OveBfoj6Hbhv4/kMsEQi4par73zQuO0wbfun3Dd
 Pmm93Df2pdF+RtmFwLBq1G0gM3U4rxn06oKEK5AVDC5N4rhM9B93KmF0wMxD+khZQ3P1g2VMj/y
 Jk3cNnqmy37/sawEZOX+qXxFE2RUaAu2Wsiw95ASxNSPUPlwWpTJEwWNbYjbA2NXpynJU+K/+qr
 Y7sVBl/5JU7VWTcAHsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX8aRTrZwP4pMW
 Fl/PbjIxyD2oYyZV+whjx3hf0Gr2wVl20qFSTkgU9J0nHFdrcW9GoeXXAKGjOZhJoxt/PYwKe1l
 UMjFFhHaQxtdYNHFsuUAW3pASZLa0to=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee105b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Yf3vPEn-BI-scYSMMdYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yXxd2ASw8Zzcfr6vdkgDQeTcyEuwbD6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

Qualcomm PCI bindings do not allow enable-gpio.  Linux drivers do not
use it, either.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..e62a3005134f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
-- 
2.53.0

