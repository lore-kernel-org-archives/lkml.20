Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792845052;
	b=OzQ8M3RF7WHgzNw6KptbAJKymur1eRfQi5J/vAMNdiyLAQ7gzPLdmmXqAFQPq6ILIPtJ
	 ADcP4egOr/4s+0E+Q7R97PyTXnGDyVMaSaErS8JhDmAvxKyR0RnUKxOGx/op5+kSEwu/Q
	 lRo2uzI5aQfzgDrDPc32qwMce1wMoDtzMVbVOmDWpuxEG/bkVtMvX8Svq00VhauSSZY8s
	 hVx8f/uM5aZvKY7MQ6ag5tdIkRvn9Hzww+M9gsb1m/SAGFKd0tEkNEbi8ivnAxAhp7EAY
	 IZnltGj+cwfqmZV0chAXHekLYsLRLZGLQHawei8SwmgVyUZ37m1tzc2b6cklGhoa/vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845052;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=BX3h784nlZkKHs1VaapVIBduZWJ0fvF929JAJjAxBps=;
	b=Y040gIPrczwToVGwv+fPClez5FLz54XgZ0tWTam5PVFXTrM+cEhwcFigF71Xhh2u79ZM
	 0GZflX+j6X/cD0/ETiwOrB3IhEfYySO5omgH1KslBFPMkzvMpFHGPXWZEm7qVZ7ZkvTvl
	 2A9h4aBuUzEBvZGprOmTO2LexTGzH1bI2LhnAO7PHaXasQGkOu3cVJxB59fRUOFl0K6bT
	 A1dAiqy7EvCZgDE08ADYIW592x/l9RRGtaTfgO0o14/Mjc//4Qt4PMFzEUepousQqZMtA
	 ooZRBW72Loci0zrGmnE5tksmqJ+tEbVXECNcY/PE5K/vapIfOGcQFEkkTaWK8zZLThg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alepacheco.dev;
	spf=pass smtp.mailfrom=alepacheco.dev;
	dkim=pass header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=hqvobs24;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcforvgU;
	arc=none smtp.remote-ip=202.12.124.143
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF5606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDF5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=hqvobs24;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcforvgU
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 18F351301053
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:30:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1792845049; x=
	1792848649; bh=BX3h784nlZkKHs1VaapVIBduZWJ0fvF929JAJjAxBps=; b=h
	qvobs24uO3iyDRoiO2Z6efnraD8aloU0NKQtwRvhiXSWlJtVjnZB0f1FNNmNGGkz
	Jqj6vKAYT6daHW3gei/vedOg+YoMjwR31AXUJwg+O2Mgazwb0Vjx62e3Q9wWK34+
	W15S4UZdXjUDomf7niTABNp0v88jIfP8QoCuizRHciYrSQdj3xpAgTg7jFdRjKvv
	loItxuVizpH9rX+I3AvePVoo1AC+xMZsI3flbJbQRbpC+nkm5UQWV1fEQvjobAq+
	DZqRVYgtI66+hwnRm+Cftq2FdJdb2s6gv8Y5LCQRd2iQXOPSBT9XW2l7MjiGiLDU
	oevesaV4q8g10J2SYf4Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792845049; x=1792848649; bh=BX3h784nlZkKHs1VaapVIBduZWJ0
	fvF929JAJjAxBps=; b=IcforvgUVVWRynpVTdKsDSbW3i8lC3qJfWLPASz/7LMq
	vTCKCR/w9QnjVli6KNiDMmPj2nFKX1ZXsL6QAneQjOBRQW52K5CsIYd+vHvA3Jof
	OtChDz+oYg+0cbo3BlAtEU6w53mPqQPZrCYDjbWhE9ukewdsMirdhn2fCXsMDxtB
	yZ9KgLs3cf2xJ368pVP2f7JDFzgichHCUtaT6x+mPqc93Y04iUl3X62aFg/VyXla
	uYQEcVifTyCHBzr5gY3KhwqH4hPmyxZA7GoFD3bcicAshauQdL1OAhMc/2VugPJt
	9RZOwLkyysbEo8ykIQrmsgSS38fbxdHFYCW7HKhS/w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845049; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:psBjHX431xoeb69YfeoX/bHVTeLkW4DCu+ebbCbiv+nB3e2
	AQzvHbGck0wQMb6I9ilHIQ6Al+HYIePFxNri3tbbTgjs9Q8muV4jy4RszoaI/3Zs
	1wFg9bbvllNnn5XEAvzCVftkPDMJPxL+S6MP/pQO1BXxPU6bpKgQyJZ9bDdlRrea
	FgL1aT+VIzmazQjVjb0kFhJ7EnQS3Dv26GMmPSDP4cCOK8W/2249ufQmkc8j/4ha
	QGRz3rv5bJR8GPyEAAh/2poUps79CtfkzClLJwzJQ0Tb3Wggp+ocyeMZp1pcyARi
	YyNquuUSiUsAJy0p3LCRbkyCvwkmaelhL66p8hg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:JJVHwqiG2o/5SOEde/EvMV/8qaikxQTbXPnsZdW0M+c=:X4ij2PMFNMvkaGRSojAN61Pyua1WINB8JZzqqoI/IOs=;
