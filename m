Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794629388;
	b=pyVKkEZMbCApkpssV5vNiadgMDwDtnXn1hJ+35ZkLfuYPTkVCiN9P4w+0sNV3dFzeC+e
	 QTd5jJi5SZWgprXlHUoRvyOlMc/Kmhpq6Q0+RpEKPjScFbKD662ceKJkimQF/ZXN/xPTj
	 /OzCu3nync6btv5wzWFn9EfJU0cQJkxTxGn8wrUn+Gbv/IKma4/1UovU7+tJPSKF0SRoO
	 RF2+Rt/MamMgWUvRf0OEafMdffSli5Ul9SR/QqjjG6ttMsI+WbE+1uZJXv2t5WVBfkzFt
	 JztudO7OEGMRqrCVkHtCfqSRrhvfILrXYwo1LQDAr7G+YEtK1zN221wWIbxrR3S2/5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=33fNufN6J4OClTS1Du1UDknamLb+kOZ8wd0azYoYamM=;
	b=sBOuTCZ4jC17nXM9K5LItF9pRYmtEuYff8buT2nyb/OzsjHLL78BwcaBWYfREjdoCQwm
	 OUSPAsdmQ0BcBSkxgvQGwuNZTM7bt1sLj19I40Zarn1PrZXpm+oZ2WtSkxIwXad0CHy3+
	 xKgSIh5OphchWVI89BCXoRemK7CiI8jIzZd98w0IZvzZvWMGP9NeqY1PeKhO5/gyrVhqI
	 ladg6PsN3NfYi/5oJxOYM8Vu0bFPNLea+XRi5tUOx0EotYPexVzt0YKijOG+Co9lvHw1b
	 qjvcXdAApMLNBZeuma5D3xTioR3uU3bQ/eKNCv4pMvyrZmZn1Jb7mF4NsGmaBcFr7Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S6A2Xi/L";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A2606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4A2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6A2Xi/L
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1240926f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794629385; x=1795234185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33fNufN6J4OClTS1Du1UDknamLb+kOZ8wd0azYoYamM=;
        b=S6A2Xi/LXuCFkKwROypO0c3cn89KvuCCBgwHpH6yE+mMnsA8kxIzYltEY5urVlaxNH
         6P/iWoz183vYHE0sDmjf7eYtNqb2bh0Dm14ikLaOKFjxahwDbLcCoSv3Z/78sxfloGuc
         NPlULsM9gV1wwSLEhlwuc0SonBRKOr6p/vRLuz+gy3LkCN3/E63UXWcfUVE6RIJ7rc0Q
         QNw+EgNU4IKQ3ZBEoAc8prQETiG+b/4rwdHveCErOwUGqTrTZAgNynRDSUVnDTZF+14d
         LIfsa+CrKPExtY/CC3ckyBjOKPxtrvOfw1+RtRpSabANdkBi4N1UWkdFA2I8eQiFMLye
         vaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629385; x=1795234185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33fNufN6J4OClTS1Du1UDknamLb+kOZ8wd0azYoYamM=;
        b=DWhhEHeODl5eVkXvafAwtXpY/NBCWkFq+D1a1iaLrapZZO3ZYtBQqj0iK44q3689X5
         ubP1u4yGLFOqHXlbRzR+znVMJ+XSX0KFgbfpK0RbuD3NhebxV5Kxi995vXvnqct6Wb+z
         bNrQrkgmWhBDAJd89nVa+MeP9L93EhX4QGfzfQiWOa2rsz9dOLtk7abBMAtyJJTMwjMs
         KuhQPZkqOd1Serg8LfDe+F+8TMMGaaIUF3xj92iUGmcHBaR4PMGPA/ZcjBmiks9DirnH
         fyzmYT5DDNM9vI7hlRDhqXh8qmfmzVf80uOLJwq/x2LixG+ypeMYMB2jo7xxwBrrq4Rg
         KWIw==
X-Forwarded-Encrypted: i=1; AL+hErEUCZAUhI74gZ/Wi6LG4dcoMW3A5rmOHjV/Hmi4qoAxGiYVlNagwZgSnqz2S988hdCtFk4ArSYMMAr7ajw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Vx5qcoUc2v0qRymn2kbiZ4Lug1sV6yAikkfy64oaPiAgbNbk
	9/dVdchBqhh2FnetPRqgyF2K6B3XWjBlC4vxWK06PHfUdFbE7Sd7kKkL
X-Gm-Gg: AYBFou3Mv9LKlzWFtj1PNhHuRmhMsghDiEQpDsr7PX7qQTxRvhDy11QcZZLC9YPJANQ
	zMgySg9s+fe/iLi68MeZ5DeLjvMe2FxhX5PUJ/owAjCzZx9umaikTowecT5GEAJuSUYoqotUyne
	Iuj1TXGXi+Odaa28BoTemI/c6XQTJOx2x+5DmgVI0Ki3EF4tSp9epHVOevfC1g/RbAOxQtmrOvm
	cNil+OcS5eLfCR4jGFVbljkijiM1RPLZ/cWzkUkWtsflyj7ukSH/5yyxCgYUJHKhF1wXInYNiAu
	fUqT4I+NYFAk9Hiu3Syxcj2roHC7xx3GKIBhaPIshmsOFE+4afUr7sorFICa0fd3+9gnMUF5Xpz
	aaQ/++IyIWX9gFmYEW6w+W6U+Xi6q1bGSr0K4gre17uStQiKliFK8QuytP5+qXqRU0NWidcseYw
	FCX9b2Axc8r7UBuZtt0FRpruSMPFC5XudvBx0EWFY9g4xTL6POSSCtYcbGpqMn4wUOLk80mzpLB
	5lDXQyHLXouFfq9hU3+GJJWdpWYkEDukMwiTQLSLUbPVOyEaZ+otWeFtwObXAIaWQaPd0Ce7Op+
	H68jXvPJD2AS0iURwr1sc7/eNYWiYL0Xk0cLcRHW00ePFnk+3iAQouWHWHso3l0=
X-Received: by 2002:a5d:5f92:0:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-49c6d4539c8mr9740640f8f.1.1794629385233;
        Fri, 13 Nov 2026 20:09:45 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm8488670f8f.46.2026.11.13.20.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:09:44 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saeed Bishara <saeed.bishara.os@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Sat, 14 Nov 2026 03:56:59 +0000
Message-ID: <20261114040943.219870-1-demyansh@gmail.com>
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

Add a single-pass csum_partial_copy_nocheck() implementation for arm64
and extend the checksum KUnit suite to cover copy-and-checksum across
alignments, lengths, guard pages, and interrupt contexts.

Changes in v2:
- Drop the NEON path and separate csum-copy* files, folding the scalar
  implementation directly into arch/arm64/lib/csum.c (resolves the
  <asm/neon-intrinsics.h> include issue noted by Nathan Chancellor).
- Switch the scalar loop to four __uint128_t accumulators (David Laight).
- Canonicalize 0xffff (-0) to 0x0000 (+0) after csum_fold() in KUnit to
  fix x86_64 test failures on zero/all-zero inputs (Jakub Kicinski).

Link: https://lore.kernel.org/r/20260927131838.6774-1-demyansh@gmail.com

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 100 ++++++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 410 ++++++++++++++++++++++++++++++
 4 files changed, 523 insertions(+)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.53.0

