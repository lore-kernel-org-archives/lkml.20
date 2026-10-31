Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478819;
	b=kTNVizNoEQOULevbmuI0T4kQpjRjSgGDC8c2XiW1FmZAiuqip5v901FVP5ig0ileHMVt
	 P9Rqr2d7rDwTzAtCXh/2ec2xEftq4GxUMEm0NOiVlHytY36QRAQTabfEwRzFK5nXNU8Yp
	 bVDRoEgXcWE+UB0b3GusI50FfJ51lpom8dO6EMMnWnMybtovoVLqDaYFQVZe9LxjRwCwY
	 v6PjdF8RJC/2wuaiBPT9RRdNHnqOXZVsU6kOimZF8heRMQr0evL/9uBPnAL94eIuOtyV8
	 9Dwu2Q94uqZ2g7zSmGSR0ciSc+2/c6VR/DThvaDo8Wq3DNqsQyvwtO1JGKKoeYMol6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YdHCoVT+NqpiNuPsfeDYsMwfap+yTxFuYoqh9DBLi+M=;
	b=LxEQ9mvRhdB7KGbNnGpkAP/MKzG2aRBqQU4vMM7Ayn0sd9hUICsHYrKMvQEGF/2JZvfq
	 bVU07onPagSc1PrIqfbCcTQXBGqN1pgIqriUoQuAKoFORYBV3zVmrWWd1E2nzBVYuKMu3
	 uQ+G31Lx2zx0CTod9hx0x6xHq8wi7zTDpqVyKfQbZkycQwUdA7goQIonpib92q5BbFGcN
	 dkk1mczqsFiD8SgDeVxjKFXmRJ2dXuFletFEOnJIG4NF62mIjtfj7I+uMjST77ovYpkwo
	 cQ9YojYZyOZ13t9EBSh75S49av1tLbLhnP8v7PLAHSuZfv4m3kSYvOshtnLNk1AD4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eMFsCs9i;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2D414qP6;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A21606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A21606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=eMFsCs9i;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=2D414qP6
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDnhAK3698044
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=YdHC
	oVT+NqpiNuPsfeDYsMwfap+yTxFuYoqh9DBLi+M=; b=eMFsCs9ilbbCUTQV6/EZ
	uaHBoegtH2kYXlsN2YHINUYFs1Bscdosku34Ot28VIAmqhXK6Y75qxszCOP3B022
	mqgYVBlcgx4MEcw9qNdsnnGHf7/CjCHSaSJQfGXTEtOZh4eQGIMyesi2lRXvOCO8
	F3ZnzkXEhWZ89w8Wetl3D3poZ3lm245DiivfS3ULACIJYMVm15OARh6g0j62tfhr
	8lrys0A+KbRoNsoe903zFoawVtZCpIJzi3i5KrwCPsrPp4Fx9569kIqJLbi8ySmH
	TMPju7RgkXyrJX19noQdZGPI5DnMFV3FnPEzclrN8DXEegG+Wbsud2qEdj+rV7rN
	9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2xhw7rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:33:38 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so355488985a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793478817; x=1794083617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdHCoVT+NqpiNuPsfeDYsMwfap+yTxFuYoqh9DBLi+M=;
        b=2D414qP6bfq4LDz53D+fIa0oq+rcCsFmMfd7+h76LEN3p26cnDZTCTaK9plDpe3csT
         dxjX1py//9xW7BZ7tAwv1LDXmgS1AmTJ2V3RKJeLgD629G5iaLPvXAwbE73JTS6++LXA
         PVtWFsmOhRaBUvSrbBT14l14vnjs8K9nK9YftwQmGLdr5jwK86gneBPWD1Ubs1Ne0SXH
         VQpRy2U+lD0Vk2JrA056xdYJIyNb6q9vxLiOE59UEJH/Sik7FLOW0dGFrhhck9G6Swch
         l6jvV+YPzlcVcUTHbQXuFMq8c4klQyOkIUOUQMwKMhJuA1wB4vr6UBNbKTXqAFQnSq0Y
         ZJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478817; x=1794083617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdHCoVT+NqpiNuPsfeDYsMwfap+yTxFuYoqh9DBLi+M=;
        b=dfmLE4yw99Cz1+QD+Mr5PDA0bFymPbQdTuYB0xfhDEMTvX4cWK9mtxmXniNGX+VDTY
         B+1PSwPTdFg3vCg+2IPrj2UY0x5JP/NJaeDax3ZggbpA/Pqn5foNEuRLiOkFyv9dTMuj
         EKZqqhFTT8FXQvg4hJDTwpKbiqC4vU3VO5bjGySBTpMATTAiwultfgPwP6Aro+4nHr8b
         afghyEkAKZBS6BoyNaH58fsNudHR2HkFBDe3V7frx259pPCGowTCyDkXTL6QHfFXW8kB
         4VcF7gMxiZBizdz7nI8yqjiZqy/CAIUNeFoHUsSvZGfMIyLVrzF0jbIJf7ACtTMfbh9x
         OXow==
