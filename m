Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711887;
	b=sj5hc/TfCf52c10N/NA3s1EAkFlfWHCEwayPTGuDIPR+sTREUL3awGRrtL7iniucM2Fh
	 CUo6fB0Oq3DdecX0pOTgKqGw9rF3gtgjM/UVBj92vwqPPD5Y03GyO0vHsfayX2OzivfVH
	 EDdkqUU6ZN7bh40sO6+9IBtP6Fx1pbJ4ChbAEEffkg/08hbkghI19Qg19lLAHm+KnxXw1
	 emTcWISbPY34asdkIqDLiGeOe8mihlxAWSG26jmFl4GFHtuI0P3ffYSpM1Pii9G7t2Rqx
	 nL1kF7nhbm7QgDrMgRwmLsU/EiB/UTdP50r8Eb3M8sk8a6GFHNt1qttmzlKEqFakwHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I7eC1maoVZbecWxtWnV+oQMv+Lln6ADaEAHGVPeLCfE=;
	b=37sPLeujQHUWX9N7cXDCyrZZylCC9KQyC50d7LW+RcsxAqNnEOh/zHdgD7AoK9C3qFGg
	 FN3X15iKeyeb/jnPMOOT3I3aNM5K/yqXmBKadLiGYBzohiKdH0zVIGkgK/S+BYQQpM6ek
	 ap4ML+BQIHLE9qi74L33LuAxT8oBQKuuQW9mOqfJ9gh9VsaMWGDwUsLw/Pi3MdZ4v5r+4
	 Vv6UIrgcEqNmSy33kxqgNguveWbLiO3B/Zrg9KittwD+wKn39loDX49N9CeGlzftSeWYG
	 Q8zsIjyyCSl8EluCjXnf7SkKCbLJ1YXkSU1HNyhg8K24khuMuvzlyYt9z9yYPVTLMhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=dCBhSSlw;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=nixXNHJe;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801A608362C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0801A608362C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=dCBhSSlw;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=nixXNHJe
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A36tNlj3352377
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=I7eC
	1maoVZbecWxtWnV+oQMv+Lln6ADaEAHGVPeLCfE=; b=dCBhSSlw4BF26+4J5VSn
	pa5Udq50Sz+yk3+zaFKffE0AEFdX3e7n1AKgew/4fuwtOMVEvHH9DccBVjKk9Pdy
	yFn4A/L8MD2Xl0E3EXgtxRQwMd0HXVuamHq6RYHNlias0wnPgaXT1pfXlH2BFtbN
	svJq8pYKNTJNiUfzZXvfZkhNmobDriANWLZQXA6r2oygvyKAslOMOEDaZAPJeg4k
	IxYzFX+YIDr68G3FdYzeHl3MitDPQ5VLW+7WQp4iVIaoBZfy1Miy3ZorX+RYzRLa
	jl00/ik9Wv3ppGkIRFJTUiggL1E16UteNA4F0HXu+LZ30FiaSAZSdoz9w2Nxjt0r
	VA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq34buj7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:18:06 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c861b562eso77068416d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711885; x=1794316685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7eC1maoVZbecWxtWnV+oQMv+Lln6ADaEAHGVPeLCfE=;
        b=nixXNHJerOmu8hWcUzdW6zcrAK+ptlgb6BqDTlj0xvnuvQhqWqylgGX5RARP1+EE+U
         HIddjMeSmVPVqsxvTIkjHZm2dbtx/ZvyuVcDKNcVDZh0Ac8O7w1Gq6s+BN2ddtF5x8Bo
         fMAtkjeWE6+1vkG3I7dDXqZGxuAzxd/N+4k1LTCqrnniSTjyYCKZFnGlgyfyuYcvGEXF
         7OeivKGlmUakyRKbpYKGKAbNaffL9XKjaSNzJWCpyqHf5Xf1rzTIQDR3a01GNbqxfs4U
         7MivwW9TzjTEb63okK88dETKY9h0f5zEewPexZHuBGeSYT/dp9hATisNb8S9BypET9Rk
         jEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711885; x=1794316685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7eC1maoVZbecWxtWnV+oQMv+Lln6ADaEAHGVPeLCfE=;
        b=xXXWYa+nzDlBlr8BW4gLwA4o35FC87ZWt6ablhfg1BPgajKAEeuNdBOFKLnbCbNquA
         +G5RcbnOGx8ZvwzV0dFK7+HGs3SHIB1N1q0v+X90s/zHi57JeQA2Z2JKSXu5WAF1JFNE
         vf6Cn17nrTEB3x6FYL4lMrDbX56sreKVJ6ToDtbd5N5zPJx5jRR0U/wvvdVbHtTim40U
         l66bARLA0z6R2Y4BeiAudGRm6r9gnJQmgHK01zFmYMGqqvlrdY+cGCHC03i/IwDDvmC5
         UeEznH/dOiELYuku4dNbOPM5iaa2s6pHv3oTpblSeBvwuW+TsCsnskiKKTI9ew6RPUuC
         +Xmg==
X-Forwarded-Encrypted: i=1; AKwUvBxRJ5frDHXy7Ja3dRXP60R4MRvx46FchjXDm4YoFd0DzKQIQJahBd576nOITbA9LpIFfE81gY4hZwfBb3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YhIkRUwA3V8lzs6NT3JqmsFoD5+jk6RqqarkpgayOU4LJdfaw
	VD2u9SQy3mUr5ReC6b0aAyvysCCyFvK3as06psX/ZQfobeHIxitCGTniDrBPYq9LjTelyPYYD+4
	BDTy7e1z0wC0s0G2X3S4N0IlgRnrdFBGySEnhQTvWZ4Zyu8xrfZMWc8WyptbKTA==
