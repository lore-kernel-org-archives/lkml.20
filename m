Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489528;
	b=RYEa10qtphjdB/7ZoFZ/P3mTmceUYkANq3gxEwj1IUIz7TtjcpWmlfAzdX+SJrpcMNBC
	 lJNLEPgZF95BpMBuOnmi6qgNlN3bpFqFLhaLU/AWRGLBKbQW0Hqi88Q5uOcDbyj9f/Ho8
	 GbE+2phs588bSu3PHX5bgcxrkzGm5TBSnlI9XY8owZE1DZ/s9viwcyaQqCNxkZQdt0U/F
	 gg3KVhCPkRiqlAAUGThAxpysBUqKbY6Ms/8ZCzERDldHuVmcXRi0W3HtBrzfWYpeeehUg
	 gFJIhvprtrhqxxgcl9q0BN7BHha/61yJPKpbpawXceXtk/+NnHjQmdrg8yewz6D2Htw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=;
	b=gw35aQadPqMWM77+FBvZfavj+xFwyOnWKfMwJPZPApdwMu+c9x4buK+uWE2KeiG/bFOi
	 LjQQ7G1vwMjwkWEhbdNpx1aTQtFRY4/Zc35aoaGq47H7IF0lDpmVFHqmub5xyfLc+i5zA
	 j1ODfStRKiyCvd7snIcSSVS2Xb0LkBIsWFHbI5U7mk1HwNSOb8jRDqvdaGW0YYMHxMnxj
	 Ql2JTQs0r1wVZoSS2OFn12orV+lXaUb01ZdWPWQHZ6Lae5dsvzUt81ogIPZnbQwSBactK
	 bc4bp4xz28ec1W9tZpCrC1KRMb2hARLLoqrfATGtXY0jEtd8p/WW3IWfmBQ75rffstA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEV4faAH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWxeJJr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B2606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4B2606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEV4faAH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWxeJJr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9DsqH4092512
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=; b=iEV4faAH6AEwx0yK
	M8mdfguFa67BDVndXkch3vGD1FgznzpBchyXDhGoZPawVNC1dGjOQvR25hpW3Xm5
	gYz8OciFHmJZC1PAWKdsA6NTFwNc3jT87CbXxksERiEUcwN9EUi67VRrQW/QtPqm
	dhg4Qk/mThJZB+x/uQAcwelSZm8sIFBG0vn+u1G+NZ81DGD7R3ZPcaIL9qNneVq0
	0bbqu0E3mPhjh3nSQTBEcFMGntolMHPmaok+g03Lc61oY0Qzq3Rdpp7nXapZHY3i
	nDRRC3D+HBu1Plz+rpNbp4LrtHjqj1aW0nuIjHP1fW2yWkPPSSksSIGFWU0mpl+0
	nzom3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jyep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:18:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so3077947eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489527; x=1795094327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=;
        b=YAWxeJJrmwgtpLdrXgRxtWdhAHbyFVdp8oXahHIP0oYMmIVLxpn9Po7ZDdTgUQuVeH
         gxiuxJsZoXYKRazaTliQHaMjlYuJ/dzkgDCu+kg37puDm7BdMkaY7Lo41sczo9STlmtd
         UKHDnY+tafrAEIpyhnFjttObXI2+ryWuwfVVfYQgcz8JT1v//9qcnt62bW87LYtI15u1
         +KimLqtNrClzQ0JezqoCjTNPXS5Zog2RPhJP6ZRwmtlaIXyQLCSxUeU2D1oKOOq7N+ul
         xYsNu8ncNpY6kAuPQ2xnEQO8g9Rlc6iG/iUGEpJ4OzFp8RDc3OM8JwqrsUoL1XXXNKp7
         VOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489527; x=1795094327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYKf+BSxd2cb15fIXmB9GOlvMtwvtc8EHKSqZ6YcNI0=;
        b=1Mee0erhol1SC9iTwgYbI02ULH01zOedvwAFW5G9gcRSswYlDr0Ep8A2j8mUmzSbmd
         pzFkn8c4a6X4INhojyl+octRHgskSoGTyaat/LhtEjx6YjJvruOUxvCOI9pXz1XALUpW
         JsyXyPLIyJwTulGCA4Z32Ssu9vNQEF7el5T0XnF5B99jLgV/7swC+xCj1oAncLcABsJ9
         UzHLDX2qAXzWbB0YTdVXs432w/XL57gcOP8bL5Lpw89tLix6WwTdEFCb3WuvL5L+0Vbz
         k3MgwWa4vzjupC333j++N654v+8me/EO2myfKAgV6iionjbqScSbaQB87bZOqG2cbqzY
         jw7w==
