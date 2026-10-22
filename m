Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663342;
	b=cZt7LUbGp3SUC/ZKMN8+Jn92bWk9pdmbQ1hYzQdTZ+aR5QzS7dqQU1/iQ1WyHHL2EIYh
	 4J/PVpI20zbSTTHZg8HDWhRIj4KSr3NGQpgusNFN5Qe71JhrKIM+Cb8QHozT4wGSr6pWB
	 EmTbEb/9OJnfa15VQoFDcDBeRTLL66cEtMMsE/sG5E2taWvUUPMjQol2xvjfBJMqgE5wZ
	 3cgS2oUOtbwdyhpsp/efJFYyeFk5hu5N+ZJopziSp0CYCp3m7VckF/QbbLfJso+raBjQ5
	 35CtQjiNawn4BnCZ3Z0IFjU3EkMYTaq+cizYd+CoWnCKLfr3cDDTlkKJzqzxc0xy/MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UV+/ZRWPXj5zR9R7iNbWuT2HN4DRi1qwj4JLYShBPJQ=;
	b=Qzmx3Af//puQwpAMfhFx48Mr/PCjZ2KTGEWOAIzpxw68HNWlDmJhg3GYeW4+vM2vv2uy
	 0r/xviuyadNQaBGdtiSWBE9PZUhx5rznDzYAWQxIcRQ62mumrGagB957EXpRtRBbmpQmv
	 tQAENp7AzG5BUIgWiBmuiRfNR3PkUHnAaeVeFCWlZ5F90fRcTimUi1T67Jij5XiF5T0Tr
	 pQjRaccSQtWLxd/jcQICGP6HCMp2CSx4WCykWocVVgAmy8L3tcXTvGp5LHus46dCRHmjf
	 7zuzhS6P/HAY3HBFNZCMwDc6Lkzu7km/bP3qLw4Pux663X2oPYkoHW1JRdvcPy+ATZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=v7JBj9En;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E0606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=v7JBj9En
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso419558a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792663342; x=1793268142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UV+/ZRWPXj5zR9R7iNbWuT2HN4DRi1qwj4JLYShBPJQ=;
        b=v7JBj9En9corg9JMqvldew0g1TqTCr9QMVtHlvvmfIGL84VmjslOqirYe6wfuvnLgh
         Ee1SMADjjpmS+4Zn1MEy8j+Ao43psUbjZlEs68dp/AvIwQNdJVbxcHClkjbaKKEm13ss
         oE4NaMn0WUc3KOodboBrBbM9odmg6I27NSOAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663342; x=1793268142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV+/ZRWPXj5zR9R7iNbWuT2HN4DRi1qwj4JLYShBPJQ=;
        b=LSP24wrSet3iYSwijNevNO1BQE+mPUHX6eAgG+hN7sa/AtJZFgQk8+HHLjr+9zTGjh
         57leebECez04Cf4W952UKlqEURLN3WpmiKQ/yQRAOnIFgqfSvoQ2FQ98IAMI61pr+HiT
         DnAGzXkkFluHWPLJ4+lg/KWqC/uucWpvDPqxRpbEZ2eBa/ErhtZV63F0GSOk75q/+bON
         04BIiHeAkxVweWADGbpSOhF2VxyNi8+XqCDxEEggtw4+oT76ZopKrPs4+X2FMSDDgNCy
         XwCYvDgRPtTlHnwKSYdHepvaql96HMaiY+txgWp1PJJFa8uPli/Jcmi0LiL70kBWvXuy
         j9dw==
X-Gm-Message-State: AFq9FYK6v3E/mDjHSZwHcK/qHNtdNvD5CeWEOTvuG86zoBxQEO9xwAA1
	64JXJp1SD3ZDuf8x0M9YuaCmxn8dFJ9cIKcq8E2L+BE7lrF9nt4VYK/76abmOzHa2S8=
X-Gm-Gg: AYBFou0ZIilDx+BZwZO1kudlOEo5lstQ9lUbR25ivb1+OlO/F0lO4EAQzQ4n5TVCjuS
	4r3Ylm4UQ6EN1T7V6zDCj6nFWzv0TIFqvMkX5SLlx+CcSBKP7JZ1JklxfHu5DDJQLLE3Mu6BHAk
	W6Km0cd0sQbqBOU2V6VXd68xQU3Ei9qL7sbNeM570hAVaiZ/6BLSDyyeJm6qUkgsEcLYckqEXUA
	tKWQSr4tfkJipX7HaCx9iVs5xqMLg7ogxcKDe6q69Q5W16iaxbK7yQTwdLVhI4s4mrb6m3Eo+wZ
	ZFH9UVMhjtB16QCBrRQHjFTbwxhnaBnJIKlcTECAc09J/3XodhdY1rHxifDCIZYe0VWwWWQQzOY
	rKUbNeuYnG37ZgbFw4sRCIRljxY8ef6ks54LoFlqMb2vN9i0ORrtsqA8N6DmZO83EOXbJruiE9d
	57QlMG50PPhfAVGz8E+HTNhJYiX2CeT3w6DINwFLxUhh2t8BCZSEClNXa56V+TTWjh+Bn7gU5SF
	Sdhnh95CHZ0tdHljy68cufkh4RgtSLApusZElMC+CP1mIEnV8Jfyhy5+t1WgG6rwK8DGujajICY
	dAkMqy/8D40spoIEVd+/yA==
X-Received: by 2002:a17:90b:514d:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ad86ce7ca2mr4173183a91.29.1792663341710;
        Thu, 22 Oct 2026 03:02:21 -0700 (PDT)
Received: from shiro (p1722188-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.142.188])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ad85f856fcsm3971440a91.2.2026.10.22.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:02:21 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] tools/nolibc: sh: enter _start_c with jsr instead of bsr
Date: Thu, 22 Oct 2026 19:01:59 +0900
Message-ID: <20261022100159.525910-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

bsr has limited displacement and cannot reach _start_c if its
more than +/-4KiB away.

This starts to show up if you have big programs (static binary
of the game Quake in my case) and/or use LTO and things get moved
around.

Replace bsr with a calculation of the effective address of
_start_c and jsr.

Tested on QEMU and real SH4 and SH4a machines.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

I'm no SuperH asm expert but this works for me. :)
Maybe there is a way in C to get _start and _start_c to always
be close together that would avoid this entirely?

 tools/include/nolibc/arch-sh.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/arch-sh.h b/tools/include/nolibc/arch-sh.h
index 996cfbe1bee3..7318f52dcba9 100644
--- a/tools/include/nolibc/arch-sh.h
+++ b/tools/include/nolibc/arch-sh.h
@@ -154,8 +154,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 		"_start:\n"
 
 		"mov sp, r4\n"               /* save argc pointer to r4, as arg1 of _start_c */
-		"bsr _start_c\n"             /* transfer to c runtime                        */
+		"mova 1f, r0\n"              /* load the effective address of 1: into r0     */
+		"mov.l @r0, r1\n"            /* load the distance to _start_c from 1:        */
+		"add r0, r1\n"               /* calculate address of _start_c                */
+		"jsr @r1\n"                  /* transfer to c runtime                        */
 		"nop\n"                      /* delay slot                                   */
+		".balign 4\n"
+		"1: .long _start_c - 1b\n"   /* Distance from here to _start_c               */
 
 		".size _start, .-_start\n"
 	);
-- 
2.55.0

