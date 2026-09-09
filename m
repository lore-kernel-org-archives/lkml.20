Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E158123E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963996; cv=none; b=B/NKBxb6indK24smXlBiOMXGfHx6uDPascOKvLf2MeppMs8gVNV5tyX9U+WSK2pIlIX11KuxogM5/E7/xBge+CZcGefoSjGBRS8vblRSYy4AEJ46W+ghk82pLUNjGc2Mo8G05MN7fX9cVFLqMoJBEVrDLMzOVjE4Op1dzNK8xek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963996; c=relaxed/simple;
	bh=KIPSu7LnShJtGhkrS5b66L2z/6GZehxGDVWmv1e84sc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K4suOyebk4GSGqPtEi0YWUl/MzBkZD/7kd5mCZ/8XEo4X0EplwEgGYJI2awQ+j8DCi5GwpNkw8K9b+V3UxUytg9MNvBmqtpQSwQmW3ty9mvvucy3k5veaRTGs7kxFtoa5jtshI1YvVOsUAHwQHfZ/QlrWvNobyohdckZG5VkYBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiNENcS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/Bp7uH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fiNENcS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/Bp7uH5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCwiN3053123
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JR+7V3ELA9sqnRkBsDPxRp
	m0VgnUHbPahmeijDV/V78=; b=fiNENcS1XYTPBkeRrnQ339/NgAivJA+xwqNr+0
	lceaQEXeHdqt/V7NnbtP9w4fZogyIEh1nhDT0g1TVpMHM9AXNpVoAnfUtUhtEImB
	WTU73LmDd+orTPbos2pgKKMJKXuAjuLS+76YEACtw/0rzohommFYUbPSO5IwGw+R
	qOX7N4GFMvlySBrs3QY5yzbCFeAGU/WdRQLa0DQhhJBgiW4DobE+J4kmzhTii8v5
	+epKA+Y0liACRb3YSe7RMi+aozrvinK8fAnTLhl/jk8frZtozeZteRwb8DNFQZMM
	UsXp7Thj1+1bBNqBlwEhHputtY3JRVa8DuweOEOGS4ZCZqTw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7920k77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:26:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so1588054e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963993; x=1789568793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JR+7V3ELA9sqnRkBsDPxRpm0VgnUHbPahmeijDV/V78=;
        b=W/Bp7uH5mOkXrslz/Bd32s5Jx9fGxu2ws2AKIGYjGJPEGd1YUSJGe16SR61mPGlxHi
         UDQUtiMFirnwRooYXSxNsD/uNGzGcuckRX/QjvXK3XKqi01C5R3PmrUpdoyC/wHT+HEv
         EGBW2lHP9mTjK3ri6Cb++jbim1fMBICi1voHWl8R2rwl3TbhHNqjl0ltMK8zh8zmBtTY
         PENZW3h1aa2jdoLxIMUt6o41DSQMe0iQR2bsvzY0xfsh94gLthTwjGVg/fcW0YgqH1wj
         U0pCOHeYM++UK6dHxaitlJvy53PMOd9ziKRH0iMWUkfEQfvcOEI+KFwHR1y7fhXrk8xS
         AxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963993; x=1789568793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JR+7V3ELA9sqnRkBsDPxRpm0VgnUHbPahmeijDV/V78=;
        b=YNMzW7DSwgqXg7dY7ZYGo/K2O5F5XLYW9MPOlGHaoFzIwDjOIuGy7mTq7XeSXYQOFw
         y44W4e7cV7skXZiWwepi2N5ibZ8Lp51WNfQBRIAAuAXcigqkzXhfV/J/reZo9gUBV+pW
         xGyF2FNWQv0ER8TXOJPXoH0vkNQiY/7xN0aybMTnnJ8b+/4XWzqbx+Svju8R5l7OmGLd
         XTU3Y9WHe1OtaIbb2d0B3WS+ANBn3xYHTX5s4e5NdXmbs5adkYMfx0ZboWFKV7Gzo0yX
         801Ja/FPLoQf85WQhzUEKV8njTtzZi6X38AB0u2cZeuelHz+d9scrCV3EIqg9P6yJ0lG
         w3Zw==
X-Forwarded-Encrypted: i=1; AKwUvByJ74FkmatE8zYg92aXjmcwzBTab8QxdbDeXZQj3M5XElmRBmws2IP/dqjyfqLvNkUDbJc3MNUo/XdtnxM=@vger.kernel.org
X-Gm-Message-State: AFuF++kBRt36h6uqkTy7VP+EaWAn6g6cpAjhOWxnQoTUGra2GzU9C7GP
	Ejja1GtIeNpcvJqwbclLpxDQ5IRiM7lMHRm/jybFMfdHPJbfzjHdSyEJaL9/XBVqUCTiaCB/su7
	W+b39JnPmKd6u9a4W8DecH8br+OTbZNzwjxxdHtiuTwr9OKhk2zw3t+qeVjKb8KA75yFDx+iUeg
	4=
