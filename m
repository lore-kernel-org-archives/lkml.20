Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DC03C3C1C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896260; cv=pass; b=Q9xuusBx9e3eCtxuCLO/iqrMXVj4erPOaw3WZNS/cI5Z1it7Nsc6kKcJLMyRhNz1mwxbyzgaCwFVfy2szgqH7BedP3PNPI0Fu+L15HBhRUb6PfN7ax9l1mg6dEUe9J6bxiwNlPjuOMf7S6wBm1WOKcxWzSZ4AiwErLIibc3uYrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896260; c=relaxed/simple;
	bh=D98ZnRgZoVKsWJBIF5bIt1WfQkQAqbgwBKPenuCxKcc=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=e0ci31UDBc+Bi3Oj1EigQi4GVwwHm03Etj1QygwONS77GaPFHYy2fE8ycZM7LYw+AOwlqowtVm4IPQ17vXKFk3SGlZlAArZ6qq07Ki3WfaopMIDk3yTAJ7Za69kcwvAqoQNxWfNJi2shRDUqYzsTkf+9DijIvsKGjeDy5hyqBcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=C6ApsR+X; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="C6ApsR+X"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caced6038eso6828155ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896258; cv=none;
        d=google.com; s=arc-20260327;
        b=U1fRJWB62ZLw1M9aPVwV1mEgWgxkaZH7BlypZcGp5HdQYeDBgrlnYO/2AD6FE9D13u
         LY/llLIsEsRLYHIM1NdGq+ZRCjaAB73x3Cd5pIpbCCWR2mGy3aU9H1uhYdD296/JlmPO
         TZwJU0nB2FdfARhzloTfdzQPeGZE5jWSD6Dx57hSKipytk2JlKYwRvkJZK7hT2Ok9UOF
         O2F3G9/occJQCbJspgL/44ZulmYr9JLDmJIVjWH7mx9AoHpsj92fSJ8Jv0GQelF8VT8+
         QEBj6AupfACO9k5ys55qAimc6HGRLq8VPkx9EfWF5edbtpyhgAEEp0nHVu2msAKmrzgM
         cS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=e87d5G70BjGRX707l9cgaVd7OCZfs4SUPvQc3fL2fBE=;
        fh=AeLtGLXhL0UF8IJapScsJai1IroJLxLN3CSTTceC3iY=;
        b=q/rtdklC+8LkA4gPNHj/noGmPC7I2CLAl7+PPJrUdTK+p5SEGchZkGf19yh9sO5BXy
         lPnLDUAIlhk4UVVXp/w3bxnNQuXjmeXQXfg/py/6zoROMDBg6PrUC6NXQHdmN8u6IecJ
         qOVGoqt+uhGwwKbLbcgYjrYz+xi8oTckWGtLC33pl+pNUjhOPV50+sL198kbf9+5SOvJ
         X/M6si5zmQ+94FhKm1bZqof/VoVkOs6S2+BAlYwVBpXODXB2vypNEYXDJ6TQDrvFHgbx
         Pmk4Z+80DH7VXl7z+TRxXCAs+qWZ/SlIH+ZUPoJ4gJe7rc3vhoV6UgNYbClShXPJJITZ
         8ZEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896258; x=1788501058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e87d5G70BjGRX707l9cgaVd7OCZfs4SUPvQc3fL2fBE=;
        b=C6ApsR+XY5iaOLz6Gx/BghtmiafFa/w5d7q55jBZPbLuUo7e2YlsXbe1XNdiFuyB3m
         tnsnLbfZ0uzL27VtrCUrWo6impOONBnuoMAdqmjiSQIjhwYBvBATzZPay8SHO9A1hrqD
         ERRpCnnl3rpeyvhfTWE+wYNPGd2KIQJy4yyNsEegwujias7QwC3Cq1VWibgx3RKIRkxI
         DXGeztBZ+aRAmhbhZE/fzLgBotlReVcjc9bTPgt2ymMaoJjPDlmVManw3GCdpC3lY/d8
         /kHvER0AhvrPqlfIDV1HmzFs00ovxgD23JaXE3oa6NVtZobQk71S1BuO7A+dU3MwBm7f
         T+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896258; x=1788501058;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e87d5G70BjGRX707l9cgaVd7OCZfs4SUPvQc3fL2fBE=;
        b=tUU+iPeGKCuKI4tyNtfB7Kb0sSufVEgHAOLXOtYYr3oQPnmCH1IsJ1eQ4yyffdRYC4
         BXiGN4ufV2oCPS0iRDnrw623ZNO2l/uPRMZVE3m+mn3lr53JxX3KyPBsFG1O6GEbZud1
         uOjUHKSEG0BkBRqkmwCm0GX3JF5+QvvzCoOntWcmGTbLEJ5DksxgplnHLXwndK8zXq9S
         8OeU3x6L5YHl9TngVrwntSLHqwJ7N2aeRqBE1KcKTiordOEYIba+HDa12q+R8M2TabKT
         WU8QemONiVdWE/COnUdXav5A11twPagsFW35Qv01TP5n1B2n8C2IZyjkYqX7GstsrBUc
         pjyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFLz68eu1kQOqGNmV1Q2L39hW1UUjqeliaG3aqwzwTnk5ia6G/pE0nW8BIeTW60mSif5ObJJaK9U/LClc=@vger.kernel.org
