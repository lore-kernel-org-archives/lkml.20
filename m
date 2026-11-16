Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838352;
	b=abgCc2ZCiveajnkem3V/LpxMsyyEI/ltrjT7GcADboLedvRz1e2usikGuG78BVbRBKdf
	 4an7BRkkQB4XyfAe36GBxrf/B6aqcs5IMO/uqbCabqwJOWE7hRnrU4MMx8EeHJCbiTpzL
	 KVvJxvDPQWpRVZtb0oV+b0+3reSlq79QecHxjWWPVyRDQineJ+OCqzTDNWqAPSybAgLca
	 KSFTVNPyN0Hwk6HoRRZkzOdHh8HyTCP5NHG+ZGjiP6X6OLAY+qKwLUANLznor+mUrVM18
	 0p6M3Lpr7RxeUFae9UJsDcqm0nL8mvlhE1jLE0Acrt4OqVAxz1GFQV4soj+trbnWMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838352;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+dmzKoW9rqQ/GFF0qt6AUTCWAnyMLfoMYNhlMKd90Ao=;
	b=eiCV3wCzEFZ8j9kj5qzp98sEV/ZsrcdsorDcYqsBSLqhQadMzkK5sAVyltN3F97kMO30
	 NTHFAwjQt/OYUINQJ8tMsQ9VAF4WTjduj8mp/UeEMdxv08OjbPXShFMWFDz6XfviC0NK2
	 L7EtN3z+0sEfrYf+pcvPnmB7oZCAQ0mhpdM4FZXu1PNtxj3KSb86T0rG1h52+iDA3dE83
	 pPm+9Bs9i3U4W3epre3BTE05WicCL8IXHfLHZhSZcHYZq/CeJiPVF5TzWi9w/kGxTzbSb
	 m+mxbjjrd7FtkoT5tQcpCyPtbyJP5dAc7IrHwalFxz1HVpz+SVI1vVwpUpZ1Z7kXX3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwPJ9S4t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE8606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwPJ9S4t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72791F000C4;
	Mon, 16 Nov 2026 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838351;
	bh=+dmzKoW9rqQ/GFF0qt6AUTCWAnyMLfoMYNhlMKd90Ao=;
	h=From:Date:Subject:To:Cc;
	b=NwPJ9S4toer+MZWLv9AL252Uy/YxDC2arIwhOOTfzI9UAD5n4Zfy1g6B2y57eiCKM
	 RKqEV2TODOQwoQqILNAmM5kxbL4U6KpULDqCgGVp1f9bxAY1G0vnRFpTrOK45JLTPO
	 i1dzS4zcwix/L91sLefxMGLEg3GLYWa/TLD6mua8oi/bg+QzxFTTni3651bNLCQ6Vz
	 R2FPzW033/l9c62TtfvjCMmAyI4Os2uLHy+8RO0B35+NppvWRnvfaP16EYPECtwU8h
	 l9lg72CE5D0N5Tg4JCz9Ha+tKShCM2qFYwTA4Ef0HjH6403tHABO2Gprf7bNowkDvi
	 cceTCIxHAoavA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 16 Nov 2026 15:12:13 +0100
Subject: [PATCH] mm/util: fix retry detection and handling in
 snapshot_page()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-snapshot_page_fix-v1-1-8e425984e8d1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBAF0KsMf92AUzRoriJSYpy04yINmSqF0
 ruLunybt8GkqRgCbWjyVtO5IBB3hDTFMorTBwKhP/Semb2zEqtN8zLUOMqQdXU5Cp9P4jldjug
 ItUnW9Xdeb3/b6/6UtHwj7PsHXPscFHUAAAA=
X-Change-ID: 20261116-snapshot_page_fix-fae185e61c94
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Luiz Capitulino <luizcap@redhat.com>, Shivank Garg <shivankg@amd.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Shao Mingyin <shao.mingyin@zte.com.cn>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764; i=david@kernel.org;
 h=from:subject:message-id; bh=oCOpJKthFANmJ/4lv+Nsq0+6JUVPxiCs7IZPnL+gr7g=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLJ+8zucO6spVSgjlyJ3pUu780n0QtvlR9d43uXcflYqf
 cnpo5mvOkpZGMQ4GGTFFFmCgu8bvHy5rrbajY8ZZg4rE8gQBi5OAZiI/ktGhvWxsSfEssvPJPM+
 uug9wfzImusp73YYb93L4+vs+jfufDgjw76Le6+ey3kqZXP3ADM7R2FfzJE8vwW502tfZu46bHv
 JnAcA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

snapshot_page() detects races with concurrent folio split+construction by
checking whether the given page still falls into the folio. Unfortunately,
we have an off-by-one error in there, and we should be checking for
"ps->idx >= nr_pages", because idx 0 is valid.

For example, we might currently report a tail page at idx 1 as faithful,
although the snapshotted folio is now a small folio.

However, there is one complication: As we don't hold a folio reference,
folio_nr_pages() can return 0 on races (or when called from page freeing
code). Handle that by just setting it to 1 in that case, so we don't
wrongly report a head page as "page does not match folio".

In addition, we should reset ps->flags when retrying, by just resetting
it to PAGE_SNAPSHOT_FAITHFUL. Otherwise, PAGE_SNAPSHOT_PG_BUDDY and
PAGE_SNAPSHOT_PG_IDLE from a failed attempt could stick around.

These races are fairly rare, so this is not really critical, we simply
report something slightly wrong. No need to CC stable.

Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
Reported-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Closes: https://lore.kernel.org/r/20261115004657890Pz8ERDf5nCtE-B6M7KFzu@zte.com.cn
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/util.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 80f6c714844f2..338f259b00351 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1406,9 +1406,9 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	int loops = 5;
 
 	ps->pfn = page_to_pfn(page);
-	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 
 again:
+	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
 	memcpy(&ps->page_snapshot, page, sizeof(*page));
 	info = ps->page_snapshot.compound_info;
@@ -1437,14 +1437,15 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 
 	if (ps->idx < MAX_FOLIO_NR_PAGES) {
 		memcpy(&ps->folio_snapshot, foliop, 2 * sizeof(struct page));
-		nr_pages = folio_nr_pages(&ps->folio_snapshot);
+		/* On races, or when freeing pages, we can read 0. */
+		nr_pages = folio_nr_pages(&ps->folio_snapshot) ?: 1;
 		if (nr_pages > 2)
 			memcpy(&ps->folio_snapshot.__page_2, &foliop->__page_2,
 			       sizeof(struct page));
 		set_ps_flags(ps, foliop, page);
 	}
 
-	if (ps->idx > nr_pages) {
+	if (ps->idx >= nr_pages) {
 		if (loops-- > 0)
 			goto again;
 		clear_compound_head(&ps->page_snapshot);

---
base-commit: d164c7d754f0e1f020298366ea92430e62476089
change-id: 20261116-snapshot_page_fix-fae185e61c94

Best regards,
--  
David Hildenbrand (Arm) <david@kernel.org>

