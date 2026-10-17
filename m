Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE3046EF69
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230384; cv=none; b=DNVTSE0xMaL2aS90fQrDEGVR+cANWc9/qCpdkMAs+V9XT4iDqMnOZZOXZKUp7iI8IgZRape2ohj423thbkUTQi+yz8LdppWfELpcgICuWSI/WNOggq/y9y5ECXVtH1oDWMS6wHqZUyWtalxn82J9Z294BON4BBwpXFyrIT5E9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230384; c=relaxed/simple;
	bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi+14aW7YznArJ+r9UPlzh5oe2Txyj3enP4fcBSUtNKiItzE4vm+2ukfzn2hDmcYZHD5edQOP2zPR9ENRxmjToF5oiAv2nPvbhLeLug9pGPp5YncF/nGbbzQ/7+fgpdOkno3cqxMp6ATh8zlXGDgRXnYOApSmomHAzD+J8LY9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy7JcGWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvT4uPx/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy7JcGWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvT4uPx/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o3qd900564
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=oy7JcGWyEuzYQ3r8
	gYpKhW6DhfMXbdHV339j851MenRdV+yKSLpKD2DxeqzhPTy8ke0XdBDG7qj+KS3n
	ANukqof2EimQ0gc90Y2/8LkzgdpHVkAa26wgJSReWJHXbZXxpuWwXpK+B+Fp6/DF
	kXkWemia0zysztzlcQp0rqQR6rTJKcZOMeA3vyGlS2TOkTyxNDTjpvnH0aYyRZeS
	KPGGwCvEL0ce1N/HOdQILTcI5gee4KXR+Iw+InTFdrPTwt+QeeOougt0tM4umtHl
	luC7MZMw3ass6PuZ0QmaEodmQcJyJ05llYeAChOx27ZnaLzvoAsZfm4aff6UMq+D
	4njxXw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxgnmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2890314c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230381; x=1792835181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=fvT4uPx/voBnzHp/eSZ9q5C6RsQX/5sXAJHIlJYD/9bzULKgZcv83p4IynWzUGsy5F
         eD9Puu+yrJIdr2LfSzEce45Hz2qNilSvujSFYrQJvnVUQ35BbjYte6Xdjsm47uASoHQV
         1ULMK6QMZHdTj56rryFIaviGTHWt4SttOweCDAusJSKiUcPDXv71hTsKvcTZj95D1NTO
         UUuCvVCsXJpV+8zN0ZRt6mDAMBqyUVuWYfzGn9feLSXBRWdWPOT06sbsMnDxQzAqNEwv
         FHNEfuxxx/++L+z8ETZtOxrDuNGocd9mZeUwqfDb/7EX08VKnue6SUJ+0Y3XKKkVRIV9
         hvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230381; x=1792835181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=JF5Im0vwIJ+uVA027J38a3phJtt9oYAoryjiKokJ7SNcV5qyD3TrfZydZvlGwQc3rT
         xI64IRwaAZvbT2M/ZpbTDEFvA0jn0GqZLJhovDmzhEHVqVK0sE3nQ9FtjLxn3unBBhGL
         ULxzqSsj0qIVXQq2nD77uWcMNh3gaJmup/rzXEF4kkrFo3VeC7E97UlXVlisMRbmD5Pa
         7zmV5rNo07hdgc7zBThQ5az6k1JGl96dmwsdrGrlBXMWkddXXbI1+cVQ8IOV/WKvGHWZ
         aK04McCH374dGKFfLw5bdOusnnaNovRvQuh7reNfu+BR3z2yTRdR3zW+29kD9Ad0Dz3G
         aHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG4bb0A234qn2gOdqPmOJAy9T9RpY1ef5nx5wECI9IjZ6oFPsALHhBphpkbQaT3ufIaD4GkHi3In1fGRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9SsfNdzveffj/RpR/t3VhI1eOck1u65gxROMRhuNexz0u8ZI4
	HWDXorJhJt+K3qb4c8fU3GnVf6H0dnbcnL/GO3c+0r32CH7CC5tREK1eG6UZsvS/W95PaysP6wb
	5bsY+CF/tJaNFYtXFl/Yyei/Zq58+nGopUb0UU9JunTfRxibQqFGmLpVR15vDAlI3Qn4=
