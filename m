Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661597;
	b=4Oi870CBp5Tjb5uhV28q2HiGzaRqY8r1SS1/0uN4b5+vII7ngGf4cFXDUuIA46V7QPEG
	 hTqV+/pWq4Bc0UvtTkff1oGA8z1MNuCzqCpAk00wMOQ/KzC4q5wtYzQ7ohvlN8BycgHbc
	 BOTUo4LqXZGXjYXBwMRa73zOSZUJ248uUsn4kau2pqQw+0e1SXqCRjBzBGD+W6lxwjKVL
	 lQerQ1u9gOQpVTBY7Mb2UohCyuqO5q0Ol0J+QeQQjNGB36nNX0txtZmexQb8D2T2sKLKu
	 z1DCYqtbLbubvV7HOhOH1W3TPHJrteR+tq86KzecyaeNnKmDmHH9JlFKOnAHVYtPAFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxeHPu72hzHe03AD6HAsRMMpCMUek2XkaAeZNt/w6uo=;
	b=tb1F0mZjEC61i29TyHl68NpaMyaT+yrGGdBOuzqphLwFQ35AF3t+SESy4A9+bktkBT1I
	 i9DNxY/t7NZA34j/NwNFE6kSNlvrUrslwCbSAebTloqQsjaxIwL7Z2hxaxtqyOHcpaXJC
	 sMMrBmqHeS416zirh1mzsHQ78LZR5+nxMxaISQXo3YeJz3nrp3ZQGzrJ9NhTn1/0RMm/Q
	 4qW15AaRldLSxl1PeV9vEXR8bcMqDTa3fkLAZOLHk36d0bczcHtwQmbO6K8tQudufB2fR
	 2MokzQRereU57TX98KeiUl6ZfEw1zpYrcTxdD65LfmWECagUkklpT6+JQePScSSg8Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2tuw6rJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F/ZJ1WmD";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B3606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2tuw6rJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/ZJ1WmD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Ifd43766784
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pxeHPu72hzHe03AD6HAsRM
	MpCMUek2XkaAeZNt/w6uo=; b=N2tuw6rJ949QiMqE2H+n+gni/wAapLN6ElqGp6
	ItCL6ntJn0vaZzXekJ0+7Q+JYUYSAClnGFe0uXG4MXOWXW1amqvuHpjfpOLqwLrW
	zowlLpOt3lqJqtFZYmIxAP8S9NqGaSe/h1L3MPojrWDGWvGPsPPvlc/jVyscoxM0
	LJWChkTGQqnH/l3fwC/8Yen7vHgbvpOgtw9m1KlYQldB0RJ8lOQFgIUNeR2hZ+vV
	jey2+ZR74U7vJQCMgYIOsrddC0ifFg3mFudT7BzMOJ83fjsUSVqODAC35sb44qKe
	IwGZCws0CaO9GCpGCYE6TGmoyQbkuchLPg+sznty1epwPcog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9npu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so925538eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661595; x=1793266395; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pxeHPu72hzHe03AD6HAsRMMpCMUek2XkaAeZNt/w6uo=;
        b=F/ZJ1WmDwx1Y+S2HpsdcN4IrQ7pURBa+aoUmBitGKTEbBytRz41mLz1qbjEZ0V48CF
         Qp4/FeoGT3ENLmtyfC/7Aim/pLB8ODoeox/F9P3cXYgVfRwqVH2C88EjFGjLijgtwmVY
         0v/SRhDrqVcD+URCbYUkm4aBgUFtOS+UCBbHmQWGO3TZwEE13x5N4eK4LFjckPsx8KYb
         vl2EDzDtoigQE6rRZdSnbJaQT9KBpcxrM07+qIe67gCGBQrrlq2CZPkgSEao3RdGM+Uw
         qvrXfLh/oBbzkWkXLw+GhVWkb5sIyXkeV42bhf4u/UjDP2o/3/iHO5KMLaTUf9ryC9Rj
         4xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661595; x=1793266395;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pxeHPu72hzHe03AD6HAsRMMpCMUek2XkaAeZNt/w6uo=;
        b=O1EtRZ2t6B7zy9b+ePa3M7iwS2C+a7XebNtKugpJWNI16+C5LKCSAcQ8311xVCxgJv
         VIjfhwAnj5Ny1rYwZgZAMG9CvFMuPgtRdD/jHxlqPClskzXeFYlrzi568tnVUpGB49sN
         bZYPLp8+cWnK2AMZE+RSFzI92g7okq2SmSqAGEqLQJrAQhLX5LI6bTA3pxEOUQic/bPw
         vVvL14NwZU37PjkMN90G8daoJS6NaLMIMUYV6751K2gYAtipKh91mQQ1AZORKjObuJcl
         7/+ErdqfXVCUovDIYFdYekxE/6YpQbpT9jQ+GHoQL6Bnn7SiQ26bvNZhSuADrA+ZAL7y
         e/dA==
