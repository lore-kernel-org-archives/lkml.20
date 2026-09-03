Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5A37C112
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461702; cv=none; b=t3uOqYyarxTg6+UD+ayvkTPJBIfr8AXa4Lrea4qMpoHvqBBqEeYdcP0zktoMVWrwIiNvI51tsatIqv+KprE+BL4ysGO+sGSEa+XuWpD7m4i8FCvwgtL9uFm91byFghCwnJwL0eOMtnSREYAoG3BRQZV6sr/rO9AM7Nn/KfwIqA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461702; c=relaxed/simple;
	bh=NBTqBhye392K1VYn8d0VzVca9aW2/O/mLmzqGu6EcfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4c7SlQEGdzRLMkotAu+vrFX6D/W59aUAM+zB+KGhqj9XHOfUUQsd1qAgENkn3WyqbcUpgELe1TAbTXBYmL0W6FuVOMdlfPiMhpJPkTghHEbbXEcvA+ZMUkc0IJ+lgDMEdojeAHRS05lpLaC1bq4ffoEGzywIWEYJSS/lSsBbpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmhM9tdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QosA6VjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmhM9tdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QosA6VjN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3AVT927810
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=; b=bmhM9tdj2jqm7G6T
	27Y3mutqMaRxG3zMDedlThsxvqK42jBaeaD9ofSNEXZylyW7zziij+p9sQE3W6qa
	4Wre5op4L91Ayjk5OmB4+dQ/E1+X1Yypho6rrKkkuh0zxl14mOEhvjl5NAqDt8UH
	atuN85rTsNEE9Y1uAHfKrT1zCnQaG0JvNdVvF0MwlCFtyZNhaKcTxe9RR9MXezC5
	bpMc1zzdJRW2cwbmjKQJlrd9DuxFNDJAEQzPxhkWb20a0ofy6G6oDn/IW2oYwqd5
	/yMN7fpuXc8NOvw9h2bXUFATvqW5CHGcEW+beOTI/9KcrhtL1HbUb31S9Kw4m1YZ
	5flx7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx2buu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so177645a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461691; x=1789066491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=;
        b=QosA6VjNaN36A6fJD+yq/rOLQDoCW11SfWKrd9YF7M/Xnag0H2emuzjcL9b8T3ZXm2
         r+8Ol458C98jfyxCklZXKHOm1ueb3ThPTPcMfhIrsQWG3pCIGCVq0PY3HXk46jnz2fk4
         zMsjNX2qSVXZ6IHdw2eepuusXBbu/AKEjF21ALJDunagAOeEAZuVJqMhPWpOSK5yKOsq
         rnpQ9VMsEVPXlzOXxWoGoGtU03FBexTfCQclL5Oub5j9nU1fZQrGYboMNsKFu6p2JSmo
         AqO1EvMvOQVtFul7/ct43SZ6EzpsEiiX03Mc5SFt4Elap8nF2U6zPeqrXyliofU6rEia
         f+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461691; x=1789066491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yNYglhW1QFSU5SJ+MYIp50snQakRJQqdoTsNwGOnW0=;
        b=GPj7DWxnOvV8raPBHu2eTtLS/xMEwegO5HjcHowK2g3OdWVb7ASI0tv4J0GC/INBbA
         Gw4h+/a7oUr3sB4IIJ0s14mUqaXHPcYsn50NPRKd5TH6+72I/oBQQF7eC/lPbTX4C6BF
         vnNhjX2+pHxs5KDgkRJHjR/bK2hFraUGDKwplDVlmdnYJXQ/GXUgs9gwHbW2q94khTUC
         m+7tHi8lHJpTAEe5QSn0ss3t/aGN8QBwCCJ/EeQYqUm8m8cuyjIBwZu6nQXlzGDTcwaI
         3KCob8aDBzbKaRX1B3ldUu8PP2ACe5gVNC2RtcFc6FvuOddZuPO5LcYQ6sPMPgFJH3zE
         U/Rg==
