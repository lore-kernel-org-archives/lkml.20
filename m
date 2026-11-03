Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675806;
	b=a7MMnaigBWVa5MF6jzR1oyGCTPqGPgjpKmVKFIQdIgKPS/kcZxkcfbs0hxogFmVzXqKk
	 g8f4EG360U23KUrOI+dHDbQJC6cUf2mgPMA4lZQaztdwMakThHKDc8saUxQWc+M9Fw9vL
	 /db3J79I+Oo1aiKlVMvg35KtqSMw3t3fxWexyjfmWU8hFsBCCp4/tzz0bH8bYHP01nHdu
	 VQ8KbmgtGouVXjzJK3TQdaKyZY8mY7d8Fo57fmF6YrnhFYJrzkTroN5Hnho+Bip9pkk8P
	 YjasRiQ+gephhkm/ROPMw2tEoUg1bGr1Ya0IaMK4tyiT4aYbF4khVke9Str0I127qQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uOhm+s54EJ0EX2fxqNGDmYUe9ErMHJfnCFUvypWfkgk=;
	b=BK7wTwQ6QiB5roBY4FqcG3cHHjly3Qk7nCh2h5kLqMEro0/h8bvy2BImDjga+Q4Mh5xv
	 TdZHGW+mRkiT62pzSuDC/7naIF1nIkUEuXmtH+MKtGnbQZK1EE1Fzg3iATZiTgnmWFdyt
	 qUeW0btAiL2hqDWtGym8uILQvhuGT87sv1+CmUx05CypVIbQb/01aF0hLPR46I3nhfYuu
	 FxbylSV9gSYlXm9ssr0j6iNzCTkSTOo5kjLFqzlC/LNE6jT/8+JaKMBCtxwSyzZJnjL5T
	 qTl/8MGhIM0WDEP+ZrYOzBVodT+wFKR2YMynkP1bn1k8M3MSo68tx0be3tHOSw+1WGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=W4C75y+7;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D589606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D589606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=W4C75y+7
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso30832767b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793675804; x=1794280604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOhm+s54EJ0EX2fxqNGDmYUe9ErMHJfnCFUvypWfkgk=;
        b=W4C75y+7ohefS00qCWpJKduI4mNnnkU97AbFGhIMgKMPgk4DEgZfaKDD+AdHBGJrc4
         0g6+sSHI67hj3Oo94BJsoJXLvW2CUWT0XtYO13QVqX2pdax90z4CSbRR1di3uj7huBB/
         7X3OFqAObk30wOvtOB50iLakk8GYPvOwulHZmSMNlT2lrjWndo5pIKKpZ/Zk6XTx9iRP
         wxkX2UPAwlVNW6eIseWtWFm1k0e+XkztPJq0xaE8JAX2si9gog7PV8zw4r421+3wqQE6
         Y4SJSNNpk1C6MR9f8yQQIm0P3e+IS3MZ05IXoQYcWyikxUbISImzzlZ4MUjBu9ZGI2iu
         lbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675804; x=1794280604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOhm+s54EJ0EX2fxqNGDmYUe9ErMHJfnCFUvypWfkgk=;
        b=Ew/SvxJf6bHy5GNUuJ+3GROOoO07kvDsZeMzbc1AXm/PHg1kvrrQu0kC0F3bdciuAe
         3KrvepddrtCH5TuCUUd1u+UEKoQCA5iRXh79n33vypDdXVW/vz3skOWZZtZGV2RJStCA
         87r2LkPRvgkvmea/JV6uvGEG91c4URdbfFApO76iTdUpSGrWISWoll92wRcaoCniphoV
         ycKPdRlVkunl4CoSryjYCsk+RuGQ9L8TkUZpcG4QI5Sw9RChNPMc0pcOxPUp0OhWDV/q
         EtjUyjyk5UssYLQAGgR1fx0VECi8cXfL/Sx42m2rK7k/TdolZeXy7/kRtlbz/n/UKr3N
         otDw==
