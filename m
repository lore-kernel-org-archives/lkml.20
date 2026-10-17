Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8947DD72
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230393; cv=none; b=mKlx46SF44JHjMLBB99Zx+wQgeVfk4Tkai2P3fKFkPCOa63MrMcKkvj6woZKDKpExhdm/RqtwWm82xBiI9pfbmsf01rz8oE03KzSUaSm4VFhGNKjlDU+5lWADtFXVMnjM/s2AmM8X+pMQDmE8Y/x+zy5WvU+oqfQrbylO4GYUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230393; c=relaxed/simple;
	bh=WU9WvsTJoNSYe0NKFnnpj0KI7+5RPM3wvLR4H8Dso9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QriJRAAmDCWxgzA+l2pCS99ELAxbzGup/05vwrjE3VezM5vda7pHFYMf3pcn74s7ERyzT7AMhC1Tu7qxs5xL4/grfUqqwSt+m7EMeRXVcgPy9I1EQkZusWmO+TlCzSK/TZbtZDo0vChj7lZc8MXoO1KdOChYzVJ3LlEtEM3MzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwjcBDmj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcrwKDuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwjcBDmj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcrwKDuV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2Ae1402779
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=; b=NwjcBDmjGu29jXns
	Vb58aA/y0sRo+EF0p4Q1d5k98O2PAllHJYIw81HW2xQTB4BejGTAiO2Wj+WM4qrh
	NLNOakxIu4flI/kmcG6LioxxdAENSrT3p8YXPChJKKanse/Xw5V5ICdX1j608Kr9
	ZlmQPbaOkxBoX8xqgr/p1TyVYAhjDfBGYOR8feRBVBFundOdJuBs6mNQSDUTM+oe
	NWGg/5ztjNTxIKE7Ty7FHIiWWYGoiojOBI1Y/lZK0Jt09uF9hM5CKhXWaLo9iqM1
	NiLzsGHcY11FNUf9L+bDAsV9b13Vnv0IzMkB7HKNNP6TnoOWbZPI1AwYCKyEdUMv
	EhY5WQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys0scf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so1797367eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230391; x=1792835191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=;
        b=dcrwKDuV6wuluY2BQDcAb4ELjuxeaKLeAqJMjkQBLHBjhn+/+G5PX2ypb2xBIUxdgJ
         uSo9uXYM8QbRr9IYdtH54FZuPS7BUFTvyxVOvZgRtluLaLF2IKvThSQzsYowm/TqocOP
         8QSGQlEEhI0emXSmcakC+qmPnaAJUmPzUdvFgRJHnnzgPXdrD9M9xigWraw7/K83+HMa
         nFVBt7qMgbINlqWa34U6eEdhF/VjKN3hpsvvXkbnjJhxBtJ7R8y+QhgRPloX268rsNMs
         3jnB7aC8IW6yrZaGVMJWoCZ/8GiA4MbGfypBivwIbUMNAbTGCheL1XKTj5PZKUi5DM0t
         e0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230391; x=1792835191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=;
        b=C6Rde8Y3YRmzygXswKDOFpwOXdJrcfETpYIcaTpaVIhN3qYF7AbrkCmAjkVcW51hfj
         CQ5Av2k6/aFIKgGtFsHYrxDiH/PD2JOOMVkfBvLeFkUNa3ltSH5PNuDONaCVlJnqf0Rz
         ZxBxF0DfhINgTG3zhR7ja/Z+6SNvTxU9noptvAR9YoZ2TtejYGoHmaagY/hyvNjwSBlh
         8/d3qCc3sJ59nwDOI32fz0fsaq3sQZ1/xoqG6BWkr88+JimOHb0Gh0/63Sp9unIIyumz
         CsOLjybk6Xcb7cS7MUpF9vHjTjEMkAd0DjbdakAjM6mlEjOXbPgKpsKnDFVzddL8Yw+p
         MxmA==
