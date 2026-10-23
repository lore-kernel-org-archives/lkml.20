Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758926;
	b=z1V6Vl+LZrFTk6dG9NyGxHDz1dmr0Uua2Jk2OQrUcvCHL/ZHeu/XCMbBqGwnfNm5W4so
	 Vbx3GWHenmNSS1asx8scJAK89+UhJHqaUjjPQeQzziASkM4gZEYZytjvKnOxhqEhOtPf0
	 k7U7UQqfRsmpyLfoThq5Oml5NHnYv61tfS71zy0WRs4J90bCsbeT0rQZvd3ccPKyXZTsN
	 mLaGYly+7sJ1oQu9ArgGnrPY7Sscj0xoxb7OZtFh+ydIbk28oOE7t6dlpp7G9STJivhue
	 ppoJvBqyqaUjLgnJKO0H1oU7hPiiJXmEefQbJhk9d3TkFBGXj7O5jejMs11nl3B6sXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758926;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=spOSuW5P2q6xG0pxXVZvFLkoEd4KzyUD5oh7Qd+Zw3M=;
	b=bRkyRjIhfot7AVgFZDhcVAnBjaUfF3RmzYk6PUm3/pnCsz0xdfgxRHSsI/HkMZlImm4V
	 FBd9UmdNr6LgdxE6xQHbA6kCHr/7p/xTUVkd7IenerlMOVvKXQvnn3PeoEQSBszndX+AX
	 JD5vQ9OdVu44C5aaHyc4qVy44hlv8BD9LTsO6mQ64j+UHoRBEnwPQOGIfRqqCM6bFq4YU
	 PWEzvrg6RHTCCm11R/z868awsst/CSWKR2Jt+gXpJlb6wpdOBwb4Pj3I9l82N/Lo627MD
	 0YlCyn/UyQvTPi9ISf13szbviyA0/7h2A6TZrWvqW3jojlz3p9fTk0PS5dB7BD0xiHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JylwvKDt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C4606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JylwvKDt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950231F031E1;
	Fri, 23 Oct 2026 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758925;
	bh=spOSuW5P2q6xG0pxXVZvFLkoEd4KzyUD5oh7Qd+Zw3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JylwvKDtOuXmgZ0xoyROdETXUBSW7G+tATPy/OgCUwr9iTryqhiFwJpg7/fdS2fgQ
	 Nhq74DONcSOCpCaXJ4Ey/XwSW09z3kkjDglHgnlsY4ZpsfC0gxe17VsZZQ6GSVV7Wo
	 LsiMPQ02+h7UuXg2xyUAgn4KKxIuqoDPo8cjjnFZc7MxS+xVoKfw/7Mpgfrp/Jre33
	 Yj8e9p/hhhvnwGbT+cjYGmaqkJgTY0brz2L7TqSV/nx0xuZ3mCrljanvbEfWhgHV3s
	 Q3xrQLRsSPgiwcIjXS9F7hT5mSIUjMcyNEdYvs8iYrlCepwSK4ejt06ly1vLQ2teLt
	 syUXlwFaKzKWw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 2/2] f2fs: fix to call f2fs_commit_super() correctly
Date: Fri, 23 Oct 2026 20:35:18 +0800
Message-ID: <20261023123518.504064-2-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261023123518.504064-1-chao@kernel.org>
References: <20261023123518.504064-1-chao@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch fixes the bug reported by Sashiko:

We should call f2fs_commit_super() instead of __f2fs_commit_super() in
sanity_check_area_boundary() to update chksum valud along w/
raw_super->segment_count.

Cc: stable@kernel.org
Fixes: d440c52d3151 ("f2fs: support superblock checksum")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b321b9cff351..da1e4bc8a64f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4090,12 +4090,12 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			res = "internally";
 		} else {
 			/*
-			 * __f2fs_commit_super() will access log_blocksize
+			 * f2fs_commit_super() will access log_blocksize
 			 * in SECTOR_FROM_BLOCK(), init it in advance.
 			 */
 			sbi->log_blocksize =
 				le32_to_cpu(raw_super->log_blocksize);
-			err = __f2fs_commit_super(sbi, folio, index, false);
+			err = f2fs_commit_super(sbi, false);
 			res = err ? "failed" : "done";
 		}
 		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%llu) block(%u)",
-- 
2.49.0

