Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753614;
	b=cXVuOg90LhjG8zZ+se0S6UHLRmg4n4wYaR6L3BzIopDKZPwIL1wG8gn7pfRlrdm/8d/t
	 3sZFezO9aw21M5bsZuBlCErGtY9ryPoQM4Mvs34YLVpSHSCrAHFqfilrQSs6hMStmtWwc
	 fej3sp9YnU+CE338DNL2npymg329qTqZe4+ZbwxaIzv4j3nRyyxjjXpWekF+qv2GTNzfR
	 93PSInA3DB12FqJmUom7iJPgRObfb3C9xKRxGoC63X6gdScRZPLVoAqwdp5xwc2rK8NJD
	 I7BAiotdBwcxxoY5VmqxEiGMBZvlEmRzJ7fiKwJe+EliQuH4XpDtLYGPdZcLteVdcmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Noyht4TuZWh1NE3NpPCNH4SGr3Qu8mV0olkuMsgHzks=;
	b=Ri3PgEUAnHS/3B3aPkVqEck0nFCVKc0d50hzzn+p9azOrr8rfIFp/wKMZeeATGwwV8VD
	 RtaoqcSUWdZGgtKq1UVjVV3iBq9zmLnrqeNtQ6cdJyrQQSg9ukRVLA62bBjDqU7G/VeSS
	 8WIYghrwdKKkth2Oj1Sd9+64BljZ2j/sFArt941q150mCpKKt9by5FmBlUbfDaVFFRU8T
	 Mq938M0puj9bIrWu5Iu4/t2vpg0O0iLVAFZnMwn9mu3vZYvzR4HYiKMGk7z7r9XkwywEF
	 dvIUzXmOlUbOrT6hZamOjuT0/6ftg7WAnTaWskC9rkNaWgzlI/HD9fPCS9rnfN5CZsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN2C0KHP;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EE606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN2C0KHP
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so7621935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753613; x=1794358413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Noyht4TuZWh1NE3NpPCNH4SGr3Qu8mV0olkuMsgHzks=;
        b=RN2C0KHPgGM+2f8SuD524sHUC+d5SrztGovvNaxe6Lma7wMD6m9ZJcwpAeou2IeAE+
         KQLCt22JEXGsIIRekVf4EZZbAq/ZNSYNU6PnSNgCusUDsubM3IFg1etC8XuJ+u6aOSqe
         wGlQN346RV6rDDbiTZgJRSQVrJW7LEKJWBZmCowZXzb6Cxhef8nJj3U4fyVj8FJvDCuv
         4ZQhy/jzkbqheRrShgZai+iuxIIMaC0KgolG5oWvECYEdcomqxPv5z/alHTYcHEQLcP/
         yUZXN11GnvFtNF088Si/dPtkfVLUUhJathHRFs8rhSCd1ZWlD8tp2thWrbkFqj9jsvkI
         OCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753613; x=1794358413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Noyht4TuZWh1NE3NpPCNH4SGr3Qu8mV0olkuMsgHzks=;
        b=HTaqF5mbeUaB9HUWz0YOC6JMCFipPwZfCvpFZ1gNAsouC/fMNRGZOL4bcoR451C//F
         hn5/vD22ATs+pGkGR4pzUTmjPrrpcepSV05UDrOIAAZ5Du9T0BhrPih6saTI5gXNoY1s
         xlZoTxZRrrR0EAW1Fp6s4eC06Cl7NxBlR8DagUDKHkOcUeYF9gIyWfeYnEPo4pTaz4Bd
         YhFXvSnRAbcziFBKPiOkn7C1KB8lkPZAm0flxVYCoOMzzH9v6K4duRTECG6akz+0rUUH
         ydsDeGhn/gvHQ0iGPC3YE548WSe3irwqEgvbg9RXVrugInPmd6JkIKQ7ddNquFfmtUhF
         bpFw==
X-Forwarded-Encrypted: i=1; AKwUvBzBT0vGlO1PDZitPrM4jIbMMCzV1o/CKarvC7T9VIql8XyMuURUJRf8CCPCFJwVN3fbYCFl3xmNWNxCIwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cXiAfoD9oY4ezW9FzKDfc0GWhARxZjRfK5/PKjCEXGTZqszxc
	4F3GwGL7FHtAtPuohGoRQIADlSYkk4SDpFxvW279c4PNS0zBsI1AuTqo
