Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094FF25B09D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128959; cv=none; b=ixKTktBVCpw0eUPpHJwA46SU+U8vtTkUysG6B41UyX3Ja5M+I9/LiEr0JWnalCQ2DfqhJEXnOIGj2k8hpt66N7QXwWsyURRrHYNhEQqWT2wR/Uai0VGnS/4VFRZNW6/6t2Sind3G55kTj776AQLrTb9XnW+rR0wTcJzwfAMSyhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128959; c=relaxed/simple;
	bh=yR52cI+W3yCIKULKBSOSPmSo+h756iq8LAJZ8BdAlIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c7KxaBVpJc+cS+nfrcsHyugbLFb1TkQAnESJJhaKZRCY+4x1M9pUjvgougW2hCCbWgbncNnTFA1jd2PlNIReZD+d+FHtJjAEG4smQ7TcXHvBNzQmExAszUHqcAyaznggbcFcgk+LDTlJplI0kpA8RI/qIr3n7GKGEGD8D2XIHGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7usJ9CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfJBE2so; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7usJ9CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfJBE2so"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBk4H3897623
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zpzd2/MiJRtpjQ4xf1ctxa
	s8MJd59+RoSaXAKWCLA50=; b=T7usJ9CJOaz+Ue9qyIncfLdWpDpVKsZ+ZxFh0G
	Aic3nu0e2N/2uIZISsIuU2nQdREA998J4O2Irzg/4eWZAhdt6UQ1a4gDSiJmgH4X
	tH3Twg/M4SkZBzJtPXXVxcoW2NxMPlIc1ZckxBId0yVYj5vJ3FUt63/naxu8x3C4
	jHkdm6TjX1ZEO11O3I1VZNSJtkqeBRluanL/4REWFNsBq/QGdnhGH8eZzUUvrfmV
	mcY3FZToSy16bHIQYE2v/JE8KtgC98O/rPx+n+HHbol4fdjL957ldzhqaR3SWQJJ
	uA0le46WuLs0lGrIIG+8Yupwx8ZJ5iCcrIeEhubZFjWjJ/rw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1g04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:02:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3282d5302ffso441048eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790128955; x=1790733755; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zpzd2/MiJRtpjQ4xf1ctxas8MJd59+RoSaXAKWCLA50=;
        b=WfJBE2soU5aF3/eZKKIocmeFxOeVB0n/ZsJtKIhVQ0eoGYx5QPwjcDaI/a7w0HkPax
         Y8eWgrpM0+K0eYqCcu39j3inwW/M9p0+5t7+Yf1jf9L2ydoykniKHigRZklszjVROwTr
         WlutDPhIthsnNL29rmrYGZe4NPRHbxGCtk05sgWyrMYv9LtMBviEXcs/y4ccm/JOWpqr
         ksaKvrbynRuuEZj2GaBNJFvXxrFxpvVe4+ygaKCOcNXKjvv1Tta40ue12e0+R8spmzul
         bmPFioPdTKB6DrLCc4kyoXhGXCKa2JXKJLwsrW67vLYQaZxoYmY/5lTQMk3YKkbUZ30x
         Gb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128955; x=1790733755;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zpzd2/MiJRtpjQ4xf1ctxas8MJd59+RoSaXAKWCLA50=;
        b=lVf5fhxT8ukWsQ0YKsDLrdrEZpcC9fQvIDKJTnxYSzebC2yMQj1lqUnbAJhMrCYmzO
         wouoX31e2B0UJSxGlbdr1MKMslf4tmPYWffj12rKQW4jickVxEhi000NCAfFrxy5MIS5
         h+nK5RGpe7YKylUCM2yCeDPTvkVzGCk/uLdM7UoWq5ezfuhB8KeKp39ahUqRHAlJtSmS
         qbU2Rjt6EyUCIRI7L+G84EHBWOAn7VcKGCXl/Wpl/fuh4ifFOPbY/oQmzyR0XCg24rj2
         fY11LdBAwBjfuG4X3mGP2qSQeKKko89SS0FJcOaO+lTaQwtWissyDYectrtI0yS8N5wC
         LkBA==
X-Forwarded-Encrypted: i=1; AKwUvBwJWVtNQ39W3gX27pLrw4JfB3lYV5CJyt4sdxn0UqauDTfCD/fNySy/zlOLeyUl6JOPZtvaQp4WsA1L/cg=@vger.kernel.org
X-Gm-Message-State: AFuF++m7XcCXTwNdPKAkeyONHOO9uphDEllgxYBjKACsadFjRhUBIFMv
	n7Os7YvE2OQhzhpWefLcRr2HO44o5WuWJDpfqXZoy7csx+4EUzPL4Y05Xv7qImaBhizTsLsov6q
	iOIreYLKwOsau5gK51YbFfmnmTMhnUbRqq6M/CkWajqtkwQi8HhCLrs70bQ9ce/AjdcA=
