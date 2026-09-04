Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABA44AB94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524578; cv=none; b=U+YVLkwqsJa3LaS2t2xzNrjhhGbcMz8ZnOjGB8mz4nOdrMAyXF6u57WjCw4dNC3NOTYmnxIvavc3CHMhranCHqY4XF/znGOKzTjApuCIobHdqOA/usHArf66RKpssdLHCp92pCJ5IhHHyA8pqdar+S6CKkxf3DutrRfXfv7oDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524578; c=relaxed/simple;
	bh=1mRrBqwUgZts1zwql3KQjALYMgJWWNR6dZeZ/uFaRM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fv1Sav2vPkrW9T9RVFVTlc6MJowgSr6HFtvphpq6FSKpBxhIBCVLok9I7/8BbeQY+FfnjJEpr3RIWYhDqIUpGgY0mPwJlKN4YQN4CuAcjDKSqyFSxRcP0CAoOijBt0YJn5ISRvp85F1AGiZNuNQMTJux/LI0lJE10eitRQzIkTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmQ4XDuA; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmQ4XDuA"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b145a9623fso409678eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524576; x=1789129376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpkKAog1QJLuRwkyLizAo0StvAtiJvsvlNaL98jaQbU=;
        b=kmQ4XDuAtFpKeTQKYwp92YkwB9g9hKqTexVwY/OHUNC0nI4CGWsb28GUzMFulhs6Ey
         /DR6fr3Slq2qIPx86zliD8os2r+3zGB5CROhAHGa2CJaOGXV2CWoiLk7Mvb5RsIZYneU
         21ZmdvmzlDdy7dsNN0byCtcLnz0YyWhXQyiSu9QjljkEF8tug+c9TmMdIzefosWbb1JX
         Kd0X9H2zHtrT/veYbbPO6jnfTzJ6fV+nyKR6O9/tq4qujEHoPg7SuxEXRTc134gdzg6o
         UsNUNygb8SZHaF3mIUjvjLIooYmcEylJanV471KtfftuILb+T8uHIFx7eJMwZn8Rfszw
         +lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524576; x=1789129376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpkKAog1QJLuRwkyLizAo0StvAtiJvsvlNaL98jaQbU=;
        b=mInEw0GRt4ijQLVinzIDB44xZdUwGknECvWFmt0nyeVAP1S2rgIvdQto4oRCSwLrPG
         mph0XIDhnpjizPbwHZHb98IzU23RW6+eKVwE58lMvxMhIgMTrvdH65GdJtZ6XiaWSuFX
         a0ESRqQmLtWrlNldRp2i5u83xzvGrV8FjhQ8t2N79kHdSKFq5H5gu562cMAF0gSwt7+q
         Z8OGyN3eL/jdyTkLEUkKQoBgwZiEvSrMrP+uxlWQ4iOc8dDYOlvEXKSgkAaAsGfgjC5X
         kUqET7AVptgQ4fdQkf55WKSRdpVPw3et9kCSRlPRHXVATn1jQ+vr7iPllPBTucEVyAeR
         LClg==
X-Gm-Message-State: AFuF++lNjK67yVrbC6KLBNhX7yLAl48zpDPdOUPuXC/lOFgckkKPHJS5
	/C52cTIQcDYlnXe+FhhGRhhz9wMiEbi3IFKEsyWceg4oizix9/nbmlIJ
X-Gm-Gg: AYBFou0rGLAg6C+gzt9AEtD7Jb/BGm8eKc5IoTlPtgTfhT+iyrj2zDB0g4TNlX2zTfM
	ZaQZYGGIYsEYJLocUzMUbLRPi7bB/Odgcwyrq9KTOb4E9frmKOvxe46PiPgahWOSiQGm3BptoWQ
	qzZssy/PhDXJohyoXok2Gs1ROIjk/Yjd6OtH0Lkmk0qlbAqrIsPP513nSI3pdlwJOBFmhAj9EeH
	hMXQZyBG/2zECJnnr/52SCaZLNmTx/wJf3dG8rq91MTObEjiltrcSus6XeAjTAOf8eGQZnUU6tv
	rLswaNAu+7qiFIgTlxX9VWLbJNQTILhanlia+eXJYOca2S/+d5ojGJU0v+ZyhS53Mx7jW/J4SQQ
	bmAeT/RhF7nwTehiNFEEBVugApiNQ26T6ch7+Rpthn3G/G7bs6DmfBLuiC79FTNXdAWumoQ8Twx
	sSMZjAonssaUeW9LI21smyvst6l7DscZsxTrERKxed89JMLxzhUTC7cTBDi5tDvf9ngGx04zIF4
	kpPMSEvc/ORtTM=
X-Received: by 2002:a05:6820:160b:b0:6b0:1b86:fb0 with SMTP id 006d021491bc7-6b6fe59c86dmr3811462eaf.31.1788524575594;
        Fri, 04 Sep 2026 05:22:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm7440220eec.1.2026.09.04.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:22:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: fix typos in comments
Date: Fri,  4 Sep 2026 17:52:49 +0530
Message-ID: <20260904122250.29879-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/video/fbdev/s1d13xxxfb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index e80c806ef520..ab09790d6268 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -400,7 +400,7 @@ s1d13xxxfb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 
 /**
  *	bltbit_wait_bitclear - waits for change in register value
- *	@info : frambuffer structure
+ *	@info : framebuffer structure
  *	@bit  : value currently in register
  *	@timeout : ...
  *
@@ -426,7 +426,7 @@ bltbit_wait_bitclear(struct fb_info *info, u8 bit, int timeout)
  *	@info : framebuffer structure
  *	@area : fb_copyarea structure
  *
- *	supports (atleast) S1D13506
+ *	supports (at least) S1D13506
  *
  */
 static void
@@ -516,7 +516,7 @@ s1d13xxxfb_bitblt_copyarea(struct fb_info *info, const struct fb_copyarea *area)
  *	@info : framebuffer structure
  *	@rect : fb_fillrect structure
  *
- *	supports (atleast 13506)
+ *	supports (at least 13506)
  *
  **/
 static void
-- 
2.48.1

