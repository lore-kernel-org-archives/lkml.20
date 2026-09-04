Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A023B3880
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510481; cv=none; b=MuZesIytps+o3mWcoO5B1PkCHv1rXVD48OPe41WD6zPz/Wg3JjweuebD57sEZLOMmliCRNtdzfRqoxcosKYUoZrWndX9DnHzMnm+4fvg4Yezlz9e7FjROGT6ZKU466FeDRtacm5Ch5ahxxpf/FeKEzj6xoEt5eKa93mFQr1W218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510481; c=relaxed/simple;
	bh=LPYJih7BBnTwydWT+XbQeSCvryKdl3G19OWtCY8B3Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ar0tZfmLYdchjwQCmS40k1xPztFIGshExh7bHxS1MiZ3iNmVDFkoOaq0ctEXZTJBJgI4FCqMF4lbJTRbbT/ftP76VTGFc5P9YJEFY5ITfGGCMTSI54RD6PRnsyy1wzKRmoLMJtOyaxVD1eueJW2Dn+0ssgmdgPXZdNjgWytLT6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/yOS8Yr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/yOS8Yr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441fa5c37so455972f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788510476; x=1789115276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfMprsUOvbSseR640P9IxI1eH8bfahQEz15OK+/WicI=;
        b=f/yOS8YrqaD9mBYk5n/NG1rVFtOBNkOZle4ES0IUdCHiiLgfXrdAcA9oZpZAlfoVzs
         qX6WuXzhLBMYvk8vV0y9LWpycCVJmeFJ1ICRBZOAZEp0aLGpfzuXPDr3bHM+031M2TNo
         kZcqyaRFTW/fz4abNap7LgC3wRNLNX6ze+s68cW0WMW9FulZRkIjBPzdx37Y8VKlIH2Y
         v+W/hAnfxwexKzrzuLyoQuzTkRvOLW05GeJjz4sIHPtxMRIJthSi3+ULzolBtK4IRP+b
         8BfokQNUMJnkmtStgGGU5rU1EWRvdCsjYC6KHwartVmNi//hn9oeD/T6ETePYsNEKg2Y
         dCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510476; x=1789115276;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfMprsUOvbSseR640P9IxI1eH8bfahQEz15OK+/WicI=;
        b=ov18xDF6Ay+zIbH3DnBWIRTCW08h/dDg7U3G43pdbHGCIkiD+3psGalWH2CrdSOtvv
         Z9HzzQq1LiUF7Hdp4+enhoPJ50LJ12Dk4i6j9feyNndNBvHZuXbAuIPQX/vc+kATATXj
         /e7K/KFuWzLB2ptGkktyPayjMh7zeQzILDmDBpDEznP68R0Ko+i0yKKcYa+m18ohhauS
         7HZELsesBaA5fzy/7N4ToiZqQL61vOIKMo07U73YdJ6fTGBAk+LvQkr5UeNiRd2nuluc
         bSN4hXwlf52uALzRSwmjI7qjXf29r5C1wEYfOuReDUwjmSjgJ0UXrXdnUeEm1Zdc4Eyg
         C0Gg==
X-Forwarded-Encrypted: i=1; AKwUvBziXSPJQNnKe9/HpyDaJZCzUOmXk5MfaQ/+OGUfGeCEQNnenL0FYLu6IoIYOiKiVmPTaz0E/AgZCIMQj5I=@vger.kernel.org
X-Gm-Message-State: AFuF++mHLAN0FW6FxqOTGstSNvbujwdto/6e9k4Kar5m5zrRexkMRyjh
	bzmVyQ+zbGMF0q5Abk5pFFkLaWWpBIrp8FBnM6YrI1bLacAbgixUHJU9
