Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720439;
	b=uS2G/1XAJgDMqpNEczQrhcz1mdBgn3wFhw40xoh++YEYM+XEngF5x/zIwrdaIeDETglF
	 5DgiUPMz5Pb7MarXPILfbgY+Zsrr6P5ruzlWhHxqvv96ClLnn8LBalypg7CD4jl23CV81
	 +rtmM0iF9/08lFir3q9iL188dYK2oarhxWUgbD0wx5HJGmz7/jwLKjtvbsUMLxUOFMliq
	 Part9/i35TWtoj/q7sMBwfEhbr3XVkvaheVVA5opRnJN9njKeljZ0l52M9LkCKwtNzvBT
	 XO2PCFmlPPNlJJYypHcr8hpZlu4pY+j4PlC27PwSZ91CQF1OHbhJ3w7+HtQJlR6mhhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720439;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=RVq/2P9DqOvSd/SUc2jDV62p6VisQDoGzSYtS6+dLwY=;
	b=lsOb3oklWWq5aGDkjB9d7F5sV70HMAzdCTxm4Ygx4oW4v8Cr1EMwoOA6pH6S1A1lFnqr
	 /lzXIlYGpHXwLisNivqC0tMk2w0tWPkWAzH6amEm9emgj1kJQhbPpDkw3t8IWgmKuTt5B
	 36Db6m5LuIqoghripN4UMBsmTX0WCipviJ+BrIbAfY5wWlxMmCicPbmdEmL1m++K3JmKs
	 2cMGPHpmcEBwqgKxjVoNp9DAJNBt2ez2aasldWwiMr8LI8BbNx2UajVRL9GVrDEt5i4IE
	 0a9LFzoID8356G7jNWrbGjN4n+kjPlQcJjLh3Rt7lgljSj4bnetm18itBzHJZGhcB5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=PqgOt6by;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DdCk0Qn4;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D7606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 630D7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=PqgOt6by;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DdCk0Qn4
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A9A597A0172
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 22 Oct 2026 21:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm2; t=1792720438;
	 x=1792806838; bh=RVq/2P9DqOvSd/SUc2jDV62p6VisQDoGzSYtS6+dLwY=; b=
	PqgOt6byZqSUBDF45L5BrHG9gLXqxb4sMebjWBFFQ8qwRk3+5NEqU39ocbBjPaMT
	vNmGmf4+uqmdswduIIkX4odpxkE+hFiHqPFY3z3GEFQTOQrHOXyzIbzvBpOrcbFN
	DRAV/s2g6uDBu46BdU6YBc8zSY3MJiL7angdmHMsEdaenW+WrlTOKWTFaWs9aRLK
	/LpQzxghqyG+P2Of0hVLQN90SLP0z8Dnc97ZQZ4VWzwPKxe2hFL5vch4BYb6Fcw8
	C4s7NHNzFJ//ZRB/xBrXg3NTWVhSlRMP7WCjG3jnFPxbh6sCWcRz7lBXzFPwq48n
	77j9AldxBrjp/OmaH2I1Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792720438; x=1792806838; bh=R
	Vq/2P9DqOvSd/SUc2jDV62p6VisQDoGzSYtS6+dLwY=; b=DdCk0Qn4ADfWwqqI5
	0vDxBujOe+gM/X679ubfxWxK80+8ar0xqPAvmJukpbA1V2sYxwN05pi9pyA3JT6W
	AJvB4BnnjQIUDboxEJ7MLyK8nyHyiupC1JAMteMkvKaRHODbpjfog0xUJgHKBuYq
	shKnYJsD4vWltSWC+AyxG0o3jrDiaK31NysjUt6lRd/oii6ILOSOppl5VhoXzsxw
	8+cuRANhrNMTR3MGRrOhKQUqWFu7Rhf0hO60/UDQsZOmSzRSkEFOdcnCugFLLDoz
	FyMxr1lVQo1CrkNqNw0ikhgeVZ7ujEnufYPn2GzVoNsKBSDJneXDdq1TLnRnPg8Y
	K3pQw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792720438; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ot8ppKP5Xh2BZIQkB6JK3QfGTHS5GWqQrt9NIf+oi9bYgs0
	HOov2I+PvrFzunTdiD3pd1AWYDRoHHsB/kFy9X+UcU4e/Z05hzAH+ydpPs0AlH75
	XFjNczT4RY7/1VlHfUP6n+0W1ivb6gPpZZFU8euoy+Jf9ns1IjPR29ZSHbLeOtLv
	aHFtXGiJG4jlhbh0S83+/75SLfTz0sdVU4xwT8SX+tLZXAeZ+wykZLyj0lzZICnc
	0ifLbm8jOezwguM8z/fyv09tZMaAF5XPwIoPNwtYri3ZPL/MpSh/LlXL9143PhiK
	neb7cRYr6VbL73MqwoZ9hxyJ5nn0WIMKRt3X6LA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:SUxWPAa76G+3J0BQgxjYGhnhkctOZz0OjwX+Qt2INl4=:Jzdoskc8GKuUpVMhQrT9kCRl7eYzsrnrC28Cb5pFoRU=;