X-Gm-Gg: AYBFou15Vo1WmP15fWeFyP4tN/jHjzqXLETFoddZwIB68vQmgpocIqitGa6Zg8umrkt
	LpPNBjokpSqkgrdd4XwuKsh1Ti/68CZj3nhxT43frIcQQayBolZ6qpR0rBpKvcZMkBzde47wJas
	KtTt+8/iioE6hFQAmZWH9akpgbhqPNqvhkvOfz3yOjtIJd1Ab9DPmZaAJ5edA3ZedY6lDNYXtKM
	HPreuE7jAPAXpW01/tjw45aD68OmN5bGwEHrCp+1Yu8TcV15U5JxLgA+3jL++DwnWvRLnZLKvhZ
	+jm1By7SS9wNiv1NtgXtDROMqwB3XYqdvwXGayQeeBW6MHWyqQb80cvFgbq7HKxl1qF4byLPzvF
	6MR+qQWkjLFTDQz9pZTnYmhi4PjUtXNRKqM4Odu3dsEUnIXW52++VKbBQJrg=
X-Received: by 2002:a05:620a:688f:b0:940:f224:5a67 with SMTP id af79cd13be357-944217f0782mr2148303985a.69.1793711885406;
        Tue, 03 Nov 2026 05:18:05 -0800 (PST)
X-Received: by 2002:a05:620a:688f:b0:940:f224:5a67 with SMTP id af79cd13be357-944217f0782mr2148299985a.69.1793711884956;
        Tue, 03 Nov 2026 05:18:04 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:18:04 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:13 -0500
Subject: [PATCH 15/16] squashfs: use folio_end_read() for cached folios in
 squashfs_bio_read_cached()
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
Message-Id: <20261103-squashfs-folio-v1-15-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=1479;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=T8Odnx5o8YQw2zm6bGkMyL4qBFgHm1rhmPXcK8QnGI8=;
 b=9zP/yIqD9BVz0C83O1/kfrTdgeoHo0V4IZubaa0Ghr9jAe4zp/RkeAXkvqM4Gyu0lsvWAtqxq
 347rZwZVzNMCmV954pD7T7o9eg8EkatSBr0+QxM3ZfNH4jHr3tQqPb8
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: DqfRyVDXzp7BOpn7Gd_GfFzhK1bf6NjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX27zac3nmPvVO
 9112kEVKrsZ9bbM57Txuflvw7inr6NNe22j44Vab085+0E/hr7aYnHW6NW6N2HQpNtQyuTKRiGg
 LLqzHmr930UTifrY0yFq1aSD/l3ZqORwXWKa9bvl+mtQrnoaTikGIwrXvO5mR09kVF/mr9RZRWT
 panjfqXspH7uF/dFRrDmQkGOD660KArBafX0SEdHQVdEGKkHDYcBEBfKxEG3l597/Ws5xoqtGfP
 jFdfuJ+krBue/W37xiAFMNtq1rxCfjBh6/EYuhSYES1vIX9rsCDwmjoAhSAVS3SDNeIp7j3ps1a
 P/PpDX5rshusou+3pwdsDYEiysaK5PV+2kY+8SY6fzQy6MyKYeuGfYvDbFqqMugo8Ye6E4LGHPy
 yFB+t2a24njfQvJbXiKqk02Z8C5zHpPjgf4xZdgiN8NuHbQkl2lPcA4gxTD3BfjvICCVTDEGARM
 jX6MfTu+tzvr63ZA2tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX9SiMVAFv1G/L
 HrYulyo56hzuzMR0N+jM+IQIBFEOuxjBXSlAbvTZU+vEBXsSuKXSzPLwXE/6RG/RgV/B6LwEyEt
 eCAc+jEguTIxjznZjrgZC5ItU2DTTFcyr0hqZEDiVXFYS7pFgRU/
X-Proofpoint-GUID: DqfRyVDXzp7BOpn7Gd_GfFzhK1bf6NjJ
X-Authority-Analysis: v=2.4 cv=Sadi5fRu c=1 sm=1 tr=0 ts=6ae9df0e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=4RZZiIzdiXplWiarEvkA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 adultscore=0 lowpriorityscore=10 bulkscore=10
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Finish the folios added to the cache mapping with folio_end_read()
instead of marking them uptodate and unlocking by hand. No functional
change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/block.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 2d5850168026..3c81999ae441 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -153,11 +153,8 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 						read_start >> PAGE_SHIFT,
 						GFP_NOIO);
 
-		if (!ret) {
-			folio_mark_uptodate(head_to_cache);
-			folio_unlock(head_to_cache);
-		}
-
+		if (!ret)
+			folio_end_read(head_to_cache, true);
 	}
 
 	if (tail_to_cache) {
@@ -165,10 +162,8 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 						(read_end >> PAGE_SHIFT) - 1,
 						GFP_NOIO);
 
-		if (!ret) {
-			folio_mark_uptodate(tail_to_cache);
-			folio_unlock(tail_to_cache);
-		}
+		if (!ret)
+			folio_end_read(tail_to_cache, true);
 	}
 
 #ifdef CONFIG_SQUASHFS_COMP_CACHE_FULL
@@ -182,10 +177,8 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 						(read_start >> PAGE_SHIFT) + idx,
 						GFP_NOIO);
 
-		if (!ret) {
-			folio_mark_uptodate(cache_folios[idx]);
-			folio_unlock(cache_folios[idx]);
-		}
+		if (!ret)
+			folio_end_read(cache_folios[idx], true);
 	}
 	kfree(cache_folios);
 out:

-- 
2.39.5

