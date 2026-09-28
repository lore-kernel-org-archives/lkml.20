Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813504F68BC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625814; cv=none; b=SDvmKIFRKBpp4qqOJ3zSAFRPeNECTyzmUJw7Yl4X1jwMqbNNmplPaWHf/io+ykg/se28wNxF7Z9kA1ou1QyhusySBJn3dWpc4XtGwfVcr23l2s64jcXUSwPvQMlwkX6ze1C9nwPBIkkrPAKUJ8NafGtMoPVecz3gotp1GKDuJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625814; c=relaxed/simple;
	bh=e79APqvYPYxLoCGsyadc7ocTHlw1rax0P3YjVlJP9aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kPMNrsxU4/FNVv+eeUsuw9YuZP6JKfBXwNOAcmtJTgmZkWpsyo+orIMk3NxAiprMvKLP7J3KrHXwrssz6rF2spAIrNmdpXK96HSzU8BYG/LRTRiccWBhiyc1uzdj8kdp5ifCQy4yFFIF28NLhn+mHt/IsMpeV7t/jUtgrjTPlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhwxdpee; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhwxdpee"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso19673295e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625810; x=1791230610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CViBSPtF4LBYd0VEUs46UXkR40K1KrpVeCYIgI+4SRY=;
        b=JhwxdpeejmUWvh3medXcyG14siz1WJ5edbK23U5KTXeIQLhj1cmVqsM5u51jnMUPdK
         I/haRMc+kvuL68gOabf8rKM/zpq4ZVF+pmYY3jHWHbfFIhFKcYbKagvbVfwquGrZLsCY
         JBk54NpC/EEH7ELoZYjQT5lq4CAJQkYjKu7ijETpHzk3oUkbBTJjNdYg/qNaHwboV6Fb
         f5Jo9CgLsc8yJ7dAbOsWJuegC72DG6Tm0L8KdqmnFYYQB8gdPcaq+dI6kar5BJ9rOgg0
         zJdrY0MdG+MyNzq6sYuXtuRmhdkWL8K4K3wVQwIB7+G/gAs4AZ2bsMAcUN8xPVFEfaBC
         gUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625810; x=1791230610;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CViBSPtF4LBYd0VEUs46UXkR40K1KrpVeCYIgI+4SRY=;
        b=pX7TnzNmn/iT4b2n0YA0olNilhDpCOSPVpndcQ/wDcmQQhdip2nKohq3xXhzpYW26y
         ejvDN/73xGn2RCun9KljaTOOKlk3pb7QJsOk7SItxhMZbSpjCZiunPwOO4OibRO2ZN4k
         dUrCzpTOL8gXtkuaIrOkCDRywK2QJiE+na7VGQ2QTKKExug41h4/g++AqmOR2Aaub1vX
         pqqK9qYWE+UvCDNV7EtteTE09hGbyJWOm9merIehChB6fuDNf/Rd2BC7BkomHWDyzCaN
         2yZlEdwwUySfCZ3GaSuDfDwCMUw1Epc2BlaPLz+MgTg2z76WepZFTylxzvE1k6PCFvit
         gDCw==
X-Forwarded-Encrypted: i=1; AKwUvBwMT97lHu+hjsU7jWj+NxI6PSQ02ehrknkJ3QUNPKY8zsrhItauqRHNJ1osN13BmOtQtPRQB9rX4qu71Bo=@vger.kernel.org
X-Gm-Message-State: AFuF++nFdDLyHtXoGVPk3c/5TFeo96GBe5PM5uZbLCq8YgfQTILvLaep
	wAXInsJFEHjqCeE7D7bBjGkSxitQ55IJHBFoKDAZ+D5/YjAA07uPawAQ
X-Gm-Gg: AYBFou0q6/TgqUfbD80536LPdZE8FQ+gr8R+bQRwzZ64AwrvuUiQUeg07FdGyJZE9R8
	dlfJXHAcCUFzkQYC0NbL2s1CHOzTCpS9zFqrK+82snN74ZopihD3AwBCA0qVodSFELUhuRSrLbN
	7j5byRxR3UC6GOhfG3w2oMri+gnJ/GAHHKg6LJDp0nHp2yU9agCfdgo5FfGCLIIPO3/urdI/cuq
	oMvNFTy6T7nKR4jVG10KS6U93TxW6YWWZWepdzxX8RfhOBrbY0pCm19DGzP1obUGcHrsIk4ss55
	uT+FrXNdQ35SScqScvlH/xgpWhx+R3z0x+cDC1bnimS3z9QQ257jIIo7P0ru0tWiYuugb3VNb9b
	xEDPDm+8w61untjMGEU1ztIqi38xnnhY3WNU9bdXpQuXr4PxFXELb4KHVYm/Yg7b4dK2/yRp4iY
	AAcOrTSMOO0RDaohNBHedEGlpiMPFbNgP4H64FLMi/uXqehj1azBTMkMx2gRoUQ9kX5ZGkOAwBZ
	hXmlk5okSiJCPhpIOBJ3s3Dv1vJEezxUjfjMv2OG8YXcDQD4Jio
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr234761645e9.18.1790625809613;
        Mon, 28 Sep 2026 13:03:29 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0730a8sm26506625e9.0.2026.09.28.13.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:03:29 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: hp-bioscfg: string buffer and password fixes
Date: Tue, 29 Sep 2026 01:03:15 +0500
Message-ID: <20260928200318.63383-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series addresses string buffer issues and password validation
in the hp-bioscfg driver.

Patch 1 fixes bounds checking, prescan OOB read, and character count
accounting in hp_get_string_from_buffer().

Patch 2 replaces the truncating manual conversion loop with a two-stage
conversion: utf16s_to_utf8s() into a scratch buffer followed by
string_escape_mem().

Patch 3 fixes validate_password_input() returning positive
INVALID_BIOS_AUTH (0x0E), which caused userspace writes of
out-of-range passwords to appear successful.

All patches tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Changes in v2:
 - Split hp_get_string_from_buffer() fixes into two logical patches
   (bounds/OOB reads and UTF-8 conversion rewrite), as reviewed by
   Ilpo Järvinen.
 - Dropped lib/string_helpers patch: pass "\\\r\n\t" to string_escape_mem()
   with existing flags (ESCAPE_SPACE | ESCAPE_SPECIAL) to escape the four
   characters without altering quotes, as reviewed by Andy Shevchenko.
 - Added password validation errno fix as patch 3/3.

Muhammad Bilal (3):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -ERANGE from
    validate_password_input()

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 77 ++++++-------------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  6 +-
 2 files changed, 27 insertions(+), 56 deletions(-)

-- 
2.55.0
