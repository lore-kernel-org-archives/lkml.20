Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755904;
	b=FChosmPlBII/OxomU3l68q2xUHPxWcqfyF3WFmKCNnw7CfwpXIy2iE9jqnKhwr3dp4iq
	 hdWp9/CDNWXfSq1obqtGFylWqA3X4nAxmK4Luy2zFWoYabP6uMAtdLBsO2cjNGQOkiySF
	 aGYdtfUr7sq7AeTBpDz9s8BQedrLGKhmlgWz7O5cfKoniiPbVWLZhAcObS3pUfwuhTc4r
	 K6uBKqd6dsaikwMafa9NAaa9n+3NYjC/Gw6bTYPr3KpUroJ2ji44UxC7nr4Glsn+g604s
	 mfwv/NyWc6wOJ/DBoN3kbwQZsB01v4XpOi7saIzza/0DWHwp83bLurvBvp9KBvyEIGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kSc7WJfr/T2uxVIbPPCpTk8TyN99fu6QCnpTLbLAcUA=;
	b=zBnSEhP+C6c4IQ2d1OciaYtcTOFQ1nz8FvaoMQejy3L4TF3stJs+nLcHeqHUysCZcmFM
	 oRQun35ktNlgSpxLZC8FtzgbUQ5dkcIR8c2NUh/ytbonVyZ6uND+hj9BUGlgmSIvwQdQx
	 N2WHSJmhDgQoS0RXCVuKIrA1z72S+QszHxXqLU4GNBEPeMMuO7birI5fVvBfegZ7CLrNI
	 2rgSBFpf9Pv4gSiJP/PmZLA8094F9ODXGK00HpASWbjhFfkoKCsTo+uEED5tKC/DUbloS
	 A2nyfWmxhM5zHZ9M4O0atrnz7z+iCXztmng+N4evYDbOLXDz83Fw3cPlv8NPM9EDv0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HaYMDP7r;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7F3606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7F3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HaYMDP7r
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso287172eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755902; x=1794360702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSc7WJfr/T2uxVIbPPCpTk8TyN99fu6QCnpTLbLAcUA=;
        b=HaYMDP7r1WSFV3r79Kxck3kkLtGkk996HbG5nAXEJx4T7nWUUB87lzMz6cwJUy78N+
         Wpj43JrLAlYeVZeShaon33yoWjzgtbw6zwJ8TmlTJAy/NU2wUKCAavA8BHyrql3Tf7Hl
         6eo+nwTqBTMYYBfMLzTiVN8QHcZt039j7VNTdVGbUqHEcqPForUIKbYNgbYcXqcJ492w
         dbZsQJs6IcaLVw8pwY1/o4ErUZ3d91fRTqr+QebjgGbe0JkJM4NP81ja403zAFVZboCm
         KE87uab/D6Sc+JMIdwaRCUwDRoYS4qTNTqLak7uQt3UXSaPhnm/P4hVtaZoTKHqCd3WZ
         BucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755902; x=1794360702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSc7WJfr/T2uxVIbPPCpTk8TyN99fu6QCnpTLbLAcUA=;
        b=0sORh93t/vD8ec/4863NUlTjpzEoo7LbY9hS90LyNpOjlI+qyA3UqEhziIZtTNdt4N
         ePfzy39IXkdNwN2qzQd8Ut1thrJ7u4T45cjn21P6NJ4y2ct0SN5/SElEXtmzpUQBG+Ta
         D4duN2kJRdin/jf1/b/nQMGY6mj1fPikaA0JXVYmApAZNbDHqs9ko8SLwHrFpCIfbfrE
         gobQb0MnTemYqukVgYgy6jwq0HdrKaMIDhG1M38Lk3z6zJvQxbseq0KxNJ+QhbIAwQ18
         sgf3/dkNVcgPIrfb6X8I+1SqE4f1jPUVqlvaSaqI7PrNUK+TlNg4XBzocH57Meskx48/
         Rbyg==
X-Forwarded-Encrypted: i=1; AKwUvByTaWTVyB3VbiCnps+PWveiVB4nJ13s8r+OAGARU0/BJRjl9x/huDbVfoFtpSlSUn3wrGrgBS1kTMOO8Ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z94b1XaMZP767SWUcpdes6JfAiRCWg0eSmyNqTujgiDeEZ1MD49
	GRZfWJERvJFuNoIpS+82gZrktdl1Dh3RcYHPbC6q3tbVpM3REiwMKsq05RYKFCWu4+Y=
