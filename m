Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732638;
	b=m+7TX59JhVxPqHylyHPZfaCMFvvZZNsLO2vAbck3MHrEYY4FfWSJe8hxNQFacS4cKC0k
	 aPwVch+gQ1WqhxSnmOo6qIbqcI9Z0dNouMliuuhC3vEu2kmToZ8o5OnFBGLaltY8xOEhz
	 Wynq1TzMoZ7jcKqYMzwLo3xlJMwRNFKs/XfZU8FhRRhJnfCk95QXRFQw7WqUPUt9AsQrs
	 oQ4mLKRy6Ov6Sq3zApLo9FvpIU/1gzxY6Ezm2LqqmABc2PjvzbjKSAVr7qJfJXoIP6eon
	 U7ELhtv8pXN++QVBuElCucjUNxbWpIQ8gAYVJKU6Pknm6mvkFH72P/czPefEFZ+4LxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BSudoDAzqHaGR189O1a5tdJwfEHf52x6doylx62juzI=;
	b=jUc7EUqdZf88SxzL3zplnEkd6/k1bUvb1IlUEgNTInDV5j1deLLazwm2urnKCBmVt6Av
	 V8lCd4cILPNN0bqDQIiYBvRjZ3Sq1glJYQ3eMyF6kN3gRvuhXFkYl9C256QL1amiTJB9a
	 ub6xYPFBWb7vSnKQtyyyHhtKkIPhwEwJyca5ljkji1aj7zg4PjCcWaLU7thgjuk6D8lBk
	 cXsaZnpaFev548Pnl4kmm9Z+0eydjR3ifD05AG3s3eW6OXB166mCTF7KezYnIoHJGxvRz
	 BXMqxzh6j8Ik7BVufK3/l9k968ljGhk6FvGvXHTG83DxeA7xoKcDOpGSAM/ZhLral+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAFhHn99;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEBB606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEBB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAFhHn99
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso3898152eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732637; x=1795337437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BSudoDAzqHaGR189O1a5tdJwfEHf52x6doylx62juzI=;
        b=wAFhHn99GgnWRUJDBbEX42Qy7iXWej3j0ODFz4q2JznoTF3+T/EnMGL73tTr9z9d55
         1AlyN33Y8XKtG+3Lzb50b0276Ly4YaAnQ247xrCrU4xp4AcxwGSCrTj9COEvLdZ7nasI
         IuIY/GyJQNwHkI7ahQKFyr3zcJ4gYxLoNScr4LzmByFDch6qJSEfoqNwNBLCICDQfY3e
         7RUOKI73FR0PXUli98bOe8SY6dCGyfQw3ZBIr8OyBZlwSV9DTrLJoC1an0rlDQvxRG6K
         qpaPrFySrAY3Td6uzmWkmJMcQK7VPVRgUTlf24peGAdW76eqH0dHvKOyFI/vRtPm7WV5
         Yg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732637; x=1795337437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSudoDAzqHaGR189O1a5tdJwfEHf52x6doylx62juzI=;
        b=WlIbjJTIwXWp7l4p4BoHG2InfE1Cq7rBazFmEBs5LMq1Y/GYKxwNvWJbmWkj6lv0dY
         GJkna0iHthffADhGtz8uWG/k2v5eJidTnFpuNJHk+Twndql/WdKT5uCTb+ASYfdqT3yA
         FtzMU/sf2C58Idvf7g3nwM92ewlAcnNezGnwmyW31fyMORrUh7lGm0GavLsJKaUQLHOo
         Q6GnhwUHiL+YphZ1CfjY+h1D/UwCcDOdyiFx+qNFCNsGpxr1iRmRACO4Xm06QBWuMHri
         d71WvQMh1tjNiM3kAvZ/WFR46Qkody9hRURnD0v+9rg4MRHMRmFBaLw8Iq8YfcafEjo1
         QbHQ==
X-Forwarded-Encrypted: i=1; AL+hErGMLbc3wLj7w2RMMmdRlKIMyLR0zmGDvWzj+bDpK/745GvtBqkeCEs5pY3tMvH46Ova7+c7cHF4c4lg8ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y3r/LjDSsN0zWSjXbGrQxK5fGDOM88yMVoIMOM/8VTPIowi2o
	tdEz2FwFDbFU17xPqZE/zg+a7gTGylw5xndfjZQFdRz2sEAxncyjQtK9
