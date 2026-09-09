Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0523B41C6A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981046; cv=none; b=HPQNq1reXLIDf2x3OL5QK/9C/UhUm6bz+VgHwn1W3ClgIZxUfWgqKvdw7D9kLha/cJ1xA70JQkHY44WgPQZ6Q9TjJ07jCdEt/vTDStxO9p1alvC44Pn9sjiTGQapnbQFp4JdSdSlmmvhukf+EVMTFuwM4qjeF1CIUXskiXKeU10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981046; c=relaxed/simple;
	bh=+FwvqeOjTOvavB2Tk0SAMV7YSqs/UTLwrOLAsMcBZ0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ChRWwhff2yljArDgsqTnVICyjA/gCdOI3K2QtEp6VCvhZ735IlGA4uD7NlY3fI11UD8VV16gtTdlDnWFDuGy8GoZBygupRnnC/WCO4rNGXctRmPCniu60njYayVWsJPAQnSS28Yi+/6rYB7ghpNlVXmxz9PTXUj9otbVP/Z3Qck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx+vL5tq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx+vL5tq"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so5108935ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981043; x=1789585843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyPxplOOHI2AEPRdVqrOjZibnjH3OGUmINX0gnTrLb8=;
        b=bx+vL5tq0zNZYW5V74NfZwQ6quPYjRn53dhcO+ZoSd/CZ2tAL3i3Hpr4DaF+Zk50kt
         XhQUgRH3g00XpXX+BBr48tSSHs8ckccYP0xfRXwrKhA6m0JAumZaROUuisKxl0eDQ9QD
         gHgh7LyGXplM41mJeuOtZQwrdtImgtas3Nz3IXVpdk+VbmcAA/8xwHxkbTZdY7j0Lfg8
         K1f0YlrCAk1yRYcRIDCE3vwcmQNEwapF+Zwd9ADvGtyd3tv4JHs8nDt5y26rmiLEqpYE
         0C6fM+Ef0YgetYn4BSjbq78RqwBgcshQyJiUqvPEYHXbLxzJeH6nvZSgroEOlGkPTLvY
         N/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981043; x=1789585843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyPxplOOHI2AEPRdVqrOjZibnjH3OGUmINX0gnTrLb8=;
        b=KRX67zaa154LPnV5dERnXdDlyQxYDonfC92Yl8a9NddR9lCt3b3eZWFYR0nRCNiwEz
         uxq3kbZ4xTcAULkKVzvggXOIjYZVlmCFpvD16aA+7ZbU2elHPyNZm6RKCQCcreG99tny
         5A+BqFiaJHTk0wwO0ltfuM9V74AsypHjBMxMLsvr8Ch71+TFenbPUPo7ymoQTNlo6yc7
         PnU4Va/k80tJFBkUt0iZ9a+TW9g5yg64hlnW8fHnsXIjXPB+zBgZf1famcXTf1LN2+Hn
         6M/dO6aQNOu7raj6BdMY42NKVfzBKHwHhO1rr82X+ZsWR++u0aiiOM0CV9KxGXhfhQqS
         fivw==
X-Forwarded-Encrypted: i=1; AKwUvBxlZfFE2MSa2EGIBZ7n2VwEKKICE8rq4eB0cGZ3gOFdlEhZbyPPS1Cmhr9bztTtBeu//QaVEz6KW2P5pbw=@vger.kernel.org
X-Gm-Message-State: AFuF++kGpBw/L3XYUD7Xnq5MwZI7CgUxzg8OBtaaOKWKhBMvKX/1JZOK
	rSGEJ6d/0FGEd3/p77kO2ekZaTNZi32tLDC2c6SqN1DkYLt80HR1aNjqp/Z08OPlqNZQIQ==
