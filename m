Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ACA35F19D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032499; cv=none; b=IGU/ZCj+y+w1pnn0euJN/WNN1jNEUuVvTHyZb61Wq7AHgHYq295UO3Yw/A35xDzQWDQuYsAavq6WabQhLqjHN5+omQ8nTnMgytgboBj8EpKzsrgEhaA97QcUX9ZQbz7b+WPPjQLVPn2PjnB93zW8hBnrCDoyS3f2jD6JwFV4nNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032499; c=relaxed/simple;
	bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S1hz07LimmLN0iLLTxM48SBlbymZ8PMEVH/vzCflp5zAWlq6ZWcszFeAYVMiIBgmIu1ttHVMQY2chYHnxXCoMo8HAkvfZngVdhY5eK1OELoUMH5SO0FZqAzXfSz4ID3k/p1c3XPSJmu4gmkHUVqHLCCXdXo8nPU0qFJfgwLFxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1fHASae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBGNitlE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1fHASae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBGNitlE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx1s83454795
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr
	0rRgOknU=; b=W1fHASaeVreLYR8e0aAhG+oZ4kbfH0cC/6kqLiOExVdlkiKN/tw
	5UW+9KESK1c7B+YpLNybQ6m4/pDM1ZWhNAw7WVBat6Ni1j6BcPzzroObh8NEPhMV
	UURUQYEW9ea1ktwz1ivYzU2LqzQyhIzCbu44lpuMtLANlBAQEJczODPggbdnz/pn
	J33EjK1vf3sV4IxnHPyNg7ZWNO9ilXN+rdafgTe/AMzVRFA8Ym3jrfbGyFFAp8Yp
	9+6EMCSVtdOcL+fCKZaqGxFmebX4iex6GU/1PXlR+7SIWYu6Bn+r9vbthlFdXRds
	OYnsQehtSl+fUFGCTq/WSoZC40nCr2otBfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsnb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53001b668a6so7979851cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032495; x=1788637295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=dBGNitlEU2XDMoDEx7BsFuiIUl5uR3g0vJXagx3r50JJ9U0DYVvfzWf+X3AGubTm4+
         P9FgIShRhKK3zOSd3+iKgUY44mldgR6MBikZYrd0EDzoynve0T9Zw+QqPldcRivmlgbe
         mqMTw0/dZHJbvr37RYPFNL0LulKGa8r1wimFuvZ0i+/YuH3ZSeYiy4lk0RlasVe3E23t
         ZkT2ApVP7xExkQx1A/77a6qBQsxQUApbmasXgHpmYwvVPvejFpbw3WTR4WmieJeW8bPw
         mW4u72vj/ns3UJof6Ad6O+5rB0XgbUIjJ2W13TqwAdhk2uVy4Epj7Sz2/UquBzMQcJMl
         M4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032495; x=1788637295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=L/tXGh6Kbj1uHW+gtiAkNVpWih8JIkUXdbBvGpVfshQl2SimJgw4UTR6Yv0OwMc6cO
         e1aBkRq2tPUTEzImTnqADXvjFcJegvigR7P+pl3qJB/q0M4na0YWfIMPFgTmfOsv6LGa
         sveH73uf9VoV5lnAW89r92MEs7BZpzd1rkU6iEpiOnrNjTp9eV764JXsSA9rcgxzFDqL
         /aKAeA2SNJflzZe4y50CFIcGWMql3LP00Y6GSXSeVmfMTpBCDbQEjzuekKYH1h/Knokz
         WoImXnG8AUxVorHAcogyF/r0V2IAMURO8KmsFMwo6/IQYYKAmp1WEYbZFgmQOJXrb5Xn
         FPww==
X-Forwarded-Encrypted: i=1; AHgh+RpsLoI//+vnpILEMjxH9AaWQNsB0TN/6JDGoYQRQvuv99Qa5V9ltbHo6tigVvYHEUJcXp86/UF0BlHpKJU=@vger.kernel.org
X-Gm-Message-State: AFuF++ncowado8aglxsk2dWV5SBafmJNZkMPq4v+MflAXqP9MD047XEg
	VXwbe1WajfkU47DDh8h+RStcaDMpWisD3tn+kEhOWDKpe+lGHDm6Syv14UpztHdkUC2fYQAUGOH
	avjycbwdWx8MHRw5o11Neawsk6CRRuCWMiP5dE3+LdtSUi/kgIxtxNOYR8vbtkpNoqlI=
