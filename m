Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662736;
	b=OJsFiOH7LT/K+bO3BHUf/pzdl4oXpped34XfR1ptViP8bdkI0eOjSEI02x9Hoz2+SQU/
	 d/qXq2QbsSfTFoc73YmZZ1lfjnyk/ludunXrTlcJOTdNTf2wXFOaHXJ4H7jB+rsHL4NxD
	 HK4xVESVmCBnwa32WVLpmRz6VhH2E1OpaaFSSbIROIOkwveUuuLVBtLPCiAK+IO2x3Yqi
	 92xhQnpod3IF7yO+0olnWd03/ULShshtFARYKxcJl0NOBkM+yZcImf3SJomj9HhcilOlS
	 rLlHGBS1Q1icR6I2ZVHs7gVhbV53zyyj5QFXcL/hKjOxrdBFWCmgjZqS3xd8xmmXbAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LYt9rd0NfUvWvMCN389zamkO3Dpz4pDQJgC5BLvRDzI=;
	b=lIIvCQIaext8wS3ubvztcFmjEKazeArMW7jeaiw+mF5qIQXxtuUjxMZYl6BYEjEDZk4s
	 HH9R+4v58Eu5zSeoSoI46kvyVpBm7UvnLDAGyl872e4KCypnBwgSBQx0FHyQKMYtn/7PH
	 x5A7dubXVd0i8OkgKrcMNxCQQBib3OQ2mgBQg1jEvzH5lqFCL6FGVK3YmCUdEtj3e5bU6
	 zzQHxPouoAx5AzjJOMdulOOEg99zNTKIdAxdjOGlqwHK4IMI6eSAlUexLMnRjdhFr0BF2
	 Q2EnxPaem79Nm6xMNRJkV7SR7Iac9XcCdzB/yTCadRusj+Bzq1Mctc2ao+9PVZJ02fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7hWSRu9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0nZXerw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02339606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02339606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7hWSRu9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0nZXerw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70GXb3518230
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYt9rd0NfUvWvMCN389zamkO3Dpz4pDQJgC5BLvRDzI=; b=V7hWSRu9CGmPGUBC
	bZyvP3ha08wYeCIRvaVAPf/Gf0eROu3Z+K5s+mYmzYCcNhtpkElunwVNidvyEcPi
	MIUcxkQO/g+NQo5gc8XQ56j0TSEDKn/cUx1F0V/yqj8Zx+T1/T/y8CArBSPKlEdv
	L6l/yTVBr54ftOBjtjfq/ekDUhtwAlQm8F9anGn8Nu9e9H6MPALxkFwHiRefp30c
	ZsUQQINiFPylOoeuUrltHHHsislSUuXdAFY3rOz7yfSzwLpAufNChre5xP1NUCkl
	PZ6rveCA/3Ab3nzgeVEZhKC5tOvJx3BS7LNetHjJhglvgMcAYj/0xt/OeMR0lS/s
	rCgZaQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhrpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:52:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3157664eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662733; x=1793267533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYt9rd0NfUvWvMCN389zamkO3Dpz4pDQJgC5BLvRDzI=;
        b=S0nZXerwXws6OKBZcUgBzInHxXP4VFvZwXGQn90ulcWdVZuI6xhjVVUdP06YYAQEMJ
         fmlPZAJZjY88LUThaJxdXfTrdcl+rSczTm5LAUGQ9RggnRNQ0WJsCjITBGcDRGdGQH99
         ndNTQKbkDlqPWOEbocYjiMrPBsuBlgSa/6iNOhgt6d1aUTKxPi6/wvE+R9mvfZTvhzCq
         +ngDZkRMJEwV7ZKB7GWRp+XIjsYyPKgNy6pcu6ofEGOzptWhWnVfgKKdBDMWXG2UiyID
         8cFS1rVV8VOKB6rHj4Z/R+jKWC+x/IRv+DRbfy8lYhiEPT4KtoRssLt6tKvWHhGKbtTe
         uswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662733; x=1793267533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYt9rd0NfUvWvMCN389zamkO3Dpz4pDQJgC5BLvRDzI=;
        b=AevnKtl/gnrEoUrvTB+BaTtJygrbR4BKZiw9O5fmN47lhn6ZKXgUbpAFSP/mH7O6VO
         XQs0H4hoPfP+D7RCu88RNJpGSWHqRJVBHRKHiLeUMLD6EOhymSU4JTJ8rBtdDLBm3xNf
         JPyi+DkUfvSgeKe0pN8wpfLLMe57Bxb/OSBP61+9sR/NA5g2GAP0eSQTJrsvjkLZBPPe
         EFEGQNSeNOi/3I595sBYiSda5r60C0pf8QjHhGDnaDG8i8nh3lbobt2/VbrJu7KLvnyJ
         JJv361B8j16rPDopwQRQiVU27yo6/BmIKjIZyQEJFCQHuGAPpscdcmlRx+pqym18H5is
         9pyA==
