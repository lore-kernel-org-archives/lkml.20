Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356106;
	b=zdJ6vJhc7PEDDpnEdw9ChZlgSJp0dGNN0GFxBWG3edwEiHUpk5TFApuhrG//elKQKJAl
	 nxSLj3F6XXedYsDkuNzFp2ogB3LStwaRWk4AA9nhQGhLMwS4Bo/SvVa++YvAfvaYjH2S+
	 rpW/BpIQl6rSxxHeZh1h7119rP/LxRwBp+AsXiJFF0w5PV8g+02eEAMVrqeipsTPFAwLh
	 K7+DSaZZAU0PVXcuzY5hsVwo/pzSDJxclMY01CT/k7/36qPNVe9lo2nrpTDgsHUC/Bjeo
	 cT45tXrWv2IK+j0tZA67pifo5T5hu0i0LFT/NKQkQTif09t6jufZe2ZZjymvTZk66dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
	b=nbGB4PN+6ru2tFxjk82PC5MXHdw1Kg/oFSMHEcCEFzPCj2aH4ZCNIn+NbXQw6683WvXc
	 omiuREtWHBJ3l54Y+dRlcxPIsmpjF8RiTL9nppd3M0j7UQVW259EQYmzoh1D/de9g659G
	 NCYn8bp+vmCrY/TXR6zuRORrsPe4YDgo/QmUzT7f7dAFKDyTMSDM5iI9O8fQ86OkLCfsY
	 pagG0QgKiV3WJF+wKWDTdR7T15U8zb4q9QLS4iZ8TBrjKFI34MY0lkf91lCTSOxwDhb8Q
	 iMFyp6jjWcocwC9nyItaG5QhSNciXBuNQELhTkg51sTXUnAXDszv5TBxiqHop2fQl1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="QJ/IO6d2";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="VP08X/Zg";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA960A262B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEA960A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=QJ/IO6d2;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=VP08X/Zg
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8i6Dr3931287
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fvdZ
	2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=; b=QJ/IO6d2DX/9Lryq5nlS
	mRi4jxNtnkLi8fxI8QdwAt0B3RL1ibRgIn/4E8XX/SHBSRfpIRCGRmJhFP1AJM/5
	knwWSMC+lKSMdFVmeIlhzKOTNsk3S2LBPAgfNqI6bcYTeylg6osNMcZ2d9HSnJHk
	DQBA541RR9RpfyCTGYIt7wQbXHGa8kXOg1fHblDUnAMI3TBkGf59YZAdKwCWVReN
	VGoUEl+5jxnRo1NRxmUzXK3MmVPwQSGgQXBpmSde/rxCF7AsF/KWs+IhvDoJ2WK4
	7jHDvzUE0lZz4KQlEme5NEAmOrb/obWzh8ct3/cU7ax3KPFen8BZhzK0VaY8h6IR
	9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hksu4v7nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:54 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so151173385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285514; x=1793890314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
        b=VP08X/ZgFVxfzFmuwyx3aYs+6+VnxGD4HrxYXBvdDqJJeTzjv7DMUR0w7y3S10N7ro
         ChOSC4nxlDsydDKDA/qMfCNAMC9JZs621CRlnPUYz39jC8vjGrzlU9aExBW5UWIBfWWa
         ekPFZc3HtJ7EqWRE1LXsx7SeFegPXu3LKs0QfU1maogZhOGnw6lW5m4nghBf3ISZJa/2
         5edWUQPMfDYh75nvUPwEIfeQJKInEaRlSx4wBRlgIMEYDcxW2l+5T5R7vqLfpl49pPNH
         tCW1kb5vgmpgX8Czoi94iktBybZEloHQUCHJ2JfNcD1ULrb2WzBxzYkkRSN8TKVwYEay
         UIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285514; x=1793890314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvdZ2wXoPKfuFGzoqROpXRZBlZnCnmXihJIuOJE2Ti0=;
        b=co6f1aw8FCUYdGNn/xYvk2FQQDHQxQYcFvhkdRMuBMfGLbS9MT+fEMMvRFH40Yj9Ty
         YmukiWQIRlc+x2Ir17sIxa1blOruVqxxlUSDELQeCZ2N7nDaXqti3XMoLuLTZ1dEtfF4
         gQhPQzkqjlHGi+nc9Sr6kgIPjthRz3yU+V8YXPgj3fIypOxXHOTMDwBr6DFYJvFAvbnI
         3OqLpX4gnrTgDVKmpwN1ZS2eD3PfUoG5w8TypVK1589o1U7Glhj4ZXLQIB8FuFdscJgn
         RlNSwuMgh6DjkAr+Ah3B8YeH7HS7pxaRVMUtb/qBP/C8/+W/gJKXf0nOwMYu3r7IelFJ
         Dupg==
