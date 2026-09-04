Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ED846C822
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522564; cv=none; b=J5oStpeUOCumQV1DGtslfqstdUhlAUYPv8dxwWUUN8GJqJaX8uqVHuzHkmzHTkzxXgM8GJCpZvXPuQ08Fu6FseGCHfn9vhANzWH3HjaKQpBrN2c+yRynj3+aj70VaJ96UjrWNRWxwSJzu+PNgKjZ9U7ryXuhI6u3IvmnAEtipAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522564; c=relaxed/simple;
	bh=zpG8QCVluFKOQRi0BX6ulehHhxxLyzepQvVm4yjqTg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZeEbz5juYs4Th74pg9A3L6Gwka7EIGGbvmsFrs0xcofCaZ2WpnGCFU9Cqloq6a1nadk9berfbiCF1J7+vw/eSqAZjOIa6WqROX0+7/6J7opGSYLWd6Sox3pMrntpEMEML5WkUzubYUphRGfYjYuATPs7bZrN8oXGQ9MKSbZypQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbMsqzkH; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbMsqzkH"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f0167e59a3so630599a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522562; x=1789127362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnfgoCaPr8z6tmup2YvxyLgOPhuJSd03d7jgRNqyMpA=;
        b=lbMsqzkHYYpjZIOw4Uk5p1BPT8Pn3Hj47FBm9taTco8c1bAPsZIigmDnMsllEcjn/6
         xyQulIw+qvGdjaz3T1I791UP0DlzdjY6CLbHMg83gj72xCry1N2riZ9HntyGtT9dNwus
         SfB+grwp4iAGrXrjsEhcB8Kl5oFsMKtWzUMZ0s5Ic/JLhcVsNi9y7P42VdSbQVXR88nx
         ksrM0GN4i0TiI6XJCKqrsx6C/VnrNl59I655SlwZUkeyD/Umy8nPFiWqjwEbuDu330yK
         VB70XgUlLOqUEhK/71PXqVxDZnwjueBHE36hKYUI6NfiMPc0BWrVak0FEXnd6aPvDton
         MpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522562; x=1789127362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnfgoCaPr8z6tmup2YvxyLgOPhuJSd03d7jgRNqyMpA=;
        b=GUKD/GC/tbCotgyWKya8XerjaEloesMLXYNqN8sM4WpBDSXwRORkVzatFrs3t6p5tq
         YI9g/8UNyO4Z24uug2+Zma44RcqS9ZmU33j0SnRpl53iGhDsFJ9RQRDgQrKOLnz0YSnp
         FUENGVNlmfFg+qXaxno/inWRCW0zlzr59qVWYjqlKizCcLF1p7xq6fA2a8bkzZb8hnNJ
         A1qA3Xc7cVTggqDV5a/+iZwhn3fdMFNmbD2InW738Mt+JQLMORxZ4yaGcj5Aa6ix7pnI
         2W1G+OsT73BjmGeLvIzFDpCifim6+iVhoEWc7TCabUTMTYomyr6scqoViWx+FPsHueHp
         bwMA==
X-Gm-Message-State: AFuF++mOTFzUh/p0P+AibL1kTCNFKklC9EumZfRuH/MYcURJNLPTNIiR
	JAOouTkGvLVc7Q3Z9cX/xUMrbr/+roYGw9bZMVdjnNDlfPhekq3LcS34r8yV1dd6Zng=
X-Gm-Gg: AYBFou0i1qBYHay9GZ4YvG1yIzcaC/JL46H1vMKIsHlJFmjg4J8NkkcLXJTdjooUXkU
	VJ9zLPVdbS3FvewsryKGm2Hmjdo50zCTFEhu/nDQ5gt+cs/OhO5rlZCLxho9olJB7isVf8ZyaXS
	FzBdGI6I/VwDDNv4x55omGhSEWZlBjxU0v5wrn8eKarnkvYYC03RHX63U0LyRtR5LPRgWtUjUxa
	Rc2W5/2rz9R+gfGXUQVSmeiub+v9ap3YgWqrOV0xk81jf7sXD5coUpDNYq2mUD+lAtNwTqiQv6u
	ncLLyKqneRz33ufCJws6NtNVou95bLrdzs/udIvcslW7Cln2D4OnTpFHFgarS5g+K97WmJtzFJY
	llICoJB6iPHJE2My/4GiQnNXGZ9fm6/2RZRiuNfo1wG6SzeBMQKEHPy0qe3oQhGLrA4DX9dWHyd
	lrVZt97r5XiFEyPao3TrY8oUB9VOXEnwvvKI7+ZyviDoU0j/qqryMVgUqqNzUwh38BGMES8nOU4
	VXGZqkJVcuBGsACDFgbTmTRLw==
X-Received: by 2002:a05:6820:81d4:b0:6b7:8396:f3cd with SMTP id 006d021491bc7-6b78396f8aemr1309340eaf.47.1788522562229;
        Fri, 04 Sep 2026 04:49:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6723317eec.20.2026.09.04.04.49.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:49:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: fix typos in comments
Date: Fri,  4 Sep 2026 17:19:11 +0530
Message-ID: <20260904114917.28603-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

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

Hemanth Selam (3):
  ASoC: codecs: fix typos in comments
  firmware: cirrus: fix typo "upto" in comment
  mfd: fix typo "convertor" in comment

 drivers/firmware/cirrus/cs_dsp.c | 2 +-
 drivers/mfd/wm831x-auxadc.c      | 2 +-
 sound/soc/codecs/wm8962.c        | 4 ++--
 sound/soc/codecs/wm8996.c        | 2 +-
 sound/soc/codecs/wm_hubs.c       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

