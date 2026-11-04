Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786363;
	b=0r6ifCY6aaMZjfivMAaEhtIVHUhiK/kLQOD3DrMIUV0JEODxdTqrrkHmRHOOU4Sl4m+s
	 A9aQ0vpVZXXgtFI2GJXVq8Et4Eo4HxG6XcbqsMf4W03bIOcrDNIWoqiYCYk7vPL4Cemxy
	 JXGV8/O9kFUrbgiS8+TF+kI/imJNPfki/L/oRUp+XCVBt7D0fqB+K9H4iryaq/tCwTz0I
	 yJ4ucshZDKj+BK17G56inJb5JUsmq8DkfAM0yJTtW53u0lBVXZaibatX6uSYgePZIqDVW
	 Eritmfxjka1MQuKYblq8KTy9tO5M7TVXxohp8m2RlPWZOfliUCGjn6P5VgZovkVDfVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m0CAASAh7xboF2KspuriCe8il+sD1k7gvlGbG6tgI8U=;
	b=TDoh9dCFJsDEYp1r18Ornm6lJ3NXPdMIfcTxj+s9gSddZJ+MNGnkE9AB72aIwALQYmOl
	 XrwlKz14/pDeJJrbrOFuB+ZjcYHGXBx8cCx5uVcpu+7gGH5RibvXpgnujjqpbNDL6ZF7j
	 ryzTjnLuaoe6JyJPTy5iFfQ6+7B9bsqtqAMnAlnTejmX5NrP1FZz0e8jSFNWcb9gCtMEc
	 FTqubDw4kkwVw29FXTyCoAdaT80ZdoF0pj+QiXEM5FOcm/slxqDWCHpKxqaQ14b0NkDVf
	 Vn/CosCnYakyWmC/62I32DcuE+xyb+iKXPwfQHyOdsoDEMWQRJ/MYXcFyQdxJhlsMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IB4wrU+q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BchkU0IP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IB4wrU+q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BchkU0IP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kkhm1229321
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m0CAASAh7xboF2KspuriCe
	8il+sD1k7gvlGbG6tgI8U=; b=IB4wrU+q16J0OtnsRGRk+JRbxkn3/BryCxi5ph
	MokYwr5dTt11p9Wws9eZ1atT86LPOJ01snBWJWb3Taj2iHfAQh6n+JaRAh5kyF30
	2l1NeWq+vOjXPF2Pw7QqLirx60/tm2yEc17iFpDM0fFrnq5X5euAzo8FEqSK/OV7
	OAkVyJFNu6zZ9pE8gFmUCwFg3d6+M1MKO3ceAmbaDncAfi+VonC2RsQTDFXx/A22
	l8ncrUmnvKaH4zqW2PYXXu0IIhrbaHbO2jE8i2lsdZd1NbJP/SUYQpdcenwiI0gw
	Vrr4AgeRpbjnQb6h5sSCZszWb6KTPnP/TFC33SRqGyca5bmg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nk7v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1042707eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793786362; x=1794391162; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m0CAASAh7xboF2KspuriCe8il+sD1k7gvlGbG6tgI8U=;
        b=BchkU0IPR6dyfCVjikGQR/KTdQXxRa8tagyfSwP33I6hQa4alulSYksmVXUTDG6XHb
         eR02aY6qnW+DRTN+J20tYexfeJhXageswXl9QBeeW9OBNIzuykqyqV91TdKPheP9/y0R
         rsh+QLgb988RanTSLFxSh/oF449QWrzxEG9HZHAu2AZqHwyA98Z9++tLO/Xc5Un+wb+L
         cm4UtLHLkUBuA+kpEl/JGUUo4Z05k1ERHDbbNwDjcU2429H26uDHdJpFz8bnBa8J5pba
         szprRhJ77wXMcth7eOg0e7pfPrA/lb4tNP98ZhP+ydfdRpEpFrfNfdyxt6LNOMvsZgNh
         U2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786362; x=1794391162;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m0CAASAh7xboF2KspuriCe8il+sD1k7gvlGbG6tgI8U=;
        b=mI6yEztj4KFEgQ78IuuYp92d4xVRFwtHGVL5cCAXFdFSx4hi/Zy6JtMsGDQj4KjWiZ
         /MQkfBU/AV94j0wxSF7lmvg9zNXixpftPIus9/Hwjc8qOajRhvduIB8hljoEcknDO2vt
         HJ+pFEViLvXUUtRsZjJQK1PjxzUARRGqXXIFC8H6I7WWlBDAMIGfe0yCt/b8auJPvEVv
         4uZFmObBBbvrhJrCzMYib2M3aiq69Rc4FO7GSmi8DyfiRnnUD24O+XK4W+JBF7Tvua12
         e6jUq3Ha/qLQVn0zciUpRm+krspHhFyJaSZlT6aBZoY6l3zlNeLAfvEHrMnonzE7O9Fg
         K6uw==
