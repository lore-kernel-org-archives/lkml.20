Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443AE47A88D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525186; cv=none; b=MN6YLNPqS1ii/xlkKXxCaUo2MpwO3sOhyn7XyFu332/YNgCoT2ZuPnoVnmxhxiFMBpxvitIeNQV7V41bAbMz8aEvV84InYq+x3MhfRun/wr9kK7NhAUECVXn19iUPt4Zq1iThtchjAviGrchmV4Bx0igUd0HnbdBk5y1hHO8ZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525186; c=relaxed/simple;
	bh=FLyVCOp4rYdKutGF2qRQCBBCAXh4aoVFUu35d5l28ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ap+bbjyQQvYmgnr6lYADLBDckLP1G6Pw/iogj5jIkVLQetySDs7DvVjPOZvrSqtfeNCOy4Q7gdVCi42YAhuXL9n2iWHmN1X/PdrznPqEIMcbU/A+ptOvHgdTg/jhVjAroS8vaL4Af9w5T8Ac8xy5f3k/a/TI62j0G1VnX98ka4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rV7ieb6D; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rV7ieb6D"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1afdf98dfso603646eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525184; x=1789129984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/+8qwuV6tAdbi60XuQ+sgWCDAdZ2vAF4Y5V0PG5yL0=;
        b=rV7ieb6DSDE8wIidusZuJ5l/alQqiseKfmFIsLdfgr3kc47HRpXG6wHcjY2pqBXrny
         PrLrzWRBtaQE81pmvaAZvi7F7J0NASBEOctVljuT8MaRB6eQ2vpRvN8TkslOCDS4vywM
         EfupKQyP6zEkYFdcEkCKpUXuemFCv2/01lIkIks8/TGSer5UfV4QRFaoLvd5TxwO8Eya
         hHxzjN5sLK/RoX24VPhEZpRa0cDXrta0imT1GRTLSSiocdgccXjcsp8gkAN3ggkEeP3z
         mT+VmACVHStvQiLhe0pVSkBZFYV4aPcjgBNe00SrHfznSrpyDU+kmrGO0Q4ZK+MeNOAX
         ZLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525184; x=1789129984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/+8qwuV6tAdbi60XuQ+sgWCDAdZ2vAF4Y5V0PG5yL0=;
        b=FAILkJYYAaAKg5FUPYW7LHQcZh1+rcbVRKNQcU8qm6FHzKVVtO/18Hr0MifVOS5XFY
         TGn0AAn5kh7TEA6vZrmxXmfHvF+nfGd2AyTvFz624CDsjTKF6DckNqYG/H5O20iTs2va
         f24gSngE3+W9JBSrPEKBjukkybXR5KrNyxH/DmRYxHokHtoxpZ3KanvTtrqCEnvuXycy
         yrNY8u0dLgXPeRhVPg8gJ4YEWNC/xipMG+Sfj5ik1AXLi2uMCxSbGQFlyvcAoT7zkag3
         7C3kamsmNdF2Elv+GHebc1gjN4xAmLBK0az1sRTgkp1sgfwttPyZ9DBkhMhAxlA60uZ5
         twPw==
X-Gm-Message-State: AFuF++lTEXJ6G0vfU8guRZdl1CsPrSiXOLeSGstouCPcuYuc1q4O48Lu
	vhwrap7Igpw3U9/Qn+AlvlSFQ826DYb5fiBwu4iFukZk5R9LdoRCZXhqxNo5kVYs01s=
X-Gm-Gg: AYBFou0i/ZxsA0ipPgYR4MpeQgM5w5gWjcu8EFMCd7x1O4wxvs5bm05p25CrWgCBR/D
	HYtKiN4R85ITs8EvzZMiiefi+5NMgfD2ermsQXJdSSM8Ch4HzriUrpdwfEntTrk3QayZ+6gFglO
	s4/qeiVn++gLRvu9t4mDr0ITvdt9pTxDzswITF3IHtHvoNFWiNlw/+ZOe3hCAp8j5fNKnIgz38c
	q3eeHKvF2jPgJ+CkpCzz0C7TPg9X/2JRxNFscxJbBRMvePIOTxPH+8yJ7Y99K/9gWNTww3bkuq/
	VFwni3cbZ9imSC3pxNS8nMwcuQSJ3d7x6Z68r4ViZ0w5lqUPHnoLaGLy5jQhiwcTaDUUTliXXg1
	zGOz65W52lZaw08IYK1hZ3C68kjZr7jTUs2P0uBG+oq4van+Z7J0H7SFhQz71NIQNr/bbguDifV
	AjJRL7aI4yHK3w1Q9STo3cVYKu0RICDwUiHxHq4z1r+eoPEwN+n81dZZNV568EONdbzcJHb4sSt
	iq3gMdPvV92ls8=
X-Received: by 2002:a4a:e904:0:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6b783c603b3mr1847601eaf.49.1788525183981;
        Fri, 04 Sep 2026 05:33:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6343458eec.27.2026.09.04.05.33.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: fix typos in comments
Date: Fri,  4 Sep 2026 18:02:55 +0530
Message-ID: <20260904123300.36778-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
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

Hemanth Selam (2):
  pinctrl: fix typos in comments
  pinctrl: fix typo in log message

 drivers/pinctrl/core.c                | 4 ++--
 drivers/pinctrl/pinconf.c             | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c | 2 +-
 drivers/pinctrl/pinctrl-st.c          | 2 +-
 drivers/pinctrl/pinmux.c              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

