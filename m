Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252871;
	b=o0oG58cenG6ew65hm8AT9J88q+baGu8bvSC10GcLiQ+r7Cl2tdULpzlEWcyQlyTb5xud
	 5l1We7H8v7kPKW5BOa7tLiY2Y/cRrKeIrWCUUrCoHx6Awb634fYaz6CBrIBKuINTxArU/
	 dSb8PqZ8t4LkNZ6ZgdWZANVYONq7ynS7PUHpV4WEnuCWkDAAdJc8/Llc3uQJQmVadZ+AV
	 566rh5TTLjKdlNvT2tcLCUgmmbkI2LQNJiRq1VrltWCTCRHTeglZbWA4egFE27xEcrM3z
	 cMjupDdXEkVmtOgw+CRF5fadgTsXzbf4ejNiYg+1Za3HiJj39/9Tjpe9ddky7OF2UPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aQL4EicGq6alzodv4b1ZZDnu/EvQ8TEvCv3eygcBvA0=;
	b=bvp/C75n6m8KaMgF31cfLHO8ct1PLioRu2dDrLTJgAJponBI5D71XggLr/8Aja7p03pc
	 1DF73o3KDjPDd6vsfGe5NiuA7YKHnJ5IB9GcQ/XOs1PhIvYyd5JHwFEv7YdTZtEmE3uzi
	 139EwxGq01z3DO3NoNHvuZln4pS/2EZRW3RYf2vjvmePLfZfORNV9nTCbzw5PNW3fAEjk
	 jnYs0S66rfEZb3TsjPRa7m5eL0vcASeO0x6slAnsWLEY3L8Sci1WvXpaqhV9pdm1Tvyrt
	 GjXt2DFxzVJnJg3ImukeNdorva/UH0vmOJvgfX3lio+ETP/XCBwjS7sOHzaH1x2mQOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfTmYG+N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTJBZpQc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfTmYG+N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTJBZpQc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gu9Z3829018
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aQL4EicGq6alzodv4b1ZZD
	nu/EvQ8TEvCv3eygcBvA0=; b=GfTmYG+NrkeYIclWf6ilLtiCfVN9vn4+RM1wGK
	6N6ulbua5F06dW36LVJgA+1o8CzUHH65TdmzC5PRttJyv3i7n2rqTf6iD0ZETW57
	Xx3U5vzTS8PGN1m26JinJBh1K0MzZzcFb0tmpMdN2HCmcnSEr2/WkWub/3ihAY4t
	Mq7lmQAwVru8rUTRxHOwR0+IuvUN/4tHgD7pG/X1nRA3CPdOfNcA8uH+5XM/+G11
	0U/vLFAJcrBt+9JO5gZIuYtEgR1kZSROcJK8fHTF3pxq8psvHZ1UCSr45nlz8wvP
	YGQZ6XzxeU+Wu4U6tGb9DoqW4W4TTXdbXvsF7wAa8KjMFbJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp94ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:47:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so2575985a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252868; x=1793857668; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aQL4EicGq6alzodv4b1ZZDnu/EvQ8TEvCv3eygcBvA0=;
        b=XTJBZpQc+CRnlhiRy8UDtNoIQ09+ZH/OG8MD9YzdOrGdUVUY6xUQoCcYhX93b8tKET
         WJe9Vr6228SmMYpTmOmSe89f4IsOV+9zKo+9w97zp7SpwfcvmNfPDL6oyX2em2c45VIz
         yjQtCJLJKsIbvuXlaVoJpgcMK/VU/yWrUZ42FssnxnYJiJjPXllABMXDExeBxGxovsKO
         hacrNB6Vyo+4XlY0KaHW2jwbJxtNVVup2PV+9sfkECvnbOZYj+LlHDY6g6nUKHmIB94w
         seyQ+o3qvA30VpofbG0/VpT6RGjLBRk/aonkgNx1CNrOyuQNLpxaMO2E6jTYP8vqmvVL
         8bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252868; x=1793857668;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aQL4EicGq6alzodv4b1ZZDnu/EvQ8TEvCv3eygcBvA0=;
        b=XQ7/ajR/aM4FFoS0TFPQNhPlR5BIBgLBv7wMnQRqAelQHik7wbvRHGZBAnrCreI7un
         pDj+RuqfKcsgJok1BvT6nOh+13631/Sq/TQmu2sI4pafMa6ENGDTlnq/HdNV7NzGdm0q
         bJTXev0sqytJsV5KG+sTAMYyXY+2+H/upcuIPdxxsrV7Af791U6+B09JPb1wwOPBrzYO
         jG5RmyZDuHqpHagBhmyCj2uvIu1b2JCHNulMKRCP8UGal/ozze/Pzq5AUtCxAdL9Vvd6
         WM86m3V91FnGsicVB7f+zhJh54siv6lcF8PsUUe46xvExlX6SR7SxUzBVpEY2kzoI60r
         t42Q==
X-Forwarded-Encrypted: i=1; AKwUvBxaDYvqMasSYcm8X4ijY3TvSx3aiXzCC4OOLAyZ0JeDjbVBJpyDtVTBtcTeasx271N4Gc6Ja/3O+bZ5LOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu2qB/0Wf6DF8eTFHoM5hHs+Bd1NLruCTNP3D1yCRavZCcjDKz
	pZXQTnp8CGEaG6aTVNN1iV13QaXlZi9a9LPYNcnmUBcGg8KA+UpHMk8WFZm+TyYl2/by+7JmHv6
	cXpVQOjLD9nV9dQk+zoxes8itE4bnA6QfF0Pb5TPbqOXvtDuOoBnqW+zf7InJCMKSQ4c=
