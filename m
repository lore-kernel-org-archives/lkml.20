Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384439;
	b=mlgZ7U4jfK5PngXA8ZPfqFeNw6/kuqkMsd5oyHWrlmBlq5BaiBHAkfXaQYXHTZx2QMmo
	 4MGdTAA7Q/KyqvCgQnC5An1Imv5ubyCCd7nNJOobTxNQdfZ7atC2TGK56Et8bf2EfV/uP
	 N54HMi9GWCO3pxQzywP4jYsd4PZpP3CiyfAiW4PiP+HlHYjpMVres5XnwBuRsv2BkgP6R
	 1ykYyrCCzdrArYXDoWlmwFre0/fkChnA7e/1smyntd3Z/gCwRKqZAuEgDZZ7RBwz4azTi
	 2Hh6Y7N01dM4mf4oGkrrg4vriKmmSqOxeRoLaQeqS08PNoSZYyoBipNBJxGfuvWML1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fTFqFe33sWuG4oVgvv3FHCshoq1fMcluiyt2XIknOEg=;
	b=weeXA7KXfyE/YCviEGJxeCM9DUvAD79O989vzc/FgoISwA8vYjPxWPpYcjdPhLKVlogE
	 JjBzUHRDkH0xouYDR2zhVb/vCqiO5d+iwiJR4LgCjtlY3lB1glo6SmMS0HzOL96ZznFQu
	 zQGOpg2iF1MDnSo2qntYAcFuIsUyeuC/24kup1b4x4JHSlWaaubiiFNFEbe++3KJJpzy+
	 SAFNcQwmdejjfTmarV2qwAWKtrZik7QDF2TU/aO0nlfxOqIOTQ3zqaNj29IbdEK/gqGKw
	 cKEpvyLHGYx+wHZmC9AhrTXkv3Tz1YR2eK9wWS1fw9f9WFKY7PF3iYmBpHSLw0zyFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8DBTodk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OujGsPCn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B0606A8E3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61B0606A8E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8DBTodk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OujGsPCn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5K9Xa1408973
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fTFqFe33sWuG4oVgvv3FHC
	shoq1fMcluiyt2XIknOEg=; b=d8DBTodkOGrbjOV4mUIoJT30wKpjBx/cLjjpyk
	+f5zH3y0vzKwt60Mu1YKvEK8jFpm58nvZYwTOKDE+4LK8htVwg40ZztLsjxff2ue
	s6DOIlJpXtKULGKceuKYh30YAlehthqlk/um8rH71vfVkEezXW1HNBNLEthdlnPm
	xcN1b1qjaPfClG4SCsQc8iXy2+hgJbcKwH2d8io2DXrv79Z+UiHBjrEZz5lkl7Cf
	drgdndICMgz7mS+ZuXg86fO8uFN6ca9qShCgXZKtbyyg/wvRsxlEm0Htk5ZETtcz
	J3v7vubjAa3F5gHUXq8xmgsIA6jLmZnU2D3U18sCebuYKsqQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdgwth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:07:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so4837038eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794384437; x=1794989237; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fTFqFe33sWuG4oVgvv3FHCshoq1fMcluiyt2XIknOEg=;
        b=OujGsPCn1vdyCUmON9Mea7aGSgBUcw3VAs+2J9h4Ai0A80AP29frDm9ynYlyESHq9G
         jhLylwRSFyXIcHSk28xAh0Kc4GjnQvMcM83wZctqly1es4R7WPfqLuFNuj/YpOVABoxN
         G2Ky/YRv9dReUFg37IMVoegLbm5SXWuPoVlwsVDzfTSnNBmzhBL6erhk6xU1b4UXHIGB
         v+NkRhCMQ1ueCikAdj7FXEgkmPPkNssMH3bmqbrJUDOpfovIt98l2ch+ghIiNelTCi8D
         6ftj4H61sdhK1NBuomxtBtB8HDWDBXjb3D4tOd6Lik0mg4ZiTSemtuXuJyZFOnL5CZ3j
         kgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384437; x=1794989237;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fTFqFe33sWuG4oVgvv3FHCshoq1fMcluiyt2XIknOEg=;
        b=qZNwGPd3I4k7DN1yZqhMzxgdAw6R+2wYbeUqws7e9XHt2RyCfPoeYK3Gy00LbGZlkZ
         a+iUZ98NZyplXgmpJnqnp/tZL5H3nqYbtqTOBmqzjSMV8gkTBOJ5F9o+1berz81bhq/u
         lszip2eryKh5HQ53pLnbd1ZD2ypMwCEb8O5BmxJPyTUQ3oLXwyV19CkubfqKzki/laPI
         hnV9I1qDXfp6I9BM4CkklFu90g1jw1EbSo1hHgDbkyuhTdoLejlXH5ucFJzZNSCnpBen
         /xKlUxMgFoz9dJlX2RH92I0gqHVSLqC6dQIpgI9pa+TVXf0thb01QrrmzmE44hx+uBGs
         dPVw==
X-Forwarded-Encrypted: i=1; AL+hErGmhLIes1kt2prjYbNV5Q7PAR1YQIl7uL9utvB8hY/NVU2EcdPpm3e0h1mjNZ3k/Ran2IVpFqUWK81CR84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZBOG0l3IE/YHwbGAkKjzOjhWQbbSvk8C2KUOteZQZUNRc20na
	aXnLNnZJybF1CWTKaj+mWV8jyXRCGuOfi07veghyaD7I1/bJtkvKniQKSnVu3hQy7uOrLDwKryM
	gCaQlvaEEgUNTtiqK/s1DWo6pdB6uYz9gGwgisTTzJNEwZrS0H9MmYtkZjcIru7ZPkZw=
