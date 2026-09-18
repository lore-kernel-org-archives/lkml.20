Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EE1F8755
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775661; cv=none; b=r2jZDnog8cOr3zyqJpBDxPt9D2f+z4s5BGAu2V8CDzucXvtIEvgPpf4E9/9lIbhMoxk4r8qrr1ewW2ZQrVRVI0ZDtvmpy/MnwVRffOYG0IpL5tVV0JXYyPoQtH8weVUlUSEBkqmv4zrcGnEan57HE23NgIpzeAfiUD0qUXDa2TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775661; c=relaxed/simple;
	bh=8zn3Ab5D2+hSVJPK2YkzpUGSQzUCMZEApKo1VGuWpJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lFtHJeKu4idS4m3a9UIi55s2PL08faEfHb64g1MU3IkZWw4VDgi0fkB0eArWGGvwkL35I3jq+0avL7GZnUu4uwSwa7g5FZMb82ZjI2zu1QXEpEkrI6kY3PScO5T+8nRcUBFkpEGbBRbXkHpUo4HsSOSSU+ook/cb17uXe0D8H48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX+8o3ei; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX+8o3ei"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76543e1so5478231cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789775658; x=1790380458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdY92PMLKIgjJ7iJT5OfPO8aY0kcQJ8wiVZMdQNIWQk=;
        b=PX+8o3ei/VYd2senKIGDzVWDEKpv+yLcwReAxsFRAYE7lozmaPq7ZIrJcI4H+QbwqU
         eFq2gXeNIr8vauyR8ihAglNEefoYYwztV7A9UCENJ6tReRuC/OtsXTYgBvQPGcHm7hqF
         8HRW+kmNfWu49o72fnK4LcKvbSwqOixPkolzsVyR8x/+8n5BiA6Nggdw2QReiyvKo7MP
         APxlqRmBjOouZQ8Zc8ZSfMio2D7k3e9ARwBDdvn2QV1VhpKrmT0BUmjlyf/p8rvTYS4A
         dmRskFmc0Tr99es7YTNPGLBqlOwkMRMuvuppmSIKrt6SpRvnRNXMEfcW+OmMm1XZN6fM
         RcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789775658; x=1790380458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdY92PMLKIgjJ7iJT5OfPO8aY0kcQJ8wiVZMdQNIWQk=;
        b=PcUoukoK5t9cz7KI55UmIqYYspxKTP5ueuLSPLX8Cs5ue4C128c93tK1vUtpQkOWa9
         LrOnD1wjFfUNXjNOPvtRp4MDXvqGUWfu7PWzgZJS0GmAFMCDRcQU5qW1ukI68nEnuwZF
         Tkp4gNuj+GjOq5d8r8Ko8+LZTKKC+ehea0d2Pgo0385mqBHUSgfff/Mwk6uTc1NgSL2G
         AFouz6n7bH7bmPC3l9qY/8dSw/qAGswlDgTeGNHuYA9uB6n/RdkYV7FYn2NzAW5zx0td
         7af7v363GAX9c/KTU75ZYXUFupfaRpLMO3M2ttgX1KapE69x76mCCAnA5XpbB4d7yo1A
         MeRw==
X-Forwarded-Encrypted: i=1; AKwUvBwyfVMyYVfZh7CuRbY46ERUhXtIA6e9Dr673YV8vJ5N+8wNNY1xvrcOAbfplVuZ/TUlP8JyBVhA2c9XeaE=@vger.kernel.org
X-Gm-Message-State: AFuF++lFvFjy8X1/oYQC7Nq/HcYdN9kD51GLn2RK9ZnpmwVqLq/XUoSi
	UQkHUb+n48smAGh+pcB149HyZM/tQoIiMmUsAX634emp25dxE4lzX2UO
X-Gm-Gg: AYBFou35Mk3PRbvRsYynng0C1lnOHwMHNQNwE52bV+7CMopoeHSRKy4rk9vWsRuclUX
	JQbTBPpzyXZpGGPERgYVQlrz6JYNbJbKRbgizLCine9olVc42tUB7SmiB1r6FiOJSO9kpeCfmkR
	z0d8b38bPS48aouF0I5NvjTIhoDPHlbYuc/5239rN1TD7Va275ehp1kC71sG74z1tqy+GDZFhLK
	gfk/8s0Dkdh20j59mfFNFYDHt3nwUwG8YxVeCQi5cOp8vlyNfl4ORLeFs7r5ayGYfzG74kPKnqi
	YMN9u8/fyqzInBElnFzrZf5hxO1lgFzcgvv0zo3lhDzzMTrCcwQTb9AYK5arqfJdK7bAOd9ZrAB
	Fxeo0j/+Rf///XkF4mNsE4mT4OHmXTQLNR0of+oDl1XlcuIbZTs7rlI6YRBQSoKfDo7Rpvl+GmX
	Ep479AmO52NPacuQNgjwSZiNNxLokP5VLBwoecVsakAaWZLXDKyGjwBPu3u88fXkR9EA4PjfJy9
	R9NvR/jLZzK8hWTQtkivT8YIIaeT+dbLveiMG2ULRaLnAFV/gZAjg==