X-Gm-Gg: AYBFou1wYNEY4yDzd9No8BYGWsOvOZRVs7PVCPuoUlqn4RxRiamko+AiDdhMH7CTvGE
	NrV1pueOwtWXd69Cv1tokyQaBXheGCRnGCIOHxegMQOrj8eXEK8rKIep+qAy1lIAmNQAZ9ecw1n
	n8mBBziDW7wY/qxx47jHh73fmjdA0ExQR/ZuHAtuv61nrK3YyF8V5ufhlFr9/o7kcuwaDHdkm2K
	tl6JH1SxhNs8DZ7lmi4AIwDAfvvpm6C8N5/yXkHE3SDEMT4JKR79jqDXWQ0n6j1eALh75vbV7uG
	m/HQlEQOFGJK84yYzDI5s/DZCzhqml8Ux061v+xRKJgca3Fyew4JL/s57t5vcdAKtKt5HMXkA9S
	qC3/3+Oig8VKNQwUOoYItGjnxbietP6cy/bPB2kF8qnwyDZJw7lX/yltpuzA=
X-Received: by 2002:a05:693c:8005:b0:33c:3994:60d7 with SMTP id 5a478bee46e88-33e5cad2586mr1415918eec.20.1790128955262;
        Tue, 22 Sep 2026 19:02:35 -0700 (PDT)
X-Received: by 2002:a05:693c:8005:b0:33c:3994:60d7 with SMTP id 5a478bee46e88-33e5cad2586mr1415885eec.20.1790128954656;
        Tue, 22 Sep 2026 19:02:34 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e97236754sm1745366eec.29.2026.09.22.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:02:34 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:02:29 +0800
Subject: [PATCH] net: phy: aquantia: AQR113c fix up PMA capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-net-phy-aqr113c-fix-pma-capability-v1-1-497359310f06@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADQzs2oC/yXNQQrCMBCF4auUWTuQVGgaryIuksloRzTGJIql9
 O6Nuvzg8b8FCmfhAodugcxvKfKIDXrXAU0uXhglNEOv+kFZbTByxTTN6J5Z6z3hWT6Y7g7JJef
 lJnXGYIIayZMdjYUWSpnb6ndyPP1dXv7KVL9lWNcNuUo6tYYAAAA=
X-Change-ID: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790128951; l=1712;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=yR52cI+W3yCIKULKBSOSPmSo+h756iq8LAJZ8BdAlIA=;
 b=MY8iws+HYRWUzveGEpO22VbtMy+gFLK3dVi7fTQ0dpWI+9WSK9LqJYHU5K3VxOkvVRqmzWkKK
 lRz1BQOolyyAwlN/PFDCJI/6bv429bsWOksqTcPr5T6LngzilTyVrsw
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-ORIG-GUID: vNOpszXnfHsohTCzH4Y9-edAtlenpbYe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX/RX/IpLGNAlU
 KvfRAB8fRsaRCX3ubBOWNnuKEx+6tltG+fkr2v4bflEd6hX1OvTEhHeCCEVTO7QeLaa2qA6agrg
 /zvyjuoUMlKmJUiTTRUf1uUPkpEViNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX/kHaGHAXcfHM
 uB0BWxHwNzeGTsC8q2/t+oktseWrX+cXY1QnjiYki3jVudCCQVj14Mo+gz8G26HaPn6dmm35e7H
 DrmuEo/6vPwCqeKNoIM8oQdYD+Dvpo67qViUDAgi5wPRyR6ThHpqklrH7+qhcfUQvDqpEhA5q9R
 jVd6E3ffY+g80YUVBS3dRtsVrj4ISe0LMxrdTehz0kEIk59f1F6KPVH/7XiHXoAcbtcKDm9iHom
 AvmMCDr/fD1Md7PWUm9Xg8smgfxFl9giMa80xlRNtge7T5wOGYx1N/SezD1h6wsJMsP8RzcEfLi
 goQz1VVmB3/jto3rZpk2PItWMpoOPeRdmuUxPIZZYrJg5ClAu69HOOPIMozDi4siSZvs1ATVbD5
 xtR1wd/2CvL9hbJkZ8+oHhfo8bITstgM4pscRjE/MPhkA8BDJ+WYsjwPdLevnMj8TRzm+btZA7k
 0WA6kA2LCaQE9XtPIlw==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3333c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ifKEyN3FPcZ-MFGMvG8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: vNOpszXnfHsohTCzH4Y9-edAtlenpbYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230007

AQR113c does not report few of the supported PMA
capabilities which includes speeds like 10G/5G/2.5G,
add get features support within aquantia driver to fix
the same.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..604f5492515d 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -1094,6 +1094,18 @@ static int aqr111_get_features(struct phy_device *phydev)
 	return 0;
 }
 
+static int aqr113c_get_features(struct phy_device *phydev)
+{
+	/* Generic C45 PMA abilities do not fully describe the PHY's copper
+	 * autonegotiation modes, so add the 10G mode explicitly.
+	 */
+	aqr111_get_features(phydev);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
+			 phydev->supported);
+
+	return 0;
+}
+
 static int aqr_gen4_config_init(struct phy_device *phydev)
 {
 	struct aqr107_priv *priv = phydev->priv;
@@ -1444,6 +1456,7 @@ static struct phy_driver aqr_driver[] = {
 	.get_sset_count = aqr107_get_sset_count,
 	.get_strings    = aqr107_get_strings,
 	.get_stats      = aqr107_get_stats,
+	.get_features   = aqr113c_get_features,
 	.link_change_notify = aqr107_link_change_notify,
 	.led_brightness_set = aqr_phy_led_brightness_set,
 	.led_hw_is_supported = aqr_phy_led_hw_is_supported,

---
base-commit: 063510768490d85454a99b27be303aad5efdf624
change-id: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

