Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792845051;
	b=UVyyJDQ7E+5OiHVnkqhmX0riZDxnyMzhIfYi97mJw9RekGCYCSDKXnDq8blyKE6lvNFK
	 VO5AssFu5bxGVLDiKnvAzMOjgeeeBPKMkhFHl7aEQMQAWk/8uD4kNdUYHMcspT6q2byBh
	 zeiXx9vjtZtJpgb2ek4WG0RmafrtRMdMPk2gNOCinoAhS4jnGuIEEVEanfDdqyC9LFfMO
	 /6uqwmW4Af0RvroVigJ+aCE+cHVk0Rd4O8t1dUyxQp/NSm1KpjrvjdlzHKtuNkuBnVzZt
	 9IqUkOLoaLkMYsvuXBa+VJTRSk5gOlMWQk75X4QZBjJu1THFUf5Q0kvkivxj8Bc1+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845051;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=fR4nAOVi0FMjueZ87J+ri05TGuedSnnq73ZlTuYSav4=;
	b=sjnufbiqVjNCoEOJXAWvcNe+kke2lPGLPtRJkIUihL4S71o6xY8DwGMYh0FiHfrXR9go
	 Rl4tEb5q+ZJr9qXUouWt4SnxyHoBH33rV8504z7AyBjAcut7ZajGDXCDem6vrAJQnD28u
	 YPXQYhmyaXYXtCpp2V8AWgq1hQlAMsMdE1lzmSqJdmaOEpq8k1whMXMl4ZCKodaTp+DaA
	 eptDTtaR283J8AZsDb87rol1v0RZnTGb/AViHqvgEmPa32tEzuEz7PzPwffuebfFJhf8b
	 ZNmUak0cqVzSHpxBbW+WnjNQnf9/ACoaQrRKaEpiMwhbA479Bb4BRVcKBvBB04l3f1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alepacheco.dev;
	spf=pass smtp.mailfrom=alepacheco.dev;
	dkim=pass header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=ReYNn7wi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lcBA0IZU;
	arc=none smtp.remote-ip=202.12.124.143
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD13606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=ReYNn7wi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lcBA0IZU
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 18E731301052
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:30:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1792845049; x=
	1792848649; bh=fR4nAOVi0FMjueZ87J+ri05TGuedSnnq73ZlTuYSav4=; b=R
	eYNn7wimgCv9LOmFWZPjBmT7kG1RIgMXNlA/MbKAtCSQIpI2G6llaAtxn0cHbiwS
	qok4rW6sBmA+s9QopsZfFXxqlHxyJUBoFFEW1P1Lb91m54REEJGcc1QzJ2cSJQgV
	TSoG5SdtidWXsHzH1z8geXWNs6IcOZqOevK2xjM8z4UlOGxBxsaEzE5sgsRdvOKl
	j/+RhkaJVF8KwHIy4exUZ483KCu84Xa4go7WGlVam+RftQDAhTCj6WkMeMZ+3c1l
	PtDKFi+g9JcbrqzuhLPgBhclR2neznZpNK1BUIPxHJ9JIEjqviLVKl5rv/XVJ+DT
	6ZR0+wEvp6Bvgh2NPO81Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792845049; x=1792848649; bh=fR4nAOVi0FMjueZ87J+ri05TGued
	Snnq73ZlTuYSav4=; b=lcBA0IZUa9c/9+/eBGZ35fEPddROhjcB9ukyAYzPL0zE
	3DowM4mlbDITrUcx/IW29briV2l7w8t7O7Ill43AmfT/OKVmBX9GvmRu+sAjDTFw
	FUhdE+LsqrXOFSmAlBMS2inqRS72SXyNMKDDqPfJawMrmTiHuhl8EB66hZdsm+Hg
	mUAm4H9HnMXjKqkzkbBxM82QHsRepNhV2fAUd+7EpnlGIsqi1A/wKkHk4VP2ZKxE
	dOaCmbGDpPkSf6/TWzcjz6Rbx7PDhGYs2YA/SgUZfLwTJEBb6PPnQqsuzt58injy
	WAIzQc7mNriKNrFUgiI7zRdUkeIZ3Dt+Mt0v7b9ooA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845049; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:H8ZF5b1GGZlsYoTyVAXOuJytMIUVwRhcDkJVCn8c8OT1WJ9
	yRGeKlUljMJhJVufenN/OePmVkTUN7peRsmCB985ul4Al1HQywV2vMaU+RBkxpZW
	vNn0PyhMMvL6cNfAHC00RObfsfkQkPs4yYT0qS0b4A4eGW+y46iVsK0mwZsDhIrt
	jF+HGFkPld8IZa6Shp8WtHv3qnCY5/VdLPrFqN6IYVMwMcsvH+6dhH0U4hCxV5Z3
	P9EJzsf6No1Dx7kwqXrv0IrfeNH5M+J2mHQ3P32bst1Rl3hgqW8HwwPSFOiMOOB7
	PTrV129BECFmBLCbVy+LoI/jwQtQIUfpiK2Fk3Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:8ZHblUlvUWCZD7xzTBM+rM1lYx913zC6mbGvlCBmwgQ=:Pm/RYbSWnnyYMA+mYKAcZbPEbXBo+iIS+6y/O2KDiMU=;
