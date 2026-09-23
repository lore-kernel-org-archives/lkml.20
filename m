Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021A46EF8D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151882; cv=none; b=hOTjjZMVKVsxp4Ftfwesm6RmYbR7ZlPXLjhdKq74oHyWisVTbsoG57MsRjN2lRF7RSOrD4Kb2LM0cOfWPcuS2vNTCLvUREOoX4QMqr452z5dBdC8cVitmA8Pexy7PNkJ2v4o5QrdSbOodw9A2Q0BVpee5D7LhiGOWhF45zTpFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151882; c=relaxed/simple;
	bh=jzd33LVj47mWl9pVPPMzl/xI1CbS4cXQuMHq5iLNkKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HTic5cWkpJvo6smS56IwR/me1YviWnWb2gueMWQu4ryaueGci5I6BWjC4ixVC4RC9UgLQUZsqHS70b2R5x/0abZD+q7RD9fO6OVm0QfMIAfsssSZams7zgb7UDsrxVxU/D+lKuoLDuQAbxgk/XBYW8NW3qUMdIcbGg/2SIeuwIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5rLqrTr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJnuNjA5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5rLqrTr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJnuNjA5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JZ0x2028398
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uzoEP2p4qzcZlCTTK8fJcd
	zZzalvcNrfu9vrZl27VqE=; b=G5rLqrTrYwRprBdkrWs6+B9B9HkVhvJn5Rq1Ia
	c1laLcrM/7UMxIivle4BSRCrIJoQiCxWz/jRKemL3sYyuqRHgAxDY+bPYmM7OU4T
	oVofx9KThOOwiCPIyy6NY+eUKVwgm2JSh2NUfJ2r7yEH10BXVdXiTckBU5oOc7t1
	D1Rt7eUNiQsorcEJ7sqapsUQLBwjwoTS2iqrKnYmbLDM9OUprbh/LHGjIXisCu5L
	N+S/CYGOIH17i62NC5ryGuZQfb5BOshhhD6lb5P14Nr1s29uF58YHFqxBu/csPsv
	DHoKEJJIVkSZKwO0RNaLojp+Yf8L/ShBmrkDtHS4M6aVu3vw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c30wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:24:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33310847fcaso1156237eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151875; x=1790756675; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzoEP2p4qzcZlCTTK8fJcdzZzalvcNrfu9vrZl27VqE=;
        b=RJnuNjA5Hg1ls2aChUmiHpX0/zj1AMCMidxOlUi+VIDZFyFnTmdJzG10xweZCqnmUL
         LPIghTv8Ni7/oNQIsZthTBViL608m9AtUrK3DnuiXDRpB+ks4lVMRYsmlYGJLzrtc98L
         NoJsQ9LlDOi12Kw9lvE3s6Jysp3+BWeTjNHcKZ0M4sn3M9EvFuJ4TfYQPJYZ6IdvxZs4
         YsxhXaHieqAKJWEn7VSbFzkvAB8eaBkDxCabS7LoCW3HH8IrB02ntbF480cNP7GIX+Cp
         mzw23l2XptWuYwwtevhn6OwecKy0pKS+pstvUvKeCOc4g6Xhy4BkmGms2EAU/LFtygYr
         jZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151875; x=1790756675;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uzoEP2p4qzcZlCTTK8fJcdzZzalvcNrfu9vrZl27VqE=;
        b=SwCQXaWdmTjCbLfIFuWt+0YRNczGCTb8fuXFBzqYEO11nTylIJTb9gSEiUdr7qrha9
         f5VXqrUtcKnoIR7kDMJsWOxVEzTBEEA8BeYUyx+zr7HVoVkIHENocr2ONqxv/cm4Ea2Z
         1micZIyAM0kqiT9x4XMMejXJPjGhgwmR2PZP4aOkckEV+RdWQpHpSjBm+kgR4Nd6hKRF
         r4hnBNOapYza7RkN3ZeSsiMydpfVJJH/4RHWlExPVeshApeyoQLwVe9/w9xwP6WP/h5V
         EF+IrdwMm34zSzEfhJsN0iLJ7eo9SUpa9FjWLBntrb4LIm/BCMYJN3Egu0+7u53VTuAH
         o2bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIPOl6ELuuHwKC6LoFSiEQYFTqYSi0WkbPjtOhc7CiFTU4GCoeLDnmqaouBx49AGU8NMwJAL2QhItbfPg=@vger.kernel.org
