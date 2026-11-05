Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867157;
	b=gls8q69fVQ8nvcHRkW6vxQ0k9+wG8QfW7R69yVm6Z1Rr+KwpGAxtq/dKxx/TfRtLbXxp
	 8PvtyxLAq+8I+XUzFsgoWQ4NAnA+yOyVUkgQsmHbkovz1b3ECo/mLDvoE5+q1z+legxtr
	 P2bBRHJJKMeqiqTLdbUhilzJDMGHo3WRMm3B3ayNxQS6wFRDkqf6x4wpYtFso4oDuzZfT
	 aAT4ybMoIBVs+hTpAYrBOGLHElQgDXG5UwPNoYFNWEqwwO4z+fQccKnkTbens704s7gIn
	 TjsKmgq1RjZvGGm/kJfr284eLsrH12zvcNRTpn2tpApIANfV/rMSq+0u0SRU8eGMaLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fSSaR3HgquBJbFuLC5S8K7K1lQfMmH2UDUaR+qdNMaM=;
	b=t7Wrx/ST0/T84MjiO5fWSVFY0y3mhGx7BUTrwvc1k19wOjCgJ2PqK6j78RFKrkwI+mTP
	 B4c2I89Jj5az/2gq4U0WM7mMURL7HVuMKo7Ny2mB62z1Ixcb4q/wEqeRTWeipSxFS7ICW
	 VMWJQMAfNXjOF3HGuRsFosZnGxkWyLgF6kbntzMme9VVWFwaFB4KQ6DatLrc8uWCr/sls
	 h3enFsKToBTmTPyUYr9jnZa7Xlxb6MOqKvU0pYWblriv3nECjWrvzJS8E4yskfIYbWjea
	 R8RDOzK7Bekk8tJgmSXE7iWi87b6xO+rzWAa+DiFB9KPsYDOo4x3W/CulaIh/lh20WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HM9Zl7W1;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CAE606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HM9Zl7W1
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so3080386eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867156; x=1794471956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSSaR3HgquBJbFuLC5S8K7K1lQfMmH2UDUaR+qdNMaM=;
        b=HM9Zl7W1EGwoqe4karHhr4mQ45AIRtMvOr20lcXdDE1J5+0xKxUuA1oEEKXMUxIq+0
         D5lDi1uGAP8UW8GqvwGEu1r6FOh64e9UVVtXoTmNefaN17CL1nmMTTfvNODrBGinanqL
         YY0xvEAbSyBL8PwIDTO7OdAiFZA85XlWw4lv6z+cHcwaSKvS1IydKquwmrGAwEzbjIGP
         p5hsPMnXUisKm8HdstPff/aG9qs165PNqEa+8kQNuc9MSXq9TqE0Jsd4U5zG2imSM6Fi
         5ckdtWHPm9Ka2bcqjwNEO3Rc067qKEUJnKov34rjdcJb1HtD+L2jMNLwOEYDiPyqJ0Kc
         rkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867156; x=1794471956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSSaR3HgquBJbFuLC5S8K7K1lQfMmH2UDUaR+qdNMaM=;
        b=cSrJf4Tu92XdcpiWJQ3cnpiOaBbDZC0Ugv23Vl6TjC5wOOZZsyoJWPdbJUlLhPpIuy
         qJx9DQv3qpuANMMVUlvmiwMpD+HkDoIwVR7pS3k+k4ADSJa73UPYTLvcPiLIOoCbtFx2
         EJlmJVHyd/TJqH4ks89Xezwd5/baFrYvdxGc9yDt2SR+T2WrCWKaRTn7Fe+B2ZlTm9dZ
         aabNjZ0tsddm4OJA+igMtA4cHU4CFy2t/x1+QUjDjNPFU5LjnR0IUpIy4Go6U9wj0JFW
         wUbvR1SlnL2skeUdKGrG9VQ9Re34SxTUoUz8IgSYti00l1QYrFKKYyxPFNZi50PGhbBa
         1fmg==
X-Forwarded-Encrypted: i=1; AKwUvBzWDRARLySJQ7b6xnsCF7/rJGe6S4oRBAHTmAjHDkbG5PYT6PRFQUMMyjLrfTIgl85r5ucqq9jsbDxW/sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A0esMDprbLTDIQwLcEzG2jZHXJrlsXAgnV1/YFNFHr4U1tYEV
	tcI1/fejvk1VV00Q8jK4n66BhCr+AMWQpuItuZ5Om6Btf0EhGyU+LQ24
