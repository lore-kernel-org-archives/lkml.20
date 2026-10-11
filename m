Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0379F360EFF;
	Sun, 11 Oct 2026 23:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791762429; cv=none; b=tkp4MFfU6sAV3WjDS78c466DSoqUYc0lBnby3x+ehxyHBCwhVZokQ4zTift964B8Mmq1tNGlixvT0x6hLCtBMQa+AUbPabtRIsV7RIPU/tlDwziourUyX+QZ01lA8TVgJonsKCKVofmYonBTnnYgH0KSK+btQJdhZO+RGeqmWgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791762429; c=relaxed/simple;
	bh=smF4My75YsoX3L0y/1z0p3xXgiVbIguN0/rT01bFdb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hBa2icrtA7pf+W4lAL+zrF8M3LRq7nJ7fh4Bw2ww0YZGzbsNHIdzS9R2pVwSxuQ58bKLuIYXXZjGcd5vxHvZFmDg5CS5xBpo7KX4iNGdcxmFW5Of4feS2/EJiyp8c34CJ98QXCo4Yj8U0ElP3H5FNsvptYxz249l+SP3SIaBH+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1Egl3Aa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1Egl3Aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470771F0089B;
	Sun, 11 Oct 2026 23:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791762428;
	bh=dHvkjlD7ab7SWdb2nWOQjgI2gwToB9I7IdN4IWc65Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I1Egl3AapXetTOBVoEsWEjugvOBKekPkQpFz8TG5X5fWNfbVROFuVlbX9OU0Iweqk
	 e0c/oCI1ed/FYdnPiQYC0LBGzRXqAvdtv0X47/kKfJT8tdcIbyTeJLdnQTYcOkuDRa
	 AtxwJIjQDg3UlOIF9Jov38LfJlAeaDeZq6qqhFw0bFCdBbtdqWvPp43Er0d/KH+xpp
	 ywrl1eGg+8EPrgvhdVHnUYyTxDkXNu7r9qV76joX4suguhHWm8hAinphrPSz+Vah4D
	 8zjYGzbTi1Z7ITQT7pNiMsObEc05kV2uWXJPlV5yS0eZU06WmsCHv1jeBEu2mjaNKh
	 QyM2IRS7iVNvg==
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Nazarewicz?= <mina86@mina86.com>,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2] tools: usb: ffs-test: read the descriptor counts with unaligned accesses
Date: Sun, 11 Oct 2026 19:47:07 -0400
Message-ID: <20261011234707.2475490-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <lx+m4kkf9bvbpe7f+l7y+7tc@mina86.com>
References: <lx+m4kkf9bvbpe7f+l7y+7tc@mina86.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

descs_to_legacy() reads the descriptor counts through a __le32 pointer
taken from a member of a packed struct, which may be unaligned:

  ffs-test.c:235:40: warning: taking address of packed member of 'struct <anonymous>' may result in an unaligned pointer value [-Waddress-of-packed-member]

Walk the counts with a byte pointer and get_unaligned_le32().

Fixes: b9a4274699c69 ("tools: ffs-test: add compatibility code for old kernels")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Changes in v2:
- Take the byte pointer from in->counts instead of computing it from
  descriptors_v2 (Michał Nazarewicz)
- Link to v1: https://lore.kernel.org/r/20261011223445.2328181-1-sashal@kernel.org

 tools/usb/ffs-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
index 22b938fbdfb77..4453d810e9412 100644
--- a/tools/usb/ffs-test.c
+++ b/tools/usb/ffs-test.c
@@ -232,7 +232,7 @@ static size_t descs_to_legacy(void **legacy, const void *descriptors_v2)
 			const struct usb_functionfs_descs_head_v2 header;
 			const __le32 counts[];
 		} __attribute__((packed)) *const in = descriptors_v2;
-		const __le32 *counts = in->counts;
+		const unsigned char *counts = (const void *)in->counts;
 		__u32 flags;
 
 		if (le32_to_cpu(in->header.magic) !=
@@ -252,9 +252,9 @@ static size_t descs_to_legacy(void **legacy, const void *descriptors_v2)
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

