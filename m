Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297409;
	b=BUoWNdxDPc3KvdokMdJ/SAUAevZAkyh6D24RVThkEzaMSlW+jjHdOG/hemUi+nN2xGTy
	 xR00jRXwlOTNSv3hwitmObzV6kFrqsN7kQbBXZoZHazkixmJxUHPp3HBgdxtiRdD7+Hnm
	 znXzTZxQYIMdsd+A7g0leqX0cYAn7AqUfvRaV0s2oROShk/Yr1SdRpEUo5h8upG97D0d4
	 JMDQTVgNbo6DqqKlfa4jfjSXjIwBAUfsDhy4S2gj8MKh29QGRCdOPtjxw7s2FlCUV30Ik
	 +kaoVtaCmg6+nDCiVVPChUscBnThwJ/BnrYlH4rzfOqQwFYVyX10GFSkbeldVc+XtTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rH9CbGqODly4QJymlyl4BG0aA7nsrIIcMmK3tybqsts=;
	b=12k1jQ3/BENFAWaQL88Vv83NX+5YNVXA0XugkHLMuOPKLYkBckRhBM8AZvapdCZPcLUz
	 ltNGBAa/nbYgoawR5aOSz1Z7zJxuDwowFGSz/Nb3j/iYIUX3vYVw+2NxrLVbncxWC/cHV
	 1bckoj4nVMryYpx/4T+T8zdxBm5n33NbhjQSyfqrGyPVVqGBfecXaJaLHxnW1wDKuu/PK
	 0fJsMFePAd6fT6J6DIchi71+l4WsdhkawUpOCmnwAjAfCmvnVoIxSdjlgW7Pp5TmgcpCk
	 +UggBVQH8xav8n23bn7nE0sKbbiercTkDKHG+Tvi50298n/CvJjcMNznfjf0aPfnP/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hammerspace.com;
	spf=pass smtp.mailfrom=hammerspace.com;
	dkim=pass header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=jiIoUki4;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3E60A6F7D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A3E60A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hammerspace.com header.i=@hammerspace.com header.a=rsa-sha256 header.s=google header.b=jiIoUki4
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843cf077f10so2538185a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1793297408; x=1793902208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rH9CbGqODly4QJymlyl4BG0aA7nsrIIcMmK3tybqsts=;
        b=jiIoUki4j4MwfBdQRja9mQm5YbKyR2UfdgEDEpBelWc7CL+KZVxs8YGe3V4thSYnTf
         4Q+6PlYwf8H0dxXpIZVkw0gqDbX1JjegbhGQsrf0o123qkP9aVQ+RgM9z+sgWLRegzAy
         mXzOKWzYxxn3T25pHgaOYoGMT14v36G/tEp03Ighzjd8v+4bIIhikIk6gOb+8BzUxOip
         IeVfFmYJIsZi4z1gBG6/k7WKvjJtJAehF2bUmKLJyCjPLaBWNFrYAiaSo9l0uVlFKgw0
         Pm1MqLT15sII2XEXTBrAYgBpCOqBlXifLBnUsRmeBl6T25KGkyrt9j3xpkOIqf7olmiN
         p8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297408; x=1793902208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rH9CbGqODly4QJymlyl4BG0aA7nsrIIcMmK3tybqsts=;
        b=ASYoAO8t7WaCho8LCtbE6k2pfSMK9PEz28L9gW5rG9ZFr2NOjjQk+jr+Snjwjoksfp
         OpEhvkmG16AlQQktk9qnCSlJ/UQE65fBHrJqYjGp6UugRKAkqyb/XKqK9XL3NQgHzm1j
         wlboNCo1DpU1T3bpD4JdS5Wc7KTKJaeZd+Ln6JXhXDwHWlO0HKo4lX62NRrj2mlx3AIb
         3FD3MAxCosdzWm6XgCS8dsg4t8QjBdNBT0hU12PmQKVrS9zLI5B+6M7e6SmGF9f1VK7Q
         nb6ZHvq4Fmj+6TlMFGZdfL+59qJZwroquOPEuLjvK5bZoKzneZX/zKBAilvItsZBAXFO
         2QVA==
X-Forwarded-Encrypted: i=1; AKwUvBx3s9XnETgwOiVz2F6zdE5dhIjTbYBoWeEOBnjJbCY8ly4AORF1cjHg2Y9dHYRdTUTAd7JSHpeImD3XoZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJduS1ratPCvApuiTJ8UIHWMhTjiOFERPT3UtU8pdNX7sRzXNWn
	UoNpeI1C5SXbCvzsJi5mEyQtzrFD0OQ7+t+G2Emy1uLNlxQyL5XKJKhnMh23Xs6+Z64=