X-Gm-Gg: AYBFou2wUu8IEenQQGt7rzgbK58Q2PZ+6kSwg1q2S8KAxuwdoqCIgkLLoNWb6k2xBqZ
	4K6dyplnV5R/N1fAJdeGyIU0rriSD86dw18DDGXzMK47xcpEGuo/PiPNfdlqLugYKFwlRteocPM
	Y0Bq0qSuXAQp4Rw/mJz6WEx+p2t2hbMNn7TNAa/b7do82NW2KLBVpWAarRYjCAtM9l4c+oR0nr7
	b5RMGCaCtodOp7vUSN1xD1kYLCJS86gvWxlCWKRqZHcpnSfo3WnAGtYlPLPoxTiOPZhwTmt5Wlu
	OA0wFUujcyKIO1fD/3Nog10YicKM7+IEm1NIkKEvuGe68cI6IGLznqQsjpDZMSRaA7oT4upVTVm
	MX8s4Qw5cFP1Ew7HDa7fu6P2uOJLMW9cFQ0P5045ZLHdhBPbfWuBb/IFBdWNyUTqF3JVmAJyW7X
	AzW4WCoXaQ5Xer+vgLC3uRxKLfhDwDwxpf33x38d9xHWZsI/czraeGOyUz2fbVdh9Ob4sfwfYaT
	1+gI9JButmfD5DB94JIvDThmFN8OLwhI2rkX3gcA711I7IVSBkcm3rAtvaJKCltYBUfWg==
X-Received: by 2002:a5d:5d09:0:b0:485:8a46:b3cb with SMTP id ffacd0b85a97d-4858a46b609mr3032915f8f.51.1788510475916;
        Fri, 04 Sep 2026 01:27:55 -0700 (PDT)
Received: from fedora ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm4556228f8f.37.2026.09.04.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:27:55 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 0/2] Remove obsolete RELOC_HIDE() macro from compiler-gcc.h
Date: Fri,  4 Sep 2026 10:25:21 +0200
Message-ID: <20260904082741.578048-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GCC specific macro was historically used to workaround very old
compiler bugs (including pre-4.1 ppc64 GCC). These compilers are long
obsolete.

The generic RELOC_HIDE() macro should be used instead.

The removal causes GCC to detect several reads from addresses below 4kB in
the boot and realmode code. GCC treats absolute addresses smaller than the
min-pagesize param (which defaults to 4kB) in the generic address space
as presumed results of pointer arithmetics from NULL. For example, the
following code, when compiled with -O2 -Warray-bounds (included in -Wall):

  int foo (void) { return *(int *)0x123; }

will emit a rather cryptic warning:

warning: array subscript 0 is outside array bounds of ‘int[0]’ [-Warray-bounds=]
    1 | int foo (void) { return *(int *)0x123; }
      |                         ^~~~~~~~~~~~~
cc1: note: source object is likely at address zero

The early boot environment does not guarantee a minimum page size, so
explicitly setting the minimum page size to zero by adding
--param=min-pagesize=0 to the compiler flags when building the x86
boot and realmode code with GCC inhibits warnings for addresses below 4kB.

A long-term solution is to replace open-coded inline assembly used for
FS/GS memory accesses in arch/x86/boot/ with segment-qualified pointer
dereferences [1]. The compiler allows pointer arithmetic from NULL in
__seg_fs and __seg_gs named address spaces so the --param=min-pagesize=0
parameter is no longer needed.

The v1 patch is available at [2]. v2 leaves the conversion to the __seg_fs
and __seg_gs named address space to follow-up x86 boot code
cleanup patches [1].

[1] https://lore.kernel.org/lkml/20260120195407.1163051-1-hpa@zytor.com/
[2] https://lore.kernel.org/lkml/20251223202038.91200-1-ubizjak@gmail.com/

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>

Uros Bizjak (2):
  x86/boot: Disable GCC min-pagesize assumption in boot code
  compiler-gcc: Remove obsolete RELOC_HIDE() macro

 arch/x86/boot/Makefile        |  3 +++
 arch/x86/realmode/rm/Makefile |  3 +++
 include/linux/compiler-gcc.h  | 25 -------------------------
 include/linux/compiler.h      |  8 ++++++++
 4 files changed, 14 insertions(+), 25 deletions(-)

-- 
2.55.0

