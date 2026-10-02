Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19430649C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955073; cv=none; b=liMZVmkroNkfMcweuez+njxnBcNfIpwA/APaH06iKm9hO0EdtEA03o5gUbT06e7dAiZ6ikbGH9xiduP/xEQCiHblutjYzS+Njoviow9s9btv80+UQx/mivuGgCnuo3qEDtl3PxMbkjMLeS2eGjtCxsK9t36V7uerpJcZhfD3tN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955073; c=relaxed/simple;
	bh=+3EJ110lZ8K5QuFrnTLkNe+czSGNmj6j7BhhIOSAITI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NRQf0GK4tkdhxXhgvjcg0BEfSaeW9habBjj8IgP9aBuiITyn1w8f0c5OL8bYFLI/gSl65BAj39dBiB5fdwJ5OAM1taaw1NHC3uKIna/2ZqAeM0ZHox0x4Ju7DptJxr4XI8cZUFcmayaCjQjJAvfkSNVlhGBvgMLWFL8GHO9wH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2ktLKLd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2ktLKLd"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso28395a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955072; x=1791559872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48CMMbvLuPVF+W171iKFBU8Rtnk/q+h01RLh+h+uPpE=;
        b=g2ktLKLd0wzqqlplS/vC+3N+mE2OZiv6vXYN229lxxElCmVMxHsFr3KLMq9Ja5Vnsx
         zP2aMrqBXhcZE35wCRttWFfH7NZmoXd+JuV/Lh2rK4+U4OyNbx11vmPe+aP9EuDfq2zr
         KznGI5a6DQvGMPyAhYIDzKkEIMX5DO79DQ4ZXxCSCFTeGilipfRTl/DBQDXVinqWKtMI
         vuzrDah8xDLSMzEIr9dtVGzBC0NnyR/YzkZZp0NJnHIYI95FzsRePGc/wDeXmNfcJfYX
         4mXLaF5G7MLS5RmI35TDGybANa7yX9qjilz1OJk2ywWW7YYF3PKtBeXkcxZ+f2xx2RKU
         piTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955072; x=1791559872;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48CMMbvLuPVF+W171iKFBU8Rtnk/q+h01RLh+h+uPpE=;
        b=tdThFuYYjCJZfaaWMORcQ3B8yqs7LFt05cDhh/0X1X7x3pYIYXAr5VQusrzw2bQVIE
         hccy/W24MUhV2KbW2PAL3sX/YkLS6cbC42nW/QUMv52BWYMLFlK2i0KHVunSGS2tWSmt
         XyjDmBgchgvOPKbvSE0pJ4wwnnFpm7jJ9UXaeSAx3tMGGD0hReFkQYUSbi1SjRsg9iuH
         6lXZ7dQk+wdJI6DJwHsKeU4ugTVDSN/hQvJ8xIFbbdFghKPCo+XQPbQxacukC2jN8whU
         mMsPstRHUauflv+uPL15ELic+T3+Qw3hoYMla+eZqPs89aX2rZkiCXTXq2165CBes651
         PdzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQHOqW/TVbzGIIP8yH8eJSClz+p4Sb9aMTPDr8X2sS1Be1DCIY3ADBvsewDXsOpQv5f3Z2LyhzEtgG4yI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNTW+nnoep77KoQ208GtKDNcJ2nyAYeDWZL9mtog0keUcv22Aa
	ndwWYBzlVUKrYyP1swV+dbKMI1/Kg3TfhBQNjGoJKUGO1dESwIbIUNV8