X-Forwarded-Encrypted: i=1; AKwUvBz30N1H4F8Xfi1FlCp3AOH/N+0s9gNlM78Dk7nwk25sS4VgvEXYXVQOUTZPedr0MDNCqQph4oJWAUE3kE4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9fNmeIORrLk0dNuSULK+hBwAeAREQFTd6m1EguNuMbRhZBbox
	GTPxLVcQGZUTITPRlVdysHjh7xm6SF9NSaxGKzwWLWLfS/QVuHbHu/QptUcTmo3ykQ3dKAJ3w3c
	pMyUq8wumfOUBo32Zh9ujTHpSsuANky63KLLpjupodGRg8YbELMf6YLj/Lm4ftw==
X-Gm-Gg: AYBFou2uthPOKPzreUSsTB0twX/gYHbgNu0efBHXSmWEXu/DLrFZbhDVLwGVmQpoqoz
	T3Du4sKq1yomAh1v/5K3+z6JpnnljtaAlGOzsGmc87BN4yTxh8bA8GvSnvBiRTljrOiSU/Ye6oT
	IvCQxJiZTfk8Uy09gx0Kw3/vVNuo/dCO9NQxvQz2yOtdOq5/9DY0NUSVM+9Twry8TCUBmouIhS2
	CiHj/73Ls9HkGnVmbyTWBCOdgFXcpdY3m6B1vLnPvssp88Xllv7lNPaOk+1w+mymZJ8W01sB+DR
	2+okW0jQKwTufe82CMSDImtKyDh4SpvhLR7AJe594Tjdok6mOJZ6tzgJt6AyJOvE7+lFoz+d7Xw
	90XnsoEUEbp1IOulxAxqCbJui3uM9L8+dR3XlCLjm9nNPU76NSsaCuCSA47jWWTcJPfDChPlu8C
	HQ/7irV26KnKIokiM=
X-Received: by 2002:a05:620a:1a19:b0:93e:e111:2778 with SMTP id af79cd13be357-944133591eemr413699185a.14.1793285514144;
        Thu, 29 Oct 2026 07:51:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:93e:e111:2778 with SMTP id af79cd13be357-944133591eemr413696085a.14.1793285513645;
        Thu, 29 Oct 2026 07:51:53 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:52 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:25 -0400
