Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A3A3BBFBD
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527314; cv=none; b=vEZaR6EWIJhEsGwYCk6djyxHWfFLY6PwZ3o/Der25nwu/pxwNdKW7oqhw580uMdO94udJxQtVoD0NdFtyTqarvGlCV6XnK2UmHWTUZxn5yQpYQx2oMlTkt8uwwjBXje4cje2DmD8PKEuebrJRfFn/wjXnrgCiWdVz5LfTtuOkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527314; c=relaxed/simple;
	bh=oJQ7TehGKQULHuSnn7wX7YQAUj1aG3Y9J5CmP9kRzyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qQTodXKZdM//9WHL89h5urrLqiQ1GZWHr8vf0rQMBPOEG4RPk5Z36PP/fwDiROAZg0syqlVUb7+RBrJv334S7+IINzLuRtTByAGqTcRWAFxUJ9SGI9Fzwf2b0ALOiwexWOsSZ7vHBdsiPH3pbVSv9bEcRDB6GuikMby3wBWNWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=SksMmFSX; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="SksMmFSX"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1156125a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790527312; x=1791132112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cD1GGOAxo3hdOUsJqunYxfhJul2XQRWSlBhx+D5pmZw=;
        b=SksMmFSXxdmYyASIrD42gGRD8ICKB2i0TitCaaEM3yGf11909KZrtsA235TG5nbpml
         uQ4JqemKmNR2zNSeGbOEfSyErPNnREtaHq8ib2e+1GLNZAjeUnOLQT+vXvD7X2wSK7Q6
         Gw22sr1M+tBlb04P1Bo/rmiV+hBfYkXPLcKcgLcgXB+kzHIBYETgBRi6suIOWjIFUBDf
         iuTAoip9pVqg+JEsCobT03gEojaP3Zkv9bSeUfjCu2RD6IvQjO27KXdJ4P6rRJnDD/xe
         JANan9Ym1/AasQ2FNoUjypkX8DYQjgpsGunaZD+2q3mtdBgoADsb7m8aIW+nFz+vRPCS
         3pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527312; x=1791132112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD1GGOAxo3hdOUsJqunYxfhJul2XQRWSlBhx+D5pmZw=;
        b=jXWS20lUun1et2i6/r/P2K+bHq9qRruVMOpl9KsXcqgfGRDnzCntZlvTrYiHJx7GPN
         Z0KXSSav3EOLuAsv5IJiu62iGCK9MtLlOqtnhGwvruI5xRDiWkaxFICAiPqYWrx6UkDr
         4kHxoye+KGQvVne1uwqnH2hqSaBINzWK0vo3jAD73MePfP/PgPr4JrBN5P52CG+j1QH+
         p/AfqCzOzSrsdD8QyYK96t5gGi8hc3zgS+wlRyAhloI+qc3+99aShJgdZiQGBYlOyhph
         Bp4VgG7rKUrbOqS1f66gVv2xdWQw94y6LiyzWai5jZUu4SPeDSqKD+x66jJ1LksiuGfF
         vn4g==
X-Forwarded-Encrypted: i=1; AKwUvBxlQPz7hduU3oFvZiwfxqas9NvUIzhUkPsEQAp1xySnv8xyFakqgdgjv2OAFhA9hxDRrh9sJihptI2oKUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8URCTCQrOK6Y+4l8U2L4ZqbviBwejrSSOu/otHWuFM073ShV2
	rFXreezSNxoCU4tLUDBAWjyK6sajHyzeBDvgC6K8ra8tFFlvHwVJ3PgHT5jlcsfRtrzW
X-Gm-Gg: AYBFou1xe5+0O/IbF1XT6Bc7TNmMBEe8T5PowN4lGssu77el+9YEqhFGeMXwkPjgsS2
	xmKHU9t6RPQZ4sO6DjyoBVoxIS8jBXtJGS1Qy5I7YplVdemlkWbxp6N5ZAjLYZLPaTwlqYFlbdf
	oMKE8CQ4XdKfvtrL+2Ah7Y4Z04+VZDFb63bHxTkqSNpdY3tOLfRRZamX7D/GdJokoWby0Q8KiYf
	TREaLRf+MkXfYmt/nSVK7devd5+RJJ0ZPXkbG4y6OCTsWo9VxqQQ3ye/BKZPsw780KkAYSCavME
	cOyO6vPfR/vCFBFY58OVuA1zzWbRc0PhdQgujS0FP0GjwUeYTbXNUPx6AjT3FQh/gW8WvXxUv9o
	+TAieRISjy2toGf47lY5eRVxt6pgjAq/Q5VCUdwXwGvx0SzdgNCs3d8SEMGWKg1rI0/BUnfXLKa
	r39bYOuBMigrlGzoxROqECHOJZq1W6cviRRy/hllIJ+37mhoBio04RTOaiZ5xVRbFy
X-Received: by 2002:a17:90b:4a8f:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-3a09853c638mr8360458a91.1.1790527312129;
        Sun, 27 Sep 2026 09:41:52 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm21993533a91.2.2026.09.27.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:41:50 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: musb: Drop the D+ pullup during system suspend
Date: Sun, 27 Sep 2026 23:41:45 +0700
Message-Id: <20260927164145.1956429-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When musb_suspend() clears DEVCTL, the host sees a disconnect. But VBUS
is still there, so the controller can start a new session on its own
and, with SOFTCONN still set, pull D+ up again while its interrupts are
masked. The host then fails to enumerate the gadget ("unable to
enumerate USB device") and gives up, and nothing at resume makes it try
again. On a T113-S3 board the gadget link never survived an s2idle
cycle.

Clear SOFTCONN once the context is saved; musb_restore_context() puts
it back on resume. This is what the FIXME asked for, as USB can't wake
us in time with the interrupts masked. On da8xx, which keeps the
session over suspend, the gadget now disconnects too.

Fixes: 6fc6f4b87cb3 ("usb: musb: Disable interrupts on suspend, enable them on resume")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
I found this on a T113-S3 board (sunxi, s2idle, Intel xHCI host): ssh
over the gadget never came back after a suspend. With the patch, all 30
cycles I ran re-enumerated after resume.

To check for regressions, I also tried a BeagleBone Black (AM335x,
dsps glue, suspend to RAM). There the link came back after every
resume (10 cycles without the patch, 30 with it), probably because
am335x_phy_suspend() powers the PHY off. 

 drivers/usb/musb/musb_core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 73ac25f536..272683f14d 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2825,18 +2825,24 @@ static int musb_suspend(struct device *dev)
 
 	spin_lock_irqsave(&musb->lock, flags);
 
+	musb_save_context(musb);
+
 	if (is_peripheral_active(musb)) {
-		/* FIXME force disconnect unless we know USB will wake
-		 * the system up quickly enough to respond ...
+		/*
+		 * We can't answer a host with the interrupts off, so drop the
+		 * D+ pullup. musb_restore_context() puts back the state saved
+		 * above.
 		 */
+		u8 power = musb_readb(musb->mregs, MUSB_POWER);
+
+		musb_writeb(musb->mregs, MUSB_POWER,
+			    power & ~MUSB_POWER_SOFTCONN);
 	} else if (is_host_active(musb)) {
 		/* we know all the children are suspended; sometimes
 		 * they will even be wakeup-enabled.
 		 */
 	}
 
-	musb_save_context(musb);
-
 	spin_unlock_irqrestore(&musb->lock, flags);
 	return 0;
 }

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1

