Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9C423E98
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522729; cv=none; b=jfMeuUkQGw5jrODCC//a664vcyahTPK+mkGdrQ9DBGBiRQhhZPdSCWw0rjdJSHxA28udKLq/smdoGDmEuyBlShjzJhyw4w7wCdNTb8Ao5wp8UVyCtEOtACWgSHLWNpvP+Y0Bbzi5g1ZU5Km+y6P2wnwhTjuEEyRLiBWFSREegiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522729; c=relaxed/simple;
	bh=2bEd0VWER9OCRbCqCuhBoxjgnfTq09SQrpZgQFln+1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYAEFmmWswdhqonTwl18R8A5HQdo15bZN9lqpk80IIni4Se5VlcbTbngrFLmg4nXHZA9OdnM2Txnsft5fqsHCODzQ4kbZoEXakl6Wvjk6mSB2TZ0xZe2SGwaxQJ1AzSaFx+hVfP6C86EGOBXO5JOXhOA3qssrGtbsOqS9Oz0Kco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfynDyYz; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfynDyYz"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f4e596e393so964891a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522727; x=1789127527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVB7KkHGLe75QYdoO6f/5WdhETGWTu9GDMAdodMlBfY=;
        b=pfynDyYzTJwVpv2XGNyl/JUwjWSvpo362CDqeBPhWrsx1EXKlV9YKUDRqmwxe876E1
         m27tOIl6zN57gqq1ezn40ohr9oh54JG7u09JADjlUoLaOhfNhGwmBiGt3qrJ12KriEzA
         0hZfoUBZykjHwzzJRileFGYlFaT4Yj1WilVxBg9oOLiFeOZT5zRbFtmwj5YXS+oxagpk
         LLEWX2OZiDan+EyKRQLvtG29VU4EF5VTFg62hjAlCM6wkfmV4rvh43hkxomwCvKZMOeL
         KvItnSrhsJCPwg/q1QORpBQH1QisaIU35W1qbOvMrb9mv3Emkx4ldbuMDAjn7tN5YNky
         PKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522727; x=1789127527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVB7KkHGLe75QYdoO6f/5WdhETGWTu9GDMAdodMlBfY=;
        b=hItdB8n6Z15323PhnHIF2OmKFKEG33tFdQ4DaWOsO/kG3+WEKACyQX0Vaizmtk3mdY
         Ffuevi2ZNyJ0mI9255NI0DJcJ8OXWlS2VvmN5G3Q/pl6ZRgxnnXNJXFf6nFrSezV4i06
         2B8JTPMeTs7eTZ97gV7cobix5+WS8tXMWtfapnLAzB01VhJDPNsEI8KAoTKS/l9TJ3Z8
         291/OHf8wJVT5XhQbLmc8HeMU61VVcNWAXZZ4JB4RphM5b0Qn6aKOvdA/HaDL/pew1X1
         CdpXXSM1M4nb2UUaRgh8qOVOPfnk+sUaBwLGurayvX21Lxz9p7j3g9TsE9jG+XMzGqa6
         nJsg==
X-Gm-Message-State: AFuF++mrHZZAHecArYw9+kCpo50bb8tqmyetMn99WJ44IRcNqmJcv957
	Z2OLC5UxmnSeIdYZYAVLkEEUzlOoNB04hYaj0q3Cg4yt/oDJwtMRBaqnMmWIkpOE1X8=
X-Gm-Gg: AYBFou1cTq8hVICEZaihQkvlrHCu3G9EaihBVfTxATWJKJtDiXdEa8YrmPy8wRga+ub
	EHuIFAbGU+PJFu3PgvX8+MVI7ys2a3BxQbrY0udt7BE4qi+J/f55evpyqmH3WfJJWADLTuCfkoq
	vdr8olnuE9TlLccqPRo/r3gmrGwkmn11xJec34pQMDHpwbsdoiu72J8/DtmHgx4kv5ar7FWoaDY
	nAKbHS8hshka8SkDo2Qns52X+fihJgVLGel5J684FvWrToYL3+JP9AnqyTfP59OtbQ2WAmc/chN
	b2jwDFiP/y1dKctpcE9Npx37ozymJgJ2USoOjp84NTGACs9c731u+QBvdxKQvLKU9DKOORhc8M0
	1yaIEawaqly+amc0y19677WS+cKG7XyKVMJSL0X+Q+5UxGEHYsdGQdLoq2yGORvWetxNUXdnYO/
	7l2jad5rWJez2sBqsIr+n1S6Mu1/bEetx+5WTmP1a1X5mplxT2iIn19DhZnWGE9b7HkWX9l4aY3
	I/pdA0lNTQwjeg=
X-Received: by 2002:a05:6820:810c:b0:6b3:f4b8:bb86 with SMTP id 006d021491bc7-6b6fbcd0911mr4019537eaf.22.1788522726646;
        Fri, 04 Sep 2026 04:52:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6162943c88.13.2026.09.04.04.52.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:52:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] btrfs: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:21:58 +0530
Message-ID: <20260904115202.7113-1-hemanth.selam@gmail.com>
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
  btrfs: fix typos in comments
  btrfs: fix repeated words in comments

 fs/btrfs/block-group.h          | 2 +-
 fs/btrfs/raid56.c               | 4 ++--
 fs/btrfs/send.c                 | 2 +-
 include/uapi/linux/btrfs_tree.h | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

