Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE84FE2D4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687620; cv=none; b=IgMZAV7rgUqTYeIkY90kX94Yx1i5efpYDFBYf/2ocS5rIx/d26bgWIai+Nd26PMFqtpu7J8fRW8CfrVRGLeRUbv/zHlW/78cXzPqOCzADkxOnnbKticr9iQS3QQYfNOjBh8OfBVKo8Zl7CCVupJC1Vu9q+lByzBNyVMxqtPKf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687620; c=relaxed/simple;
	bh=zduaw5St9ljvYjN0QUPscxMeCgGMcXMWWdurL4fk/EM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZ5eNj2686Jik8mSEnO1jKTtBTTk4heO1vgG9+fQMzxdAcAQrllFPF5hblSF7QkiLK0io2YdnPq4uz//eqcH/H3uCIWbmVoG3dKZm+IAPq3LENYrOS9T+d7vBXGSQKMgj2qZrBU6RuircjEmfskYFHg2vXu6iM7qkUqptSndz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n44gfBEt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n44gfBEt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so31209515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687617; x=1791292417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCT9DoPWiXJMvBzM02aoXjnaw6xD/j8g116oRTfEDZ4=;
        b=n44gfBEt3MAj0yXQlkdcIrxJ5+idWLMEjlykGF4Wfo0+43RyX7Yvv/t5JEE6fL8pkU
         PBvm5nr0OEejmwFzYC5olAC7YFwo28s1nRSIELsTZdVa9ZdpPdx40F43FO1xsZDS/PnS
         c1RhD6XJ8jx0xvyattTYzJoSjIK0I/z7xtJmnuPkDdSMAMtSKGvL/s6jCEQeBBfHmaZR
         Igi2ofAfJYt7dd+YLiQCRNlIGbpB0JN+RS2HlXrl5rGlakm/gj1jIQVufD4WaZJrb9TK
         ar+ywxAGrk7sPVdcW5sSprIxe0CyTN/ToR1XlrPbaWszHtklgwX2Vq74X7Jo/KgFkrLh
         BDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687617; x=1791292417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCT9DoPWiXJMvBzM02aoXjnaw6xD/j8g116oRTfEDZ4=;
        b=1XdTwWKkiIoz6XI64pwfu5iPEBbWwYtn2E3eNyX0tgoMv/HJxSfV9Xhj1zLeXq1ECk
         m0Fn1OjQfb6HsW88/bZ53cbh6tL9tIVNv3nvNr0JJw0XchfYHMus4hbQ+CoHwjLE5hkG
         /d2qqzVrB1bCCtdwHJifVIZ5VPGxsF4ONxf/5VP6LOJNNFTXaiA/wFq5MmSZmtRIe4fJ
         d7Nu0pCHTQwnMalQZk5gZHe39mewBMYcQUOmzIhxO6JuWTxCgjmXWWz6OFgRdKjHokdu
         P9BglYIDa2zOSbr9TRJjVOTwewkx4elqJ86hAoXiuAKcmJWPdrE7hRl/gwdXzsGzZk7Z
         fdxg==
X-Forwarded-Encrypted: i=1; AKwUvBz0Nwn1tEB4ByK3ngyvfRQ5cR7gD9uSqV9sw4H7YLrlkaAWVNcpm1cWmvNGkyRbDMYyKNjqORctVRDzA2A=@vger.kernel.org
X-Gm-Message-State: AFuF++kePC+lV1GrsTNJunM41q+kFceh6nuNcmU5tSpgbLtOg0OjAnTW
	NEazeJiWummOZH+DTdeeosF56CPwvvGHjg/wqpBurW0lG1HU2hCw88w7HNsvZD9SCg==
X-Gm-Gg: AYBFou3Vel3cYjGhVMEwL8IgEQOokJO6Rndoia/jeNECbWVKb7esFGfDtFe50GMy8WZ
	nPmHuz+SoYJqo7pcT4mua64bWmm+IKZLFEx7OQhHgP/ExPC8BF6Bpj13ShcoR+N+1zd8pSu5d9C
	yVy4K7kM3mnJC8/xiHHDda8Xg+D5KdrBt7o8OxjKmWvsHzUyFt2wZaEzUw7UDuweL+AxL8s+Yoy
	+i6pmPWuatJBiMJKtFC/3Ejn7btyZQslBxnBQFroQ5nv8tApJrbjfOx0vMMw0clDfiu6LovXbii
	S5Mj27+xd/VzMALDYpaIoW/7O8hNv0w0J/eFEAfbtOPv3CEn4bxy/lqw9r+iE0tC9ZqQnQoL0dN
	VGevtf4QkZq/eUAmlcGWFfKc9yPiu2+wryW+mEVccyglp+KteC88oJjXRQgYAMR3wWAWToHy+BR
	Y0EV6PkLVmZRZqYmbrnb9Bk6Cd9NaV8NxxG1M6V9lwZhwwdjALr+cVXQSNfOQlkRdXPcCDAXZv+
	tdl9X4KOigrSq05vtb0tYrYBpAwYmbR9fZLb9HrrUrJJa9rPxU8f8hbu5ln3zb8oTS7snpWlAUH
	7QMf0Jw=
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr274819225e9.3.1790687616568;
        Tue, 29 Sep 2026 06:13:36 -0700 (PDT)
Received: from Ubuntu-2604-resolute-amd64-base ([2a01:4f8:13b:86d::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5049419sm3566825f8f.14.2026.09.29.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:13:36 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] shmem: fix unicode_map leak on remount with casefold=
Date: Tue, 29 Sep 2026 15:13:24 +0200
Message-ID: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem_parse_opt_casefold() calls utf8_load(), which allocates a fresh
struct unicode_map, and stores it in ctx->encoding.

On mount, shmem_fill_super() takes ownership of it via sb->s_encoding,
and shmem_put_super() frees it with utf8_unload().  On remount nothing
takes ownership: shmem_reconfigure() never looks at ctx->encoding, and
shmem_free_fc() only frees ctx itself.  The map is leaked.

50000 x "mount -o remount,casefold=utf8-12.1.0 /t" on a casefolded tmpfs
grows kmalloc-32 from 660 to 50574 active objects, and nothing is
reclaimed on umount.  A tmpfs mounted without casefold stays flat.  With
this patch kmalloc-32 stays flat too.

Clearing ctx->encoding after the transfer is what makes the unload in
shmem_free_fc() safe: otherwise a failure later in mount would free the
same map twice, once via put_super and once via fc->free.  This mirrors
what shmem_reconfigure() already does with ctx->mpol.

This is easy to hit once casefold= is reported in /proc/mounts, since
mount(8) then passes it back on every remount of a casefolded tmpfs.

Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 mm/shmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 07b2855dfb7b..49b3cbe0c324 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5202,6 +5202,7 @@ static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	if (ctx->encoding) {
 		sb->s_encoding = ctx->encoding;
+		ctx->encoding = NULL;	/* transfers ownership */
 		set_default_d_op(sb, &shmem_ci_dentry_ops);
 		if (ctx->strict_encoding)
 			sb->s_encoding_flags = SB_ENC_STRICT_MODE_FL;
@@ -5302,6 +5303,10 @@ static void shmem_free_fc(struct fs_context *fc)
 	struct shmem_options *ctx = fc->fs_private;
 
 	if (ctx) {
+#if IS_ENABLED(CONFIG_UNICODE)
+		if (ctx->encoding)
+			utf8_unload(ctx->encoding);
+#endif
 		mpol_put(ctx->mpol);
 		kfree(ctx);
 	}
-- 
2.53.0

