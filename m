Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=189.12.192.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965845;
	b=MrxWYhVeRfeNhaoO2Cx1cKYG+zMjo7Qh8hX+o3nF7w1r8yydzQnFBIbF1qfOrP/7WqK3
	 t5BoaSBE3HXL7IbjWCBXd1O9ra5lVdMCC8USfFI4VBT9rCqq9W+dsjE2mbsXguwTiqW9v
	 QB51HY5r5T8O2hWFBvWFyl1cDyWLHBk/Uig5LxuQq0WY6a6AVXVE7OH/qR3k8FFd5NNuM
	 cISRbiaKnfPRfmmrv885lq/i5Pq4U6fnctonZjgZ38+5Oj0VfViriappPLVIiq/n7Lwr5
	 BCZTCqC1SgOfjYgbA5eJRyiNtWyqjRY318iBCS5sNngvA05P8D9mjU4J5a3h0E12xmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965845;
	h=DMARC-Filter:X-Hostinger-Mail-Ref:DKIM-Signature:Feedback-ID:
	 X-Hostinger-Mail-Id:Received:DKIM-Signature:Received:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:X-CM-Envelope:X-CM-Analysis;
	bh=h8BEVcgJKZj09m7WRqROF/3Lhsg67yJKrVv0xUXnEwc=;
	b=Z2anJ9RqnhTAEH+m+vYMCOiX28TGB8h1dJAo70a8rd9MKiyVlEnXrBGoIn02dMsf4HWy
	 RAIh6lI58TGsIwhcOg98+6/cgmvS1V9cKAZ+moB92DpLJjX5MVDrsJOXOsYb8IpQTB/xc
	 FnvEoEflM6JXUPbJn7jlWrEseCmaLYfCrKzo3SpSOUz3bdu5U7W5VrB3NFYWQVNKjn8Zh
	 pCicfGAnS05Qsiwh1ccLpJzzdKxTJvC1hyr8FuXE+fw5ogW4YW9e12fa/WuwS+GrorVP8
	 /osbgqynyYdAzwavN/ULxk19HUXa99uMFDzzFhmAZCzuE2uDTFv524ml27EwIsX0gxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=espilon.net;
	spf=pass smtp.mailfrom=espilon.net;
	dkim=pass header.d=relay.mail.hostinger.com header.i=@relay.mail.hostinger.com header.a=rsa-sha256 header.s=oak202607 header.b=XPkTqkZL;
	dkim=pass header.d=espilon.net header.i=@espilon.net header.a=rsa-sha256 header.s=hostingermail1 header.b=gQccjs0S;
	arc=none smtp.remote-ip=189.12.192.4
