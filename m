Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9214AA1DD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403031; cv=none; b=WgoIdgDFp35WClcliqWKLzRLi1w1/0iLDtuQEs6z7I8iOX03WFNFsPgfhrQ9DPeRCtGT7Z5T45NqXVRNKaXrLzrwBOwaC0mo9sHiof0iS8et8o3+ns4juYo+0Las1K/EwQUnL2/ZPR8VLc8a2R0Cl9CBm9CCNP2cnGzwAl4NfmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403031; c=relaxed/simple;
	bh=xFgk0mJKcQyQYp2XJYOl2hd1I9aMMN7ZqbRdpp25/zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBEOtVXTtt+jPXtqfj0HBpzbrgTXdIRMddIMBWAF6bzyn8Pl214DSECqjb1g5CHzFt0GHs7TtUD670s3/Si4j3F9+muAxRvz2HlM5bQa9k96ZSJ8cIXnSxj0bnYPqtnA118QOTcBcavDrHfWRF2CNDCTZPQr/BI8f7+GfL+LPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmZ0YXgU; arc=none smtp.client-ip=74.125.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmZ0YXgU"
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1214476eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403029; x=1793007829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHd99zSc7XuTxtPtex7CCdBAnhkgrWqdaJDnZa0vj8o=;
        b=SmZ0YXgUwhZhzMzKAQZz9Kh6o9jAq9ZuKLDDd7AjCDODMQGR2V5l4Ma6ILlIOFTPtN
         3uoDf1guZqmSL/IQM1Ft5dmU6gbeTdKLkXGzrgqgvJo0UsoplnN1Vj2Sv3iq7OgELdS7
         p+q4dy7xuac9UDhSeM/bqsKVEx8JMmafB2B6hjk3J1gnmVhw5KwkNb376+roi4T0Qyso
         opvXrTsNMxHiA55HSQzqhNeRO8LKCsopOPJix972kjMOMKWHPK/AbolhAP45eZrg8pQe
         uf8n2G/2rNGZY9AteoVv5SxRNZdxB48HlwRhSgCepsL5oWOgqMIVmCltSGjxUBDJqaVN
         NgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403029; x=1793007829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHd99zSc7XuTxtPtex7CCdBAnhkgrWqdaJDnZa0vj8o=;
        b=uKyV3tSfzqcX6lKpmBP4r2wgbNCc0RLg9E54w0MQ67YFghIku1vR2QQn6pl0z/+Jkr
         Y+jWXmiLIStTKJ5fq8xBcrGUMyq6ZVMm4kWtN9P0PWtILiVrp+3pxoCp1Qneo9L3L5Cc
         v0A7JXDok5P4kbCt7Bj0U3WJHE8Qd2ACYa6hfNGAuAWGCBOwxmeEO4a8gtscDv7KPHN/
         iuh9QghaFiNNU3Xq1P5dqdfsh4zt7NxxZjqJaojDSoAtWR8kGGxYxDWPntg2BXee1eg/
         LZEFA6B/xV7x7t8ZQvFw4MHa1FypLMiu0YDMd3B//lcZ1yUhb+k/6tkI9bFhUoOCvLL7
         Ve4A==
X-Forwarded-Encrypted: i=1; AKwUvBxIp0ZTkETL1ZEWImn9Obt5AY3ESQoB3989fXeY9y7Z+nNj5g//ed4ndFRImxIWnzsQNrxi1J6tkzd7lNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNl4A589A/ErcqKVNATcYeOwf8QaYd+bNfz+b+dBpXBvdV1dmW
	4h4cY9Sslu4gjcTTWjM3x3ZuFmc9rJ4xdI743hd/+12T61f31d49kanV
X-Gm-Gg: AYBFou0aHzZAkpG4NSgzmziGJ0cvrYk70pP0cO0neAoJX3heliyC5uFhj+9Oogokvj+
	mt+xI/onlzKjgLX8wnSeohLdpopc/g5f7kcVpt9KkPEN14zUQdXZZf++U0GbwjwU+uLyA4Fhu1F
	2n4get8ZiNTlauyaMbkgegXUIMsqPwu03Lk8Fy75xqQskDleeTNo2G+5XOVX2B1Zo7pz9umu2Er
	zKzEchXYlSp8cWGZeyNbOoMxH3K8v7CMVk1vX8IUiZFlR+taNTJNKYrm6sbWwR5Pwd/4NZDK0UY
	A7MIy68sCC0DCCjBuzVO7LQEZrSYCxPCwMWeRVSQYV+Vc5sueFmffXfHaRVkjXLWD43TnvKtcB8
	kY1QbEy6IwiFXyQoaFs4AlaPJOZrlU64GGuIuxYO2qqCJ42EOCmb1Oix2NNMmunWahUDTWCWfrB
	gkpMA2DAiXI0mzGRGvrx6YtSgdM1pD8v6BttBBosLjJUTDbTRzk/sGm5ur1Svd72XnSlj7SJbkt
	7qD7CE3fVRywwmckwrGb7SrWKaUdrRqgzr2