X-Forwarded-Encrypted: i=1; AKwUvBwQfFIOG7PC3hca6DsWk7EAbM7xGFOBQ7zDORQueOmngz1rC9BCmYBvul47YCFw8IkP+s7Mg7tyWIL62ac=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO3S+pH1EHO+5loLw1vZ0eafs0/2RBaz98lnJ2zq0y6n98gW4g
	ugJ7WIfqDpgcECO7qpjRQkn//kFcFW7eqgEJXQ04YB3W5opL5+QCBBUPH9YkEQRPR08qOocMWiX
	5+vjTRINuYwnTkTpC8r1eOBPnZJzVGgLUUuAL5TrIUq8K0+jBrclE0MkeWo5sXb+UcZc=
X-Gm-Gg: AYBFou35XVSzS7f3958hOKqoUBIgAc9t9SGIPsHhcm1XWmPx64VTdPLdc4MOtVfdcbf
	Sddj1ivUyWvh+NiQk83BroCkMXYHgqd2cgqelSDvuuOdcNJHVlSxTnBZwST1LRHX6oYSjH+OMIX
	+6M4Ps8YFoeB5Tvbuh+7qqeWAqxtkRnvjRXmUNdddzpV5UV6Yk9/XLPaTfFWcKW7CR8Ua9JyNVx
	nwsJ+TEPHYNgxNIPyFFBsjskmMg+S2swdrz8PeQWv1ShP2dNJ3sPUym5a10Kc4fP5sasblKr6Z3
	yHMd159jlodbZ+uDKogiA0nEYcmMhZdxu1DXtNHOGhNVNb56mUorDzcNG4sTZIwj5Y15CN2hEt6
	SQhAqt7AW1yi9e34IOoT2zYV/sDu4/L5Xpnib9fSwgUu8A5u/HvfFoliITY8=
X-Received: by 2002:a05:7022:995:b0:14b:355e:2888 with SMTP id a92af1059eb24-192f5e1493dmr3047457c88.27.1792661594579;
        Thu, 22 Oct 2026 02:33:14 -0700 (PDT)
X-Received: by 2002:a05:7022:995:b0:14b:355e:2888 with SMTP id a92af1059eb24-192f5e1493dmr3047406c88.27.1792661593948;
        Thu, 22 Oct 2026 02:33:13 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm25904494eec.2.2026.10.22.02.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:33:13 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH net-next v4 0/2] net: phy: aquantia: fix PMA capability
 reporting and EEE discovery
Date: Thu, 22 Oct 2026 17:33:07 +0800
Message-Id: <20261022-net-phy-aqr113c-fix-pma-capability-v4-0-95a17f75dd7a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFPY2WoC/42Oy47CMAxFfwVlPUZ2UtpmVvMfiEWSpjQj+iAJF
 RXqv5MWCc1ikLqxdGXfc/xgwXpnA/vePZi3owuu71LIvnbMNKo7W3BVyowjz1FSAZ2NMDQTqKs
 nEgZqd4ehVWDUoLS7uDhBVVRYGm1kWUiWQIO36WqVHNnS7+w9stNrE27615q4OJbbxoXY+2n9Z
 6S18VJzsUU9EhBkshAHKQhrzH/6EPbXm7qYvm33aazekf8lZ5vIPJG51JjzUmisxQeyeJMJKd9
 EFoCAWmvSZYbiUP1Dnuf5CViVA/erAQAA
