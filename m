Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786282;
	b=iGmadAWTi1eewoMepwl3igaGq7Hsm5ASGARLfhGyUgR3IKbDUqs+3I9ZPEWL+DR+jyFl
	 1A/pdMMjKv/TngcJlUn3ZVd9LRD0I7XZzFlQz04t1VEfmrgKkdst/y5nJ6QwhJ3qwWSul
	 5xvtsy+0vw93VaHscDUrHhVzLR02Tqmg7tfMk77JNLjFlOYyQAOivXPeECnsP8qNw4bnJ
	 3OMEj0wTZkJSAIzlWnAaqpB0UPBBi8LgVtXM3zimLghDFQn5wvo/S3QCCGmdh7AiOCLl+
	 XifS+NmvVMkbhjsXDp5aNzA/If0URo/hQpyfvSF5X4XSyYRDikO95jS1S/RlQMSAQQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KzJFf2z1UBNxfpF0LvF6/PXDKDiprUd3QNgbgxgbgyc=;
	b=krCgklIACKpzmAeh3smOwlxqbmONkxD+G01I4Bgk7X0FmcaSLjF+ksglJTaclL7Z7Erd
	 QYyBEHtHmCkwaOZvs1uEZ01UEfnj/ud/NSACLXcv7R0txdRqtjCsj7fHMxGcHlm2W5Wz3
	 xrWmst2z1HaLHwJnL1UTqxDWxCxrygCYZBGj52ZAMIaaFC3qnyAR7ZDe83++tNKslU18K
	 7WOV1SlATdXhWUnmdHJXb9dXfHX4D38+NekaWp8YexeXS2EWEt75H2TVyQXSoppedk0Cv
	 e7F9wfzRYdkfD77rVcJiuacNJeXjkQz5LExTZePhRmJbOHgiaUjd8cFKpQSGOCThyfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhOu9jdF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J/OWq54V";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2317C606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2317C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhOu9jdF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J/OWq54V
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KHKY918276
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KzJFf2z1UBNxfpF0LvF6/P
	XDKDiprUd3QNgbgxgbgyc=; b=IhOu9jdF9EhFaa69kTt/pFxFwkosmSv0113uUt
	X3DP/0ikP+ZGQMo9xVb38A5p5d77gu0H1+42tsj+mzXaRXffTF5gXrR/MT0tjhVA
	Uc0S4gdKScP57EoObAmspiPoBCPz20xvMKFFQhExnaHBNJ7drNYX+SGvaSzj3C06
	c/uJmb4IoCnxqiRroqllD8knj3jeBtzmgIJuAke189qOS36s7Mt7DTT7nn3LJybt
	Y+F1sHOv23sgDN5XBBPAxOXlN9RaKf4a65pU4Ag1IDXwVCiBnB3OEKi2R1OunAMB
	V06ByMmLZkPCAoDFoE/FF1PojRPC94eN/pafrXZI5ZxiAAgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg9guc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:58:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d2d353a5aso281278eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793786280; x=1794391080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KzJFf2z1UBNxfpF0LvF6/PXDKDiprUd3QNgbgxgbgyc=;
        b=J/OWq54VLtUqmrKBleM1XNZtaeNqtTtJlWPQDLFq9RKWvxQw/8xuhWmwrbvVNFDHGz
         nbJOi4UJCXYA7eFCIfLQ/ADC+uVOG+urIGBoOiJvY11mogaQ0syQMBMTMZTXX40Vw5v4
         zOeaF1cYV/XQRV9/Tm3PzDGaxpaDxLvtEVTgkMHnwpjLkmU2G7F62HlMxUVHaInKCOOv
         uKyXKv+5tuxsuZb6u4HBKrCecNGrLbs/LT54kgL9ooxwUJQ5oLD1uQJGlnytsRzSZR/E
         YzcHAYwJQjs/rDM6kULItIzbMjob+rqDlmhBIoCTZortldpGWXFlIeMWvTYSkRfiG9B7
         cASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786280; x=1794391080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KzJFf2z1UBNxfpF0LvF6/PXDKDiprUd3QNgbgxgbgyc=;
        b=2w366sLglXNnZy5iS3Gtd80GeicKb8Lsk48Zude/R4ZLU33vnqIbM0M05A2qo6onYK
         H2rOdRbJbh9pQjoID5n05kJ/ZOAINc8/lPaNq5tUFo65RYhOAZqwMN8pfc9xLHNkwKcH
         fT8QCQvqhp7Wll5xetcazHJPAcuYPaXeXy9lUUuvGoIGBUzNct7zQItc4AU+Sb5eNw+K
         gocSdjoxk9gNnEzYAsuDd5BTY7eQX0g76+Cy9CUufq3ylo+jFv50SbjCzPQ70RZl70Yy
         M/0waBac8+FlkeliqC8/O53Aj6iMrl7OiFoFca6QL3gb9A+G+ADO8xGJrdfok6kPoVWm
         93Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxH6cWZZlWLHcJ2Kwejy0jrl7YuMIcQ+ouPkIFAx67Zj3ZCxaW7MHyHD7boBS8R11P+UdjZTNLwaYaqNHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zaTXJnzeRJALr7f1Q19jlKQ/vAS7udG5PNTNCyS//9BERpRsr
	idbjp87OeiLIGkTi+0t96YWoObycmnd5ZheOphM/JU8/7LVKMhOCeWs4y8X7snIIN+7T8PJSudg
	FmUTxqMKg46CvAze997J7MvRSDPNpnj8P092ngkq9myuozjmqOgNdnzaiHHDl2xd7i2o=
