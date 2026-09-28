Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045F4D7D47
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605937; cv=none; b=sWf1RKTMMn9wU497FNyt9Z/BGfc1Q9+CSXDDvl8X74DMpdM66m+YJNU4luqiRR2WNaQ2cCYlvDB0sFTFfvLRJ4HTyEqcN4WpxaTSgHoYNdz54zD06wQhjGR9JIo9p3nuy1h88KXb5rnrFUb2Fq6ep53jQR+faoALfGrmNFNT5Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605937; c=relaxed/simple;
	bh=CaC+DGtWJjwAqbEthgYpBOFABVsZnZQjzVWIplMfmvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHVU3R1bnfacobi0mC+0tCiIMvFfjUd3Xc778snbY3Y1SIgkzz6SX4NYgbreK8Gg62NPQc9J5k/E/i19FBZgkwv9w+r4DAL3ifEXrOKQXghtXz9PUijDpwo9I4jBXtirbZmQKwi/kzuR8/9v1W7UFgybSLLXiwjp/Cex59P+8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqtV9yvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1cUNFVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqtV9yvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1cUNFVm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SC60JA041869
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JEj5sNGlPSI
	l2VeO8kXPsfyM5B41IeUh30FccYbnAeE=; b=fqtV9yvyZMRv+2BDcCzmGqd4bu7
	uoPeUO4RAl2KdRrPVf5fHKtGKl/m3VpR65PJ++GqrjrE0bs1luViQsWOpnWxqrUG
	BYzC+0tZ6yVNO7Llz35/BU+El3NAKDP1iZ56B8VGxg0ebZ6dll9Bx+GR4WF1zw79
	RzAHA4paBWEz2cqB4Ymfv/21P5NIjrNPxJEUAwNTCeXqsAbG8CNOMCuPEq5O0IIa
	YaqdNvj7czkZH9/htZy4uMrAY5aiQA2xOFFfZ9ypXuG55JiCCF1UIygba1Lk7xJn
	Kku50sKAzmWRa1bMVd2accQVToJbjnOjCZ0aoXXbP+xb4Lopm2b6105p2yA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx38jvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:32:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97ca6578487so2575507241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605928; x=1791210728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEj5sNGlPSIl2VeO8kXPsfyM5B41IeUh30FccYbnAeE=;
        b=K1cUNFVm3ZaPdHrddOzOAs+Z0uV4hLFGYW98N4dEdq8IgAWRCQI4fytGMLJ5M+zWzn
         h7kswcHcaXMcvCGwRkgLR2suZLrVJq113+hPhfXd38taSji4B/HTktFgY0LBebaThb6Z
         6g+lbTycuzdchM+G6Rw0AtDFA/dInHxpQlYhV90A9McRK33zF4hs5HFYyZIm9lINZsLz
         2pqpf+TEDyoVOtlZ0WnlPWwfk23rZ4wOcny/GczyIngwQjkauLGe50ZO/sOhRqdP2a81
         /jzWAHxIC/B2Pz8/IdPueS9aR3ZWaow1CJsWdHVRhoEk7ozAQBdr09mIpy8drS8hOmtu
         mwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605928; x=1791210728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEj5sNGlPSIl2VeO8kXPsfyM5B41IeUh30FccYbnAeE=;
        b=qtow//znolEznZ2lnvxysV1eJEzGD8FLQPhMXqoO3oTZEH8dYgZXQL9GudA5XhBZHj
         MIm2xOh2omW3CHMwTRwM27/UYlA/Wnk3PG0cmTSLD64bDvSaPImvaTV9WMXTSMrwkFhL
         MhtPPOeQArSR9LiH5LwsSR3d7Nwkt2RfPSVMM29Ks/MywO/xAjL4dcR1u+Rm7M1SIepR
         H8Lv+heudclFiyWWjcM2piqQSW3XufW20Q43PGxhrSko/tOTCOVTxvj/DR/rMxirlRSY
         rTTDvdJNjvHzTRYhdO9pvaUCwVQ6tlBOI+cbypUQpIIGqQVHms9nudQPjNNSzM5b6w5a
         fGFg==
X-Forwarded-Encrypted: i=1; AKwUvBxtQcK55X1Wn5E6Wz79/zEWvKR1cb7IitRWG6bEv8ZDhanTworqjiiBjeXwLoUadM29sCndg7/rHqCAr6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu5Jx6nqD1ZRa84VB/9KCQ9lRn3wf1dPUTQVAnWchR0Iu+AsXW
	gIlkNg0a+RgTP7z5uY4aN3B6wCQHK/XoeyAW3LuC5rVPtyB4nWEXniB/n+RBABbWx3MlniZiAG5
	6gpc8zL/+X5Kqg2NtSQLCMIvBlWIk7YBIJnei67vScSVsDjWDhbTiL33dnenPr6B3PII=
