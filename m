Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815183FBB72
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762881; cv=none; b=AaAVnPiR0Pqym7u5392Yaasv50e8iBV7D7EfIhnlBA/cgdhsXXHLCxg5ww+Tuy5hdhfdXnZ+lc2XnuNIwEHiP6nwEnftVx3AeIfiOx0oLGNDiQkQQWdMb8faSxsBNS1s9Gh9AncROZhnbDE/EGYX4I9V1Smlp+T/qN73OR3ymk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762881; c=relaxed/simple;
	bh=OpnSbiaNVNBKpJLEg0ABVd1AxL35rUOfHxGetiPXgbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KActwchWhx8AdXK5aCG6JOwrLBcBrVrMqQXr/Z4JEYO7O/0CqAK25ufnchFmYg9BoIHiIhOiIm6R9z/InskTb0GC/+WhHHZZ1AlrdxvLHT4JK27nQIYEKWDAN2YHiFnEst3iPuiRRhoTlhOCKfQ4sMoCKrg2gC9EAGcoRBgIoe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuWTDJIj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuWTDJIj"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc149372c14so1477612a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762880; x=1789367680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FSHqSDBVh7M0o7k7e9zq49JGk3OZQQpti1HpuYE3e8=;
        b=OuWTDJIjDjHsO0uHDixv7xwgeXTvuCZX/9G2OXnTZum95ONly/GDbD8wlBewLXOFKH
         R5zTplkc5/tmHnvlSwKDW1rrsPuk5cOB9XviXP54E4t81JcilvgVrMvnLvaoGGFazaYy
         jmb6pFsdndKH5s948i33B2MUbhzfEv0Ux3sPzzXdEn4+utRvYDweczzRhQEdrnQhF1Aq
         JCHDjPq2qlHFfyGDBcyMgrxT206r+UqGyoFC/dPB6+0iDwTFYqsXRqreDyxa7/ovXg72
         3z3xCU+YkMFeY4cvhsOSsfb9qQuNMfig9eafNpRPYaCLrPsjNG5fU8/dPAMuKUI63Lzm
         tQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762880; x=1789367680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FSHqSDBVh7M0o7k7e9zq49JGk3OZQQpti1HpuYE3e8=;
        b=muQ1oBK1gUlZQcSVGByc8P9vh8WGqRCPt8vxDX2zManVnRCK7Z78LQYcSpzqHTncy0
         vT4UeFQlQHsXKPwN9t/p0tO0qEfP5ZVH+wNerc+mkFEFK4TXdQGMwMDze/83x2AzDI3c
         6/NhO73MYb/+f1LWF3gcZwpKvD4z6D3BSQLIsceoeienkQknnjAxRDGPEvIa3mzyyDQT
         9ptUZeZj8C/AIGnRLZ95/ErxdFyGzR/wzpvC2RyEpoWgxmAjnkqV8J1adbTiEDpn5Lqm
         1f7As6T7ps4z1tCa0AeNh+Xj2FTEPIc7GgSB0qsWamiCm0FYCwjF/Bsiuiq+02GkU0/g
         5/EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgARYmgxzSe01aS3V6Xac5ELV1mqWnOZl034RCFtv/o1T4H3znQ+YpoalpfYdAzRt4qbThzWVI4ZkazZw=@vger.kernel.org
X-Gm-Message-State: AFuF++nwrlR9TxEq1XOZ/EZQEovnjeKBJNT+/wyMME13Pb7XhEd/OqcM
	ABoqnZ/+fTFPwTCH7Jvt11gDpV9Drn3lcCNqbBdPzLZdv4OMDfKAJs3i
X-Gm-Gg: AYBFou33UUtEcObUYXG1AygDoEACeu14Jz/1u1RLPTyjVj/ldV2O/+YFNFIvdVTWmQG
	eLHHFWouR6rhqc7M06OFOOy9/va9Oi8qzx7fQhK+TTA5UzJrwyEHHwdtSwC2GBWyi5MuL3LbMAk
	GMcWiVcER8+kiLMnk7sjN7oQY6kwLmUfLZ3Klo+Z1Bx4+OOaDqLOfS/8YWSSScsMEQlCt6+be+5
	IgtOAwgwBVpbjdqt9jgdvPLCRnxquF92tbrGuC5Pw2VnHn7TkzSpNkM2hX7ABbGjKYOaHAPAV6Z
	xN6xBDiu6g7+/XUkayFqN/wD4EH+kUMfD/YOyYl6Vj9VMNjJgzKZKdaobnol5Oa+GHVISCmczCi
	ZV19HFcnbJl389+EL+38fAcC3aBl3Hi24HH+w9vAwJJHl0qTpCIuqbXzqJrdoXuOeIobc9Hv/gr
	I++QE/2uAJtG0VqGb2sWgosHAYo3brtwusj4Hd6EAHX2Jy7cV9Jcw9vD4q1a6jO+HG50FlxdOjv
	Ye+mEtvNwNSYg==
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr33248659a91.2.1788762879664;
        Sun, 06 Sep 2026 23:34:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm27634416c88.15.2026.09.06.23.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <iweiny@kernel.org>
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] nvdimm: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 12:04:32 +0530
Message-ID: <20260907063434.23060-1-hemanth.selam@gmail.com>
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
  nvdimm: fix typos in comments
  tools/testing: fix repeated word 'from' in comment

 drivers/nvdimm/namespace_devs.c  | 2 +-
 include/linux/libnvdimm.h        | 2 +-
 tools/testing/nvdimm/test/nfit.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

