Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395984;
	b=LUpE6ldWBoLHe4NlOLVkVPYx22vaJxn1yrcK8xI6k8KaJ5AYPayohVU/DD+ZYC86JdQP
	 p+MkYK13NQHqkmnZCDfyRLsm3BkFAC0u7ms8MheP3yDMyknvIfAGODfQHmuIgY765ZEUV
	 yHCl3OK57MS6AIidHtHDr/NjP3SabQiEgVlvKr3+CAvlwNuq1BDRRih59hEKbhsqjYgj0
	 RHGGDPsjekZUg8lBAcDKr5UKpTeRnOYrD7JMpD9DMElRNMoK0RAjS8r1NVmxAem4m8Bf0
	 RAI9KaQqJFpuisXRLZhaIE0ss+GLuEGXkRwcEtsaf7GxUisMszhVacJQMigQ6yTaZEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
	b=gsmCIFkXm5njDXznuZG//fHdPvpryARP2TKHxuujgCtmN6xkB0172up2lseKj862mn12
	 ZJgJbvE1JfJNGQQDdE/s5k6mX69jLQDwYCaQLKqWNZfQ/GoxNhE4OqZm5qx1lym1fdjLf
	 OJ97b+YIzU+W7zOVwbxNFVfEeOAGcKNo+mP2utvmOZzIp798K+uBqVdB7zoCxEaD4YpVM
	 eIdh+DTSLviy+UZDavvVHAwU58Lf25uR7IwBZNJHyD5UQDosOI0SuHrcvkDnbJvbrw7Gk
	 ku9clhqNUWRudrXK/3a6xba3CdJs7L4+3kfltWgsCXfR97wYja4ezXTPTidCaIxQCuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3lnNYnC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lf8zMrVb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6A606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C6A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3lnNYnC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lf8zMrVb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAuL3824569
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CR0OA6ftLKP
	m+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=; b=L3lnNYnCplL/j/FL25Zbv+jeEQg
	OslyFEguab62vIJ+leaeZ0mgUbPfO6XZZDDpLGruk5yvEX5NWzEPfEtUWe+zsu4W
	V8gDJV10HFMiwM1NZTm7mnOa9yXqdhHE3tA/YJQt7GNpmb8qxoErVS/fgu1hJVn+
	zbZ+kmMffSEoJ0tPkqmFHTVMnjrfDOQD8An5WioBpNrQQytTCbLUFre0Y0LuFk7x
	j0DjdIjVKIRIIAzFTmMhLqEvwD8CY4aUewQaTfejbZJgwAJcvfbGy/AubkcQZXQL
	5XTsg0SMzlYWF+DuqJBOfDzum481CAxsdx+ouIfiIQL/M1Bzvil9nZY6sgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0849t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so17525105ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395982; x=1794000782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
        b=Lf8zMrVb2+JGbhf7sCbstuqeLfvwJfBZ6Bh09vfiUpErva+wSv3S9IWeO+q3vhQvn7
         rTz+s/xnmz02ma5ugtuVzVW6XoELx1Ft8qRycHI6gAAPopyFErThC+qqU6TZUDm3EYVu
         MnPKidpW7GOCkC+LItZ08VhAQY+Wu8VOelGwnaN3dLFp6A0EdXi9ssaWLctyPZhVLy7C
         /j52bS9OJqYC81uDdTKLdiJCouNeRODPA1UGcY/GpJ1MW/rBDATfGxvpnYtrOTmpwNGs
         V1gStjRDaY04rGkACWKVVyBgOh5EggmPrHrnMzGBa1ztSJYVO9bdQhG30IJM8o6FQ3dI
         1qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395982; x=1794000782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CR0OA6ftLKPm+mGkPsiROgpxTN7mmkcVrmLFwZqhkUI=;
        b=0oDFJn0tuVCpPbwLwqAQZFPpxbqP+dcmKu5vZNvnlwC52xmZm2yzyX6F0enmsJXzWY
         n6bPIfILE13v09CvMP8VR6fOvRN8lK3YT0c30RmCpIZh8Rvx4BVZS6bR17rxvpHS+FjN
         /PP7z1OOoTwkkWnhdSEuDNTuuEiecspIqPXPHkZPTEhgYd9oNNJUFOakoiuImDaNtfSI
         eUpAA+o/bp/iviZvCLsodSBUk682KPmrteLoyfx3IEHE5kqW1a3yjeqmyIeeWaLwLHkP
         k4S3KXBK1zI1VrfbZ9YVwvTIZ1OLsrZLGrGPhw712dZ+c69WLCJ/xo5l/NOL2/M1CYHb
         6Zdw==
X-Forwarded-Encrypted: i=1; AKwUvBwFFJwjRWFzIQ6piZOHjy+P4paw8Gq9i/3M4uvWL9fCUXGZG1m8k9XgEObVSFkymcXIrCm0WQQWA7FjjqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4BQLfnOkawB9GwZ3a9lrqHY21S0r1oKiTWGiVbcTzd5vVVQvi
	QIaB7EBvuMUrJwtB3w7MJ3r86bSftet4Xg/jje9G2DZJdH+EdpvrE7EZtTX38AbR7ba8KzT73xu
	FQi9Ciy0/gMMmnXjKo8SsDKtqioD6vMVa/LGgYJB9z6xlqh7UvLAwoa+NQrXo1YcxHIs=
