Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873691;
	b=RddqmKBzsMD6gB3uDelHj4arx6A0Ifhr3xVUnQTPYsSwlgqSqSqwGCg0lPgEUkEysmkq
	 oOowYhcljXM98ARs9KUVAUHy4hrZy6m1ovVgb8vfjpMiZ9/DzqhG6hcu1GH/d0/w9bjvr
	 vcfuRfU0J2gNCQ93RnhsHesT2yZMlgOsBHXIgwHyBr3h2znOcZXbVJM8if/dU832G/hGc
	 60gWRNbRWB5Sgjp3d+HTTfxEVFoRnclXwbevih8IA6qCuqeFrQm5tzJn9xpKP3WyIT7bt
	 RMf1YmfF0xm7rmFr47aIsYbEMzMdO+VpGCglfdQ0NH8Cl8jjhOul4b8kw9npoFeVWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873691;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:Reply-To:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VclKIlHHA6sJRvKYQDUB0ymsoIETh0nxUoTC2xTBROc=;
	b=4tEJqE8y4odQnFOKu/JCgl38Rvmg6ho+Np+DokX1qmY5DHwVIkCq4bAsXeiIvXkT0LLy
	 X9HJzHwNuV/RthrRnsNShR5gYQJwrldc6Y3bKRyG5SiJWVmNiU+u7l43HIoAYo9JKpuTQ
	 GUEXPoCjWmn9fErx+DGgK14edZHRKvZAjV+TwWl4y/6hpqt1crCzGhwaIH5SfdGvD0lkU
	 pxCQf7DmiYEHafypZm8FVboYvMcn4eIjeojlxmSwM+Nv3XebcbI2WgRN9YK4kCuid6GmV
	 6wuMatGiZ/IYnbXsl4r09nPoSQEDTLnyjFMYzig+Lg/llCJ6pmepaamPPI53myhQq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=kRzcoJ66;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sxTVMqnc;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF53606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF53606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=kRzcoJ66;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sxTVMqnc
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D85AAEC0844
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:01:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 16 Nov 2026 19:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to; s=fm3; t=1794873689; x=1794960089; bh=VclKIlHHA6
	sJRvKYQDUB0ymsoIETh0nxUoTC2xTBROc=; b=kRzcoJ667cUXvisSe1N6SZcN4q
	WnY09eXeCv+dtJ4kiKJdT9thSHgftISUXwwUr0WFuueS74+x21ZUpM97toG1DkzM
	9wA679dC0R89tzqXIfMF2s/PtfAG/78f0+gfRrC2jW551PHQku+jVzIzR5cgftQP
	li0HSIsl52Ckp/adATHQCRplZ2bGz/pGvqHggMF4VHkDrNyb8EdzdT1DmMj5RBxk
	/AZqTFlpzBwwKIEuJcZfekuU1ZVkRS6sTcdFlHEnvq+gZJjI3CygLtE8/Xx9arLh
	ALraIstQq/QEq4R9kGH9+Jz4M658Cn0JBWX7jDcn4UyKHUAMuIthigmjKRMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794873689; x=1794960089; bh=VclKIlHHA6sJRvKYQDUB0ymsoIET
	h0nxUoTC2xTBROc=; b=sxTVMqncODQsJB3CdIxwydPijrkwtkL9GR+b2Fd5OM5j
	p57hYxuZfc8iJMiSS7wRl7ofwvljsbTNSuU7rnorRFL85aAecrcnF+UMBUx4BPlg
	YuHXMKrcYA600CjY+Nfuvqe2FtZX20G4HD80JVbjzrHeI4Lh6LnCzFDu7ZhtYeEy
	fUbCdynP1/ysBOv+bHvMAqZmo+7ITybhB9qT1BTQ/xS8L+Sqlb2e2LCkey9fQvpC
	YDTMfTozFCG5g+w/DHejGWiMHEkbITz6sYFFvXqudHmoeChW7yrgItSsCJZyelt2
	InZTMoS9XXCtbFdWIsLhUNnI5xK+bOEWJVAl776EPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794873689; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:gdJdhFmG+PeTEH72WnS4UuXPRjgFE99L8E356RuhMiYk/eV
	B1BnzU1BDHqxkq82z3fjNaHouwgV6KYRoYwkLxBDlDNBA1kYk0T3PJrkf2qPV6U5
	RYa7AbsDlWdp1+S0eaxxg07J4OXJ0F7+zQOxKiejsI+KwA0B6NfdE9j+tljT4UBZ
	10oZdJbUQupVqCFXP/NAnItH/2JbfjyiYksneMxuVIlwxOxtkfyccDOF7sAVO2LK
	GGnn7hr3LTwa+JlOcDzT7KGkkahyksC8XA3LSLFu5O9qnnKyssgzMyeEqy6WD10v
	oLujE6bxlsHbWw1q+hGTiN1MVLqE0TjwHZFKfog==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,reply-to,subject,to;
Message-Instance: m=1; h=sha256:DHMeLMEDMgA1DsP9ifE/HQN9j5FDVtbY1HGX4wUdWKE=:rfa9m0UcUgaCLag8g7pw3/CotcToDQzfpQPsiR5Ld1o=;
X-ME-Sender: <xms:WJn7akNlHS6nh1LPAdeQ8mJieXw0dTqL30HtmkQ8WSKSwLh2gdBQPg>
    <xme:WJn7asQAFB1AaS9BVITpRd2Ma6qfnNP4h41W0GxyDvxI6B2a8mWoJbaKqbFHpooda
    eMMaqVh2ECpfY2a5hbCbUFZGlokquvgOkAolJvf2GIiOtpZUAs>