X-Gm-Gg: AYBFou3S68rCdVja9sL4b4Aq9YPEIyWnT4jUh154Hm7iBfEG4lECUtZLHE4ke/4EOwe
	KWkJ0VZN6Vrq8OqHL5QTcOiwD8DzpEmtAj4QPOxWTV31rYttu9hNrkWhDYIBRb+P2HrSTdo/ZqW
	NvjHmt9Qru1vBxmK8uCQNpGcp78xJNaSINCw/4FcW2qvDjYBpqt1wuWlbOAbQZz336aaUoIL1xY
	KI6uru1dqTH2kJuj/95Fp0hCqSfS4HZIQiLNhmw6mSznezObytSKTndt24GiH/MkY79RAulhUhO
	nUIT9kiG4lnYSfzlGm5rwV8zLurRvmpQurxy3suoENBQseCFeM90yIwslXuF3p0lAlf90njoA5k
	m3IskpJ6aIpupw7DjQWNlV0rBdwwh+N7aqsrbBhW+zezP8Pm7xvsXEvEdKNejdzzzkdrzCrCOiL
	c/BtQ0V6zZa9qRSIhhc84XG1C7Eg5Ybhqt
X-Received: by 2002:a17:90b:3c8f:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3ae5832091bmr3853154a91.61.1793252868297;
        Wed, 28 Oct 2026 22:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3ae5832091bmr3853140a91.61.1793252867822;
        Wed, 28 Oct 2026 22:47:47 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac746sm2419141a91.1.2026.10.28.22.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:47:47 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 13:47:41 +0800
Subject: [PATCH net-next v3] net: phy: aquantia: Add support for 5GbaseR
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
Message-Id: <20261029-aquantia-support-5gbaser-v3-1-f1f9346553d0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPzd4moC/42OzQ6CMBCEX4X0bAltQagn38N46M8CNdpiWwiG8
 O4WvJroZZPJznwzCwrgDQR0yhbkYTLBOJsEO2RI9cJ2gI1OGtGCHgtOGRbPUdhoBA7jMDgfcdV
 JkSAYaloTqYG3DUcpPnhozbyjL8hCxBbmiK6fTxjlDVTcyJu3NyE6/9pXTGRP/C6cCCa4YrVmX
 MpGsersQsiT+67c45Gns7dN9F8eTbxS1w3XipKSNF9467q+ATEww9wzAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793252864; l=3752;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=oSCOzNQKtZlS/9NWiCfaP2XeMMAzavYIrT1WQCBspgw=;
 b=LR3/PRYXfTU5BpG4rw4s1uMi52naf05m04Rqw5kV8/sYUVFN/B/b7xRQgFO57xQJgqji5N++2
 moD76OgCzT0D3qBaasYfyU0y/qJsY9+D7zw8O+wqyk84P/IydZfr2Gl
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfXwiUs5iM2ES/F
 IA4cUkxQwhSw53uozXCsWpF9TBH4F12loS4I8VjoLGemJjk+nvtO2WpZre4cyI9RvOQBgIOtSHk
 R4nvz5utb8wHENhHwrOw8OpDbCKzJMJOPKUqepYO/Y/XDVYsdu/RcTu3kmq4Fy7S9gcHYqi+DQ4
 PHrB6WiNLWPxLM5NNo6QTYfcHjjjiK/jFphfy+7elCwvyl7pAXpgpOLfRgC3tFHnPCT+yV7X/yN
 RFRoBgRv3HTdwLaXI5LcMhNSWyzxKNnz67oE/y4MBV/u6WkW97bcNLiKVNOdKhJ/lfdem+bNgyb
 nkvpu4YnJUeY+uivUZZXW7cxI2oPUerDwMYkaK9FweCrjheq/g5F8aEF3mB+PLj3HZ2SJylfNAJ
 1KVE2ax9Tb9hjrG/t0GOSP2qMj5gUOT3QZTRkl2cwbJe1bpQlGvcmx6arQc9266dXd347X+Hp2w
 Ft4Ir6kzdAfl91dvpHw==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2de05 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bEtV3SpGoilhSLS3K0MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfXxu3Wp45lQaCV
 sz42kJnau/n190DJsEVFdZi0gVzXHRz0XfQsOFKBPXHaxjQVHjGnuw3WFGXDnP/KDmBv9FHvFLH
 xsz9mC1QJrw5Nw+H9It6HmT/OMwuC9o=
X-Proofpoint-GUID: 9cgP0075j2TTVA7yoKYZwu9vCP0TOHL6
X-Proofpoint-ORIG-GUID: 9cgP0075j2TTVA7yoKYZwu9vCP0TOHL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021

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
 drivers/net/phy/aquantia/aquantia_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..1e3df47365e4 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -49,6 +49,7 @@
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_RXAUI	7
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OFF	9
 #define MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII	10
+#define MDIO_PHYXS_VEND_IF_STATUS_TYPE_USX_5G	12
 
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

