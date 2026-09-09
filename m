Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62A489FCA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991528; cv=none; b=cdA+mOgns1pEH0ybBqUttVOELX9ja8ezRjV8blIOz5l/jRhDcYjERmkqhqcMbaT9m7kIWzvJl6rkYNgz+ughGwsptWUn5V8FmDWBsm/1VdfYoTEG6pNKC+lVk/L73Rn+MdLOPBctiL30du4WF0sGn3LBynYSJYcqv0W7Ta7H3J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991528; c=relaxed/simple;
	bh=gUvUBfvXAIVgjCzdiwV3/TF71eqAveqNX7ByY2W7Bng=;
	h=Message-ID:In-Reply-To:References:From:Subject:To:Cc:Date:
	 MIME-Version:Content-Type; b=BBRurcEP3aR/K++HfEY+y9rJeT1IXjGAsCPypFo4Tcq2TeG4x/1feBDJT4AoqZG9Ey8FBypJQuziNfHtmdVwBUCPR1u2Lr+HAbz60/9kvflP+cSDIkuGgMdWz1NX/uzu1VlXfyl8FMs7QwQdRS4kmPNK+tnahIQ6Rn4KXc7viQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=U440jBa4; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tgGO+if4; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="U440jBa4";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tgGO+if4"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689KYmbb1116630
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=l0kN
	/rDFN/f55aXR9L0fwoeC0Cq8ZY3zyzxNrCxyk5Q=; b=U440jBa4zt5XZQqSXjr3
	h6a8uj+m9eq8F/EPCTVNZhUwxBp7mVm8Js5AJ99ZaGjCfCQ3a+5hjjc4ZFOGf1+l
	LSPY76FSfg90vUn85AWJLfncpdaFJtDTXdgpdX+e3KzhmPsdcxNelLrqKNDXfG7z
	nkBryH0eX8CbCYWlbbisAN3gGmRmymvUYYSmdsxRjG1BdmeXViIPSmpJ6bO2arzm
	gSJfpLEC1ohfcupjxAwkI7V1zAvUxu3Tw21smdXH39M8CRlRcxg3GHYbBPK62HtF
	bGoIZyqxVYmXobYdtgkFHLzPrtPSjh4BvLbpGYLDNKJYjf3owKXHDDDGuYLOP41L
	ow==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gkcy11x85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:05:24 -0400 (EDT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66ce3040ea9so8986449d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788991524; x=1789596324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :subject:from:references:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0kN/rDFN/f55aXR9L0fwoeC0Cq8ZY3zyzxNrCxyk5Q=;
        b=tgGO+if46eWNe/HJIYYTuffi4ReZnwtixyoVGGFlwiMniBADIFuYF9KmAqgIZYr39S
         jwypkyBFYFllrVF913ECxr3EzA1JrUs5gKq1gvLD2NNiQRQg2Gn9RpYKqmAP42CFi6xP
         g20N8/oK6h+oO1wPp3Vo8xwIVBjzN49925Cz38O1MOntQL42muP61v6SK4sdrVgqEmFq
         0GB9OPcK3F3bmlDQC1NriF+eki76fiu0YTvHcx74Npfei02EFNtRZMK5bWMjcoXbVX2o
         ZwSVXCwe+kzggmf4NcykTX89nAH1r7DAWu13/cwufAQsY0o2baIcDb52gE6bpCY8fDZV
         HVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991524; x=1789596324;
        h=content-transfer-encoding:content-type:mime-version:date:cc:to
         :subject:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0kN/rDFN/f55aXR9L0fwoeC0Cq8ZY3zyzxNrCxyk5Q=;
        b=PCYsRq3qhDiMXyTfhLdnLmJY+DC7Hgfa+oScXqRfIvsU2NmyWyzV/o/KvJ1mwjrPQG
         K/IcjkJFQxPyR3DjRe/SbDtWkWlUBHr0WhXCFPB/liOb5Nh3S0/YvKwvcQcrsAR2DhZV
         ho2kGD6xspOFp0j0rDseTr+nf6mwoDwWMA+3LXjb0zrqqc4Urgtrey/fDZR+D+OkCmMx
         X5MBsju6cpN9OC66R1t8JHR991zFuIIs4689HFpjHYk411TL02RrCpbeD+fhNmVMb5m2
         ALbF6X4tYtzUK3ySccEhzAX1M5l3YZnFVoh0Cr9yYAx60aYYiAoXu9y8AxYks7skNOPb
         DszQ==
X-Forwarded-Encrypted: i=1; AKwUvByaRDOfBG2lioFfFTxrCJeRPKvrj9/0xxIUx9vdVT1Y18nHeaRqGnvpa24UoddtsIFapCmtxt1v3y1yEws=@vger.kernel.org
X-Gm-Message-State: AFuF++l7iFWSrES8+JjUO8DCDYGGYub0d7f1Ko4V5lHp6Tb5FxD5/8eD
	dqG3k0v5haFOT37tOr65w2aQfxY28PbMIwFfdQqXruXWraoA8HmfO+N2VHi07mcHCq7MK4VWyWQ
	jnQ1lWTs7ert3VhIoVeCCT4TryRikYyre6LwNrVh9HvR2K1aNPUfpot5W62UgPA==
X-Gm-Gg: AYBFou2+kd3wssBxE0JfgxWGKhmmViSNf6i8KtbfPSepCCMNx5H+Z2Mid88BKhH6ojA
	dhWGsGZ+dn5Z/NzWxx+nmwVp0m0or0CFuLBMFaadC5aK1FfznfTsvgV7QyEBxC5H9tBtenZkzyU
	f3l7bAp4gJgkT71R6Wu7ZDAdE9Ed7X4xyp3ygJXoN5SePt3dlhPkWyiM4c2C0UZJuFZQDZfh8bM
	+FfmCTFdZCeDNO7/+MpoMIkGgpF9jf9HxCX5ykT1MiRf/UKXvWac7tRNvNsLdnCpWROavQIrKX5
	TxcWAj4yPcrDlnc9bWseylHzbAwHbI1yFoOBJ+B62RTd4+qoO30H9iAhNU7GIWCf5g2dI6VLqiS
	YXlmpRmkcUj3Bi/PjYqie/7354E3FvUN0gw1XZJ6jqx+ukipV
X-Received: by 2002:a53:c847:0:b0:66d:1c78:5dd2 with SMTP id 956f58d0204a3-66fb5a6d546mr10813810d50.37.1788991524051;
        Wed, 09 Sep 2026 15:05:24 -0700 (PDT)
X-Received: by 2002:a53:c847:0:b0:66d:1c78:5dd2 with SMTP id 956f58d0204a3-66fb5a6d546mr10813779d50.37.1788991523534;
        Wed, 09 Sep 2026 15:05:23 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040693f75sm154018806d6.35.2026.09.09.15.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:05:20 -0700 (PDT)
Message-ID: <20260909-blkdev-fixes-v3-7-1a5222c6e8ad@columbia.edu>
In-Reply-To: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
References: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 7/7] block: remove dead metadata handling from the async
 direct I/O path
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
Date: Wed, 09 Sep 2026 18:05:14 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrWQbGrq c=1 sm=1 tr=0 ts=6aa1d824 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=IE87Obj3e0A1gCLlgTsA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0OCBTYWx0ZWRfXzoeXG1WMMTBX
 JgwJipBNAFV1cHz+43ajJHq5m/oQPTCUaP+v7l+8nD+Bu5yGTKOId1pAI3fHEtnBgk1oEMTgpAv
 GFN1SLtXbwdTUumXZarqHm5x7kyU5+ow80hoKi+pK3vaiv9/tXhh
