Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B184F380FC3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121009; cv=none; b=FAG3KadJKmxPQgPynncvwRcPY4mOGi3/nRcIUz97aV1tu9jlNXllgAi5kMQT8Qd7LNlzasMF4wX3CzlwL1EzT9cUoXZ/lc4wBnSDKjEXqv+nhBoxaMyl9yy2azmzXLsb0UBWStU2DlcsksQh5V1VCnFAoL0aezPWwah7A/oc/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121009; c=relaxed/simple;
	bh=+72g8Yos05LYO8HWsgDlsz/pucFM/8kucr3tk/IGvdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SEzyyylvFz0hVX04HGQfI8x63C0h44kmt7t3OoV0xWbCtKP0z8FaiMarbr1CnPFlvYTbQXNBn+suk/6B5fJ9h3x1oA1jm2k5oUBj/pc3ko/9sJKuAJCRpXEFeveN742Qwk5FaKOPlYB1kzht6GT1iDdmJkC5Qs5rmymeARoObBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKh3N7Od; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrsCZj9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKh3N7Od";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrsCZj9B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2Yc2W405920
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uox5aqWMuWw9seqGZoF8JU
	w/ExqPXaGm4ZCOZEU8nL8=; b=bKh3N7Od0hqu00Sy8By21vv7sYZOnwqQWiQsmH
	E39CM/OuA4E3n5aVbrtAMS8MjYaV+eDjzT+yaploW3pQnhXMHgdKDBnXIZfQrGWb
	gTusVILvzH6aFiyAOTnQ+HjmDQsfsaVKxeV0WLnAcffze5S/fSyFnGQ2P3EOwpn1
	YZuvvkhJc+2cDcOnMqJ0hgS8xwYeQdnNYLS+kI0QT3JzUS1VhH6qZR7TV55cgk0+
	EL1/X8yF2MocVjS9pKmFjCxRO8pMGgSON6ICIdsWuvtSYat8kYluvNpIBrotgMlj
	mDbDZIMStk5+k/pKmUi78ERWo3eS/oRD0mNFUKTRnQIj9elw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa1s7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso5229140c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792121006; x=1792725806; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uox5aqWMuWw9seqGZoF8JUw/ExqPXaGm4ZCOZEU8nL8=;
        b=GrsCZj9B/rPSWiLr2TjBxVFatCG1k4htJ/hMESHD9d+YtTLiGKEAGN7+Kr0deY/3MQ
         Y3UHAKc7jZBA12sR8soShzlV35VdMsMMJLTQPzuVQfFBgJew9xbEiUr2gkQqzflaAzY8
         Bp5xg1cBkTcHniSfxmzEpyFOP2OQLPjIYBbesMB6fa65MLwuXQFFVY68KotwOU94Wzrl
         Bv75NTzGxpPjL3qQYz0b1uQkHq8waHJszP/aQ0A5kPHDPk+of9t+TPpJZ5G/Un4znpVC
         LB/6Mft+jKjcpqm89/+C5LwxcMN+C+LO01qV5N4whHPvUE75/2vJx5i8GVML99/noN4i
         PvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121006; x=1792725806;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uox5aqWMuWw9seqGZoF8JUw/ExqPXaGm4ZCOZEU8nL8=;
        b=AcRiygXUyOtFn5/BYRtHIQ+wD3qgoTwHl1BDZG53vfQPAAWgtyE8wO4sGlOlZcizow
         wZ/JLYTD0oei2y7SjWhy3NUFYnCgZDy1TpPuP2EKQx6KBIjQpUQcxvYdNiUDH3EtCnY/
         Duu0Pu68UA1ou5gegQsraDVd8sXrWT/aeDaXGp3ylIQOLwuIRmvjgUjcMRHXjLh/s1js
         KySIUZwqUfoqdkh/MLFTfD7KBTQ4CdkPb2syhjakCWoTJQG2GSrMOGC/1JcR8jOgvcjV
         B9O2mz4qQ8v4MeebgW4I8yEQkRBlM/ZTdzBABfzw4a8jx5wtWzGSz2kW49Z5/TD4rLU8
         lKgg==
X-Forwarded-Encrypted: i=1; AKwUvBzSkIJ1jR4iBOpHwzoGw3sNUZ3Nh44Ym52vdXak/tgvUnq+2Bu3l+QRFOZQLaLW6n5ABce+M7E7QVBFsBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxwPWm1ZdIR6hrd/JSX6QedCg8jrAORzjrRa+3ps4A7UP8ZoV+
	wFSzqrioQTnX706jgcHHS+j0kTBGezrpUfJAslXONDgXIoaiSyykkgc+1hNGXq45zkpwXyP1yRn
	elPuxHNPFy7VdDyCFEQgJEkN6lzCZ7SDoJjcMUT73LgicwBI+IVVuWts2FN6PLuNLB0o=
