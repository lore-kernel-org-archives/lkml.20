Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974239;
	b=mQxGPD9E6XNLvREq7+V6MSz60SMqj18nPhjtBcsUllEsrL73tnZaNMi2IpQRRWt5ncS9
	 C8em+uXnv1U1p8Ykk7xFzrCOB7UgFsha/JdbviNTaAqLfDEO6wEt8/zRdayPjsKQpr/d8
	 8S5XqmoMprEMgkwuTDKEGP8FYZj13XZPxprjRlFQr/Eix3s20ambL/zSYnTpcb8+qIvFL
	 RGmEnTIHbfzNGBn7j9qssydJOw/jAOk/AjnVs63JRPmJo+gMTQWJVcY7FqnBrkAmOfb1+
	 Z1BeNxG2ug2vg/yt1grE5mMCx9hWyXXb17+Qv79s68zJc0HFuIIIPv0GUUOqULAVOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974239;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=N7nzB2KLuRZYRlbVOXc3Qao54Dq78/8OeGxh0TxfAxY=;
	b=hIbDq90x5eddFWjp/n6f99TMMkIdDDHZbo5c8M5K9r4j1begey3jYMiwllSci4K7HFYh
	 iuRgONDMf3BsPS58AyOT3PM0KR7gJq21UOz3kAgWF82tQYm0EF1Hd+5+qRL1KiMqfTedv
	 Akdbgkhq5G2M6ms9AcbelpHDHQsYvb0PnBwSUKXVgdrJKgSoXAlmItr2yoEZ6oF9JvW64
	 C4qwsj5mz0iDFkpv83O1kq5SrsniDpP3eSgduQh0U0ZGGcG/jPuMCWqjeL/kw2BFtk3by
	 T22GTwsYGI5lNdqSFkOiuRsCRlLq86wDL568TX/lgswvtbBRvD7GXv6z6KhN+VmEeqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLjbuTlq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8712606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLjbuTlq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E1E1F031E1;
	Mon, 26 Oct 2026 00:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792974238;
	bh=N7nzB2KLuRZYRlbVOXc3Qao54Dq78/8OeGxh0TxfAxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jLjbuTlqNsP8WS3AfJmvbRmkSbY3/bhF0hzrQsK3DCmMZqf+oFaoWO7PrdaabJTZI
	 kJEuSi4EhUK2NYCS6epjZyapgZYQqMSQjLUG/8zHEwJMhwhimOS+x0Y2f5gRglkqb5
	 M8yjujt6+dCjv+tWxYkGatMg/hibSiEuVj6xZ+vyzIDItJPGthnQilh7ThUraJp5ia
	 M9JdSEPPSjTxLeXcKfjNa3ILqvFKYD/Fprp8/uBhel4DWh8+roTst9mgYcVPq3sVuv
	 IGStQulby6QtVmjGfYIKKdICTo51AAyfeH4Nfokx1jVtSwHTHOPMeNXeC6u5X6QYTE
	 cozOG2v5IMz1w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH v2 2/2] f2fs: fix to update superblock crc in sanity_check_area_boundary()
Date: Mon, 26 Oct 2026 08:23:50 +0800
Message-ID: <20261026002350.1451587-2-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026002350.1451587-1-chao@kernel.org>
References: <20261026002350.1451587-1-chao@kernel.org>
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

We should update superblock crc along w/ raw_super->segment_count in
sanity_check_area_boundary() if sb_checksum feature is enabled.

Cc: stable@kernel.org
Fixes: d440c52d3151 ("f2fs: support superblock checksum")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- update crc directly in sanity_check_area_boundary rather than calling
f2fs_commit_super() which will access NULL sbi->raw_super.
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b321b9cff351..37d208c6bb53 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4084,6 +4084,12 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 		/* fix in-memory information all the time */
 		raw_super->segment_count = cpu_to_le32((main_end_blkaddr -
 				segment0_blkaddr) >> log_blocks_per_seg);
+		if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
+			__u32 crc = f2fs_crc32(raw_super,
+					offsetof(struct f2fs_super_block, crc));
+
+			raw_super->crc = cpu_to_le32(crc);
+		}
 
 		if (f2fs_readonly(sb) || f2fs_hw_is_readonly(sbi)) {
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
-- 
2.49.0

