Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346714;
	b=FHxBTUwte/Mn021Fd/UmSNBkmFqy/lE+OXOWMJQ7nrT1obxy14zkmEX87PZ4fAoKLxQB
	 ZqvpF52tptTiHj3zNVkdLylDGc0+Mlg57Ucap0fB6lUbl/vZTEjXa3uNDU1DCqszTWKuS
	 tAXSJ7amhOlphZQclL/F64CPz9AmXM6YqNxi6+sr6Csb+mIfUTAPVf1t8NVlaw3aEACAf
	 5fFCVjNj5b9r6m8TEcEsFg3ubhT33bulznwhE2Z8SprMkI4od5NpeG7hb623uNt8X3Kt+
	 uATTHZ2nO5eckoKr9s4AbRte1yfnCeDTP9Up15IT60lV7B9h6vpmTei9vFlo3xsu1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+2EtztaLud2IzUZ+lbv0E3lQlpb4tzuYE5ybIQ9MuL4=;
	b=tWNuamPGiogke++ntKoRb7CiDln6lIYIiEdhQ7MJM4hHQ3FAC8+QCX2vppV7dYQP1gRz
	 pYQgnvKzz3PyfubVlaeJgYbmVUAA9DzNSvFuFDeuBqo1tAtA0lBpR0rM/9IqhyqiKDKBI
	 MEEqTjrZ6XG7qLNyZDQepXQt2T/EWZZZS0e7SUBCdyDYVOMKtog2uOSoEFyZxuIlCC/6U
	 XVOID1ZjkThSTCtBjmsnwxvkm9fpoSyphqHd455ESVjjbZUREgC6ZTI/u41qhuTvkOe82
	 lpDO/ScSmteal+JQyM+wkEQwgvnJPm8JW0//xa60ye/Ute1yNzeOMRMDXZFzkgTWD/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mVOQ+/5I";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QA1D/Bph";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A149D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVOQ+/5I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QA1D/Bph
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7Vo725400
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+2EtztaLud2IzUZ+lbv0E3
	lQlpb4tzuYE5ybIQ9MuL4=; b=mVOQ+/5IkDmkp6mRBTEFtMCR0fwykXqEH6DXSG
	a/lzP6FCFZVUzzW3sq2aSKs6yJysgxskMf+0uQ43XqZhSHlD7Hmtlz4olu1a1kI+
	S8WKHRtDPNoevchr6J36gTnN4rjybRsjF43iP+Fyf93w1kMM4rq9IFm569jWQALG
	pY8GXZuecObKzJ4mZmOEzpA1ECSUeQzju0sNo44fhqkPgzfhoulNVV/r+7Bec/4T
	dIY1WfY177q5wsjEczDyNBldC4zgszibayH9be59GIkgpZTYvZ8MfOrD3KXN9aNK
	5a8/kMDv6gzTwLpLpTZFLFUGOw2KYIVr1qDsV9FM1x5Cuu7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phttt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:51:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1032479eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793346712; x=1793951512; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+2EtztaLud2IzUZ+lbv0E3lQlpb4tzuYE5ybIQ9MuL4=;
        b=QA1D/BphWnOtecACxvVMVG9Q9AXhQzacZvWbE69v8R+ACZpGX0j96wos9Ncph/REvF
         /riEaQAkVthHjmJ/BfxPZNPCg+mCYZ0etRIh/gy58XAQAz4OLlJ4OEPTWBt6ZTxw4VfS
         qLB2v+/RkS3JbyOC4znC3oj+LzUZGWREXe61DRHyohc3/sa2kQZK6KBkqUD5pOz+pW0h
         IOzfrlUmJ7Rg9yx4HFchOVe2VVdD3XjR0Ska99Qje/TDMrlGXNikfmTa4jxtKNwQKOd2
         KJjttd1IlDyCdmlLkZEzPYrtM3imPwUUL/YXYNOX+hS5ftYkOWsL5qsr1WlDUTnjJdGp
         N5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346712; x=1793951512;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+2EtztaLud2IzUZ+lbv0E3lQlpb4tzuYE5ybIQ9MuL4=;
        b=LjK+9HIlsPmO4DqYaKBcDn67csYMDfU/nmQs9bIEh0OwPsBb9fdvMTO4avmzjWpjK3
         adH097SXfTL5wLnADJS8xmzGJ/Y/xnDo0sVCN2ZHGcfSDIsO0NM1KXT3pIrZnu8c5ORR
         3irMny1fKheuzQBaCrzQx497eWwB+cBiosq1zO/xa2FOzRtvDnxNTf1O+P/nP657zDr2
         LMNrr4M78tCk8O/VpG1K14+ViCLG7Z/PIuOB6GMIyWbo/hZgZZR/hn1xn9NQ6BIqy5y4
         AYrrgT/Bt1QMmZrRr9BZxA8ON/OeYzVejoqDkm4NSHOSXQMiW7RYmZxfql13zHvDJ5IF
         fHbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfGia0JJ2Ag8IA26zeTtxPPL2BziSLEFP+0II70Hp4wh91dy9znYHzAtYHbLt3wCX6zXbzuFObsRATECU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI61tiHnu1kZEDyCzB5QtJSJdubVbR2U+08OlPW9fhh5QGsEw+S
	mmCOhuRzT+/hs7a5S1ZLTgPHQTwDZVt0xvJqOL5QbwLg35E4XdpTurL9zphM1DuPs4C9fm4TUhL
	ni2ZK2M+JySiZfBfTGM7zwXhiq/etmsFDGjEOritT8J0kjBfGfvDrJHUSKPfQ52HIOkU=