X-Gm-Message-State: AFuF++khAKkynb5pGCmfvQxVH6srUQQTC0S6iAFqJghQd0WPicOX9iD7
	q6sicOslA+M8d7rDsNaD1uFvEDDa06C6KRD04KraAfU4Kl4c7Gh2HEH4coO+F0tZ+hsMHi+khYW
	v6faAM/IuUTCM14Z+4XmqIp24/uMrUjYVo8x3vPB3lK87deu/hfHMfDrVxIJP2olcp2s=
X-Gm-Gg: AYBFou1CmwMihvJKZrj0Zb/cZr73OkYh0n+JAOkJ9qq25FPHMlECO9dGJxhM+EdgUCU
	cTp+rqzgPpDMXwJC0kzt0olEXSMRNKaGWUXrGAECe0MTIaC9Wi1MlrIUoRxQd6zlAXtgeZEMsKD
	AxUMkeFnRhmFlJ7B6ZiwtGTRyKnXCycwIepSWJR2exV2pJ4lyQ+088cXXhfwdOsMaaB8HKL8Nx0
	vr9pXv18oIKW24UUrJZqHYWF3X+7pY4m7VMVHP1UWViKuw0MKc0nMBA5axowWq73HRneeCb3GlO
	WCyItePLQO1PlHr5ouDNwzi/dx/rt+agQQuxQU4t0nK+342eNH9bK9rMfttBKn8HsQ0tPedHboo
	7cpaJkMId20Pba2jD3lVSzCGAjUYp03tqH+nGCxz/KBT1k76SgETgDVhxRYI=
X-Received: by 2002:a05:693c:2518:b0:339:794b:c068 with SMTP id 5a478bee46e88-33e8e6a0a3amr1950213eec.40.1790151874568;
        Wed, 23 Sep 2026 01:24:34 -0700 (PDT)
X-Received: by 2002:a05:693c:2518:b0:339:794b:c068 with SMTP id 5a478bee46e88-33e8e6a0a3amr1950188eec.40.1790151873837;
        Wed, 23 Sep 2026 01:24:33 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96946d0csm4859652eec.21.2026.09.23.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:24:33 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:24:24 +0800
Subject: [PATCH v2] net: phy: aquantia: Add support for 5GbaseR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-aquantia-support-5gbaser-v2-1-4d789dc21418@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALeMs2oC/42NQQ6CMBBFr0K6dghtg1BX3sOwaMsANUqxU4iGc
 HcLXsDNJC958/7KCINDYpdsZQEXR86PCcQpY3bQY4/g2sRMFOJcKCFBv2Y9RqeB5mnyIULZG50
 igJWouGlRdbVi6X0K2Ln3kb41P6bZ3NHGvbcbg6Pow+fYXvju/TGzcOBQyqqVypjayvLqifJkP
 6x/PvN0WLNt2xcIz3s12QAAAA==
