Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7B4F4751
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455223; cv=none; b=oLRWntamWRaPJ2PAHRQBZhnek8Ar4iOiIfSfJkkXQiKZz/Txqf1gB8Z5KJ0psTsxBGdHGBupTw30X+uQr11fG6V3eovyFgPoQ/pTlFdl9NL6Q+GgEIZ6glT4VFsMcJl5FCOK9ZCPWJyIfPQTshf5nGGUi+gU4iFtn+zAI2DLVro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455223; c=relaxed/simple;
	bh=mwjS1qJDm5Rrnz3Is+AgPi54s75JfFcvKNHxNEqcXXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NU6hZ8yxKlHpqkpI7CXDYnysHZOoUEDJQHC/7EpHM0jfYqmQcl5ybhQUVShYXPk94Zn9jFHxv4SlpUn6GrnqmrxtXurMvdGezaFRLdDHMfb4HNV5wySCyDRdrc+7qzSsn58sOq3vB4/1p3SPm+qH6yVUQDI33wPmWORwLsraidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4eojBLh; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4eojBLh"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2421a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455221; x=1789060021; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDFcBw+OAGvI9CgN/45/xQaVNM9WgzSnrhfaFNWW050=;
        b=k4eojBLhh+pbneNtBGsvjINgJp/GGm+GRtPPj6E5JXAqLRTjsajzF16jLY/3n5oMlH
         9f+GmCAyp5cHVdHNwL4+oDqb1BIvjQQUqqmMlEAoijTZ2z7Kq9usrkS3Q31TxgJ8INbX
         2rjBt/e6v/0Rr3H+iaernpGme761x2ORJ3zmPaaRvSty72me0HF9QjBrKkj5EyF6MM35
         TNCE+b5FaxBpTFnEcqXcoIm3J2xbqeANKfzAZu6nqhGAOTX/2ia58GULRGugsTlRqDJq
         dgc9/EXhByAcN8UuzFElV83wb2n+kPT0CSb7cH/iHQIEbjEyO4dIFDQyLopuhrqR8JEe
         Z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455221; x=1789060021;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FDFcBw+OAGvI9CgN/45/xQaVNM9WgzSnrhfaFNWW050=;
        b=sr3tbXT1rt95k6wdxz49xjeHPthvePIa0qzOSej23C37q7pzh85EOZZrBpXtmfjYBi
         GtGn7meyBPLZm2EZyUdw8/6kTumahwnphR8Y/WsQv5z93W07oS4g/VVnuTHfszx+Tg0C
         dX+RPT/Qyux/n5VR4TXG6HOMKfRKD6srgjAMPIpT9ih6WIUjMqBmyvhrxa70ckfBUk6t
         AohaGeNmJs78JVIpJnkyID3ym3pjIN6K3y8PiyDnHI0kNZyRUdKidWo+4Hbwrh2Xyx3C
         FO6ajqF4X8kOsMmA1RpB0Kg83nJfMhVxjXrwHmOMv/x9vz8lKguGCNAyt3EOhtu9KQ7O
         NHfg==
X-Forwarded-Encrypted: i=1; AKwUvBzcg3zGSZvqslt2S7R9GIfcOgLSO5N402ybUOkPwrUmvZWlB+Z1KqjiEiRfR4xavu1irMD0Pt+ltefJEHs=@vger.kernel.org
X-Gm-Message-State: AFuF++k3AY72iDWJh5RXOGrP24qxmCOTOFaHWI0CrRZiJK1c9pawV2tW
	KgQ53z340quTqbyr9JoWeVlouvEvT/XKjWQjnimdr31iubXqy9ALVbx0