X-Gm-Gg: AYBFou3nAka4zJnUBpy+M6sGkffzVC2pBKy1RuCgoYvVVj/wgJMg4RE+l54PxFAWXSU
	GQXJ2hvWkLX6f/wba2SoQ8biQhgJ/8iaLlPzeio5blXNbcxDKuoVnQQnwHBL1VobbeEMcKL51c6
	WJlFpRZTkdecdTuyjRIY42CPGqa539uRIcf5LTr/KyRPbeJ6/cFQNybJ/6VZtCY7pKeNwWPEHPu
	yqQm8MZrp2kOibEXWXFP+2vCHGfjJ3qspMdPICICAeeCGS7HTCRsrkGuVCvxNBv/IP8dg9+rP58
	Y1RPMgVA1IRrXYtiE2+WUXu+s02dyC7h25rZdyBzAnil0yuvN/KOWk91dJOEPksfFN0Ctmt1gqs
	RK0suZj56jADMWfVmPWCLu4J3DsNxsdULFXzm9TUXOFO92qm/lymztc07jtvXPskyiaEszokIRg
	uX41VjdTCOODtD9viHgzQLmQ==
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr37788955ad.17.1793395982234;
        Fri, 30 Oct 2026 14:33:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2eb3649bef0mr37788695ad.17.1793395981808;
        Fri, 30 Oct 2026 14:33:01 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39265090sm11490155ad.41.2026.10.30.14.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:33:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/6] drm/msm: Convert iommu map/unmap to helpers
Date: Fri, 30 Oct 2026 14:32:46 -0700
Message-ID: <20261030213251.55365-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nqr7y2bgLiW9HP-hKHgTLHgsLytvRSix
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae50d0f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=3T_YcleVrN8O_gWOTnoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXyjVgmCdwI1bL
 60BAFXjAxIR9+/Tow/V7T9S6QH6uTt5PQzi/h4EbB+yvKNWGLKsoz+NiRoBNFa0sfM4BjL1y9G+
 4CQ1/3q/NQvE6o1unU+O2Wqvlro5oY1vKD7WniqRZuUC9DdShHixQQndl/JHI5ZfuLjyk8dSipo
 u5Bs/MLRu0jcSnJ6gE9EasnVgu+VcVRvrB2I3mHYCUNKLO8Orwq6varEFMZ5B6g4jv2eM3m/6hE
 FPbKImFoaiMc4sASbunBissK3sO/T+6QcS+Rudnmp1aQu83LgCd1Gft54nuhC8mEKVuWl7nenQ7
 LsN18Sd5FdMXIKxUMkFqRhOUmyjMg4oDEe7OjnW0LSA4v9ad2fJOwUobbPzL7LpJx8WUuYCoWnS
 kORHNq+zvwI0QUG9l51dsJsGI4yHus9uE+8so+BwlferOv8o+zelZY8oq44f75jSFtHcfrSe9XT
 /oZRjIBN7stGDmktWIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX4ipL4oVrcbp2
 G8/NAicXLzZfn9JIWE+jFAf7eUUcI2e531xx1ZaS87vFBxfbG8UmSQppllgSPgZawTKdBFFin9I
 qx2wVpGbqfNBwC3/DjBObpbiPC5dGOk=
X-Proofpoint-ORIG-GUID: Nqr7y2bgLiW9HP-hKHgTLHgsLytvRSix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Re-use the previously introduced map/unmap helpers in the iommu path
(TTBR1 for GPU, ie. kernel managed buffers, and display/etc).

The callbacks work in terms of iommu_domain/ops instead of io_pgtable.
It would be kinda nice to just deal with io_pgtable, but the tlb ops
that arm-smmu uses for it's own io_pgtable require doing runpm, which
we wouldn't otherwise be able to do.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 43 ++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 5c13ad6d5a36..479e5450a4dc 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -731,12 +731,38 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	iommu_detach_device(iommu->domain, mmu->dev);
 }
 
+static size_t
+__unmap_iommu(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->unmap_pages(domain, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_iommu(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	    size_t pgcount, int prot, size_t *mapped)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->map_pages(domain, iova, paddr, pgsize, pgcount,
+				      prot, GFP_KERNEL, mapped);
+}
+
+static void
+__flush_iommu(void *arg)
+{
+	struct iommu_domain *domain = arg;
+	iommu_flush_iotlb_all(domain);
+}
+
+static const struct map_ops iommu_ops = {
+	__unmap_iommu, __map_iommu, __flush_iommu
+};
+
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 struct sg_table *sgt, size_t off, size_t len,
 			 int prot)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	ssize_t ret;
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	WARN_ON(off != 0);
 
@@ -744,23 +770,18 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	if (ret < 0)
-		return ret;
-
-	return (ret == len) ? 0 : -EINVAL;
+	return __do_map(domain->pgsize_bitmap, iova, sgt, off, len, prot,
+			domain, &iommu_ops);
 }
 
 static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	iommu_unmap(iommu->domain, iova, len);
-
-	return 0;
+	return __do_unmap(domain->pgsize_bitmap, iova, len, domain, &iommu_ops);
 }
 
 static void msm_iommu_destroy(struct msm_mmu *mmu)
-- 
2.56.0