X-ME-Sender: <xms:-KTcauVKUBGxxwM1iy1-BEgHk1WiFAirKz2Om6qJRHM6cL0hYo5n7g>
    <xme:-KTcalZ1JP_asia9OsJymtk-PWImwS3pMLOLRBZbyMII7Gbuzxs9jcKph_H-iRBGn
    EvHak7AIEdojaywJDWQv-OkquCEmEspwSjtAFQ1ZxFXQLAlwr3DX9zh>
X-ME-Proxy-Cause: dmFkZTFcNf/WwB4t+u7TH6ItGsJLBDHJLERUFO7AXn82czZYhKxTF1w5cdpp8KbgcTzKyC
    LeWWHg6SZN6idvVfOy5JA+DlPD99+/8FgEIu3lE9IpdPrsx3NT5wN2dpe/6hJEt79l8opH
    kXYRAvZ+jAj7ZtceJoTSJVSsvbLVG7yj7BiLWUJKUiojC4Fk0rBBIhfD1KThZ6fQGx2iql
    GGowOWPZ4MY3Trw6qG+xfS5Kd6YF2ybZAGaiHjVWB7YtVZs4XjdOKNFLhZBRFYq02vXVkm
    k6UvYBBFhYdCQ/anBmz4lDK2Lwd4kuGKkHVyGvp+LOoP3dggoaokoRD7bT/9+dY2slAKqv
    A3quzRyopzD2fKcliuGTev8b1RaazIQEMdSf2aBRZKgg1wMDu0r2TGteJzhdlMAwkB2DXN
    RP5/OKd6S9yFwdPplDvbwk7VNM4jGrDFwTOh+GNJQl5TNQhXSHnwVQuPja0vB6DUZ/cQaX
    UEHzZdbw/cN9PTpZhnj67Y3lQw9Hdg4+pTkmZZa4gMnWSXgvpJeIHzVYxZIl9wM6b3oMs/
    8o+p0amrGzE+w8GnFTKxEI0HWGRgDvFihTxKjaBwBsTeoCIbjziSFrD6E3ktHu5yr8p8Z2
    zaO43i34IVldaXtXotLgbChZMhyjnp+RZz5H/5HvfGKbWYG+oylPu2dAM/9g
X-ME-Proxy: <xmx:-KTcajda8TKHDxKV6HjNT84LR8TCVqzX1PWu_pX_qPBajp-ki2tsxg>
    <xmx:-KTcakohG7PJYU8pwk5Cpihp2svL-mzsuVRHR6Qr9X0CMFJeEM5cGA>
    <xmx:-KTcagC8mAak6zhEfxSsVJd5iu5cN7K-ruAslHhMHsR3aq_CqkVCyg>
    <xmx:-KTcapbyHHPQCkyyxd8IJD0hzWIwXwqFapGYAapJvYq8tVinOFuQpQ>
    <xmx:-aTcapdprMQLoeQSylX2V1x1646nFBkh8FZ15SG8t_EOgZio0arO1b8z>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 473BC700065; Sat, 24 Oct 2026 08:30:48 -0400 (EDT)
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
To: "Richard Weinberger" <richard@nod.at>,
 "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
Subject: [PATCH] jffs2: reject uncompressed nodes whose csize and dsize differ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

From: Alejandro Pacheco <ale@alepacheco.dev>

