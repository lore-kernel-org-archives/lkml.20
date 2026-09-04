Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40B647ECC2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519617; cv=none; b=Jg77BT70ySKVH75jXZ4crXAyVgqNDmAmPqrZ2XA6xrjA7SZe2hLGccXinLXjUIK4tU64nUHHQ6M72dqOs6pfAoCkaN5aPrlBCsT714VL/l9aeSb+pHmFxHug4Tio8knt2W0IMA1WP/HleGh8p8oF1qI0CTGO9El4c6lpGxaq1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519617; c=relaxed/simple;
	bh=Uou7YrAGQQbQK96bJm0Ip6mzLO7t/U6xN22dGQUi2DM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F+mEbcZ7vMrY5kKYql/FujLGAgal991sgVUYCZsNKWNpvwYXH4qM9ks/uJdwWVyl/P9kSByDCSBfZtmLfIaYQz5fVo6LjLDdUL8cIiy4pwzdrE3PGodAkp7/RZQr67zYsv0rhfyMyS4NuqfL3U4jyyNd23kxGPLJtOmFQmQJz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxoNoveA; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxoNoveA"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1497f0453so638900eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519615; x=1789124415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VR3Klg3c0Ag9x0xS4S/YmSnNtqiUQcc40IhIOmKj7fA=;
        b=HxoNoveArFSS9uoqR/sYx0R7Avp0jiVcmMmVSdnSwmUNxGCAQgo592iUvkpVv7/LkH
         U35ibDpIjbfkBUfg/D8IGYKJDzL++7m92hXqYYQHeNrvLiexkKZCCu5x334H5o5njNIn
         zlS0C6WDPZfvT0JmlqvXpDVHfe3XaxauhDTkPkj5WjON73dtQ5ZeMHxY47oMyeaqa0rN
         ewv75Kqm0KsugtRB2K72Bvh/L2GAqwYfQqfG9Qxn0VN4wRjfxqbpEjA2o/382xsjshdh
         XOHrQ6j36cX9RtYFLtAU8u0B1FNDrs+YgqtHwmNNbYJR3loyBLneeuiyk7Q4c/UlYHH9
         XX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519615; x=1789124415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VR3Klg3c0Ag9x0xS4S/YmSnNtqiUQcc40IhIOmKj7fA=;
        b=M2CGGPO3v0KWUtPBmKhgjpBQQ9H3cz237VvMvGuk+gCVxxGmDSIo8ow4xf+/12wYvP
         OptUF0udUboTB6lKAr+H1Kt9xkJAuXvzn+crTdDkmpN8vksQoDrPQYjCXFVweLZLVrRp
         j+IxrV4l9a3gnQTudIb88ln9cbsb8fJSID+TPJI3MQnfaeTQRiWUl/ARfwL8z40mnqcy
         8ONdDlHTxQfTxssoXz9zhjuYqNbsXQHXwFziMXyyMlta/K382y6v6g9541nOIINBq/3+
         3INicJAm378033z4Obv50LpBl82NrO2nhg10R4q4dYMij4EsoSzLEDdWXeMzepoO+hvz
         56ew==
X-Gm-Message-State: AFuF++kP11fMAJ2YVkQzQJa/oKTtZkFD+Ct9RoyXTfOEKsZiaaLURJSy
	EDEoSZJmQbdMNDDvJrQxf2x8EDwhaJiPvncTbRIMULCeDULR6kv1ehrAOBsuvzszVR4=
X-Gm-Gg: AYBFou0Zb+09NFIlCAt3XvnWSvFN067U6nKczuH3hM88s/kRI7cz/+s4zcJk2UiL9pZ
	GR7txpcsFxyIVefrXlmVw/9auxXCByxrLnQKa7p/r4ATxmEgR8O8kpVzyefq33oqs97IuUuAVy3
	GHMiMnPgMpjneaNRBha9Jal5aiBaEeaDlRgvQzrYSz0yZRGo2/gbQp/HFkipdqMv1kc7w+BpwF0
	uiuvfEcG/13Z/rHFxdayyUVoMpXY9L7/t+e5GbwCDyc+j41QVwDjLao0fX0/j7NdFP9Y2ATlqng
	4vNh8UmY6iCrp/TCSLnavzmKtHroU1gKVmUgPx6awCI/rjtfZp4b7f+vK9hx1Dg9IF4kBWBDoOy
	HBqzNn8MoFQti7IvwL6ojVha14DM3yhfrC0MNdlWeJJIpUgvTbBH9f5jqhPvme0vp7CCoC4L1+T
	w2CW9Nb4N56yI4gWtEB90z1y/rjdg0oniF+Fax1g6rvWIY3o/GMUffKPhHVPhaYV6UclnzAfFuv
	yBk8+cL9ViHc2LuNbXWWuLNWvA=
X-Received: by 2002:a05:6820:c8c:b0:6b7:46fa:1690 with SMTP id 006d021491bc7-6b746fa1b76mr1834997eaf.37.1788519614266;
        Fri, 04 Sep 2026 04:00:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm6813221eec.7.2026.09.04.04.00.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:00:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pcmcia: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:29:55 +0530
Message-ID: <20260904110000.6304-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings and repeated words in comments.  Each is a
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

Hemanth Selam (3):
  pcmcia: fix typo "specifiy" in comment
  pcmcia: fix repeated word 'both' in comment
  pcmcia: fix repeated word in log message

 drivers/pcmcia/pd6729.c | 2 +-
 drivers/pcmcia/ti113x.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