X-Gm-Gg: AYBFou1sVMkvRUihahsYEhdbvIqYhuoYLCro8zkS38ruN0vNWNyCEejpuDVO73tjdEF
	dPnHpoeC38LPawF3a756waC+cEWHpZ2To/KhOL/RC83lsTo9EZcWr20Qyqc8xgj/SfI+v/D6VNv
	SHh3kZCjI46rUViHAxb5UF7GSFKzLhxSXaB7zm7ehWmSKvATZaFp9puIs5MP6FJK46zu7ax242+
	tRL6jOkxDMf20MbfetwvGqzxLznQwi4xsFs4jPAzW4JSm6+X7dd9carXXDetlmIV2nXBrB1i0t+
	YhN025XPR990zifShXmB5bY9eqFPtfecPLV+o66gP3ugSSb/2RljMMNVCBbCxmnzNIhVrNu7R1S
	rj9WHz4AbxHSrDW0qXbchWIMO+G6pLUkdp5zDtrILxVqveV/U5B/EaxJmBMOFw/KXFxopTu37XA
	5av4hGq8J3ZuoYEBOTiiqFD8zZWGluzH3Q
X-Received: by 2002:a05:7300:f293:b0:361:a195:c46e with SMTP id 5a478bee46e88-36a2fd4c964mr27282519eec.1.1793786279563;
        Wed, 04 Nov 2026 01:57:59 -0800 (PST)
X-Received: by 2002:a05:7300:f293:b0:361:a195:c46e with SMTP id 5a478bee46e88-36a2fd4c964mr27282481eec.1.1793786278894;
        Wed, 04 Nov 2026 01:57:58 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm6141370eec.1.2026.11.04.01.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:57:58 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 17:57:52 +0800
Subject: [PATCH net-next v5] net: phy: aquantia: Add support for 5GbaseR
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
Message-Id: <20261104-aquantia-support-5gbaser-v5-1-9adc0f538d66@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ8B62oC/43OS04DMQwG4KtUWZMqz8mEFfdALPJw2iCaDElmV
 FTN3UkHCbGghY2lX7Y/+4IqlAgVPe4uqMASa8ypB/mwQ+5o0gFw9D0jRthANOPYvM8mtWhwnac
 pl4blwZqOYFBMUetBh1Gjvj4VCPG80c8oQcMJzg29fHXqbF/Btat8nT3G2nL52L5Y6Lbx98GFY
 oolV55ra0fH5VOudd+n31w+nfa9bNcW9l+PdU94NWrvGBV0vOHxb48Spu94vHuBBs3FICX35IY
 nfnic3PFE95QPlrjAyeDhF29d10/6jhfq0wEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793786275; l=4136;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=2qppQJ0GPHZ4fkQmhKmAeoLIuYROcqzgcFnAn6MeoZQ=;
 b=hZDy2Q9lDQe4wzrnpaJ6IPss7MsA95TIqFzX/hzCOd9xg48Hp/O1BDj/EwbBnyl82EWF0jTbA
 fab+xlweVARC611M7SNQmgmdzjnF2Xl4uiFxWJ4EGeRku8J7++I7uos
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb01a8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qnKKVoelqm_VwwwT-SgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: -xZaajSmjSj1QqcCVg7YCLNoMs1O_ln-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfX35cQ6PGJiH87
 AZE0V0fbJm7liv9NTiamsoJUkOxBSJabbxsbI+OFhWesK1DLf0q2h0SYNt3SKG/VDCde5Zpxtok
 QQ9Y8Lzorgk5LDxL5gEhyjylzhQD/vhoTVFQVT4DsZM18VXqp08FDNkbvdjgd0TP181nkARyzTM
 k58RWb4VwnKE3m5YPzI7FBc+a7b27C4ub+ACrSPJGPA61jw/2JJFkrUeX+6WaQigXtcTXkQSTra
 tCxMxVX1Pj+hn8KKvX9N1byD5+70T8+ugtxlkx0QGERQK6nVxYALS2zwh8zQ2UkkUzA3eJvUQf4
 1BT1uf9B6BHd4E35ROdOBRzS1RWkuwk+SovzrvZurZMNVTTfhDuXjE7zQ5yzi6p+vwPkB1ag3I7
 U4oXcDXzWYhsCwzJAsAP3qMPu3GMYnK3Lr6n7t9HCNag5gyKLxBPzo9PSpG6vrotTvvtKxY26aE
 Fk0zoWgR/PGkSIE59Lg==
X-Proofpoint-GUID: -xZaajSmjSj1QqcCVg7YCLNoMs1O_ln-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfXzrWgMYpTmnE5
 wftUPnaqvvMnO2LLE4lmbl0aBYX5RdTI1igMObjeRVhEgN8ZS4emmdWqKxbSKra07o94b3oMj4w
 +YawCUzUhwmiI2catjA4tJ6Lzpj3Kl8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040039

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
Changes in v5:
- Repost after net-next reopened; no code changes from v4
- Link to v4: https://patch.msgid.link/20261030-aquantia-support-5gbaser-v4-1-7dfb0cf306de@oss.qualcomm.com

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

