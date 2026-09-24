Received: from mail-dl2-f39.google.com (mail-dl2-f39.google.com [74.125.229.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06EB4AD7DF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283939; cv=none; b=V2HL2ZaqGg8F3Y/ADOch9FGy6K68YPkAt5+HF7cO/ZAGQBVj/sUcnzVw2Jupo4solUxL9m0AQ9kYJolqa/WOUgv7d4yRcmAxzT1Zq2vTjFZVNUWf3jwulqMNfunLzow/lWptp5lXfz8WmPYKoqYbK+o64KdluTy3WHMdqOa7lZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283939; c=relaxed/simple;
	bh=3vbIOlEn96OVymO5shb/VRYEK2XAnbtqpSjuTkZfLMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjhjRWinGkWszSd9aAkHO8IwmMLsAlugz3dMaMPJWy5uzUqOqpehs/aaudY3bg6YushbzCDvizqkod4/Qd+FQqrj01FblgeHGja39ui5tLJhY9x5b1uXrHJQ4DJNluiimYZVSMeQ1jS8jGrUOZppzKEBQ2pzxEFrIYUQAqsikU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJSFEk2E; arc=none smtp.client-ip=74.125.229.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJSFEk2E"
Received: by mail-dl2-f39.google.com with SMTP id a92af1059eb24-1438cb9b3a3so253051c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790283937; x=1790888737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ygf2sIU3P70RHHO5gUQG27kuSw6D0dXOtQSK/jAHxSw=;
        b=SJSFEk2EwRn/Y9oNqJR1oyTRbU8lmlq0a5erH2SbgbPFqOrBXci0yUFzRYPXhUTi4j
         Ds4gFXjLvRpXIdezHujuMl7cYcqrDhd/oY5+HtJjDK1cLFCwQSI3bc5LL70IhBrGCvGo
         ietB9wv4VjxCYa/1B1jAMrzuuAziILXUZgCt+UqjBzs1UjyLG1mmX9RtHmzbC+6UAJY+
         /DUEb/Q/3QslLrh/yDqU5f3OPlbmiQKZ/HtwpcjbSjJvJgKR+OekrzqBpHagMp92F0Hw
         hdDVaWQMkb7KZ1C0UOXZ8qELyuStG49Pc/VUhYnGbUroLpxlrZBQ4iUoKbraO5mgkRod
         szeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283937; x=1790888737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygf2sIU3P70RHHO5gUQG27kuSw6D0dXOtQSK/jAHxSw=;
        b=MX8bw88V+pEuk+XEQbjLT43IDbenAAGkallctFhb5cSGXnAbSnSiEirBQPFDPblssK
         1w+H/eDTB1z7lMKpftUmDsnYyfkO+qCJ3i//1H998uXHpgukF0Ky7sCm304NKjBvw3gY
         rvQFNqV2pStG+GxzKaThiZUIYKwS+vnv3jYGWUdHlPKQfhKEvHjR5gluVcXYlG3ZANEB
         jGfLSTI9DRbj/mSAnT4U2BBTQfksbpumg8K01fymVeL+hv/rvU372XFErt4j2pTggkac
         ro5DdgyUWEON6qQWQ8k13gGpMB2DDzuCg0ieIBrxPPOXVjtE46gM9IjjefwJtx3tieqI
         ryow==
X-Forwarded-Encrypted: i=1; AKwUvBwHApM6x3MMPSX2AYRYeGsKkI0k0ncEL3HZvJIgqkRlY3JjOwa220PAgsNyw6t8KeNKajRh/q0w4Uk/nSw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMKcwfyDOORwWKXyJ4nXCnMcwmJkUdMVSvxwqK0P51Rj8k3jRU
	2KXsE4eGG4TKjr91ezmvUaY+3sO/8/SM7chaDv8rGXZwpudQ8w6dDwdE
X-Gm-Gg: AYBFou03tEYVFIeFqnrBXDeGgvqhZklZwQBBZm0zG2rFicW9n4IDXGmBdpWufKipbIj
	NrgC32BNoZ+5NpLn0LwjI/fwmqf1Cnt17nJMBUyPijztUDz92FEzuqrNc4jEYFz4tOj4fH9GP88
	2U/Fr0dxw5WFv772mbgruwYFkzrP1EALBmf7bS4JiHJSJrEe4VGcZ9mBAlvutDTjcgWOHZTwiMF
	f+XUnBzMbyOKIOG5CrQgdf1ct6O+Fp68XqCsOdmNB4tAu8aeG+8jYP4VNUVe9Nmc4rMFGoPnOHk
	rixNXZcXUznkHSVShzJ/74/9QGr2oRzGoQEzkXOxudizJkFOLFELFMvAZRioDlfOYkqFpKkZtLO
	nAwmhUKB3dYbC2zVjejb1YKr750b9Frm15QSTZtGAXfLxCoSeiwffFzP6bq71Jr2ZBmQb3rPGTe
	Kq/RRZik589w1rIMQL70Hl2Y3tAx1+Wa32gLmBNNrHfJrJgrceK7hlamD9W28BZc+0evdSzQo+u
	KZvr/m6
X-Received: by 2002:a05:7022:5f01:b0:144:ee1e:3758 with SMTP id a92af1059eb24-14503f06535mr2466324c88.10.1790283935346;
        Thu, 24 Sep 2026 14:05:35 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm1016034c88.1.2026.09.24.14.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:05:34 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: alexdeucher@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amdgpu: reset VI ASIC on MacBookPro14,3
Date: Thu, 24 Sep 2026 18:05:23 -0300
Message-ID: <20260924210523.13214-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_PsKKiOXPuH9c8n0u8viyg0u3rTeDnPoeDBk11MP4V_hg@mail.gmail.com>
References: <CADnq5_PsKKiOXPuH9c8n0u8viyg0u3rTeDnPoeDBk11MP4V_hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On a MacBookPro14,3 with a Radeon Pro 555 (Polaris11), the framebuffer
is at MC address 0 when amdgpu loads after a cold boot, as the firmware
leaves it (MC_VM_FB_LOCATION = 0x007f0000), while the VBIOS ASIC_Init
table places it at 0xF4_0000_0000 (0xf47ff400).  amdgpu reads the
location once, at init, so after a re-POST (S3 resume or GPU reset)
the framebuffer has moved and the driver keeps programming the old
one: the SMU is handed a table that was never written and the GPU
does not come back, which leaves the internal panel black.

Resetting the ASIC on load makes ASIC_Init run before the driver reads
the location, so the driver uses the VBIOS placement from the start and
every later re-POST puts the framebuffer back where it already is.

Add the Radeon Pro 555 used in this machine to the existing VI reset
quirk table.

Tested on a MacBookPro14,3 on 6.18.49 with the quirk table backported
(the kernel also carries unrelated local PCI and ACPI patches for this
machine).  The framebuffer is at 0x000000F400000000 after both cold and
warm boot, and the GPU survived 9 S3 cycles (lid close and rtcwake, one
of them with the lid closed for about 7.5 minutes and a USB-C disk
attached), each followed by a few minutes of 3D load; no ring timeouts
or VM faults were reported.  The reset adds about 0.23 s to amdgpu init.

Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://lore.kernel.org/all/20260924132952.25054-1-fbeltranmillalen@gmail.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
v2: new approach, as suggested by Christian and Alex: instead of
    rewriting MC_VM_FB_LOCATION after every re-POST in gmc_v8_0
    (v1, withdrawn), reset the ASIC on load through the existing
    vi_reset_quirks table.
v1: https://lore.kernel.org/all/20260924132952.25054-1-fbeltranmillalen@gmail.com/

 drivers/gpu/drm/amd/amdgpu/vi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 2cd6d7d77..a0435fd55 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -1397,6 +1397,7 @@ struct vi_reset_quirk {
 static const struct vi_reset_quirk vi_reset_quirks[] = {
 	{ 0x67ef, PCI_VENDOR_ID_APPLE, 0x0190, 0xe3 }, /* Radeon Pro 555X */
 	{ 0x67ef, PCI_VENDOR_ID_APPLE, 0x018f, 0xc2 }, /* Radeon Pro 560X */
+	{ 0x67ef, PCI_VENDOR_ID_APPLE, 0x017a, 0xc7 }, /* Radeon Pro 555 */
 };
 
 static bool vi_need_reset_on_init(struct amdgpu_device *adev)
-- 
2.55.0
