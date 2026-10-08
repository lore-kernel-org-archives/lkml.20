Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B749B209
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455114; cv=none; b=NJTO6vFgPXMGP4s+pWng3n+f37MRLemWnK23rfCOSWmsU/OErRwaEFmtKSqjIbZW21DZingybvkiQX46U6gDF9/yN05DEJR/X27MJ6yhHz1OxClnjrOyJCBosfvpZ0fe2XxWINvNpKg3rmx3mHbKEz4N5OQpr32NjLC7rqAarGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455114; c=relaxed/simple;
	bh=JVDEnc6W/nlFzh2DR6tx5iRhgEzlxJ0zGLIfzPMjx6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HuDTSzqC0xdrpWSKSbLFHyuYHZVhdnEqMuKwpuSVRSK9ISs1ukKru0y3Rt9qwZtRD2uFron0fChN2xNqqPFPVH8T13wgkWo9M6D9rPGOvgNu9F4dB9UYYjsOmQJSNU7hCUfq6OuYJUVqcixIdCMWHk/TIQd7I4JDCH0x26KA9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WY6Pfn/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfduoUxp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WY6Pfn/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfduoUxp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOrP1846063
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=; b=WY6Pfn/0VtHVQSd4
	HSsygYMOlACdEpl2Yk8BtYF9QnbiDvPgFKV/3Wca1RoTJufr7kbGkGJ9lEnJaNm6
	w0LJP7QxQwEEPpDE2PwYjX2VLJzYIZhGR1cVNF+uM2aOEs3Cfw6dh+zuCI0hJAe2
	mzOtTT6K+GT0l3oIXqubsT12OaL+bJxGGv8QcpwAzijxPhHBbacO/CsixpxfbjMR
	3eYaj1IWUMnc5kZx0aXQGZL26X8cZdTvP0H9kXi3DwdWFhEBJCHdQTDcZ6mrLjsq
	25duVrjgV6toHkHAX+ATzi2sxddRZ2wttpYe1/+Rv9QAA63QR+FHqmSIDtAV/2JF
	BxMEgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jhp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:25:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso84768275ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455111; x=1792059911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=;
        b=XfduoUxp9Dux9kj+HEHnJcGK7iF3L6c7dDipOl+azhk56Wjd+GUzPFG4JaNHDKAPEN
         OnkRhhiXhbnGlCJig//cFbA7DNj+sZlRaxFQ55HQc+mZ7m1qXJrg11un3bou7bCkSwjo
         pw/PUDNJ+0JeTi95QczIbzf7sRoLEawX7HUJPRP13JzQpdrKJLUN+vtYXYgq9KmIrO6o
         yCqUjiFgwYjd7Paei4c5c9p1yQte+dj31GjPEP8gPyt6z+O1KWZyx5taTfkrVaTcsznW
         mr2OY0ZPRTo4u4OazOl+TX72VQ9RanP2JAiodUWUGn7VwjbredZHWj+DUftUlP73b+Ja
         r6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455111; x=1792059911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=;
        b=J6g8SvrFT4SCi0XrE9QTzD4t8LMqeSZo7bxmfKCva0af57v+ek9MemSTJSOUsKP165
         srEhvxhQyo8cVTAMqFQEkF946tSIg9ZqEQt+UKPTubywLlDnMVQwr2uicsRBEX5BQ5/n
         9QqIhBtTWETHEfAONJApUkVzWSQ69Te0ViZ4WERzQdBxBszjlgT6zQcwZdXNDpkgqtVf
         lGxHtEgGtBSL8ARRw+AWV8vmbcv7M67n7CyhlGwLcxbSDO8BIWSaNFgXVWkZROJ6F3pI
         ceah0T1Rj8p8L9TsNwEcKLVN7irFles1+nB9rI6G0kYZ118BfGd/qiNMqqyeud0mytPj
         mQCA==
X-Forwarded-Encrypted: i=1; AKwUvBxXA43fh0PoACVHcp+M/0MI6cRSALCQRRN0hueJ3RxXbqYLIfAC2IrIbByiYC2b89Ojqx6cHzqVmzAAmCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5wZHVcncjSpccqo33ZgccklBwDtm5rT9WNtE/mCwyV6qhwObM
	dydkCGsGKg0ka5YZdbIK+9yrdp7Fe8r61vDMx0BTOy9lwfouTRKEKa2NVmFd5X1QrZ+DWiqNfJl
	tKFCGkFEfp76tgudIJmfipe5uVQaVjodL5e5HOYA3C3rs4DcgihZ6TUZMcX3oBfkimaA=