Subject: [PATCH v2 4/9] ecryptfs: use a folio and a buffer in
 crypt_extent()
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
Message-Id: <20261029-ecryptfs-folio-v2-4-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=6214;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=An8YAI40XTeu7sFYJ7stWLk4oSytgbyqmqAEZJZ4u6A=;
 b=+n5y1ufKS1plUMz00VQ5uUcrV8EZTGGn0yJVgHU3+KCNE99J01y2pIP74Fz/m2pkaeX7WOSPH
 rmyNrySnZQ4Dr5Hk1lOmP7Fe3xWLkcAnVMQcXLxQnjQHcycv2eq2x3M
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=10 phishscore=0 bulkscore=10
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sPlAK8BpLxLIHoRSlgNxad1N3IMj3UGx
X-Proofpoint-ORIG-GUID: OFYYD8piDrBKU5YNzGTCELdfgYQmdtA_
X-Authority-Analysis: v=2.4 cv=GfuCDgXL c=1 sm=1 tr=0 ts=6ae47148 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=YUWrOzf3Fweq1H2EzuoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX2jUT2WTkcK6Q
 vxaExTx0pjp1uW9aLyE5Iw7TOaoy5D+McQHFLuUmlZfBRG/Ni88I2kAdJ2XXL3frIYUYLOMIQSq
 AJT1/4RTrVsLmT/3xwTszHgjFdTHiPjHlPbt+KnPwQXiBiGBaeF2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX4stqTjOhdAwA
 MuxZ+kxAD4DgPMTqz7zwUvaTx85p6yg7AT2nOvpMm3ZAI1iNIHZKkaDQ4veUAGE6b3r/VNUTm7/
 xdsyQUPV+kZp6IoMEmTGw7k7YU6NcdpqfzX8oEAJRyMdIvaWsGr/v/bkPsQl+hUmNlzp+bCKHer
 1uPEDbJZufPq26t/Jd10aLhdNAizdUdFBjgjTY9AnXZJO/SlnReMbPIHVq/rZeKiRxVeMg0ZaL+
 9e3eTaWuzooUazkmunX73z+25lMtgD3uTQp5iIGwg/wkmktubmlWaBPu9f1UKsowLfwhEbbM50Y
 5mm7+kRlC5Iv2Q4DEvRfb5bWr1z4bPW+NMBVVHGvt4ZZ5pL0MiAJm9dzBF80Sd+J47felSCETDX
 SjCs/RJCBGfSctkytMfe/WnT4qH6bAGztWfgJ16XRATKKMbm9o5pc0UhghonOqAoSnqOQuQ8/Og
 k/aUBfOoDAW2rBJhRtg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 malwarescore=0 bulkscore=10 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

crypt_extent() currently takes its source and destination as pages, so
ecryptfs_encrypt_page() and ecryptfs_decrypt_page() have to pass
folio_page() of the folio they are given, and the ciphertext buffer in
ecryptfs_encrypt_page() is allocated as a page to match.