X-Change-ID: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792661591; l=2456;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=imazqWx1QzR1C8tFiACB+D5otXOIrb2gIqpGREoOoO4=;
 b=4pPpvTK3vdoAgWVvXy+AxSVSsbQm7kQUvaBE4Tin/iXlWnKDDW/ZF9CDskq1SS4r2CMJsf6Gp
 Z2ART9Ai0B6Bvn41Ir2VEaoBkEpDCdt+xLQk0RwxfdLo07yiA79YVqJ
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXy5fUTXM5NGOV
 kvt74IOe51gEtqI+MfN43tOc3vzbIhikrpOs+a/jaacN0u3VXTvZwt1WUbgn2cDS8HgRy7hvFO9
 i3zuJAUWMTW4eMlUt+A9wopE4nWn6wI=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9d85b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PHq6YzTAAAAA:8
 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=LtJoxy8KcpIoDjkYT3AA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=ZKzU8r6zoKMcqsNulkmm:22 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-GUID: iQaATsVDeNsFypJnX2RP1JsAxM2Debe5
X-Proofpoint-ORIG-GUID: iQaATsVDeNsFypJnX2RP1JsAxM2Debe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXzfo6b+vvTVKV
 85+6TurqxlzIjBd6zJ2mQ4bh8h2gtepo/eK1hMe4vHT/7eHKsMgMBo/taLUtkoJ/Yx8/YzA2lqa
 5oTL2yI/j1J8VItQUeFOyiKx/gchvjaLDj6C6OQPOGJMcZ5LOvzzbCmLWPEtLe2f+3PlfOvij+F
 U2B7Q1KYcisleu+tTCmO65qnoI4maZqSnoJeLn8+2/FfYoMI8YAPeeKm304qHdj5t7c62ey2XtB
 eAthIim0ZL4Z/hHxqFlf1I8971X8v6IJxP5sf5WT2smPqY4Rfbj2zZnr8w2nMNpLx/3lY1pfYuf
 ZIysDR2WObh60fqYuD4PNoST4phoJpwa5OCVnQ3G3mhvYG26e/ireozmqGmwSn1wMnD5NSJcJ5M
 XP3KIaweb68117larrDE9hG19dGIaH2Mzs3un8IvjuvEP1yiiddY5Em6IBKCZu7XQB7F5ob/s7v
 3UY+0Uxaq3ustR1h5yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

This series fixes two related issues in the Aquantia PHY driver:
- Patch 1 restores EEE discovery for AQR111, AQR111B0, AQR114C,
  AQR115, AQR115C and AQCS109 by calling genphy_c45_read_eee_abilities()
  after the final supported mask is built. The phy_gbit_features base is
  preserved because these PHYs misreport PMA capabilities.
- Patch 2 adds get_features() for AQR113C to correctly declare 10G/5G/
  2.5G/1G support, since the PHY misreports these speeds in PMA extended
  abilities registers.

---
Changes in v4:
- Fix the comments from netdev-bot+sashiko
- Patch 1: keep phy_gbit_features base instead of genphy_c45_pma_read_abilities();
  call genphy_c45_read_eee_abilities() explicitly after supported mask is built
- Patch 1: update commit message to accurately describe the fix; add missing
  affected PHYs (AQR111B0, AQR115, AQCS109); add Fixes: tags
- Patch 2: fix commit message PMA reads still used as base and add Fixes: tag
- Link to v3: https://patch.msgid.link/20261016-net-phy-aqr113c-fix-pma-capability-v3-0-0bbb1b84035d@oss.qualcomm.com

Changes in v3:
- Add patch 1 to fix EEE discovery regression in aqr115c_get_features()
  affecting AQR111, AQR114C and AQR115C
- Extend commit message to note AQR113 may have the same PMA issue
- Link to v2: https://patch.msgid.link/20260924-net-phy-aqr113c-fix-pma-capability-v2-1-29b06283b0f3@oss.qualcomm.com

Changes in v2:
- Fix subject prefix to [PATCH net-next]
- Limit scope to AQR113C only as AQR113 not tested
- Link to v1: https://patch.msgid.link/20260923-net-phy-aqr113c-fix-pma-capability-v1-1-497359310f06@oss.qualcomm.com

To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Hongmei Xu (2):
      net: phy: aquantia: restore EEE discovery in get_features callbacks
      net: phy: aquantia: add get_features() for AQR113C

 drivers/net/phy/aquantia/aquantia_main.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)
---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

