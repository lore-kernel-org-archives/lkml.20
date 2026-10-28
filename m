Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160689;
	b=arC+2cCLz6xu1pn30XMFS6JgslNvofdQ0LW0xfeQYeRxiKnC2+D5U7uRDhEAaxnX5E88
	 qF0/kso6Z8MeDEh/cZOSjcDN/aKQrAq7DcP0h4bjj4Po4TMUZqR+mz/IpmlYIT7Z26Txp
	 97vPm0RTo0TCvhLJHqwkHX56QYhs9YR4PWslhbw1vYiOM8ATiyYNQTxMNXEekvL20u+Hm
	 0guZDKptsJsyMFHVPOeU60nbeOMu2iBnRIeePYxVyJ88qgzTgGVfyWlvKQ1UbvwmFIMKK
	 U7qzvuVptetzoIpt9aSfsM1UfRQFufcJCHk362jDRBsnbuY3V3JKnP3lIa8U19wwkqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160689;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=WXi04T/+ok3BZY8mz2FJiL6N6ANbr0Xat+XzDak6D1A=;
	b=VZCnCaFrhOStn6QyQuZomAndY8xCXpYRWEAIvqcGrcV79I0PeTbnLbvSvmK2u3E7hXkh
	 EKcir+tJP1ds8sQpGqf2RFQFKEZ/bdsuoNRMqG5h90f04FrfcopJY4JreFHmKSKgJcUEv
	 lxp8lbtef5kOaopHKD6j9Cx/Lw6mFRYAx/me9FmefYeTbiYokBoSzuDN6a2nDqcwZeyAT
	 cOddDyPVfnTAQxQ64yrMifYWiaxFHRqWMhjZtzYRK/iuTak37VP1JtBNJTjnXv1liEq8W
	 0P7TAHIY3mgXT6JKuopsCB2OjfqdQvLtK/8EiyjN4c90w8lC9KzuSsjsLz8Jd9vRUSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=dcSrrU2M;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rhK3y8Uj;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B27606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=dcSrrU2M;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rhK3y8Uj
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A788D7A0197
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:11:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 28 Oct 2026 00:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm2; t=1793160688;
	 x=1793247088; bh=WXi04T/+ok3BZY8mz2FJiL6N6ANbr0Xat+XzDak6D1A=; b=
	dcSrrU2M4hm3GiLlcEz3Odjf7j+/E8qURv51fZLKiN/Ctdbe4Fb3HG1k8pcVOfH+
	rsqSDgwJlpKauVLAxJS7H8K6yjbC91ZrddVMJbeOzFJjbovH5LxSSz9SudAC8tn+
	6RKs8pFmcurQFH+Magjpo2W5jBx2magHyLXrW2t8/kJZhM+Y1awRkc/pEZlzvkdi
	q647uvpSzeXhN09YUqnBYIbvIS/IfB/r4lCJ6JWHSrGZBJ/dZQegk6ttNrtrku/O
	RIpy8p9UAjgKOxM7NzxMB0vplBuRpAqnKf+bJJoXbBZrcD+G2f8U2KZ9dhKimo2t
	oiNEdL8Km+8LWs+b3ghXZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793160688; x=1793247088; bh=W
	Xi04T/+ok3BZY8mz2FJiL6N6ANbr0Xat+XzDak6D1A=; b=rhK3y8UjFvzS5Tzjq
	MG1irWxB584uFWG1HsN+64jhKtD7uR3YFe65mciWSbI9Q9V9/ZOLn1aB8jZgsp++
	X3VzpST5lbVQWC2EKbu0u5cSEtzAPN6ENchb+rB2KOY1WDuuNzb7n0TkNj6G5oeN
	exy6W78/7h2V4CyukjNO+cHQjr0z8KAMznxpf/E/om3xL1Phr9t9C3A0ZbC/0yFY
	rX+FOWw6QniTFYRQ+AI2FtslFupptd8rU87TufGkczcGfHoC6OmXL9O+CicUUFA+
	r0IMBMWKseoT6g513PIUos+oxmEf7wjO83usnA75RQNvK4vyRBzWMuxIFk76+ugw
	++3Og==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793160688; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:RbLAOFXbN55reEJ+6ccGDd24lenE/Y2Yi/JmwYurG1GtE3j
	Bi4+BMkop+gkTbGei1GqjtpDjcnYwMllXr0o2W5enBkRJ1c4xVde5jQjSqWAPs9g
	sFd14yQJPBIo8bx0Q7Q8BAoZKrMxDotrhv51gUYLVmR/Ylf5FZk5EiG1pfcy3HgD
	aLuTbJAYYDI5VUZRBP/VNb1ZrtR1Xgy7nSJd/1BkTKzDZSTBQ7LFTM2yDZTWQFbu
	cfg7yzhlzpyQGEgaNyMPpacbJozlPn0h91raLnkb2SIc//V/fNVekOXfVI1mJFEk
	l3wK0HCEEuiFnuGjn4bNBwipwTndPdxu7U7XH2A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:Sv76Xp0wF9An3N4kAaJ8dUVpL+lRFUAxN2bMFRw/75c=:A3YQRhMTVvTKQofb4Vzzbod+BrJee9tYj6u8Kt8Vt5Y=;