X-Forwarded-Encrypted: i=1; AKwUvBz04HJWoParQ/z4Ng0kyCgYmfwLsy8b+L/1kqxYLGlazxeEKL4JgwZCaGXcwJqGEF1prPrPuuJrq305Q2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4nPwD/NcxJeynP1miTnUTeCM55SycxZ2r4tBYhHSX8RV91zVc
	bfDB/ZEaLEjJyECaNPp1b+E4J7aK3oSLOWzTwA4GJl8ztRpFGGoqBdUderwzvlg3FA5sES/b7Wr
	IpeaYoGjG4WrToIUQGBZfzHTvV+gVisTOzsYy7NxemWjtn8yuTsgp5wzcL+7gMrIwlEQ/de21kh
	c=
X-Gm-Gg: AYBFou2/A40QuO/g7R6ylhIYzwnfvGPtHa4aT6MuGYnPKMPmB7jkOpryOYXVw/AJZNh
	IKzkIYd63SwWEaDgN8RTb9AE7YM23Ui0c7UJfdb7JRHSbRLwkpZGmzuECGCGJ7XDxsMMLRAslhQ
	8LuDxpP70AkzKgGUmG3GLUBB8NGkIKCp7tMdDogA19b69+Nllph7Mt4VRBXWyeGgyY2BfX2UZRH
	MwtTPlpKJ69JlInWYY3myLH98mVho+tbvIG2VTIBfUYveIbKY6cPH4aZWSBh/ki46cjg0/S2UcF
	yy1TwVKPwt7sQvUpiliBQBR/PErewP1CnleYPh2si1AI82AMel9Jqi5k8ltCbthRqTsjbDyrW2/
	UgqSN3dEq1TbEP+EP+6Uklo8/N8Cuq6MM6Nug998ZDNlpAxuwHhE9YcNfhfWfnfP64rul1+iY7u
	E69++VJ9f9/yiw29JPhBWzYYw4C6tquDAk
X-Received: by 2002:a05:7300:d511:b0:36a:373f:6e29 with SMTP id 5a478bee46e88-36a423312f0mr29396935eec.13.1793786361361;
        Wed, 04 Nov 2026 01:59:21 -0800 (PST)
X-Received: by 2002:a05:7300:d511:b0:36a:373f:6e29 with SMTP id 5a478bee46e88-36a423312f0mr29396893eec.13.1793786360771;
        Wed, 04 Nov 2026 01:59:20 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm7391240eec.2.2026.11.04.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:59:20 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 17:59:13 +0800
Subject: [PATCH net-next v6] net: phy: aquantia: add get_features() for
 AQR113C
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
Message-Id: <20261104-net-phy-aqr113c-fix-pma-capability-v6-1-d6d4718e45e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPAB62oC/43QzYqDMBAH8FcpOe+UTGKM2dO+x7KHfLlmqR81V
 irFd2+0UDys4CUwZOb3H+ZBou+Dj+Tz9CC9H0MMbZOK/ONEbKWbXw/BpZowynKqUELjB+iqCfS
 1R+QWynCHrtZgdadNuIRhAicdLayxqpCKJKjrfepaQ77JMt/4+0B+Xj/xZv68HZaMpbcKcWj7a
 d1nxHXiFc34kegRASFTkgvFkZY0/2pjPF9v+mLbuj6nZ80d2VbODsksyUwZmrOCG1ryHZm/ZaS
 YH5I5UKDGGDRFRrlwO3K2kRk7JGdJVkKjLKVwTuodWWxldUgW6RpeSK+MQizsfzvP8/wE3SNf9
 18CAAA=