X-Gm-Gg: AYBFou2Z6I8lYZYYvlvpOnfYI+Qcjbem3kgiDwFhlby2/1mjHBC7HJhPISw+qDHQNcO
	q63TRCRigUZ4Kz7fRQH/VrEYcx0EHAkE7nnw/gPNeuesjUZCpyrQ8jmppRJ7zL+Lpvg8XDdQ/Ox
	NvDppeahM77gHL071Vb3ypbArR1wdwV2eUHhg3oqPdgEKxbrgmpVA3XnR8uHsiqm+5MGm+BDqMt
	YdoT2I44RoiCAesaXiuhnA8prOGKiBk4AUQ17XJY3qEl2FTZ+wy8dasvD63WjSinqRkc9+6/bHY
	LjLHYDkPHqxbD9F/7lcv4m1ud70RE/7C67gBPqlnQbcN9UoV0KrUpU3TEIppt8+fLynQTX4RTn/
	8WrtYj6OPwQeIQ1HFyz/iyuZMwf8h7PpgZkmjzt5NGX7iHQx4EJqi5sG4HKezOoCWbtIQl9Mqd/
	5mEqiuJSSKuBg3IUDfdLBTGD7dnKIi0fAA
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr2276913c88.46.1793346711867;
        Fri, 30 Oct 2026 00:51:51 -0700 (PDT)
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr2276864c88.46.1793346711105;
        Fri, 30 Oct 2026 00:51:51 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm5670791c88.11.2026.10.30.00.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:51:50 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:51:42 +0800
Subject: [PATCH net-next v4] net: phy: aquantia: Add support for 5GbaseR
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-aquantia-support-5gbaser-v4-1-7dfb0cf306de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI1M5GoC/43OSw7CIBAG4KsY1mIKlLa48h7GBY9pxShUoI3G9
 O5iTVz52kzyZ2a+mRuKECxEtF7cUIDRRutdDuVygfReug6wNTkjWtCqEJRheR6kS1biOPS9Dwn
 zTsmMYKhpTZQB0TYC5fU+QGsvM71FDhJ2cElo9+zEQR1Ap4f8mN3bmHy4zl+MZN74fXAkmGDOa
 sOEUo1mfONjXOXpo/an0yqX+dpI//Vo9kpTN8JoSkrSfPDYyyMFFV88lr2WtIKVFefMFG+8aZr
 u9scWVYMBAAA=
X-Change-ID: 20260923-aquantia-support-5gbaser-e7271bde9f89
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793346708; l=3950;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=+MK+tPcBQCfj27wF095lR2jy4Qy+rnqWGg/co78Ru1g=;
 b=tTKRTjuqNKcej3ryTbrkmweskkCPh7rJtoZOZ+HUlzOj7Qlnu8BCWDho5i17zt3G4Unj7UisL
 DseNJM/CnI1ApwHRq1vJK+3eZ0mjOjKyGAkGzevUImA75aFJXKJG+WN
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMSBTYWx0ZWRfX3fGsl0f4f6Zb
 5j+7s+ja0b6JymiB41xeczVDbAWBpV/7RNGYu0FOz3MpENB/kKJL2b/+tytfr/xhkp/2uNALCxh
 DHclFrcyvFAtRamXrQM/McdRaY0paKX5eRJ9AOKI+P2kqQ62S95S1NJqyUBbEcydCmf1NCj62bu
 qA/woeM1EeYZVmQ3saHCE3wXCAhSWYHcgO44Y5jKhGUexmrNTLpOaYuocJumgp+hT8ZuorKwKvd
 QHZTU4yxgsSIpLCb2XM2xD0wWtTXM/KZ8E6m1WC7TwBb5jsh4rCTI3qXDsN9DcA4Qd4/9hj6701
 e+SJzAkqtu3XQ68pBOIIvkK7oESGSJmhCe8883iQdMC9JWDU4Y7B66K9x2h06peGQtmhaDHyBFO
 x36AmMKGtYvU9e8T4za9wzj160J+XPiiS/LWh+xYsnYw721rM2P7u2n8b1TBS9XVfDeExF+325w
 rZdBpR56ZdrjpLIjjtQ==
