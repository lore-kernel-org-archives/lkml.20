Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8B355F47
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167185; cv=none; b=ijGdx1VMOwNz98IH5ukhjHbjFznELocCrTpgR9+k9GxKctkOZ1PdxbrcC/8QYi7lpA6r2x7YqVQl6SjP3wTidAq56NnjjQUR3CYC5+xV5akP5MVgMQLJMK2XYMAOoAn1aGpouGt/EpdeYQ/WbpktWYdmSJeIdFlZUr7MnZQ20Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167185; c=relaxed/simple;
	bh=YidEQowooWHa3mm+kpWQyPIQRH2lWXzKIXAARyNbJ44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LejDV725/Walqmyy268Z2HBdxTBX4CSPX4i0PEmlotpdhd1VT7aXehZ0bJTbOzT8C82x2nu6xTafiqMPDGeMuwGwuwkK0ywp2eJK8kWl9Ldl5QBYDQMVl2qnZv2pR56mDXzF6U0cQbYN02x44kUC+LdCaUCu3bQ2/k4L6DtrpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=lzWNw41D; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="lzWNw41D"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so5248865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1790167181; x=1790771981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMau+1eDaLmwPgFmVMPFBVSRhhy4HyZpMjQg3C90W5Q=;
        b=lzWNw41D08BtcV3JpjQs2OgVaF8eRPqeML1Vb0qhE5tzVdjRHLL0Bdf8HiIo/6xjfD
         yXqul1x6NP04kTRZjP6DFGxImRSUvzbSmoNnOOzs3JY0Gn7ZPnyZIMtMi/GJYP7rxuS/
         uXgJR2wtsSTxMFSkhNq7Ej71qIsoVoevPGUgMxZewg4c4su5fg3kJwYm5kQGTyH9CYfX
         +m6+4bRbk7pKBeEQuc94Wrk43Gd0+cpdjlo6U/qo96nrLeK8Onxj1ilV2lmTk43dDYoG
         O0A9ZUjKKioN24NQHkJvfO8GH90WIzn+PfngbeMseq8Lepwo4ZD0gAFINZ7QfK2j3yt9
         sApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167181; x=1790771981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMau+1eDaLmwPgFmVMPFBVSRhhy4HyZpMjQg3C90W5Q=;
        b=O4MD3TQLPfCgIo0MITWwnDTOdQSdssVuOQi50LL0m/9UAhF1VajTOvERNEajIZozGZ
         2BG2n7KHzxsR3Yv9s52WFntDGoWwN2UCSfcNXmlzv54/A1UJDNz2JDDjo8EgbCmPqskI
         PApwZeKX0PNIAYMoXnvNAteNbfm3CpY/Q9xr07LSleMPnYu8Hc06acTunuww37GS/n2L
         D4DEyZRYO46+l1xNXyMNVn+ngleP1NEU9PEy/GXCsBlTH3SKMsdZER2OCr+/G3YlgJiK
         1X/cxL6CumBZ6nOeMq3mGe9bbI6crvY5Bj+rJGE5l3xBSKApZ00sz1KsEC9p9UiXxt9R
         1T+g==
X-Gm-Message-State: AFuF++nNQTpVsNL+NJkJzLKrD1ru80LnvrxrtAfbyHCBMw/KjnZZZvtf
	/eUmL3kG7l9KmZHguly2t8kIcnGTSvflFqCkafUiXIpGrG5CNJilFYIKDxLs4Z+J77EdSdQuDIt
	vGdjJ
X-Gm-Gg: AYBFou1tGX0IozdMv1cYUVl9sPIzidpBZyyoJ/P9Q0EMX0AxqMH5CZE7FbB1MUIsZxW
	X06ozq7tOB3Vaxv+rF3qqhGKLczJiZgBdr7XQVZQyKnNsJx+aRxyOsKX5wsKHW+vlZGWZMGKpof
	R7GOpPRb8EmOHWizn77DbjwphBeH6HOVwK8dRSbHsvHbqBJrcicDndt/6wmLRCqmIa9kcxGzKp1
	3Raqnu8pl9p2EJ0UwUthSad9W4uWUtZERc72s9kG7kAZ7Mhc3NkgES0qz4xXIfSrjluHTdBa+YL
	y+U29jDysq+vOtRLtjBE2RG/bZeuojXXdS2Ws/A9t14yTa1Jy1BsbeUcItJ33y2rec2Cg3aSrSb
	HiICoKbo3WwEQ16HS8PQ1x1Eungts3Z1GSX3cMTlBLtRpTot1FmiNo7QtFsCe+G31pK5BGQSVT0
	ChkSS2vczpvulmnJnNoDoqCvjNVtEtrFpIfEiGx7v+T0FVQbVgCqd4U32HLUCCw++Dcubm1tdK/
	r3n83vJRRLrI4sgWEL57NLB/LUqJolM8z+zECY8zvL/IDumm/mm9Oxr8EgW+DAQQxZa
