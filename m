Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330374CB8AB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812690; cv=none; b=N6WYNFh6krK8o0J9vuMZ4U6+BaKWfdmno8rO4lS31nsZCkma95Zk4zAcvO3MLoIRsUrzpSEL7yCb3k8+m5UjR5k6UOUjAvNHRakmztlpYGTEBUqyTfW96tuzt6QrpbA/pkIdEgM4juasOG5s7HIa9THyJVWNS3rIjqpt4MeicHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812690; c=relaxed/simple;
	bh=lnIs5iGMJ1/TyrszL3HdmC9OvNff74ciWiwlTO04duY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YO+ozgCT6D6kpuESua8NsAoyb2I4t04zGvAOpWIBNCAlk4iE4TNO9xYm4SF2YgscSOemqVZeDMc+7ZPnJHbPOHWWASjXJtBpFYH3Mm5/vzjmCOQKlaZtnIUIdQYHZ17B7OGRIg+hCUM76m8LwCGaz7BrkhkTfWLOljkshRqbRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfBO1OeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VObA1KbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfBO1OeD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VObA1KbF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7waG1314987
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=; b=XfBO1OeDaI8C8yE0
	nMeDOlsvy9eWugwFQNl++ShzxFd/G/y2X2kxXGh4JfcPlC/gdaPLdvswvM5S7iKD
	XDpEj7k9esOziJqN3xCslzyTcWCKh4gTyGJhSFOXq8Jj4VTFzVBjgiheDjCtMpQ5
	IazvdXSZtSj67Uo5Oe368CLMrXbUh3IybztdeJ2vYQ52WpoIfo9MWPnidmQBFMN+
	zxewce3cJaZPR8z0j/CNABPngsvr9KxGgNr4HMfDuTJl55heBScAealMO0czB5dX
	2n0HHdotg4BLQiMPraZMkSRYqrD/pYkq1I64CQzbGiw9VPkCz5iKvWqWXALfMpIQ
	ZBusoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk9uwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:24:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94f086fedso53676195ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812684; x=1789417484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=;
        b=VObA1KbF60AVm++QDTG7YVM27UPp1YUI+9PticX4boPkVUQm8nQge7m6gyTVvNwEJR
         pQbYJ/7eO1BKq4VqVAGTuXIN6rH90QK398KgvNVSS52sq23ezksmAvABYWpaDBJb0Pyd
         /9mh4DkNNK0BIq7a+J43Z2FZ7dp9Ej3w6LbqFFcD4SPp/JV1njisQC/jvkAd9t6hJxC/
         sbsY4FKGf0ji77NUrvJjZmCpFtnudzf9gMvT/gcJHLyZ/zxE5iMDAdLy0EXaagHEwibH
         3Ph7d7HujsPqa3ntz6sUdJvh3BpYq8rDd8DX7eYvyc1VTNWKTiawogBNDiJaO4uCkFJJ
         CmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812684; x=1789417484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JaG7DKTSi7xhDFXHxjPdAJJFng2xHhnPLV5SDhTiMQ=;
        b=DUXQtrs1VaPwbB6UcAM0558G1I+k2snELgBqZRaJOwwigOLvmH3QYBWm1BTlKYpl9b
         kzcBiOni3f1FC73XlhY/+gbwES/mQrdmCRzPUiW4vpiye2SqR3UB7ofm0O6orbeA9cvD
         9Gg6xQ0nlZwTTBPnTk0Wr9Rf1MGi1O1GKbhZuB4pLDdUSD7RWsD5m64X1tldtPTRduZ5
         58kSohSGMgWFB8PRG/pRzh8ZPKt9r+wh4YvE35oITQnQZ/DuGJB6APUedyvDE8XAFIxz
         nfwm9Ue7xedeirRX7ZA6AAY+qKFvgGEkRAUnBc9s8IhDpiHdCKSiRn+1LJxBynCwk7NK
         HKoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUQ2rFZqaNnwF11UYh9Sy2Ljjj6GgPwnBIJw1wDqhRpLsPcXq6eIYWBOn6D79IO+jYICqJEXYX/QEQ5ks=@vger.kernel.org
