Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661600;
	b=v/JxgpmFriAUgkWfOP5pdhKSuAPrPWEDGSLSh5a0vuD7OVOEQl9h06x6JErqlyl0lLJV
	 o8WtOdE6dK8EqquRh3PFID21VmgunBKhEHKwtCf7E/tDDkMVtoHNCys3YDxuoQDlSF7MN
	 Lf+pAtibaWR4XbwSrS+hjGjIENodj6r8kC0hRw0IIbh1KFfGqAdnU8tavo8GywTPKE7Xf
	 5ptATn8KGtsSoGPN53fBYL77iqpFTKmO4TRoV9d9usr5L1Jni1anvb1nn/HEeKPMbxdsk
	 soMvht28qY7whgibayYaf7W5HkXSmiYPnk6J2ZW4Lw/HmmJhJRKNC41vwx6XgtjHHdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=it/icbLfuO7zXriCFppfnrdl0soBaT5iCjZVgkzuDBc=;
	b=BuzxrcyrFr0rjmuSF0JtdrhTsOOx1zKP/SAKE8S5HsNPjv/2ha2Af/qsB7KOAvuRBPFF
	 Cw9M0lYbKvK8VTkAGccOj+u562ZoZz4abaPTroAhbJaWXwYeO/03l7m8JDfmCTRY9R46j
	 WlmTEhPlXaHI4E/+wdC0uVU3o0L1ecEnJYTDImiE//FbuWP1E+gnSTw/B7Re57IVGVwzg
	 Jok6RMPo4npFlfmyYngRnaAMQeRvxfuP1lgeAzTi8ml2AUkdS6P0jyStSN+5KdNFrdWgN
	 LFtb/v4fkJXonN9MGrEn1snRSaUZAMNnZeZhrossl816DXJYTPFcd+qs9qgoPd5RnSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2UWOBNV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hR5TD3Hk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFF606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAFF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2UWOBNV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hR5TD3Hk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701Aw2714299
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	it/icbLfuO7zXriCFppfnrdl0soBaT5iCjZVgkzuDBc=; b=Z2UWOBNVKgkBTWvI
	1kRnqRU/Ndr0LmFB/OvodU9B5ZDAG509yDDtzwlorCEqwj2uTu15jZPTD4eMVWJL
	Jm2v8EXSiKRuvSB7fQUkJWEOvMlYiDPUYhBJ4UV/G14Z3LeqWI2nyWvW6HRU3nV+
	RTXYdFQunMfmlShUjeWWk5+dh1b+2/pFDSTV82vfOhY6Wn5WlPBoRzUvTrZ3uDun
	czHKrVoMTPKBQYkarrBEklSAKyC+6VtpKzoa5DsfkZ/CsRX/68jREOMJzg1NB4Ps
	MwafJp9m1DCNuJzWLZIcKHVUfdgoXzMG/A/CmZ7EWiGzgqsueamXx1pBlMOYCDRu
	17ggNw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bspj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso2971755c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661598; x=1793266398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it/icbLfuO7zXriCFppfnrdl0soBaT5iCjZVgkzuDBc=;
        b=hR5TD3HkWMvhhDjMr81hpJDXkiGYneb2M/pp+3+rwKZuyePadDiuMmLKeMNF6ybjGr
         ePJAC+fF+M7eNTw9t/JNd4sa2hxrEumxZFS+D0WabBf/2TMxh+7cDnDS8x6f0kaMWu6A
         6DB+GmT3zbgiI+7F2pwIMJOggIMpZIVPJWN4cyOBiiTBdooW8S5NXjmjDdTf6+BEoqQy
         /66o8e4wi8TqNo+/1LjDY3IBCkjIGhQgUcwH/LkvvnbJ7dsWk+lelkdffW88XUohqBRr
         K2S98mLHf4Gwi6y3MuisFMGcS3O6uQKm+mh3evNqoFWvsAM6FWZpgD9NncliCRXbnnD7
         WF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661598; x=1793266398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it/icbLfuO7zXriCFppfnrdl0soBaT5iCjZVgkzuDBc=;
        b=Ud9CWAndcGcdwliE2hGRn7pI3MHhF9YoqXQDOwwZJgQj8gX5WHqKiJWEmJkyMbkthM
         rD8hTd9AfCvYjw15frh1zMJxMXk6ftQRrvxiqMyDAHELBr1XmBYOMuX5EzFcwtjOnruQ
         mAKzBf6LJ80kLagPVfoYAZ4yl3ymTr+CmiTOSQQfaqD/frExNMtN4xYZLgFSDgGGJSct
         uKBno0t2/MNrKjmyC8i/IuQKZmeKsBSKTRhHXSdoW5JPw434DQhWwLg9p+I4EWHo16ic
         eTQHaeSswKyz5n3j4LoJAyI2xlDjRh1FTe4V1Oh7Jq7YQNJa7nJRt6Lig7TfxOQbulqs
         pD5A==