X-Gm-Gg: AYBFou1K8nhfDjdfZERnSefpPIabW4PeaV4H+MtPBfvNQMiPJrkOvyTJ1P3IzM6hsFp
	4BUsyahAWJyAktsdP4mTRfF2w7va9o+7syC3UJrh3yZroO5pvNjKmnIrSK2qCQNiyHlNnwd3a0n
	MSAa1I0PfzZF/z9XmPESMln+xXuWLRhPyRWoge4NE1+WS/KwrSx9iPMgVSd8MeogYTPkOjZmt0Y
	zniHgD3kJzQ208MP3+mbCwbciyQK+8wIQHRKkeJL66GQsiW2HD6Vtf5rpSmyAfVXwdsS7AmWHWL
	iAqSIabbgruPAC1xSMpCdM3aWUnwO7SUUP8x5F5fQFlTFopHr5Z98W9gCja2CwKl2Hm4l4UhQGT
	lcIfAZKDeKzjfiPcx1QYrqwUN1wLWL2RTvOg1RKhL+KyQcypbbi06cPCdN99HnDctnOPeaH9NSL
	GggmUU6WQ/xfYkvr/5FqdZxivaaUOptfvsiWN6DMA79WDmL0xr06YOOwHnJGYZR7MIOA==
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr20003360a91.18.1788455221096;
        Thu, 03 Sep 2026 10:07:01 -0700 (PDT)
Received: from [100.87.176.22] ([112.133.220.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm891560c88.5.2026.09.03.10.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:07:00 -0700 (PDT)
From: Hardik Kumar <hardikxk@gmail.com>
Date: Thu, 03 Sep 2026 22:34:38 +0530
Subject: [PATCH] Documentation/gpu: Fix spelling mistakes in todo gpu doc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-docs-gpu-todo-v1-1-be712c8f67a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3ZT85GLd9IJS3ZL8lHxdY0NDQ7NkMxNTC3MTJaCegqLUtMwKsHn
 RsbW1AK0AuWhfAAAA
X-Change-ID: 20260903-docs-gpu-todo-31116c645874
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hardik Kumar <hardikxk@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788455216; l=2678;
 i=hardikxk@gmail.com; s=20260827; h=from:subject:message-id;
 bh=mwjS1qJDm5Rrnz3Is+AgPi54s75JfFcvKNHxNEqcXXI=;
 b=5IWOsWt9xiohCr8FqZ9h6JG87i/4Ds/tmjR+ndAiXtH1mAt27ALWop+qT8AA+3ER/f4AdBiOL
 nkusp+c/CarBjOJZhGw4YlrhF9zBSwGWupOkbvtDzFtfSi9Mt8D2CmW
X-Developer-Key: i=hardikxk@gmail.com; a=ed25519;
 pk=56yFuFlLHAdRemUZghoGHVCijEX767atrut3dPD0thQ=

Fix some obvious typos in the todo.rst doc.

Correct spellings of incorrect words.
Fix an article usage.

Signed-off-by: Hardik Kumar <hardikxk@gmail.com>
---
 Documentation/gpu/todo.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590..187932554 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -277,8 +277,8 @@ Various hold-ups:
 - Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
   valid formats for atomic drivers.
 
-- Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+- Many drivers subclass drm_framebuffer, we'd need an embedding compatible
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -303,7 +303,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -465,7 +465,7 @@ be turned into a WARN_ON() or somehow made louder.
 At the moment, we expect that we may still encounter the warnings in the
 drm_panel core when using panel-simple and panel-edp. Since those panel
 drivers are used with a lot of different DRM modeset drivers they still
-make an extra effort to disable/unprepare the panel themsevles at shutdown
+make an extra effort to disable/unprepare the panel themselves at shutdown
 time. Specifically we could still encounter those warnings if the panel
 driver gets shutdown() _before_ the DRM modeset driver and the DRM modeset
 driver properly calls drm_atomic_helper_shutdown() in its own shutdown()
@@ -891,7 +891,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.

---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260903-docs-gpu-todo-31116c645874

Best regards,
-- 
Hardik Kumar <hardikxk@gmail.com>

