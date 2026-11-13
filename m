Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583125;
	b=tY/vwMaHmd4iMArlMj6w+z/vluPWlPZ2lAgTF8r8KHLYRpepxlvk3n2i+qXekEEXadsR
	 H2hhUxLBRKwjZRQZTyaBE4HARrJ85gWK3ceAcCn0B4Gm9CFoqf1Ms5/Uk20MP600Q9hKD
	 34h/ailTVKV+4WjLuZ3pk1H2oeLODplLx22Y65EUgCjVNtQg6b9cVX8GVAVyv6phk1EtW
	 UF8Ejt/U0GAbnKO7QK/tN0LVmKXbNoPQ5rLVagu3KtTlhOfYWsYYpx1Pe/7dhOJGcnz8C
	 uUI/ILTfnXf+MNPGc4FipkNpeJB9Zi8f0bbk2nurJMI+WAYiafkYRhW8PvH1/F2Td4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hfc6N5bqMOZ9Ilqy3QOYV0grnw7Ekr2OsZD/GvRKsUk=;
	b=YQXQFlEelVltiTywkEY2N4oKNaTMws1UXWYc2/JC7tATO28z3yOlXf7HkhatqnVIdgKd
	 IvaJ4r5VRdIM2HQC94Sbp3nX0JC2CV+XBIZ3MSjx6CLF9VIcRbQRSHmQ9jrlOKqWD8RDv
	 0/3RdNFspVom0q09HgFVtLUyMzbpwyQA8DwohW87f5kwO1U8IxU/bPAT357dk4YocrRlI
	 IvuNGTo7pYesHJb6d1tkOMkLgjAX15ZnWcK80yU6+//9UfmmYC8BkikkV/ncxa7vcWMUn
	 bz1yLTnapdn+/GZexzx5AnVuD0v7z9jDwRyzyMCXn95+Lp/bt0zCxaE6NZMww80qS8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q6/k3frL";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F2606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6/k3frL
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso1203351eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794583124; x=1795187924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfc6N5bqMOZ9Ilqy3QOYV0grnw7Ekr2OsZD/GvRKsUk=;
        b=Q6/k3frLcS0RXfQLHwf3kZxYijonhXYMOFQlgk2hC8YgG9C3Ay8TOopV1PJtS5tYNy
         RwWUuzGozY/UruTX2mTf/XUc0QmRYoB2jJc0oHQuA1QSdc5YzpCkxs988s39qmgt36v2
         ttgKATfcnj/dhKhyNbDyRi277pmD9wdXven9RsGa3MeVnOLePQYfBEA+6riNrguZmxR5
         GqvJWSvFOc9AVn19xToFFWPvxwZ/O8ZG6SiptkdDrPLcBMlnn6aORujmTg4kSAShUr2a
         7x13LWLdabSjZGGeAd+XgU36Z7gn5NgBi8J7zFyL7qTily/PlfJ9sUVDDkCPFfw1aUrd
         Pz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583124; x=1795187924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfc6N5bqMOZ9Ilqy3QOYV0grnw7Ekr2OsZD/GvRKsUk=;
        b=uJR46kxQg/XppCq/0Xixu0R0hvgizo/L1hWQEy7D2/63dflLVmxpkhk2z8dExcydI1
         wcl+6yKPxWKKuEfLxaTcErYg9wlKmwrsYy3Hael4TXjQbETMoJpjhgr0ui2ttebWjwEB
         MECP35e1Bq+TIcBJusnUFCQzVtqK6EavfS5TJ+9YxXD7FIawEABfWOQmaxx2ttWDLYfG
         cFudwRuuRIvWaLavvy4ebbGwGYdJVlfKTCTu6J0RWmmffoDzh/niwFwiscFGTLRg9TY6
         CORkkAXycmBT10Fm3Cy7/QRfj2+0dK8rU+bCZ90cq5pOsp/Drg0zJKJ52YtU92/RsDFc
         eeeg==
X-Forwarded-Encrypted: i=1; AL+hErGKm11UTAiqBJ+V9yVcVXH89KUkG5xB/sdPyU22REibPa7Jno6GnyYcndM96T0zQ+IiegjlXxb31+zdVw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+92tkP10CJvxGqYopBOOhAXwQbSA8zoeW9psCW+6rWY3PxcNGy
	wRscLioBlFrisP0CamAN/ZIXgshbpi60U3TwAXK9rYIqOnIclXGOa1hn