X-Forwarded-Encrypted: i=1; AL+hErGgDgxwSCnhxocL9pEGMOrVd+6xn5YmY534GO3ISR/nyZ7QnQE3J2jDrh6rRYwy4MrSZC2ZDQTlyKyPB2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m9ioK10dOnJDpbTE++ewaQSxz2Kdbcp0m5KFn8Y5Yvu2P1imK
	jhaVQCkthe/9S0oZ4QACddWLYWwz0qhR3JE21b0eYc4PArO/8qc4OYkvVn4o4H6Jk8r4gfiC4L8
	JsElKObltk79sVsAn5By6qnBcR4mwC5JBBE1QGOoajEXAA39lqjKiXcn59qEwaViZ7Dg=
X-Gm-Gg: AYBFou2PEzgd/IVvjBLzONqiMdT1gs5u9REqh7qKgFyzXGeYNuwbuSE6C2yN6q0uqHN
	CCe4B2Jon1q/lCm0QmTMAliVPxUllIm/NYzJQDMZUlqrx4iKzVOoVN1QuRaL0DSuuCT3DhZbTKe
	pN9ax0pBnkpg2k+bc1pv8/P1IS2YGCrPmJDqQxcsWYclfk47ndH2mAHuwISmfPkBgfVNvkuO1eK
	xQgrrSFK/eoAzrLO0ZhgTduPb5joYLvZweuIZelAHpziUQW4CnaKRaE6N2eJB12nRujpGneHuGs
	86XM+J7xztDlFWqBmDOZK/rg931Lxj9G76H3mZNPadnQHD2UL4e9hpEXplVkHPgm4l8Bd1ZokW5
	qDY6/rheasLhFDicgBX7xgonkcfX812TYRYSRphIQC6mU13RKq2IODmUOUn+aLIfS9g6BSz3Jo8
	0z9a0wRqo=
X-Received: by 2002:a05:7300:ce01:b0:36a:1452:8dad with SMTP id 5a478bee46e88-3768636e3c6mr6130135eec.20.1794489526684;
        Thu, 12 Nov 2026 05:18:46 -0800 (PST)
X-Received: by 2002:a05:7300:ce01:b0:36a:1452:8dad with SMTP id 5a478bee46e88-3768636e3c6mr6130104eec.20.1794489526047;
        Thu, 12 Nov 2026 05:18:46 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm43798356eec.22.2026.11.12.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:18:45 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:48:18 +0530
Subject: [PATCH v2 2/2] ufs: ufs-qcom: Enable ICE before enabling crypto
 support
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
Message-Id: <20261112-qcom_ice_pm_enable-v2-2-177e454d6f22@oss.qualcomm.com>
References: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
In-Reply-To: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfXwdezAOqTrpTx
 7lZ+aswj0c6hARsYRKaBwcCW28UokLIxlROlY7oK6SZUrl0YcsoeORQIK8jxQiXp7d80hP4GaJz
 eExaUvJ90JBisI/UiJkLkfVsHUtcAqY=
