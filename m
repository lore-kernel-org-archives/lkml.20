Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452551;
	b=4exxjwpdw6uTUGdJ4LhqjcIRCXAL0tHoOVIc5wsg16RcIYs0gcHHw+BSx/pRl8uMgHNv
	 oo0quV2AFqbxap1MZRN+64Uq+EUtdmpEgup2KbZT24p1XpwYExp5/h8lMSUgYCg025ie6
	 w4iab41RX4vCpSWC4vuYHQaB79NlrP6hNlliBCyGKuZFLYitA98t1tMjH5GdHDpH+N30B
	 +Q1Cp4lRQLN4S0gnMMxeeHiEgQcu9+6dsO5TTFpYsFkVYXPIpnZy4KUsDwxHBwZz7g7vg
	 hbH8jEGJL43LUmcin/kUugRanc98O3JFvRxRB9uZaM6e3BsAMiFVKBmjpBRaMyRZy2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=47XUdNMwRC82iFxZq7ZQ86CfwaRvSX1dghpcrXI2Iiw=;
	b=UzNPFlfwrwF//I4CgR/HgOGYQmNNVN9K+WO5PKRtekk3gwmGmFBrelPQCTbxtsdtMdrv
	 7DMQOosnDNmzVTXecsEdSzBCgxErAzzzTS2W9GNtNzg46jGo0yUmM2XhdPT/+sHm3i5RW
	 23yYfwpzAJ8J8MmkfQwivGZ+4P4o7eWv4vt51yNe9JU9m97kjQYs8iRgadziCOEcHfvpG
	 LNhkDVyltyOiEPct763eaSDGT6Y7vtg/KJQSvX8ECFeFpaEVp5WAIKTUV17REbBR5cQUy
	 Pk18fE+2Rsm2r3f6JjODIHtTwYWVT9FeEj4prSOEa9EzQLrNKG414a4O448PIoXNuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U+B/DW44";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuvtCTmW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1C8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+B/DW44;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuvtCTmW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aWEV1475415
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=47XUdNMwRC82iFxZq7ZQ86
	CfwaRvSX1dghpcrXI2Iiw=; b=U+B/DW444pgNFnzIAIwWB9DfGuGpZCwbiDkfmK
	PlVd199bKF3c5eAjl/hBVVqwukcv7qSM2loL08xt1+oIITws/OHP6BuByqM918JP
	lvLAjzebNumwF6Yf5Q05+We2TI4k4QTG6xyh84QuzBaP/qtqIVqVZXdQYB68/huq
	QC/IJthVm9MldmX1ulTlo+4YIIoqvlRYLjicPA5QpSjHoKCD7pZNsKnZDYC7AVbu
	J3AKeqNd12ScS6K+HU3bbOGQUuUuMnKzRBlZHnyD9dlkdfg4JzA5WYjAgUJWYXAK
	5hYgQqRpNO6mMAoMCHd+zm4I4KSpQ9jqktfagPbi5A0JMOXg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymtbqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:02:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so757906eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794452549; x=1795057349; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=47XUdNMwRC82iFxZq7ZQ86CfwaRvSX1dghpcrXI2Iiw=;
        b=iuvtCTmWZMmTx02RWxcP1sJli9R8ZT/pz1r0l1KROYXq2pHm9Q/1PffGfssepxjXPl
         8SNzC+zOvbvvNlMoPcSlYbWaNN/EQDahXFII1feH4eFhy3WocnF21VQ1J+3ozB0riHHF
         RVEhla3PHZd5i0lz4T8YWLg9OHuWwyY4+YYjmguEvHJJLzZeZRMSC8WNh9/bviu3kB2O
         k903tjnoaVYRTRPyKwCtntpoIgQGYEFAyRzwiOrAAkgJ+++IrACel+r54YQhFE2+nm6o
         bEL8qLMUnb6PZIS0R+3p+DF7dTx2q6A5NGLHpEktSlxdPmIxlqAyxc5s/dpTYQx6Unj4
         wyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452549; x=1795057349;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=47XUdNMwRC82iFxZq7ZQ86CfwaRvSX1dghpcrXI2Iiw=;
        b=hekeo3U0+nneea7Bc0Ny7tdPX2O/T0gX8lI29pY5BrR8RM0fGdThfIQEyLVbbu7vbl
         OaWBTo18ZcskGmZPF/MDHnkViei9ssGQ4rJsjNxrDJILej2blbEBrIJPaNb8EUzwnsvO
         vKjsGCXloqecXu1C90tj65XuzSV6qj35bkMKr+jlKfMb83vvBH1Xj+5HR3gmUoUXIK4w
         vvjkmcJOuw8i7uceCQL3kyY2TdhPVROw6cZsTF5lJ7NzRN5vMqYKVG7NQYjXIQULGaNr
         h0Nv8DnNd35SY+TDoR2Qrqryru9fSjKRdDBx39mClEcF3CRu9EzW7jVLnMR4jAQdrpFd
         3VtQ==
