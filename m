Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC45208D2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687430; cv=none; b=ex3TZdpDsSYq7+bqwwGODG4nVKypcqldjH6y2JiOBwgSvHzdRin1iRUBeKbPbZI9Iq4KJFWPyT8kvbSiR/xXREkvnTNUg49asBlAcZkxlwwTeJM+ecRhhACtyeSA2Etj5jgTfal7sMSZarnoUEEIcgKqVa3X22rQboVdBOoh0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687430; c=relaxed/simple;
	bh=zEnTBTXjr/3Yq3M6DgYn2rlIFOMrPIe3fS/NqzeDWbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPwbx4z0NHQ4FV6YEIEYiJng9XonWitp7MRKDpE+3K6JYU8EpnqIR4f9HAVSb4sWcYzyLUbXeny2enVW6xMdi27/jh5iJcG8KP7lr2mEcKSVlqnqxZEnwnRSJuPvkMqHsRIPQL1oTDDAvrQYC27abt7CUe2ma051HqB8K6BZa/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvtBVMDP; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvtBVMDP"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2c19789f6so1279695ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687428; x=1791292228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soWPGbxjnigdj4iGcVSd7XhV9qnB/30daTVau/x4EZE=;
        b=gvtBVMDPwlTwHMleWBHmCmIJJ1pvWlY50/m1q2mkvK+O7fIGvHCrQ3ksukwQ4veAM+
         EazH0Y7unr9oOUmhO1OjbhASl4CrdBvAp8xWwWy5jdHRu3aOrEMYojIPfE1FsZH3lyN1
         Uytm5bHLwy9NY2uiW4wsbr97CPhe5vJ4S76ddNCWYWlhWzBsuO4rmB7Agq6iNhwSATYS
         5Ga4PFqo2fnr7HPSeiX8jq+nathi8PBC9uQtHkmUJ/FlVt4tN4nCGuay+vG/fKjIuveU
         pp4xHJ81Uf8QYfqOaUEUudsLl4F/gOt5pVecmYj7pwcXTTjrYdo85Cfa4kgxTpyzl3h5
         zWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687428; x=1791292228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soWPGbxjnigdj4iGcVSd7XhV9qnB/30daTVau/x4EZE=;
        b=Wy8/OH5e1tCGRLHV5Wycj+CHjKjdhfEG08JYoeUiargV+GXNgf+yRbWLOaIZXf9cI7
         WHB0LyWHfbE4Ze7MLI5SEafOtFctLpevxLyswAWq3ZKGsigVyoYxX3vD1ihVSp5fPvrW
         Sv2gimZ5vqlYuGydsL6gNLh/PGJwmdyGhezash0ixHtmYEg95Wk6fngTwici4W9lECg1
         lc1xACWTs9fR7juMHzuAZXQ59h/INgCV4LaGlLRJMtwN82harH2/JKyhyPwziw1Xvowa
         FbC3b7JwfomI556FfsSBJxHdl1er2rstb5IazQK8ROLdK/g3uvdKD/DZcZbAuDvJXVew
         Kxlg==
X-Forwarded-Encrypted: i=1; AKwUvBwvppOhO7KGVTVYpaboMRDfDNx8l8qze9R5I4jFkFzLsSfReTqWGcx3tY++v9wuEdL7yOxfLMkbdc2W5Rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdztUgsy5UM39IjYY4gWYmF2FNKYv99QYQZPNgC4tQbRGtAaK2
	cpoT4RKrsAfJSkl9Ybc+08HVxpNb0afbdvuyeDkgjEjfwBaW61thDpEK