jffs2_read_dnode() takes the length of an uncompressed
(JFFS2_COMPR_NONE) node's data from its on-media csize, but sizes and
bounds the copy by its dsize. Nothing checks that the two agree:

 - reading the whole node, it reads csize bytes straight into the
   caller's buffer, which holds dsize bytes, so a csize larger than
   dsize writes past the end of that buffer;
 - reading part of the node, it reads csize bytes into a csize-sized
   buffer and then copies len bytes from offset ofs of it, checking
   only that ofs + len fits in dsize, so a csize smaller than dsize
   lets the copy read past the end of that buffer.

The check that ofs + len lies within dsize is also only built when
debug messages are enabled (D1()).

For an uncompressed node csize and dsize must be equal: every writer
in the kernel, and mkfs.jffs2, writes them so. Check that, and make
the ofs + len range check unconditional, in jffs2_read_dnode(),
returning -EIO with a warning, as it does for a data CRC mismatch.
read_dnode() also drops such a node when it first checks it, as it
does a node whose totlen is wrong, so the node never enters the
inode's fragment tree.

It was tested on a generic KASAN UML kernel built from this tree, with
jffs2 on a 4 MiB mtdram device. Files written uncompressed (compr=none)
and zlib-compressed were partly overwritten, so that later reads take
part of a node, and a device node and a symlink were made, so that
whole metadata nodes are read. All of them read back correctly after
remount, after setattr and remount, and after enough writes that the
garbage collector had to erase and rewrite the device, with no KASAN
report and no warning in the kernel log. This runs the new checks on
valid nodes only: no image with mismatched sizes was made. It builds
with no new warnings (W=1, x86_64 defconfig with JFFS2 and KASAN, with
and without CONFIG_JFFS2_FS_DEBUG), and checkpatch.pl --strict reports
nothing.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 fs/jffs2/read.c      | 20 +++++++++++++++-----
 fs/jffs2/readinode.c |  8 ++++++++
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/read.c b/fs/jffs2/read.c
index 0b042b1fc82..0de9e612ed5 100644
--- a/fs/jffs2/read.c
+++ b/fs/jffs2/read.c
@@ -68,13 +68,23 @@ int jffs2_read_dnode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		ri->csize = cpu_to_je32(0);
 	}
 
-	D1(if(ofs + len > je32_to_cpu(ri->dsize)) {
-			pr_warn("jffs2_read_dnode() asked for %d bytes at %d from %d-byte node\n",
-				len, ofs, je32_to_cpu(ri->dsize));
-		ret = -EINVAL;
+	if (ofs + len > je32_to_cpu(ri->dsize)) {
+		pr_warn("%s(): asked for %d bytes at %d from %u-byte node at 0x%08x\n",
+			__func__, len, ofs, je32_to_cpu(ri->dsize),
+			ref_offset(fd->raw));
+		ret = -EIO;
 		goto out_ri;
-	});
+	}
 
+	/* Uncompressed data is copied straight out of a csize buffer */
+	if (ri->compr == JFFS2_COMPR_NONE &&
+	    je32_to_cpu(ri->csize) != je32_to_cpu(ri->dsize)) {
+		pr_warn("Uncompressed node at 0x%08x has csize 0x%x != dsize 0x%x\n",
+			ref_offset(fd->raw), je32_to_cpu(ri->csize),
+			je32_to_cpu(ri->dsize));
+		ret = -EIO;
+		goto out_ri;
+	}
 
 	if (ri->compr == JFFS2_COMPR_ZERO) {
 		memset(buf, 0, len);
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1caabff9dc9..702418abfa7 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -751,6 +751,14 @@ static inline int read_dnode(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 			goto free_out;
 		}
 
+		if (unlikely(rd->compr == JFFS2_COMPR_NONE &&
+			     csize != je32_to_cpu(rd->dsize))) {
+			JFFS2_WARNING("uncompressed node at %#08x has csize %#x != dsize %#x\n",
+				      ref_offset(ref), csize, je32_to_cpu(rd->dsize));
+			jffs2_mark_node_obsolete(c, ref);
+			goto free_out;
+		}
+
 		if (jffs2_is_writebuffered(c) && csize != 0) {
 			/* At this point we are supposed to check the data CRC
 			 * of our unchecked node. But thus far, we do not
