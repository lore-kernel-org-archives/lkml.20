Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16F370D47
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928803; cv=none; b=XtsVUtIPZ8BA60nocWV/wr4t4xiJb57RtRydPdAjvUttAWsujxBJ0QrTVD+gp1E25BjK81MmDXrMBHuttd4QctF09ti5qYloPPFT8SGGlcAB86+yFeq5k5UeibcC6gE911zThmEs03pi94OHsSFGZAQzZWDxA+jAlzN1ykzxoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928803; c=relaxed/simple;
	bh=FIwJLiPALQ/U7ZadAFSF7n+UTfRqG1gRPg3GkEYdBT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRaogzE50n88bEuUXIRn3XIfJ3TO/9UvKE5InJ7XFPwq6w52L/X6+WRDmmwqQYLVArA6Hzmox2+Jkh/aAKvDylaZi1GfZbkvAQVzlKF11Ly/VvT5tW2TTdaKoQ+eVi/2pci1aeA7AsjySClN76zu+NZ+2+bIsxJiK2Qbq3zlmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhi3l8+L; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhi3l8+L"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e36so2606558a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790928801; x=1791533601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRkehR6QhzTUqhAnAiS8EO3o0r2RIFdddFBrAAp0J8s=;
        b=rhi3l8+LjoUzFlgK7wSjbQXd/illpt0avK9TUQhkBnzx5rGp/Q5UKbmA5M4G2wIoEf
         3nN2PaicPcuk4vu2e3JxzOKHNWB9UxQ5WbZm5T6pl0veJRZazlBVOAWDg+RQ5wsUo15e
         uIkeoNA8wCNhaOhnlYIq8knvDLwUlb37OnNZca8HDRQdeUiQ3AAVgH7tO/DqCJ0oBQTB
         EnwzIP64+MhcnoKN5WxS/UWZf1213LU/00s6uI3E9nVkVion8YkPRwNK8lHin83BG/vX
         UA6dj0gqMe2KIqlM9TM0xwjTXUUP6fueoDTqw/rBlMzIxoVIthDLQFmnY+pWTJnN+bgO
         btqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928801; x=1791533601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRkehR6QhzTUqhAnAiS8EO3o0r2RIFdddFBrAAp0J8s=;
        b=Llr3BlA0QzX/UUUlroMW6uqHn3oS0mLf4xLWkFCfoiKRVId3JVKfVIYKb5ZtYIBRmR
         cwC0LxYXe+mctROtlH6uNWUWrk514Q47bjQHv3jGul5ZIeA8skYbCE8biEVaZlufhpOW
         y9lQupPhu8H3Gqse7kgFXpKBi+Awn1WJr5twQeVnF4iXcQdh12EuvPHn3Wq9qsCg9XZD
         q0KzXq1BwokZ8VoBJ42OhjFve2Q6Nkacel4WMJOvhwZyqrr52qkmK3oJS2deYucmueez
         QGF6zsYcsjVRmaaqZBb7yUfvk8N3iMqeZEL8m7qnpHK2fOnmqARIuNUtVc/xB38glP74
         b/zA==
X-Forwarded-Encrypted: i=1; AKwUvBz/Mrhqlb02PqTPtAlLd+w/UzIySFBTd4UCvyirxvcn3ci0nrRKObqk0zUsHA2tuUN8h0XZO1S31sXoIkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKrhmTa6yJsKkuZUn+dXUm39zNMQFzWCctM6NUqNfi8OUoVCfX
	zski3llnHQoeF8IwuZQotiPazxyI8sLYMWDdahFsJFBTWRqkvOJ0TlgY