X-Gm-Message-State: AFuF++nyTfSlKo8PhbKTq1M5eLLaw0YP8+gi7Z6VRtr+8OmFLbWTZmnG
	e78dOetaVc83ktmt0vScx1n5iC5+M4Bmb7WJa2QTcQtoOQU9vo5p+w+2OYtr72gFnwrJ3I6yTVw
	AHRtkQzurxpuN3gNiPEDHpaekxOa7tKnUiH+M0HzP
X-Gm-Gg: AR+sD12uypsuy+WF5hUwqGQelcSDGVY/qKrVIrIlM4vjesF7iD0c5iJjhF5R3u/dcul
	ltsIHuNxQsRmmwwbvaJci35jZrWTRYdprbIPOwx4CrJGUiZNMvifBwrPTNWTNfcU9PzQw87U6V9
	z9T1D4CxLBMWM8rJbyIVllkHBUfPgJVWtO199uUgP+zOFENz26STCiE3sS2ezek2oA3duxnlHjV
	xEgw78BFM4O57ER0kEyEFMDGJ5g6LTmCQS6sy7W6Emp9+EXTjUsF4VvWgyqb6U1RKipvAu0yKy+
	4nml0mx4+c3IzWRVnhNiQOyjXpqxoE/JQ/01mpLJsL0KvsJUXyj8IcB707MvmuVskjGLlvCSB3Z
	tnMeS+DHSGYwAE0wGocrDqFQRyUPM87zflg==
X-Received: by 2002:a17:902:f647:b0:2d7:1cbd:9ceb with SMTP id
 d9443c01a7336-2d7269d6badmr162549875ad.12.1787896257763; Thu, 27 Aug 2026
 22:50:57 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:50:55 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:50:55 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:50:55 -0700
X-Gm-Features: AcwNN1WWqcM5yhXJkATKhrOpZ343F8pl4CTVCtlosXKNbW4VXRhrPmb_dA1bLu4
Message-ID: <CA+0ovCgp6tg_QwAh01C3RAV4-s0Lv2BarzoRZtnpor63TRTX-g@mail.gmail.com>
Subject: [BUG] drm/bochs: drm_gem_shmem_release() WARN on nonzero
 vmap_use_count when unbinding bochs-drm
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: falemi@asu.edu, virtualization@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/192-warning-in-drm-gem-shmem-release/

  bochs-drm 0000:00:01.0: [drm]
drm_WARN_ON(refcount_read(&shmem->vmap_use_count))
  WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:177 at
drm_gem_shmem_release+0x2d2/0x6d0
drivers/gpu/drm/drm_gem_shmem_helper.c:177, CPU#1: syz.1.397/14947
  RIP: 0010:drm_gem_shmem_release+0x5bb/0x6d0
drivers/gpu/drm/drm_gem_shmem_helper.c:177
  Call Trace:
   drm_gem_shmem_release+0x5bb/0x6d0 drivers/gpu/drm/drm_gem_shmem_helper.c:177
   drm_gem_shmem_free drivers/gpu/drm/drm_gem_shmem_helper.c:207 [inline]
   drm_gem_shmem_object_free+0x15/0x20 include/drm/drm_gem_shmem_helper.h:161
   drm_client_buffer_delete+0x189/0x2d0 drivers/gpu/drm/drm_client.c:201
   drm_fbdev_shmem_fb_destroy+0xac/0xd0 drivers/gpu/drm/drm_fbdev_shmem.c:67
   do_unregister_framebuffer drivers/video/fbdev/core/fbmem.c:561 [inline]
   unregister_framebuffer+0x2bd/0x3b0 drivers/video/fbdev/core/fbmem.c:606
   drm_client_dev_unregister+0x223/0x2d0 drivers/gpu/drm/drm_client_event.c:46
   drm_dev_unregister+0x44/0x730 drivers/gpu/drm/drm_drv.c:1155
   drm_dev_unplug+0x45/0xa0 drivers/gpu/drm/drm_drv.c:497
   bochs_pci_remove+0x3e/0x50 drivers/gpu/drm/tiny/bochs.c:785
   pci_device_remove+0xa3/0x250 drivers/pci/pci-driver.c:512
   unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244

We do not have a reproducer for this one -- it was found by the fuzzer and we
have not been able to reproduce it deliberately.

Happy to test a patch if that would help.

Regards,