X-Received: by 2002:a05:7300:ea0b:b0:35d:8c39:b31f with SMTP id 5a478bee46e88-361a2a3e8f4mr10129688eec.35.1792403029024;
        Mon, 19 Oct 2026 02:43:49 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm34370074eec.0.2026.10.19.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:43:48 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: deller@gmx.de,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yaoyiqi3@huawei.com,
	Yao Yiqi <yyaqia@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] fbcon: Include font geometry in the rotated font cache
Date: Mon, 19 Oct 2026 17:43:29 +0800
Message-ID: <20261019094331.1128871-2-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019094331.1128871-1-yyaqia@gmail.com>
References: <20261019094331.1128871-1-yyaqia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yao Yiqi <yaoyiqi3@huawei.com>

fbcon_rotate_font() caches a rotated copy of the console font and
skips the rebuild when the fontdata pointer and the rotation match.
Raw font data carries no geometry, though: width, height and
charcount live in vc->vc_font. fbcon_set_font() deduplicates uploads
by byte equality, so the same bytes re-uploaded with different
dimensions keep the fontdata pointer while the geometry changes, and
the early-out skips the rebuild.

The rotated cell size depends on the geometry (rotation swaps width
and height), so the stale buffer is indexed with the new cell size.
Re-uploading a 4x16 font as 16x8 on a CW-rotated console, for
example, doubles the rotated cell size and reads past the end of the
old buffer.

Record the geometry the buffer was built from and compare it in the
early-out. The pointer-only key used to be backed by an explicit
width check in the deduplication, which commit 1e3c49aa03fb
("lib/fonts: Compare font data for equality with font_data_is_equal()")
dropped.

Fixes: 6cc50e1c5b57 ("[PATCH] fbcon: Console Rotation - Add support to rotate font bitmap")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
 drivers/video/fbdev/core/fbcon.h        | 9 ++++++---
 drivers/video/fbdev/core/fbcon_rotate.c | 9 ++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 407d207b14f1..bfbd70f8b1cd 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -89,10 +89,13 @@ struct fbcon_par {
 	char  *cursor_data;
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
 	struct {
-		font_data_t *fontdata;  /* source font */
-		u8 *buf;                /* rotated glyphs */
+		font_data_t *fontdata;       /* source font */
+		u8 *buf;                     /* rotated glyphs */
 		size_t bufsize;
-		int buf_rotate;         /* rotation of buf */
+		int buf_rotate;              /* rotation of buf */
+		unsigned int buf_width;      /* geometry of source font */
+		unsigned int buf_height;
+		unsigned int buf_charcount;
 	} rotated;
 #endif
 	u8    *cursor_src;
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index 6cdbc96eeca6..660a3fa81bae 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -21,11 +21,18 @@ int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
 	unsigned char *buf;
 	int ret;
 
-	if (par->p->fontdata == par->rotated.fontdata && par->rotate == par->rotated.buf_rotate)
+	if (par->p->fontdata == par->rotated.fontdata &&
+	    par->rotate == par->rotated.buf_rotate &&
+	    vc->vc_font.width == par->rotated.buf_width &&
+	    vc->vc_font.height == par->rotated.buf_height &&
+	    vc->vc_font.charcount == par->rotated.buf_charcount)
 		return 0;
 
 	par->rotated.fontdata = par->p->fontdata;
 	par->rotated.buf_rotate = par->rotate;
+	par->rotated.buf_width = vc->vc_font.width;
+	par->rotated.buf_height = vc->vc_font.height;
+	par->rotated.buf_charcount = vc->vc_font.charcount;
 
 	if (info->fbops->fb_sync)
 		info->fbops->fb_sync(info);
-- 
2.56.0

