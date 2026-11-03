Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723149;
	b=EEZyDkF7L069oen57rzNEHXwec5NPBrjNpPk0F43xCsNYJinhXyjbKXed1/s6iyKumJR
	 XKFI/L7oQnIHJpOK8X//VtxF7vPTWsarS1DA0K2whkmXjCVNkmspPDbQDHYCQZ6mkMWdD
	 vlT6iO6gRUXDiV2PQ2RcmNPUfU1x+bdmuPP3QQyRJ2PbIStg4Rr9WTqyXsWBxZOT3ldWK
	 mGi5mq0o0YZ93vfGDDK5GlfDOfKA8B5EAdkZAnDEk1Y7YniDEEizClbaC+ca/ckXoF53q
	 D9rOxGoeZyXPjkw78aUD/qeANWlHh3dEA0cMSZv69/74jnISat+KsdZtR+wiqzip8qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723149;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=wJNKxiM1RR8Nt30qb6ixH93YV4loyXSLX6/lXKLZxD4=;
	b=dMxAPdmDSA+nK83YcR//gNIS0Auirxkrj1wBDtWdSXOqm7ns7S21dm4IHBhb6mPuX+7I
	 oYOISFNcA0n/cRsHGb0cn5jyyXIBUo0spCjvJi6CW7wMGT0nrLg2JVvMhwRxhyCq0Kndv
	 T+WyiiiW6hVYXe8Ew8zuMwXZv1uFpbh3vg1PUXYK6m1yuuVj2s3fAGZyJ1WAWE8wykjzU
	 OYdbnxSJ9Q35E1tnfdEa/Lh5+AytZgv+MmGvuKG+oFDGAdCAXlFw8tUARdUH1mWqfw8nk
	 sqyDWv5tHXvWyO7VXzt1L2vVCsjp/EbcIRgp4z3eGq1Uhhrgd2Hq0W0jnPpHk+8vAAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pi2S/Y11";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F21606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pi2S/Y11
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793723148;
	b=Dzxg4aTyjOjAHEsWOk9NjNHm/iTz3UkdwNz022bcVLBtMPofsCiPK64sP/I7bWr3Z+f9
	 lBTETRJC8x+i9qJD6dItrUuhQ964YQj2gmh6avUZ1Hq3jd6LixIiH9nJ3Ps2Ncj/iL9e+
	 zvZfb242H3dr73uh8S4FSb4ADriOtcw3yOK+Uqs65UZV32pJqhmni7z6ehE5KG3Gkwcwy
	 h2HIoo94jzTBqUKsm34XbjekR92VVIHk9mRZdtSR9DOk1LnF9cW2f8fiqRPLGLYkW4yMH
	 qjImlVpv4LwcNI0bFuz4ohQ1DzyhGa6qVuaUjVc/sIGNMZFc8aqGwj+T6aR+VH1aHng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793723148;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=wJNKxiM1RR8Nt30qb6ixH93YV4loyXSLX6/lXKLZxD4=;
	b=ryf4F8KasqN3x8QhAUOccEDPEUESUJVE54AFOZlt2kDUqkGHh/5FXovz+6yazzeK1mvN
	 o/V5wvRFWWS8tlwINsHnkCSdr3nFWwoUFMJVIrzPWPcK8NOJSvWECJG+nyNzYDCDlv5z5
	 1jANSk3vMK4pSz4/Wkt4Y3VZEuyFSVLYbU8bV8Y9yKJGOwWSoldf+WlrKeE13n4U1Ogcv
	 jPxq3Kfjr9qu/NM9kIjlzTEzeORiUOGwKrtJXKk2hC8B9l2zuhroe036Xp50CWccd6SDQ
	 vf2/+W4cGIAnYGCYniOVjeJU58z7U4xCqhSAD663s+xPbaphFdbO5rJ7fHBYmc0/xfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C94B31F00A15;
	Tue,  3 Nov 2026 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793723148;
	bh=wJNKxiM1RR8Nt30qb6ixH93YV4loyXSLX6/lXKLZxD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Pi2S/Y11alvDG6yV5Uqnu7QjI/9KqzDh+6EdfLHXtTLAMWKgxLD4S/r7K/bXu1lhk
	 zSp3wMP0+OxmvDiD73bR8YOYnueQ+yMeIuTJyE/8lH24PwqadopxkKOCUP/0RWHtAW
	 lqXtV77p7T6cUjh7mqkEFzdmAMtOTbZzP9oro10+y4B7jLgckU80W21j3Zoyl1iTfW
	 5KApVtAf9gd9bW6BOF6a4Dh5HQH977OduN2+WVsomdSd5Ig0XFmcWaryGTNIxdNxI/
	 dj18P8WvA+R7WMBn7SAR7Uxltz1TSp7vauOOMeYyQdbePiH0Ka1RbOSqd1TP8HsYyQ
	 nvEn9E3o73bfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5336F46A2A;
	Tue,  3 Nov 2026 16:25:47 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Wed, 04 Nov 2026 00:25:47 +0800
Subject: [PATCH v4 3/3] mm, swap: drop the swap cache guard and reclaim in
 swap_free_hibernation_slot()
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
Message-Id: <20261104-swap-hibernation-slots-v4-3-0ba9393609e1@tencent.com>
References: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com>
In-Reply-To: <20261104-swap-hibernation-slots-v4-0-0ba9393609e1@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
 Jianyue Wu <wujianyue000@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Kairui Song <ryncsn@gmail.com>, linux-kernel@vger.kernel.org, 
 Kairui Song <kasong@tencent.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793723146; l=1453;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=HPBYUP9MF3eSuiR7PGXZbC8XEUoasVA5Ed/MrXu8OwY=;
 b=4uNVtu2qFnk2q3Ro3dEgv6Ysy2ZgK5QDFSXGgJ3BR5URLa/fqYZSm2gIUkczc6q/+EjLyM7Pp
 boIUOm6t6rxBLDX/bw1typJvrJs67/sZAvugRsZ71of0Po6iNzyXGyc
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

From: Youngjun Park <youngjun.park@lge.com>

Both are there for a folio that readahead might have put on the slot.  A
hibernation entry is not a shadow and has no swap count, so the swap cache
turns it away and no such folio can exist.

Signed-off-by: Youngjun Park <youngjun.park@lge.com>
Acked-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c26243140bf2..8dd2ba825413 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2227,18 +2227,8 @@ void swap_free_hibernation_slot(swp_entry_t entry)
 	pgoff_t offset = swp_offset(entry);
 
 	ci = swap_cluster_lock(si, offset);
-	/*
-	 * A slot with a folio in the swap cache is freed when the folio
-	 * leaves the cache, the same rule swap_put_entries_cluster() follows.
-	 * Readahead can put a folio here, and freeing the slot now would
-	 * leave that folio with no entry behind it.
-	 */
-	if (!swp_tb_is_folio(__swap_table_get(ci, offset % SWAPFILE_CLUSTER)))
-		__swap_cluster_free_entries(si, ci, offset % SWAPFILE_CLUSTER, 1);
+	__swap_cluster_free_entries(si, ci, offset % SWAPFILE_CLUSTER, 1);
 	swap_cluster_unlock(ci);
-
-	/* In theory readahead might add it to the swap cache by accident */
-	__try_to_reclaim_swap(si, offset, TTRS_ANYWAY);
 }
 
 static int __find_hibernation_swap_type(dev_t device, sector_t offset)

-- 
2.56.0


