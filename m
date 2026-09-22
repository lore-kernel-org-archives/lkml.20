Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964D54145E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085703; cv=none; b=WoiQnmmbtMFORVXFM/3CXBui8u0lFD5MIInVqu4h2S4NLJmnofHY1GYQHXLmospNRXsIuok/siOGah5tj3VbTmCMVSM/UoPyMTTPVWfaxQW0QU+xGIPJU1RxotHqS+piWLLp4NsXe4Sjc2yyAKGes7KCw1C67uC7nAEKNm6liS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085703; c=relaxed/simple;
	bh=gKwtDte9zvMgmyBzgqZlKVthclakDWqgbi85leO0IDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ss789Rfo87xHXcYLSJuLI9o0I3KqwYtWNg8SbUC00VuSv4D3xbjhrhH105Jp1facKslxoArcCYmWEddhN9NaN33zkdCaQFBMjLKzjR5srcs4VWKSzzbZPo2CKPFh7zm4Pm+KqS/RYos4TAi+sm/pXmNdWLbVkwNU7dF+rdBXJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdR6ta6M; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdR6ta6M"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a34908so3737195b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790085701; x=1790690501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8T6DvjDBkSfK8G3hicyPZKHJqkMgbVY19qfQX+Rc8Y=;
        b=bdR6ta6MFL2WmLi3RWkGtJG66mXrP1U7NbjknR0WrSkwfpxo9FD/uu9F5zY7uysRvG
         zgsyM63sX8doDiNZ35GvwxJHhDhqkhtNGJpbrWiHu3RglWoRHdvjYibTmOZ3o+9Gp22b
         e+kKajsGmAJQpYZGw6P5FkUBIj04ba4kNpRY3gsYRR5uuGf+hMQNn72WUSJj0ruXSqFf
         U5g7yKDhHKegWNiAKI2afItBVtpG67J6ZGXde4pBRoodqwenLQasDzmVYV43TeoGJIUQ
         rCHVvLIDix4iAPLSiTaTb8inIPzxhBYvVDuLvHFgCCY6FjlFTMTJ1OUBbNuwfUzIJTfJ
         xcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085701; x=1790690501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8T6DvjDBkSfK8G3hicyPZKHJqkMgbVY19qfQX+Rc8Y=;
        b=Lo3DB4vo1QOziYv8bwEy7rRHgWFvoL/khTWcneL8lOmlzZTWqkjRDh3cy8v2oQNTwf
         iY48mOPAqA3ZuK4uwJaibSuH4VyRulezGUt8kvkU9tEJlAU2DwK9H6U/7n6n6f5NJ/0M
         BQ4Ar22gCELwZGK+cd0mFNWmObco2YHl9KL+PgY0U4PfGxKl4OMtunOa1MoeKVQAwiWW
         zmSpYWCNp4H6FOz1sKPL6PAPWzmpamQfwfOtnjX7baLlRuUVGLVTe+J0hX1E2MGYlhGJ
         IM0Wk5x9Tw+hSByh+VUcfC7QMyI7ypfFG7zKNjLK7YMo3UbepAqyTL1AojNbxSBxZSv1
         jl8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfFAwHu9njPaqmW+1XSfGjGtxtK6lxgdGrf+lzi0m0ec2Kmo+98B0RJxiVSvE1dLN1ImsQMX4IJcFXkLg=@vger.kernel.org
X-Gm-Message-State: AFuF++k74F+YMPjhoZpem5X0pAwraRSXm611bJeE1DEGfB7WRiNZBFSZ
	8eiqVRepTgs7YMXTlFYrLlkuhV0+Svh6baxKaIif1GbUbdjv3LNFcs6T