X-Forwarded-Encrypted: i=1; AKwUvBwuupzb8cZeXlGlf2oM5tH0TuMFTAlVl+Hir2K86OdT5HK2MRa9UaZ+XpVIOOuXBoKHC0DY0SAZvAjXvYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx4DuiiOkJWwAo/Q5xwpE7cvQ0R6NYRZql18aRj3WohLxdVTFe
	wUDfusAkhrb/srJ0zxvJyt68kx9IXj1pgSR0/EtRWrNDSzt1X9b+vI7fs8N2DIQ6I5w49/GwJBf
	qYFLSlTTgwwPtZQRI1IB5LHY/CzhHW12cxOxftkqu4ZT9Kgvj4zOq+Pm/ZFGD4Q==
X-Gm-Gg: AYBFou3fsTPKkZZl6gkQZJyDT/H7kNj3qYYcLB8Y8F9plRzX6Uvf2vkbyrXuPZd8McX
	3Zp1zFALAKd7hi3hFuamQNfD9fcALgGomsS6P82YjhErfgOj2ROHsByYsAFlx/w6h5ZeBKJ/SPZ
	jzpE6rXlxehGBJrI9ppADnTv3i53lYICizbhgMf53w64k4A4aeX2CsfNfzkWvgyX5iBqo9zADcj
	Q0T30ZCvMDvjAcZkbyiviqSIMsBs+BlCKqIU1iOe/dGWZcb0rxyvikAHjGlSDb2y5jK2OpwmV5A
	2Apan+cv1Qrcm7/DzSb82p23I+6WwARKrzovkLBb/3tNSVdWXg6awTMDZ60KQDrwsiY0hD4lISM
	JFd5Tygdlz7klQPpa27kJz+Tj940qws8KlO7RQ+01PpqKyEp7koRj+R3zAN0=
X-Received: by 2002:a05:620a:6f0c:b0:93b:d7a0:d9db with SMTP id af79cd13be357-944217a1aecmr938522385a.53.1793478817377;
        Sat, 31 Oct 2026 13:33:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0c:b0:93b:d7a0:d9db with SMTP id af79cd13be357-944217a1aecmr938520085a.53.1793478816934;
        Sat, 31 Oct 2026 13:33:36 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm10019650f8f.36.2026.10.31.13.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:33:36 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 16:33:19 -0400
Subject: [PATCH 2/2] iommufd: copy to and from folios in batch_rw()
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
Message-Id: <20261031-iommufd-folio-dirty-v1-2-2cef66d2d6d1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793478807; l=3577;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=iw6sHSriIxgAcaLxW3uDjPc2y6fpYYLm8qSwuAG4T/I=;
 b=OmZ77Y4NMdK2qjjtHjqrcx2sgxaYkW/IFd+fE7xFUxsivp+O52UclOiWycSSDQGWGjwmuSjC3
 ClA2BCEz/CJD22jyeoJbcUB+EdzY5JIbcq7VMA4PwkDVwOFG3ejYBc1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: vGNM0Es4Qw1BploCB6NCJo9ynIuuu7GL
X-Proofpoint-ORIG-GUID: vGNM0Es4Qw1BploCB6NCJo9ynIuuu7GL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX1HF7mSLEylaB
 9V+NxpFGcvJDl6R7TPdBdT3arpQw/dbid74HWEtKNtUTJwxIta/DyqCC/C9D6RrQHjIK9YvATQP
 7Gphk94ir+g1vkqWQO7CbH42guTU5BgR7tl0XxOUlZtgP6NKFyMAEfuK2Zytx2xdU8n9b0MRKLL
 uWz5g2zaO1sygAq/E4JumZFK0Or/wuUxLrOpDcZlE8yUOMfvPgv/7cblSXVKckBDvzxePnjY9rv
 zDM0IUQ5IGD7b9Q2ucmtJ79RZ2bihyf9jGNT3A+tuI1zODiff4yU4Pvql3pIaYTN7zIgtcSxd8K
 gIQL979f8wd6EUYOG5voTadfOGnEVg+hb2LV9oXiqtelvZl9dLJW1W6mlAyjB9zSTRfrj5NJmAk
 yMafE1aiob7LI9vUfpJVt5U3FiEtCO8UUNzOvGXkD6AhrN+xYEj9EeWboI2kuQKQI+j+8vFnq/7
 Wdp9wXMT/QXG/LeOw7Q==
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6ae650a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=RNgnFTfOqsg4LCEnESsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfXwFKe+Sy59zYC
 vyu+haakOoGxRwVRXDROKsCeBFucfajljPPQT7yXyE61+dAnn1a3labor7MpD5pxp3hbtM4ON5D
 98+CfAC7QYErohQxpsCP/PsQy7VGrYOX+uILskV/H5CXUhg1qPQ3
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=10 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=10 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310081

