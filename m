Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544220;
	b=S3HfMCesrVJ1YYfKMvMA7+ohz8Ej8Cpw8uDbEGTPA32WgKqzBvV+GU3xgpTI2sNEHxD8
	 e9zjjG77J3XHbvpBmPENpdAHsMsUnYTovpBRKIgFNpIctvNLIzlAkGC1z0OBGB8BbtDsI
	 +m4XjObKMmS9eVQH/Lkr08OdAzEabDhAVsFNfCvlWaQBBldGkKb4tlyUDiJ5jBahjj0qs
	 FXVjK39AX4+iTA/c5GLKfz7JtysNMekcn/LbUu2ms98dupye973WvDbZQEAojbWuGIGwO
	 kV3YqFBuHO8OeEeqI3WWCmyWItojOwEn2Z/hLneRC2H/MikwAPPhpOGYZ00ZG1LovLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DggGTwK6ptrO7pXgD18oDRKEIvdAw4GRiBSpsL7niXA=;
	b=tUXZNYNC8BDPM35ptqrzkA4SfvWIR77iL4/ZsQs5BzxT2N3nKaU9ArGCz6y/jqTR6Kek
	 gbn6+vwwdjlc7DbmspOx27MI+yu0xGR09OSjZ/OAXOxIWxQS9tQuWSELO4Ot7GL1xJ+SV
	 Zymli5tnqcZ2xheQWzOIXECZbiobvX/LZWN6HvaxdJkxsEfcMe0WZ5UOUXHLc1WVEruyF
	 BBDl16BhanqRxO2TcTVicXqDGJjl0tOy8AaWlYs/a+xdk6QjDJ90H03oWy67B0oebuxe7
	 zWEjE8mnluwxGywAez3lIBlbT4iOaIaUIMzQCyiPaeMimE+I43Lr2ab2W5FDYL5roWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jRurbOxk;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D660A2608
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 191D660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jRurbOxk
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f259cdc86so17786185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792544219; x=1793149019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DggGTwK6ptrO7pXgD18oDRKEIvdAw4GRiBSpsL7niXA=;
        b=jRurbOxksuJeZX+G7qAlyLV1dTOAbp6ZZd0UC0fEXf6yu2vt+nkZNF5GFY3t3ZZOW5
         Rzvtu3H/UM+Z2yRzsK7FC8PWSEX77foUsu8fqR1OPT5wITSmYxMJtXJP/zNbCBldY46S
         AYqPJBjCbBVgRYID49ifZOgmPwHp/BW/EJONmEmhVWvGerMKkLqxYjnmvdgobvVMkwOc
         vzX428VyQx6Z16RQpIlmoh8gAHyNOQ3i4F0IDH9g5+3Uv6Xx1Y6xEEGi63/LLcd2zAGV
         /zeoimxFg6wQlq1BwnqggHy2WfQ0FpbIC1Vuke9DGcR8v/ZNDSM6imKXKS/UyAv5eR7W
         GAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544219; x=1793149019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DggGTwK6ptrO7pXgD18oDRKEIvdAw4GRiBSpsL7niXA=;
        b=mZa8g37en6oRfEYM4O6tH9RLKPQPjdqfMQtHac39c6oXUDUXCRLVQyiRkFQOwi/vSL
         tdUt7nokd3RVkhuzXEvdzBh6qoxqK+J6DZwSpxeLyCKlhhQ8hKj3/jtMXj4OXQnHuKWe
         z2yonDW2lYhk7PXmkcuTYciy3PZAaxJBx/g9lw+b1DUEwiyZTHAh2dr5NXrkVbTie6iZ
         yj5CRfYmPZujnuGJneJ8f6tm2u9YFbs7OugOAdinMWGteJgWE5A2hccitqNxqPYhwkdo
         AVWctQnxHu6FHqGxHFSUHdj+/wsVksHzqCl5MUAOX23I9mYYcIQbf9ritgljpj80cow9
         wLvA==
X-Forwarded-Encrypted: i=1; AKwUvBy6r9O+2qXb7y2Nhj/07nf+61nk0NNwpR67PHfENGPIr8Xc9hPe6j24wey93xdZEF1fI3B95RqfQCF/yvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+V9izMvzESmwssZlnmV8OZXDUoHyWle8vDSxZu6czT9Fc9vyY
	TpGHrcdR5N5QamSnSPqPrvf5npHqSm46MyjQ1QuLmWHjwUUoUg9AzoraYPtBXx+iDa0=
