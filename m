Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4747426F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523743; cv=none; b=YVFJYHCXJCu0nF6SSYb6YHewJb0V+DR50C+BebpPzfPdp/JtkE5lf9HI5r/N5R4eFpW1i5PQA3esU2g/ipXJ9P0dExxOQOiGxL1wjlzCeDAnUq1Y+rMIlNBRfHtnPx4l34BUNSKvJTKDnh9482N4Ne58HRIkmMjyzccLK9qm9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523743; c=relaxed/simple;
	bh=2wIHCC6lfaVB9G4CrNQIKsYagU0PTTCyMXq4+hmCpzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BB2Um/2cF+/tqdBa6cXVrdZ/tNi6OvFUy3dvFN0Q9XP80MygR0Imrft50JYkL43T6sdAuogdtpRu9dSq7ga3hjIoriIqrNe3/636VzB/QBlyk5+1qT9Fx7qnnEE6glZC5c/AI1DuDXduuuA5Li6AWPwpdcAoXHgvEismJv9nn3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieCMPTrv; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieCMPTrv"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f5934ba2a5so486275a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523741; x=1789128541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqAMG16H83bb3w/CeilZLNw8QqmD2JhaRj+0C7KQpy4=;
        b=ieCMPTrv6dMSX0MtWPM33cFySg6KVyuoBHLG32WL0iGQHrq1JZMCWSgH2qSOKcYylb
         x/abv3iUerklMLBMaeO5lGGl8mMp22cC0fo8kkmcGJ6oGCeYiX7OiE/faV9X5z65mZ/j
         lXwR9m7fBXYqmohPAb8u4jUG6mp2ZiAZFFNRhBLJQsxNQQy+kpDgEKcqAv4RxbiAGbgt
         RlWwnma9ApQXRQ/3+ymXSwghQ5G9rNzUTkeJ8s9OI+Wg1MPulYhIdbrlVk1hyq5wH+TR
         GUdWqEmU43E28y3RDF54jT703I8zjUItbcIeTB1xrHHjz/P1uliOU8sz736KLyYRyO9Y
         uprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523741; x=1789128541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqAMG16H83bb3w/CeilZLNw8QqmD2JhaRj+0C7KQpy4=;
        b=BXmSvu575gbDBn105GDHb3n7WN2zeP6ooFIh8KSzXn9Z1PQRjdNM1qqRy6uT2gHnWR
         aSQhFCnAIkGNgrhttB34OJ+fIVctd5gS6cy/u4dMqYXj1epPmDaQiK6HvCLqr776MJWv
         OYUivtPngN3hR8VmQmPGleDPUtyTrw1LCELyRRxlqntifghP6zZKoFCHhsFZE3OMBfKW
         5CdsFqD3g9S/r46uk9A53kIrDmSwE154k/aNVdJjaY85mWPOTj2iiR8irozGJfzeWr8f
         mCKB4GPQjvEOe3zZEHBtlaEj2XfMrJ75cJS5v+XrL7vyYVXPyuBKpGTU7NZJEoBmIVMp
         R6rw==
X-Gm-Message-State: AFuF++lyDw9MedTf0KHJ0ljbFN0cSSf7dpcNiBotXOjteUn/KQZawmRe
	ZNGxID3NlfTmMMWg1xDy5VETBAs1vgUJude1zdUuz0GHi56haHIYbrdI5hJHl7CBrIw=
X-Gm-Gg: AYBFou1hNePh5gKs3hxvqQN1V9Dj5pHzlFmccqgxl+WJ/MzzBnaG8q3FA/2kcNvcABB
	mynjepj4K2iKUt16oIBOX9ah+vJzQGIdo+HfnDT3VPj6V3VuoirZeTstlHtFUzkT5BKsZYpAG1l
	s2LHoB7WAuP0JhCEw18w4L0SJyPwV5bnXNCD1IWORAY8qYjzPFWAYT/Z6bO/byRlc96D1eIAMSw
	R0ol15Mnw22YROTROSHOKamsbgEVn/5PL8cd0OxCrl6uM7IpVLaRKJ+PEnn93d+4lPolZwnGmGl
	A2xV06HTeW1HRXLKO8jPQS53zby0RZMFEuPDEGXCD5zW6SRr58R3TsaMWb0MLWli2mBgKcgKwIK
	+S3B8xS/0E5hFIVUpQ2hVplsCK93C8LMeK8Bkqd4xq/1kygoY4mdAnbCz6I/gZD74lMyZEL6MdB
	50MSZOKUMaSz0Ta+bdUFVqBZrhr8D5Bl6Hr63QruqE0kW2D9Lp5v2Mmw6bIqdgPu8kDeWeX8hLc
	rgmhgigulrB1FU/DRdivlb6Pw==
X-Received: by 2002:a05:6820:1501:b0:6b7:8396:f3d0 with SMTP id 006d021491bc7-6b78396f856mr1510354eaf.50.1788523740954;
        Fri, 04 Sep 2026 05:09:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5730826eec.6.2026.09.04.05.08.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:09:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hv: fix typos in comments
Date: Fri,  4 Sep 2026 17:38:53 +0530
Message-ID: <20260904120857.20431-1-hemanth.selam@gmail.com>
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
  hv: fix typo "substract" in comment
  tools/hv: fix typo "retrive" in comment

 drivers/hv/channel.c        | 2 +-
 tools/hv/hv_get_dns_info.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