X-Gm-Gg: AYBFou2u8kEfxvvA5m0WMlLwZ8wCO6SxxETu49fQIn+8wN9bChMtIjracyZQiYIBuHh
	zrbKBlJTl2f8Yx/iF2HmXQcCOb+QxdC+JvQOkrJ3tgyXJzxWILJLyRjnVEEGwpYPLiAojsXa2ZE
	YPSN18rQBkVLSfYrJ0z38tFw34ayyfDJ7MYkk+h47htc+RtSv4lM9m0Ex5fHBFPkUYm9T6+zdkK
	Ca+29F0jIOlUZQnH9IpUyZQu1OFNbSBPQk2Ez0XvLhfVXWZ9rW0JhiRWAezzODWfBl2TvUreUGW
	YTY2CY9gwgKZ54gk9Odfa8GZwFACC9NZtta5p1lOAHFjbj0ziDCkdjIKvDFcCQjfghPcCiHvWj6
	fIUiNtRQWLcpRpXthKlI7YoUNGiYOYk0K1GVDLQ==
X-Received: by 2002:a05:6102:a4f:b0:7b3:4af0:976 with SMTP id ada2fe7eead31-7b34af062e2mr2413930137.21.1790605928518;
        Mon, 28 Sep 2026 07:32:08 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:7b3:4af0:976 with SMTP id ada2fe7eead31-7b34af062e2mr2413665137.21.1790605918611;
        Mon, 28 Sep 2026 07:31:58 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76a68aasm470794566b.35.2026.09.28.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:57 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 06/14] iommu/riscv: Cache the programmed device context
Date: Mon, 28 Sep 2026 16:31:05 +0200
Message-ID: <20260928143113.49838-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX4jMvtAyQhq8B
 53Xb1wwW2B7RIdzPizWAcGaMtV2YTd1htSFlPYpXan+9ddrEecTUDggOC8oRrnpfUEirWW132JE
 7Msv0ejAIMEILguAUTD0hL8AqEcS3BmgoyrKCkXjJ9B9A8yhpRBhgXsw+fdATqTvpaWkR3gyhy3
 gh4VJNMnvgLo9Npe2FOt6D141B+D9Y5EmGoBP0jVymxbE3llbXwQhOKX5iZL9dt7R79Wh7jZtdY
 cT0ttnSENu3oXG/zBGy7sH1+w6pLu14vvYRivr0kMrHtMyvXWiaAEcnKSebzBI0a0BeNz0LGGUL
 Ma2pTQb5buP9si/2Izf4kg9u96DxK8KZMB3KOgv7aa2cCB1/j7pam0PoTkNTF3Qlkas7Q0k0teV
 9UQ2UZ5PVzAd2SeSyYfD1zmDDnoT69UumC7UC/MkMoHteJeNCOfbfJ0M4koERsuctoD37OlURIW
 +WWM7VqUlVxEOcd34SQ==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba7a69 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YF9vHHK6WIIsxUIbJtgA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Jd1s3Yt-DN685eI7acBgjUdFXnDSkYzY
X-Proofpoint-GUID: Jd1s3Yt-DN685eI7acBgjUdFXnDSkYzY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX1RBTTuYJUU0v
 GpPPHO3KFXq73/hYoxPaXyMs+bDLexe+eVJACfckGJHVHTsqjbrWDRew2Ib3HXOQxbJbwkpP5Lx
 tS9xUN2Pxwu3X9qkTgEwQo1WeppFUNg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057

Interrupt-remapping state needs to update the MSI fields of an existing
device context without rebuilding its translation fields. Keep the
software copy in the per-device information.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2cee87ffc122..86d5795a12dd 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
 	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_dc dc;
 	unsigned int nr_forwarded_irqs;
 };
 
@@ -1513,8 +1514,9 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		kfree(bond);
 		return -EBUSY;
 	}
+	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
-	riscv_iommu_iodir_update(dev, &dc);
+	riscv_iommu_iodir_update(dev, &info->dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
@@ -1668,7 +1670,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(dev, &dc);
+	info->dc = dc;
+	riscv_iommu_iodir_update(dev, &info->dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
@@ -1695,7 +1698,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(dev, &dc);
+	info->dc = dc;
+	riscv_iommu_iodir_update(dev, &info->dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
-- 
2.43.0