Received: from oak8.relay.mail.hostinger.com (oak8.relay.mail.hostinger.com [189.12.192.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3E606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB3E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=espilon.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espilon.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=relay.mail.hostinger.com header.i=@relay.mail.hostinger.com header.a=rsa-sha256 header.s=oak202607 header.b=XPkTqkZL;
	dkim=pass (2048-bit key, unprotected) header.d=espilon.net header.i=@espilon.net header.a=rsa-sha256 header.s=hostingermail1 header.b=gQccjs0S
X-Hostinger-Mail-Ref: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyI
	sInRlbmFudCI6ImV1bjB1cz1lc3BpbG9uLm5ldCIsInhfY3VzdG9tZXIiOiJldW4wdXNAZXNwaW
	xvbi5uZXQifQ==
DKIM-Signature: v=1; a=rsa-sha256; d=relay.mail.hostinger.com; s=oak202607;
	c=relaxed/relaxed; bh=h8BEVcgJKZj09m7WRqROF/3Lhsg67yJKrVv0xUXnEwc=;
	h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:
		content-type:date:date:feedback-id:feedback-id:from:from:in-reply-to:
		list-id:list-unsubscribe:list-unsubscribe-post:message-id:message-id:
		mime-version:mime-version:references:reply-to:subject:subject:to:to:
		x-hostinger-mail-id:x-hostinger-mail-id; t=1792965837;
	b=XPkTqkZLi1Lj3Tyalp/6N7o6/33qE7RScQSeoiOYWSrC3st8zYkpB2dkYCAtj1XabKABgGcPQ
	0w/O/mpYEms86xJACGS9lKJQGfthLNWgG0YOmrP7fIJntNrZ7lzT4IuTDwr0dGJDVa7NvHRvPsu
	6qmEOuOS4gGTUv5VKvlvAb6NFAa9Ssh84pSzMhOsVxedRKqqcdUXe3P9tfx4ZSwYokD+YXLMthi
	5KQ9YCANptPz2KvEygN+lPohV2u4QM5cgjhqGQ+lYF4ZH57mtwLPjxGX29VDMXk1lpmUSrBA5sc
	suWkINZw4/SMkTINxhipqEP1Avjx6bwzoa5Kgc4cJo1A==;
Feedback-ID: oak202607:espilon.net:hmail
X-Hostinger-Mail-Id: f9d73972d0bf11f1930abc241188ec74
Received: from fr-int-smtpout22.hostinger.io (::ffff:148.222.54.26)
  by fr-int-hmail-krelay8.hostinger.io (KumoMTA ::ffff:148.222.54.51) 
  with ESMTPS (TLSv1_3:TLS13_AES_256_GCM_SHA384)  id f9d73972d0bf11f1930abc241188ec74 for <linux-kernel@vger.kernel.org>;
  Sun, 25 Oct 2026 22:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=espilon.net;
	s=hostingermail1; t=1792965836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h8BEVcgJKZj09m7WRqROF/3Lhsg67yJKrVv0xUXnEwc=;
	b=gQccjs0S6r4nDFdWPxf25s89aT3IoEOBOHGkG8rbtFTYcmip7IXsrCwKnpv6BN7o2wCLbq
	p8NX1lVYWpUdwrCmnYkHZmHDVj+9mozHGUFpVGyKqATLDu5xL9p1ad29qP8zSLD23M5a+V
	CH5Pca/Nvng61pmAMDvsp4eREjozSVlFU7mFxjQpekwl1/LnTGD5oMtqW90jn4Jr99GTjJ
	Toi62x0cExoGPMZ5Z/nFvt7MUpfmSmoaDBu4ZoMN29EcmFoOxCp6eJOGH3ccvl9Ivmrg8e
	PMAjR1xWVISH/jJEJS5lNknQGsW2lNUBK8XeFEJK50BHYhY6MXtDlq/wGLEwPg==
Received: from [127.0.1.1] (unknown [IPv6:2001:861:5b02:4810:d535:8293:aee4:a9e])
	(Authenticated sender: eun0us@espilon.net)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4jCW4D2PXkzyxG;
	Sun, 25 Oct 2026 22:03:56 +0000 (UTC)
From: Marouane El Moufid <eun0us@espilon.net>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH] fs/freevxfs: reject immed inode larger than the inline area
Message-ID: <179296581973.931625.6479067928730594410@espilon.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Sun, 25 Oct 2026 22:03:56 +0000 (UTC)
X-CM-Envelope: MS4xfLJKJZio+7K+hwx5zqexbzvIhMRa6zZWKpYpwa+f8hgZ1s9Bl5AWOuun93v5WFH7sbPVpabDlxnHJzG0RI8eQ3BjpMfYNyeviImU6GiGeMK3UWbcMBH/ S8s+zlFP1Jc4stLBNZkrfAaNkltCX806nPMrTYN4iUxPnOUHxSq7cizJAgeCYpCdqExEyMQjhfg0Pr3liLCvKJSvVi2fI/bxhYEglRybpgPP7Dc54+ZbHLOo 7onfKgA+b1bxFfNrbC+7QU31hrCtvLiTPhqPHRgJNVrfHsx7lhHRdFaksaapPsX9bOdQVVn3BTOYq2Mew8BwFdIXFdiAjY90Fge9qvu987jrnCm6eaJphB5z T9YomK4H
X-CM-Analysis: v=2.4 cv=P6tohTAu c=1 sm=1 tr=0 ts=6ade7ccc a=NNrdi8j+18+XpAC5aQBFGw==:617 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=ICNSGLm3AAAA:8 a=alPJPtAgaqeobNmZSTEA:9 a=CjuIK1q_8ugA:10 a=-W5iAdWQbIJCsXvgvhpT:22

vxfs_immed_read_folio() copies a full PAGE_SIZE from the 96-byte inline
immed area (vii_immed.vi_immed) without clamping to the inode size. An
"immed" inode whose on-disk size exceeds 96 bytes therefore causes an
out-of-bounds read of the vxfs_inode slab, and the bytes are returned to
userspace by read() (KASAN: slab-out-of-bounds, read of size 4096),
reachable from a mounted crafted VxFS image by read() of the file.

An immed inode stores its data inline and is always <= VXFS_NIMMED (96)
bytes; reject at iget time any immed inode that claims a larger size.

Signed-off-by: Marouane El Moufid <eun0us@espilon.net>
---
 fs/freevxfs/vxfs_inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/freevxfs/vxfs_inode.c b/fs/freevxfs/vxfs_inode.c
--- a/fs/freevxfs/vxfs_inode.c
+++ b/fs/freevxfs/vxfs_inode.c
@@ -268,6 +268,11 @@
 		return ERR_PTR(error);
 	}

+	if (VXFS_ISIMMED(vip) && ip->i_size > sizeof(vip->vii_immed.vi_immed)) {
+		iget_failed(ip);
+		return ERR_PTR(-EINVAL);
+	}
+
 	if (VXFS_ISIMMED(vip))
 		aops = &vxfs_immed_aops;
 	else