X-Forwarded-Encrypted: i=1; AKwUvBw1BI0b/6A1d2/YR6JpLjbscTIeNyuBEqz/U8KIp1rO85uHD1HGkpinAci4fnYJ5vAC99tUV2r6WI9CDzA=@vger.kernel.org
X-Gm-Message-State: AFuF++n0m0CNg2INuEHqIIkPu9XaNIf96YDRR6pN0hSMJJV9LUEBZkpw
	K2eaUMHa/VbAnh1VwQa19puTOOuaErPjmvCdnidkHIqtqAJln8J2DU8bGNGgKtWwWzXcLn9BALm
	4Hgug8tTfvUEpXMjt/DyUsQtKVPY5QfrUVUC1ihMZPzLdb28zzvEIdOSFhEBMpLPklDw=
X-Gm-Gg: AYBFou3W4n+fDP5Fo6lPKpLeCga7RvdjQMvVBEtWdnBiW+Bcvk2xniY1regPzqkuT1h
	oslRkwCUsJRzvx87pxn3AbE3Gb8Sa1qD7H4+RhhMzZFlIN3iieY9Oh2KVFn0EXegp1iRdCxVkT6
	rSSfBjBGLBqh6Wpy7HVpdgQGSMHac8fDeXkpYFxUfN5omulMF3Axi3ZvxM/P9s0YliWlrBdtXne
	by2fVL5eQHJr1qVdXvMDanyOUMfdj+DcOSE9vsmlFDHdOdllK1mH8xzj7Yxj13ndMMxUR7mQaSX
	TXKpcJ42EI+kcbb14TvBYgpcsQ+rPmgqYCJprXml7yx2iAe6xI9G8iWBG1UXQsCDZROgVoQUO/x
	oT1YEIp1mYqyO3Brl7IDAViIVb/7nJQ==
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr773681a91.6.1788461691051;
        Thu, 03 Sep 2026 11:54:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr773621a91.6.1788461690575;
        Thu, 03 Sep 2026 11:54:50 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:50 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:49 +0530
Subject: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial RGMII
 link clock to lowest speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1138;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=NBTqBhye392K1VYn8d0VzVca9aW2/O/mLmzqGu6EcfQ=;
 b=XG6OG86F6AP75Xr/1HV4kKPEVE9c9n7Ucn6qBz1XILjvZck4+RuFYA28UG0ao+qFKjm8Qgtgo
 YOhobDDsRmVADfjFTp8bHa/dwplCnyCgS1YL5fI1Vv81CiN51J51n0j
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: hmyT9j4zravmrocRct90YO_drruCHCzz
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99c27c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dsjofxfk3bnWsHuiCQUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: hmyT9j4zravmrocRct90YO_drruCHCzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXw++oJr6+gWl8
 +aKtd1lDUW6VmxJRVaOcvMwiNURWPjKN2cC4bzYvCh4qbo+yT2cMB/wTPJaoo6ouyIhEPh7fQ3T
 /8BZ/R+kG+GQt+HnemrQT/q2R0wP/1VVosl1r/j/vp3CxHljwmkwhBXUGHqyGffa36SToQl6K3J
 pdW2L+38Z+jZTnltPdp8aSwLlHrGOnhGp+GEosaNSRI2OGqiZw+dUB/ffzNhF+vmr3Q3gEuCcpp
 PVJHrtvRNd0sQkAF1N01RuhkRDfHMtCwCaGSnUzCFtqpgk+bQCpRqhM23573c4xZFXI2fvbLSpJ
 xROv1JhXu17QMh8nZbOlOu4gKjJ8XafbUXHjRN7nSxy1yKOX8Y4ZSYVaDqfgA6Yh+Lp+hXgL24z
 951mP3BiOkYhpWMnFI2lJjBLoJoDnFcLB4GhiJJvYg2rkv/wS9H3dWCXzpI4lOO6FIQuUUyMMmw
 tm5x1zzRCinlFKSG8Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX2zV2BzVtuVKS
 +m72srHrLq8CblqDHcRjGc4AixUbxqD2+z5MhhDayZ1YEvoKZsTh3sf9SSD1cZCBa732wKwx1jz
 xTpdM4c397H3+ITiiI+IuMkuExWwVq4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
a link is established.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2ca2f03de30174c9771fdc517c0e21e3b392ad76..4f9bef662c5796ce3cca64b19a595bcdbebbf336 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+			       SPEED_10);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.34.1