The source is a page cache folio, so pass it as one and set up its
scatterlist with sg_set_folio(). The destination is not: it is a
temporary buffer that is only needed to be able to write to the lower
file. There is no reason for it to be a page or folio. Convert it to a
buffer instead, with NULL meaning the operation is done in place on
the folio, which is what ecryptfs_decrypt_page() does.
ecryptfs_encrypt_page() can then kmalloc() it and write it out without
mapping it. Allocate the buffer with GFP_KERNEL. There was no reason to
use GFP_USER as it had previously been doing.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c | 47 ++++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index e67119b6029c..9b8b0c5a81cd 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -271,8 +271,9 @@ static loff_t lower_offset_for_page(struct ecryptfs_crypt_stat *crypt_stat,
  * crypt_extent
  * @crypt_stat: crypt_stat containing cryptographic context for the
  *              encryption operation
- * @dst_page: The page to write the result into
- * @src_page: The page to read from
+ * @folio: The folio to read from
+ * @dst: The buffer to write the result into, or NULL to crypt the
+ *       folio in place
  * @page_index: The offset in the file (in units of PAGE_SIZE)
  * @extent_offset: Page extent offset for use in generating IV
  * @op: ENCRYPT or DECRYPT to indicate the desired operation
@@ -282,14 +283,12 @@ static loff_t lower_offset_for_page(struct ecryptfs_crypt_stat *crypt_stat,
  * Return zero on success; non-zero otherwise
  */
 static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
-			struct page *dst_page,
-			struct page *src_page,
-			pgoff_t page_index,
+			struct folio *folio, void *dst, pgoff_t page_index,
 			unsigned long extent_offset, int op)
 {
 	loff_t extent_base;
 	char extent_iv[ECRYPTFS_MAX_IV_BYTES];
-	struct scatterlist src_sg, dst_sg;
+	struct scatterlist src_sg, dst_sg, *dst_sgp = &src_sg;
 	size_t extent_size = crypt_stat->extent_size;
 	int rc;
 
@@ -297,14 +296,15 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
 	ecryptfs_derive_iv(extent_iv, crypt_stat, extent_base + extent_offset);
 
 	sg_init_table(&src_sg, 1);
-	sg_init_table(&dst_sg, 1);
-
-	sg_set_page(&src_sg, src_page, extent_size,
-		    extent_offset * extent_size);
-	sg_set_page(&dst_sg, dst_page, extent_size,
-		    extent_offset * extent_size);
+	sg_set_folio(&src_sg, folio, extent_size,
+		     extent_offset * extent_size);
+	if (dst) {
+		sg_init_one(&dst_sg, dst + extent_offset * extent_size,
+			    extent_size);
+		dst_sgp = &dst_sg;
+	}
 
-	rc = crypt_scatterlist(crypt_stat, &dst_sg, &src_sg, extent_size,
+	rc = crypt_scatterlist(crypt_stat, dst_sgp, &src_sg, extent_size,
 			       extent_iv, op);
 	if (rc < 0) {
 		printk(KERN_ERR "%s: Error attempting to crypt page with "
@@ -321,7 +321,7 @@ static int crypt_extent(struct ecryptfs_crypt_stat *crypt_stat,
  * ecryptfs_encrypt_page
  * @folio: Folio mapped from the eCryptfs inode for the file; contains
  *        decrypted content that needs to be encrypted (to a temporary
- *        page; not in place) and written out to the lower file
+ *        buffer; not in place) and written out to the lower file
  *
  * Encrypt an eCryptfs page. This is done on a per-extent basis. Note
  * that eCryptfs pages may straddle the lower pages -- for instance,
@@ -338,7 +338,6 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	struct inode *ecryptfs_inode;
 	struct ecryptfs_crypt_stat *crypt_stat;
 	char *enc_extent_virt;
-	struct page *enc_extent_page = NULL;
 	loff_t extent_offset;
 	loff_t lower_offset;
 	int rc = 0;
@@ -347,8 +346,8 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	crypt_stat =
 		&(ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat);
 	BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
-	enc_extent_page = alloc_page(GFP_USER);
-	if (!enc_extent_page) {
+	enc_extent_virt = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!enc_extent_virt) {
 		rc = -ENOMEM;
 		ecryptfs_printk(KERN_ERR, "Error allocating memory for "
 				"encrypted extent\n");
@@ -358,9 +357,8 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	for (extent_offset = 0;
 	     extent_offset < (PAGE_SIZE / crypt_stat->extent_size);
 	     extent_offset++) {
-		rc = crypt_extent(crypt_stat, enc_extent_page,
-				folio_page(folio, 0), folio->index,
-				extent_offset, ENCRYPT);
+		rc = crypt_extent(crypt_stat, folio, enc_extent_virt,
+				folio->index, extent_offset, ENCRYPT);
 		if (rc) {
 			printk(KERN_ERR "%s: Error encrypting extent; "
 			       "rc = [%d]\n", __func__, rc);
@@ -369,10 +367,8 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	}
 
 	lower_offset = lower_offset_for_page(crypt_stat, folio);
-	enc_extent_virt = kmap_local_page(enc_extent_page);
 	rc = ecryptfs_write_lower(ecryptfs_inode, enc_extent_virt, lower_offset,
 				  PAGE_SIZE);
-	kunmap_local(enc_extent_virt);
 	if (rc < 0) {
 		ecryptfs_printk(KERN_ERR,
 			"Error attempting to write lower page; rc = [%d]\n",
@@ -381,9 +377,7 @@ int ecryptfs_encrypt_page(struct folio *folio)
 	}
 	rc = 0;
 out:
-	if (enc_extent_page) {
-		__free_page(enc_extent_page);
-	}
+	kfree(enc_extent_virt);
 	return rc;
 }
 
@@ -432,8 +426,7 @@ int ecryptfs_decrypt_page(struct folio *folio)
 	for (extent_offset = 0;
 	     extent_offset < (PAGE_SIZE / crypt_stat->extent_size);
 	     extent_offset++) {
-		struct page *page = folio_page(folio, 0);
-		rc = crypt_extent(crypt_stat, page, page, folio->index,
+		rc = crypt_extent(crypt_stat, folio, NULL, folio->index,
 				extent_offset, DECRYPT);
 		if (rc) {
 			printk(KERN_ERR "%s: Error decrypting extent; "

-- 
2.39.5

