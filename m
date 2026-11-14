Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674827;
	b=Cq24bM6/JLsSY2EOEY4aKIaQm3t5vsMfhyMF7dhnUno94zmcSU9oSgn8Yp0dQRMJbcEq
	 DdhtOEZMe2GYBvj4G31ec0R1PgwD7rBgTdFAt6bmDFP28KjtYPCG5narrUCS54x3PFjrU
	 kukplaw52BGzhSsqps98CnKXB4kcdVWasJupqcyYB5Awlt2jx8obiZ6OmE35OPcODuTli
	 5I1cVZiu0TihBG177SiN2qU42d0MI2Ov1USbSzsyZpBpfEW087nbri8kK7DXrf2jqJgZo
	 eSLiCfvHvQ1QNORZaecL7OGdsE2Ye3ip5rKfggngn5Fwgyn5oE7jl0NDEhc3ykuICkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=XRgYV+Ks94EfuBXAohtceBa45x+x3HR336pqrCVLcA0=;
	b=3t7Yznw92/mgwfmxgGdOJWCl16u/Qmt9XMbCfjNSGwx9u4LDpAZ9CSDm5DCkmcZfNNub
	 hv6VtsVt4mxkCzg67xEFYEl/HjAoMSITVbo0J3XqfzAeO2o+n6Br0WEP10rTBGKPPb82E
	 5XZbcAdf3rJUE0Y9vbb9IFnKs0hntjYMGa09Xo8bqJjkvCtdZUAtjsyXLWKv5yM7W5ql/
	 PGOUzrDyLk7tnquBYTfYiNTEqiT/TRsyK5QX8BEJTSeHLtfnlRXd2PGaem74c+SzL6wWQ
	 rylUqFlPaM3TMotEibedCbOzl/s8UBFiHIQay1PVU1b0Oj9EYMz0R7Unz9oSuQFXW1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b="jOWsaRw/";
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC8606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EAC8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=jOWsaRw/
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRg5P5TFgz8Xrrf;
	Sun, 15 Nov 2026 00:47:05 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674825;
	bh=gydiiSAYZ04Px2gvqNM114JBE2j0C3oik9IAucsOCfc=;
	h=Date:From:To:Cc:Subject;
	b=jOWsaRw/iXRCCp7hoEAuBB6fxkc+WS+s3FVqyRylTo3uFSoJMivmogwPUQF9ar8s9
	 WzxNdSwg+w+Aqcr10L8E09zqHLqzH+kvNGBMJUJDkYKya4b3fI7ev91URvq1tB9HI1
	 e6GcyIOvCMQ9a8STZi5K9DqMXOWQbPk2C2FZ93gqzbj49Ln//t7bf9WCpVgac6I/F6
	 eCiTsqHKztuFPD4pCwmWikuoY52ZyV0KC/tJAbzI+OPwZGfN/OaBISPDDQd11ajqMq
	 FXCWCBRFiQJpQekSLTupAd2Znl2IiZUEYuH03U+avxotces8jh1EHxDvZW/zLBOG4f
	 MI+hD2sNL4+bQ==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 6AEGkuKx094406;
	Sun, 15 Nov 2026 00:46:56 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:47:00 +0800 (CST)
X-Zmail-TransId: 2afc6af890848a8-30878
X-Mailer: Zmail v1.0
Message-ID: <20261115004700194_SpQtdnE3JL6bzx51l-a5@zte.com.cn>
Date: Sun, 15 Nov 2026 00:47:00 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <akpm@linux-foundation.org>, <liam@infradead.org>, <ljs@kernel.org>
Cc: <linux-mm@kvack.org>, <vbabka@kernel.org>, <jannh@google.com>,
        <pfalcato@suse.de>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbS9tcmVtYXA6IGVuZm9yY2UgdGhlIGRyaXZlcidzIHBhZ2Ugc2l6ZSBvbiByZXNpemUgYW5kIG1vdmU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AEGkuKx094406
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 15 Nov 2026 00:47:05 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF89089.001/4jRg5P5TFgz8Xrrf

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm/mremap: enforce the driver's page size on resize and move

device-dax exposes its mapping granularity through vm_ops->pagesize()
and requires both VMA boundaries to be aligned to it. mremap() checks
may_split() when moving a subrange, but does not validate the new end of
an in-place expansion or both boundaries of the destination VMA.

An unaligned expansion or move can therefore succeed and leave a VMA
that device-dax rejects at fault time with SIGBUS. Check the final
new_addr and new_len before moving, and check vm_end + delta before
expanding in place.

Checking the actual boundaries preserves an expansion starting inside a
VMA when its resulting end remains aligned. The move check also covers
equal-length MREMAP_FIXED moves. Existing PAGE_SIZE mappings pass both
checks, and the existing hugetlb restrictions remain in effect.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Build-tested mm/mremap.o with W=1 on x86_64. Earlier QEMU testing used
a synthetic VMA with 2 MiB pagesize and may_split callbacks to compare
unaligned moves/expansions and valid aligned/interior expansions.
No device-dax hardware was used. The synthetic tests do not establish
a real device-dax workload report. No stable tag is included until the
historical introduction and applicable backport baseline are established.


 mm/mremap.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/mremap.c b/mm/mremap.c
index fff0465f5e061ff44ae4fd42bc037ce178517bda..8a0a406bd78d41df96f7ef41aeb6eae36c77c1a6 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1406,6 +1406,17 @@ static unsigned long move_vma(struct vma_remap_struct *vrm)
 	unsigned long hiwater_vm;
 	int err;
 
+	/*
+	 * A driver can impose a page size larger than PAGE_SIZE through
+	 * vm_ops->pagesize(); device-dax exposes dev_dax->align this way and
+	 * rejects any VMA whose start or end is not a multiple of it.  The
+	 * destination VMA spans [new_addr, new_addr + new_len), so do not
+	 * create it with a boundary the driver would reject.
+	 */
+	if ((vrm->new_addr | vrm->new_len) &
+	    (vma_kernel_pagesize(vrm->vma) - 1))
+		return -EINVAL;
+
 	err = prep_move_vma(vrm);
 	if (err)
 		return err;
@@ -1577,6 +1588,16 @@ static bool vrm_can_expand_in_place(struct vma_remap_struct *vrm)
 	if (!vma_expandable(vrm->vma, vrm->delta))
 		return false;
 
+	/*
+	 * Growing in place only moves the end of the VMA.  A driver page
+	 * size larger than PAGE_SIZE requires the new end to stay aligned;
+	 * otherwise let the caller try a move, where move_vma() validates
+	 * the destination instead.
+	 */
+	if ((vrm->vma->vm_end + vrm->delta) &
+	    (vma_kernel_pagesize(vrm->vma) - 1))
+		return false;
+
 	return true;
 }
 

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