X-Forwarded-Encrypted: i=1; AL+hErED4rrCf1hpe8dRC7RUu8JDQKxAuVLGiWnO8fTY5sKlb5XGbMIdyeLojvpiya+qloTXjHh1geABcdksVS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c1ou/H+wfq/nSezji5ABZZ1W65UT5PMhNhDUnfV6sfZUvctkM
	Yf3rFTDMCwQnkBqwPx8Qf93ksIbdyxpyCtZTsdarJxQmtUEh+HTC2gwb59k9+IfyaRR0mdD0ttp
	rTa7McmHQSoXk/XfqN870nJ5np2i25pBqgVQ7iX4DraENHZRYpMvf+3603P9buj0Fgfk=
X-Gm-Gg: AYBFou0YkNHy5yd2Mfa9qvWaPrpX2NnXziFJfjvVwu5WjnLoz0+mTEFdJ0rR7WrMSJF
	ZwquPWgbEF131sQ0YznAcvMFut+0ojKGaazysU0TAOnsFZuRHd1nF9wEKHwsL5QQWOcBmqBqtap
	gR7QaCD1ddx4HTGo/mg/VfjtEOwcbt4HGLSsDzvVyrIvUwFR5hlJCKwrw55Xts5uNfEo88FQGJP
	+PaT0dXj4xX9Vgl/ax1jtxtQ+Q5Fm1RtIUAr1rRM3ObK4NLalSLsb6uKA5if/Wa6OOavcnNWR+P
	JfjqhUdbDt+fzDB35aVo6ETMGG8Vsady4RW4ag9RfH0gj4mAhtVeZqD0McALv7Ik9Ejzzw5eBn+
	eR/+1IvWdT/pEIGCmJReh5izkb0CF5ducAfM7czDWVoRxxDpGcPR/XcvI8aGpj3Y4Yk3key43FR
	11lfscjGIHTl/iZLxMl35VMoPVblUjRFAf
X-Received: by 2002:a05:701b:4207:10b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b3c03329f9mr4187391c88.31.1794452548869;
        Wed, 11 Nov 2026 19:02:28 -0800 (PST)
X-Received: by 2002:a05:701b:4207:10b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b3c03329f9mr4187369c88.31.1794452548244;
        Wed, 11 Nov 2026 19:02:28 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm20729029c88.2.2026.11.11.19.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:02:27 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:02:22 +0800
Subject: [PATCH net-next v3] net: phy: aquantia: Poll global status
 register for provision ID
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
Message-Id: <20261112-aquantia-poll-global-status-register-v3-1-c805647a60b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD0s9WoC/42OwW7CMAxAfwXljFGasqzZaf8xcXBbU4JCwuK0A
 qH++9xy4LIDtmTJsv2eH4ope2L1tXmoTJNnn6I09XajuhPGgcD30iujjdXO1IC/I8biEa4pBBh
 CajEAFywjQ6bBc6EMfeOsxb2lD9srQV0zHf1t1fyoSAUi3Yo6PCc8tmfqymJZdk+CSPm+fjRV6
 8Uir7Rx78mnCipotKRrzB7r/jsx7+QydOly2UlZzZN5sSXeZBtht1abY/dJjUb3D3ue5z/913G
 tVwEAAA==