X-Proofpoint-GUID: ygJWYRoK4U9aRIM3S2oCswHI7um20D3g
X-Proofpoint-ORIG-GUID: ygJWYRoK4U9aRIM3S2oCswHI7um20D3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX980xsHW5nxTv
 kmGR3MywBCCe+CRFZLdcTRxaC8fRwFlxykScDUZZAc9ec+HjjkXQ/vCuuBpiUjEINnXMTdsscmX
 LzaYCwllIHFUGEXHT5G3xlSsEDtFmsXDdq76a+TEIQgCq+254vxr1k3lE6G5LiVHKYDIjLEVwBa
 1uGu3qEPBtRWAOKVSaZ0KnnDfm7RinmlnfQPVxuJKZKMFSy/Wj3lU7PFh2KTlx+XKV/5vmD9kLd
 eD3wqZkdIENosY0D3QQxBNriir3ZQ4YwBxS4RJd0OtV82qflDCV0zWl8GM8d+0ScSbEDDHvPDxu
 0jDbod9Xjw79rHqIHsQTD18hXk8pEPqJMdvx6FHCSvVARQYJTXtFRiWZqX2yuzgG99dEhdjcR6K
 Iii4jyz/QZd20dgdcraWN6fXAO4PmReRsF6vVX4Tx09lC1h8a7Mw3HEgG2TBigNNONxLWux9TiT
 +s0t1Nv7nffRRP+kmvg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5bcb7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lF1qQ_KX37YNnQO-sMYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120052

ufs-qcom currently exposes UFS crypto profile and sets UFSHCD_CAP_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before ufs-qcom has explicitly enabled ICE.

Similar to MMC, enable ICE during ufs crypto init path to ensure ICE is
ready before blk-crypto can issue key programming calls.

Also call qcom_ice_enable() from HCE PRE_CHANGE path once crypto support
has been enabled. UFS controller reset can reset ICE state, and the UFS
core can reprogram keys during HCE start before POST_CHANGE.
Re-enabling ICE in PRE_CHANGE makes ICE ready before reset-time key
reprogramming and for any later ICE operation.

Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6afb8498b8c2..4ec400c5281b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -158,13 +158,15 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
 }
 
-static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
+static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops; /* forward decl */
+
+static inline int ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
 	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
-		qcom_ice_enable(host->ice);
-}
+		return qcom_ice_enable(host->ice);
 
-static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops; /* forward decl */
+	return 0;
+}
 
 static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 {
@@ -188,6 +190,12 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 
 	host->ice = ice;
 
+	err = qcom_ice_enable(host->ice);
+	if (err) {
+		dev_err(dev, "Failed to enable ICE: %d\n", err);
+		return err;
+	}
+
 	/* Initialize the blk_crypto_profile */
 
 	caps.reg_val = cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
@@ -318,11 +326,12 @@ static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 
 #else
 
-static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
+static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 {
+	return 0;
 }
 
-static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
+static inline int ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
 	return 0;
 }
@@ -636,12 +645,15 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		 * is initialized.
 		 */
 		err = ufs_qcom_enable_lane_clks(host);
+		if (err)
+			return err;
+
+		err = ufs_qcom_ice_enable(host);
 		break;
 	case POST_CHANGE:
 		/* check if UFS PHY moved from DISABLED to HIBERN8 */
 		err = ufs_qcom_check_hibern8(hba);
 		ufs_qcom_enable_hw_clk_gating(hba);
-		ufs_qcom_ice_enable(host);
 		ufs_qcom_config_ice_allocator(host);
 		break;
 	default:
@@ -660,10 +672,9 @@ static int ufs_qcom_fw_managed_hce_enable_notify(struct ufs_hba *hba,
 	switch (status) {
 	case PRE_CHANGE:
 		ufs_qcom_select_unipro_mode(host);
-		break;
+		return ufs_qcom_ice_enable(host);
 	case POST_CHANGE:
 		ufs_qcom_enable_hw_clk_gating(hba);
-		ufs_qcom_ice_enable(host);
 		break;
 	default:
 		dev_err(hba->dev, "Invalid status %d\n", status);

-- 
2.34.1