X-ME-Sender: <xms:Nr7aanaLH_WFjaT8ut84_gk2P3XGdET96aMHbIWM2F3IzpGDzgUDYw>
    <xme:Nr7aapdm98p9_pkFl5aVTVKyCz_K5htnSiWl0RtVONepqLPJHAFbLNxg7FsJVJ79o
    qRv1t08OeXbF9V6XIG34eJdvWuYwiArD9lA9tUxo9atN0tcg7k>
X-ME-Received: <xmr:Nr7aakkw1JL43h4DapU2Nx5Rgbk8GmbPaXJfOIRGgiY1ieE08GLuixGOCL3aLUm0Y5rbmhGHqLWvJgC5Pw5BznMYxEeooEw>
X-ME-Proxy-Cause: dmFkZTGCU2C8LOtpzuJKBi1InDLHlNatP6eswYZhMCAg5KFSChFuQSzcwHD+aQ9/vrRRBT
    PRJ979y5LX2CCwU9KvwphqkfVN8xdJjsuhFWxYcSW7iHv5QRHO4uQEmDITrLqp1GRCZ/Pi
    LwwmFZD9WpyauMgffwGB18R5w3bKodCdeqC3/ObEPlMcbbppdJLaFyTTDyX0bB1lAjcTlL
    3S2VAMDU1+MWLcMCX2h6tbaH22OB1zIqDfceCiaBHTaP1hZnRcgcOwhshK/Wg2U5r+TjaE
    6XPaJ1CN6c09RR4MB+rmNIIlc/gd+hsgFo0OvXkgovCNHAq7i5DKwcOVIB5AOwUn8xRCG1
    VwByEB7KPZji5uXPe2VNyujs6Iznv7OkFg1fLyoxe8dhiy5a7II7/CIx32ZTvWPNI0LnSi
    LF94AESxbQetFf7FgJqp1M3D15csyJ/4KRVDUMUGHgN/7maGFVhMOmevwQ+uGxPJgQr9N5
    qLQY+GMqArgvo5STTSM1b5S5E/f+/4q/F/SySHkJ/KAM4eRtKX31f7uHviCLauHbLyLmlW
    vFjUytMaegM1/z09/sey4/hJIhVlCZfo8IfYxltgtywGmKosOPDFngVotZJ2uxSFuMYjBd
    F7DjVq1Fq2FnV2Co1A7fiAgUZWYDQiP8Du90JCuVSGYXOPhr+gJoeqGq6r0w
X-ME-Proxy: <xmx:Nr7aap2cCNI6Vm4znHPwW4_FtBRnA67FEoPNrwpzeSga4S7JUSg9LA>
    <xmx:Nr7aatcl3ESWPK3snz4_GhxuOzbgM4F8TPFkxXJmlm4F7XCAYVwMYA>
    <xmx:Nr7aajZXYTJRhSlmGPvPLlOPJMw9pl5wFj6m0HglQoBNgdZ4lTx44w>
    <xmx:Nr7aaiFoD6vQabaBLRzxJgxqUszoNnH5vdCIS6GSgQmArr7sh3QBUQ>
    <xmx:Nr7aagT27HCRDgw2vnMe-sEt1pv9ay8n9BiRkxVYYBrLhOmINHXPdaWj>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 21:53:55 -0400 (EDT)
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
Subject: [PATCH v3 9/9] nfs: use d_duplicate()
Date: Fri, 23 Oct 2026 12:50:19 +1100
Message-ID: <20261023015239.2163480-10-neilb@ownmail.net>
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

As preparation for d_alloc_parallel() being allowed without the
directory locked, use d_duplicate() to duplicate a dentry for silly
rename.

This results in an in-lookup name, so d_lookup_done() must be called.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfs/dir.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 49283f533d6e..f02b1b068d93 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2802,11 +2802,12 @@ int nfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 			spin_unlock(&new_dentry->d_lock);
 
 			/* copy the target dentry's name */
-			dentry = d_alloc(new_dentry->d_parent,
-					 &new_dentry->d_name);
-			if (!dentry)
+			dentry = d_duplicate(new_dentry);
+			if (IS_ERR(dentry)) {
+				/* Keep using -ETXTBSY error */
+				dentry = NULL;
 				goto out;
-
+			}
 			/* silly-rename the existing target ... */
 			err = nfs_sillyrename(new_dir, new_dentry);
 			if (err)
@@ -2871,8 +2872,10 @@ int nfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 		nfs_dentry_handle_enoent(old_dentry);
 
 	/* new dentry created? */
-	if (dentry)
+	if (dentry) {
+		d_lookup_done(dentry);
 		dput(dentry);
+	}
 	return error;
 }
 EXPORT_SYMBOL_GPL(nfs_rename);
-- 
2.50.0.107.gf914562f5916.dirty

