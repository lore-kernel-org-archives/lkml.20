Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C61843304D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235204; cv=none; b=sAnHOnXpO6KDuxEztLHUw5L+eCByjCURzhMyBqMkcJ4xEG7Wly032SewqZcCetWf68/hQUvMTkhykSZW8u9SQlUGvewn+Q1ujsg0iVQYtBag58rCDS74KkDTXjJPZiQJ3WaSHoC+yFEucUmrso1TJe/vZXhRhWf2UGHqAw6nwlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235204; c=relaxed/simple;
	bh=xAvTHbBOPFwkj08KU2R2bT3wS6W3Qe60776wqb9ymDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DpLLa5o40rUSDCbc7zKwNUIkRkQseLyp4ZtfQTP4bRaNV+s+w746RRuk5KbimLxIMnAj625ID3mdXO49XjQiW+QmE3RWgsF3WL1PkJZ1JgBBNthqhwfKnG3E3ZJTC23LMemdiISwgPg4pi8QyJGwPkP7UH0hMpeeMCCKrJh9edc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+dr+PLy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+dr+PLy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5FF1F000FF;
	Thu, 24 Sep 2026 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790235203;
	bh=EJpjMTknjAg8m6edUWX7pkcAao0lqt/jwCgbAjXhxuQ=;
	h=From:To:Cc:Subject:Date;
	b=m+dr+PLy9r9acw8UKcqnqXzdbz3e6yLclZOaNz7XkdkjSwCPOFJZXcDvP+iFKZyLF
	 wIihObsdCvYtN9Uwo5LEVTSg3/SIYkfaGSwAIOqFcxiBttzJtwAi7fW2Zmv2vBK2yr
	 BP01sa9zJMufH3Zc8YDHH+bzS7JwSCTHYbgSIes1zQmPqNJETpTL/DaAalemJWFSsv
	 +YkngtOmXhVhqI+GJbjAJ8b0TyQ0efnxr4zetLXQrwP3AzmjJMdwsKVUxbE0a9aVwo
	 pzwDDxEUG3ydgFVGWmtlhsHLQqkqU+3iojEM6u7iGzyZghpCxEyoWVnfaZEbgCXYXX
	 fO6EkZJGyg+nw==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memblock: add missing HugeTLB flag name
Date: Thu, 24 Sep 2026 10:33:07 +0300
Message-ID: <20260924073316.2325178-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

The following changes since commit 6e33dc90df108c76899dc544a42d17adcba61668:

  MAINTAINERS: update memblock tree URLs (2026-09-09 20:28:14 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git tags/fixes-2026-09-24

for you to fetch changes up to ba13f1f32d96d7ce9069ae4f32404ecde8da89c4:

  mm: memblock: add missing HugeTLB flag name (2026-09-15 15:54:35 +0300)

----------------------------------------------------------------
memblock: add missing HugeTLB flag name

Rework of HugeTLB bootmem allocation forgot to add the name for a new
RSV_HUGETLB flag for proper display in debugfs.

Add the flag name now.

----------------------------------------------------------------
Meijing Zhao (1):
      mm: memblock: add missing HugeTLB flag name

 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)