X-Forwarded-Encrypted: i=1; AKwUvBzzdSsOu+f5hFKvqoRZYSIMS+TYDwVEX6xvmI5aBEJ83wgh3kHX5YuU4UznCsyj9tLVWz8MkXAD88FaPOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy6CGOv40W7gd996r4TXqtuOEm83JvcG7hcd1PDaCiT1K3kxep
	wZYGNROdKBpakrg5rUWPCeshVrRw2Np9wF59aR0FHUqqSZVRS54358Uj/snIWFYvuSInpPXnPvs
	5mloYJeArLETDzEZB/0C0rKIN8tq306GPkaYkrllpsqyYySp3sW2i84EFOZXFffJzAKI=
X-Gm-Gg: AYBFou1J3v2LaZmZTlk959P7ewfzYt6ivFB9svuCUGjSzgnzmDbqacg2WYo3oVt6ThR
	lNtZvBR6VXxlI6oIGjISklhW2ykqLs6bQXWNZlW1v/B+8yv81vRj3vguERAfC77s2wYVZ6n2xD9
	5cc2gR87j3ArvBy77ibX0wi7eHegEeX3pMP+mOy2CUVKmro2cZVMbfL2OdT0YYEXmFjdnsvOSUs
	Ysd4LOi3N0H10pDcKXJvfxtEqBnDCTQP74kEAjvMdmmOO2Mm+YR3/76BoN119M/i5frX6Ec20bB
	vT3o2HxhQ9EsoPlVCzr7p2ozH3dgCLCMFO2uJjWGVUdWkPF3ShuXcTLgt7fwJigLGWdCPk6qQJk
	rhwREhB/ogvs7KnmL0qN7TXAnD6oLrjtqB4m8JaxzW5JA5Jn57SLmR3xA+Ck=
X-Received: by 2002:a05:7023:907:b0:184:992:c9ec with SMTP id a92af1059eb24-190a6eb59efmr6039504c88.38.1792661597590;
        Thu, 22 Oct 2026 02:33:17 -0700 (PDT)
X-Received: by 2002:a05:7023:907:b0:184:992:c9ec with SMTP id a92af1059eb24-190a6eb59efmr6039476c88.38.1792661596987;
        Thu, 22 Oct 2026 02:33:16 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm25904494eec.2.2026.10.22.02.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:33:16 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:33:08 +0800