X-Gm-Gg: AYBFou3XjZ5Qk2ZG1JsCgfIxI7GleTxwpawYzBeHQfV+bv49DnEuSG2IzyYLXpfyaDz
	rf2sc1vf1zw61YlWws1cOsV28tWc4mYRVE1x8CQNd0ynUBOCBeAVYD9TXwlIH6LgAMqmLl9kpEW
	QuhL72TuHaWlPdBG+QaZM91UBWerdYc+XW4Na/9iAOWtGUx3JMmZ0/uUqp80axrDha7uFkj1eLm
	fws0VLdOurHpc1+pt8cInKkJpwbQzZikALApi5ZeoILHkp7HBaTv/9JkpAcgaDQ5h+JoHJo7xY7
	ymJ/skUFxWVTNnaGN+is5Jxifk+rwDwkb62gwnSNP9JIZth+Nb0ufWdgHnyxA4FcoxrScrh3CYW
	enixot7lBP0TtTRpkkxEp4bNWzMc5kgo9pcDGMlp+SI2QVBtIPNAjK3PhM03KgKeETkM9BvFzQk
	fU/Ql5qr3jgRka0NhWeOofp0Kx1eCfOTfmt9o2tOEUUEYNw3LoA54q4JrpAPya7HNJTiYHZa0q0
	V4JnqJ1Qi1Dmw0=
X-Received: by 2002:a05:620a:4589:b0:93f:2610:fb77 with SMTP id af79cd13be357-93f57f9720cmr186574185a.45.1792544219052;
        Tue, 20 Oct 2026 17:56:59 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c701f2sm123333385a.2.2026.10.20.17.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:56:58 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 00:56:36 +0000
Subject: [PATCH 2/5] fs: make freezing for suspend wait for superblocks
 being shut down
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-super-lock-dying-v1-2-2b35e86706ff@toxicpanda.com>
References: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792544204; l=2609;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=PqiH7RhM0thrZUjh1uOe97M8bg/0B/ggQ2Kx8CtO5Gg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLZsCSkiwPZZNL1gvRV1bFRoSfXrVUxBAn1MzjbwfVl7l9eVuEkISszzW16ibAX3NxYqSvSnU1d
 zj98di9GlUA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

filesystems_freeze() freezes the filesystems ahead of suspend and
hibernation, so that none of them changes on disk behind the back of the
memory image.  A superblock which is being unmounted can't be frozen, but
get_active_super() sleeps on s_umount until generic_shutdown_super() is
done with it, so it has stopped writing by the time the walk moves on.

That matters.  The freezer doesn't take care of it: the final mntput() of
a kernel thread is handed to delayed_mntput_work, and the workqueue it
runs on is not freezable.  Were the walk to skip the superblock, the
hibernation image could be taken in the middle of that unmount, which then
carries on after the image is written, and again from the middle after
resume.

Wait for SB_DYING explicitly, ahead of super_lock() not sleeping on such a
superblock any more.  Suspend goes ahead whether this task is killed or
not, so this gets a wait of its own, super_wait_shutdown(), which can't be
killed, as it can't be today.

For now SB_DYING is always set by the time super_lock() fails, so nothing
changes yet.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/super.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index c33981d3f7c0..76101307da01 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -157,6 +157,20 @@ static int super_wait_shutdown_killable(struct super_block *sb)
 	return wait_var_event_killable(&sb->s_flags, super_flags(sb, SB_DYING));
 }
 
+/**
+ * super_wait_shutdown - wait for a superblock being shut down
+ * @sb: superblock super_lock() failed on
+ *
+ * For callers of which the rest happens whether they are killed or not, and
+ * must not happen while the filesystem is still being written out.
+ *
+ * The caller must have acquired a temporary reference on @sb->s_passive.
+ */
+static void super_wait_shutdown(struct super_block *sb)
+{
+	wait_var_event(&sb->s_flags, super_flags(sb, SB_DYING));
+}
+
 /* wait and try to acquire read-side of @sb->s_umount */
 static inline bool super_lock_shared(struct super_block *sb)
 {
@@ -1294,8 +1308,11 @@ static void filesystems_freeze_callback(struct super_block *sb, void *freeze_all
 	if (!freeze_all_ptr && !(sb->s_type->fs_flags & FS_POWER_FREEZE))
 		return;
 
-	if (!get_active_super(sb))
+	if (!get_active_super(sb)) {
+		/* an unmount from a workqueue isn't stopped by the freezer */
+		super_wait_shutdown(sb);
 		return;
+	}
 
 	if (sb->s_op->freeze_super)
 		sb->s_op->freeze_super(sb, FREEZE_EXCL | FREEZE_HOLDER_KERNEL,

-- 
2.55.0