X-Change-ID: 20260923-aquantia-poll-global-status-register-d8966a46e56d
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794452545; l=3843;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=r2y4qoQ/sYPNNcw1MBOflb7fpnnrMPK+pwaDLLaUVTA=;
 b=cw5Y0Pke6JSvkwF4kpYiJupaG6fLUopl0LderboDEVsSdif9DheunNjnh+5mhshD5TTs4B8VG
 gHoSrEvJ3ZYBX2SAXt3nfAkbaPWYaa+yr0z4RPeH4LqNfH/byKrBPlB
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-GUID: e46PiVzOaVju_Zw0n01h-YoiRLyGnGgJ
X-Proofpoint-ORIG-GUID: e46PiVzOaVju_Zw0n01h-YoiRLyGnGgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX8IUAZoOMlQ8F
 l/ll24hlLOKwBLW4qyNs9Ev0r3JDT8jnGShj5ieJRuz0ZSHFIQNkSReiRIltrggA5vldYXSukZe
 H5BD8L4jSjPM7ttwg4l6zZT+rYCAIJKBBv6psEqplaohsaEfxQKbNNV8lrCwBoh5LYZ1UcWcleG
 NYBBGCieRU9i6pQddfEyb1xvdsvO3FKntuth4SHS2LR1QLgx0MszDRZ0P8yILKiVOzUlU5gench
 9yNjH83RvN6T6GaZwc1l3BG/lsYIUcb7P8QXXk2crM7sQNYUYvbBxC0IlNxsjlVA8ypjF6suNg+
 4B9GREfn1+86eiOCFcynlIvgYWYeAoNT8dyYH9jZIuZd7jhWVPQQipI9dm0vj3WJDvG0JuzAVek
 +tQodLzMRRkxdC4Aq2gfaVVkO6mkL3UhGxA5F5b4rvNMBUuXT75D3WZlSqWtzZ0L9yHg2dTYmrM
 LZKIFC5oTZpK+lRLjIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX3N4ANUOGV+rl
 GuBl7PkTSQLMeHjtlewkmFaYQ8dTZwQmznYWAkZgFuTOFT5oRESjLFulolRnaQoq7LNhO40peo/
 mBiwWVQP9Nb2wROJCPkjAubdVH/KVOE=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af52c46 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bE3ElnuJEPo-UkmYN9QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120011

According to the AQR113 PHY databook, after firmware reset, a 20ms
timer needs to be engaged to allow the supplies to settle prior to
allowing the PHY to boot. The working flow is:
  -After the 20 ms timer has completed, hardware state machines
   designed to guarantee PLL and band-gap stability engage.
  -After the PLLs and band-gap are locked and functioning properly,
   the processor and digital circuitry are released from reset.
  -The PHY image is then loaded through MDIO boot-load and the
   processor boots.
  -After the processor boots, any provisioned register values are
   set, and the PHY enters the provisioned operating state.

Starting subsequent firmware operations before the provision ID is
valid leads to steady link failures; this has been observed during
AQR113 PHY bring-up.

Also the provisioning ID is a component of the firmware fingerprint
used to identify the host interface mode for PHYs like AQR412C. When
such a PHY is provisioned with MUSX firmware, the fingerprint
determines whether the host interface should be reported as 10G-QXGMII
rather than USXGMII. Without a valid provisioning ID, the fingerprint
cannot be correctly built, making USXGMII and 10G-QXGMII
indistinguishable and potentially causing an interface mismatch.

Poll VEND1_GLOBAL_RSVD_STAT1 until the provision ID field is non-zero
before returning from aqr_wait_reset_complete(). A timeout indicates
a hardware-level provisioning failure that software cannot remediate;
the warning is logged to flag the hardware problem, but probe is not
failed since not all PHYs require a valid provision ID.

Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Changes in v3:
- Merge split string in phydev_warn() into a single line per kernel coding style
- Link to v2: https://patch.msgid.link/20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com

Changes in v2:
- Change the log when provisioning ID poll times out to hint the
  mode mismatch possibility
- Update commit message to describe the AQR113 databook boot sequence
  and explain why polling PROV_ID is necessary
- Update commit message to explain that timeout prevents fingerprint
  construction for PHYs like AQR412C with MUSX firmware which in a result cause mode mismatch
- Link to v1: https://patch.msgid.link/20261029-aquantia-poll-global-status-register-v1-1-808089824a3d@oss.qualcomm.com
---
 drivers/net/phy/aquantia/aquantia_main.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..b90221f1cf41 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -702,7 +702,22 @@ int aqr_wait_reset_complete(struct phy_device *phydev)
 		return val;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	ret = read_poll_timeout(phy_read_mmd, val,
+				val < 0 ||
+				FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID, val),
+				AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT_TIMEOUT_US,
+				false, phydev, MDIO_MMD_VEND1,
+				VEND1_GLOBAL_RSVD_STAT1);
+	if (val < 0)
+		phydev_warn(phydev, "Failed to read VEND1_GLOBAL_RSVD_STAT1: %pe\n",
+			    ERR_PTR(val));
+	else if (ret)
+		phydev_warn(phydev, "Firmware provisioning ID not ready; interface mode detection may be incorrect\n");
+
+	return 0;
 }
 
 static int aqr_build_fingerprint(struct phy_device *phydev)

---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260923-aquantia-poll-global-status-register-d8966a46e56d

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>

