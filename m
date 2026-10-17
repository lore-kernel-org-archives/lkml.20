Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E133F8B2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230384; cv=none; b=ZbFWmOkPbjLunDFYJPGPK/xwvUhSgoSeh6yEPGWt8N8qJkqN1uyz/zgfv5Aqiy+XBIMLrYSh8lnSUMKeYAlBYkODqNKeieuQOgD407s2omEG5MvoNBAeu7oVeYHIoXq6lAacsTNeQBZc3iygiTAkSkAwdmgwedwJlBKy1UbUDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230384; c=relaxed/simple;
	bh=TZz1crEg3zzxMgZGJ1WipSQN4v8kyBvYzp5XWcZlmU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOi2b4HG5gmOZvfN3uaWEIRNzOOELgTz8uFYiUojH2b+cGc3bGgbKXNCPw3/uXc8q+Mo053RMnxa352rY1C/U+TuKlmlVKkAGFH33VIe3qeC0IFa4esaJBMGfUaXec/AawoPxC47V9GAj/MK4zL7c4rbo/rarJacIJaz/sQH97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=mG2xAMGn; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="mG2xAMGn"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9144e8021d3so8603516d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792230381; x=1792835181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P90bN1D4uqhQhb/kG3ARk5SrE0A+Bx6rHl7Bkm9kIqc=;
        b=mG2xAMGnFPY5zCDaySC2DsxIVoJEer2oWoe2ILdtgo0kAm6J1JdbPdCAtgh8jw+TeO
         U6SyAwFlcuxulz/xV7NZvnHv0MwMUICYpi+TPV1h3tg5WW0bP3joJK8isG7HvHJUCSjm
         ZE6Z/SwnPdrYawIpdOs911S+Ncio5llOJ7EFwUbE+z+Nc3jgmUvHVAlBHB2+yzFLv0xa
         09me/4KueEFL1PKnVLRe06B8fEDb4hIH2SpAQOn0Qh3STuFhEvoXu28c5v+GnSGNTpiw
         W55lXbAeN1bSkOUQQ+W4m0nButQtWdBtSli3/GkCslYIcI4P/dEQpwizZB72afkWXO7q
         2+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230381; x=1792835181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P90bN1D4uqhQhb/kG3ARk5SrE0A+Bx6rHl7Bkm9kIqc=;
        b=tRK0cy8s4aRpHOeE09UPtHE6sOccpPuQR4maqXOMJwqMTQ+EEk9tk9Kk7Nu6WMWyyg
         z72FeExbd+HJbOqhDPjNlNfR0eEB2FJo9EEMPKOoUNVuUigiIUq29RpHi/4nwoVJg6o8
         zBRtfFteNONBJOFHl4r8fNXSREDLTCxLI2wF47E55dvaSAeIq0lMN4DtLF2OJgTD+Kfz
         s1QaHOXNA0YXBZq02zRA7tLUgFZ2Q1XVOOOlHjDOSK17pExHm0kqXao70Y97qkpHTCTF
         R4i6mUDUSSKlnqeruDAc8xmPFbm+c9Ox8SkphFR1qchS4y64h4/upraQ0BYE/zYQQobB
         0G+w==
X-Forwarded-Encrypted: i=1; AKwUvBxG1hNnJpQ5VtwTUfhnbxKWueHLScABAMss1DQu05tAPCLlAcQJd+MIQ8cZTHuGTN5OdV903TldxOxhW+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh+uMOpV0RUScU7Be7TUgG1KBIIf8hUiTVdsShsUVF3lXPAr0c
	NREHbgyvAzKmuNgkd6zqv2Kn4NX5btaV42ahLIy0JAX1rMKMTmY2qdOtY5/TiCcchA==
X-Gm-Gg: AYBFou2nBI+EQKPGd/lzHtPjhFl0os9CRh3mSt1CyiTMQg5jvSBLPRo6DIxmA80cm3w
	lzcDNIA/kUuZE7q1WUvulB8cnW/ZwwMQOtDgDjI82Eo57RolGI0EEtQmT2lTESmZHA9c5Gt6EFV
	0v0IXB+slo5Wod+CUGWeCchPhgZuJm7ybTviUtg4ti9DhTGrcs087H7fHgfV029RkRQc7Cc4thC
	PJeWIGc5IcRt4FgLvPT0HkRO08iukMrBol3O4W6V+bmqitU7FIZ7ZBYOD5ic8/rhkJUQCe2mCnS
	m/eFBFJrM+VAXGxOZtTzVDFt5YDYprcmyWyuYb20wEx9qttxptjtGKxWOug2Z5L+G70+gzCZaob
	xNsxB5CAalCarhyR5azzXO3EeOufeLNVrHhvrSVfxsupO74aXjq8nE56WjnY921+34vJW4ITSMX
	EdNeZs1fnvwhlxcqZRk4AEDpIowAiDpmjmJbOB+E67bYgrnPZOMIFC00lpDrkKUCGl33HG/RIYR
	TF+86HpjxruHlLTA04T
