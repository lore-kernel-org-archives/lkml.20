Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720413;
	b=pGWpyyPccmGxHGnurGyfso7DhYNjlruDe9iNPQUoSkQyT1kgOT1e1EFNz1zM2jfW3ZMJ
	 fOnFpG7UUB6epqkyMEPpBi0AhPfu/qeJ10pMJxph/cmEG5o5RTleforyMpUx2j2Oj+0cQ
	 F8KexF29YOdlpelFa5TmVlYf5YWGBLShNioU3njNhoz3QraTAN4Iz4QCJFBbCGM/rh+7Z
	 meDGojEjnEjff6sL3kszJaxYcblOS/VDlY/fSyMigBXADl0zXYpX3oZsr/EuOu+QjLwUb
	 TjFcI5+MVFFvHwz1ry61j2opDyLYaSz4Q9x//ml1f6bNJ0QMlgZRuFZhtC5Ju5San+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720413;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=3iVzoNzvGuZwto1S7NCuiP2EmVBmaFQhI8AecHeD8vo=;
	b=JI+j5STn2VUWpfg7FbH6SVGed31aoT/3ojWzfOkJkMyoIsaXBerJlRVnm3ocEnT+GTVk
	 sa+7MU3YpnV3ob817f2YcDaA2Vg4fCxEuzO9zNDKk9OZH/OdYygynu7dCyOAGFu2rWdOE
	 ZEInAOKuAf18A2BZWlk1YKJn982JaSRYIv7hOjsR6E/bCo1yb26V/t+oNn3aT2Z2Al9HH
	 ShSn0OpKrWDzVRoz5YIFdRBV0drRoL81KFrzxrd/om7hmiAvtoRuuGyTXULsNF1FT3hEB
	 Wu5iIsM8gqK7gIbsXm/LinUesOiPr4Mbcd5+uc842hXdS4+pLpnI4PwQwyRwGz555pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=QYU7NI9t;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HubCxIjh;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF2606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=QYU7NI9t;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HubCxIjh
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 0C3C81D001B8
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 22 Oct 2026 21:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm2; t=1792720411;
	 x=1792806811; bh=3iVzoNzvGuZwto1S7NCuiP2EmVBmaFQhI8AecHeD8vo=; b=
	QYU7NI9thzb0iJF94L0Ur4DiJDgBkKAhd6ZqZpOv006G9H2tfKW2kWKlHBqKao8O
	+cOUa2YV5cMruBksrUjhu4YjCebJucB9aeAGhqyNJexfdfMQq0Xo+ZHXk23O/K7/
	NefMP1jczqgZkjWIffpSYV58Zvim68qonXFXRACtbzOaAVnix+yBKH+bY3gvAz3r
	JojxYuMoboehGumdr7JxRawWJFmhESMSv4yu9XfkC0prQM0ygcRa5UPSDy+Uyhdh
	EhNa9Xwm/I5f1YG4R76LnQIUU8WuSXt+yh5choMhfX3Mjs1p6TJNhObEvBbkmL3A
	c49JoV/ILrK9FELGHPbA1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792720411; x=1792806811; bh=3
	iVzoNzvGuZwto1S7NCuiP2EmVBmaFQhI8AecHeD8vo=; b=HubCxIjhwBcBZ2790
	j/e20AVlYdjyUc3+iDJAwnQqOYIl9iOy+faFiP2rpXllpzjEW1zF4xF0hKdl3XSD
	RkjkVgpCN2zbpKfl3qknChwQK/Je+qrjmx/vZ0wlF1LiXkRK80WcWVU34Y1wKk0Z
	7ozMAeQxSoTEuELzruaQ/eXZHJgKiU0V4kdfSBApdqIw26oJpK4QsqP8k5kWagjp
	El5SyYialdidEfDSkLWLrN4NyCvuZ4ph4noIkRVHwTMcUocsxNAHI4ACfpUkNMvl
	QcFjYu5i+wGGUpnePuAMi5vzqNO15rfJDfZ9rCLOzC2yg1XMW+BlEKBWfeh8NkRW
	3Gv0g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792720411; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:TXsuPJ4O7XzUNmTPZXMWRTZ9+CWP/4z7Buo7+AYo9G08ZjK
	MUItbFyHpQErZ3j+Azo6TJCI3LipsZcJVuD4jNA4yHowyRQhB5IxNQ0n/NdLlJYj
	x3fcZeV8yp8AJM9XGUcoO7p+uIesyFo5AAxzrC4Pq14HJCx1U4IPvXLraqGmJpmb
	qJC8wa5mDl0o9ZsW1LFNsA0SyM77B6pXxVEyiY6IBjSqpRVRPOPeaPrZ8zZ1GFPF
	YM1jaMYktIBxUoUUecD78L83iz0efrKsKoRZOIY5+pw8Ds/WLN5b3Eu3gzDAmKvR
	b9AXgf3zNfADqGKqFEBrpQMEVm6RFT9G4HCZ+dw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:lqTfIPOlc2IgOVkJc5VAksCT//ep9oLY4IjxTdOVsVE=:qUQ/Bk3vmZ4E7pFCbC6RAPmO7NyVX+GrJ8wqe16IzVI=;
X-ME-Sender: <xms:G77aakiM6I8WlJ_SIo9QEUJLto0JisXSQ8bi3Miy8__5FNJDfBV6pg>
    <xme:G77aagFs4Sa-v3DsAs22fIrBiVDtCUjJOEp9Zj033ES9YZNbAKZuBRRyupXM5Jjbu
    kbZBjjcwDtmQwWIu2liHow9n7ZZu69qZgur97LgZCND448Snns>