X-Gm-Gg: AYBFou2EathIXU9OJ3jYT0CsT+jlROCRyepoZgB12BKYggrlO9nne9doKLYLskkvsBH
	6Zhfvjj3IzN4B/5PMKO2btaN5kP+hRFPaosx/LYdy4ia3NiGR3EXB7lHV6kqM7JTw99I0LuoznS
	NjM3W5vNaqOnak60ppjAnfhrOt5KXuUMjQ5v3Fl/imF+4dZjn5jicR67iT0A6ynWeVQaBLO3VEt
	sw+ANOWq7KXvsmH5ATU0uoUrT79UWo9eYyoIUeA9yQt/ed+r658FbFbQxjluSQQuB/z8X6GtsJ5
	9l79eBYOiG9rbO7ntHMvLxGdRu2qOx5BF3jnTMn9b2erMI5GTiu+WQOjvC6QawcspsnFSFUSp6q
	Mzv3jeXbX3/8LDsuEz5YmmRdHiaWkYE2WOMpbWYOurGfBU77qM2WgpKg7xHInKcklYJ8uq/D69h
	x7oPfxJTmIp/LkNFlFd/fTBABIngRQgeC8u6R2zSQecVYaqZ965qtd5cKXW6p2936C+TJfgfBiB
	hmgwSMZ3UKugz4bR2JJJMUGVs8tIZK+lEbiZngAA0DKsOVAzOiOW5g5nhzA0aQDiHcsXaPsUCT1
	9W+WeETV8CHnutaJAsfeMiF4zGb19ig=
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr2517287eec.11.1794583124302;
        Fri, 13 Nov 2026 07:18:44 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac1:7ae0:50::246:47])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm9134286eec.28.2026.11.13.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:18:42 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com
Subject: [PATCH] mm/slub: don't let kmemleak report rcu sheaves
Date: Fri, 13 Nov 2026 22:18:37 +0700
Message-ID: <20261113151837.123795-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kmemleak reports full rcu sheaves as leaked:

  unreferenced object 0xffff88810005f600 (size 512):
    hex dump (first 32 bytes):
      e0 79 f0 2b 81 88 ff ff 20 00 b4 81 ff ff ff ff
      00 12 04 00 81 88 ff ff 3c 00 00 00 00 00 00 00
    backtrace:
      __alloc_empty_sheaf mm/slub.c:2854 [inline]
      alloc_empty_sheaf mm/slub.c:2874 [inline]
      __pcs_replace_empty_main+0x260/0x2e0 mm/slub.c:4806

The second word is rcu_free_sheaf and the size equals the capacity: the
sheaf was handed to call_rcu() by __kfree_rcu_sheaf() and is waiting for
a grace period. At that point the only reference to it is the ->next
pointer of the previous callback in the rcu callback list.

That previous callback may live in memory kmemleak never scans, e.g. the
rcu_head of a struct slab queued by rcu_free_slab() for a
SLAB_TYPESAFE_BY_RCU cache. Slab pages are frozen (page_count() == 0),
so kmemleak skips their struct page. The chain from rcu_data is cut and
the sheaf, typically allocated long ago and recycled, looks unreferenced.
Since the sheaf is then not scanned either, the objects it is about to
free can be reported as well.

Sheaves are allocator metadata and are always owned by a pcs, a barn or
an rcu callback. Mark them with kmemleak_not_leak(): they are never
reported but still scanned, so objects queued in them stay referenced.
Allocations that can't spin are not tracked by kmemleak, so skip them,
as alloc_slab_obj_exts() does.

Fixes: ec66e0d59952 ("slab: add sheaf support for batching kfree_rcu() operations")
Reported-by: syzbot+527fed49e5b988882c9a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=527fed49e5b988882c9a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced in QEMU (syzbot config, 2 vCPUs, numa=fake=2) by stalling a
grace period with a preempted reader on CPU0 while CPU1 interleaves
rcu_free_slab() (filp slabs) and rcu_free_sheaf() (maple nodes freed by
kfree_rcu()) callbacks, then running two kmemleak scans:

  before: 16-18 sheaves reported per run, rcu_head.func == rcu_free_sheaf,
          plus maple nodes held by them
  after:  no sheaf or maple node reports, no new warnings

 mm/slub.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/slub.c b/mm/slub.c
index cd671b934719..e01416ae0b4a 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2856,6 +2856,14 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
 	if (unlikely(!sheaf))
 		return NULL;
 
+	/*
+	 * A queued rcu sheaf may only be referenced by an earlier rcu callback
+	 * in memory kmemleak doesn't scan (e.g. struct slab). Never report
+	 * sheaves, but keep scanning the objects they hold.
+	 */
+	if (alloc_flags_allow_spinning(alloc_flags))
+		kmemleak_not_leak(sheaf);
+
 	sheaf->cache = s;
 
 	stat(s, SHEAF_ALLOC);
-- 
2.43.0