X-Change-ID: 20260923-aquantia-support-5gbaser-e7271bde9f89
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790151870; l=2434;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=jzd33LVj47mWl9pVPPMzl/xI1CbS4cXQuMHq5iLNkKg=;
 b=j/npe6FyuqJgX2aDH8GYzjz9Pe/aoIWlOeYwrBZo4S4VZwL/S1bfuJFbh4ASo+8i45yVS3ZRh
 h1HGcXl3SpXBBaPohyA1+r7xEioL1jIm1PV7G50QI9ZQovFFBdK1X+t
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-GUID: DauOIY5eL0bKlPxHV-e7jGJWqtc-DF-o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMyBTYWx0ZWRfX0DJrdh9A9v56
 M7Jdj/3tMQd37q8fXcKJOk4u0Ufo+PFkKNVt9Hqa5XMphhnilf+4TPXkp69Z9cQneHWJUaegtkf
 8gQVIP2oi7MJo0nIa/lzGFKF9aD5LDw=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab38cc3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=JMcY5lylPf_IzVq4k34A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: DauOIY5eL0bKlPxHV-e7jGJWqtc-DF-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMyBTYWx0ZWRfXxMnN5BFBBFIa
 heG+KRQtlwgDcsL1vbr1HOMNGaVTcb6RL5Zl1aOZZ+gFMk8mOBbugbaxrHwP99R5gzKTmJkEFbL
 KWywJ+8Nl5mnSQkNAk2frBFcOYtsSPwFj8ZUIDJSZ7B3e5hOBw/QiMefXRByOzQ88+WxA7u+CK/
 eBy/lwZ0oAXLUHSe6LnFe3ztvJ1YcsFKKZsKO0XMxNmW8onKreEb2sYevLC6VctC4Y0QZ9Yu/Co
 ZbBLfdaBihJoZxQ9vINmZEijCQkQSngmdZmnd43/D61grXq0XROfrqhIllh6Bjo/ZQkvyysB3v9
 hrMdr6dWq/qlhQ72kGEDWFAtc2kiJ9KVhFCn29qAejb4AC5lpezXoG3i8/sUfgC5Uv4D3etVxEN
 xDnapCs1fl3lo79gI7cC5p8qfosX8vSM1CzI5+nU9yXVChh0Z9wByfZBNesvFe5JYYyQyfKbQ47
 PJBW9rZsDmFOphLi1Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230033

Add support for 5GbaseR within Aquantia phy driver.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260923-aquantia-support-5gbaser-v1-1-537d39bb8c35@oss.qualcomm.com
---
 drivers/net/phy/aquantia/aquantia_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..0bcec88fcf72 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -49,6 +49,7 @@
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_RXAUI	7
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OFF	9
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII	10
+#define MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G   12
 
 #define MDIO_AN_VEND_PROV			0xc400
 #define MDIO_AN_VEND_PROV_1000BASET_FULL	BIT(15)
@@ -585,6 +586,9 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII:
 		interface = PHY_INTERFACE_MODE_2500BASEX;
 		break;
+	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G:
+		interface = PHY_INTERFACE_MODE_5GBASER;
+		break;
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OFF:
 	default:
 		phydev->link = false;
@@ -786,7 +790,8 @@ static int aqr_gen1_config_init(struct phy_device *phydev)
 	    phydev->interface != PHY_INTERFACE_MODE_10GKR &&
 	    phydev->interface != PHY_INTERFACE_MODE_10GBASER &&
 	    phydev->interface != PHY_INTERFACE_MODE_XAUI &&
-	    phydev->interface != PHY_INTERFACE_MODE_RXAUI)
+	    phydev->interface != PHY_INTERFACE_MODE_RXAUI &&
+	    phydev->interface != PHY_INTERFACE_MODE_5GBASER)
 		return -ENODEV;
 
 	WARN(phydev->interface == PHY_INTERFACE_MODE_XGMII,
@@ -1040,7 +1045,8 @@ static int aqr_gen2_get_rate_matching(struct phy_device *phydev,
 				      phy_interface_t iface)
 {
 	if (iface == PHY_INTERFACE_MODE_10GBASER ||
-	    iface == PHY_INTERFACE_MODE_2500BASEX)
+	    iface == PHY_INTERFACE_MODE_2500BASEX ||
+	    iface == PHY_INTERFACE_MODE_5GBASER)
 		return RATE_MATCH_PAUSE;
 	return RATE_MATCH_NONE;
 }

---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260923-aquantia-support-5gbaser-e7271bde9f89

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

