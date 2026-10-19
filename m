Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27393385A7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375104; cv=none; b=gzjchGBLSji9fI/E8/iL9yOdHBipcrabM6B95modiIYR9Vjnunx9zLBLFKT6HN6D0e9HGCrjKDT3pVaVvEzd5xrllYnrzoOEyp42EvCcAEorIA31jXZcfQtXE8SVRPUkglNa+biLJvrgdTM2y8Y6fw/FXERFcukr/1ATdwUc3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375104; c=relaxed/simple;
	bh=IvgpY5vdVqEpCEAsZKzoB7BbMpzUVF8+3uNWD1OUHNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iCZ8o8u8uNk3HTbg2SY84n2h++ieMWyl6Yj28RlSZLWgn1HV9x0RCy8EcGScluBG9zsaSG1WpIqSN2PKetFGNUSHVGQpetGOmk8ZisrIfZNc5HuGx6izhYtP7+vORGy4qr7pzlVUJKfOfgaiVVAqqp6t3b6S9b7cMpNWd06vayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cndT/ivD; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cndT/ivD"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550c917fd3so1844209eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375101; x=1792979901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=;
        b=cndT/ivDicq5kDK3cPUhETpzYzGDIDiSeFFuKde5Q97EeoxUYr2TTWIRJ1cRzieW7o
         tO5tatlKgakdZrxY4q7zVjPH5LYdTyH2tefyLiQWQXRC3xW9ZuauFq+goFKdQa7HwxoQ
         J+lqPjAEbtSfaS6ofD9Cnok7iY2/yhvmeYCDteshy0zrv7347A0yMmO/5gzWT4AHFB2a
         uNZxX3EOI3aSjnTNSqK9bHxMbw4PsnLG7qfntKUxZJO2I6fDCLr/vCY+jlLAgb+cgihh
         4baB9B9uithiQUZqHU366ycEoW90URbZfhoGoleIZYKNmMV9a+KssQeTHISo9VVZAq/o
         f1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375101; x=1792979901;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=;
        b=zA5BCZLAwb3cRe+OwU9pau3mSowLiehu5NCtdqBcphMuxVA4gG/mpwBpqiZaTqJwLY
         mtLuIgqkUDSygxhDj2ILwNSAxSqETHUTRfneUgegjt/IcCgrE6IZRv3OGDnLdNMESnpf
         ee9yeZO6/+gTMegbebEJ8qzFA5BLhjtDOulvy75gU7iimv31slO1rq3Q/Yrtm2pOdLHS
         8HJ2gqzW9NE4gJYSFdsmcMzyOBA/rsT3N1CkFUKODuriAEmasLlAb3DP0ec7otvwsgtU
         fXd9tBO6JP5z9D8FY1TADpym6hP8Q5Wp0ipOaDxEuVaitxvBUw40c4Sw53KGTh03WrgJ
         CFbg==
X-Forwarded-Encrypted: i=1; AKwUvBwBwYITu21wOUZYl1jvjGNcMjh+/q/hEFYYYBkzFGmOHiVXQGSxf5fRHD/dccjzBakTlO51rcKAh4LcFkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRdARiVmBQnRwRlcls8Wpbxe0IeKQsqvA9hnu/LLIw6DBMICKw
	ITFs74/AixeeeK2nJ5f//6ztMoD6gQVXhqHfRVV1O/QzM7FbTJY5A+ub
X-Gm-Gg: AYBFou0m5/gFAZ9MkXgEIW+3hhFpUDYOY3UZex8By0rEwGXo2/ZYIBOMTgVsbyF7gY6
	cSJ+awIVBp6wM0d0uevy1kTzryEXHxcKlsUGKG6pt0Ke4QHbXWMol0qPZyZ12WkEzZZBPgG4CYl
	6sv/JoQTL8KyEwu9LuDz3xM537jhLzJF1fTKGZGwR5wkBhMGEY26O95h38X6gdzdkevmKA3/vQC
	7V9hEIb+wpeRhGStYmS3CUgI/nEJ2pyZS/m7y9NB02JpecduG/94qqiZG8VT3WscCcj/w4BiI+F
	77ZoF3c5oYDxcRbeYPQJ+Bqm98jEub2X9g/ZVatJbkkrsc1n0j0UW5dkwZDZjjf3IMFvgpm7guF
	DfMN5BWZA0VUsKFCi4IWuwcgEjyT0Cyfoul9V4jFu0TXRJr7/Rq4WcVdOE9pkokpBkhW6fsboZD
	Y0GzW2IvJ42w52m9ep8iJL9TZIN7fPz39U2ho/4TW4muXDcIT41KWixCRlL+L0Bxw3p8Q=
X-Received: by 2002:a05:7022:150e:b0:141:b2c3:d84e with SMTP id a92af1059eb24-185120a8bb4mr10990864c88.11.1792375100720;
        Sun, 18 Oct 2026 18:58:20 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:19 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] word-at-a-time: let KASAN see load_unaligned_zeropad()
Date: Mon, 19 Oct 2026 09:58:08 +0800
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADB51WoC/x3NwQqDMAyA4VeRnBdoiwT0VcYOmY0aZK2kTsfEd
 1/Z8bv8/wlFTKVA35xgsmvRnCr8rYFh5jQJaqyG4AJ55zt8vic8skXkDRk3fQl+xfLKERcunJD
 H0JJriUQIamY1GfXzX9wf1/UDDOF2FXIAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0

load_unaligned_zeropad() is inline assembly, so KASAN and KCSAN never
see the word loads that sized_strscpy(), the dcache name compare, path
name hashing and x86 csum_partial() do through it. While reviewing a
strscpy() KASAN fix, Peter Collingbourne suggested checking the first
byte inside load_unaligned_zeropad() itself, as read_word_at_a_time()
does [1].

Patch 1 adds that check on the six architectures that implement
load_unaligned_zeropad(). Patch 2 adds a KASAN KUnit case for it.

This is independent of the strscpy() fix, which makes sized_strscpy()
copy byte by byte under software KASAN so that every byte it reads is
checked. Either can be applied without the other.

[1] https://lore.kernel.org/r/CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      word-at-a-time: check the first byte in load_unaligned_zeropad()
      kasan/test: cover load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h              |  7 +++++++
 arch/arm64/include/asm/word-at-a-time.h            |  7 +++++++
 arch/powerpc/include/asm/word-at-a-time.h          |  6 ++++++
 arch/riscv/include/asm/word-at-a-time.h            |  6 ++++++
 arch/s390/include/asm/word-at-a-time.h             |  6 ++++++
 arch/x86/include/asm/word-at-a-time.h              |  6 ++++++
 mm/kasan/kasan_test_c.c                            | 24 ++++++++++++++++++++++
 .../powerpc/primitives/linux/kasan-checks.h        |  3 +++
 .../powerpc/primitives/linux/kcsan-checks.h        |  3 +++
 9 files changed, 68 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-bug-word-at-a-time-zeropad-kasan-af2460466ee6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

