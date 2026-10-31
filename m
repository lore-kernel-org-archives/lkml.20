Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478817;
	b=iF9hGCH385xMu3x0yTikttT8TW6ImgKOc9cBBZpmxx+0lzjgIXMGXFnaNYaXbiPxwfpy
	 igG23fiBeIoxhEIaWhA6c5k3KMrcjy18IyXbD+GFh4LvwdxuNeBsaZL6ktj2iO0BmGCvZ
	 gQyO+xTYg+1pGVlxuqshZ1nhWxO6085csTgfnXtlK+JV1XBS5o9ZanXv2NQyoyRtHHZPK
	 i+nZW8PV/G8GAsH2Hq6StbpdYOc2WTUHrpVNxaZT1/V/bAFbT6h9/p1N/ZJtwBKw86cF1
	 ygRyh8DrstNxEKtZltqy2dQHcy3+lDh2fEUMBX5vr7hinpjJeHRqXRj6DuG5EznoKpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kTuh3fPFQE+RsK1pP0e5pRuUCh3v0uJMIAOGrhkCOHY=;
	b=waoDGYmmnGPiYU5AdUKdsET0Qn7wTk/aJdt7PilN/oxzH4iAEYr7SB396QntZnqg5AtK
	 tTFH4j/d5Qoe4IH/j45CfFxac6D1ZB25baItusVO37rVJBIuCGLJPh+8yRRWxML5DNM5q
	 ueF9FOttMSm07TrHdZnUV1Beqo7/iTvgdI9Ov7Ak4jSkGa5ochEcVIk/RrP3BjRa9grz5
	 5XBiF6r/HJLG0Y5FE+uXZX9Hsvxad0iQXasJz34gkCxrVWQ7bI+k/ES+NThDxaMg+aPCy
	 pZXnPvfLnH3pyyE2DIz9l8EotL2L3ll4JNAqO2lIZY+G369hmCXAVR6Zm3DHA3zcIOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=pcJ76rFt;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Y7AKEDNS;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D4C606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D4C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=pcJ76rFt;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Y7AKEDNS
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDmUWM3266663
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=kTuh
	3fPFQE+RsK1pP0e5pRuUCh3v0uJMIAOGrhkCOHY=; b=pcJ76rFtxFkJVl+ONgPe
	beDCMsOuIG4HcFtOofrRFNr000uYINp6Zv0oIrEjeBxJa1c9aJvqmDKj3wINJFrD
	lJkAx7rbIAI+Ffsha44cGmFB8y+jNylXBqeqtY6mb+AgH8OOck7h0tGd0Cwjj84r
	n71MjNZRAbGe6yoGyG2r7tvYgvIRhAJhUKlWFy2feEq5ay+A74pGIZGdqrS2aQpZ
	aN15HM3qpGjNOiAljxtRGpIEExViQvg2Pwyuqw8/hlCB42NTc/2fWDKXplt5dnUh
	BljkAZVXitn75HnYmUxf5j1oEbxYgAvUk/xTUsoJwuP5VDT4QICI/U33CKadK1i1
	ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hncgqb521-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:33:35 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso308504185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793478814; x=1794083614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTuh3fPFQE+RsK1pP0e5pRuUCh3v0uJMIAOGrhkCOHY=;
        b=Y7AKEDNSDE77O1SC/w38S3UQdimXSCy9EbRR/FQe585mYRQZwdeFBcIBr8yEKbzV8W
         zahylL7ypObZrRfUggTVJER1yNXMLojfmvPrFgUDjTv9MawcXaSgryoDDsoaoHeyREuz
         YoroZdL+HCtkxgaD58dEpgvCkzGUoiOq6+Ks0hhAbuaU9m0PrdX4y0kJBSOud/4he6ex
         S5N3wiRXa+a+eugykcjx4CGQCvtxzT+VHJDbH4ltYA91hTbpU557gXiKlYC8vbwwA+gv
         sDfMlExS/To/q3F+ITtXNWAeItuiw6DDHcxuCEgNLax2FJVvM2z5C2ZfY66u7jIszsIy
         1bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478814; x=1794083614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTuh3fPFQE+RsK1pP0e5pRuUCh3v0uJMIAOGrhkCOHY=;
        b=10QTdi4QzD5slB8prxIqC4vZeViMztX5rcERCn044W55Wx7AXZzQS4yKUtpy52WINB
         LCSPe73Cz3mmiTHuBao64TVGNekxU5Ox48dMf/9iSy5KABHsIKJayUPAqv+OnKdOtTx9
         r5cz2Wh0KVvxvVOXK1ZkMUyohvF0hKwykUzvWE32ZjoYAFuyQ53eyixjMg2eUVGYUUNJ
         7AFceMlRmu1ATuEd2nVAYBkN2AwXQfxKeescWFbwWstE6+MQdVAb/taePrhbcookDdp3
         SEj3o1yYebQaMfyPfr0M2Y4LpZ3LZzyIr7F3x4Qp+gXnPqSa69+axEm0k5WqHTchLeA3
         rtFw==