X-Gm-Gg: AR+sD11RDh42OFbeRnj1F5A3ZFmGg+9AtY9QfUILpx5G5hb+2rbv1h5usrjpBpzuf2p
	zhsOIkAIss9O+Tt5MJp8PUH4NW9SsgOtvAIxCAEWdkntzcLytYWCTSe3/NJBWtGFvbUHaReaIo9
	fmovGCPfl5ojwtXWjKWRGXo1l1kiK3zQkLGEtHrNfDYP6MG08jwszyvOfYhW2/mSrB7as59hgZd
	RpP7j7GLfMpKIexPBBn8QEy8E6yMfTQy2Ez463kXGv8y5+5lKdoNqXJb3N2rem2UxkQyiKFHAr+
	YTg4mfl6bibtATDRYcMWY3Vv7DZWAOVfISoPaI/tW7WwxEKJjTqYHGXzvTZgE+j57PkJGSsoF6z
	qe2DZ1f1J3vxIPVk=
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911301cf.23.1788032495542;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911061cf.23.1788032495180;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm2499802f8f.29.2026.08.29.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:32 +0200
Message-ID: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXr8Tf8bT7OCyOkAuUb/kCNtsQh7oAUs4V8i
 RtE3/I/EL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM16wAKCRDBN2bmhouD
 1wivEACM2xUyoCqIPlXoVuxlyn/QJ8FHgmm/6tDcsawf2Fro+zfY2Y5Y89LOQJgHY6a72n/xnjM
 GGoOYSZWlWJgFRa64oN8BwBfmy8BFSyB2USpUX9Sa88PGWwIBjH38PhTuge0fIfpCfL5k8k+SLD
 FuRz+nBWes8h7zDU0xpdV+QHLisd4U/ImjoJX4vUrY2UWNZnizuZMrJlhrrSsdL9zagFS7JnOuP
 57YB7SPsi6ECqgW0HIEWw7u7sH93bQsox8wp5BS+O/eQSAHMGclJ1iLiMgMAgC+hV7nehLSvJvW
 MTu1ZUWE+mjB98z+QiJveQef/Hk8it7QZvjALMURpOc8ynbF/Ye4VpVAHlWP6Uhy4FONU4E+P5u
 G0VZOkGNNdM6UqTwiajiMbmsD0twLMgPWmr/WzrWCtLAmUbXtCLtK1qWms8q+C94Wak+a0mBVRp
 f15zFI2CB1VY8zsABi94X3USYoMPKiTDfrTZ1mFNEXyLJNVecleBVFyCNhmYSSpSmlLiu6afEm8
 tA4r4umx2V0nG+RkO2Wz1yiivT8HdoSkMeQpfb4JZE+rUAD0Sm0FPaY8IFCFvjGQcNuxnPYCNXr
 L7wE/I0NO3OIXPODIWa5bvsIduxiwsrg2xzuOMTEJUWPDHusoc6fhOluRDpn4V8NKptOZVuGylb THyxiCiWRXx2t9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXxRZNcGYgtTc/
 /E4W8XX0XAiaVVM+ZJ0YzUs05ST1PJ2RQo/zirX4pwDso0mQMs1+YID0dV3VMIDt/oY+sZ7XiGl
 +KOsuF1tqf2yykdsz5psj6pTDmVtDyEKZmRW7jK6iBl4wv4Ge+/ErSlK/KzoLc0hOLtwvw758dH
 MMzH1XViz587LDqRN1i+jImDRvJg3PVRPao74vFUc5q5WLiPesSjdJoOlBxfqlTSqFab4PJMqWY
 g52OezrxqwwaarIwvf1DyrlcaZE0mT/8ZS3ofINnRMhIfleP2xHP5MlD6P6oCPvkTKULTdX83LC
 egys7TVOayWdrrfQnU2ldiC6oVK1sKy77FobBxp9nS0uhmgOR2St852/6w9IjuoIavfKEmOspUv
 OpV0AAX+/SzbwfGIcPAsYmjnsjdF1LnbxFkfGMd193CrV2s7cCeUJKII20rimGVELvxJdXuJKM2
 d4OqINMyUv19aJY+TNQ==
X-Proofpoint-ORIG-GUID: qxaO7o2ppZi-OXnc1LK7GxzNQG5qX4ST
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX9WJgVwQY54RS
 VCkIoDoViGYx/PXGyvwyF8I7BTBn0xB0zBPOmodtUkYaT/6R8mm6ztz4fGxV5EebyKW+ek2ageG
 1P1uMiBQcahEUx3bxeq7oGtuKJDSuHo=
X-Proofpoint-GUID: qxaO7o2ppZi-OXnc1LK7GxzNQG5qX4ST
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a9335f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
index 5f44f09c5545..adb9ee57ac11 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
@@ -873,7 +873,7 @@ gmac_mii_pins: gmac-mii-pins {
 			gmac_rgmii_pins: gmac-rgmii-pins {
 				pins = "PA0", "PA1", "PA2",
 				       "PA3", "PA4", "PA5", "PA6",
-				        "PA7", "PA8", "PA10",
+				       "PA7", "PA8", "PA10",
 				       "PA11", "PA12", "PA13",
 				       "PA15", "PA16";
 				function = "gmac";
-- 
2.53.0