X-Forwarded-Encrypted: i=1; AKwUvBxtdeEuUvXSF+/hEJmXxq74MECu45alKA6aSIZJVLU/UE5o18vOpUSuMLVEnR83ALzbm4Nv5FtrxJ8TgPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKflhWeCP9jY4lymcUWjNYOuT7tSY2lh6/vEvdYRdlMYG8t6jT
	iDmA+ZRu1aa6GmX0PqyTzjm/Ay043X7UTfBCLA+C7k/l/fgNhy94Klrba58jZeTYQvZFgg6GeWa
	pgdf+enD9EGoDLgcIurmGPHMFR1/tITFoBy3JRUgJ+thIGO7vfiro0KkcFNyAFqrotuU=
X-Gm-Gg: AYBFou2fDE9UT6W4tK+IKvIhvJaw1o/KPb/KOEKVI5KImMSFlnwk7nTWcRNg7v+oQV3
	8e/MWT/j020OzUZmUrw2MGfR3pgW+tzEoXDKQJ7fL39roewxqS5UAYMucv3Lw0BU6Lx+3c8XRoW
	wxthQSD0T3h6hineb0gAK7ovOt0LDxUIiDADbGrzsFc8rcFkwRTHMTtBNYJww3Qaze58TcpyX+v
	bw3FsPWdLFA+4HpAf87FFTqq/LykP4TA9u+n2irEm+ffX0/GC8NQ9u3NLLCFEwyLVjwbgglqPgJ
	OszYFcOJfbgZ6nETcFtNQloAVxy1ga70e+vFI/2FOFVCNor7yEcr4uiVvVfoPO8DIUlLODYGVQU
	fqyd+OEvbkHxTSuR+bbZtP7rv85D61z1Y
X-Received: by 2002:a05:7301:1885:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-3674ce2fd08mr6635036eec.7.1792662732872;
        Thu, 22 Oct 2026 02:52:12 -0700 (PDT)
X-Received: by 2002:a05:7301:1885:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-3674ce2fd08mr6635001eec.7.1792662732279;
        Thu, 22 Oct 2026 02:52:12 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm15742170eec.3.2026.10.22.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:52:11 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:21:51 +0530
Subject: [PATCH 2/3] ufs: ufs-qcom: Enable ICE before enabling crypto
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
Message-Id: <20261022-qcom_ice_pm_enable-v1-2-f7a84086c651@oss.qualcomm.com>
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
In-Reply-To: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX3eAojgWIOITg
 AMXBQYaTIDVvxDlQFU2bUNMsfoML8ruW5+ySq29ConUT7kfQH7lfpte9DjKEQJ9U6ZEN+dqNn4u
 tLjME7+OF8KK3RV3fkhN2ImuO91B2USB60P1BGVrDMu8LOzL8lXtHrMoY4H+OouJPjSDgeelvTd
 4em2D7pokp0nv/N9lhkNDq6f9WsjGHPG+oT7ceXO2YqYF55NCLQOUI26swP0V1r1mPktPVSw/8h
 +XLImdDvaybaWBP6naiumzvbkD59H/42QZaxfnC3qLSH9SuDPlndK1M3hPzLNlwHVhvjskMvh/s
 CxI81AM9OZC7B0JBMRez7NfQZok0Tk/IBva1WwQXSqNVQJsVNAoctYULuHCXWoPXIUoXNSqzUwg
 dVzlE/AcmraRWD202bjs4JxoL8xNcO8xGWHElzSUaHDnVmGMBbbdVAkQKyYGr9S3T56fuNJwsyd
 s7R6A6ct80q/zmBhulQ==
X-Proofpoint-GUID: RtCCoh6jLfK9cX_633UaunxfDNE7mHvt
X-Proofpoint-ORIG-GUID: RtCCoh6jLfK9cX_633UaunxfDNE7mHvt
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9dccd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=poJO1rpmugtNz4m0g9UA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX4t6ec4m579dG
 e9oIyW998xZoZV/k5dB4c9XyH+QaZp63DU43bc6rDz6wRKKn48/0ronLP7u2BhvUOL5NuNsRfbU
 tpzu2oJJWD296kTXxquv1ESx+CQsfhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

ufs-qcom currently exposes UFS crypto profile and sets UFSHCD_CAP_CRYPTO
before enabling ICE. This leaves a window where blk-crypto can issue
keyslot programming calls before ufs-qcom has explicitly enabled ICE.

Similar to MMC, UFS also works today as ICE clocks remain enabled after
the probe, but it should not rely on that implicit clock state. Once ICE
supports runtime PM, ICE clocks can be suspended after probe, and
accessing ICE registers before qcom_ice_enable() call can fail due to
unclocked register access in qcom_ice_program_key().

Enable ICE during ufs crypto init path to ensure ICE is ready before
blk-crypto can issue key programming calls.

Also call qcom_ice_enable() from HCE PRE_CHANGE path once crypto support
has been enabled. UFS controller reset can reset ICE state, and the UFS
core can reprogram keys during HCE start before POST_CHANGE.
Re-enabling ICE in PRE_CHANGE makes ICE ready before reset-time key
reprogramming and for any later ICE operation.

Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index fee9b54ba5e1..7e5aa4573e0c 100644
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

