Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873709;
	b=4LkA6+qXGzKzOahM9//9RLCRvHqMZqXsLIU3+rcoCvEv+6CKy2JO0mj7dgWKIsZ4I3Ks
	 eN6Tb6FsZWNPnm6HCSbhbL9uv5HIoV8gaa3C6L+uR39dlG1qn+PrJHJvbSpswqp0fMvhT
	 QqxukfWNoinEWsLtj9NTHAFen/R/u634paSP9PCQ/AU6xaniRUCuN8uRsZuMsECx8HOep
	 YNxOi8T5MD8ahNSBieGd9jLt5yO/LL7EVnQkUnW6KCeRBOaDGjzcRpdqxQ7UkzDjSVVve
	 5d1XlpN2B0dYsvpmNTxBu0D5oD0kzTrO+XcPuKSrwuNypqz5WQr43VZ936fNNdSxSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873709;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=iIAOm2lO6QpQNVOJTbL8Bgbw9WIRjtGNSHgIT3oLz3s=;
	b=QEEih3lGrVjbAMRWjgeF9mgk3gqjkVanDVJxk1BNxehU0XZmDQd09xECdG7C6gredRS9
	 c/52ayipcJSg5NRjnvWqD5ajHubMINcP+tWoYOJyMF5FqtAUD9eKwEjRgr1y87EGmFA/F
	 +1hZTNU+5G50pgMt5l0YQQkzU9Orf4uXdNkT7loYI1JSdzp//NQXQ3fGT+h0VPvQZS61m
	 3vYWD/XtqjoeSHmqgrYpyAKDjOOd44SX4IThKuS8uKgxvN3llrTKU9XwNTtbRF/tcAXD2
	 Okmx54RZzszI6zX3c6ix1u4VN/xceP+jcXye8iFDSp5jA18jC/0/Sgj60e8V9ZfYcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=F+LoLdgJ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=e0uXZ6Tp;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFBC606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFBC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm3 header.b=F+LoLdgJ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=e0uXZ6Tp
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id C4328EC085B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:01:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 16 Nov 2026 19:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm3; t=1794873707;
	 x=1794960107; bh=iIAOm2lO6QpQNVOJTbL8Bgbw9WIRjtGNSHgIT3oLz3s=; b=
	F+LoLdgJT6wgJNGy00Klf3LfXZvSmPoRA6FnIDNMYjAe86jj2ybM7VLvJrjA6fYm
	mswVk+69ROdPv6HsIY2RMrtrZOdY2OYbfT+PtUbYdJ2CjVxLr89gDUzjcwxiwXAT
	LRnizKiJWzOO05YBz+AqJ10kc0hRJl6p84VVJQOnnN0E9K4F2ixPbsHx211dYgZ8
	8BDFbKc3sBIF7L8cDMCqT/PD5GwmoWrFTAi6u7KBhN1J+p+27IrE8IOi1HobGFim
	WM9GUhAb52HghD7TFhE3uKTegmBl7/BG9OiWKqKkkUlDovqj9AFgvEIHubZsJLj8
	9vGaj1ZvueitlNXeBIkwwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794873707; x=1794960107; bh=i
	IAOm2lO6QpQNVOJTbL8Bgbw9WIRjtGNSHgIT3oLz3s=; b=e0uXZ6TpXVcXjwuf0
	ABzlVoX1hlcJbumEFfc8uNQ0CmbUkxu3TtnXFFDrOyDaFS+w0cSXFn3VgzIxGVv/
	rj2ar5d8adU3nHmoUDjfMInMIiORlYV585k3kThp+3eiioxa3WpVGzvUH+BziGXJ
	dSScSvM5arLMV/vmsdCvGH2V1CXKB5ADPHaVPhezToPEh9bw0zbYz0R4GkaOmX29
	DaL3I4T6Few1TQfzXODNLpUSYbSeK420RASszdo7poekuGAeEhZ/xPkMU/fSuRs6
	GjMOwPqcVZBpd+8Bn83HI1mLQN8a8ZSImo/YChb9MQzfXlfHsp57I77cg6TuJx+T
	tPLLw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794873707; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:UnJDJJ8+YopKrrMHH5272sWF+BaYR0bEda3mW43lvdM4trE
	Q3SA2etBz+EPyPXZyK2o0geZ+uYgCcJnnO+e+fuZjOPaF3KmA6QBd0B+wlosvHma
	wu/SjFl2huenOdjLI9PpIXjV4l8XkJ/2tD3DoqS1ab2Jlyu1Q5BT0RgJjp8ErxrQ
	dckAGuRKxGaeDtlLU30xnJL/WlRSQtnNsTw97JkSCSj1scvZVKU+wnpHNyWRcDMn
	KydwgolSf5z8Q6mmkGJaUqW0IyazMKirasBxNl1xTa7NzcDK8acFXmpMaIKWij8n
	wa+SiaIblDhSN0rYz8lXYoCIgyUcpoClMCeO8+Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:gmiRStICROQAPeEHtzUrO1Osv21BjjsgukamHKPkV6A=:TnYk6Us2qwHOQ7ZbL7drRjEiRjFRhnkzrlnE9ZTXkBc=;
