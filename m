Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8AB48C41B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526168; cv=none; b=I9EhkaTAb1XXcHId4zBR2CKD5fN6ljgUmNFXJoOMFi8yk6XfjTgHb0H2NV9dM5W6qKglnh48nxKjkVbZfXxpMbCZ4Ia3KXvnP3D2gamPCb3lyxZ8GT0igDslKUwKDISuXGnE0QPkTnuX8Gr580OLP1XpoNlGaGvvGwBWV+H+feE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526168; c=relaxed/simple;
	bh=Q0afWAEOLYcX1eIK8w04tRgj4rJJzyMasSsOEfNRhaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsQ5TuDo5EIg1z2YhVo37BUpD7+eWyDmNeV1KwEDa1tkf+DWVL92dO0eC1eTaagPedZrPnNrN/qxL0i1wgqqyvFd7bG/FNAG+DeudtYgs4stE2305JjxesWH1hjPH9LEYX+oXIYW7EWWUbZLItR9uIcv+UgjpUJsB4iKe1efTRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKMkhD5S; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKMkhD5S"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b13496112cso777716eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526166; x=1789130966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZeDPiM17i6hkDh2kOz27BHfRb6qjN2so+Hh83mgXLI=;
        b=RKMkhD5SVSxNsPClMV7JiJvu8scPrz6/rJ6URuoR7BdA5lVjpI4qq5SVsTN79hkRvH
         dRsct9H/dlA+eCtPhkpR2f1fI0wdPRI3Ub3Z4JhYU3KIwZDNLYWnC21QPnR2rTTXfde9
         VgGvbEuYlUlhUcPKDOsFLoqAbTgTORG3v8LI9gbAT9yz2/7VkGMd1QeG81IcEEy9NSOh
         6XTNVVSwUZBxaJ1C/oaXb2FqQ1is6QbnqTWlkmSmBpQu3fGXczLpGXLstzldbxAMGqsj
         4IvWQt+DL3zkWkBuyYoNUutqufrRTHpFtgUNJ3WVuyaZQLsiFG2GxoMiAZobwJ95W2cK
         84WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526166; x=1789130966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZeDPiM17i6hkDh2kOz27BHfRb6qjN2so+Hh83mgXLI=;
        b=MZl1fQ+oVyshlXLvOpt8s/NOqQ0tX1WV3H5uA8scQe53ekNO6Y7kbDM9Dbbqnn2rrV
         YJPNEPn1TBMAc7o2gf4VvlxdJFpyrmksSe4e9nxYlZdVNKHoRAeZ6yphIpaxdIDHq8It
         yYRQLc6U7NlfdDY86t35KrnQ9Y0P/1/Qhq7UMtyWWqCAOAnYQzX1CxWn7X0uAEExyc5m
         euAMTUgbRJJKomdDQeE9tJy0eIkF8g5knHS5a78q1XQOkMjDaEq0/8Xdt8pnmD6Hk5Ez
         Rqe97gy01Us1vphe/y3SS3qy4+6PwEhUpg0gpNqp/WbdLXvKWNunhS1p4awWr8yHdVRy
         Mjrw==
X-Gm-Message-State: AFuF++nej80ZdUhUSOdjP2KVUSFptdvB0nc0TmVFmdLtLyAgIaUGR+RX
	uUyvSiF4B1odXWi4fsyxLhHn6VsNdOV9bJNDFIJvPcKGB67N9hARKLYHWmFs040zIgs=
X-Gm-Gg: AYBFou1R4GZyn2tFaNz/tLdiZ26aFgDCNDjENfJlTP97IvLD9hvxiqAOGOgcVos5M/V
	yGuaESNRQN73NE5fyT3g7VC9+OWQIVjWsKYeblS115S4eWcHu7ndtWExQ3PzNDzxunzIHwXh+Ld
	CzCmI/yb2vQgPSF4ymhw3yu374DjRRXhVyPY7E4JEk3wOr8POrAAG7AMUGQO6QUMzty6vTNCG9+
	fu8tbaPeyNcVnagolfl+3g4H7HYy9/sj5Po8rbEwbhex0+el5Y40kVmis1yHK7TRrlVT7NdoOh8
	wiMJ6KK46G3sHutwQgJNbw0h84M0GrZo7n4vTeZXFzALMwOdmgvV1QWd4ujxfJNJwsFwRjk3Kb/
	V0N0b3qsogKc0/manw1maMVUV2vvFmQBdIAGhxjYoyTvvMXDkiNvfndFxFax0047t+xs3+Fkf2u
	Pkwp/YQwNaLuzYOV3VTN9V35AuU9E6MMKShLIrQVSxSfZ2xMj63dcEKaAt0JE/G+5XH6HtXchwk
	EVMJR81w/8aStg=
X-Received: by 2002:a05:6820:c3d7:b0:6b7:46fa:16aa with SMTP id 006d021491bc7-6b746fa1b6bmr1787650eaf.63.1788526166068;
        Fri, 04 Sep 2026 05:49:26 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7328079eec.30.2026.09.04.05.49.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MIPS: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 18:19:18 +0530
Message-ID: <20260904124922.10256-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  MIPS: fix typos in comments
  MIPS: fix repeated words in comments

 arch/mips/cavium-octeon/octeon-memcpy.S            | 2 +-
 arch/mips/include/asm/mach-loongson64/boot_param.h | 2 +-
 arch/mips/lib/memcpy.S                             | 2 +-
 arch/mips/n64/init.c                               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.48.1

