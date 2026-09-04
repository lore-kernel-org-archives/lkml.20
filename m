Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAA3822A5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524460; cv=none; b=Sns+kyW784JhSGH232HA+o16APg9a3Wm3m4IW3iMU/a5aq4SOtJvtAl4WPhrUylbF7ppMndDFkvMd7r/u6jlMY91goWOTECaiPX9en1vW0JFonykkUlwOteLv6lb5LSEVnQczWH+JXqD8q24P4eMVrUMuqAsW/gWn/iO95eSFRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524460; c=relaxed/simple;
	bh=8z+lbWZ2jAzsJEnQ4mSdxQEwIENuMEl0Uo5fVHDZnYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EhRqbqi+ydE3gtlgKUTzopc9FtUEUxMforVOw+77Ge7EnD5dd/EP1GGVaX5KRZ2OLZ97jGefDAb7kfgByoEinODPBXXZFXR05mUyT2MkvSYHSXIUAvMAyI3Y+mQ7Pukn35BERGzieK4vWh9Ajno6GSSFsxBv3pslrj0MC7/Hip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzfRoW9l; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzfRoW9l"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f5934ba2a5so495113a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524458; x=1789129258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLAYLSQyY5MDmz4PXi35L4is7o6KV1DawD2J+TcU3ww=;
        b=JzfRoW9lbY2fqTTo4N2v+vVcQzhWRlV4AzkJi6c+VJ6PCDJmsoN48onfZZLhVw4uWJ
         oefe0HbQ65g9vG+hc8XLBPPoSyRa73J8/I4v+BEZqLp4+GsNWfnOznM16DsJ+tw64KYM
         DP2Sbe1jQxsqEWKMwRZS6lZvuVhZdXNDbdDzl/vy94nOM7/SY6Pr/usIAgjiCbjbeCr+
         sscWKsxfIVERpEiBEEwGQDh5PIrG96s5RDYJTIPiavHzYwbgHrg2Bv/b0GohoZk0xGe6
         xtYpwyhLt+y9hlQwCThbvpKzliVqTNI0A5BHy4wqC+SWzUiqm/m9c7tbhvPI0QnsGf6U
         zS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524458; x=1789129258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLAYLSQyY5MDmz4PXi35L4is7o6KV1DawD2J+TcU3ww=;
        b=NijkdXoKTIXZYE6W3j+iKEpCS8rNJwN9tP8hM+ieHsJJ96Q6vmH3bw5/w9+3sBmfOC
         yRnOZakp+RQrQYftr7cyQWC2h2r85+p4JUny1bknypTVTjTRvWAt0vy3GtZA7hjikjM3
         hNTNceLXsG9mUcvt6S7avDM1SI7l6G6iNcbKRnNFgdsMyXqUjNh5Q40mWOHlxEEDq9cA
         kaapby/mYvalvTUoMBn01AZhqWRt9swMC0PnH2agVvU97NrcY2oyV0p0hRYNk9mV5ydk
         7MjU3Yqjxub+cfbwlzzcEMChHipij5Y3H+hE/gULdkVjHMHcg2lGgVFfOY3NSdhMhhV5
         1zIQ==
X-Gm-Message-State: AFuF++nwWZ4ZCVt3SxGKhoU+7p2veQQ20XrLPYugZ11B6L9aqlIZUXVX
	SyerVkQnA0rML7eC/qZFGgcq1AanfDvlBb5Fw+yEzy0ODUY2lb3556nTU5fUi1mJAx0=
X-Gm-Gg: AYBFou2dsFioQ/ouZ9c+euTKDUCFZSmOfG/dsXeWGsZB78XO6M0/BIafRQjdooNohUt
	25cLpsccUj0gR6jq5h8BxJSqmMHQLyZIuTWqBXBJ64UUmG5sUY9LGpxo1FG4JGhIl92PKzaoOcW
	CNsqDgK3x516b92uy2hw7txRe5tWfTr94ODIGdELHedDBBDAIZZc/mdK8KxMz9CBm48fdBbcTUW
	xGNQkmsxq+Ztm0web9G8BzkJgh2II03KnrroF0Fgm9E5oIe+YH3StJTzYzO2fWgtuTxCHurbwei
	NEaTjB3q/vuVIkhGT+anbgqcEJUbH62goF0E8So1Dq8TNcoYPnSIzPLzXkWTFaRBtcoLSMoJ4lz
	Md47zs6J6T21loZOgWJn5S3Vzfk6VjKZfzgbXcomqDiaivaBb1ena2dzQPKKY+gn5wlO/s/HCDE
	QdENnv64CcE8znYaZZc/I/KRX0fC+SBcCQQ9cAVuCRXIMbbLn4R7eNEfz6vGgNmzgfl72Aas5B+
	6MjOqzRrKIKamM=
X-Received: by 2002:a05:6820:2217:b0:6b7:8396:f3c3 with SMTP id 006d021491bc7-6b78396f8dcmr1430933eaf.37.1788524458264;
        Fri, 04 Sep 2026 05:20:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm7116019eec.21.2026.09.04.05.20.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:20:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] elf: fix typos in comments
Date: Fri,  4 Sep 2026 17:50:49 +0530
Message-ID: <20260904122054.28531-1-hemanth.selam@gmail.com>
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
  elf: fix typo "accomodate" in comment
  seccomp: fix typo "overriden" in comment
  kernel: fix typo "overriden" in comment

 include/uapi/linux/elf.h     | 2 +-
 include/uapi/linux/seccomp.h | 2 +-
 kernel/fork.c                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