Subject: [PATCH net-next v4 1/2] net: phy: aquantia: restore EEE discovery
 in get_features callbacks
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
Message-Id: <20261022-net-phy-aqr113c-fix-pma-capability-v4-1-95a17f75dd7a@oss.qualcomm.com>
References: <20261022-net-phy-aqr113c-fix-pma-capability-v4-0-95a17f75dd7a@oss.qualcomm.com>
In-Reply-To: <20261022-net-phy-aqr113c-fix-pma-capability-v4-0-95a17f75dd7a@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792661591; l=2347;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=metYIqaXeyP43pnJ0wLjM99u+BeRf05eZ9uzQ0wdxpM=;
 b=YO7QeiFzRlKNfsw1jWiZHldtFnLd4IhgxZlWvygOT1kRqrKPXyC+cRAhaz742iPwVDDBM7lRD
 JVfjm0g2GK9B9ir/N31WdG1YtsHpynaRMb195YbMlI6YRdSCeGyE6qw
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-GUID: _HDz3A8VmR5gOn51LqouDZLsnVgrypkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX8CxpC5XnTSOV
 XS0nVHYP8XHSVgg4hLd1XJB3IAFii+54a4rUAXuYxHIS3wGVeVF+lDbr2TRAH/QIgNuvEyqxZrY
 64qqP8bPKQti8QVUKAsGRg3SISrMoMjwjBv0SphkMkdLzJWHA6B8YUDAqb5GSIs5nG1ch9Hl2DZ
 rqohOZPFiWqiwiyIvoVZkL0OzuJh/bDLEbebxxlg420in+kEAct7tyWnS70uTGoa4OgcR2xoTmQ
 8PbQ/TWf/1xO89k7ZS6/v1e/EajTFVlD22AitUreSTLU78SawL9ugq2JepXZLFMBDkisT9Qt21Y
 tuJSv4dq9HfQHK1IZ8Y9qphcskNsGVkDoINeUNjCYymbZbXU5aVex+X3kKF8F08ZWHVaVrQNUG7
 4L9K+tu+jg4z8m+ajpFwwHpMVCUrEd66wfXU5J/lTSs9LhjMR59u31wtj3n33l4TzOxrbz2+RUt
 02PKxSUze2BPreT4pzA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d85e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dClg1jYS9o94HfY0LlEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/B0GuvN+Htgy
 KErcT3jFc4DDo5mZdC7Q6mCINWSph3pGSfDA05wrl3lmPNAo07O5FM8JdSoWyndwrIQ4cXVfo11
 pUONbDlzuydrX3LhtGpaKl0L9BLuxuI=
X-Proofpoint-ORIG-GUID: _HDz3A8VmR5gOn51LqouDZLsnVgrypkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

aqr115c_get_features() populates phydev->supported by ORing in
phy_gbit_features and setting the 2.5G bit directly. This skips
genphy_c45_read_eee_abilities(), which fills phydev->supported_eee.

As a result, phy_probe() never populates supported_eee for AQR111,
AQR111B0, AQR114C, AQR115, AQCS109 and AQR115C. The kernel then
clears advertising_eee:

  linkmode_and(phydev->advertising_eee, phydev->supported_eee,
               phydev->advertising_eee);

This means EEE advertisement registers cannot be changed via ethtool
and ethtool --show-eee reports no supported modes.

genphy_c45_pma_read_abilities() is not used to build the supported mask
because these PHYs misreport PMA capabilities. The supported and
advertised link modes are intentionally unchanged; only EEE discovery
is restored.

Fix this by calling genphy_c45_read_eee_abilities() at the end of
aqr115c_get_features(), after the final supported mask is built so that
2500baseT_Full is already set when the EEE cap2 register is read.

Also fix aqr111_get_features() to propagate the return value of
aqr115c_get_features().

Fixes: 17cbfcdd85f6 ("net: phy: aquantia: AQR115c fix up PMA capabilities")
Fixes: 8f61d73306c6 ("net: phy: aquantia: remove usage of phy_set_max_speed")
Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..099ee919de94 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -1079,15 +1079,17 @@ static int aqr115c_get_features(struct phy_device *phydev)
 	linkmode_or(supported, supported, phy_gbit_features);
 	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
 
-	return 0;
+	return genphy_c45_read_eee_abilities(phydev);
 }
 
 static int aqr111_get_features(struct phy_device *phydev)
 {
-	/* PHY supports speeds up to 5G with autoneg. PMA capabilities
-	 * are not useful.
-	 */
-	aqr115c_get_features(phydev);
+	int ret;
+
+	ret = aqr115c_get_features(phydev);
+	if (ret)
+		return ret;
+
 	linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
 			 phydev->supported);
 

-- 
2.34.1

