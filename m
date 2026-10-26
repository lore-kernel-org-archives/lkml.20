Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029741;
	b=4o6X5MKyP/SUCiqjf82URtKKBxStlz0HRBc+3e1DWSfqqWGxBEgH5zUccXm+VDAFihbp
	 5GKpY4ZsdiQMZPiA7af1QHY9wkKZz9cSerpa1wY9E4UuT52hG9xcPxqNK3BNM+Bin1m+r
	 sOHHW5iHXhxsZo7EiPWldGLrQLIajZC5UmiAGNZhGlMUEFDWR/NnCD8mQsONxECWwN/gF
	 iOM2w/GO2VK9Tq8sy2wvV5/OtRrxkmMwLgTl40RgwEzwKSjQiY3oSDBJEgpFrj4JgJxQh
	 2mH3hZrvYyL+VFEv1NnTXa7Nk+4G3t0+buAjXe4SGEbkhWvyRk3sT45d4Pjmx7XQVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HsJcoE+tcg++lXHusmJ7l3VcG6mAANy+njpMsw2MDrY=;
	b=v8UYCT3nGfxq+ZkW9CY4lnEBb6MBtKPxrmg7u4CsOOqSDz/+0n6kL6WCgty0/L1swUgw
	 OU2I/OhPmeRueXBaFeYflBVHkB9NUHGaHNswmfXqZKOAAiDyK+pkkSsxygC6VHxyy/221
	 oFFOrgglHdmshJmBj7A4USERZQeOOFUD9RHOYuxoBgMSDKV+HYn71ZzO+hSSmyaRiRXSU
	 RVSDQzyP/SpUHH4f3hjg2c0XQ2em0w+ZliE648KMu6i6qZp77FmaRkGt6T7IfRFAxzwrn
	 NpFqN6G7qaCr2AU6Au1XvKOxPLRCVNmOnGLM2XQFS2+cSpBnSSRu+6GG541/Khvx8wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="R/7VtgIM";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91637606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91637606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R/7VtgIM
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so5924996eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029741; x=1793634541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsJcoE+tcg++lXHusmJ7l3VcG6mAANy+njpMsw2MDrY=;
        b=R/7VtgIMVUPjS3JNQbeOlGQ1HwUljc1QN/3FRshRpSijhV4BIopmB7prNof/3ppYEM
         J93Eiq75HlvCBMK1nH7ibCTOoXhq42H3kjKrt/ogOanLUSp2ug9qdj6amvozq54QT2Nd
         UX7OlbfPTz7npVbIW8wzVhmDEkIywkba6ZPxFb+aNY5gq4gtq9TgZ7eSmKHSNek9sKkW
         ZeMoLFf3F5+zKz9YJuSjd7RAH76U+cYx5rKK7zVg+zINSmK7oUzkrzd2uSlXHMhs2bAk
         VgwzpXP+uhkZoVqA6Y9SVVMwSHWd4r+9GstoXSEQL/eh2zgin76BnAV4YUL4GsgQDF82
         b12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029741; x=1793634541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsJcoE+tcg++lXHusmJ7l3VcG6mAANy+njpMsw2MDrY=;
        b=xaLzbtfXYyIZV3hDKQ/jwyeTG/yYbdrGIGeQzbx8TgDWZOYuqxjvP0GSNNr7K8/S9S
         J2qV2TDFFeNmuEXJ3nAIuLczAcNyfm/6RBl2Srd9z0qLFVvwogtpF6+L1uILxKl+n+eL
         +kFrHBsBordMmqMOf/8mrETQVLklYjtAw4Y2RWDqksM5nJIw2DgGNmzgE6zUwbENfTHd
         OcE1+0trm5YrFg+Pxzfl50JVJDPQsAeqNXwdTRUIq6yhRsUZr3nTUzeycZJh9++OLC90
         /U58FZtFtaaPn79W7X+7MDYtbFz2bqlqwUfKtGns73mYjvQl42R+U8wnd5EmS0rTjEUO
         PCWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnlhFO1/WYkrgBI819Q3P/zu0l+rj6pZyWpq7bvevVozSJCzUQf50Y6rI33JWyORSWX3biPAIE2+0FRm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb44CcFvYJyojh5PHWurlzwa/NVLmq5muUX81dTJj9Y/3aDGF0
	Xhy3C7mdx95AVzH71CuhM/xcoFpOT2Xw3Mnr+wS0rVrsBkcvER/f1y7b