X-Forwarded-Encrypted: i=1; AKwUvBwh5b7FKy3MJ8JsT0pnIuB1Zsy8ktKLd60MTC3+XlBL+UEBF8S/9N8zuNm5mNDvKjhz4JnBHN3Jat8ASa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPMHs9bLW+TP4ho82BEEBNXslJ97SgHQTyYHhFR2QOStvvjELn
	xx2gg+n9qHjsxmUMVUBxnwdXedm9Lu7yJJ4bq1aDiUKFj/PFH7GCY/UPdabLFg/TNxO8uX2hfut
	JRUVhmW8uwlJUGndnGif+u5rmwpNrso17jvVeTsnQp6U7FnDFOmQuaEs0YpGYTA==
X-Gm-Gg: AYBFou2tkMO0YuZuFa/vp+rAhyqSqzCamDCcjfy9lsVQWC+FX9MVdK6vdYaAtZqclbP
	REteCPCfb570ul5ME7z9P4bSetrl/popxsMJDsIiqnrVBWLndkLf6uHNRksFN00DOjh1kE5h7pL
	jnQsyQWMa42EH9Ibn62gXb6KOrcOpkxdOvlUOI53lQuD6sSWhqgAlBSntxOpgnBOIm9a3QXugt5
	JvkDz1Zvm+DAAUAcmDHT+qimi/Q+enp3E3+FDaKMf38hDEDJiPlBvfW8GFlWPH6MV9BqI+ly3KK
	Qm+qbHwo8sBDruVHOcLbsP4AYlU2pQ7m0H8bFxxDE9Kj6QAmR2XwI/YPA057NtIqeworKtpIqGh
	COCq/8nrcbe0/rOYNZOtdmdNx6S3UTTV00l0XGBSVj6QFiEe7TnlyM1uPIyA=
X-Received: by 2002:a05:620a:2686:b0:93e:9292:1b9e with SMTP id af79cd13be357-944215817c1mr877318485a.1.1793478814342;
        Sat, 31 Oct 2026 13:33:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2686:b0:93e:9292:1b9e with SMTP id af79cd13be357-944215817c1mr877315985a.1.1793478813823;
        Sat, 31 Oct 2026 13:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm10019650f8f.36.2026.10.31.13.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:33:32 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 16:33:18 -0400