X-Gm-Gg: AYBFou1t9G3eToRtRW0PRPRpTAGGNX+e/YSt0VMLV+3p7F4iseYAgRxE1vMNHtEwACY
	T5/6du6367i7OopKD/2S0N/oPDsb2dzmAoD32+a6mHrWyvjFNAFmB3HgXGXZxOmPotJujStShW0
	fy8HhzVDsG+BJovKmr2l9YPGF5WNY3wbsToTcWn6BRNpky79pmR04WxUF8trdP/SMya4rxjkz/O
	ZHhLYGTvH8EGpHf8NjLSy1FcKYDr52Klujaz1ttSpd0H5B5OCrjLqOFzt1DTlTzdBslsHuor5qn
	PkHow0dq8sEM1cdPRg4OKIZwq1oRgqoMmnwk1RbCFzM0vXL7knX+jabqAX+xwVbD0v60OUqaaPq
	HJvHCNiiIU3Af6w==
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr17726369e0c.3.1788963988009;
        Wed, 09 Sep 2026 07:26:28 -0700 (PDT)
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr17726204e0c.3.1788963986664;
        Wed, 09 Sep 2026 07:26:26 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm39428246f8f.5.2026.09.09.07.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:26:25 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2 0/2] net: stmmac: restore previous state if
 tc_setup_dwmac510_mqprio() fails
Date: Wed, 09 Sep 2026 16:26:08 +0200
Message-Id: <20260909-stmmac-tc_setup_dwmac510_mqprio-error-path-v2-0-8158b8333b3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OXQ6CMBCEr2L22SX9QVGfvIchpNBFmlha2oIaw
 t1tOIIvk3wzycysECkYinA7rBBoMdG4MYM4HqAb1PgkNDozCCbO7MokxmSt6jB1TaQ0+0a/M54
 4a+zkg3FIIbiAXqUBL7qshCqllr2AXOgD9eazjz1gpAR1NgcTkwvf/cDC9+ifrYUjR2p5xVutZ
 cnU3cVYTLN6dc7aIgvU27b9AEp1IkjwAAAA
X-Change-ID: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa16c99 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UB8DtK870HQNYGIhTBYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX33V5nWC85j7H
 1/tlJITdvjmy2IbGquonv0U+E9SzcpFvC9h8eIGMWOTE9qntuh3/49wowSi/hS3YNXxCwOcgigw
 3wzsGmeFHxkHExhGNTYvI2AA7fzfxY2CrOVPufnneYsF5kK6YGqKcCU1o32rQhlGpRyqAyYf8+a
 mR77wi9kgiKSCbm8Pr+36/LoCuwsIUjwmqDK4bi9tIRnb+ZCqNE9oAnkePio+/enpqtLFT0WRQT
 g/zjMXE4UL1/HuP9WG9CsU63ZoysyUCOkh/BxuUrCkU4rkvWCsCpscmVW/6qkiJHakUxj3Pkh6R
 PlRRXB483hvxoJeROrBYq8EL2XdCa9m5Xa19vJY807B2l1phjCAqy03LP0+xONQbFfw6GjEBtBc
 hDug+xoFZblQq8T8Rgmn/kSzaQ4vYH6RgBrS79zm3EX6Uvtg9/gsrBgwio659s5KQ5OVRuHqwwO
 Z9Y3+aWnb1tAMe2nSqA==
X-Proofpoint-ORIG-GUID: OuMjWn3PDM-RPHEPA25QYclMYanQ1bTn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MSBTYWx0ZWRfX3J/3vX/PJ71j
 PTL5/PN0cg15g6ulifDp6NJP/eVSz4s1Nt/oNhfWptDmVzekQM29gp2uQe5Jn8jt6nbu0Z3xtU3
 Lv1X9x8Tteb5PQ2jyoS7ftxp9K4SkkA=
X-Proofpoint-GUID: OuMjWn3PDM-RPHEPA25QYclMYanQ1bTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090161

Restore previous mqprio qdisc configuration if
tc_setup_dwmac510_mqprio() fails running the following configuration:

  $tc qdisc add dev eth0 root handle 1: mqprio queues 4@0 4@4
  $tc qdisc replace dev eth0 root handle 2: mqprio queues 2@0 2@2 fp E P

Propagate FPE preemption-class mapping errors in
tc_setup_dwmac510_mqprio() and tc_taprio_configure().

---
Changes in v2:
- Move stmmac_fpe_map_preemption_class macro definition in a dedicated
  patch.
- Improve commit message providing a configuration example.
- Link to v1: https://lore.kernel.org/r/20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-v1-1-eb171bdd340a@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: propagate FPE preemption-class mapping errors
      net: stmmac: preserve real_num_tx_queues on mqprio setup failure

 drivers/net/ethernet/stmicro/stmmac/hwif.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 97 +++++++++++++++++--------
 2 files changed, 69 insertions(+), 30 deletions(-)
---
base-commit: 382a373d9ea7a6ac4de9c022385b6217f65ae3cc
change-id: 20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-8d472a43d3f2

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