X-Gm-Gg: AYBFou1a4o9v5PDLnQQLl4yIWOXDBnNi2DpOiFAB7XBA7QLVWFNFLIsPSrfuk3AETge
	YoELcHs5uq8tLrJiqCGIyX2Cy0Eru7zqrLfyVqrpk2jNcq0aYSCPcqubfAUt9Rl7PVp/4p2hBAw
	vo90U6QVprXvv1BOLYjc2QBh+bZK2E9mRteTLPWg+H19RQPlA+aKS0Fki43qy6QtWvs7Y80DKTd
	HHAf9ntyOL9agwiQF2pkWSOZmO0T3Rn3lq+IAX5L4d+TNX0zyq6LZXEYLxzQTvdpl5tYU4Xx9BI
	u/l75yLKLsW900WWhb32Jn5ezvfNgCGXONV+d1AFqC99TnBe+Tt6QeaR7BFQPnRRsdfi48FpS3H
	mJl0yay35Lfhoy19MhZSHzHRCxrfdWE7MQlWwJDaWwuvpkmGnaCChlM8V9U+dQRJG4SHB7+kLPp
	/I9iPJ3JQmkdTK+fzKgZh9fKIb4mrgiBOgSQtZGjYRypLdT4w2wA7mnA23kKM9597EPEVT/ZeCF
	6phchzLh/ZaBsmSWieOzH6o3NwedU6w1cKc3qM9C3QzNy91H6ArcqsLW0tvSLpLmN6RdGnyrEt7
	lmCu8EHI0MF7NiKK1K0j3WErIKX9RyvuHobiNRDOg35GYga92b4f8hezJy68neBLpA==
X-Received: by 2002:a05:693c:895c:10b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-36a4a08f8a7mr26146762eec.27.1793867155695;
        Thu, 05 Nov 2026 00:25:55 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca392abe4sm17162580eec.19.2026.11.05.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:25:54 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: merge overlapping free extents in wnd_add_free_ext()
Date: Thu,  5 Nov 2026 13:55:50 +0530
Message-ID: <20261105082550.1503111-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
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

wnd_set_free() clears the bits and then adds the range to the tree of
free extents, without looking at what the tree already holds. When the
range overlaps a free extent, which is what freeing clusters that are
free already comes to on a damaged $Bitmap, wnd_add_free_ext() does not
merge them: the left neighbor is taken only if it ends exactly at the
start of the new range. A new extent with the start of an existing one
is then inserted, rb_insert_start() warns about the duplicate key, and
the tree is left with overlapping extents.

  WARNING: fs/ntfs3/bitmap.c:217 at wnd_add_free_ext+0xb61/0xdd0
  Call Trace:
   wnd_set_free

Another way to get there is the scan of the bitmap that follows the
merge. It widens the range over free bits that belong to extents of the
tree, and those are not merged any more. The right side has a similar
problem: for a neighbor that ends inside the new range,
"len += next_end - end_in" shrinks the length, and end_in is moved back.

Take the extents that touch or overlap the range out of the tree in one
helper, keep the larger of the ends, and run it again if the scan of the
bitmap widened the range.

Reported-by: syzbot+323f07d372f692a127b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=323f07d372f692a127b3
Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs3/bitmap.c | 116 ++++++++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 46 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 60b362f388d9..7ee0067a3421 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -224,6 +224,66 @@ static inline bool rb_insert_start(struct rb_root *root, struct e_node *e)
 	return true;
 }
 
