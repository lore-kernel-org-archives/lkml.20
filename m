Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795947;
	b=IJWGjWi/9jSpyhJChA2OcijH2t6ouRBxA1E4fco3U2oiBJNc/Cb71oDA40123JUEqLpD
	 m7C+/wWZSVL/FG8Uo7yCRMeFnUOEtqvBs/CRR82g74uoKSRzlRxwPawKFN4xYj20X1fUx
	 yJW4wl9G8H7vRUw+hKusfZNigXlUZxfMdCeF76uZEx9oW9JcL8n1+vTRZkwCYzW7aTWEE
	 TwIECfnKuKtwi6NUqiJV08jsQcW7biYy1EP1fbr7ZxJZLA+zj37SRJmqPQvYbLA5bYFMJ
	 1+Lo+3+fmWJgl3NRRbS93M23FJILmpLVM/T/jSYZc+MUkLGs/JjjcSwtXNTIMlje16g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4cVn2led5HgP5xLulb4J0qrBX+b1Zaf9EJxKInsiKbE=;
	b=ZcIwWqUFHdlY8Rfe44vAjRVh5vXChlFnMMibJSiDFhxNhZyvy0F80qpBYq4MVC/d3MOc
	 WnSvV8IHZC+t5DSDJFmXFjuLMfLqOvfxTT6C2Fo775YsVKM61KWqYfA0y6cTgD0PbLFcQ
	 5w+YBUs6nTSjS1y6qPBXXDY1lVQYSdfaqTB57V6hSq/LDsF/7tA2qIXg6vFSa76ep8NwH
	 upLV+hOhESTFxansYxaE4As/lwrllcED310yYghe/TmXjKt/0xKhW8dA+QB2zyStzkhB9
	 c0SAswXx/IBCkMQ6prUS2FleR7C7MK466/WPuPHhtAm6hiy2bz1HpwGhhhQvzhTuSKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P17l79qk;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D784606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D784606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P17l79qk
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1249776eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794795946; x=1795400746; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cVn2led5HgP5xLulb4J0qrBX+b1Zaf9EJxKInsiKbE=;
        b=P17l79qkCUNCqxrxH8hhdLwXXjDr3K8ukb7w3haB77kS8pl1erTNufHo5yDAZB5Qdh
         ntN+1iXzCQ+FRe+FxTM6NrDrt0X4f1xPrlekTsEk/FsnZ31hjHmP10noPwLpsXpl1VS/
         OshLsCafXGBQPN+QgN6qsB8CRSc576QMIfuLf8MvJp7M6ffpked3v7Enbf3QX/FLyn9r
         VEOab6gZIL/+xghqxRl1p8GCylry/BvxEdalIZRyRx+6taFhRzwMyiwJVYD916INoA7i
         qH4dVnHZBXVjKi9XLiolttvf0tm2PwXHtBYWe2THV/hFehHEjJ9RYDSzeHP7IPd2t1A+
         ASpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795946; x=1795400746;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cVn2led5HgP5xLulb4J0qrBX+b1Zaf9EJxKInsiKbE=;
        b=MssSGOq0vD8qbugofjsCGlYg7hQc0MZhfyj3gOsERdZTw8Xwmt33xf0ziQVHDUg28e
         Gw4oNPLp+mE3e+Mk+pw7Yjk80xHduKUUj2R5CDHzhVecsd+LKVKeCDUNbiSms6i9ddrj
         tNDq0E5phid5EKmT5CmIAbQfdDzIC2YgqcR0HO3Dv+LZuB/u5zOZW12q8bFrq08+DfE2
         5ycn7b/MqKT1A7uyUfS3d5Ff+YL+tkzoA2Cg0MTyRqhLnX233XBy4oSvDsZbPtdV3ucS
         oEogkkwOaIVC14DyWlqgsuqvSp8t8uGYxSuzjy8A3/BB6q3Y4S9wSJB9PoyDsNZiOTOd
         NKKA==
X-Forwarded-Encrypted: i=1; AL+hErGARaVl1wY8cBmADAHu9p2BF5gLZekp5sWcyyXRFrhQW0Uh7YBR14bVwelrreavoY/zWg26yl6TxSMLCvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kEhHi8f7mC3b4EURa56fPvhkqglhqQ4PyDKky2cQZox0WLCrn
	1M1B8GsB+GokfymB1x0pbWGdMpqQNf57eaN3lkvdzFhVRAKIOQyvFb3UYjT60Jw/bLx1knso9N9
	Jd+wf9V7GPFKg6Q5cFxPzaUezp1XPEQ==
X-Received: from dybnj40.prod.google.com ([2002:a05:7300:d0a8:b0:36a:de0:d28a])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:895c:10b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37963a4f1femr9418441eec.5.1794795945341;
 Sun, 15 Nov 2026 18:25:45 -0800 (PST)
Date: Mon, 16 Nov 2026 02:25:44 GMT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <18e865672dda2d41.3137322e32332e3235332e313736.36f4d7.0000sendgmr@google.com>
Subject: [PATCH] ext4: free HTree fname rb-tree at EOF in ext4_dx_readdir()
From: Chris Wiseman <chriswiseman@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

When ext4_dx_readdir() finishes scanning the last HTree leaf block of
an indexed directory, ext4_htree_fill_tree() sets info->next_hash to
~0.  On the final iteration, once rb_next(info->curr_node) returns NULL,
ext4_dx_readdir() sets ctx->pos to ext4_get_htree_eof(file) and breaks
out of the loop without calling free_rb_tree_fname(&info->root).

While ext4_dx_readdir() frees info->root when advancing across leaf
blocks or resetting on seek, reaching EOF leaves the final leaf block's
red-black tree of struct fname nodes pinned in file->private_data until
the directory fd is closed in ext4_release_dir().  Processes and daemons
that keep directory descriptors open after reading to EOF retain those
slab allocations for the lifetime of the open fd.

Free info->root before returning EOF when info->next_hash == ~0.  If the
caller later seeks back, the existing !info->curr_node check at the top
of the loop repopulates the tree on demand.

Benchmark results (/proc/allocinfo, 256 open HTree dirs at EOF):

  Metric                                  Before        After     Delta
  ----------------------------------  -----------  ----------  --------
  ext4_htree_store_dirent live slab   1,007,616 B         0 B   -100.0%
  ext4_htree_store_dirent live objs        10,496           0   -100.0%
  /proc/meminfo SUnreclaim delta        +1,246 kB     +133 kB    -89.3%

Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
 fs/ext4/dir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 8d7b81e6948e..435300cd2c61 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -640,6 +640,7 @@ static int ext4_dx_readdir(struct file *file, struct dir_context *ctx)
 			info->curr_minor_hash = fname->minor_hash;
 		} else {
 			if (info->next_hash == ~0) {
+				free_rb_tree_fname(&info->root);
 				ctx->pos = ext4_get_htree_eof(file);
 				break;
 			}
-- 
2.56.0

