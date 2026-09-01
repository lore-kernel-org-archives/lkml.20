Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247363563FB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225665; cv=none; b=r9I8/lxtxzcekBIY9FePGMoPGG0+UU4D6HEa8bDadSKMQu7ExcRr8aC6qfgSjJT3nCYDHkXltWiI64cDLBwLkKGjKmb23w0gYXvD9zB5kvixE2pmRXBBHQl+q7bmx+zGrYRNGCq2PLxTnKdfZ02gp4zzh12Ax3czMB7WO9RV8Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225665; c=relaxed/simple;
	bh=3M73LwHlIbAmdAX55ek9s3qJdStgcANbGSEpJiIZbG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=il21b7cOm7lwi2f2kzbN6wErTFEfCWc65taWKPn1AbgLkIPqglEm29hHe6Rq3Yd629Zv3W2srDzZkXVw/wvBUEVDjIerYJjKic0DIKXPwSKp9LLInT1cI/7e/kj/11OlFQCKAYTylQ/0zLl5f2gk0vGZOecaFba1nFnGf0/GXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPUgTwJi; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPUgTwJi"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso5075175a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788225663; x=1788830463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTmlGIyIWbMG/g0r7aBMDjsD8OZ6wSBjrj4mI5wQmow=;
        b=TPUgTwJi3bWdLkKULcLNCunFDsOQzm+6hiYkC6XayDASJZ6Q9cYZbiYgsqggy/cNP+
         lV7pcvnNg5aXQA4CV2jD+ITUhX+z6ZYZaNACp/uhI4F3inEM3vECLpmGRBbcL0TThq5P
         rqpZFLgUqPbwDNlksI1rcQ0K0VT3EbP+WuG3wGBgjoxOVM4CHQcGsHfyRIZ7kMxVnVq2
         NX+OUjoIh9x6pE54lsRBpVfd+Vqt+mhlVQVqtNLHg40F/lvd38wLn37FdUaYMXnI93nZ
         55DQAGDHH34gfXVQu3Aa7ke+NPnpD9WEEXzdbM+M9RuhzTnlVwabgGR34SfmEAfhewzP
         R3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225663; x=1788830463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTmlGIyIWbMG/g0r7aBMDjsD8OZ6wSBjrj4mI5wQmow=;
        b=Q5fW0hzw0kjK3wprRTq5w7Tun2s8ylEukm9v9tVWGIokTSawRUk9UbZWZQUo6JytDF
         QXvySNjl2lEVQEl0/OvPFf40HVv+7nAz9jLAoDjWWGTIZHptiwVnywwytKPbVcoto+4D
         U/4O4SbbC6M1Q/jT4aKBJ5ypYxjyZcdceNYC2KXcor027bip8Sg+cx9+4bLiNwyHeq/V
         DUEIjIyekKJ7o//rasqUvD9e8xxCs52y7XIt+iK2iSFmJJq8sitmOJx8rjrIcKOPOeF2
         wVKELcbgYPaUlJXs0i0oITm4KOPBZJT6ai1wh0udl71GmL+Wbgzwc7xKguA6elWQBtoc
         5+mw==
X-Forwarded-Encrypted: i=1; AKwUvBwMWYzwifrjlk927t2vrxwzPyF/KDPGWdHRkiCHSDw9O45feLZYvBUDRnhVAumlsm0TaYSYtdbY+mlHBz8=@vger.kernel.org
X-Gm-Message-State: AFuF++k9qZgJz6IeAxrKL26wc8m8kcbYrmh4WTUIef6RqhRlc+gXsSV1
	l+MbEcs73ByZTdjMFnpvd5Ng1aQT9LDJUYtmlPEIMlvy5hjp/HX5supo
X-Gm-Gg: AYBFou06UV8TmJlLRptuDEaOynZ8bylkAsfDMMBim3+Cio07MTg0Aq+BdQQ6mwQgtkO
	as79c2DyGvXul0VwChMgkySdjd5JoNUlbrwwF/8o1GRz30rptrwgTSl66wjzqsxn2/UU4LonUHj
	Pf+pz9LkehjQ4uudIm0HSITiGUsU8oTZjLwuGe3uIUtsAvrzta5BGs5XfPHfmB6bfhhWgTwk96p
	T9l17AnleEbSHtpBxr8RmPy76HlO+81W07Za1CfwRCFyAk7BeMmvbPuKdtVnF3xTemXq3DKKPzj
	AKOQH5oa4JIxB0KZs1QEE50xQ7tT7u+pNsFqMty7cOOPh8cAAmFpxrdBfHjimV0rkG/1hJNm1XL
	QOhV8yabS3vuAOWi70qgX3tk1g3qDKMltIDQ5IH70f2jVtMwUJ9TwdkPd7cuzcjdmSIrfoHr8u+
	7SajVVrrt6MUwxKtXvYWFVHxkwMahILlrFrICKHbwgRrhZqUqNMtxueFhD6CbN+63GlQ==
X-Received: by 2002:a17:90b:3c48:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39907ed3bcdmr6440498a91.25.1788225663180;
        Mon, 31 Aug 2026 18:21:03 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm38316713eec.14.2026.08.31.18.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:21:02 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2] f2fs: avoid underflow when counting free NIDs
Date: Mon, 31 Aug 2026 18:21:01 -0700
Message-ID: <20260901012101.242104-1-zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9134210e-8ce6-4b74-bc25-af024aabeb75@kernel.org>
References: <9134210e-8ce6-4b74-bc25-af024aabeb75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__count_free_nids() subtracts the retention threshold before checking
whether the cached count exceeds it. The operands are unsigned, so a
smaller cache wraps before the result is assigned to long.

The PAGE_SIZE-derived threshold happens to make this an unsigned long
subtraction, whose wrapped result becomes negative when converted to
long by supported toolchains. Do not rely on operand width or
unsigned-to-signed conversion. Compare values before subtracting.

Fixes: 1b38dc8e74a3 ("f2fs: shrink nat_cache entries")
Fixes: 02110a4fd531 ("f2fs: avoid casted negative value as shrink count")
Cc: stable@kernel.org
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
Changes since v1:
- add the Fixes and stable Cc trailers suggested by Chao
- carry Chao's Reviewed-by
- resend as a standalone patch through direct SMTP because the v1 list copy
  was corrupted by mail transport line wrapping

v1: https://lore.kernel.org/linux-f2fs-devel/CAH=xXfG2Hzc-kNAPqEUsTJ4hwrQ-gYEnFrXHGxL7qpYpggkLUQ@mail.gmail.com/
---
 fs/f2fs/shrinker.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 4f6bf5926de4..1fd0ee4f89a9 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -23,9 +23,10 @@ static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 
 static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nid_cnt[FREE_NID] - MAX_FREE_NIDS;
+	unsigned long count = NM_I(sbi)->nid_cnt[FREE_NID];
+	unsigned long max = MAX_FREE_NIDS;
 
-	return count > 0 ? count : 0;
+	return count > max ? count - max : 0;
 }
 
 static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,

base-commit: c966d29e01bbf829f8bb4a39a49811c56cdb49c3
-- 
2.53.0