X-Gm-Gg: AYBFou0ydG0KuI1oeRYqvosQruMbPKuk0POjZIOaT5dBwagxA9POLqhTBuRPq8kSpO+
	IZX6c6Vb24/vdZjwJZSAbkqLO+8WrpzEClzB/mUgJirbQivycqsCWy2J4WckcpmZUZgOomijzsF
	kBPcEMQoCMCVooxwL9XGsdWzhI6nps1ejLM9thKhyy6r/SUkGCHbkiL+xHPQAw/iMo8996z9wwn
	Z9SOzMtYSBlJY92CfQWHrVGxI8JDiVKAqRCHd+e5r51isM4UhIs8IG4XN5KYHTNh4+E9C+KqA/U
	NIwsN1rIgAvBOYtM+LxjLvp/U33ZyNT4gsI7s46xbWjRIVqVJV3WpHFrkRtF/sc2BktB1KkAY8F
	TMjdQzBGNeTxj7DXMvTFWPkpulHaRi+o0BBy7B3WJMZKQFeHTSS/Xt6YqwftD7vwk7ch3x9AaM6
	TJ3ru0qJ6XHupaw3cfMFrF13ojqRobUfOrT+5dF8sRnSo6hQXlbKMPRRDQRb9LODcBVLlGTiTkK
	RG5bOMb3nyXlcViaFLIthUi8MKcsKW2scM6wk+5MVY61xY9d/IzQriDW3iQwI5n+XE5LanxZyWI
	QpvOTxEWO5P8dcEwBmVdSB2AWI26AvdHWYkqq5LOfChYMpdc6Z7HGoZHp7oIpeD9bCHC34ST
X-Received: by 2002:a05:6808:1904:b0:4e4:627a:e0a5 with SMTP id 5614622812f47-56383e91af6mr4444175b6e.40.1793297407750;
        Thu, 29 Oct 2026 11:10:07 -0700 (PDT)
Received: from localhost (75-163-200-235.clsp.qwest.net. [75.163.200.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c654a22bsm4702434b6e.14.2026.10.29.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:06 -0700 (PDT)
From: Jonathan Flynn <jonathan.flynn@hammerspace.com>
To: NeilBrown <neil@brown.name>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 05/12] vfs: factor file removal into a helper, no functional change
Date: Thu, 29 Oct 2026 12:09:50 -0600
Message-ID: <20261029180957.387138-6-jonathan.flynn@hammerspace.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
References: <20261028041023.3738553-1-neilb@ownmail.net>
 <20261029180957.387138-1-jonathan.flynn@hammerspace.com>
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

Move the body of vfs_unlink() into a static helper, __vfs_unlink(),
that calls the method it is passed in place of ->unlink(), or
->unlink() when passed NULL.  vfs_unlink() becomes a wrapper that
passes NULL, so every caller behaves exactly as before; its kerneldoc,
including the requirement that the caller hold the parent directory's
lock exclusive, does not change.

This prepares for a second removal method, called with the parent
directory's lock held shared, which a following patch adds.

Signed-off-by: Jonathan Flynn <jonathan.flynn@hammerspace.com>
---
 fs/namei.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index ce10a408d3..1b3a605ded 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -5679,6 +5679,12 @@ SYSCALL_DEFINE1(rmdir, const char __user *, pathname)
 	return filename_rmdir(AT_FDCWD, name);
 }
 
+static int __vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
+			struct dentry *dentry,
+			struct delegated_inode *delegated_inode,
+			int (*method)(struct inode *dir,
+				      struct dentry *dentry));
+
 /**
  * vfs_unlink - unlink a filesystem object
  * @idmap:	idmap of the mount the inode was found from
@@ -5706,6 +5712,20 @@ SYSCALL_DEFINE1(rmdir, const char __user *, pathname)
  */
 int vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
 	       struct dentry *dentry, struct delegated_inode *delegated_inode)
+{
+	return __vfs_unlink(idmap, dir, dentry, delegated_inode, NULL);
+}
+EXPORT_SYMBOL(vfs_unlink);
+
+/*
+ * The body of vfs_unlink().  @method, if not NULL, is called in place of
+ * dir->i_op->unlink(); vfs_unlink() passes NULL.
+ */
+static int __vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
+			struct dentry *dentry,
+			struct delegated_inode *delegated_inode,
+			int (*method)(struct inode *dir,
+				      struct dentry *dentry))
 {
 	struct inode *target = dentry->d_inode;
 	int error = may_delete_dentry(idmap, dir, dentry, false);
@@ -5730,7 +5750,10 @@ int vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
 			error = try_break_deleg(target, 0, delegated_inode);
 			if (error)
 				goto out;
-			error = dir->i_op->unlink(dir, dentry);
+			if (method)
+				error = method(dir, dentry);
+			else
+				error = dir->i_op->unlink(dir, dentry);
 			if (!error) {
 				dont_mount(dentry);
 				detach_mounts(dentry);
@@ -5750,7 +5773,6 @@ int vfs_unlink(const struct mnt_idmap *idmap, struct inode *dir,
 
 	return error;
 }
-EXPORT_SYMBOL(vfs_unlink);
 
 /*
  * Make sure that the actual truncation of the file will occur outside its
-- 
2.43.0

