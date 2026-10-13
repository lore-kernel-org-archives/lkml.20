Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBA4EB867
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935277; cv=none; b=J8AkAyzuDwn7VooM6AGhlYw5hPsR9FoAc7kAn3Pmb/aNvex+IKXdspEsJj46BK84LR4AHzajwv+iNtNARDmBUxBbQCQNDjs9A4wD+/wnO4JH3+9PG59Ool+7O3mal5hCmuJADnruytM0MLI8UQoick7dOaQDIK/ie1n2EoVmg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935277; c=relaxed/simple;
	bh=Sl/Yw5ftnsaUEJN9h20OVuc2l3Lxetup9py7/z0jkq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLe0Oyy8ktK7jJSAt4cvnyxC1ddS/wd5HAA9pQPQmWqv4bt1F6d5v1kLw32X61sI98teD9CsUISwpa4KDlzJiTd6fBndeWEhFB4deq0fbvIPZ/0fQYcxwn8QiHSq8gCeLDlNQ0W62cnnpLv/Mt6kTuXH3wNOanQ22Bo02nrYmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atr1GOUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atr1GOUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788651F000FF;
	Tue, 13 Oct 2026 23:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791935275;
	bh=5W0YdnUIL3dbZINm0u5mIyw+mP5Lwl2h45DrC619REY=;
	h=From:To:Cc:Subject:Date;
	b=atr1GOUR0Llo+q0e9yMbpNLfPScge1ikNjENoTE+AoApxVmkLzQAP2u+a0zleYpkg
	 KQWeYzpROdzvb06e2f16S25dSNcZu3op8eREYzVv5yh0EzlOQmH59WdAHuDUWk7pLA
	 CAcUJ08T2i3LYmxsJ+iwixU+zj2JgcGEHeFJ9bm4D1NRpTUpbnfqHe/trYpD+ulbLv
	 AbWcqiSRtgqxsiLc7Ow6iVX5JVJvJiQQbkCJvz99eFtfBaockUMs0VnvG/wDIokyk/
	 OWjU1F/qGovaGrpt/LELe3mecvhM7wCkTKMiJB2CKcONS5EjpV6NL6PN+q1xroUWYR
	 gSqekQs2es6Fw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: torvalds@linux-foundation.org
Cc: dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] NIOS2: update for v7.4
Date: Tue, 13 Oct 2026 18:47:53 -0500
Message-ID: <20261013234753.1733745-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_update_for_v7.4

for you to fetch changes up to b963f2345fa20417401c51a69dedb6a58eea33a9:

  nios2: fix __wsum type degradation in csum_fold() (2026-10-13 18:37:54 -0500)

----------------------------------------------------------------
NIOS2: update for v7.4
- Fix __wsum type degradation in csum_fold()

----------------------------------------------------------------
Keith Busch (1):
      nios2: fix __wsum type degradation in csum_fold()

 arch/nios2/include/asm/checksum.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
