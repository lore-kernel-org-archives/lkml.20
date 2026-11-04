Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797358;
	b=Encau8XQ3YpuQY8dVWU23gBLMyNtiKQVBKD2VRfK+9kE7JXZ4UFFHmcucj3rqyrgK6p7
	 snCV7vLdF6BoiWf6jVsY2T1CR5QGyv1zyBrQyZg0FTDtwpoceZfTC5i/xcr1uZB37SJNV
	 9coVBr7kCfYPmpouPEMqSaTo3IwpbjgLFp+8f+l3Xy2mBH85oy6fnn8V8ho4pI0pzVItg
	 uYzquLc0b9TcyQ5E0SoCh6guqTVbll5OKN80dVxn7vJ2HgY+9gfqPIuSX2xDChuf7BPWp
	 pOT6DgOplRuxUFQ1HX1/8gxOm2Ajg6R00UzqKLhiDDzwkgPecGN/SUCI4oSXZ1r3RSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797358;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vv/svtPtjalr0x/FT//NZi3aKSPK9q9fUmUPJz1NOWY=;
	b=QzJR7+pGiQba6WxZh6Nl0Ev7nSpR4JJ3If6Fs21EKOisZb9fzh1zlW0bBuzK+JeTfunf
	 Emm4BQBR4MNMC+chQr1qcn5B/rNgW8aFXeUozycivwDFuDOAyX3opCuvZOtA9Qq9T7+Ze
	 NHua82x/Hz1U7DsyIaAH/89we1jwFFwZt2qjD2OPTRq22168pseDh7BHxQNfXjdZVQerr
	 OXS8W2dbGYCecwvoKST5jbeozLbDI45YKR1eI9AOolJgiXFEkU33I38sT/iNQeK5U0J/z
	 Kz9VVBddtxqFxiAu8uXd5Q6425ymly0TJwtUkdezYm78LiW7o8cHRYWoqsS0+aupgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwe1XZF2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C15606D824
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwe1XZF2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC211F00A1F;
	Wed,  4 Nov 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797357;
	bh=vv/svtPtjalr0x/FT//NZi3aKSPK9q9fUmUPJz1NOWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cwe1XZF2Hj97aFpbAkbqXX59qrokr6MMw1S0oG+urbvq6qHX1VxekYbhL19OlaMhH
	 rm2M8XfRX9xV/SEu471kUy6JiMCy+RlAJq9KXEUU0/uqEVtLsSNlXd0maDUlh1GKmv
	 SIKyrSB47g7BAiV1D593X6389jFeJ6K+vyc867MFAx1rUsbnjcBcNWRkj2h4sn3Ht7
	 zxvUQHOEe+xpVgacYIUbjtf6gCg6meghk9+tDITxkLiCbYtZycZcAiQ9cOtfzhJxds
	 RiulOfQ9giVta8jtPNOXd1b+WpC9k3Vk/4qq9QdudDBb7aitkAeJpAAZtS2FzlyUYF
	 eqEWSJo4ccGWg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id AD0181980054;
	Wed,  4 Nov 2026 08:02:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 04 Nov 2026 08:02:33 -0500
X-ME-Sender: <xms:5SzranlD4yipwHC67kSzCjVzioSdAt_fcuUh4HelGAp02GkQoL3Y2w>
    <xme:5SzragGEy28L1f8IFaQJlveL3NzbUnlO38CjP_62tN-ZFd4nTs821CzHdsHhbhC5n
    fPKngmn38l7BPTugr6HDYcKwPO5vc-qrnUHR0clv3cUeELR46zt9Y25>
X-ME-Received: <xmr:5SzragRqeCVmQ5RWjKdrZaaqIIKLKEp75DJxBBjoVGJjQmoocJBUUa8G-Ok>
X-ME-Proxy-Cause: dmFkZTGcnWxWNdwzviArTqwO8SleswujEAoF3G5cAnzgWuj9VIXYzVn8L/YtSSoCVpDQCx
    AFAjkaMBKJDECegKseyQPi3BoJ2ULdzgEWHQh0kOOdV3qcZ96T5qYw8zvnYBduU6y+7gOl
    ju1hRqdfaUd029Zpq0M1QKVfvNYpVJXA03mIXM/FVYF2n1TVZdGxcwDBil6kVRafbiJtv0
    QuPNDwYksKVrYzT4QGS7HIxmz8ayVgiPQk5G9zoQji1nSBMTr/zV+0QH6w0a9BT4L54N+d
    cRhB7KhKgiZgmWNJc1G8l9d+gvjQ75B75nEIsy2loqzEXGvtqjUcmfJ5UhZu2fDzNX4RE/
    4NterOEAV5G9AyH78TaNMwJDSrsHkVXYhC14lVODhlcfqOzYRFLhIHdmP+oBMTDVen5okq
    50ie1MfxvtcSQRGWnFHUt30oIHJXEv7ihBJT2RCFrpaRsO/nJ4cCDjPWp1YpK0EKxfeJZH
    cOrAddTXddbA6c219PzWE0glXtryq6S2/RVaR71IhWHgWaBrePtyit2XicrSua4+3zBbXW
    sA1UEghV0FqAHEvS/sJG1aiF76j/nCke6PldcAVbImCwu4MJmIVHAWs1XEbXcHSLHIAjd+
    orvKs1f1ymhsm2t3vTqwGjhIg3jZ7XiV/v30FQITVWOyrc0vDYOTkhV5Hdfw