X-Gm-Gg: AYBFou3t5O+s6pz5PnPLEXoTRjmGCuolrlB0RtdhJxFatqZNfICXauqgp3dTKyQdWzl
	vHIMs+2KgBWMTE8VNyOX6xKBK8roSLBGbBmiioxDkhduxlWm67alN4ljEefTwHhKXgyEWbQatBX
	pxBHBmvnvdMkZekXrFUNGFO1dQWICBKNdLWNhEwDjLDfv7gw26khKXnGGY9vSnz4nPf9TshbpwP
	qrk7eMhCPzNCiAhTBnrQuTOSHHF38eVz8VfBThex0MxJaXE8VLS2v12rKXplzyehVvvJ60Vhheh
	Z/nzCwRlAu5zahLkUzqIxUnOe7tFVIJswOzuqFzJEL00O9WHiRfl5h/kjE0pDe6vyQH5htK14WJ
	qwaQ5AEsn4R97AxRWmhUoBHy4Rjr2g0PWsehUlaYPJVd5eqGXadTerJkN6Rnm+U2qC9Hr2qVNp6
	n8RI2ib5FxZdsh6KLoSnTPN7V4VNLYmia+
X-Received: by 2002:a05:693c:8954:20b0:36e:53bc:4681 with SMTP id 5a478bee46e88-37687213eefmr2204248eec.37.1794384436909;
        Wed, 11 Nov 2026 00:07:16 -0800 (PST)
X-Received: by 2002:a05:693c:8954:20b0:36e:53bc:4681 with SMTP id 5a478bee46e88-37687213eefmr2204233eec.37.1794384436424;
        Wed, 11 Nov 2026 00:07:16 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm12733263eec.10.2026.11.11.00.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:07:15 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 16:07:10 +0800
Subject: [PATCH net-next v2] net: phy: aquantia: Poll global status
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
Message-Id: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC0i9GoC/42OUQ6CMBBEr2L22yWlakP98h7GjwIr1NQWu4VgD
 He34AXMJptMZmfefoApWmI47z4QabJsg89C7nfQ9MZ3hLbNGqSQSmh5QPMajU/W4BCcw86F2jj
 kZNLIGKmznChiW2mlzFHRSbWQq4ZIdztvmCt4SuhpTnD7OTzWD2rSSllv+1wR4nv7aCq3xAovh
 dT/wacSS6xEHl3Jozm0l8Bc5KRrwvNZ5AW3ZVm++cEQu/sAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794384433; l=3635;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=CXDq6tmjkOW3HYr8JFux4YYxO60qWfpgAK5Zd4KXNa8=;
 b=KFS/WoxPBcGDavqYC29OJuFMh2HX/6VTMIhiEkJDmTXdXfFnO9AQ6JbYOuvyIG4zbukQuvECi
 UujVa3i1BTxCYVc4wPRrV7h7h84nsXTlDmARYizB3r3gGCKI0ZWlx7W
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af42235 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=bE3ElnuJEPo-UkmYN9QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Q5Iv3LKkTo9MMKEDN5QfVGuZgUQw_Ecc
X-Proofpoint-GUID: Q5Iv3LKkTo9MMKEDN5QfVGuZgUQw_Ecc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMiBTYWx0ZWRfX+KOmNbeDrQ9v
 SZadoCN6GPJXPbIyRhvqGTwkv864sJGR1gjTbeCtYaIDRNcnmWQgTTDR/Cksl8FhWCFl4SZEMZ8
 8n8zCwEeYjdOHQfDXqUfdnGP3A8SlXYIkTFr4q0MSrd4Pov/nSeiuZ/8vXwgQU44PlPAvZA1ppq
 x5N+mnRyyY9kOZ+vzsFsbzZePT2LcCDAKvgl0OzNr3r4KfkBXdblFl1Q0kE8siX2sJhU5v9ULSY
 O3KT+J9so0PQtFosZyPq6sORIFtZeRq5cM4KI092YRJcbV0N3iVVoFndwwCYMWp0ExoHDtr38rV
 x5cIW9mjSmiSF5acB9iwPlOym1OJ7cK+q756t0iI+8HD/oE9GaY/2PXbAG4l82Ifuqwk3PGegYY
 Op0b5m+0+E3P0BtXAeT8CNC6MN3tqHDGvZG+YAIkj4pJU8w/2Sd7IsJH32bjWnqlZ8omjhFXc8J
 DE8M+IY4hQ/okfkUmfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMiBTYWx0ZWRfX241mF7RPMgP2
 WJ4ux1Hrm7rtejhMYEoIv+e2cU8BhSrQQYDDZHdoud39EgG2BBkxz10U2VZRwWaOcdRzUpEBLHe
 sdGrUBRDBa4egF1j9sEk1pLJOHowpcE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110032

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
Changes in v2:
- Change the log when provisioning ID poll times out to hint the
  mode mismatch possibility
- Update commit message to describe the AQR113 databook boot sequence
  and explain why polling PROV_ID is necessary
- Update commit message to explain that timeout prevents fingerprint
  construction for PHYs like AQR412C with MUSX firmware which in a result cause mode mismatch
- Link to v1: https://patch.msgid.link/20261029-aquantia-poll-global-status-register-v1-1-808089824a3d@oss.qualcomm.com
---
 drivers/net/phy/aquantia/aquantia_main.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..bed891cfaaa1 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -702,7 +702,23 @@ int aqr_wait_reset_complete(struct phy_device *phydev)
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
+		phydev_warn(phydev, "Firmware provisioning ID not ready; "
+			    "interface mode detection may be incorrect\n");
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