X-Received: by 2002:a05:622a:614:b0:530:514f:3c3d with SMTP id d75a77b69052e-5329e793881mr65771251cf.11.1789775658468;
        Fri, 18 Sep 2026 16:54:18 -0700 (PDT)
Received: from localhost.localdomain (static-173-249-255-168.cust.tzulo.com. [173.249.255.168])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae77acccsm8517991cf.30.2026.09.18.16.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 16:54:18 -0700 (PDT)
From: Forest Crossman <cyrozap@gmail.com>
To: hansg@kernel.org
Cc: Forest Crossman <cyrozap@gmail.com>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gm12u320: fix system freeze on surprise unplug
Date: Fri, 18 Sep 2026 18:53:49 -0500
Message-ID: <20260918235351.398269-1-cyrozap@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unplugging (or deauthorizing) a GM12U320 device while it is driving an
output causes the system to freeze. When this happens, other screens
stop updating and USB input (keyboard and mouse) stops working, but
non-USB storage, audio, network and ACPI events are unaffected. Because
the unplug never completes, the only way out is a reboot.

The kernel log shows a NULL pointer dereference on every such unplug:

  BUG: kernel NULL pointer dereference, address: 0000000000000030
  RIP: 0010:drm_mode_object_put+0x9/0x20
  Call Trace:
   drm_atomic_helper_commit_crtc_disable
   drm_atomic_helper_commit_tail
   commit_tail
   drm_atomic_helper_commit
   drm_atomic_commit
   drm_atomic_helper_disable_all
   drm_atomic_helper_shutdown
   gm12u320_usb_disconnect
   usb_unbind_interface
   ...
   usb_set_configuration
   usb_deauthorize_device
   authorized_store

The call trace above was caused by triggering a deauthorization, but a
physical unplug reaches the same gm12u320_usb_disconnect() path through
hub_event/usb_disconnect().

The task faults while holding the USB device mutex
(usb_set_configuration()) and the DRM modeset locks taken by
drm_atomic_helper_shutdown(). Mutexes are not released when a task dies
in an oops, so they stay locked forever, with the USB hub workqueue
(hub_event) and the DRM framebuffer-removal worker both blocking on
them. This is what freezes the system when the driver crashes.

gm12u320_stop_fb_update() drops the cached upload framebuffer
unconditionally:

  old_fb = gm12u320->fb_update.fb;
  gm12u320->fb_update.fb = NULL;
  ...
  drm_framebuffer_put(old_fb);

gm12u320->fb_update.fb is legitimately NULL when no update is queued,
for example when the update was already stopped, and
drm_framebuffer_put() does not accept NULL. On unplug,
gm12u320_usb_disconnect() calls drm_atomic_helper_shutdown(), which
commits a CRTC disable and reaches gm12u320_stop_fb_update() with a NULL
fb.

The NULL check was lost in commit 8f2cb9379fb4 ("drm/gm12u320: Simplify
upload work"). That commit moved the reference release out of
fb_update.lock (so the framebuffer destructor does not run under the
lock), but the previous form guarded the call with "if
(gm12u320->fb_update.fb)" and that check was dropped in the rewrite.
gm12u320_fb_mark_dirty() still has the same guard.

To fix the crash, restore the NULL check before calling
drm_framebuffer_put(). With this, the CRTC disable completes, no locks
are leaked, and unplugging the GM12U320 device while it is in use no
longer freezes the system. Tested by surprise-unplugging the device as
the active output--before the change the kernel oopsed and wedged on
every attempt, after it there is no oops and no stuck task.

Fixes: 8f2cb9379fb4 ("drm/gm12u320: Simplify upload work")
Cc: stable@vger.kernel.org
Signed-off-by: Forest Crossman <cyrozap@gmail.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 4ad074337af0..5bb6488556de 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -446,7 +446,8 @@ static void gm12u320_stop_fb_update(struct gm12u320_device *gm12u320)
 	iosys_map_clear(&gm12u320->fb_update.src_map);
 	mutex_unlock(&gm12u320->fb_update.lock);
 
-	drm_framebuffer_put(old_fb);
+	if (old_fb)
+		drm_framebuffer_put(old_fb);
 }
 
 static int gm12u320_set_ecomode(struct gm12u320_device *gm12u320)

base-commit: 1717fcc5be575d4768279148ae9465a8b13d4339
-- 
2.55.0

