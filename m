Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE52388391;
	Sun, 11 Oct 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758088; cv=none; b=m8jQpUgCy7xDIPDwKTvog8Ow8G0VkS4i4A/ABiPvoc5+xXCHgI8Y6MH1fbRBuYlGprxpdTUDHBJgjCQhCjbuqdQzYJ/xR+EqkCrmizMgtV4wqEz9uqdYhXXV5RAFBu4G6WAnLEMutLVSFZMul1PfMJ83LxK/pfZdD9clJMF9CtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758088; c=relaxed/simple;
	bh=u/ao0B2b5xaX3iFkFOdgNiYwPdUFUgr1DfOshiHjSfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4VTAeB/z92iqLybC2a0KuRwFylU1SzdP4J3+bybI86UBs0E5t9L8TZbmhSO7Y1fl/DJ/7FNIbJdFqis6Ba2FbUVxw8ekznk6IJxRMk6oZFa30JKLJvq5E/1j7zYbMnjx/bRr3dzOKf2NMRtuIbmVw4C6FnYxTo+E0sq7ay+9po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTh1LdQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTh1LdQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711CA1F0089B;
	Sun, 11 Oct 2026 22:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758087;
	bh=22HBCV0HobnzjPCGXZttgVWX5ppWL/L6CWtVoB6qC6I=;
	h=From:To:Cc:Subject:Date;
	b=UTh1LdQp1zMVTNYHxi73v/9wJ8Luash/zJnry7tShdqGBtD4lnrn/C/y1g+bJ+GGL
	 IBj0+uXa7zJ4qgK6RjO6/mW5kfRdrmvRuN/3cNNkz/sM0uSd4Ntgvi3IxMxVUfNn9K
	 Mfo44XtwMh3sOYfaBfvV1rk8qQ+Aop5a6BK/41kt4aMU9osOmKUB5BBhM18EsqL2PI
	 FFQo20EWkZdohtM141bmMQELF6KQVb1Lkgxafk+f2OteW1/0e104E86vtISu8kVJyi
	 FDFIrlivOF3tIAPHqKeMpR30UW15NPuZLza9VinpkEituWT22j3lpP/e05dV0gpBBm
	 +pHXImUxQsLrQ==
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Michal Nazarewicz <mina86@mina86.com>,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] tools: usb: ffs-test: read the descriptor counts with unaligned accesses
Date: Sun, 11 Oct 2026 18:34:44 -0400
Message-ID: <20261011223445.2328181-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

descs_to_legacy() reads the descriptor counts through a __le32 pointer
taken from a member of a packed struct, which may be unaligned:

  ffs-test.c:235:40: warning: taking address of packed member of 'struct <anonymous>' may result in an unaligned pointer value [-Waddress-of-packed-member]

Walk the counts with a byte pointer and get_unaligned_le32().

Fixes: b9a4274699c69 ("tools: ffs-test: add compatibility code for old kernels")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/usb/ffs-test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
index 22b938fbdfb77..f08060459b3f1 100644
--- a/tools/usb/ffs-test.c
+++ b/tools/usb/ffs-test.c
@@ -232,7 +232,8 @@ static size_t descs_to_legacy(void **legacy, const void *descriptors_v2)
 			const struct usb_functionfs_descs_head_v2 header;
 			const __le32 counts[];
 		} __attribute__((packed)) *const in = descriptors_v2;
-		const __le32 *counts = in->counts;
+		const unsigned char *counts =
+			(const unsigned char *)descriptors_v2 + sizeof(in->header);
 		__u32 flags;
 
 		if (le32_to_cpu(in->header.magic) !=
@@ -252,9 +253,9 @@ static size_t descs_to_legacy(void **legacy, const void *descriptors_v2)
 				break;			\
 			if (length < 4)			\
 				return 0;		\
-			ret = le32_to_cpu(*counts);	\
+			ret = get_unaligned_le32(counts); \
 			length -= 4;			\
-			++counts;			\
+			counts += 4;			\
 		} while (0)
 
 		GET_NEXT_COUNT_IF_FLAG(fs_count, FUNCTIONFS_HAS_FS_DESC);
-- 
2.53.0

