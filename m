Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256BD4EE874
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981440; cv=none; b=sXxUhebBVyeibdgpkCQnfaeLfvrcXXb1D4u6yHeWmgbhP7pKJSOP7s9X3Q1sqZ7A3nbll2tUsWVj3fVC7XxYAgk5eamCVDRxoLbbaL33FRikwYjYLTRityzjQ4HAAGE4Qk1niOkYVuyDp6jG2FE++tmd+7uXIOVBxEITVio2EAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981440; c=relaxed/simple;
	bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zz9ejFzzbnZcqKOuxDsf0JXTmGEpABsa/bNM1hN4nEW0gFIhPdL51LBRE2L61QKwgm1i1pK/BnQC1LSwBIotXVEDg8yWJGfrkGtpCczQi4Db59Pso4G9JmYbDdRmaWyT1XZhkRc+XKsYSToe9GScPeCeKvjLgnWfmWfKJvstZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9h8osMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZTdC10m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9h8osMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZTdC10m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EB97rM3365335
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=X9h8osMaq9D2iy0z
	2PFcQUD4l7Qq6HwRsE6sklUHygN3xTYsLtJv/3QFURff7GmrxJPUqFa3/taifgY7
	cor4ZebDvuqyrYmKTP9av8sjIqANT1vJScz98DPcCpIo2MqH0bXGiURQGyRyPesA
	sQ02BXTdCGyED5WI4uE2KVkDjNPPkb+ytUE7GJD9RYmATyxLNCW1xQ8IrCO2adG/
	ZKTPbV3JXkHLgG2jqz+1p4eKORYqG+rFZHh5yqVhFgfEQyMUOzOJinQ/xAV8ORr/
	1CpcI9HFRGnVIF7zfV72FM0xJ1MpNH2/ok8q4RGSAkhnYdVqcTUjfd468+0oEiqq
	JU9vIA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621k29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso133929726d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981437; x=1792586237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=GZTdC10mjTDyxKprJfoHDeGb1gmPKY69yGsKnfRtAd0fTEGBEDLBzDCiYrodP8TwND
         eab24X0znjr+/V+sVvcMgHbmDhrGR6usLQaVSMS2WkqHNRjwzVpgKeG+LM1s9QcaGliS
         w7EjUMr8WJDcxGTvPK4cgZjcwpysifBW/yN6okV8xbfq3JTHrm44CA98uUQG9Be1bgtU
         4YXG8JxIGwlmTV6iQlG9GshNjYPNBY4njwwJaZMCydKP1zxlZl54A+uQpSRlAvGBRF6I
         6505FycY7axtAHSjYYeJe/UGxrL1ubyxtZookDYibhjd+ESCZtF6zLlovUsO+Z2KvC5R
         R5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981437; x=1792586237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=KBbPQTCPxbe7TziPrAF2bOTwaX+/VLMr2AeVVf3G1SkBUyUlhtQIbtbWFQe6CTyaa7
         EXBIplfGffMxPMI3fojCYWWm+Yy3cplkVguvVaTfrJYebrNp/TItkEUaURd9/Z6rui2A
         NXPxywqvNByFrpfgwZw7s4xLMGMUGOeCDUk4yttiMVx16lXII68QZm1oeopuBzR1tArb
         9Wn7vgP41CD/+KHCb5PYgQmTkPtx7+uLJXDmmLNxiIsahykBHildGMrYFOdvkhnEpiis
         wNRvzKEHJutG/JIf6Ajc/J+7agz0Lz7MbhALz+W28AVRY/vIXK1lf+lYnOGQ7du18WbC
         tXqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6uSY9/Ll7Kg6YW/z8mG5jTIxpb6zTwuiS8VTIg0r1lSVSvlzFB+CtuPWsieYQ1pKEyuce2xT0zcfzITc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh9dG0Iy/zMEahxFU6/fManukQK5xtDYNN8ON2iIr9plnRehA1
	/kyXgykbPL3GacT3mfKReMnOQ18+xw+rCuKRW40oGua+2iRVEAXtNK+VBPlTZZPrXJbJu78qDlX
	GuIRNg9dju5ZmqRKTR3BdLxxeHvRq9WBZTO9uEkd91eC9a/PJ54mMhDdq3hveGvIt1yQ=