X-Gm-Gg: AYBFou0Eu66gbPeKO6P+3VSyZYpEy4nFZEt742dbBHhg254pOgs4XFqWI8t81fr05YO
	2KcMxXXfcxD+IQLq3kgbkFfXxGQ9mxyIZExxO1sg/TROTzD94g09/mznAQgIej5WxVz4eYnTBsc
	XKvXTLziY45g+jobO6oOnKDkatuGtDEP0lTuY6k9zJag6vti8vLRBDWFYv4SC3eRPAstB3OkvdW
	6zqzdNPrzboTy0XXVM1phs7ox0J265FQxoVfebnPG++4y8UGZHOQThvUrOHD4Y/Slx1U8ygrNrm
	iOqoatAfCP5mkN6Rn400Ebw4EnZfG/rK8Mw/4Ly3of1n7c0w1T7/J586sF6s1P4EZ4wcPORkWGi
	PyLt5AzJqub69E1nmEkm8IvMQu711j7IYycfT8/903bd9GKmq7qmVPd0i0kqnjou9TPeGvO4Kde
	vbM2XBrj/n0+mNk4QHf4w5Hw==
X-Received: by 2002:a17:903:2b0b:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e6003c0633mr43801695ad.31.1791455111180;
        Thu, 08 Oct 2026 03:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2b0b:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e6003c0633mr43801505ad.31.1791455110634;
        Thu, 08 Oct 2026 03:25:10 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:10 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:09 +0530
Subject: [PATCH ath-next 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-13-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX3IHX3eb/yMyB
 IdfUoOop99MXaTTkLXmAvCcQQVpZT3tffxBUBIOGQeikyDNcDJ8CGa01binip9Y9eXFfYCtOaII
 KrWA/iPMTNdcIKZ/v2Gc4zitRNzr3kU=
X-Proofpoint-ORIG-GUID: tz5GFKzQxT-eFPzlczlZFBVLjUJkcGql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0pXYDLRj7Ta7
 ibIBCvCZ+aL9Fpl0QJX2yjZYZTr4Dn+CB26se74fgI2ICfcfRCLZdtpbuXIG6ZHjh8G9JSxXn2w
 tucAq0A23HCbx3LCfxvFemRyc4XVOhCTHB+B1ALlSpg/woYErGexcjzxs8LFVnLyBBgOXLQXqDB
 731igI5BZkdbosdCkOh5uqELJdlVHMScdW+eYDIIZUXgsnz/prLjT22FHzl3oLhn6j+2RSC4qMt
 UdZftw61NGMKefHhmgkctHgw2BrfQElc6ZkGwEMeU+qhS+LN58j6IFHp6jNcQ8ySWyaGTDN1bHw
 XPdkPGY0NR+DZVGyIGzoA7tXtpJG4zJqXSXnwIllb/2XZY9cRUmsb2S1BOfchVwG+NVEQ3aAOEi
 EPNPUygLlRp5Y44yYqHSC8QhIuzEQjQHh5IHkaeWQF8h83TQdv2C2AVSue1ZFGSVeDNx6s7xe6a
 xM9xiAGFdGJZTBHjkpg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76f88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: tz5GFKzQxT-eFPzlczlZFBVLjUJkcGql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

Use CMEM-specific write operations for Primary Page Table (PPT)
initialization on hybrid bus devices, which require special CMEM
access handling.

Propagate errors from CMEM writes during PPT initialization and
partner copy cache initialization. Abort MLO setup and perform
teardown if partner copy cache initialization fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/dp.c   | 30 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cc1c31e216bb..e9caa9216f77 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1140,8 +1140,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ag->num_devices; i++)
-		ath12k_dp_partner_cc_init(ag->ab[i]);
+	for (i = 0; i < ag->num_devices; i++) {
+		ret = ath12k_dp_partner_cc_init(ag->ab[i]);
+		if (ret)
+			goto err_mlo_teardown;
+	}
 
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..6cf254b2d2a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1307,8 +1307,8 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 			       enum ath12k_dp_desc_type type)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 cmem_base;
-	int i, start, end;
+	u32 cmem_base, val, addr;
+	int i, start, end, ret;
 
 	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
 
@@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	}
 
 	/* Write to PPT in CMEM */
-	for (i = start; i < end; i++)
-		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
-				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
+	for (i = start; i < end; i++) {
+		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
+		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
+
+		if (ab->hw_params->hybrid_bus_type) {
+			ret = ath12k_hif_cmem_write32(ab, addr, val);
+			if (ret)
+				return ret;
+		} else {
+			ath12k_hif_write32(ab, addr, val);
+		}
+	}
 
 	return 0;
 }
 
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		if (ag->ab[i] == ab)
 			continue;
 
-		ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]), ATH12K_DP_RX_DESC);
+		ret = ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]),
+					  ATH12K_DP_RX_DESC);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index c53eac20b989..b3a00e7dbf56 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -731,7 +731,7 @@ ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1

