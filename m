Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601249;
	b=1HP4kENBw29qXatWzSWnTnZCkGlJNkHns7WUkosrNtE7mBt5Qt1vTHQ4KbgSSbs77G6Z
	 UI9/vTXEKcDpkxzBD7M7szst4VEbYzDm8ul4JiI7edCho0HSyDx8Txog+h2s+XpzOJV5Z
	 wdKgIEQXESNJ1I23fOACL/BtrcpHYTgzairjR6kjujY+x4vwow6Pro2rQPXY15UB3OiKg
	 1H34uXBvfMzv5XzNttVO4qNVYUT3tUxkSZ+7nc0aJ0UxSLtsAPW3yHBWuLH4b+GZ/EPTu
	 +OogUSKbupzrydameKJ63IKpia4E1VrnrDGr0dQMU9fTLoHPjE9QM039iIklTtBB7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3ucwLQhUyHOpZ1AVuMoK9glRySug+tMEaFSniJcEzLw=;
	b=1tuksEIBU4YIuZ4C3JYaQp5JoGR59nO3UBUjCAKd8vSH9UKe7FKnezpDyecjUlVsjCWN
	 cuXSFvXYSBHTVY483GS7HqaRsyCNvtd5KPcOIzxZWseeXhSEVi/33iTx8ANAgmoFcwUi8
	 NH3yi2reVYgw8M6Vxeqmr9wX6W9WCS2eg3ml8R+KoaIOia65wTDYitba/MtSLtXxQEQgZ
	 tMTpL6ATQuorRx3LhI5xS1kHPej/Sh0EpJTyfQET9sQvofx9ZHU7QXo8Q99xCz8AFCfXu
	 Ej+IKaBZAwTSx5qZ4aB3Xyc+1JPxbkOr5iGA9atZhMzeJVKXTZ+R5kCa4efxz+2rcfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=n3ziWuxj;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB3606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CB3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=n3ziWuxj
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5361e313e63so9746771cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792601248; x=1793206048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ucwLQhUyHOpZ1AVuMoK9glRySug+tMEaFSniJcEzLw=;
        b=n3ziWuxjEYP3TkMRp+InA6lKnwVvotdjMQ755v3pqoaWVOIlqBPjwtOAMHJo2MAlyX
         rBNdc1/b5e2NssFIvDFxXhGMAwy123+ePZZi9j1KdvDO2fvIahuOoFelmHKqLridkXbl
         yxCcxROpm6voZj0HRuMohD0P+yTGYukPfwA3B31oJi+yeB2L6r5fuBhjsTF9b3+Q5PGk
         3uvBhqd9FDcvgKcfM8FpX09GH4eZ+udeISLjT+0gTzpETbhwsAzhxo94RP7E8BaUlFlv
         5RAv+s/vWCMGIniF16p3C+U320f/2v4k2yP0RdF2cHdO4CniAhWMiu0CUfaPcaCASSLZ
         QN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601248; x=1793206048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ucwLQhUyHOpZ1AVuMoK9glRySug+tMEaFSniJcEzLw=;
        b=cXFZphRuoBA/uF7Krl4fsAOOwhm65CiIkXzIYiiL8b7aswQS8BscdSr1tE+rYL6Djl
         eEE1w+I86F+NYgEu0oNOhyJY+U7vpZNQAMTA18BEcAdxiPw0JLPMNUvpejsO5E75iJWr
         +AevCfV1/5OMyJ/+Xu8SOqoB9BruxMRKMk5IWOC1d8QnCIMMJSzXqCkKcGZZbpOOdM//
         /JLZvgiFCJJjTnHC1jXlUDmQ3EFYMd657lmKhAbnt9ldAlg8B8++PGidZG0/f9bLkmZY
         M8CcBjEbD7rkLs2iJmm2y7SPNGmOhPjlYCdgSDCDl/1ff1D7LpXJXqbP5csgbg4JztXc
         CgfA==
X-Forwarded-Encrypted: i=1; AKwUvBzm/I+TbD2Fjfwg7fBt8jOk28oReXQIf97JkR3KNWFvrNjo+i3nd2yABPD0Oc0kIJUu/JHB/fkdkmRO2Pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3q9S5z50Quam972XNfUP5R9IxCgawglZkCBRRNRsZOzR49F8X
	nyf+/7dOLlvis9gH2NPshBv8U0hfdBkbe/ordlAEvJ6lEvDF/2QXWQgC0A9FiC0Zzrm3A70p8Yr
	mpwKj
