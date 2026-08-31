Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259B2E7370
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156305; cv=none; b=UYR0Liv4ITPyS4VvOfv71Tiy4bcEMY3cXuF1ew5YZ3BxIX8VE7mNPR2jK1N01nj7HZ7JhEHlPRxBkoRZ7FKVpKDFEmHGeTOTYvARIYggxeg+xASskDdYRvAzSmDRrxYpnto34LGPr5OymB75/J9Cjia9naIwMumfWvS0BBikqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156305; c=relaxed/simple;
	bh=n72ol7S/8j8SqR1gEX6kHpB+MMNgxWjz7VhLscbqRNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/k2e9dZz62xWja1UvJNjbqWL9ftGfELTQvHstcVkNY7GgSVL89eKPsc+j9H5PC5FiTTNlzRBrdTawedvtHNoHnbt7GgG5xfDxxiKPnuA9OpjLiRfFB4njY89fAZUckX59i+rQRf1682J4iK4Tk45NI4BI72lgJQfBhz2XgPf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GS8Y0RlA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GS8Y0RlA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=oL9SFSDmfxtOdHFvlbKhY8lmD0NBCaSnAUPnl3F9nzM=; b=GS8Y0RlAVXuq5wgVL36IK7kFRs
	boDW0eL1TnrHNB5R5a/J5hmsBcNjoxDcaZtqr3PoQAYB9T0AGqblUdfe2cV0zpMpRjGexdZGWBhaP
	WdefBmuRo+ZfwWof/JqXt1i7T91rsnhgkx83P7FgPmEMIR7Sns7/rAavl2HoZRMYEC65K//jVQCEy
	6fPCMQGowncOjF6Y5FzEz+Tib1BeDxbi1ehdcXqPxR9eV0lBeUorX8ErX4BWb/SUJv6QSH3T1DVuJ
	5ev/bNaAC01j0/EpWw2esm8ccwoA1PaWJ9lFrmH47TuTF0fJbMtJ1DX0kcd/zI0KJHVhhVF+ZpGag
	shZkATMA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0v8f-00000008aKL-3FOA;
	Mon, 31 Aug 2026 06:05:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org
Subject: [PATCH v3] nvme-tcp.h: drop kernel-doc comments, fix a few descriptions
Date: Sun, 30 Aug 2026 23:05:01 -0700
Message-ID: <20260831060501.3482765-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand @fei into @feil and @feih because the field was split due to it
not being 32-bit aligned.

Struct member @hdr was described twice in struct nvme_tcp_rsp_pdu, so
drop one of them.

These structs are defined in a spec outside of the kernel, so kernel-doc
comments for them aren't needed here as well.

This avoids kernel-doc warnings:

Warning: include/linux/nvme-tcp.h:95 struct member 'rsvd2' not described in 'nvme_tcp_icreq_pdu'
Warning: include/linux/nvme-tcp.h:113 struct member 'rsvd' not described in 'nvme_tcp_icresp_pdu'
Warning: include/linux/nvme-tcp.h:128 struct member 'feil' not described in 'nvme_tcp_term_pdu'
Warning: include/linux/nvme-tcp.h:128 struct member 'feiu' not described in 'nvme_tcp_term_pdu'
Warning: include/linux/nvme-tcp.h:128 struct member 'rsvd' not described in 'nvme_tcp_term_pdu'
Warning: include/linux/nvme-tcp.h:169 struct member 'rsvd' not described in 'nvme_tcp_r2t_pdu'
Warning: include/linux/nvme-tcp.h:187 struct member 'rsvd' not described in 'nvme_tcp_data_pdu'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
v2: drop kernel-doc notation instead of making corrections since the
    format is defined external to the kernel
v3: rebase & resend

Cc: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org

 include/linux/nvme-tcp.h |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- linux-next-20260828.orig/include/linux/nvme-tcp.h
+++ linux-next-20260828/include/linux/nvme-tcp.h
@@ -77,7 +77,7 @@ struct nvme_tcp_hdr {
 	__le32	plen;
 };
 
-/**
+/*
  * struct nvme_tcp_icreq_pdu - nvme tcp initialize connection request pdu
  *
  * @hdr:           pdu generic header
@@ -95,7 +95,7 @@ struct nvme_tcp_icreq_pdu {
 	__u8			rsvd2[112];
 };
 
-/**
+/*
  * struct nvme_tcp_icresp_pdu - nvme tcp initialize connection response pdu
  *
  * @hdr:           pdu common header
@@ -113,12 +113,13 @@ struct nvme_tcp_icresp_pdu {
 	__u8			rsvd[112];
 };
 
-/**
+/*
  * struct nvme_tcp_term_pdu - nvme tcp terminate connection pdu
  *
  * @hdr:           pdu common header
  * @fes:           fatal error status
- * @fei:           fatal error information
+ * @feil:          fatal error information (low 16 bits)
+ * @feih:          fatal error information (high 16 bits)
  */
 struct nvme_tcp_term_pdu {
 	struct nvme_tcp_hdr	hdr;
@@ -128,7 +129,7 @@ struct nvme_tcp_term_pdu {
 	__u8			rsvd[10];
 };
 
-/**
+/*
  * struct nvme_tcp_cmd_pdu - nvme tcp command capsule pdu
  *
  * @hdr:           pdu common header
@@ -139,10 +140,9 @@ struct nvme_tcp_cmd_pdu {
 	struct nvme_command	cmd;
 };
 
-/**
+/*
  * struct nvme_tcp_rsp_pdu - nvme tcp response capsule pdu
  *
- * @hdr:           pdu common header
  * @hdr:           nvme-tcp generic header
  * @cqe:           nvme completion queue entry
  */
@@ -151,7 +151,7 @@ struct nvme_tcp_rsp_pdu {
 	struct nvme_completion	cqe;
 };
 
-/**
+/*
  * struct nvme_tcp_r2t_pdu - nvme tcp ready-to-transfer pdu
  *
  * @hdr:           pdu common header
@@ -169,7 +169,7 @@ struct nvme_tcp_r2t_pdu {
 	__u8			rsvd[4];
 };
 
-/**
+/*
  * struct nvme_tcp_data_pdu - nvme tcp data pdu
  *
  * @hdr:           pdu common header