X-Gm-Gg: AYBFou01hTmOqZ/qiKizSK8bAAtHXD+A8gb9Lvj0PqOuhkYprrTzxUPkJnfIm+7UaPf
	+yXsGO3cjeVb8eCtXdAcAICCWFc0DaI36oYBc/gjdMc6hFmihQKdq2xt0KyZsiJn4aq6cBu9pca
	SNRkWVmtuYoqpV/f9Na29aKm7w1sJkPEhhyW573xSNFsB6LT1A1QA+xMcloUY8SywoB4HEBWH4L
	/fblnbQFKvHznHl7HDveRhu8pYUhyqlSzJc17eCA/I15LS3Ucjcv3KQtNpLmUz8arLfrbFpveme
	draN+Hz/LLh2uL19Bd46XsPFSGYGSh4Aa1+bhPd+BjDbZ++aiamiSEagVA90jkjNkiJKuUgTksK
	twosZGmc7ul2PvPWtRWDAc2Zcyb2HEtebwJXkXuBwUuBxVF4M+o55SjT/Eq0MH1DwSPlUSqOrtO
	iIWbeTFm2nU3U/iSt83UnCxwvLlKOQ+3ktjxRyUyx0ddh3FqpNdXdvdC1ue3HUQ2csAU3qQatxp
	Hki78vP4gHlXFwp+d/1KcbvdM1kSvuv
X-Received: by 2002:a17:902:ec89:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2dd07b9d3c0mr43860775ad.10.1788981042709;
        Wed, 09 Sep 2026 12:10:42 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db18a1eb47sm77198285ad.48.2026.09.09.12.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:10:41 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	co+c25629c98ba36ebe@bugs.sh,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fbdev: vfb: defer cleanup until the last reference
Date: Thu, 10 Sep 2026 03:10:23 +0800
Message-ID: <20260909191022.847295-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FBIOGETCMAP takes a shallow snapshot of info->cmap and performs the
usercopy after dropping info->lock. vfb_remove() frees the colormap
immediately after unregistering the framebuffer, even when an open file
still holds a reference to fb_info. A concurrent driver unbind can
therefore free the colormap while the ioctl copies it to userspace.

KASAN reports:

  BUG: KASAN: slab-use-after-free in _copy_to_user
  Read of size 512 by task poc/125

   _copy_to_user (./include/linux/instrumented.h:129 ./include/linux/uaccess.h:201 lib/usercopy.c:24)
   fb_cmap_to_user (./include/linux/uaccess.h:230 drivers/video/fbdev/core/fbcmap.c:211)
   do_fb_ioctl (drivers/video/fbdev/core/fb_chrdev.c:114)

   Allocated by task 1:
   fb_alloc_cmap_gfp (./include/linux/slab.h:973 ./include/linux/slab.h:1290 drivers/video/fbdev/core/fbcmap.c:108)
   vfb_probe (drivers/video/fbdev/vfb.c:459)

   Freed by task 124:
   fb_dealloc_cmap (drivers/video/fbdev/core/fbcmap.c:151)
   vfb_remove (drivers/video/fbdev/vfb.c:489)

unregister_framebuffer() drops the registration reference, and fbdev calls
fb_destroy after the last put_fb_info(). Move the registered framebuffer's
cleanup into an fb_destroy callback so its colormap and screen buffer stay
alive until all file references have been released.

Fixes: 5e266e2e0e19 ("vfb: fix memory leaks in removal path")
Reported-by: co+c25629c98ba36ebe@bugs.sh
Closes: https://lore.kernel.org/linux-fbdev/f2Kf9GYn1lKR5S1dbvGVtykMxK1RlgP5z8sW@bugs.sh/
Assisted-by: Codex:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/video/fbdev/vfb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 5b7965f36c5ed..de137b2bdaedc 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -78,6 +78,13 @@ static int vfb_pan_display(struct fb_var_screeninfo *var,
 static int vfb_mmap(struct fb_info *info,
 		    struct vm_area_struct *vma);
 
+static void vfb_destroy(struct fb_info *info)
+{
+	vfree(info->screen_buffer);
+	fb_dealloc_cmap(&info->cmap);
+	framebuffer_release(info);
+}
+
 static const struct fb_ops vfb_ops = {
 	.owner		= THIS_MODULE,
 	__FB_DEFAULT_SYSMEM_OPS_RDWR,
@@ -87,6 +94,7 @@ static const struct fb_ops vfb_ops = {
 	.fb_pan_display	= vfb_pan_display,
 	__FB_DEFAULT_SYSMEM_OPS_DRAW,
 	.fb_mmap	= vfb_mmap,
+	.fb_destroy	= vfb_destroy,
 };
 
     /*
@@ -485,9 +493,6 @@ static void vfb_remove(struct platform_device *dev)
 
 	if (info) {
 		unregister_framebuffer(info);
-		vfree(videomemory);
-		fb_dealloc_cmap(&info->cmap);
-		framebuffer_release(info);
 	}
 }
 
-- 
2.55.0