X-Gm-Message-State: AFuF++nSI/4Kp+HZ0jBI82VUiP2R9s0HLRV6YTLGpmRnuF2ljRdOMZA8
	J/UvV1o7Q2Pi7JlKKoHvuDSJI71Je/qSEKrniuwLMSyN/z+PhMtU1qMasm8ko5jEjd4qSK8LgT0
	NHwutsmRPojfc9FrpxSMpAY3qvH0zrU0QQDXYy2uXgVi6pq7+msWo1Bh8sgQJqSsQoHlDaYaiqa
	g=
X-Gm-Gg: AYBFou2ZOTy2Jt+m8tHO4u0UyRAF+VuOHGIWabyXjJpY5o5Vl+aNrx/WpmvVTQj8n2Q
	KkxiIJumAItt6i3Egjh8YKpBRw/vK8+yJ4vubyuwc1pMSg1r9m4ow9Wgsk6Z2eonLc2sb7RAay6
	pGKVK+wPJLh0YY1C89nEzgpF97Gwu4DwWht4IHjXuYCOJqwNMr2DHtsLabW0llfPwt0OU52fo9d
	YbSBK3QPBqTCQzfsq2R/maf0mPrvlViZ2Vs7pfrnWwnZAJ7SopV5AB3ecK2IuZ2eDYEfVduvbYW
	c8SX7fFlxWPAyPSk2ig2FoL/cNC3DoZJO652HRh0hxHcyKbrIuBNmDvqsxXVMyy0seOdQ0fxxEk
	h3XT7H8oMAa7jys7wxh6BR2r5onrByg==
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr345681825ad.4.1788812683844;
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr345681275ad.4.1788812683356;
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:43 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:19 +0530
Subject: [PATCH net-next v2 7/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-7-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1202;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=lnIs5iGMJ1/TyrszL3HdmC9OvNff74ciWiwlTO04duY=;
 b=PlfItwBPYCNw7E604PKTJ17SgNiJIFuqKR0zm4aGtFG1ZqfCDUXoVzeUencwPv+khFYTEm8U/
 eKLk0dGU4CQAJ1XjFA1wGqgeMRDsFUVkiV43j1CRG6ATflSZwIqafK4
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXwPhc6JDidRFm
 A66sXPcXBn5sCWE+HkTgP9ShTEoswBMNT/UIj9ld3PU4Uu1mjVzPzVkVLcjM/ePLhoA0ZgUMQa1
 UwaxWSdeMyww8CWaXOv300tjc4lF7uU=
X-Proofpoint-GUID: bbaxGafFsjkMUXeLNbpl4HMXzePXdk87
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9f1d8c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=oGeBSM6iGANWI8Y-5VEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: bbaxGafFsjkMUXeLNbpl4HMXzePXdk87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX0s/rVfI1SWLK
 cqxybyFMZTbp+9PZULBAWsrN+5jnfGB2PmjqQGkb8WdbYfKew/a45XXVFYRD+0TxSPccVkAQ0s2
 USfi7JgMXe1LrBwM3ySZbpEnZYvT9MrMzdjoLElFHyphyci35wa2Kvv1LOv4U/cJi49/1++DJm2
 hM6kWCeABU93zR0d/H8ZlsOsSzau2gEmHVl4YXvf+b2PxbmTjPFDzW9VVPuV8x/opasQrviHJXy
 +vtM+lrf+zH4ZUmGExMPY2Fs1AEjkOasK7P40QvH+gCTiGKThHicHwG7h3btBe4P/LZ/q3Q2ra5
 ATu9085sWJh6894w9952/aGXpq5RfA41N4rwojX3kLDBSXEQ6gUeIPn3CwYIVTKxtGcmWmHaT1p
 vVnhMcv7KwazuAh3H+Rm4E6VVGtg/v1C2uofLQJirmFfCHlpwhc3/eUlTbhTz/1fNf+HbFC53wS
 XEMTSbiQjOQR1ZEY8xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
a link is established.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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