X-ME-Sender: <xms:8HXhaqlwNpWsYr_9aE-OpW9I-B0DKevOZ3gBwNifqod-rD8dDI4iiw>
    <xme:8HXhaqcRgNJYZu-iSPCq7E37X6HGVbNrlqqm-Oi5roW9wNpzvGRKqgKIn4i6UJaS1
    c-mEEJ7RlxiefRIZ520rpXLFfgnFfft-d89AqGaG0dZdtK8N1s>
X-ME-Received: <xmr:8HXhagFhPL8WnI4K_3aU-S_2q7dHFemaW9N_XQ020E2iznSjQj4V_T6uuOubGx57dxJpOsI7xhxfFLc3jhRXASukxz-faDU>
X-ME-Proxy-Cause: dmFkZTEtaaJo3zhk6q8YHjcrAGFhzjZGx7kav9mjn36dhiCDz1sQNUcnPXqPMC3VqBUdUM
    QC/BqNrn6VDtoNvGfXsPC6PtPC8Yf5vcT7dSqr4OQVWjbDjoqPju2ao8WKvEVWn6qwQJpD
    4CN6jGUHDBUbMwADgY1eHpCxVa8gj9W+FVkilH/Bf9wmvEra1caZDRUZmQcG/Ro3xW8rsx
    nbEpGLXA1HN5mBuF45EijzjRcn/0zOhqfoHROonBfk2oQm2kGy7PxZcAZk+GCvIPn4bVTg
    3udSvT9vlUjceFzrt+IHSgKFct3qykKWsSJoK8kyGUhtj7khaHZlaj5tXb3YwgPRJ+b+WI
    fJOwY1fvZJWouU19MyzZsKr1BueK+CMnOOggKYdmiQHkole2TEpWQs5QL49Uz+mUpyeLaA
    9W/aodbSl6AM00B2ItlIEpFn9/f2mto9T41zX391hlM9fog7MMw3TBhyAKnzP79TgR+/FQ
    bFEEdrd7uOF5vDqgkMXz+RJSlBpjk4ZoJFiG7uu6+9tGsNbK4iB8H4AEpmrVqGBbWEcO4Q
    3NGYzKypmbCPRjh2627nhM+yNwcoQJlI4wQHE1LSgPTpenuWTFOgk/oIBxhWVO6Msh6Jyp
    EhScaZlNkdbaU0A58STeIeYUALR4R+ol2aGVWDECSsrvHN6oww8crnVWtVrQ
X-ME-Proxy: <xmx:8HXhaohOk8bq7mVGwakq53-UeJ7q3iZ3445c_njKLL2_AfUcsYZyKg>
    <xmx:8HXhas0K2Pc_6Ah8Lp8UjO1pwQd0_CMhHYzHmwWAXa8dVZyaJAvsHg>
    <xmx:8HXharcA_iNb1wmt79LhKp0qpBXNxdqd2XNfE7JVjIclWJyTfIWoig>
    <xmx:8HXhaiz1LBVwWIlnWSWIl3Pzjg7Gn_JdG9kO5OdtWK6reoSNlHUQ3w>
    <xmx:8HXhaltiv8ZtrGmhKyG0RCmA7UQiXTGe0tI7PXSudHvTAPVll9dnBD1t>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 00:11:25 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] nfs: Use d_alloc_trylock() in nfs_prime_dcache()
Date: Wed, 28 Oct 2026 15:06:35 +1100
Message-ID: <20261028041023.3738553-8-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261028041023.3738553-1-neilb@ownmail.net>
References: <20261028041023.3738553-1-neilb@ownmail.net>
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

NFS uses the results of readdir to prime the dcache.  Using
d_alloc_parallel() can block if there is a concurrent lookup.  Blocking
in that case is pointless as the lookup will add info to the dcache and
there is no value in the readdir waiting to see if it should add the
info too.

Also this call to d_alloc_parallel() is made while the parent
directory is locked.  A proposed change to locking will lock the parent
later, after d_alloc_parallel().  This means it won't be safe to wait in
d_alloc_parallel() while holding the directory lock.

So change to use d_alloc_trylock(), which removes the need for
calculating the hash or doing a preliminary lookup.

Acked-by: Anna Schumaker <anna.schumaker@hammerspace.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfs/dir.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index b296d90c8e14..4ceab6209e4a 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -749,15 +749,12 @@ void nfs_prime_dcache(struct dentry *parent, struct nfs_entry *entry,
 		if (filename.len == 2 && filename.name[1] == '.')
 			return;
 	}
-	filename.hash = full_name_hash(parent, filename.name, filename.len);
 
-	dentry = d_lookup(parent, &filename);
 again:
-	if (!dentry) {
-		dentry = d_alloc_parallel(parent, &filename);
-		if (IS_ERR(dentry))
-			return;
-	}
+	dentry = d_alloc_trylock(parent, &filename);
+	if (IS_ERR(dentry))
+		return;
+
 	if (!d_in_lookup(dentry)) {
 		/* Is there a mountpoint here? If so, just exit */
 		if (!nfs_fsid_equal(&NFS_SB(dentry->d_sb)->fsid,
-- 
2.50.0.107.gf914562f5916.dirty