X-Received: by 2002:a05:6214:4687:b0:91b:8afd:84d5 with SMTP id 6a1803df08f44-91bdf0f2d62mr37414346d6.21.1792230380915;
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9e1sm43701226d6.14.2026.10.17.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
From: hengyul@cs.unc.edu
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fuse: preserve ENOTCONN after failed initialization and disconnect
Date: Sat, 17 Oct 2026 05:46:01 -0400
Message-ID: <20261017094601.3434882-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Commit 794e811d1443 ("fuse: split out filesystem part of request
sending") moved the INIT failure check into fuse_req_prep(), before
the channel checks whether it is still connected.

If a daemon closes /dev/fuse before replying to INIT, aborting the
channel completes INIT with an error. stat() and open() on the mount
then return ECONNREFUSED instead of the previous ENOTCONN. The same
change occurs when INIT is rejected before the daemon closes the fd.

Record INIT failure in the channel before publishing initialized, and
check it in fuse_get_req() after waiting for initialization and checking
for disconnection. This preserves ECONNREFUSED for failed INIT while
the device remains open, and restores ENOTCONN after disconnection.

Set the failure flag only while the channel is connected, since abort
also marks it initialized to wake waiters after a successful INIT.

Fixes: 794e811d1443 ("fuse: split out filesystem part of request sending")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested on x86-64 KVM with KASAN, comparing v7.1, unpatched v7.3-rc7
and patched v7.3-rc7. Checked stat/open before INIT replies, after INIT
refusal with the device open/closed, and after successful INIT and
disconnect. Also checked pending INIT requests, 400 concurrent
INIT-reply/abort iterations, normal FUSE directory operations and
CUSE open/read/write/close. Results match v7.1; no kernel diagnostics.

 fs/fuse/dev.c        |  8 ++++++++
 fs/fuse/fuse_dev_i.h |  3 +++
 fs/fuse/req.c        | 14 +++-----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 4fec31fc0b84..168ad7e00510 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -80,6 +80,10 @@ void fuse_chan_set_initialized(struct fuse_chan *fch, struct fuse_chan_param *pa
 			fuse_uring_conn_init(fch);
 	}
 
+	/* An aborted channel is also marked initialized to wake waiters. */
+	if (!param && READ_ONCE(fch->connected))
+		fch->conn_error = true;
+
 	/* Pairs with smp_load_acquire() readers of fch->initialized */
 	smp_store_release(&fch->initialized, 1);
 	wake_up_all(&fch->blocked_waitq);
@@ -130,6 +134,10 @@ static struct fuse_req *fuse_get_req(struct fuse_chan *fch, bool for_background)
 	if (!fch->connected)
 		goto out;
 
+	err = -ECONNREFUSED;
+	if (fch->conn_error)
+		goto out;
+
 	req = fuse_request_alloc(fch, GFP_KERNEL);
 	err = -ENOMEM;
 	if (!req) {
diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
index 4b412a76225f..0ffdc7f57963 100644
--- a/fs/fuse/fuse_dev_i.h
+++ b/fs/fuse/fuse_dev_i.h
@@ -245,6 +245,9 @@ struct fuse_chan {
 	/** Is interrupt not implemented by fs? */
 	bool no_interrupt;
 
+	/** Initialization failed */
+	bool conn_error;
+
 	/* Use io_uring for communication */
 	unsigned int io_uring;
 
diff --git a/fs/fuse/req.c b/fs/fuse/req.c
index a01ee743d31e..eede265b06c1 100644
--- a/fs/fuse/req.c
+++ b/fs/fuse/req.c
@@ -49,19 +49,11 @@ static int fuse_fill_creds(struct fuse_mount *fm, struct fuse_args *args, struct
 	return 0;
 }
 
-static int fuse_req_prep(struct fuse_mount *fm, struct fuse_args *args, struct mnt_idmap *idmap)
-{
-	if (!args->force && fm->fc->conn_error)
-		return -ECONNREFUSED;
-
-	return fuse_fill_creds(fm, args, idmap);
-}
-
 ssize_t __fuse_simple_request(struct mnt_idmap *idmap, struct fuse_mount *fm,
 			      struct fuse_args *args)
 {
 	struct fuse_conn *fc = fm->fc;
-	int err = fuse_req_prep(fm, args, idmap);
+	int err = fuse_fill_creds(fm, args, idmap);
 
 	if (err)
 		return err;
@@ -76,7 +68,7 @@ int fuse_simple_background(struct fuse_mount *fm, struct fuse_args *args, gfp_t
 
 	WARN_ON(args->force && !args->nocreds);
 
-	err = fuse_req_prep(fm, args, &invalid_mnt_idmap);
+	err = fuse_fill_creds(fm, args, &invalid_mnt_idmap);
 	if (err)
 		return err;
 
@@ -91,7 +83,7 @@ int fuse_simple_notify_reply(struct fuse_mount *fm, struct fuse_args *args, u64
 
 	WARN_ON(args->force && !args->nocreds);
 
-	err = fuse_req_prep(fm, args, &invalid_mnt_idmap);
+	err = fuse_fill_creds(fm, args, &invalid_mnt_idmap);
 	if (err)
 		return err;
 
-- 
2.53.0