X-ME-Proxy: <xmx:5SzravTX-xgqZi4zw8j46ra0sDAduHU_n6CXfzpDX_8lBRYVw64Oqg>
    <xmx:5Szrame5SEn6fHCafDskZJyXz3Tyz-YZ3ryF8Js7XXZmaxMhLT_JkQ>
    <xmx:5SzramCN1gxO9rz9jOzf4USeLED84Bfip6exWLGzjMaLwm9_J9EUdg>
    <xmx:5Szras2rXhYvmOXzPA3hUAMRjZJSpy9P7a3HCffv-R8G9Z374SJ-DQ>
    <xmx:5SzrauSZgH4kYB3T-ggHWveiZMUuVIojGPWTzg-HT_jrxHz3F-V1CLMz>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 08:02:28 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Harry Yoo <harry@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [RFC PATCH v2 11/18] mm/filemap: mark a folio accessed in one place in filemap_read()
Date: Wed,  4 Nov 2026 13:01:07 +0000
Message-ID: <20261104130118.2507513-12-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104130118.2507513-1-kas@kernel.org>
References: <20261104130118.2507513-1-kas@kernel.org>
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

From: Linus Torvalds <torvalds@linux-foundation.org>

filemap_read() calls folio_mark_accessed() in two places.  Before the
copy loop it marks the first folio of the batch, unless the previous
read through the file ended in that folio.  In the loop it marks every
later folio.

The test made for the first folio also says "mark" for every later
one.  The loop gets to a later folio only after the folio before it was
copied to its end, so last_pos is at the later folio's first byte and
pos_same_folio() is false.

Do both in one helper, filemap_read_accessed(), called for each folio
in the loop.  For the first folio the call moves below the test of
end_offset against the folio's start, which is false for it: the folio
holds ki_pos, and end_offset is beyond ki_pos.

No change in behaviour intended.  Preparation for deciding in the
helper which folios are worth reading without a reference.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
[kas: shorter changelog]
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/filemap.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 00fd89cf6f55..3508eea44ad9 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2759,6 +2759,20 @@ static inline bool pos_same_folio(loff_t pos1, loff_t pos2, struct folio *folio)
 	return (pos1 >> shift == pos2 >> shift);
 }
 
+/*
+ * filemap_read() is about to copy from @folio at @pos.  @last_pos is where
+ * the previous read of this open file ended, or how far this one has got.
+ *
+ * Reading on in the folio that the last read ended in is not another access
+ * to it: a folio read in small pieces is marked accessed once.
+ */
+static void filemap_read_accessed(struct folio *folio, loff_t pos,
+				  loff_t last_pos)
+{
+	if (!pos_same_folio(pos, last_pos - 1, folio))
+		folio_mark_accessed(folio);
+}
+
 static void filemap_end_dropbehind_read(struct folio *folio)
 {
 	if (!folio_test_dropbehind(folio))
@@ -2844,14 +2858,6 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 		 */
 		writably_mapped = mapping_writably_mapped(mapping);
 
-		/*
-		 * When a read accesses the same folio several times, only
-		 * mark it as accessed the first time.
-		 */
-		if (!pos_same_folio(iocb->ki_pos, last_pos - 1,
-				    fbatch.folios[0]))
-			folio_mark_accessed(fbatch.folios[0]);
-
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
 			struct folio *folio = fbatch.folios[i];
 			size_t fsize = folio_size(folio);
@@ -2862,8 +2868,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 
 			if (end_offset < folio_pos(folio))
 				break;
-			if (i > 0)
-				folio_mark_accessed(folio);
+			filemap_read_accessed(folio, iocb->ki_pos, last_pos);
 			/*
 			 * If users can be writing to this folio using arbitrary
 			 * virtual addresses, take care of potential aliasing
-- 
2.54.0