X-Gm-Gg: AYBFou1RZFAteO8PiZnqO/cN9uHnh2Rq8BMn6PaJEuflhI7F5uAwAz3W7jO3lBSMDma
	NFz4KjQ526v1V+nDpdSyBM4B40Zs2gL37V765kpSoDAFWR7dSl8hJl719Viwz+rzFbnTMIahgUz
	FriWw3NIrrbKU8DnfttYFAG7DuV3SX0UoA8GjBICUMY4C8Xy7MZ9Z/kJqT7Y2JuGIQ8Gn496dfP
	sIe4jM/JNOAmbEpb+BHg2gKpYXXWlacw0oSz2C0i6HwpiHulgSf8AjfTwNXRGmaV36H5Bplwxkr
	7uJZ9TQGqFPpNwlaPFo2Jmiwcxes80Sg+Is2LPJT6Yug9hI5b8/97glxs9HzPE2L8DO5uTwvIzF
	wiuLlDKdUBkXVdKREz664mqTUWJu6gbEB0ESpgZ2jdO01sCzsn+o0Pg5lOYGbLThz0vNGxVvtNN
	s6MpVEVwJJwg9RndhlPqVZ/boZPjR2hxtxe3eqGeboDtMoQBN/LDu5OFOPlAmAH9xVYvxTUITJK
	stnVgT9371v9bQgCXbi9VwXwAVwujFEX+PCmUt6pJayk0KN7dqX03ru9Q==
X-Received: by 2002:a17:902:e88c:b0:2dd:6cb5:77c with SMTP id d9443c01a7336-2df8e69f277mr176586875ad.2.1790687427998;
        Tue, 29 Sep 2026 06:10:27 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:27 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 0/4] docs/zh_TW: relocate translations to follow the English layout
Date: Tue, 29 Sep 2026 21:10:14 +0800
Message-ID: <20260929131020.266120-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three zh_TW translations still sit where their English originals used
to live, so tools/docs/checktransupdate.py cannot find the originals at
all.  This series moves them, gives each a baseline, and adds the
:Original: fields that were missing, as proposed in the zh_TW scope
discussion:

  https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/

  translation                 moves to                        baseline
  admin-guide/security-bugs   process/security-bugs           44ac5abac86b
  process/magic-number        staging/magic-number            f9a4f4a0e1f5
  dev-tools/gdb-kernel-...    process/debugging/gdb-kernel-.. d5af79c05e93

Each baseline is the English move commit.  checktransupdate.py does not
follow renames, so a commit from before a move is invisible at the new
path and the tool silently falls back to reporting the file as current;
the move commit is the oldest baseline it can use.  Where that hides a
missing change, the commit message records it (6b219431037b for
gdb-kernel-debugging).

Two side effects of the tool reading one "update to commit" line per
commit, which this series does not try to paper over:

 - process/index.rst is touched by the moves and so inherits their
   baseline; the tool now lists five English index commits that the
   recent process series already applied.
 - staging/index.rst and process/debugging/index.rst are new; the latter
   is listed against a592a36e4937, which only drops the index-link
   boilerplate that translations keep anyway.

The fourth relocation named in the proposal, arch/arm/Booting, is one of
the unreachable plain-text files and is removed in a separate series
instead.

This applies on top of v2 of the contact-block cleanup:

  https://lore.kernel.org/linux-doc/20260929115956.229610-1-chenyou910331@gmail.com/

Chen-Yu Yeh (4):
  docs/zh_TW: move security-bugs to process/
  docs/zh_TW: move magic-number to staging/
  docs/zh_TW: move gdb-kernel-debugging to process/debugging/
  docs/zh_TW: add missing :Original: fields

 .../zh_TW/admin-guide/clearing-warn-once.rst  |  2 +
 .../zh_TW/admin-guide/cpu-load.rst            |  2 +
 .../translations/zh_TW/admin-guide/index.rst  |  1 -
 .../translations/zh_TW/arch/index.rst         |  2 +
 .../translations/zh_TW/dev-tools/index.rst    |  1 -
 .../translations/zh_TW/dev-tools/sparse.rst   |  4 +-
 Documentation/translations/zh_TW/index.rst    |  5 +-
 .../debugging}/gdb-kernel-debugging.rst       |  2 +-
 .../zh_TW/process/debugging/index.rst         | 70 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  9 +--
 .../security-bugs.rst                         |  0
 .../translations/zh_TW/staging/index.rst      | 23 ++++++
 .../{process => staging}/magic-number.rst     |  0
 13 files changed, 108 insertions(+), 13 deletions(-)
 rename Documentation/translations/zh_TW/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (99%)
 create mode 100644 Documentation/translations/zh_TW/process/debugging/index.rst
 rename Documentation/translations/zh_TW/{admin-guide => process}/security-bugs.rst (100%)
 create mode 100644 Documentation/translations/zh_TW/staging/index.rst
 rename Documentation/translations/zh_TW/{process => staging}/magic-number.rst (100%)

-- 
2.43.0

