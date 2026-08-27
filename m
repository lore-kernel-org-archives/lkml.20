Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1F47CC8D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844330; cv=none; b=Hs+EBqYjGR2fgrS6gPvBYxsE+SmsG2zRowRUBF+VnIY8n4UZ3SvsdgARNJU5hbLeVF5k2kSO8yZ/Wnp6UtZDf5+A3gYGBDQSp95NRlMpXvfzpPnfT0OvZ/z042Aq0rTMsLhb8eXislL8JepNqacPmvyGLcpa+geVn+MGK4hwVcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844330; c=relaxed/simple;
	bh=Xh6FfhS2ea8UOTbehrIxN6G5Cb0/oxIDCneCcs8+/9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9g2Y/SyWLOtFuUMDGoG8zpLlJExwAq3tRVU0S+rmgAaBfCWasYNpwuw9FagwAoOcucXqGr097SacM0+x/KGncVsXqgT7eA9j3jst8tkM95uS6oAWhvdWbC7a94LzHCHrCx19CdhTX+Yva0QS7YHaIJxQsG5JX07HKq/qkgDwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAnsrMHf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAnsrMHf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-851cbd64814so14259b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844326; x=1788449126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flL6svFl5aWrkKlDeo/jWDXl1QN2synua0XBk3WWZZg=;
        b=rAnsrMHfeqwa+MQBlie6QB/4lzRlfXnzMrzyMTC2yfyjOMkQkugfMRff7BX2+wasUp
         LK1b5vV+AqMQyvwLpuJAR/YoudMiXbnAO3LKPzel9rAhb4dgQ9ZNG8rB1asTMg5VR1Vn
         olHe2lCM1DKix+tgMxgyiLS09bAWc5RsMuEPY0OrPOuuu7kQNvV6DOVy/K2E7Di/7cGw
         pFePjrtocYxn0B1bxj7eQMnKPUhBctdQgtWKf006Via0fUnw+1arjzWaH3GzHKIWpLI7
         PgVeVA/nHI9Lr3V1+ZxkiyH90sqNVyTTC8hFTHguOVGhCSxEd6a1rPNnQl5dc1YhPcSC
         OUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844326; x=1788449126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flL6svFl5aWrkKlDeo/jWDXl1QN2synua0XBk3WWZZg=;
        b=P56qwJKUs8Agz70636pjRLuQdyIQ+eEG7mWs8ox+MiYAWVMvHcuVVgjtWT1jCbTXhn
         82O6/cs6To4/a0dTQ+nTwSupTzV5NIdNF1KGssFzhlDTE7+R+HnoLAvRUfjGJeUhw9tG
         7NL/y0dZbO3/bsz7+sYv4t6Dv7ztTPb6IbL587TGyyL8HqgIMQzng5q7Fpk2rYtwjRF7
         4xgF6KwX5FB4E4PUAAPnHiLRZCRDAoXyqaMIz9TkRThtBh8aahDY7HqZ/fhAt2YkIpOC
         x7fse9dnGQneq2e79fsLFFd8fhaSqLWYKVOi6v+6SXyxIGkhvkQRIT8L5yanehRd4lHQ
         +i8A==
X-Forwarded-Encrypted: i=1; AHgh+RqiZMAIfJXyj5HiZ3XgfJGFK3c0jb4Jlt7wMdyehOW6+HQRgP+ahypaw7x6DZNXwPWY/72gLxl3gnXhJwo=@vger.kernel.org
X-Gm-Message-State: AFuF++kYaDRhw/0JPXEhbHmqJHe2AY05uQmqDQ01f0Sl1ijrZrLUvaZV
	R2u6/IAVfNeOgVNACLEWpIh2RUGdc96xnnGHjs95k50LgqTI+8VCOyB6
X-Gm-Gg: AR+sD104FtJwhkh1tLZMFYSiaiAPJ/emdtukcj366vNnJoc2jrJyrgTeSuOKK9Xc4zg
	OrYKnPQotgIpZsz2+LulGPB7ZbHLSXG2yLZOmTkWS8WDMuceE8GA7jc4FvJ8g7ALpAb8fG/HOOT
	xC9aC8JkT1YvMDy2j1xKzjb44UOxIwfH4+1xsDCN1+E42c4mphnH/0iQPsoPRMfRikH25jYl/de
	D3+ax1G2sTno7G+nwQ4mzE86/ac6WT3xkoHZUDB5LdD3gbvXTylDAeObqADcC2uS53IwfHUtR2J
	P/2/2MX3BLSCve3AbCEuy3AwqSU6QpNLkRN2wGhBVHSTRsZSodDDn9NQ00i+MdPeEl5+2dKo0Bf
	NCz/cIVmilNKEnS6BAhkA21K65AmcpanXQUbvt3J5TRJCNkP8UuK13S/f0bvq7hpVi2z6v3yjS1
	ieBO2tVB0kSSaOXLByqz1BiMQZef1zKTUtyk5dlfOTnN5d6z8DyKU270qUwRBiolyebs4B6sHJU
	UL+LXFXgP94gt6f3l1ZMXQEhyoi2c6ZZ4xu0OpeVCp7hhsyE29+mg==
X-Received: by 2002:a05:6a00:17a3:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-85625842e10mr135248b3a.0.1787844326328;
        Thu, 27 Aug 2026 08:25:26 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535a8b8ce7sm2174914b3a.21.2026.08.27.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:25:25 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: hughd@google.com
Cc: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>
Subject: [PATCH v2] tmpfs: fix unicode_map leaks in casefold option handling
Date: Fri, 28 Aug 2026 00:25:16 +0900
Message-ID: <20260827152516.805622-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827151426.796843-1-hnkz.64@gmail.com>
References: <20260827151426.796843-1-hnkz.64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem_parse_opt_casefold() stores the unicode_map returned by
utf8_load() in ctx->encoding. The casefold parameter can be supplied
more than once for the same filesystem context, but replacing the
stored map does not release the previous reference.

The final reference is also leaked when an unmounted filesystem
context is freed.

Release the previous map before replacing it, clear ctx->encoding
after transferring ownership to the superblock, and release any
remaining reference from shmem_free_fc().

An unprivileged user can repeatedly set the casefold parameter on a
tmpfs filesystem context from a user namespace. This causes
unbounded kernel memory consumption and can result in a local denial
of service.

Fixes: 58e55efd6c72 ("tmpfs: Add casefold lookup support")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
Changes in v2:
- Keep Fixes, Cc, and Signed-off-by in a single trailer block.

 mm/shmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 89a1495e55f7..62440caf2df5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4508,6 +4508,7 @@ static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *
 	pr_info("tmpfs: Using encoding : utf8-%u.%u.%u\n",
 		unicode_major(version), unicode_minor(version), unicode_rev(version));
 
+	utf8_unload(ctx->encoding);
 	ctx->encoding = encoding;
 
 	return 0;
@@ -4976,6 +4977,7 @@ static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	if (ctx->encoding) {
 		sb->s_encoding = ctx->encoding;
+		ctx->encoding = NULL;
 		set_default_d_op(sb, &shmem_ci_dentry_ops);
 		if (ctx->strict_encoding)
 			sb->s_encoding_flags = SB_ENC_STRICT_MODE_FL;
@@ -5073,6 +5075,9 @@ static void shmem_free_fc(struct fs_context *fc)
 	struct shmem_options *ctx = fc->fs_private;
 
 	if (ctx) {
+#if IS_ENABLED(CONFIG_UNICODE)
+		utf8_unload(ctx->encoding);
+#endif
 		mpol_put(ctx->mpol);
 		kfree(ctx);
 	}
-- 
2.53.0