X-Gm-Gg: AYBFou0mOCo3h1yg2MdCNf7RYSip7Z2vZTGKSb9po4WTwfKTphG1cPaEEAnIy2Fnb2Z
	7rDrFR/ahcxx+APLHNmt67R2XAG7fVHjaVUF+BbndM5YpXHWaFlCVYotBYSSS/IWvRg60XnlQDq
	STYy62Cl82kNK7PDzXgaULmw91oViuwspc3pKjWMRV0xQHXlaBvJjQNIwy3wG+FvUkk46h25cTB
	+WfeNfleoRWQMSFW5EGwYnVDmRPSlQNAyHZ/crxex8/3jrRiR6kUM1XITIWU1Sv9C+wy0mqplQm
	KTx8q/GAAyTcsMjCPrDZLiPzASAcqjMu56wQ8goximl/zD1C127avNxJgS5Z1cxqof4wFrTmIrK
	X0q3dNuDkO9epioTBNlOSl/12fuVQFv4XwJvapy+0gAzLriaqYUKPa1dARlkUD0ICShQxq+rVsz
	oVMfTLpwMeTHlaSw8rplGNvT8jUSUIzYCbUMEE4DlKfZHDI8JAH0a7ERQipPWwaTknUCtMoT32O
	wL8wcar5rAQwrLiOTr8g5Z4vPXrX8qvV74Apba7fqmQjrmoto5BcxJ3rYxlAVxR5Q6vf0wIT1ZI
	QNen5MNKlV24xHdL5rH4qW4L/U+9YJQ3fCtfPner7LmoHg9b+3ct5o6z+T9Ik++vB+xb9jygA3n
	lKKL0W2aE
X-Received: by 2002:a05:6a00:992:b0:857:7337:5db8 with SMTP id d2e1a72fcca58-87c824a7f8fmr1500101b3a.22.1790085700828;
        Tue, 22 Sep 2026 07:01:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c329c813fsm932803b3a.38.2026.09.22.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:01:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	Yichong Chen <chenyichong@uniontech.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] isofs: simplify the level 3 directory record walk
Date: Tue, 22 Sep 2026 22:01:35 +0800
Message-ID: <20260922140137.1768064-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You mentioned isofs_read_level3_size() deserves the same treatment as
commit b2eb2e288604, so here it is: validate every record with
isofs_dir_record_valid() first, then drop the straddling-record
reassembly and the scratch buffer it needed.

The one thing to watch is that the code being removed did two jobs.  It
ran on "offset >= bufsize", so as well as reassembling a straddling
record it advanced the block for a record ending exactly at the end of
one.  Only the first job is dead now, so I folded the second into the
zero-length check, the way you did in bda8d8d49ca1 ("isofs: Fix
handling of directories with tight blocks").

I left isofs_read_inode() alone.  Its condition is
"offset + de_len > bufsize", so it only ever reassembled and never did
the block advance.  Cleaning that one up is a separate patch.

Both patches touch only fs/isofs/inode.c, so they apply on top of
bda8d8d49ca1, and they list the same entries on every image I tested.

I ran bda8d8d49ca1 on its own against them too.  Entries listed,
driving fs/isofs from a userspace harness:

  image                                     before  bda8d8d49ca1
  xorrisofs -iso-level 1, 65 files              46            65
  same, one boundary record marked assoc        45            64
  Debian 13.7.0 amd64 DVD-1 (directories)     9340          9460
  Joliet, Rock Ridge + Joliet                    2             2

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>

Unrelated, and only because you are a VFS maintainer.  Two regressions
I have chased this month were introduced by patches sent to
linux-fsdevel without a linux-kernel copy, and linux-fsdevel is not
among the lists Sashiko monitors, so it never saw either of them.
Enabling it for the list was proposed in July and seems to have
stalled.

For what it's worth, I'm in favour of adding Sashiko reviews.  Sashiko
ain't perfect, but I find its signal-to-noise ratio good enough to be a
net positive.  In fact I find it useful enough that I often run it
locally before sending patches out, despite the high token costs.

Matthias Goergens (2):
  isofs: validate directory records in isofs_read_level3_size()
  isofs: drop support for level 3 records straddling blocks

 fs/isofs/inode.c | 44 +++++++++++++-------------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)


base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0