X-Gm-Gg: AYBFou1tVWUtllhbgJGhYb/fmbbC2ZD6mmHK7CMnNIuPjje+P3pxTlh9uDehjlH1fJD
	IbwvP3KgVz7Qo4R/ZMQCNNU1jjc7sJTOl8S52tq1qOjGsF23KH5QBZv3MBAG3HRguTZVqPFNDi5
	pVIyS/ddkdtLLVHCRUzBZ2EUDbcRBN4opQFmc1HCaH623zMJWB/I3XswAQUzmNQepvgEAPRG+S2
	0katVQC/3D6DL5jWQDydByN6X7nRAOabdhPA8+b+Rvi1fm2VNVT4KSsCkmIdwwA7P+F6Oy6pPSr
	gYBralNITo2ZMnwSoUUFE9ahqj0D7S2++q8u8Y7yiIY58qXjOSJdMeYzbO/Uoy0fXC6P8toVS3h
	a8k9La+5/0f5xYqVTNGDnaIkalQLzaydadKbPYwdvhWQyrVwqRYwUvUQWAm5peOXOEIFkPVKyrt
	zWD3d/iRFRp6/DxaeBJlwEG11ddw/hh8tb6uu5djHxN+cx0a1+ZXqVSxwQwcQm2lA22StBolI2z
	CW16dMcvn3Y12M+MQ5zuwP4l2CvClQqzVF6TpjRqRMVaCe81warKBdOLAdPnxmXc9grnBZLcY8m
	ciQADHRM8OoEDBf2HPZnl5IKCQZK29JXKO8NVuOmbu9fOFrCW2dGVprBVu+OtExb6dz3a2H1Ydf
	LSQ8OpsBNpiKXyolqq55b2KJMoBb5tQ+og7IjlA==
X-Received: by 2002:a05:701b:2092:20b0:193:9aa3:474c with SMTP id a92af1059eb24-1b5030fb812mr8000339c88.21.1794732637137;
        Sun, 15 Nov 2026 00:50:37 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm30130933c88.9.2026.11.15.00.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:50:36 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: leon@kernel.org
Cc: jgg@ziepe.ca,
	raeds@nvidia.com,
	yishaih@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] RDMA/mlx5: Fix cntrs_max_index overflow when binding flow counters
Date: Sun, 15 Nov 2026 08:50:25 +0000
Message-ID: <20261115085025.53203-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

counters_set_description() stores the highest counter index supplied by
the user plus one in cntrs_max_index. Both are u32, so an index of
U32_MAX wraps cntrs_max_index to zero, and the entries after it can only
raise it to their own index plus one.

mlx5_ib_read_counters() uses cntrs_max_index to check that every bound
index fits in the output buffer before it runs

	read_attr->counters_buff[desc[i].index] += ...

With the wrapped value the check passes whatever the buffer size is, and
the entry with index U32_MAX is added to memory almost 32 GiB past the
start of the buffer.

Reject an index of U32_MAX in counters_set_description(), so that
cntrs_max_index is larger than every bound index.

Fixes: 3b3233fbf02e ("IB/mlx5: Add flow counters binding support")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/infiniband/hw/mlx5/counters.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/counters.c b/drivers/infiniband/hw/mlx5/counters.c
index 1c25b825d0bd..742bb10adc57 100644
--- a/drivers/infiniband/hw/mlx5/counters.c
+++ b/drivers/infiniband/hw/mlx5/counters.c
@@ -1038,7 +1038,8 @@ static int counters_set_description(
 	mcounters->ncounters = ncounters;
 	/* each counter entry have both description and index pair */
 	for (i = 0; i < ncounters; i++) {
-		if (desc_data[i].description > IB_COUNTER_BYTES)
+		if (desc_data[i].description > IB_COUNTER_BYTES ||
+		    desc_data[i].index == U32_MAX)
 			return -EINVAL;

 		if (cntrs_max_index <= desc_data[i].index)
--
2.43.0