+/*
+ * wnd_merge_free_ext - Take the extents that touch or overlap [*bit, *end_in)
+ * out of the trees and widen the range to cover them.
+ *
+ * The first extent removed is returned in @e0 for reuse, the others are freed.
+ */
+static void wnd_merge_free_ext(struct wnd_bitmap *wnd, size_t *bit,
+			       size_t *end_in, struct e_node **e0)
+{
+	struct rb_node *n = rb_lookup(&wnd->start_tree, *bit);
+	struct e_node *e;
+
+	if (!n) {
+		n = rb_first(&wnd->start_tree);
+	} else {
+		size_t e_end;
+
+		e = rb_entry(n, struct e_node, start.node);
+		n = rb_next(n);
+		e_end = e->start.key + e->count.key;
+		if (e_end < *bit)
+			goto right;
+
+		/* Remove left. */
+		if (e_end > *end_in)
+			*end_in = e_end;
+		*bit = e->start.key;
+		rb_erase(&e->start.node, &wnd->start_tree);
+		rb_erase(&e->count.node, &wnd->count_tree);
+		wnd->count -= 1;
+		if (!*e0)
+			*e0 = e;
+		else
+			kmem_cache_free(ntfs_enode_cachep, e);
+	}
+
+right:
+	while (n) {
+		size_t next_end;
+
+		e = rb_entry(n, struct e_node, start.node);
+		if (e->start.key > *end_in)
+			break;
+
+		/* Remove right. */
+		next_end = e->start.key + e->count.key;
+		n = rb_next(n);
+		if (next_end > *end_in)
+			*end_in = next_end;
+		rb_erase(&e->start.node, &wnd->start_tree);
+		rb_erase(&e->count.node, &wnd->count_tree);
+		wnd->count -= 1;
+
+		if (!*e0)
+			*e0 = e;
+		else
+			kmem_cache_free(ntfs_enode_cachep, e);
+	}
+}
+
 /*
  * wnd_add_free_ext - Adds a new extent of free space.
  * @build:	1 when building tree.
@@ -243,58 +303,19 @@ static void wnd_add_free_ext(struct wnd_bitmap *wnd, size_t bit, size_t len,
 			return;
 		}
 	} else {
-		/* Try to find extent before 'bit'. */
-		n = rb_lookup(&wnd->start_tree, bit);
-
-		if (!n) {
-			n = rb_first(&wnd->start_tree);
-		} else {
-			e = rb_entry(n, struct e_node, start.node);
-			n = rb_next(n);
-			if (e->start.key + e->count.key == bit) {
-				/* Remove left. */
-				bit = e->start.key;
-				len += e->count.key;
-				rb_erase(&e->start.node, &wnd->start_tree);
-				rb_erase(&e->count.node, &wnd->count_tree);
-				wnd->count -= 1;
-				e0 = e;
-			}
-		}
-
-		while (n) {
-			size_t next_end;
-
-			e = rb_entry(n, struct e_node, start.node);
-			next_end = e->start.key + e->count.key;
-			if (e->start.key > end_in)
-				break;
-
-			/* Remove right. */
-			n = rb_next(n);
-			len += next_end - end_in;
-			end_in = next_end;
-			rb_erase(&e->start.node, &wnd->start_tree);
-			rb_erase(&e->count.node, &wnd->count_tree);
-			wnd->count -= 1;
-
-			if (!e0)
-				e0 = e;
-			else
-				kmem_cache_free(ntfs_enode_cachep, e);
-		}
+		wnd_merge_free_ext(wnd, &bit, &end_in, &e0);
 
 		if (wnd->uptodated != 1) {
+			size_t old_bit = bit, old_end = end_in;
+
 			/* Check bits before 'bit'. */
 			ib = wnd->zone_bit == wnd->zone_end ||
 					     bit < wnd->zone_end ?
 				     0 :
 				     wnd->zone_end;
 
-			while (bit > ib && wnd_is_free_hlp(wnd, bit - 1, 1)) {
+			while (bit > ib && wnd_is_free_hlp(wnd, bit - 1, 1))
 				bit -= 1;
-				len += 1;
-			}
 
 			/* Check bits after 'end_in'. */
 			ib = wnd->zone_bit == wnd->zone_end ||
@@ -302,11 +323,14 @@ static void wnd_add_free_ext(struct wnd_bitmap *wnd, size_t bit, size_t len,
 				     wnd->nbits :
 				     wnd->zone_bit;
 
-			while (end_in < ib && wnd_is_free_hlp(wnd, end_in, 1)) {
+			while (end_in < ib && wnd_is_free_hlp(wnd, end_in, 1))
 				end_in += 1;
-				len += 1;
-			}
+
+			/* The free bits can belong to extents of the tree. */
+			if (bit != old_bit || end_in != old_end)
+				wnd_merge_free_ext(wnd, &bit, &end_in, &e0);
 		}
+		len = end_in - bit;
 	}
 	/* Insert new fragment. */
 	if (wnd->count >= NTFS_MAX_WND_EXTENTS) {
-- 
2.56.0