X-Proofpoint-ORIG-GUID: OMD7QrdPlKEICn8nl3m9b8HPWcgYJgLD
X-Proofpoint-GUID: OMD7QrdPlKEICn8nl3m9b8HPWcgYJgLD
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae44c98 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xUtIZhO9L1281Tkm8lsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMSBTYWx0ZWRfX2M/gNFsTk8Lv
 ysi8QvC9yXY6a4KOLcxRcD/lF4v+d2JKM1KeJbg3OGyp5azD0VU1BMRpdRKjRkE2zJV3V2pmi4Y
 X6ANNpr+k8dHT5z1Et63g98KicS7waw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300031

Aquantia PHYs can operate with a 5G USX interface between the PHY
and MAC, reported as interface type 12 in the PHYXS vendor interface
status register (MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G).

Without this change, aqr_gen1_read_status() falls through to the
default case and sets phydev->link = false when the interface type
is USX 5G, preventing 5G links from coming up.

Add the missing PHY_INTERFACE_MODE_5GBASER handling in three places:

- aqr_gen1_read_status(): map USX 5G interface type to
  PHY_INTERFACE_MODE_5GBASER so the link is correctly reported
- aqr_gen1_config_init(): accept PHY_INTERFACE_MODE_5GBASER as a
  valid interface mode, otherwise the PHY is rejected with -ENODEV
- aqr_gen2_get_rate_matching(): return RATE_MATCH_PAUSE for
  PHY_INTERFACE_MODE_5GBASER, consistent with 10GBASER and 2500BASEX,
  since the MAC-side interface runs at a fixed rate and the PHY handles
  rate adaptation via pause frames

Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Changes in v4:
- Keep interface modes sorted by speed in aqr_gen1_config_init()
- Keep rate matching conditions sorted by speed (10G, 5G, 2.5G)
- Link to v3: https://patch.msgid.link/20261029-aquantia-support-5gbaser-v3-1-f1f9346553d0@oss.qualcomm.com

Changes in v3:
- Add git tree name net-next to the subject line. [PATCH net-next]
- Add Co-developer
- Link to v2: https://patch.msgid.link/20260923-aquantia-support-5gbaser-v2-1-4d789dc21418@oss.qualcomm.com

Changes in v2:
- Fix the local variable assignment error in API: aqr_gen1_read_status,
  should use interface rather than phydev->interface,
  interface = PHY_INTERFACE_MODE_5GBASER.
- Link to v1: https://patch.msgid.link/20260923-aquantia-support-5gbaser-v1-1-537d39bb8c35@oss.qualcomm.com
---
 drivers/net/phy/aquantia/aquantia_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..dffc81b9eb52 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -49,6 +49,7 @@
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_RXAUI	7
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OFF	9
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII	10
+#define MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G	12
 
 #define MDIO_AN_VEND_PROV			0xc400
 #define MDIO_AN_VEND_PROV_1000BASET_FULL	BIT(15)
@@ -582,6 +583,9 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_RXAUI:
 		interface = PHY_INTERFACE_MODE_RXAUI;
 		break;
+	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G:
+		interface = PHY_INTERFACE_MODE_5GBASER;
+		break;
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII:
 		interface = PHY_INTERFACE_MODE_2500BASEX;
 		break;
@@ -782,6 +786,7 @@ static int aqr_gen1_config_init(struct phy_device *phydev)
 	    phydev->interface != PHY_INTERFACE_MODE_2500BASEX &&
 	    phydev->interface != PHY_INTERFACE_MODE_XGMII &&
 	    phydev->interface != PHY_INTERFACE_MODE_USXGMII &&
+	    phydev->interface != PHY_INTERFACE_MODE_5GBASER &&
 	    phydev->interface != PHY_INTERFACE_MODE_10G_QXGMII &&
 	    phydev->interface != PHY_INTERFACE_MODE_10GKR &&
 	    phydev->interface != PHY_INTERFACE_MODE_10GBASER &&
@@ -1040,6 +1045,7 @@ static int aqr_gen2_get_rate_matching(struct phy_device *phydev,
 				      phy_interface_t iface)
 {
 	if (iface == PHY_INTERFACE_MODE_10GBASER ||
+	    iface == PHY_INTERFACE_MODE_5GBASER ||
 	    iface == PHY_INTERFACE_MODE_2500BASEX)
 		return RATE_MATCH_PAUSE;
 	return RATE_MATCH_NONE;

---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260923-aquantia-support-5gbaser-e7271bde9f89

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