Subject: [PATCH 1/2] iommu: free dev->iommu when iommu_fwspec_init() cannot
 allocate the fwspec
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
Message-Id: <20261031-iommufd-folio-dirty-v1-1-2cef66d2d6d1@columbia.edu>
References: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
In-Reply-To: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
To: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793478807; l=1832;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=GYzaNKZE2bNcDpg5+Vf3PfGs+rkfapFAcXrezSUB6t4=;
 b=juLcHRoT+rfjskMczM+EFC1pZ9p+jeQ6Vz0Z3+flSqZR9iJwTZebhtMbbO5UmciybEuKSWMBn
 bx/g0/aKysrCQMwpY/Mrl6sCychBCjaG545kIpAa9PBEm/7YPzZyfKa
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: L4NAtuyr-kr10bj_GQwSpcrW1xHcVo1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXxW0kVDcZh1P3
 1ZOY+3mzYw1Nx9lKKEHbNVZPAebk9smRoEkLM920YPbuuEQbetIsojjLi0kqKu30Th7O2CtEevS
 Kxcd5aerg9hOzDx2yQnwAb6I66dHmMC8sCB9Ie1Cr/b6a7wXWHzc6vvt6N67GPSJ66WKn5vu+EN
 fFFM38fQgG4F+1k3DWgeKYjP4WBrvvd+nuh12PURxknPNKnjEC34M/b3twyJhgUXygQlnfdjJ4l
 LHVxoScbSdr4pW87AeIQ0xfv3UaLgxDb7RWAyH3h2HWuqYdcKZBG/SZo1oikeKu0iQL1kYCvWGZ
 97LWnX17XPuUmLy/Vijn543KPQEfwyBtlKemg+SRMSblCkLTpb3sY3RZKRaG1b2sKXzFGe0/s1m
 upw103AcaWhBaT3hMLX/Q5B/2IzpIfImPDUGvSY9mZlhTiso9DZkGMUDQT5ple/aSInt2vMaCe/
 Yf1+lLtTyGZ8uBJAhKA==
X-Proofpoint-GUID: L4NAtuyr-kr10bj_GQwSpcrW1xHcVo1t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX+0y5hYHDdVEO
 83vQ+D+PrZKQqCTbLIDqnPgXd12HlzmmdIYj5S4o5TXBeWL04QDt1r7oMZvHVW/KRAiESV33Amz
 K7Tn7SfpQoNO4GUD+hMN7HtKwp41Ua0RP/+73xvX9y1ewPrOid5T
X-Authority-Analysis: v=2.4 cv=ZIpCCn7b c=1 sm=1 tr=0 ts=6ae6509f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=_oc4-Chm3xCJoojDiZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=10 impostorscore=10 suspectscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310081

iommu_fwspec_init() allocates dev->iommu with dev_iommu_get() and then
the fwspec. If the fwspec allocation fails it returns -ENOMEM but leaves
dev->iommu allocated, and it leaks.

kmemleak reports it when iommufd_fail_nth injects the allocation
failure:

  unreferenced object 0xffff88811c138b00 (size 192):
    comm "iommufd_fail_nt", pid 783
    backtrace:
      __kmalloc_cache_noprof
      dev_iommu_get
      iommu_fwspec_init
      iommu_mock_device_add
      iommufd_test
      iommufd_fops_ioctl

Free dev->iommu on failure if this call allocated it. iommu_init_device()
allocates it before calling into the driver and frees it on its own
error path, so leave it alone in that case.

Fixes: 72acd9df18f1 ("iommu: Move iommu_fwspec to struct dev_iommu")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/iommu/iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9a..69be8819e05d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3074,6 +3074,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
 {
 	const struct iommu_device *iommu = iommu_from_fwnode(iommu_fwnode);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	bool new_iommu = !dev->iommu;
 
 	if (!iommu)
 		return driver_deferred_probe_check_state(dev);
@@ -3088,8 +3089,11 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode)
 
 	/* Preallocate for the overwhelmingly common case of 1 ID */
 	fwspec = kzalloc_flex(*fwspec, ids, 1);
-	if (!fwspec)
+	if (!fwspec) {
+		if (new_iommu)
+			dev_iommu_free(dev);
 		return -ENOMEM;
+	}
 
 	fwnode_handle_get(iommu_fwnode);
 	fwspec->iommu_fwnode = iommu_fwnode;

-- 
2.39.5

