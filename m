Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290999;
	b=jFensdmmwVpRee6U8befiuP0xorAjbhM04okeGsTUT/MC9XDK/wxv0lTrbzVqoRZI3DN
	 lbVYDxIEjjfF9Abpw+F5N3+egB3BZRghSNYFrqifT5kOGCj0BaLI3RXUOz+7R6Wn2jyb/
	 E93BJnu1yv1edc/aDRDjJje2ea/hqwnEV4KD36rlXE5aQEOlmOL/AL+EG70Qim2R1a7zr
	 1aCQojvUAldECIR437nFOKOLhf/wJbPbq2qubxldesYKVI/VbZpXwxzhohVv8Tz+87/T4
	 EcQJXXDTRtlR0hPK1M/naFFi/3swm9JULNdkmK4/xljZCllQLusXVXygXz+HHMnHPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pmMAA3zxsaH8NpSbi674z9mZNWB0uLuDo+2Mdyd35Hs=;
	b=XsSj1YNK1f/rVcCWxaFHw+ui4pIyKybZuD9NqW6bxI8wQljDQdAl/KeFTMFUheVhVt6Z
	 AfIhUqnbRLOJEJCXXMa7sd+vfUePRDjv4Qdi0cGsJD83b6nHd37ILiz7UKxV9ISAyBhSi
	 QcPFP2LbgUMT1lBj/FvzELuuZ64mUXe5tI0fV1q8xjGdd0VC9wyXNdVs6nnuhzRGj7CdK
	 40hmILg1RhiVQo6KIK9XzL/JN3HTYnKLh/ktlkW5x8T2j+Evdv4NcPtBtgAh7lYZ1DVez
	 9qDmoF7a4B1s0jQwYE2hCWPZL2vJCMiUsvd5lzXUZ5OZPGi6/L20Fyksm8BVQXdQ93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Hb5sagTj;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA83606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA83606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Hb5sagTj
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93cbc3ab2fdso114827085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793290997; x=1793895797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmMAA3zxsaH8NpSbi674z9mZNWB0uLuDo+2Mdyd35Hs=;
        b=Hb5sagTjqXkLketPYMPvOpYFJMOblRr6tth450tgZUXXuCu8KLf5Roys/m08GkUz8E
         AG9xaup3ufOGFVmZodGRWzQ6d0CPXX/M2CROqkyxXDpP5N3vOctOIsZoJQGTd54l37pz
         h2A/fzILqsp7gWqKF+zJjWmJIhMPcul0Yzu4LbmTcebWlQLL3iYI9Ao0IxpGfv2Vtzqc
         owssKPbpAkNZ/uYs/HzHuvlrI1Vkc7MyjoQtgXFNefwfy1hEgdnph2100QkhDhZt+qts
         9g+FEtnambYFjI4WtTzTyMw3qbUbvADRFXqEmNEH7fozfoORGG6aWSa3G4h84KsJ/DMh
         q7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290997; x=1793895797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmMAA3zxsaH8NpSbi674z9mZNWB0uLuDo+2Mdyd35Hs=;
        b=YJoxeYRN6ZrZXq7VKWqKCiofd4zutdY5iyKAB5Cs38rJy7wo3jzvWDbHZ1FgJUlukP
         AF85Wz4SM+fOCsyuwc377G9op52qAi/qiKqfZCtqUcAyRi5cFv2VPld/ko9CYsgClVQA
         ZbuxlJCHf6Sp0Z+N4P32iOs8kxaCPIK9kPLvljf4wrSLzCGPEdYZ0waMeSoBA0R5J5PT
         c1kQPiXx5hey0/g4+BFrNAwO7mYIlQOQ2v5XOFJjrYe/hWax1mWhrM+lR/8B3Vrcfa+q
         VFBkx1nYOfmUnaNqL0JEd52smRW0SAk+Sm3gB2DjUnJXCV63XGlsTSu7a6RwYiLdjPqa
         lp8g==
X-Forwarded-Encrypted: i=1; AKwUvBxoOj3GKYQbCMXwsv1eYPwYglsGLtLZ+JqgB+gETOYxXenui2f/FNchWfVXSyTA5siwc3I33UDj2UDuAWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVTvxZ2+EgyCWHlmYAvh/XW8cmMmItGxq9teHZaa23Nby2qKV6
	7RXoQADLsW9YTmgsyLIik63KKeBJ8kxo0+DpM7CpcURMEJ+XllHP8PzeDumyKR8s6g==
