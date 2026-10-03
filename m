Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B7C446053
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791052977; cv=none; b=VWW8iYTdbKtgie/NrQNzAYvYEM9+L4smATeZsc4IUA+cdGGu+TrMcLhR6ZjnWq8fR8bPiNAhHC27TpD7Nr+6sHSoafz70f0dYb1weZFIqkfrtzM+geWsxCOe710TqTAoFxNGNEge1Eabwa9ykHmRWvESXxfuWrg+DAXnSYbq2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791052977; c=relaxed/simple;
	bh=GhhGfXj9vBQXSVmw4rl57l0G/4iCN2Zbc0/UO/Tbdyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Du51+LRfuCulK1XlMj5IYI2SkfG9BFJ20b66akUiFueg/d1BAvpuX5a6XAATdhRCE10QFp4M7tF0ZLcctEV9Yo7qPAxPoYocQbHomlHSE7FfFGbz9W52BvMXNmB1cNq//Q97izSDdT8a2s3qWWSi/vMfb4LoAHgzpTJfIMvDZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6mXoM0z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6mXoM0z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so6879165e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791052964; x=1791657764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZGoz0Gc1L+br4jm8tbpJBdxBSRHrIPgq8dt3xJ4aBQ=;
        b=W6mXoM0zYuzkg+0t7qmFwx9IOs1gD+tagod0GJl8GbXXEZ46UgL3hZmKiMkKI2127s
         IB5LOm6rTWeU+P5f5DrPPGGFiuzihPxBnWVCol3qSIWXDJz8eZUX01hKmoy23yOgXu1Y
         Xe/tOiwov9X7fFtMI2EK7jvEO81TQ9gYB6u02U4IPGYZWKPwTJuSy4Zq6T3dcEX5iLfv
         WQwuVGMkGLXo7nJ0meovY2rZbgRfMjx4jqd02AvjrvU9SkT6hGI52p9iT7OetrIlJv/9
         /4EpXb33NUdQI6iZ4qkNRC5yzMAWvTHe3K93P3m4pGceEYw6s7aWb489sFTpiszy/eZR
         8GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791052964; x=1791657764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZGoz0Gc1L+br4jm8tbpJBdxBSRHrIPgq8dt3xJ4aBQ=;
        b=MSGRs0Bwexh8fuLSAtKlfRBQJT+uSc00Cu1tCSHxPVPZJscO3fjNgV7rDz0J3IAeZj
         ii7MvhhlchPuPL5gs5A4GA+sUsV2q14i2xB4WluBN/8QY/OG84gHiQ4XJmayHH8YxP0N
         61TtfhYXW6lwhkUxM1NM/q0Yp5mEYkH4TOdgo13GyJ/4PxMIABOpmxtH3Z/qC/PXs6hk
         2RD/cR2a/KLqY8qgvXvZmt/D7EX+Yu9UEVDNnnD7Ziz7isk61FfUpB/CoX1ifc1DNL7A
         tcJT+kvk22+Rjw4H5Qwvd2ehJnb2CwW4MLX5UXo5ljbRaqTDL49uRdtVELg1WJPWdUXQ
         qPVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+afmsyj5LKsfFdLXekEZCAqHyUMqTTRCMfKOmU2dZPc7UnuzBKI0Ny3nrcNlFNEdUoT/mPxG6hWGMmUM=@vger.kernel.org
X-Gm-Message-State: AFuF++khczfNeVjdrs26x15086Z8PVhO/nFLbuLISDFy+V07kdQw/Mq6
	x9GT1NEUpqLGjRyRhoqL/RIkoG8oF2ixXkMI1k7T/cbOZ+Ygn2Iw5zrN
X-Gm-Gg: AYBFou07tK1p+raTDAeOefciQUIaohG1zcCQx3/D+TR6SAMU4SvnOygzltc+w3HFWjw
	8gt0nWhgmOdMFsd76iZZVTPbqfhVWGjtnk8WdWb97xddl+JwteCaB0VrYi/ix77rJ9xLAOik0w4
	lLGzjTGscDsZHzohArnHkN/i55lzycJMOlLMKlrqhNuXKj7sCNjfYWekqH3iAltbViNeAH3vtDt
	kQ48SYCBUW+qVD9XpG7uWm6yNAr7AHUfuyDY+A5TNjJmWZhX7pVzzxERveHVGTT4I9aXKup/Rvn
	T/Na0C7HmgVSWcx1awJJd/Q0xzJ5TEvRMImbuhwoe7fPLKuR/Mgnwtske6ZAvQcBpC2dRn0zQuo
	wmsaRngjengVfu2umBcEX77uEBB/teqwJyt90CXl4hnkG8T7Jush3SkYMJxysF0GNNG/HtPTU5X
	n+rW9FJa7F/6QqSr37DTu+i5xJ2SHQAxZNfgaGK7lbcQrI8PBhDdTvXTapT/uUi4JdJ+LDopo8e
	vGzxTi6CB1XmH3m6PPKCYtIA/OfIhcZPfXaKKLWfxVtDyWb4vG2gosAebHVwj6ycaxLZKuYKusO
	UkyFAkPsz7kINReqtbOr9ai12KtgWjXTABFrD/SgnZOTJ9+AiA/1jvN91KVzTNiAHLzGnWXj3Et
	7xw==
X-Received: by 2002:a05:600c:1f84:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-4a1680fdbc3mr46273435e9.23.1791052964121;
        Sat, 03 Oct 2026 11:42:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm259072935e9.11.2026.10.03.11.42.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 11:42:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Abhishek Dubey <adubey@linux.ibm.com>,
	Dan Carpenter <error27@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc32/bpf: return false from bpf_jit_supports_fsession() on ppc32
Date: Sat,  3 Oct 2026 20:42:26 +0200
Message-Id: <20261003184226.76740-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_jit_supports_fsession() returns bool. Commit 92258b5bf1ec
("powerpc32/bpf: Add fsession support") made it return -EOPNOTSUPP on
ppc32 until fsession is validated there. The negative value converts to
true, so the verifier does not reject fsession programs on ppc32. Such a
program loads, and only attaching it fails because
__arch_prepare_bpf_trampoline() returns -EOPNOTSUPP on ppc32.

Return false instead. The load then fails with "JIT does not support
fsession". Tested with a ppc32 kernel on QEMU g3beige.

Fixes: 92258b5bf1ec ("powerpc32/bpf: Add fsession support")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202608010958.cYfBCQAC-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 7a612688e7a2..64e70f3226b2 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -539,7 +539,7 @@ bool bpf_jit_supports_fsession(void)
 	 * for fsession and trampoline on ppc32.
 	 */
 	if (IS_ENABLED(CONFIG_PPC32))
-		return -EOPNOTSUPP;
+		return false;
 	return true;
 }
 

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.53.0

