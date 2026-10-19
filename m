Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA19515E5BB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400544; cv=none; b=Iw3paMyOZfwRcpHuX8GU4cM9c+dsbpR4Ww3GOW/5ACMdZFAnsFn4myAN65J8U/FxT31o6ECB96Y4Kq7tlOh8dfElXwclVNjps+JIJR1A15vygnJLqmX13WiDS+kHehuG9Xy8F4mvYAGe9Qzc61n/cVInvdfVuCcDahdwG/7mlnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400544; c=relaxed/simple;
	bh=xFgk0mJKcQyQYp2XJYOl2hd1I9aMMN7ZqbRdpp25/zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VP2RitCDNFx5l1CnyTlqq0Q8a31+1PiCqqd2CiZo+eVjS67gJ5HPQxWZUEmI7NehbW/QAXXV9uWTfd1az3ZIQq/2umAyd/7USjtSIcKKTnXbrDDjJwwUC6vh7BWua0NKOonhQ3WzhxmaM+yEXRi2pH0oxDgfpaOni+9N7RvlNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhjOpC3D; arc=none smtp.client-ip=74.125.229.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhjOpC3D"
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-143255db95bso293141c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400542; x=1793005342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHd99zSc7XuTxtPtex7CCdBAnhkgrWqdaJDnZa0vj8o=;
        b=bhjOpC3DZcZWt1M2rCWyUyJSSJ2FB3JvhYW7k6uUWca2z4wJHyG4MnTPUMUxwgepRz
         l7VZVgvdiIeTJhBq2kzpsEfm1/wOc0xGfvn9DqS36NkZJkL712CqI0S60E6cnMOl8fbc
         lzeyL9Ir2uTBMRrlL3J1fEEQl9z+UXzgW8nzQL3eTK69BXhgv73djqQvJPFQ4tOiCH3f
         OTFwLEXynvLz5jnEHSp/LJsrgbKwgstms2IegCPuccCh5AZmuZzqAyFanl6siKLl/Gbd
         4lp+v2WvlW/H8shbypHocM4WNxLXilQ6YFgnMLAGnXX8tVXMBtAlTO88LppJGgPzRZ0b
         rtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400542; x=1793005342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHd99zSc7XuTxtPtex7CCdBAnhkgrWqdaJDnZa0vj8o=;
        b=t0ETX4Bb9J9RYKWS3vIWbo5ztiBoQ/K/FF0NJSoagLG8uixpW6Oi1ka8uzqmoEJGhz
         cZR/tR4wbcgZErsFLKubGGOMpp785JIBelqJyyIJSE/R+0+r6+C1LqIxKrKmIVSDu1lI
         1GXBlbpj4rzxPVZKiuKBfRtBN7sAIFpaP6itAInErLnzwud1NLCmhDQymKQxqJI2zsgX
         ABx8as6GRI2ZA7YoqT2v/t2Icl+gbqW8ONI1tnzTRsE3E+x6P+fi1w9OEgaoiGyhFL6n
         m0UNwRvydJG1UO0Bp+hFLXd1IZuSc5C7DdApg4ZfFITNJufS4sv34SxhKI7djzi5yokn
         X/QA==
X-Forwarded-Encrypted: i=1; AKwUvBxlbHGnmWY9na7/j/cdNRMCou7M3JAS8WhT6z3i5sz3YNZA3c4pohEIIzUVkv+r8/Zekk4Lb5+asxbhY+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIye3O3dLPnte1uwb5J/5A6ONH8leG3IiiMB19OlaQLU0sbNTuZ
	nCjN6Awz80XWoDqIuAl4+RRRRQxfQ+e9OgPIDYzshCirM+v5nnolLaHq
X-Gm-Gg: AYBFou3u5EFzf7+LpRA03xW0KlTF3lvMcIBxfEXjkf/zcHrc6PWV+BDHWhHtsg32xil
	wP9ZIPfG54/duwo2fw0+/fCrKCwnk8SXVBeBGeXsU4cHskHYRruMUq5m3Ls3Q03ztGL/1k8vFDE
	AUHtYoW9x0gaI9oXC/cwYaFBTH1fJoXfSBPAG4J+E5k5d1AsUcfxLc009JD+wQ4uk+5Ex+1XG5p
	0RWaAzVAZkPD3M/nIkIhU0eH/hQla1J5ohbHWJAcEXGSn+vWPG5O5oF7e9v01zswvJIqalGX9sL
	pKt2n4LBUpD+++2gpu+ojK/AHRUErBfxkBT+WmLWtGtAnTmFtRjOC82P3bSz3sBAAK4/VKQwjsG
	dHS29gLKK0GLCgy0rvkh7sF9wgz298wECp0vsUlrzEdKUiqTAEB8hz0WMbqKJ5OJ+u+h4IZC1od
	kLLyLhRRn6Q5l2DtnuFppRpJwNzFwUA0x89aFE7mHFn5a6NMjSIEAVhNDkTFhgAxW6ze6syjnVH
	RtxEr0QkHpdAFJfHpowNJySRTwW0lpzh/A=
X-Received: by 2002:a05:701b:2601:b0:151:f0c5:7a09 with SMTP id a92af1059eb24-18513b99fd0mr12384383c88.43.1792400541807;
        Mon, 19 Oct 2026 02:02:21 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm27085064c88.17.2026.10.19.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:02:20 -0700 (PDT)
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
Subject: [PATCH v4 1/3] fbcon: Include font geometry in the rotated font cache
Date: Mon, 19 Oct 2026 17:02:04 +0800
Message-ID: <20261019090206.1094958-2-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019090206.1094958-1-yyaqia@gmail.com>
References: <20261019090206.1094958-1-yyaqia@gmail.com>
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