X-ME-Received: <xmr:WJn7av5vE6I4wSNgOH9D42nCte-LZAFL_IHJiaUlLsZQUDR_wQSajghF6BLBsmdbULCMhJAzYKTQ9IjAtLJA4s6bVJvtKQY>
X-ME-Proxy-Cause: dmFkZTEasDYJk7gUKjj95qJVCDLZ9z5UC3lFOr3mxXp2NqpnduBj0huNRvY2bKuTgCo4S3
    /ya8LB3Lk1oB3klihdJ8BJX7HvucoWWfwxXQGZVCiOL7v1xyZ9E98HqZfATW3DsfVt7Buf
    HDDi7kdFSz9V0lrnyG8NHXxthuyOZNaaxSoPUxOpn/Lx6gss1jQ90vOmLNUrp6zNAp1xK/
    E4mh4beTE7vRnNF/4JgosJzZk15qzccfwiemAiZKTwiIk+j4r/xWrb9oLBME2rnW+IoIvW
    0V/qJU0eecbujgkGwVUDIsxD3Y6lpRQk5PP5i06J9n0ZK3tSwD2jlIApyzfnpXecO0aekI
    YP7JC9DDnt1xRq9JFMoLPhAYpZkAtVNVNSH5gEoZIi7C0aPBBsQBMIViGuIiKDao50lB9F
    p6tN48LqvrHWNcKcaWmtCOeMnAkIkfTTnVk9/JKz/eYXPvTAtHz5Mvx5G2IUqqpw7j5cte
    OB/XPM6N/K5BcHWjLoCm5nM9RVsNCib50G3J2xslJ3/rzsBiKDyfUjfU+8KsQEsWr1Ur/t
    gHkZmHuiiGV4Uc4653RVdjM/u8Tw79N1YjLfxU/d6QHtzCJrdCvtEZ5UzyiMIVlPeCsmol
    fRQfVzoheGRV/H6KdXDBWV8edCUkBEw3bhvtVjD8eIAhz4kEOMh3VLZBCI5A
X-ME-Proxy: <xmx:WJn7avaKyKXmKVjcLrcBrlYWOhs0GdLqhy2PEMb0vkme78mxFeL_4Q>
    <xmx:WJn7ajbMKXjXNIp0U6ft9ml21M-9hQPLEi8q6uLIIA94zBBqbhzD5g>
    <xmx:WJn7ai0-eejyGrgasRnIdMps7wNS0XmZWgUdbySiZaLmd17dG8K2Qw>
    <xmx:WJn7arYqthUhGb2DFEgLfdNlRGKnc-gg5Cs0osnHyattF9CnN6zuFA>
    <xmx:WZn7ahWueiiJZNMoiG7ULnt1omal0J4HlDPfylQ0ZSRLnwPdbysG7_i2>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 19:01:23 -0500 (EST)
From: NeilBrown <neilb@ownmail.net>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Harkes <jaharkes@cs.cmu.edu>,
	coda@cs.cmu.edu,
	Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	Carlos Maiolino <cem@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	linux-kernel@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	ntfs@lists.linux.dev,
	linux-xfs@vger.kernel.org
Subject: [PATCH v2 0/4] multiple-filesystems: prepare for changes to VFS locking
Date: Tue, 17 Nov 2026 10:54:57 +1100
Message-ID: <20261117000115.1433875-1-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
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

In this v2:
 - shmem patch is dropped - it isn't necessary and the is a problem
   with it which isn't worth fixing at this point
 - configfs patch is dropped - Al didn't like it and it isn't 
   necessary
 - ovl patch is dropped - I probably need to solve that a different 
    way and it is significant enough that it deserves to be separate from
    this series
 - slight renaming of bool var and goto labels in first patch

Original description, updated.

I am working on changes to directory locking.  The medium term goal is
to lift d_alloc_parallel() locking above i_rwsem, so d_alloc_paralle()
can be run unlocked, and consequently cannot be called when ->i_rwsem is
held.

This patch set makes small changes to a number of filesystems which each
require just one patch.  Patch series for nfs, afs, cifs, fuse, cephfs
have been posted separately

The main requirements are:
 1/ that d_alloc_parallel() not be called while i_rwsem is held.
    Places which currently do this can be changed to use d_alloc_trylock(),
    or d_duplicate(), or change to drop and retake the parent lock.

 2/ a dentry must not be d_drop()ed while an operation is ongoing, as an
    unlocked d_alloc_parallel() would then be able to create a new
    dentry with the same name.  d_splice_alias() can now work with a
    hash dentry, so often the d_drop() can simply be dropped.  Other
    times it can be moved to after the operation has completed.

I think it would be best for these to land in the VFS tree and would
appreciate Acks from relevant maintainer.

Thanks,
NeilBrown


 [PATCH v2 1/4] VFS/xfs/ntfs: drop parent lock across
 [PATCH v2 2/4] coda: don't d_drop() early.
 [PATCH v2 3/4] hostfs: don't d_drop() before d_splice_alias() in
 [PATCH v2 4/4] procfs: drop parent lock for d_alloc_parallel() in