X-Gm-Gg: AYBFou3VaEk4oF/B64bx135Tc4gUki8Ux6Y4d/ChFnKS70s54RO+Pco2K76e3KD4RKu
	Iuj2xPmDrd5ZAfpqrnHvA1WpId6ulP9PqABHsJ2e0fVQTcF/CdhTcCWGNfJVvXd55tZh2ZzCwLh
	5T0d9Avn3OFEAABbccWe0cgRQF8rp+3sykW8FXbEaU+gvJAhsIQxSzokOUHKwRGRHYaV7bR2Pmh
	5RMduC5q0q+BTU8HgLtc9043b3tAkZKGkyw+IKNjEvWwI3DG1WRX7e9deaapdW/7mZO2krruwL8
	UCBDJxZP8TYk9mc5XPKB0qhqkatbjYFymYbU7WmBU5IHSb5fH1DW6v/VkxJesGRhiDmRQS6lzMj
	c2GzM04HcYWFhksD+q7fj2w1wwn33/8ZNOWwArsH04pfCAuie0RvwAsGMm7/W6aeMwgSmgY0Ftz
	Dslxc2D2ODZCu1eQA/KLDZ3qcdMC/WSgQuvARVI/BAtlHO6gT69wRGfesmGWJMKkLdAQQNInGr7
	vvcgZtIejaD6JC5e74tZkWmf+qt2SsyoB9PYJv+BTfilMQNcirYg4DWfIGq89emScWruaNtIbBy
	Cg7jMme95aMrZvL/wiv0Q/m67KrOCrb0qf7feBZN+BKAW1eIDPaja8NZcQMfeWMn//RCK/atHyM
	hSqAq3HcEabcOwUA2DYcfJfPP9JOSd6kCtHhJ5prV60gq7wXMidNVFWJlfcXTg29uBA==
X-Received: by 2002:a05:600c:4715:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4ac17567cc8mr323435835e9.11.1793753612715;
        Tue, 03 Nov 2026 16:53:32 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ed95sm11899275e9.4.2026.11.03.16.53.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 16:53:32 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	James Houghton <jthoughton@google.com>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/5] KVM: x86/mmu: Walk memslot rmaps by index
Date: Wed,  4 Nov 2026 00:53:27 +0000
Message-ID: <20261104005331.50600-2-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104005331.50600-1-griffoul@gmail.com>
References: <20261104005331.50600-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

In preparation for storing memslot rmaps in chunks that are not
contiguous in memory, walk a slot's rmaps by index instead of stepping
a pointer through the array, and look each head up through a new
__idx_to_rmap() helper.

No functional change intended.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 arch/x86/kvm/mmu/mmu.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f4b12d6aef55..b3fcd6f2a991 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1236,13 +1236,17 @@ unsigned int pte_list_count(struct kvm_rmap_head *rmap_head)
 	return desc->tail_count + desc->spte_count;
 }
 
+static struct kvm_rmap_head *__idx_to_rmap(const struct kvm_memory_slot *slot,
+					   int level, unsigned long idx)
+{
+	return &slot->arch.rmap[level - PG_LEVEL_4K][idx];
+}
+
 static struct kvm_rmap_head *gfn_to_rmap(gfn_t gfn, int level,
 					 const struct kvm_memory_slot *slot)
 {
-	unsigned long idx;
-
-	idx = gfn_to_index(gfn, slot->base_gfn, level);
-	return &slot->arch.rmap[level - PG_LEVEL_4K][idx];
+	return __idx_to_rmap(slot, level,
+			     gfn_to_index(gfn, slot->base_gfn, level));
 }
 
 static void rmap_remove(struct kvm *kvm, u64 *spte)
@@ -1577,17 +1581,21 @@ struct slot_rmap_walk_iterator {
 	struct kvm_rmap_head *rmap;
 	int level;
 
-	/* private field. */
-	struct kvm_rmap_head *end_rmap;
+	/* private fields. */
+	unsigned long idx;
+	unsigned long end_idx;
 };
 
 static void rmap_walk_init_level(struct slot_rmap_walk_iterator *iterator,
 				 int level)
 {
+	const struct kvm_memory_slot *slot = iterator->slot;
+
 	iterator->level = level;
 	iterator->gfn = iterator->start_gfn;
-	iterator->rmap = gfn_to_rmap(iterator->gfn, level, iterator->slot);
-	iterator->end_rmap = gfn_to_rmap(iterator->end_gfn, level, iterator->slot);
+	iterator->idx = gfn_to_index(iterator->start_gfn, slot->base_gfn, level);
+	iterator->end_idx = gfn_to_index(iterator->end_gfn, slot->base_gfn, level);
+	iterator->rmap = gfn_to_rmap(iterator->gfn, level, slot);
 }
 
 static void slot_rmap_walk_init(struct slot_rmap_walk_iterator *iterator,
@@ -1611,11 +1619,17 @@ static bool slot_rmap_walk_okay(struct slot_rmap_walk_iterator *iterator)
 
 static void slot_rmap_walk_next(struct slot_rmap_walk_iterator *iterator)
 {
-	while (++iterator->rmap <= iterator->end_rmap) {
+	struct kvm_rmap_head *rmap_head;
+
+	while (++iterator->idx <= iterator->end_idx) {
 		iterator->gfn += KVM_PAGES_PER_HPAGE(iterator->level);
 
-		if (atomic_long_read(&iterator->rmap->val))
+		rmap_head = __idx_to_rmap(iterator->slot, iterator->level,
+					  iterator->idx);
+		if (atomic_long_read(&rmap_head->val)) {
+			iterator->rmap = rmap_head;
 			return;
+		}
 	}
 
 	if (++iterator->level > iterator->end_level) {
-- 
2.47.3