X-Gm-Gg: AYBFou3fBlWnpcWdR41mEuqxhsqFn/mWzUxfmlW/uMIoMAGzjd3wHKnhhZbgorJiChQ
	3d1VBOQnhoJ1ynvhvvEgAWAXrQiQrGFFKpcB00GwhhDh+rL8HPETGZxI2jZxQGtZgd5gqoqx5PZ
	zHsq+J+YQGgRZNvAxkPIZ+zIoO7CVeNrSQvITa4wyFqPFJQ3DC/rB3St9kYfPz40y1drdfzBrG2
	0b8U6S8k76LSfi+FHbd7EME95mTBGOhEILToyfV5IdP5zqNZBsiNflYqsoH17BkhMz8p244Sa8U
	tiZhTz2bHvVIcKnPuv7Lo0AFi38c5gFM8NYVGwO7kh9Oqphk1agj+6Xgcfz372NUeW+ho/vrhf0
	/F2EqLhdlj7F9Mf4sUiaaHZvReONa+K8tR23YzAQ8nwD2bGRx4GLQdKLrWWBV3xDvjwP1sg5ww1
	Wgk+dCnZrQZEdwjH63I/4pcktZ+PE2RCfxDXX96PrBxoC78QDIDxR5RvIoS+XToJcWF1NrKh+te
	tguENbqBOKWrVyssXUiza9oYw3KbKmoX5McL5sW2N08cPmd/nsEB5s9Oh0tSq19gIMtZdZp1Q==
X-Received: by 2002:ac8:5c92:0:b0:535:7b01:1ac7 with SMTP id d75a77b69052e-5369b43e959mr42232871cf.6.1792601248051;
        Wed, 21 Oct 2026 09:47:28 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab7561f4sm3752791cf.18.2026.10.21.09.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:47:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 16:47:00 +0000
Subject: [PATCH 4/5] fs: don't make sync(2) wait for unborn superblocks
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
Message-Id: <20261021-b4-super-lock-unborn-v1-4-0265eddb6dee@toxicpanda.com>
References: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792601235; l=2411;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=swc7nbC0Clpg1auAQ6b5oTcxsIkyJYst+76/QwVgwwA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAICuJi547O1zICszPsndzjv/aqsGPoZhxxJBZn2o9z3kq/Ikk4ou98662mWpu3VK2UwYRiVmvi
 hZhXTr0p06gw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A mount which is stuck reading from its device or waiting for its server
hangs every sync(2) on the machine, and the emergency sync as well, and
they can't be killed.

A superblock is on the list sync(2) walks from sget_fc() on, but isn't
usable until vfs_get_tree() sets SB_BORN, and super_lock() waits for that
uninterruptibly.

There is nothing in that wait for them.  sync(2) is about what was written
before it was called, and nobody can have written to a filesystem which
isn't mounted yet.  What the filesystem writes on its own while it is being
mounted, replaying a journal say, is the mount's business: it has to get
that to disk whether or not anybody calls sync(2).

Add a flag for __iterate_supers() to skip superblocks without SB_BORN and
pass it from iterate_supers_sync().

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/super.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index ecba64ed0c2a..b8d6f1c969ce 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1041,6 +1041,7 @@ enum super_iter_flags_t {
 	SUPER_ITER_UNLOCKED	= (1U << 1),
 	SUPER_ITER_REVERSE	= (1U << 2),
 	SUPER_ITER_WAIT_SHUTDOWN = (1U << 3),
+	SUPER_ITER_SKIP_UNBORN	= (1U << 4),
 };
 
 static inline struct super_block *first_super(enum super_iter_flags_t flags)
@@ -1073,6 +1074,10 @@ static int __iterate_supers(void (*f)(struct super_block *, void *), void *arg,
 		if (super_flags(sb, SB_DYING))
 			continue;
 
+		if ((flags & SUPER_ITER_SKIP_UNBORN) &&
+		    !super_flags(sb, SB_BORN))
+			continue;
+
 		if (!refcount_inc_not_zero(&sb->s_passive))
 			continue;
 
@@ -1114,12 +1119,16 @@ void iterate_supers(void (*f)(struct super_block *, void *), void *arg)
  * down writes it out.  Wait for that, so that it is on disk as well by the time
  * the walk is over.
  *
+ * A superblock which is still being set up isn't passed to @f either, and
+ * isn't waited for.  Nobody can have written to it yet.
+ *
  * Return: 0 if all the superblocks were seen, -ERESTARTSYS if the task was
  *         killed while it waited for one.
  */
 int iterate_supers_sync(void (*f)(struct super_block *, void *), void *arg)
 {
-	return __iterate_supers(f, arg, SUPER_ITER_WAIT_SHUTDOWN);
+	return __iterate_supers(f, arg, SUPER_ITER_WAIT_SHUTDOWN |
+					SUPER_ITER_SKIP_UNBORN);
 }
 
 /**

-- 
2.55.0

