Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266104;
	b=z4yiC71arQkYkgZ/dl/jwBeAxV20oX4BbeViKFqo++zJmCAxJHppNwM6xGAN+Yt1amit
	 PeUclamDClZkdwpUmoaZImO2kRYGXRqCX59U09gjpRcPnLnLVggJM8tQjKuiaRWglk3Js
	 Td+XcGR+qeSH351vOc2C8NzUulqmsFF7IhVDpGhlZaVm58bSE00xUnWTVifJtul3/rSeT
	 PI0hQmjt+RomOIQZNOvALtngzsLCVBd0iNhs3S3yfHSwQDNLdGqO8N1KVVSnm2F4xogGr
	 CTRWSZvuKe/BYH1+Ez9FPoqODQrdZ3NqAKhGjwLlg432WKtIw61/ZduhmQHRCOnxQDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oKlw85osON+mVbqczkz1GEPgxIWaF4G95QcuqOdPsWs=;
	b=ZobA317P/g+13+EP/JXCP4ZCwWWkVoUXlOqb7qZ8agv4GbbFYvrlhM0LUZxUDOJBM0fQ
	 iMDCFEEPReRntxJIT2TLWTwGCyxYz00rnd5vnYhkRJMbFQZJdtYmtDlLjN5Ttdh+SCE2y
	 i9Ul+hZJB1poxLu1KGeOR+EU7t2z5WvrQyKD/zQrPKdBsbGuUgqpnHrnXhKOMYeuoSA2a
	 iaqmTrSf45VNJOxgPVG+wZpYx4KsgwTykNTe/qbpVRP9lqnCXpjOMeE5tMPrSCMHygrmU
	 3VMOybAHuZtPOUvobOFxnTeRDWH6VkE6+MOURYnYvo5VlhjhOMUne5A2fsWjTOsdifw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwP8PqdF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hyxgh1bP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE1606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EE1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwP8PqdF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hyxgh1bP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v9XA659653
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oKlw85osON+mVbqczkz1GE
	PgxIWaF4G95QcuqOdPsWs=; b=YwP8PqdF3A2ToAjolo0z6jpEfLOqpfFkpoyfov
	QODVdZDfXcTe5HydzYqIjKqAFdV8GzC4qgAIi1fi+We4FdT2M/4f2OxNirTwx45Z
	tX2dhQx3VmIW1IbJnm58/vl7F7FMUA/qlJa+i9l9CiUm10gu7uqIAQbUt5QkOaIV
	otwFXKUwk2A9GjB6FrvhrgEkCbzRSskCRxzqR4MxZ4o5sHCPuNiv8TTtdY9QS81M
	o2E+oYM6I0dRaUSeOY+GE/+sIiR7ucDp7kYIVPIBQp7keZKRQoD0O3uHfrtWCb0z
	4ZlL+UUDiNjxQi9pAJBy62pRt3RgciwtpySDeBERKVk6FrUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehuwjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea71803effso20401315ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793266098; x=1793870898; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oKlw85osON+mVbqczkz1GEPgxIWaF4G95QcuqOdPsWs=;
        b=Hyxgh1bPKcKnSDw7Cl8evTuoF0n3cgJLnYet+tDSqFgW7zzgz37E83Y+ZyF4ACG787
         hlxWfmp1VqlsobWeCvYDmwrbnC3s7rJqK90F6wG5TbYTLgLo39CoTtmNUSCEcEv2NzRF
         8Jz4rfJr8fzLYZ76bQwQZFmkdr7XNWzM4DPb254XIYDkMGBHbRro2qoLvxPLA1O7YWo+
         xYNppUA5UNaMMeAPotKxZfKY1GnMLuj5MPDPLe4aCwfqbMaR4rPipXx4YjAoRcrTjqZY
         HAH+yzlc57b02YrPWLdDsSeN3UJYIS0fdsbw3I08apOxhruU+5MaycDfed42KF+far6g
         SGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266098; x=1793870898;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oKlw85osON+mVbqczkz1GEPgxIWaF4G95QcuqOdPsWs=;
        b=yzqhpxgygnAj+o8kbCiKOFzqJ0lgHfispc4bMgQULKO6xXxOjuu4u9TZU85QKypgPQ
         qGjk/n7xtGyF0/6X6Mtp+7x6cA/bEt6mPsxuPUfr1P/67BAE0pHBhgyGjkKVzI9f5RIk
         /85Q29Z6OmycrQKLs7FPU7FQ2XkziJF+/Rv7gAcDtMrMkDnRH0GZNUuNUXlhvH4+6X4p
         Iha0FmEItq+OqBYju4mmLOakyoXqIKt3mONXkH+HQxcJHGPUc3ZUw/H57amF8QuvRspm
         hyjjoRtOPaGe4BbqVnuBwr5VzVsd06vNO6l9XCtNpceCvSuu7Uy4+p1bURu1fViHhjpC
         NSMA==
X-Forwarded-Encrypted: i=1; AKwUvByIRv+a1Hy28sPaLo9i7USkppMWd/rQV2noXbe1RN1BLebozVsfMuze8c+fHeq1D69K0wf4rIvXrEL3+TY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1HigRfWCFfJbP6CqzIYbnJbakzJRoP3egOe+ZBF/DYgsGL6LN
	B2Rv6BvwwGngXbcfyRLiGNk71Lnb79PBuKXl/QMqvcIO3WkGWqkIevc4F7VRJd4jSCzZSnAVLfV
	41ea9kK1m22dcNMFI2nXlFOTfTtaS9I5VV1ZreDAN4oD84Bz9Ui/KbhhIEtqKJRQ6cVw=