X-Gm-Gg: AYBFou2lt1zs9C6vUxV8b2y3BEYksSsIZtm8U93pWjxikzlCM9RlPZ6fD6lXzJVfGyu
	d8o9ACeUaMYg38yH9Y+UZQMVC29Y8LTRW4LpNCPmhjMvBtcIRDYFTn8gOptiuQtXn2iJwIbcJVv
	4SB9GK34B0kIM+qxPl5pWEB9ibAu98KMLUwqvKFM0IVYKTZ7phRIhR2zj20LQmZE1yJKJlHedXz
	LWoLPaCpwOfjo0uhvMVRFq1JHcVBjp4IaEY50KkRMdcOSXX1wBV/IFFgY4TPaulzr/B71Mu0neg
	BkArJL858iP9Jl3Wg2aSNRHLrizNZQLd1rktsuM336r5pP7vHkjY+aRXV2fH9Eo4kPmO7+almpE
	v5480Ky2uV11d5E8il86vbpvTrSKROomemLsj6IfHVUPj7PTa7jpbZRmTMBpK2T5JRUTvf6Eiry
	EsGDDLJHGpLWTvH56+ghV6qwmF/R2VMDR3xzFGKNyo6tN8l8G9u6ppDYd+ovnF2CCuD+1/CxLwS
	cfXtvc=
X-Received: by 2002:a17:90a:d64b:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a6ce3570eamr805756a91.9.1790928800962;
        Fri, 02 Oct 2026 01:13:20 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6f8525c0esm692758a91.4.2026.10.02.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:13:20 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: hughd@google.com
Cc: Kazuki Hanai <hnkz.64@gmail.com>,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	gabriel@krisman.be,
	andrealmeid@igalia.com,
	brauner@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] tmpfs: fix unicode_map leaks in casefold option handling
Date: Fri,  2 Oct 2026 17:13:03 +0900
Message-ID: <20261002081306.637148-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827152516.805622-1-hnkz.64@gmail.com>
References: <20260827152516.805622-1-hnkz.64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem_parse_opt_casefold() stores the unicode_map returned by
utf8_load() in ctx->encoding. A filesystem context can receive the
casefold parameter more than once, and a second successful parse
overwrites the stored map without releasing it.

The map is also leaked when an unmounted filesystem context is freed.
This includes the temporary context used for remount, because
shmem_reconfigure() does not take ownership of ctx->encoding.

Reject a second casefold setting, clear ctx->encoding after transferring
ownership to the superblock, and release any remaining map from
shmem_free_fc().

An unprivileged user can repeatedly create tmpfs filesystem contexts,
set the casefold parameter, and close them from a user namespace. This
causes unbounded kernel memory consumption and can result in a local
denial of service.

Fixes: 58e55efd6c72 ("tmpfs: Add casefold lookup support")
Cc: stable@vger.kernel.org
Suggested-by: Gabriel Krisman Bertazi <gabriel@krisman.be>
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
Changes in v3:
- Reject a second casefold option instead of unloading and replacing the
  first map, as suggested by Gabriel.
- Reword the commit message to describe the remount and close paths.

Changes in v2:
- Keep Fixes, Cc, and Signed-off-by in a single trailer block.

 mm/shmem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 848316eaa7f4fb..1bd004c3dde20b 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4509,6 +4509,9 @@ static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *
 	struct unicode_map *encoding;
 	char *version_str = param->string + 5;
 
+	if (ctx->encoding)
+		return invalfc(fc, "casefold parameter cannot be specified twice\n");
+
 	if (!latest_version) {
 		if (strncmp(param->string, "utf8-", 5))
 			return invalfc(fc, "Only UTF-8 encodings are supported "
@@ -4998,6 +5001,7 @@ static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	if (ctx->encoding) {
 		sb->s_encoding = ctx->encoding;
+		ctx->encoding = NULL;
 		set_default_d_op(sb, &shmem_ci_dentry_ops);
 		if (ctx->strict_encoding)
 			sb->s_encoding_flags = SB_ENC_STRICT_MODE_FL;
@@ -5095,6 +5099,9 @@ static void shmem_free_fc(struct fs_context *fc)
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