X-Proofpoint-ORIG-GUID: GFlBqJxUp2QcfpbcAM6xMBkJEP28fXvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0OCBTYWx0ZWRfX7T2aRBNonqa+
 oQ+k9rHb5lZNq4B3ZNSp6KmGHS+nGUCZm4iFvb4Yh5ER4EG/MqrJJCvdyXE4w5yXngWwtKuLbKY
 M0v39/yoPgVEaiBQ2NfL8Tlk5GgZjnd/7ZaqBkbZfRw67Qyq7BaB+eC+GergHntzVA08Ey5yuo/
 rgmtvrX6c56M3fpOcWKUbLaSWjseJaTq2CWA+zFfYQFKX5WcujSBQHuCiuv0qFHYjx9vFyKBQLu
 4mqu9QGDNGdY8ZICSUmZ0Y6hHtG0D5DkJqHimvq4jhCp3ZP/Wf3ojmlfqqSYlzPJUOBburMnC60
 wATC5oMMel+FHOfGw2vyt/WOfOGBpF7rpfTnoN8YZZ/OVIcn6zBx8OPuxrKqf9Bc9NEJ7AfJthr
 +6iP8nZEb05BOIsi45R1Cv96cHXZIofoL1i2ajdGfzA+QbhjJ3zydoXSnKS1oHix7jLDbOWAKXa
 5P701SOZpT0aCItJCNQ==
X-Proofpoint-GUID: GFlBqJxUp2QcfpbcAM6xMBkJEP28fXvd
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=10 lowpriorityscore=10
 suspectscore=0 impostorscore=10 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090248

Since commit 2729a60bbfb9 ("block: don't silently ignore metadata for
sync read/write"), blkdev_direct_IO() sends every IOCB_HAS_METADATA
request to __blkdev_direct_IO(). Remove the now unreachable metadata
mapping in __blkdev_direct_IO_async() and the unmap in its completion
handler.

No functional change.

Assisted-by: Claude:claude-fable-5
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 0b614d76d128..6a86bffafa7a 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -306,9 +306,6 @@ static void blkdev_bio_end_io_async(struct bio *bio)
 		ret = blk_status_to_errno(bio->bi_status);
 	}
 
-	if (bio_integrity(bio))
-		bio_integrity_unmap_user(bio);
-
 	iocb->ki_complete(iocb, ret);
 
 	if (dio->flags & DIO_SHOULD_DIRTY) {
@@ -366,13 +363,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 		task_io_account_write(bio->bi_iter.bi_size);
 	}
 
-	if (iocb->ki_flags & IOCB_HAS_METADATA) {
-		ret = bio_integrity_map_iter(bio, iocb->private);
-		WRITE_ONCE(iocb->private, NULL);
-		if (unlikely(ret))
-			goto out_bio_put;
-	}
-
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		bio->bi_opf |= REQ_NOWAIT;
 
-- 
2.39.5