batch_rw() copies one page at a time and, for writes, dirties each page
with set_page_dirty_lock(). Walk the pfn batch a folio at a time
instead, copying with memcpy_to_folio() and memcpy_from_folio() and
marking each folio dirty once. Convert the single-page copy in
iopt_pages_rw_page() to the same helper.

iopt_pages_rw_access() rejects dmabuf pages, so only pinned user memory
and memfd pages can reach batch_rw(), and those are always folios.

memcpy_to_folio() also flushes the dcache after the write, which the
open-coded memcpy() didn't.

This removes the last use of set_page_dirty_lock() in iommufd.

With ftrace timing iopt_pages_rw_slow() through the mock driver on a
non-debug kernel, slow-path writes to THP-backed pages drop from ~1310 to
~930 ns/page (now the same cost as a read), and writes to 4K folios drop
~9%.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/iommu/iommufd/pages.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 2f6153108add..133fed4495dd 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -721,19 +721,15 @@ static void batch_unpin(struct pfn_batch *batch, struct iopt_pages *pages,
 	}
 }
 
-static void copy_data_page(struct page *page, void *data, unsigned long offset,
-			   size_t length, unsigned int flags)
+static void copy_data_folio(struct folio *folio, size_t offset, void *data,
+			    size_t length, unsigned int flags)
 {
-	void *mem;
-
-	mem = kmap_local_page(page);
 	if (flags & IOMMUFD_ACCESS_RW_WRITE) {
-		memcpy(mem + offset, data, length);
-		set_page_dirty_lock(page);
+		memcpy_to_folio(folio, offset, data, length);
+		folio_mark_dirty_lock(folio);
 	} else {
-		memcpy(data, mem + offset, length);
+		memcpy_from_folio(data, folio, offset, length);
 	}
-	kunmap_local(mem);
 }
 
 static unsigned long batch_rw(struct pfn_batch *batch, void *data,
@@ -745,15 +741,21 @@ static unsigned long batch_rw(struct pfn_batch *batch, void *data,
 	unsigned int cur = 0;
 
 	while (cur < batch->end) {
-		unsigned long bytes = min(length, PAGE_SIZE - offset);
-
-		copy_data_page(pfn_to_page(batch->pfns[cur] + npage), data,
-			       offset, bytes, flags);
+		unsigned long pfn = batch->pfns[cur] + npage;
+		struct folio *folio = pfn_folio(pfn);
+		unsigned long idx = pfn - folio_pfn(folio);
+		unsigned long nr = min_t(unsigned long,
+					 folio_nr_pages(folio) - idx,
+					 batch->npfns[cur] - npage);
+		unsigned long bytes = min(length, nr * PAGE_SIZE - offset);
+
+		copy_data_folio(folio, idx * PAGE_SIZE + offset, data, bytes,
+				flags);
 		offset = 0;
 		length -= bytes;
 		data += bytes;
 		copied += bytes;
-		npage++;
+		npage += nr;
 		if (npage == batch->npfns[cur]) {
 			npage = 0;
 			cur++;
@@ -2306,6 +2308,7 @@ static int iopt_pages_rw_page(struct iopt_pages *pages, unsigned long index,
 			      unsigned long length, unsigned int flags)
 {
 	struct page *page = NULL;
+	struct folio *folio;
 	int rc;
 
 	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
@@ -2332,7 +2335,9 @@ static int iopt_pages_rw_page(struct iopt_pages *pages, unsigned long index,
 			rc = -EINVAL;
 		goto out_mmput;
 	}
-	copy_data_page(page, data, offset, length, flags);
+	folio = page_folio(page);
+	copy_data_folio(folio, folio_page_idx(folio, page) * PAGE_SIZE + offset,
+			data, length, flags);
 	unpin_user_page(page);
 	rc = 0;
 

-- 
2.39.5

