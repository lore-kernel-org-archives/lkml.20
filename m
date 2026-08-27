Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE049550A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787855302; cv=none; b=YZChKXuRI5pZKlj++jKASzbzrzDAj9r52/f4Pv9FL/v7PPDySJqfBI5HUYMu1kz9oeoWZTFJRZFQ9KHXkHYuMWA8sI95OJJvjb8FNVb0YXurSINHvQ6x0p4P3d4Tg7BPQlIyvobppYmRdLm49Q1XFqL1N+yuPx/qu4MMC33YttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787855302; c=relaxed/simple;
	bh=8WvPnhhFeZ2URlGzjg9e0UUP8uR+W+FeMhbeU0YInps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gfMAdD/dyifDjyjt9lmAX82ymBgojLcni4dmNF1n133VXnbLINsZi9SB66SpH89K0eUCtrwV9AQpM6gJI4BziuepTbh+jRtRljyzRg28dQrBXbHTlYJkg1cHc5yOlrR1Vk7tZhA/oANVO99jwjKZmlAoXTleog0iJ4K+KhKP/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEQX1ZI8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEQX1ZI8"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso25111966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787855299; x=1788460099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg0L0KQH1TGgD5UWd+gOmMXSQA65MZQV6AxkueBsrHg=;
        b=KEQX1ZI8hP9BkFYFpWf4y4sbKyZnZldebZ3hiW4bHP8f15xQ6aKsyhJf6bXCbK1JI8
         CORgUdrKFQ6r4WB1Fz3oLgs+6pskccOf39wz2RmpO61L4KfEl6JmIYsQRt87ZImsXUFI
         3jX96BGzoPBU3epRYFhIkl3QPOVVnvFhhkI8RXnb4Z/Sd9NlfxprrTd7Xo02OnsAOuwT
         GfFa6+UxY1HwLc57cmSwF8xMU8JhhR5XDAhiYWacbYd15bBmyTm+Mg0AWejN7+sbDu94
         h6cR6iyNL5TW3MuVIxBFVrMUnqLxzvIgNUP/gvIB0JSKz4uw14N7/CBCNJL61cg3UeTl
         uwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855299; x=1788460099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg0L0KQH1TGgD5UWd+gOmMXSQA65MZQV6AxkueBsrHg=;
        b=b/EqnKB9jkPIOhMUPGf/H3sAPsYevVyHe+3GPCGbz+eDu6GnJ9xCqOuOeQgHMH8LcN
         bqdAVGgjcD6ufGsUvn51wZ9whSeTD7CStPu6ZM9nf5xM7P3A5bXZm0j8yenfLSvOhygS
         nXBM1HIPyHlcxKsgBK+WeqJI5NagGxjE8dOi69w8CtERJJbyf/TddT4cxvgPamKk696U
         +8dJuaKpuKMxbfnmfiEgmN31uV3kSlxaXSUMZ/Mh6OoOsjcu6U3TS8Jgq6LrgtS43vjQ
         vVKWkil+VucOOX5qvUpc8+ROxgI95kLHAlhI79AAlMcoO9zW45RZrgyfmMYFua8hR7gG
         cBeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwKJnwmIMgTE0ooBvw8OgS79luEJABTosMiPitVJdiIycVoqdfv/i7c/ofNOxK/pm2hrZaugsk0Q8dSAk=@vger.kernel.org
X-Gm-Message-State: AFuF++k3du15Lvmh/Wps/Dp4gjq7jeqp4dPsNxZCmMK8ARO3w4afG56g
	HU4/QcxYHZo/1M1tIDkNyosCUnW+a835V7khVmw7ODb5Z6pKMv5Nkmkh
X-Gm-Gg: AR+sD10FO9xI5N0o2OZBbrudvsU+01vruxpvTMWppvRNMFdSkcOBqyrZEC8obgwwqwg
	WC4n7IJFdldae5iNhlUhIdGGHn9ikmV5/fCjpGvaojU2kLH6mONZ8VbVylzKk7Zwgjzv1tR3suU
	Jr9HXEk0YaqXuGhn63YPMWTt6seA0nGlXlyiPX104fB4WDhN0+upMb2bJ3N/wo0OrmSJSOepF5j
	ZwC2pYHyE45iTU1MYlsl46+sKguWVLUEPg6HFpR5Ef7s78UrNaYMZyTfwvzRdxDWy2e4Nt/Edjh
	5NJKfp4BVstnoLCxcRmDmLezvVHtOcnUgMsTo8PWkhKch4I4dL3ywetdaEKjDiKCBDzDXhH7+jA
	82cqA4hj/zPUjMPAy2Yy1nr7PDvN7Qn53CBqxmAufXx06Y1onIZXiTYKvvINi3vlRIm1K5cwWCs
	bq7iulh6iu9TQ+B0O5yL39bekJOX/LonSjaJkbl8hXFUMaYVYRlCO7aZ5C/yRtdMZi5YH9czuRc
	2RM91Nl4ZjdkCs8xOTVvXMWFQZfjvLVuHDEggc/vA==
X-Received: by 2002:a17:907:e1d3:10b0:c16:8799:fcb4 with SMTP id a640c23a62f3a-c25571a63c1mr37073766b.19.1787855298365;
        Thu, 27 Aug 2026 11:28:18 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c254e4e736dsm61288266b.11.2026.08.27.11.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:28:18 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/5] sparc32: replace sp_banks with memblock
Date: Thu, 27 Aug 2026 20:24:12 +0200
Message-ID: <20260827182757.6856-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the sparc32-private sp_banks memory description with memblock.

The first two patches convert the SRMMU consumers that already run after
bootmem_init() has populated memblock. The third patch moves memblock
population to prom_meminit() and applies the mem= limit there, keeping that
intermediate state correct. The fourth patch moves the early memory setup
into setup_32.c and the final patch removes the now-unused sp_banks array.

This work is based on an earlier eight-patch series by Sam Ravnborg.
Patch 2 directly carries over Sam's memblock sizing conversion. The series
has otherwise been substantially reorganized and reworked for the current
kernel. Compared with Sam's series, this version is ported to the current
generic MM setup, keeps the sparc32 mem= command-line option by using
memblock_enforce_memory_limit(), and uses memblock's exclusive range-end
semantics throughout.

The series is based on top of the sparc32 phys_base and Viking fixes. In
particular, setup_memory() preserves the relocated-kernel handling by
removing RAM below the physical address to which PAGE_OFFSET maps.

This series is boot tested on a Sun SPARCstation-20 with dual
Supersparc-II cpu (SM71) as well as dual Hypersparc RT626.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://lore.kernel.org/r/20260817153237.GA702187@ravnborg.org

Magnus Lindholm (5):
  sparc32: use memblock when mapping the kernel
  sparc32: use memblock to find available system memory
  sparc32: populate memblock from the PROM memory map
  sparc32: move early memory setup to setup_arch
  sparc32: drop sp_banks

 arch/sparc/include/asm/page_32.h    |  16 ----
 arch/sparc/include/asm/pgtable_32.h |   3 +-
 arch/sparc/kernel/setup_32.c        | 118 +++++++++++++----------
 arch/sparc/mm/init_32.c             | 139 +---------------------------
 arch/sparc/mm/srmmu.c               |  65 +++++--------
 arch/sparc/prom/memory.c            |  51 ++--------
 6 files changed, 104 insertions(+), 288 deletions(-)


base-commit: 982260b3f81e405af4a65a3029399840a2d2a4be
-- 
2.43.0