X-Gm-Gg: AYBFou2TdDkOOOi24I4NoqXHws1qorZ4o4GT9RGIUb7Ejpde2INZWmCxXIN5DqHlTUd
	ye3fEPgH28aCmb9PmnUWWBvdGlL/Fnmg6B86nfgUd3BpBtIcNMFA4a5myfih6KbYSyjI6PZfOSV
	yjQJsmU7oyarPhUK+n0ckxfBwHG3+/nQwEbCU6rY85PC6fDHYw/ryS54JfxaG7uJVI/vSYQ7eaJ
	qIg2RjOzk5ba3MSaE3tmxsrcx1VrhsZh9M5C/exGghIVeZdcHSGgsWrwUPbzEdxmeK3t3748Le0
	Ij/iK/uZUgKSVb3or9Mj/ks+Vz57+oKT8p+FXy83wkLDJ6SNZXur0dCo2JdQl0L4o8lf85tMi+6
	Q8wEAb5SZbLVoUCXWypV+aftjFoCDgg==
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr3139763c88.37.1792230381153;
        Sat, 17 Oct 2026 02:46:21 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr3139733c88.37.1792230380448;
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:16 +0530
Subject: [PATCH net-next v3 5/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-5-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1435;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
 b=ZnbcXm8Z2hi1B/lA4I2DjR/FLx1XW9n3Nru6ekJc69aowa7T3fWHXOPwCuPq/FxiJ/AKG4EC8
 Xn8j+raOiQ3A23k87poAvNp7QKPVaWHVZfXDNKxbKGRYZMUyb3vkDZc
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX4Jv6ZH7XKFmb
 KnKSR0+SsX6dSS5xZilnF3rpAx4Qh0IjOi6v7oS+s/fhjkMpJr55BDTbvjhbDkT6wqimP6dvCit
 VcNIe3baAZvCCo3Mt9SGdZQScbxaj3U=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad343ee cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VSm8jR0bnqFplKljzc0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX1grHcH0Dk+Vh
 xvlqFKwEJy4oni+HPgPoizBkKmeR7nzFOHlyxaYP3nUbfsyLU6X+FxMJsfISNZBlOaFp2Z9eLH0
 n9rQix2gG9H1mlJKU1YdaM+N7X//PWVhW9KAlRpTo3yx6w9bnOQORtAs3WkTq6aB9N2Fbrijazg
 9yIZ0iyTRMnxSZIScBzyo+Pu+CXp+DNPRjW937QUH9e5h+zyWmPnUUWPV1+fmZ4RYLVuTFTe5CD
 EBPW88SNPRjvm6MWoAIto4M4OdEkuHYYUYBcuA4oTDgJAsas8QulR5f37gU+hLX7Ih0gVAVt+r7
 Q0s2l2t4MXPgNqe7CZ1+VWO6uD1fS3FOtpbpRWMrqJBrwvpKasmO1oVcATLhS1auivi90hXX8BU
 dZp3f3Irdl5LAYpo8rt7w0Rj6K2Pq/i+Eeiz/Qp0KwpDNCbaKLPSiCx9Po84fk2CjpiIQy0/Z8m
 7pCHdW3w95dTUyxUPOg==
X-Proofpoint-ORIG-GUID: c_gHCp2MlY5ZmmVumKZQ07LvUphpwDZx
X-Proofpoint-GUID: c_gHCp2MlY5ZmmVumKZQ07LvUphpwDZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 53fb9de4d92c7f1b3c51c183064024f06150444d..a92bf4a6a2dbd987893bd4a3890df770bb7a7e56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+		fallthrough;
+	case PHY_INTERFACE_MODE_RGMII_ID:
 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:

-- 
2.34.1