X-Gm-Gg: AYBFou0tnZZE+mZ5pgz0um+NrHV19jijduCojWoamaa4gf1qfQdbihq+O6m13rnVGyu
	6b6RFl6yC4zzTy+U4DLLSENJVJHf8jIJ6OfSTFysPEgURlmGbks5OC86QP+bqolLOLIUC+QD/6K
	yblpXTXwKtUjSBvNO3siarmnKDaRlT/8TrV+TMRSbUeVUmR/WhqoS8/126hyEzEHALl554zRYbl
	QMmvEcLRJysn5H4O634xG/XMar16C5GMXToISB5tbG+YvHkYBqcLvx3FWJeuadUxZQwvj2G1Ccl
	dKZcJe9A0TA762DrDeTryCvZFY3vMDLZkI+VinVFKLFOoMmKwgfttRQK5YeJqeWprlrtR63eKtm
	ZfoZFP8s266PGF5bGaaHqLs1G9BLg
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571769285a.3.1791981437445;
        Wed, 14 Oct 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571759685a.3.1791981436618;
        Wed, 14 Oct 2026 05:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:42 +0200
Subject: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dnI32DHykdHRara4SxS9EMHllBi8RbNpVvb
 4nM9bknjESJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZwAKCRAFnS7L/zaE
 w7dVEACYXQEJ83Q/QRV92yGB7cs5znjC4RvZ8Gfcv+TeLoU4qXA+kMEYugpyaPG1/YjlURDT2ZB
 uAFF8SeBV8Ul11R3yaqpMOdy/Hl7TvT/EtEzZ6o4dzkfE58+4KvCKwJGZiv7Kd8yfw6QS5+a/Lm
 JKKUte4f8WA+SI7SpSpXO2blXJ40JKryYVK5Dy9F8cFK69kDBxcOC0goo6+j3BCbH4ZKku0y4Tv
 HeJ3OWXpkVz2VhcBFRQaWC3sDZ5KsN+DSaQfxTNsgnjI87WXvtyR0M7msV6/0tqCSoIDlN1RjOT
 6JuM3kGD9PqzYuwRy7zmFVsVpLou1oeZpiQqHwjBPHYfgb3SHhtRI4bqhqCvmgqoSWuOF87veTz
 Pcs0S5b6MwESHuClnn0DEXVm+/SOqqMcDXz9BHQERa3gYzglJxWogGmTU2ALIMst4s4GqhuoJ9l
 zbE+Y5xRLfDEJPwI3Tv8OJVjNwhUe8PwTqsecOd2XC0cep7xtLfwFnFmlXJ3b/hLDdGxFzkhRv6
 SGcerBJ4NUdI9sNVqm2xZJ0aRfmhaw5oqL7FnYYlHX6NQsHMkiyiBC1Y4LNYg1vQZ40YDfx5Dgo
 gsQgc+L+xsjrtl8c/6ZfmSizWS0cJ3hykju0KOVf1Y0iqcifh1Ug1TdZlU6TK+tol6J7O3QeqRi
 SK++5yF89e03Oxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: sRWu1EGQsZGXIcCrnfWEFXLbodwVjCEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX+DycBf3Py/UU
 6bg3Dn4J1c7vRxwz0wG49u1Pr6RjulDT9TtctA2lH8qQ3QRCc8JXOWOYc3vfNLPzDpEXivNhsPf
 UpeUGUt+NLTpBbGScmfXyOSA6Lo0MtVXUkM4RAsZgnnkSW4A5z8ZEOE0XD4JYN1QAKLpFBbS+ZX
 QbIYwGpWnWu+mM6J8JQ9H/vwWUAjs+FbzIifH3GMRSc9tPRiDGPXkzMUiSXTNEM9wjOGXtlylAi
 Pei1kznDi4IaQwM5Jt211onVufhUw49H+jPYZe+43sk8p5pdH9Rm7ofPBIZ+nAKWLIThyvE7UPn
 2yvj/J0/+JoaCfxVFsvz7GbQucEHJbds26tYZm/GiuEKsFmK2eOnQJbyj4OQ6y9xef4iL2964Eb
 3CGGImUTCvesKoxmIP3IZNMF4tvtIK7WUPcsWkR5yUijFxuMAqmqD+aA6/zIBADs+xIZLUzHf77
 VcKShu1VM2Mbt7JZglg==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf777e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfXyqKCEds3kSJy
 T+psfPyNtE5G8HNk1VhGZNuO002QMCLLyNq8qSCdfIkvWKa0wosIhzuwoHhXkW3qYuiRrsQUJdV
 x14jr4B7nC2lf6X5luJQwYUH0304+0k=
X-Proofpoint-GUID: sRWu1EGQsZGXIcCrnfWEFXLbodwVjCEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..e2e611a4d2c06bd567e9d5e353b3a4893623de6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,22 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       ethqos->phy_mode);
+		if (ret)
+			goto err_out;
+	}
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