X-ME-Sender: <xms:a5n7au7tZIU0ELbSk7_02uku1eLe8y9q7QtSDDhP2P_DK9ObYPNvEg>
    <xme:a5n7apPT9tKsWMJnfJC2CcthEjaz-WKVRHzW2ZQK_xYZm_l-ARa5XQUgq4YdqHOiA
    areO-q-4iWq8Ef98vLbHyLdvLtBfQctPYfTNWoXucFt5MBN8Cg>
X-ME-Received: <xmr:a5n7aiEs4bUBEyEzk3Y5kDUDkVoP1467SdOz1Co-MB4yLenWUc2DQLd33Z9GEph1BEMOpOiVXqIVEvcnU4AZyXfXMVtvorA>
X-ME-Proxy-Cause: dmFkZTEWLllwmZbCQ7cO93As6sGHtjiFdYj9k/VSqMvUwk1xfk9pKn/ZCX7mnpLkIaqMef
    K/82szmVYemJN/I0DCAIOCHeaPZ7/Xa2GnBqk902ewdx8hjF22LzMBgW8kwMwZuhDEqmG+
    fRzfUtzcgzHNqdnt0hptgxxppIMFQUfVlAsIvg7fvTNv54Da321pj6NeCTNh6yP98D0Rix
    0qUujhXor+6vA1uX99KaZah7Remd9bF8xjGXqzB2MsscQiqTyvs6dLxlge9fkMF8nj1I3u
    +RSOpU+TvlDvjmsK8NtReLJ34nN/1FLS6YOAknIb84eISWftGKSVwY1LnVjpVMr2cR7DpO
    Y0h/zKtwlxM0uvEfa7g8Jx/Ey/3+ldN6Sjz2mRXqaEZ2hmLY4820tj8fL6lwjN21CoBYQz
    GIWLW9iEBzj59lwXb3i+Nhfzpzq83E74pbh7inCaF4yKQsKw0NTRW4w1npTfrI0VHN1QqE
    TVzGrFEbQJb6Whs732iR6GGZBw3CAbBgUgj3CmiR11QFLXYe79wKSy6nV74BTgcaF8aSbT
    a7ZjNFSH6+6cXY3bpNxdzkUL0tqfa4vfmJ9LR6x3TELkcnAkrPqDG1f7kYWfQg/LoXiaoN
    YyZbJUcgZsmsXk8ZyJSwLI9Mvtz8pgPOqDpFIdIYh4Q1qZqMw0LFsciurKQw
X-ME-Proxy: <xmx:a5n7at0XrbVLqROgcupNhRbriS5O-bsjQ_2AG5f8yklDRjEhSqsN4w>
    <xmx:a5n7apFUBcquhGw9aw-1KfPVB996xWjWf8QHc2-7pB9HgjXwcCeACw>
    <xmx:a5n7auwOWJ3i-UqOdxUfBRaHyMEOb3SPf7VRuc7f2eJ5DQO53LRFpQ>
    <xmx:a5n7agmmNFpZlhDsOqDxcM6F14WY5mmhLliXtb-C8oLmRlOXJOWj6w>
    <xmx:a5n7atwtnaAGimM0pNoecCnJ7u-xKm05MYFmHVEyVOPN7lmS6VEW874k>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Nov 2026 19:01:41 -0500 (EST)
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
Subject: [PATCH v2 2/4] coda: don't d_drop() early.
Date: Tue, 17 Nov 2026 10:54:59 +1100
Message-ID: <20261117000115.1433875-3-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261117000115.1433875-1-neilb@ownmail.net>
References: <20261117000115.1433875-1-neilb@ownmail.net>
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

Proposed locking changes will mean that calling d_drop() could
effectively unlock the name allowing a parallel lookup to proceed.
For this reason it should only be called *after* the attempt to create a
symlink (in this case) has completed (whether successfully or not).

So move the d_drop() to after the venus_symlink() call.

Doing this also means that if the upcall that handles venus_symlink()
happens to look up the name being created, it will get -ENOENT rather
then a possible deadlock.

Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/coda/dir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/coda/dir.c b/fs/coda/dir.c
index a85be5962e62..b47299527b65 100644
--- a/fs/coda/dir.c
+++ b/fs/coda/dir.c
@@ -249,13 +249,13 @@ static int coda_symlink(const struct mnt_idmap *idmap,
 	if (symlen > CODA_MAXPATHLEN)
 		return -ENAMETOOLONG;
 
+	error = venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
+			      symname, symlen);
 	/*
-	 * This entry is now negative. Since we do not create
+	 * This entry is still negative. Since we did not create
 	 * an inode for the entry we have to drop it.
 	 */
 	d_drop(de);
-	error = venus_symlink(dir_inode->i_sb, coda_i2f(dir_inode), name, len,
-			      symname, symlen);
 
 	/* mtime is no good anymore */
 	if (!error)
-- 
2.50.0.107.gf914562f5916.dirty