X-Gm-Gg: AYBFou0IQZtnxM1+938S/1K2+LKN82Hy17bPCxwyGqNdnl10y8lwHyhjdxF8E9OQH+l
	SPYGJ8uR+BaOdidqfgMTJ/D5paER7PDw42Iog+nf0mX0M8nvgA0fXariuNkWsGVMzmcncwTqq3R
	Z5RP6Dbk2RD4R2/c7/OGzNsnP6uqoL7VMiuFSCIqxMpx1jOEISUtLeS5i24WNKwwIDPKpW1euYf
	Mq51ho8IL7nZvOo1LNc2Rqh0+i15fdi+GoTp77ZxlRsBn9nge/0E6e/xsSDqtgg6Mi4WV00BJDh
	EV+kevHF6BB4jT6TA4YsIzY8IFlCqcIZlLOPD/GSnqawf2qOgLEyq+YBlLgzvYruVdwRvGb/545
	p5hgqUzgUebJaS59pfy7wG1k6tkKcS2KTi6fdImic+nXb8dEONRIYbKJopSg/YL47c+Wl2a85uP
	qNywNfWopczYwyTBTxsGeoH4XQsx3nfQFG
X-Received: by 2002:a17:90a:ee94:b0:3ac:a203:e095 with SMTP id 98e67ed59e1d1-3ae57e07c44mr2508950a91.7.1793266097696;
        Thu, 29 Oct 2026 02:28:17 -0700 (PDT)
X-Received: by 2002:a17:90a:ee94:b0:3ac:a203:e095 with SMTP id 98e67ed59e1d1-3ae57e07c44mr2508928a91.7.1793266097195;
        Thu, 29 Oct 2026 02:28:17 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c59a6sm2884765a91.3.2026.10.29.02.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:16 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:28:10 +0800
Subject: [PATCH net-next] net: phy: aquantia: Poll global status register
 for provision ID
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
Message-Id: <20261029-aquantia-poll-global-status-register-v1-1-808089824a3d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKkR42oC/yWN0QrCMAwAf2Xk2cCsWpy/Ij5kW6yR0s4mk8HYv
 1v18Ti4W0G5CCtcmhUKv0Ulpwr7XQPDg1JglLEyuNb5tnMHpNdMyYRwyjFiiLmniGpks2LhIGp
 ccDx33tPR88mPUFNT4bssv80VEhsmXgxuf6Nz/+TBvhfYtg9l7LrPkgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266093; l=1877;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=BJjWrToh5ToA7lfILPWUlVKQppN23gW151TWVDpJEbQ=;
 b=1av6qqk7OUfjzHOhis1zXHoExN/HY6UvN1AjvZd8acRb9zQpeJ+W3ClE/3alDHNO7+g6lwcgb
 okCpuo6ujL/AaM0Pq0SxM3gCJTaO+aWJ52B+Eqbdy9UoZtvz6cBA3PB
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-ORIG-GUID: S-WWAmBbC3omVjtXpeURI-VGWOS99Tvw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNiBTYWx0ZWRfXwGqKQS9s9Mhb
 JCl3di3hw78PWy4eRDMqQpYlHRQmIHb3KHBGNt6pdg/YcTqI1FQrf1vieVIbjlwy2OWU2Nl56o2
 x33G/zQ6KPk2eO0qV2z8GXoPCHx1y/JYg4L8FOcRwkMGBj6PeWHpfjN57ChJ6yWVIuSdy1dF4CL
 bMbICscTyhtcAr4lyLGEYg9p9zqeLJbitpmBlBlW9+L6hXASfNdlx2Y52Wj2W2+jRdvTOFd9xNR
 Yt2HaNxEz8KxEpR7e8FZTtXl9ea59j4nqX64S0QP//6GA+a4GgwI1o9wTG4WU59gTzeAZH0/N3J
 RkjuhirJmN8no8IT6ZJ34105SNZqEjCuoxkQaqqvwRQz6MISvckv21A+jQU2Tio5x/Mu5yIvYX2
 zp/3Ah6qiX98dTbyLWaKMpkXG+aqhvFA2wNNyC+1Gbmyjd2Ro90fh3qBzKoA/fbPH/KQtbkcJJK
 q6bpCN2hnyxsJcQJq3g==
X-Proofpoint-GUID: S-WWAmBbC3omVjtXpeURI-VGWOS99Tvw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNiBTYWx0ZWRfX1L5LP2PUm0Mi
 5ul7m3TOSdMp8HRvl599shG9D+NNHaPRRcHQbJFcep0zPYHzs7AGAb6eumzZ2MbgjvJRLvgD8ul
 0rGMl9cDm6fkScv0B6y7PTNSNAroWn4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae311b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lkaxqyAuq-rsphcg5LYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290036

After the firmware reset sequence completes, the global reserved status
register (VEND1_GLOBAL_RSVD_STAT1) may not yet contain a valid provision
ID. This can cause subsequent firmware operations to proceed with stale
state.

Poll VEND1_GLOBAL_RSVD_STAT1 until the provision ID field is non-zero
before returning from aqr_wait_reset_complete(). A timeout is treated as
a non-fatal warning since the PHY can still function without a valid
provision ID.

Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc2..1d8429a9abbc 100644
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
+		phydev_warn(phydev, "Provision ID not ready\n");
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