X-Received: by 2002:a05:600c:4ecd:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49fdf1454admr31393695e9.23.1790167181460;
        Wed, 23 Sep 2026 05:39:41 -0700 (PDT)
Received: from bell.fritz.box (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e045dsm80011925e9.11.2026.09.23.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:39:41 -0700 (PDT)
From: Mathias Krause <minipli@grsecurity.net>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH] kbuild: prevent building single targets twice
Date: Wed, 23 Sep 2026 14:39:36 +0200
Message-ID: <20260923123936.2227924-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building individual targets via 'make path/to/target.o', target.o
may be build multiple times concurrently, leading to build errors like
below:

$ make O=~/O/vanilla-7.1/ -j$(nproc) arch/x86/pci/intel_mid.o
make[1]: Entering directory '/scratch/minipli/obj/vanilla-7.1'
  DESCEND objtool
  DESCEND bpf/resolve_btfids
  CC      arch/x86/pci/intel_mid.o
  CC      arch/x86/pci/intel_mid.o
fixdep: error opening file: arch/x86/pci/.intel_mid.o.d: No such file or directory
make[4]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:290: arch/x86/pci/intel_mid.o] Error 2
make[4]: *** Deleting file 'arch/x86/pci/intel_mid.o'
make[3]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:551: arch/x86] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/scratch/minipli/src/linux/Makefile:2229: .] Error 2
make[1]: *** [/scratch/minipli/src/linux/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/scratch/minipli/obj/vanilla-7.1'
make: *** [Makefile:248: __sub-make] Error 2

Please note that arch/x86/pci/intel_mid.o gets output twice and, in
fact, tried to get built twice, causing the two parallel builds to
interfere with each other.

The reason for the double build attempt is that the target can be
reached twice, via arch/x86/'s Makefile and via arch/x86/pci/'s which
both end up in '$(single-subdirs)' as both fit the prefix match.

Only the latter should be used as it contains a cflags override for
CONFIG_PCI_DEBUG=y which would be skipped when using arch/x86/Makefile
to build arch/x86/pci/intel_mid.o.

Fix the multi-match issue by using only the deepest match instead of all
possible ones, which requires two changes:
1. Limiting 'single-subdirs' to a single match per target and
2. filtering out deeper targets in the recursive make invocation.

Also de-duplicate the list of target subdirectories to simplify the
use of '$(single-subdirs)' in filter expressions for multiple targets in
the same directory.

Fixes: cc306abd19e8 ("kbuild: fix and refactor single target build")
Assisted-by: LLM
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
I ran into this quite a few times in the past and only now gave the LLM
a try to dig into it. The bug only affects certain targets and only when
mentioned on the command line, so regular 'make -j$(nproc)' isn't
affected.

 scripts/Makefile.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0f4fdc119e58..d5f58513d02a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -534,7 +534,10 @@ endif
 # Single targets
 # ---------------------------------------------------------------------------
 
-single-subdirs := $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(MAKECMDGOALS)), $d))
+# A single target may match nested entries in subdir-ym.  Descend through only
+# the deepest match so that two recursive makes do not build the same target.
+single-subdir = $(lastword $(sort $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(1)), $d))))
+single-subdirs := $(sort $(foreach g, $(MAKECMDGOALS), $(call single-subdir, $g)))
 single-subdir-goals := $(filter $(addsuffix /%, $(single-subdirs)), $(MAKECMDGOALS))
 
 $(single-subdir-goals): $(single-subdirs)
@@ -548,7 +551,8 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
 	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
-	$(filter $@/%, $(single-subdir-goals))
+	$(filter-out $(addsuffix /%, $(filter $@/%, $(single-subdirs))), \
+		$(filter $@/%, $(single-subdir-goals)))
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.47.3