X-Change-ID: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793786358; l=4509;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=bVV3+zb4hqFcNONDR0JkkTT0JZMeNYXAfLVZW3YrewE=;
 b=RhFzbV35USgUSXJqRmwYRJgboU138X1PN81911FB5C9b/tQm1rbhmqj0YSmzLhfVQ93xCAd0D
 ow/dT5SBa5JDOZy6LX7YaUzF+Jl6w7tvbXbWG9geq/TSc+GBgA1Z0Xt
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfX6j8EgmfsSyLE
 8t0HJ3DndV0QNso7wUK2/NxrdEQuoD4iEUAmXW4eG9Loe+pLA7/IszcwNfKh7yQpt2owVpI0MLx
 j46qCNmQZl++N9rmAxRBg4a6t7YvjDvsZPLUsCKzKpd3qAdOyiX9scxk9jtMEQQiqnCb+AhVNv1
 5ZtH+u77k43LAyPMKIr3U93cplw/1fNhCA7YOLJfDymyP8PUAyhpEbth1IdTE2TriOPuBtKRDgR
 HVRz2LXgqj++YQ3cL67C6sSnIu8i3WentsdjZybdHnHeFOgjcEfRP3mZMpCJUUWr0SDe0FyXgfE
 YL/Unt/65oaWR72rdLtf72GkAe1sbGUU5BX4VC14vnWUO4kBGVR5G3hS75zHDBVX53Hrpcqw5JK
 SJJGb4WfOTFG0PimLmRnb3OPEXITd8D69mcfIvVA/3vox85pEjKsg5NFig9dwd/UTeUeaIzoBxI
 1FYbfExrhIyCeTtMM2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfX9SYE5pKzI6hU
 Rn87SyR0snlvJPRGQV6mYKeayg/1hVVMOe4bQFlz78qToQ2+GJKn4QAQBK4TwEpLGHLdZai0E4y
 6oVMucJ5eErmruoYZz9PN+YZslrHhzQ=
X-Proofpoint-GUID: DN4WY6C5xWy_uGwM_8kiuo_ADTb57qoh
X-Proofpoint-ORIG-GUID: DN4WY6C5xWy_uGwM_8kiuo_ADTb57qoh
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb01fa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PHq6YzTAAAAA:8
 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=AFLgWDODZm6VlcZumOgA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=ZKzU8r6zoKMcqsNulkmm:22 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040039

AQR113C does not correctly report its supported speeds in the PMA
extended abilities registers. Without a get_features callback,
phy_probe() uses genphy_c45_pma_read_abilities() directly, which
produces an incorrect supported mask.

Add aqr113c_get_features() that calls aqr111_get_features() as a base
(which uses phy_gbit_features as base and forces 2.5G/5G that the PHY
misreports) and sets 10000baseT_Full explicitly since the PHY also
misreports 10G.

The AQR113 likely has the same issue since it is a closely related
variant, but this fix is limited to AQR113C as that is the only
hardware available for testing.

Fixes: 12cf1b89a668 ("net: phy: Add support for AQR113C EPHY")

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Changes in v6:
- Repost after net-next reopened; no code changes from v5
- Link to v5: https://patch.msgid.link/20261029-net-phy-aqr113c-fix-pma-capability-v5-1-e57e9b9118cd@oss.qualcomm.com

Changes in v5:
- Drop patch 1; EEE discovery for AQR115C/AQR111/AQR114C is a separate
  concern which is not related to this series
- Fix the comments from Sashiko: call genphy_c45_read_eee_abilities() 
  in aqr113c_get_features() after the full supported mask is built;
  do not return EEE read result from get_features(), EEE read failure
  should not fail phy_probe()
- Link to v4: https://patch.msgid.link/20261022-net-phy-aqr113c-fix-pma-capability-v4-0-95a17f75dd7a@oss.qualcomm.com

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
 drivers/net/phy/aquantia/aquantia_main.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..e963ee60e27b 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -1094,6 +1094,24 @@ static int aqr111_get_features(struct phy_device *phydev)
 	return 0;
 }
 
+static int aqr113c_get_features(struct phy_device *phydev)
+{
+	/* AQR113C does not correctly report 10G in PMA extended abilities.
+	 * Build on aqr111_get_features() for 5G/2.5G and add 10G explicitly.
+	 */
+	int ret;
+
+	ret = aqr111_get_features(phydev);
+	if (ret)
+		return ret;
+
+	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
+			 phydev->supported);
+
+	genphy_c45_read_eee_abilities(phydev);
+	return 0;
+}
+
 static int aqr_gen4_config_init(struct phy_device *phydev)
 {
 	struct aqr107_priv *priv = phydev->priv;
@@ -1444,6 +1462,7 @@ static struct phy_driver aqr_driver[] = {
 	.get_sset_count = aqr107_get_sset_count,
 	.get_strings    = aqr107_get_strings,
 	.get_stats      = aqr107_get_stats,
+	.get_features   = aqr113c_get_features,
 	.link_change_notify = aqr107_link_change_notify,
 	.led_brightness_set = aqr_phy_led_brightness_set,
 	.led_hw_is_supported = aqr_phy_led_hw_is_supported,

---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