X-Gm-Gg: AYBFou2VPLj8alViDI0jNEwM1N7wxbTGWg3NnPmuNMli56eU06EB4Cjw0Rx/MlNAger
	+LuP+j10FzJ7CcvpFoVymFvMo1ZTgV1MLNCg08nSi3UC3YGK7fNc+XkcHX4ct52E9WfkCNRKtKL
	47ZpUR/5/dAzNVE/T4lbIGnH6S7+7Nki+HN2oHqDXsUX2KvybvTVoOybRBjkIgdopfe33NNo15Q
	fv5hquHdr9t5JP87cVXnUelHPC6l0FPA4Jf0VhRa7GuSqSuPL28lhj6Q1fKQxjJqM5apDMHnt/3
	Ak70bfvS8BVZBjvB97Mrp/CG0j5K8phE0S7Sx66BZLBIddXEMmgadH4aL5z+dIpjjvZscchYUy3
	mPylfT+SN+9y37wvX3MkuPbc9b3iSsfozBeDqU6zBak/K7HGsAW6xIjmlpp6eMZQ0QAwJ8tT2VJ
	mBnGuf0fJZz+j/dGeAPwJYa1b31AagNjdT55AteTQ9CmPDfu2rlWR2wqL7gDNV2EWh89kOVaUHe
	ZrFS29Uqxc=
X-Received: by 2002:a17:90b:4a92:b0:3a4:8e0d:3948 with SMTP id 98e67ed59e1d1-3a6ce7526cemr1483901a91.25.1790955071495;
        Fri, 02 Oct 2026 08:31:11 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6fc716b5esm1649468a91.14.2026.10.02.08.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:31:11 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v7 0/5] vdso: Keep the CLOCK_AUX base at full precision
Date: Fri,  2 Oct 2026 23:30:58 +0800
Message-ID: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v6 still broke the m68k build.  I had read the individual 0-day mails for
the BITS_PER_TYPE failure and stopped there, instead of the
"[tip:timers:vdso] BUILD REGRESSION ca46a07c4b68" summary, which lists
both failures and was out 37 minutes before I posted v6.  Sorry.

The remaining one is patch 1: OPTIMIZER_HIDE_VAR() lives in
linux/compiler.h and vdso/math64.h did not include it.  vdso/math64.h is
reached from linux/math64.h, whose includes are linux/types.h,
linux/math.h, asm/div64.h and vdso/math64.h; none of them guarantees
linux/compiler.h.  x86 happens to get it through
asm/div64.h -> linux/log2.h; m68k's asm/div64.h only pulls in
asm-generic/div64.h and linux/types.h, so the macro is undeclared and
-Werror=implicit-function-declaration kills the build.  Patch 1 now
includes linux/compiler.h.

Changes since v6:

 - Patch 1: include linux/compiler.h, with the robot tags
   (Thomas Weissschuh, kernel test robot)
 - Patch 4: picked up Thomas' Reviewed-by
 - No other change

Reproduced on m68k defconfig by compiling a translation unit that includes
linux/stat.h: two errors at vdso/math64.h without the include, none with
it.  Built every commit in order under the same check, all clean.  x86-64
kernel + lib + vDSO, arm64 vDSO and powerpc vDSO build clean,
tools/perf/check-headers.sh is quiet, and checkpatch --strict reports
0/0/0 on all five.

vdso/math64.h is not tracked by check-headers.sh, so unlike patch 4 this
one needs no tools-side sync.

v6: https://patch.msgid.link/20260930154500.722828-1-zhanxusheng@xiaomi.com

Zhan Xusheng (5):
  vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
  vdso/math64: Add and use __iter_div64_u64_rem()
  vdso/vsyscall: Keep the CLOCK_AUX base scaled
  vdso: Move BITS_PER_BYTE and BITS_PER_TYPE() to vdso/bits.h
  vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask

 include/linux/bits.h       |  2 --
 include/vdso/bits.h        |  2 ++
 include/vdso/math64.h      | 33 ++++++++++++++++++++++++++++-----
 kernel/time/vsyscall.c     | 26 ++++++++++----------------
 lib/vdso/gettimeofday.c    |  2 ++
 tools/include/linux/bits.h |  2 --
 tools/include/vdso/bits.h  |  2 ++
 7 files changed, 44 insertions(+), 25 deletions(-)


base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.43.0