X-Gm-Gg: AYBFou0ajNnF8Cr+iiNW2PrjJC1t8ZCpF1bgM7KWNNGewDnhBhpxj2+FfM0NIFq0Xa/
	cI2YYN9gPfQxljT/WW/ggepQ5uEoqWaX2kBbBigLBeVyGeyHt104VsjRJvGtyVmsLeDUJ9okdBL
	apHkPCabHuoibRWBJr36I623IQ3u9Iljpf/EAFgNdjSmfN8mpdJcsVZCfPnzsOdmGFSl8nUb/xe
	jkMIkL1dnffUvBmrrmMaXkC2ocQCn87JE0qFkErRWPuxf4YrZ2A1GHrullaOZ1Ij5WeSW4W0kZT
	alCFEXFJSRz2C1xbzM1sU2MSagyD6ay6OBYtQpsqDAJz2uup1Uddfo40I9R86kkcUddGw/+pkkx
	m6XCk+8MUkeVca1Fg4A5d0vYkLv17RMEPJR5CK5Ejj3kLWY9YiwUL+X6Hq4HnXVhCGjbeYMCCaY
	+rlpusuZpQwdG5HOxmuvecX83cUVK9r8Te7NWavx0Nbc+0d7nvdtMnD7u0pNDvVnDMnSsTGBkuO
	hI5xmZ8gvYPu9FmttT0MELx4WhQwOgi9srAAGSMnAd3SJHWUyRunR2xgbSaeEa2lk+IPMYBvzyh
	hBgI2vAoGlCpEw+cx6ykI23Yosx/cHfnpEHokPwBBzcmL0tJj8aZ
X-Received: by 2002:a05:620a:1a10:b0:93a:9ef5:d370 with SMTP id af79cd13be357-9440893885amr892995885a.1.1793290997148;
        Thu, 29 Oct 2026 09:23:17 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a771c9sm1565150285a.34.2026.10.29.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:23:16 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: x86@kernel.org
Cc: mario.limonciello@amd.com,
	tzimmermann@suse.de,
	aaron.ma@canonical.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] x86/video: Preserve the default VGA fallback for legacy modes
Date: Thu, 29 Oct 2026 12:23:11 -0400
Message-ID: <20261029162311.3389523-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 596b3678326d ("x86/video: Only fall back to vga_default_device()
without screen info") made video_is_primary_device() rely exclusively
on screen_info resources whenever any are available.

However, screen_info_resources() also returns legacy I/O and memory
ranges for VGA text modes. These ranges are not PCI BARs, so the resource
lookup fails and the default VGA fallback is skipped.

On a SeaBIOS QEMU guest with bochs and VKMS, the boot VGA loses its DRM
boot_display attribute and fbcon leaves the console on VKMS. This can
be checked with:

    cat /sys/class/drm/card1/boot_display
    stty -F /dev/tty1 size

Without the fix, boot_display is missing and tty1 is 48 rows by 128
columns. With it, boot_display contains 1 and tty1 is 50 rows by 160
columns.

Use resource-based selection only for linear framebuffers. Fall back to
vga_default_device() for legacy display modes, while keeping EFI and
VESA framebuffer ownership authoritative.

Fixes: 596b3678326d ("x86/video: Only fall back to vga_default_device() without screen info")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested in QEMU/KVM with identical KASAN configs: SeaBIOS VGA text mode
(with and without VKMS), VESA, and OVMF with one and two virtual GPUs.
All 26 guest-only helper checks pass, including EFI/VESA framebuffer
ownership, missing framebuffer resources, and addresses above 4 GiB.
Also build-tested x86-32 with/without CONFIG_SCREEN_INFO, and x86-64
without CONFIG_SCREEN_INFO.

 arch/x86/video/video-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
index 8ed82fff7638..b8f83346dfe8 100644
--- a/arch/x86/video/video-common.c
+++ b/arch/x86/video/video-common.c
@@ -45,7 +45,7 @@ bool video_is_primary_device(struct device *dev)
 
 #ifdef CONFIG_SCREEN_INFO
 	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
-	if (numres > 0) {
+	if (numres > 0 && __screen_info_has_lfb(screen_info_video_type(si))) {
 		for (i = 0; i < numres; ++i) {
 			if (!(res[i].flags & IORESOURCE_MEM))
 				continue;

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0