X-ME-Sender: <xms:-KTcapE0_UhGBthy9Lqkwbh6pT_pSLUAzKSy2n0P-t7KI2QvwZ-jmA>
    <xme:-KTcapJ7RKDmRwBUCL7nvgr4H57PUTyy0RZMl8V3LcK6SN9x52FvQcAx5_Zfy2P1X
    HwT4ypghNPHQ78TPSs693qCIG-GCEZxo9z3N6w8LvU1Z3NfOX7sHlUB>
X-ME-Proxy-Cause: dmFkZTFcNf/WwB4t+u7TH6ItGsJLBDHJLERUFO7AXn82czZYhKxTF1w5cdpp8KbgcTzKyC
    LeWWHg6SZN6idvVfOy5JA+DlPD99+/8FgEIu3lE9IpdPrsx3NT5wN2dpe/6hJEt79l8opH
    kXYRAvZ+jAj7ZtceJoTSJVSsvbLVG7yj7BiLWUJKUiojC4Fk0rBBIhfD1KThZ6fQGx2iql
    GGowOWPZ4MY3Trw6qG+xfS5Kd6YF2ybZAGaiHjVWB7YtVZs4XjdOKNFLhZBRFYq02vXVkm
    k6UvYBBFhYdCQ/anBmz4lDK2Lwd4kuGKkHVyGvp+LOoP3dggoaokoRD7bT/9+dY2slAKa4
    JDmd2A7UTxuleEKwBZqbaS8PFNTgsr5RlK5xLE1iY/y7FUP9BUMcaq+eU6z5qRRB3EiaVo
    v41ZaJ6JyWJk9KMCsbKEH113z8ljwd2oqm/pj8AKU3i+Xj4An2mJrbJL7ele3oPIklDdS1
    s4dWIopewnmA/v8MZnKlQmA6KjOCMDiqrtiCAEzPgZx2f3GpIyEyA9oL3ALJ6pvGLk/gYo
    nr+vlKLJu5UmDCotA9CcbgGAWMI5KGQ08mxWvs53X7xtYPMskf7buKK8j6cUyzA2e9uORu
    4CZt/ETUPZiNdX2OmljMP9YIFm2SOjaomjlxDwyW2Zu2+RDxHXTv8kCOkytA
X-ME-Proxy: <xmx:-KTcagOfTE36BmkJ7KztekqtJJlqGX4NhP8K5mVIuwHNHRe12vL7vA>
    <xmx:-KTcaia01j8ELf_Ir-WoT9HajdkaGe8A1Z6qUkVRgr0kGRP2wLJ9Yw>
    <xmx:-KTcaqzrN6PqvrZLRsecL-OVdyjBqkcXPXm_qhp9jXbf-nMft-ENxw>
    <xmx:-KTcatLGSEK26ps_z5sAlaPx2kv23FoyI5GGawIatDNk9ALZlyXLlg>
    <xmx:-aTcair2QvaYQWLGL22MB1pJw1uPvYOZ7W48QLqHmdZSt8qRF_rroFWk>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C819E700069; Sat, 24 Oct 2026 08:30:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:30:48 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <82903e1b-56b0-4947-b0ed-5c24a536491a@alepacheco.dev>