X-Gm-Gg: AYBFou02nOIwU8rBRUBbNFmejNzNSTY8CjguBCks5xaMcFUX4oCSgDsg0iN7DN9ZGjh
	tgWeW7ViWYtg9HgtoeUS0t1+AKSRLVeCiZNZ00lvD01SMu1DHT/xDRMwnq9Li93RuubZtk3iLUZ
	S65RZlGwnnva858v391ynmT6pl7SD98ZgBAquF3B1bFTDICwLHBlswSDWBBD2yQ0ldBlQsuAnwV
	mXqsJcEEleQCnOxnelB3kA6FKLVm0EjFqWeBGYWZnurvprn9mQy1MfMi6OCu6OFCwjfmbfl6Sar
	m5MI7WkxiuH7YmLaF8AVHe9rwAF46sdGTNlXomQv8ywzTOIArpHrabdjJhYNJ3Vw95NB/toF/Il
	7lzC2047soXe7ICltgn8brgrr22jjHDybP9HGm4L8zgBSNX/uSHe6vZ1mRMaARg4mHI2kQ9kT77
	40d3Y+8kCcTOvmADWCAOd9RwWHOw5na4viDBdTaSqTbLjgTwAfzZ8Zkx9LHs9+BJ1zED9cEVAKL
	fUaNoSQoUE7bnrx6yJDqwqfLOLBhXZMcHREBq4gLVui/7mtJtDGD8dSXkIgRD4ACOCAjXNn+RSk
	7FLgqoqd+eJmzLZNz5TNcJz50606
X-Received: by 2002:a05:7301:514a:b0:359:3460:bc1c with SMTP id 5a478bee46e88-369e8492c25mr10432744eec.12.1793029740452;
        Mon, 26 Oct 2026 08:49:00 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm18151012eec.15.2026.10.26.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:48:59 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	co+b0df61d49532b2ee@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] fbdev: vfb: Validate framebuffer geometry and memory size
Date: Mon, 26 Oct 2026 08:46:05 -0700
Message-ID: <20261026154604.579823-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

FBIOPUT_VSCREENINFO can supply a virtual width large enough to
overflow get_line_length()'s int multiplication and bypass the
video-memory limit, allowing fbcon to write past the framebuffer. The
offset additions can also wrap, while an excessive videomemorysize
module parameter can be truncated when PAGE_ALIGN() is assigned to
unsigned int.

Limit virtual geometry and offsets to 8192 x 8192 and cap video
memory at 512 MiB, keeping the stride, framebuffer-size, and generic
fbdev drawing calculations within their destination types.

KASAN reports:

  BUG: KASAN: vmalloc-out-of-bounds in sys_fillrect
    drivers/video/fbdev/core/sysfillrect.c:24
  Write of size 8 at addr ffa0000001671000 by task poc/198
  sys_fillrect
    drivers/video/fbdev/core/sysfillrect.c:24
  bit_clear_margins
    drivers/video/fbdev/core/bitblit.c:247
  fbcon_clear_margins.constprop.0
    drivers/video/fbdev/core/fbcon.c:1410
  fbcon_switch
    drivers/video/fbdev/core/fbcon.c:2261
  redraw_screen
    drivers/tty/vt/vt.c:994
  fbcon_modechanged
    drivers/video/fbdev/core/fbcon.c:2693
  fbcon_update_vcs
    drivers/video/fbdev/core/fbcon.c:2732

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: <co+b0df61d49532b2ee@bugs.sh>
Suggested-by: Helge Deller <deller@gmx.de>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Changes in v2:
- Limit virtual geometry and offsets to 8192 x 8192. This retains 8K mode
  support while bounding all generic fbdev drawing calculations.
- Cap videomemorysize at 512 MiB.
- Keep the existing arithmetic types now that all inputs are bounded.

 drivers/video/fbdev/vfb.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index de137b2bd..de40ba8c3 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -31,6 +31,9 @@
      */
 
 #define VIDEOMEMSIZE	(1*1024*1024)	/* 1 MB */
+#define MAX_VIDEOMEMSIZE	(512 * 1024 * 1024)
+#define MAX_XRES		8192
+#define MAX_YRES		8192
 
 static void *videomemory;
 static u_long videomemorysize = VIDEOMEMSIZE;
@@ -159,6 +162,14 @@ static int vfb_check_var(struct fb_var_screeninfo *var,
 	else
 		return -EINVAL;
 
+	if (var->xres_virtual > MAX_XRES ||
+	    var->yres_virtual > MAX_YRES)
+		return -EINVAL;
+
+	if (var->xoffset > MAX_XRES - var->xres ||
+	    var->yoffset > MAX_YRES - var->yres)
+		return -EINVAL;
+
 	if (var->xres_virtual < var->xoffset + var->xres)
 		var->xres_virtual = var->xoffset + var->xres;
 	if (var->yres_virtual < var->yoffset + var->yres)
@@ -434,9 +445,13 @@ static int __init vfb_setup(char *options)
 static int vfb_probe(struct platform_device *dev)
 {
 	struct fb_info *info;
-	unsigned int size = PAGE_ALIGN(videomemorysize);
+	unsigned int size;
 	int retval = -ENOMEM;
 
+	if (videomemorysize > MAX_VIDEOMEMSIZE)
+		return -EINVAL;
+	size = PAGE_ALIGN(videomemorysize);
+
 	/*
 	 * For real video cards we use ioremap.
 	 */
-- 
2.56.0