X-Forwarded-Encrypted: i=1; AKwUvBzYXxO6fBsKLTRncpFoyo6h1k8EY0ERZgtWlBrfo1UnYKk5L1ip4PzWsuyb5AmRSgGOSzWeJS6/KWgOhwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YB+FGkeXpy7VlLOqDj3yjZojceLEsYm/qabZDq+nveOtHTYY
	oxnUs94fN6in7ip2hUx7TE3u4u43LII4JXwqLm7s8E1JXUHzC5ueppzw/lAnTOUL/qkv+2yHcRP
	cG4roELg92oPEa88EZ4rqv0lz56tNR+4JKP2be2YeJ+hJZKHBeZreyR82TJRw6PqxqSo=
X-Gm-Gg: AYBFou1hjF65P9a7rVSw2qk1h5dsiHKc+domMhw2agMTZT/PblH6V/T9tz6xJzGbozv
	TUrdGV1ZqVoSxdF+Tg+GldXJLprn1A6MIYoSHTYbTRSjTzzW9B9v5+2Q5ygHq2vQKP+kU28h4v4
	BeyqRFW+IV+uair50CZCzSHiq+H8IXRu7zvhwPmCieihtZp77L/MRVa4/naw39z7os1hEwtocMl
	/BEOw/hVANX6PTE/h9cLkUP2Xv8m/m+UdFW/7ldgB89CrTVw3TvHqN335O6qun8WWDDyLZpiMEm
	pCxPtVYAxJ4R1TO7KdnJtUoD2Q6IMOgicKjdPXblABauHiLCzVJ0GMxXdpeIlC+eoSSvnoj3ByL
	OOkQqBAlNyF+nzIpJEJbm4Sv+1zsbLQ==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr3026148c88.26.1792230390408;
        Sat, 17 Oct 2026 02:46:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr3026109c88.26.1792230389755;
        Sat, 17 Oct 2026 02:46:29 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:28 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:17 +0530
Subject: [PATCH net-next v3 6/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1349;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=WU9WvsTJoNSYe0NKFnnpj0KI7+5RPM3wvLR4H8Dso9Q=;
 b=YkxYX4jCWv6bOW32Nmox3gO9gIrqjA0yxsz9GwGhNyIX+rBQotwK3iFIRxIbW+9u4xDe//N18
 hzfFOWy71AHA5eLdSoKSX6HxfpBZcZmxVAbJ2IR3PAbAsdNfCoiC3Zz
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX6+g93WDzjqmE
 0Afp/3+Gya1jVSJatJaNtGkPI4/tYC6kx9YYmbwByhAaxJInUBpgLkD75ObD3bpHmGtPAvLEjdL
 45v0CARGNuV6UderdVwIFJle2X0wKeujP71RnjtCDexefQ9FeeDTbRjywd9YXLOGEwBudtf0gKH
 s15caqNxaTRrA+iYq50JoCRkg60rp7oNd47xLTNY/DCC53j5PPnNsuLSRDJGv0v5kcE6w0DzSp0
 PUAA4RNxRwF733nGifrd3RiimFZ/fhPjBDRvV6m3mfUunqzoeEZ4tSt4b8BzxxYwHcxE3Uv1iRX
 2ruJS2B+s1QDqzm83QNlSIbTIHEz3euuPUr20ZS88QVPoQei9+SoBN+g1iC1u5+LruB6frqEH03
 BjKIriIvmc+9d8qW3GrLaRW4jEb/oNycTs+46bihLiyqRO/f0vqQgLCFwMLna0kJCF14CLMpbXT
 3YmcPE07hXNOPJXanYg==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad343f7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=oGeBSM6iGANWI8Y-5VEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: AUffzXXJytj485AcDQu3yl9n4pTLPh0d
X-Proofpoint-GUID: AUffzXXJytj485AcDQu3yl9n4pTLPh0d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXxr2BnW4tnUE3
 AqvYNNS/F1r/MvfGUS9pUROqzY679QTI6udo4XKqZkA4uZGFb1h3rLI7gi8CWUy1T91J0dYJ/qc
 7knTkgJZVEEuXdrQb1pnEK+SFf/1LDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v3: changed fix_mac_speed to set_clk_tx_rate in the commit message since
that's the function actually changing the RGMII link clock rate.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a92bf4a6a2dbd987893bd4a3890df770bb7a7e56..2471871562ed9915398614d5c88d1c6673829db8 100644
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