Subject: [PATCH] ubifs: check the length of index branches before reading them
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

From: Alejandro Pacheco <ale@alepacheco.dev>

read_znode() validates each branch of the index node it reads: the LEB
number and offset of every branch and, in a level 0 znode, the length of
the leaf node the branch points to, against c->ranges[]. In a znode above
level 0, where each branch points to another index node, the length is
not checked:

	if (znode->level)
		continue;

When such a child is loaded, ubifs_load_znode() calls read_znode() for
it, which allocates c->max_idx_node_sz bytes and has ubifs_read_node()
read zbr->len bytes into them. Before the read, that length is bounded
by the space left in the LEB but not by the size of the buffer; the
length in the node header is compared with it and with c->ranges[] only
after the read. So an image with a branch length larger than
c->max_idx_node_sz, but within the LEB, can cause a heap buffer overflow.

dbg_check_old_index(), which walks the old index on the media when the
chk_index debugging check is enabled, reads each child index node by its
branch length the same way, into a buffer sized for an index node of
c->fanout branches, without checking the length.

validate_master() already checks the root index node's length,
c->zroot.len, against c->ranges[UBIFS_IDX_NODE]. Give every other index
branch the same check before it is used for a read: in read_znode(), by
running the length check level 0 branches get with type UBIFS_IDX_NODE,
and in dbg_check_old_index(). Images written by UBIFS or mkfs.ubifs are
not affected: an index node is ubifs_idx_node_sz() of its 1 to fanout
branches long, which is the range in c->ranges[UBIFS_IDX_NODE], and
ubifs_read_node() already rejects a length outside it, though only after
the read.

This needs a crafted image (the CRC of the index node holding the branch
catches random corruption), and mounting UBIFS needs CAP_SYS_ADMIN in
the initial user namespace.

It was tested on a KASAN UML kernel built from this tree, with UBI on a
64 MiB mtdram device and the chk_index debugging check enabled. A tree of
1,830 files in 30 directories was copied to a freshly formatted volume,
read back after a remount, partly deleted and copied again, and read
back after another remount; the same tree was read back from a second
volume written by mkfs.ubifs. Across the remounts, read_znode() read 909
index nodes above level 0, and dbg_check_old_index() walked the old
index at 20 commits, the whole index of each volume as it was on the
media among them, with no KASAN report, warning or UBIFS error. This only
runs the new checks on valid index nodes: no image with a bad branch
length was made. It builds with no new warnings (W=1, x86_64 defconfig
with UBIFS and KASAN), and checkpatch.pl --strict reports nothing.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 fs/ubifs/commit.c   | 5 +++++
 fs/ubifs/tnc_misc.c | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 5b3a840098b..0e50b584248 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -696,6 +696,11 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 		lnum = le32_to_cpu(br->lnum);
 		offs = le32_to_cpu(br->offs);
 		len = le32_to_cpu(br->len);
+		if (len < c->ranges[UBIFS_IDX_NODE].min_len ||
+		    len > c->ranges[UBIFS_IDX_NODE].max_len) {
+			err = 8;
+			goto out_dump;
+		}
 		key_read(c, &br->key, &lower_key);
 		if (iip + 1 < le16_to_cpu(idx->child_cnt)) {
 			br = ubifs_idx_branch(c, idx, iip + 1);
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index 10b222dc6a5..e3ae17977c9 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -357,9 +357,9 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 		}
 
 		if (znode->level)
-			continue;
-
-		type = key_type(c, &zbr->key);
+			type = UBIFS_IDX_NODE;
+		else
+			type = key_type(c, &zbr->key);
 		if (c->ranges[type].max_len == 0) {
 			if (zbr->len != c->ranges[type].len) {
 				ubifs_err(c, "bad target node (type %d) length (%d)",