X-Forwarded-Encrypted: i=1; AKwUvBzLEK/ZPByC2QbG93ATPcKCIptxOpYAT/t1dEh/SOaJs+4tNCx9v7qlfRLcxQAMttoT0ICA2TOTUtOmmzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nkAPXKn8gziIyRFuTkVvRUZ8Cyw3F3RGcZSXZ3rFhdrUD1DOa
	C+Z8xiFOsjy3aFLr5O7ypZAdrPjXBeCQ//hGCN9IYZW8EISzWcOuwPS7SLxwGNRKog==
X-Gm-Gg: AYBFou1R2hDRSdgHlmlUxmKopgtjMV1YpfywJwct/FvR7e2XrqBdihOwIYZ8flJMEF9
	foqMp7yPTsIyitfUqcLLHgogtYDcgRr/2ZhSz0CPN+D11jZd94m8M7/93vzxpBy1fnyAqWPGTxL
	1Qf05hreyPTGqCar1WSZlIENB2NKF4tx/MkW3bvuHRfhP4qBHGuHlu2oPFo9MHv7u91gMGHxlh4
	VpG9fMK1c2LGDerNURfs4qwgFPRBhNhpDqLBCMNN/EIH537zCxac9XA2OZ8AqrDqLaHiDy4/Yr3
	pHc8kaDBbUqCtoCgMPuzBbSy18Cc1SxSVE9kmPbg8a+pswKE73p3D4RXmqTlON1ZRMG/4yhx2DO
	IH2hIUfrRFSlcHN2m1hyzF0LDqC5j1S3kYl31Dg8M7e81rEb2o8I9CQ6M+cJOMYildmTFl5BgIh
	WPzAkXNdMdUYwtehhJipVJUg46ZuCAFsbeSqPSTUMvvicwoGIr8n6PUrLeA2j5H/SPMmUhfEJSv
	mZtbbGEMIw17ygDC79P2rYpJVMEBJzPxQcq10EQCi6NexfoxpuoYAGpUNxN+ij3BTgoIcf4Th5a
	89uQAQslknFW++9oEGemDPDX0fHFqKTG5+McrMMvwe1U/TrNAKY=
X-Received: by 2002:a05:690c:c4e5:b0:8b0:cfe6:29db with SMTP id 00721157ae682-8b2b65945f0mr85196617b3.5.1793675804207;
        Mon, 02 Nov 2026 19:16:44 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7123febsm64624997b3.14.2026.11.02.19.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:16:43 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: x86@kernel.org
Cc: bp@alien8.de,
	mario.limonciello@amd.com,
	superm1@kernel.org,
	tzimmermann@suse.de,
	aaron.ma@canonical.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] x86/video: Preserve the default VGA fallback for legacy modes
Date: Mon,  2 Nov 2026 22:16:30 -0500
Message-ID: <20261103031630.2085194-1-hengyul@cs.unc.edu>
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
ranges for VGA text modes. These ranges are not PCI BARs, so
pci_find_resource() does not find them and the default VGA fallback is
skipped. As a result, no device is primary in VGA text mode.

On a SeaBIOS QEMU guest with bochs and VKMS, the boot VGA (bochs) loses
its DRM boot_display attribute. VKMS registers fb0 and bochs registers
fb1. VKMS is not a PCI device, so it is not primary either. With no
primary device, fbcon keeps the console on fb0 and never remaps it to
bochs. This can be checked with:

    cat /sys/class/drm/card1/boot_display
    stty -F /dev/tty1 size

Without the fix, boot_display is missing and tty1 is 48 rows by 128
columns. With it, boot_display contains 1 and tty1 is 50 rows by 160
columns. VKMS only makes the console part visible. Without VKMS, tty1
has the same size with and without the fix, but boot_display is still
missing without it.

Use resource-based selection only for linear framebuffers. Fall back to
vga_default_device() for legacy display modes, while keeping EFI and
VESA framebuffer ownership authoritative.

Fixes: 596b3678326d ("x86/video: Only fall back to vga_default_device() without screen info")
Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v2:
- Explain in the commit message why no device is primary in text mode
  and what VKMS shows (Boris, Thomas).
- Add the Reviewed-by tags. No code change.
- v1: https://lore.kernel.org/all/20261029162311.3389523-1-hengyul@cs.unc.edu/

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