X-Gm-Gg: AYBFou3e7ALL+rmgXyeqga747uokWZq63xe1ovv6AEcw00MtevOClrl1g5Ue6BnGwE3
	w1TDkbCEbicPjqqhrvMrB3L2rioXYQJcAcNnpcUo7ZKAoSGkS/36t7P7GUk0usVh8Wi64x+fBPw
	vJiX6vGkfI3ziy0741u1jcS2Vmf5KaQoVgJ+w0pYSJkeFe1DmpmMzG2I6K9IDU+wzjiyajYT0Bw
	rNSqYBBI3SG6pNoln7BC8darORHBupJq5VP5JEEgP2SjJsJ0R71fFA8YUO1VSD7UCx41xajwuhd
	OF+czBD5h7KYJk5C3TmI/uMPVfGR9QszN2g9KUgCe3DyTOrk0k3uHBOaMsqlRyTyku5PTsw54AY
	7CqXd2Yu+rmMc0hdj/LERf8lq/mJ5JvJAsd7g1HO+agQlQgmLVJnwb5slmsw=
X-Received: by 2002:a05:7022:f503:b0:16a:f5cd:365 with SMTP id a92af1059eb24-16af5cd03a3mr28581635c88.5.1792121006399;
        Thu, 15 Oct 2026 20:23:26 -0700 (PDT)
X-Received: by 2002:a05:7022:f503:b0:16a:f5cd:365 with SMTP id a92af1059eb24-16af5cd03a3mr28581610c88.5.1792121005848;
        Thu, 15 Oct 2026 20:23:25 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831bd28789sm1674445c88.19.2026.10.15.20.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:23:25 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/2] net: phy: aquantia: fix PMA capability
 reporting and EEE discovery
Date: Fri, 16 Oct 2026 11:23:17 +0800
Message-Id: <20261016-net-phy-aqr113c-fix-pma-capability-v3-0-0bbb1b84035d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWY0WoC/42OOQ6DMBBFrxK5ziAvBHCq3CNKYRsTHLHaBoEQd
 4+BJkUKmpG+Zv57syCnrdEO3S8Lsno0zrRNCOx6QaoUzVuDyUNGFNMEc5JCoz105Qyit4QwBYW
 ZoKsFKNEJaSrjZ8jTHGdKKp6lHAVQZ3W42iVPtPUbPXn0OjZukB+t/ObYbkvjfGvn/Z+R7I1DT
 dkZ9UiAQMxTduOM4AInj9a5qB9Epdq6jsLYvSP9JcenyDSQKZc4oRmTuGB/yOu6fgH4GokLUQE
 AAA==
X-Change-ID: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792121003; l=1684;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=+72g8Yos05LYO8HWsgDlsz/pucFM/8kucr3tk/IGvdo=;
 b=DsKoeIFonMVl3p+M3JTDTTpckSQRNh2JRv2oCTPmCfu4FxSW7SMXcKSDFYH87aCMYMPzbSQCi
 oolvCeWKSEKAdYzcBrv2ZafkjZ2mxxGH5je16x5j4KA9HYeS5j0iRJg
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX376dft8OyXPV
 9fn5ozHT97DIMdVaif1eK2dGPrw+2lWL8SOMoIi2jXsBZCqghLPgIcw3ssC6+9LixWAmsXJUpyO
 avcPRPcevPy7ug4YPJ/x/MRVGOrjb8I=
X-Proofpoint-ORIG-GUID: ZFNew6aPnIXoGARL406L2EoxWzi0Nv4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8gQ3YDIJrDqq
 BHTkzsHwsW1caxrvPtL4zvoYY2JheGTW8KLijLgCjItf/tz9ZiYiNCMhSRzeBT8wOGUh4diqUiF
 EJvtnIKPMIXHa7MxK1ajP/WtOagYuD62JRcAhY7n+SkbtEuJ1DEsNvlSWcRVjs3gXnHP2AVctV/
 7A04VTn8Yb0k9hHLXg/nh+OjQZHLfL840PrbrY8OnSPJl8OxwxUzYD0O/q8eSuouBNDsNmruH7z
 +2Nvs/rgKWPqqRpjL7WEp/1rzKic5m2r2pPloEHvWsSjw4UcViS/yGB+aeOpFowIgwkjGen7dZW
 3jU4rJYnzlwUkhWVpYDHU0LDHAYlnUPu4xpSBiBG4pTU2vUw0g+otKIENuh1WXC63ddrAOCaTED
 HhG9B/apn1+TyVidDBiSjDWPvGDbOEpMkcE5Jl8GTcIpwT1exgg+Lt8K6YqdCyJemmPekpbSs2J
 mbB6O86neuFw+fKimWQ==
X-Proofpoint-GUID: ZFNew6aPnIXoGARL406L2EoxWzi0Nv4T
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad198af cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PHq6YzTAAAAA:8
 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=NrrBnyfBMENEQTkef28A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=ZKzU8r6zoKMcqsNulkmm:22 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

This series fixes two related issues in the Aquantia PHY driver:
- Patch 1 restores EEE discovery for AQR111/114C/115C by replacing
  the manual linkmode_or() with genphy_c45_pma_read_abilities().
- Patch 2 adds get_features() for AQR113C to correctly report
  10G/5G/2.5G/1G PMA capabilities.

---
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

 drivers/net/phy/aquantia/aquantia_main.c | 40 ++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)
---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260917-net-phy-aqr113c-fix-pma-capability-d7d08cbc9879

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