X-Gm-Gg: AYBFou0ylF3F2iN/yJM/h/ig3Udp39mnzy897x/nzcyLhHvElNbGbvJkiJJoMf4LIYe
	htthaLix3f36jcb+jTULgLVYGwPDx6AsH0D92gdEidYMt5tL05KqB7jZsXfDD0SFV1Grgo+50Kd
	jrj8kUFnSARpXKJmBsEkab2V8tsJnnXXPVcLw1EIPSnJhJq4Ui9I4+OUsg0+aZxdOYtmsMtk6sg
	MjkvwjoQFae1FV9+bUavBxJ7oQiF7XIkVEun/DXAqi9xxPwuM7SeKoeIpeA0nEtGNikAO2MvfCc
	MQSSeiES4gz3BER1HNDFZEEF7P4AuIilkZBBrzTsvNLmebxgfflD/VIm05rJtAuflHuKMfP1O0/
	Dc4C/yK6z/Au2Ywo1PToscF0oBDpvJdogBzfzSqaRunETY7l2nt0mSL5G7uaDsUP5QTX+2dyIcU
	ib0ghKJlA5tvxsG0TqxJPiMUIer6pi8jwGvB3eK5RCNbL1G5HKEHnkw2EJ9lOmiAfGIsVo2r+m5
	YC1HeBX68UcEnJtst56dLwHZYT1c/jCmRNYux8TEoe0xZqd7T2ipPxu3QmvOmQqOJMpFzyxrKME
	z55j6KkGlfKpn5JQ6zo8ZtHvdzbBAdsmKDHJkz12q6cxv05p6CBQ0FMgmxM9tigijNndZWj+Jcg
	wpixzmWReUMU=
X-Received: by 2002:a05:7301:db8a:b0:36a:279:c93f with SMTP id 5a478bee46e88-36a423fda77mr21589967eec.33.1793755902092;
        Tue, 03 Nov 2026 17:31:42 -0800 (PST)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394c2a3sm2149230eec.20.2026.11.03.17.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:31:41 -0800 (PST)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - CORE),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_))
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC PATCH] mm/rmap: use release ordering for small-folio mapcount removal
Date: Tue,  3 Nov 2026 17:31:38 -0800
Message-ID: <20261104013139.1341582-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Removing a PTE mapping must precede lowering its folio's mapcount.
The COW path relies on this order to keep the old page from being
reused while a stale translation can still access it. The mapcount
update needs release ordering for that edge, rather than the full
ordering of atomic_add_negative().

Use atomic_add_negative_release() for non-large folios removed at PTE
level. Leave large-folio operations fully ordered; their path can
queue a partially mapped folio for deferred splitting. Update the
COW ordering comment to describe the required guarantee.

In an arm64 page map/unmap microbenchmark with 20,480 minor
faults, simulated cycles fell by 1.54%.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 mm/memory.c | 4 ++--
 mm/rmap.c   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b65b56fe9714..9e23c64bc743 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4158,9 +4158,9 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 			 * threads.
 			 *
 			 * The critical issue is to order this
-			 * folio_remove_rmap_pte() with the ptp_clear_flush
+			 * folio_remove_rmap_pte() with the ptep_clear_flush
 			 * above. Those stores are ordered by (if nothing else,)
-			 * the barrier present in the atomic_add_negative
+			 * the release ordering of the mapcount decrement
 			 * in folio_remove_rmap_pte();
 			 *
 			 * Then the TLB flush in ptep_clear_flush ensures that
diff --git a/mm/rmap.c b/mm/rmap.c
index 1131b76bbbc2..62e623d7563b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1794,7 +1794,8 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
 	switch (level) {
 	case PGTABLE_LEVEL_PTE:
 		if (!folio_test_large(folio)) {
-			nr = atomic_add_negative(-1, &folio->_mapcount);
+			/* Publish the PTE removal before lowering mapcount. */
+			nr = atomic_add_negative_release(-1, &folio->_mapcount);
 			break;
 		}
 
-- 
2.47.3