X-ME-Received: <xmr:G77aamu6DeDdqUmWhQTPVG0-UAFqF7r45VY3FBFIHTdKIds78z-AATFHXplcsJ-G8otYOatu1L9_9s4wgT4qTfA_h-c0oXY>
X-ME-Proxy-Cause: dmFkZTExLsW4SpLCAv0tdT8e4ZPZyVz4IupNhJEO2SD3abqv0hzNCt0wHCU9mnuewgcb3C
    8m9r5e3YKSPGnPB5PYtZBGCtADj2rC8TRrl1Bc3fUQAcoD/QlA9OXRwyejoKLjNMy4BgBR
    4LbEnQXkypLxZ3m4X/K/R9IRkdumNmSBKPe/sfK+vfZjOaMBax2CiZaO2EgzLsHG6TJvVg
    RpN12/waUzArwE0mLwMuNeArpooRt4XVRLhGwsa86uWcBuDyb7Qho3ZSdk2rEHCSbKf9p0
    4ukEKjRnVkvK5y+ofxTRlX1T622kiTdxG1JD6FQoOO8gRlRh/mERVb6ZQ5j3LkSoNAI4qI
    PtF+dg7tvaI8DBfp4Vh/chbUKoThxnRSXkpM5YDEyGVv/OjYePNlzcg1aL+Zawu3K2jOgB
    oB6yHAgrVYoChW/YgKvYDAWfAXMhoCgNgjhU+1XgzvuoNMjGO7i63UObonHmD1sBC6ZGjs
    2Dyu20LYLqfRQvKEhdt1cFS96GG7jGY/3G6T8ZXgyRP+D6awnwFgTBxUKpOSAVbbhqRNiM
    JrISoA37ehC0Oag26HtIlpHac547LXnJQGCSD6NUdZsAiaLrQys6tRdH6BSDJlwvzwIigp
    5DIMO7Z9UtZVoFcwNfGGm2f6uyDzSghU7wPS5RAFyevnWg4phkAOBk60uIgA
X-ME-Proxy: <xmx:G77aahf5-ji5WELWDCBQadtW0uLXu4mM5WoPrlntoW2V3ZSuygDUsg>
    <xmx:G77aaskhm-VuFqXG8Ny2SQpQSQ-rfUXj_U6SPOW0Mi9C1f2h6qm_Cg>
    <xmx:G77aakAJJlkcR_Tr_MPjFfgD6xtTGsLb6KeatIO0M4pcU6ah6WnJqQ>
    <xmx:G77aamMy_LEjVDdgDJLEsJwp6b4ZaECkq4burqWkIbINo0CIoOO_-g>
    <xmx:G77aam51O2sX5_vIryuJYjk4F3pLQBuADlTmfUMTgSY841zClBoOOHAv>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 21:53:28 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] nfs: don't d_drop() before d_splice_alias()
Date: Fri, 23 Oct 2026 12:50:15 +1100
Message-ID: <20261023015239.2163480-6-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261023015239.2163480-1-neilb@ownmail.net>
References: <20261023015239.2163480-1-neilb@ownmail.net>
Reply-To: NeilBrown <neil@brown.name>
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

From: NeilBrown <neil@brown.name>

nfs_add_or_obtain() is used, often via nfs_instantiate(), to attach a
newly created inode to the appropriate dentry - or to provide an
alternate dentry.
It has to drop the dentry first, which is problematic for proposed
locking changes.

As d_splice_alias() now works with hashed dentries, the d_drop() is no
longer needed.

However we still d_drop() on error as the status of the name is
uncertain.

_nfs4_open_and_get_state() is only used for files so we should be able to
use d_instantiate().  However as that depends on the server for
correctness, it is safer to stay with the current code pattern and use
d_splice_alias() there too.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfs/dir.c      | 4 ++--
 fs/nfs/nfs4proc.c | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 29492c06ebf5..aaad823370e2 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2346,8 +2346,6 @@ nfs_add_or_obtain(struct dentry *dentry, struct nfs_fh *fhandle,
 	struct dentry *d;
 	int error;
 
-	d_drop(dentry);
-
 	if (fhandle->size == 0) {
 		error = NFS_PROTO(dir)->lookup(dir, dentry, &dentry->d_name,
 					       fhandle, fattr);
@@ -2365,6 +2363,8 @@ nfs_add_or_obtain(struct dentry *dentry, struct nfs_fh *fhandle,
 	inode = nfs_fhget(dentry->d_sb, fhandle, fattr);
 	d = d_splice_alias(inode, dentry);
 out:
+	if (IS_ERR(d))
+		d_drop(dentry);
 	dput(parent);
 	return d;
 out_error:
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 21e5df7e5251..e8ca92b07190 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -3113,7 +3113,6 @@ static int _nfs4_open_and_get_state(struct nfs4_opendata *opendata,
 	nfs_set_verifier(dentry, dir_verifier);
 	if (d_really_is_negative(dentry)) {
 		struct dentry *alias;
-		d_drop(dentry);
 		alias = d_splice_alias(igrab(state->inode), dentry);
 		/* d_splice_alias() can't fail here - it's a non-directory */
 		if (alias) {
-- 
2.50.0.107.gf914562f5916.dirty

