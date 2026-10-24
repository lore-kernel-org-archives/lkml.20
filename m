Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877669;
	b=dpdoboAKG4/Jt0GPnetqnUCTFU5e/23iN4NTr43SMO96qHkJSXicRgfrBwiEJwNPnhbe
	 mBr6ENB9qaWZAmYT9WgmAm4ZOlUQxJndg9U/lNr7nJn4pStADp3eiDMhybZEIeLZAP7+Q
	 j3UPtyo+20jdlQ3EWw7pPdMyuMnB4a+gXqHEJ5PE8T5iRTBqpGhVC0DyzOHZdvDVUW37s
	 1LVH8GQ4dvwcGPaDg53eWRTCqzHv91nilJk06KF0txeMISI0e+kUxR8q4IkWTDea5LLyg
	 R1wyWRUBA7BZ2jkgCii+ORco8ZQRnDxaP4NpJyqnEK3Q6A1OpbCV91LncfFxaPaROAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877669;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rW+kv+6vYJyaP/hD4IHRUviYRyfuSjLEi3DTzV1Xzx4=;
	b=0080MM2HzobBmsUAzmNHgyqetCgVqoSEUD0pGslNcAOI4wpuHTyt5JSQIPU2d5ROZ8Ai
	 krYZlZjBFp/mlLBISKrlt5Mb6nqIOzoa1a0r7VQ5lsn1T06iAm3ym0uJC+47DnTgAzKR9
	 HHXgcQ/Q+cjT+/j/FRM5vZe/9hwRZUwszrm4VsFUk8tPPwYi7BHq/na8RbARbYKohjX/a
	 3bM4ShDAfDUyokNKz1gYThOzzUgdYfSywxYToAX55hnzL2J7ohfr1nJlNNzMFTUVkjPOv
	 7J6RhyX6UD1g79+TB4aEFZ8VIqmkbd04JSh1NkZpEt+ZlnVmGDdxJSRT46THWKfivhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=oz4qxVlu;
	arc=none smtp.remote-ip=195.121.94.186
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A7606A327
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890A7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=oz4qxVlu
X-KPN-MessageId: ae950a77-cff2-11f1-87e5-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id ae950a77-cff2-11f1-87e5-00505699b430;
	Sat, 24 Oct 2026 23:34:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=mime-version:message-id:date:subject:to:from;
	bh=rW+kv+6vYJyaP/hD4IHRUviYRyfuSjLEi3DTzV1Xzx4=;
	b=oz4qxVluCtLNWMhDWnQGHHjpZB4WMhWZY4HesTZMOOppvpKhzkHY2KAzJEDD3Tlr/jUm3TSwWwPoX
	 s1elxRHLXtdesmHSGicnUG1t685OS7i2QIfZrpbQeWJ0QZNvhitittYXh11xbN3U8VNrTQLJVtxL5H
	 JHEXS1es4IQ9OAE8eWWS9bBcuAd10dWQuvWVYKw7CpdR6GI5NsYZMcPxgtxz+B6IcqABptTaJ26OtJ
	 uz+ZXXtsDsAmqIWdRTAaeQuvHHYYhvZ+bC2FfUsMJfn6JkLZZnMQ8KZiQrbx03ppw2Q11p/6P57XoW
	 gVgzTyXYQLKVJAJOlDO8O3DjPW+nghw==
X-KPN-MID: 33|6WWWsZSe1oDbOrEw8rRGNxVbOXmdDBSibAkQVrFHg47BPIZPtyeGsHpZN9hltw2
 dWT4z9yHgvOqBRDz6U35E0vqWMwLbsXkE5isNvLmtu/A=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|hD/e1Fha0ibWkig3+/AwCiF8wgcpVwO8WnDY/yc9cKu64KW1ZNY/YRh0kjDkRTP
 GesfIopYCnwX2EtmYoszlQA==
Received: from daedalus.home (unknown [178.227.247.81])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id ae5ab32f-cff2-11f1-8686-00505699b758;
	Sat, 24 Oct 2026 23:34:24 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	neil@brown.name,
	cyphar@cyphar.com,
	jlayton@kernel.org,
	amir73il@gmail.com,
	shakeel.butt@linux.dev,
	gregkh@linuxfoundation.org,
	tj@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jori Koolstra <jkoolstra@xs4all.nl>
Subject: [PATCH v8 03/12] vfs: lookup_open(): move setting FMODE_CREATED down
Date: Sat, 24 Oct 2026 23:35:30 +0200
Message-ID: <20261024213539.1307600-4-jkoolstra@xs4all.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024213539.1307600-1-jkoolstra@xs4all.nl>
References: <20261024213539.1307600-1-jkoolstra@xs4all.nl>
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

In preparation for using vfs_create_no_perm() in lookup_open() we need
to move setting FMODE_CREATED on the file mode to either before or after
that call, as currently it is in the middle. If try_break_deleg() fails
it is currently not set, but vfs_create_no_perm() includes a
try_break_deleg().

Going up the call chain of lookup_open() we see that it is only used in
open_last_lookups() if no error is returned from lookup_open(), so we
can safely move it to after the filesystem create() call. This also
makes more sense when reading the code as you don't have to wonder what
the implications are of setting FMODE_CREATED before the create() call.

Reviewed-by: NeilBrown <neil@brown.name>
Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
---
 fs/namei.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index 9fa94e8079db..94958b77b371 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4582,7 +4582,6 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 	if (error)
 		goto out_dput;
 
-	file->f_mode |= FMODE_CREATED;
 	if (!dir_inode->i_op->create) {
 		error = -EACCES;
 		goto out_dput;
@@ -4591,6 +4590,8 @@ static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
 	error = dir_inode->i_op->create(idmap, dir_inode, dentry, mode);
 	if (error)
 		goto out_dput;
+
+	file->f_mode |= FMODE_CREATED;
 out:
 	if (!IS_ERR(dentry)) {
 		if (file->f_mode & FMODE_CREATED)
-- 
2.56.0

