Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839289;
	b=WW9+z/ZSlClr06z2Z5MieGnHlpykqzYRofjPabHM50XK87+8f0JjdjnIqcwZFd5OBF6Y
	 Amtkb/OgShzE5015m4MfG5ILHh3taOIhBMXGzBRnXrITpjN4P+I+cN96yPimfCSvAB620
	 BX313PRGBMBvZu2vnWR7rZJ3KtpnhIJ71Vjm8xVe0Gyj2T3jmyWQD4ERN3gz3MyBagnSY
	 Z4AmLCoR4Kwjx4IpivVe1RuOIJ+7f+GftPVNn80mG2jo01gprsAMS+TWZ/Jf3Yq1/TQNN
	 KGHCPYRWQ9JkRabdWNbQbAxCaEOzIWzZ9pBb4EKdSrurIfzsmkTN0+J1dyheLl0Izmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Mime-Version:
	 Message-ID:Date:Subject:From:To:Cc:Content-Type;
	bh=ESXbxwCMg0EOUGyatJ1Rbb2E3CVLZe4XssO0nIxPkVc=;
	b=5Gn5pOaRy3QL+t8WKNWrX588y149AmOnuv2L3YEqsRENqhonbpIccBsl9KYZyNbpa/4F
	 x+TzrKgeJ6T2pHeS+TnL53rvHjoTYXaziUYafHs8RpTs6qaP2NJUE1pSaz8UnEhUL32FJ
	 r4NLLj9uW8oF1orRUE9Wf3QoCNVInLCUjdm5Il7VqPFIq5JraWFsbxNYyvzwNI7WbYK/v
	 S6WayTBeAG9h/VqYxscxgUhIILPLvEpC8jYIr1NgbCIW8rlkOyMjBZX5oChdrqiT6AdEB
	 /CxXdGsW5zHknTXyuqHhfamxZYQSn377W4w1oRt/kdWZwjKYRm8a5ZpzVwIvFhzwlXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Jdqvikf/";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9DE606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jdqvikf/
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so203543c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839288; x=1795444088; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESXbxwCMg0EOUGyatJ1Rbb2E3CVLZe4XssO0nIxPkVc=;
        b=Jdqvikf/t2xwSCCfWsRwJZe3IiInL6jBtPPXYLL94IPrP6Qo6FE6iJem6RaUf9JODe
         tBRR0G3UapQX3Z2EbStUNCXBK6FDNI8JTEKueZbY+TnkJKJ442TckSzLhDQN7J+VWxox
         Ks/3ND7nHDm7RsOP2w79sr2JY6WA+4Q9twH1RXioMlMAJ7B6DuzJIFHCe4XN9FmZGA2I
         IwR7TQU60KFTh66b2xNB/P4yA1FzVMS+j8nLd1cgPRmgsy+XNAgZ94zbGbXxPlvN2T92
         fZ4IcDNJo8vZ/NFbR6yCMmXKdIy3rK6HVeYeLBu4xj+y22Oql9Anf/eO84V9JbngiKG1
         bqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839288; x=1795444088;
        h=content-type:cc:to:from:subject:date:message-id:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESXbxwCMg0EOUGyatJ1Rbb2E3CVLZe4XssO0nIxPkVc=;
        b=va7ORtKXozPYEmh1/K+R9hHZqyeNPJnMtxLryWON6OLzCnYpuEBsAmNpIiLbXUt9BI
         fgCiuI/LfJEjUF20r8kgJWtkdi5rj0lQ0IKHtD4/m/HBal4lenqvyJ7paGt2TAMK6a0c
         nSJrwf2IJwJcgIplPT33UD4NAI0vi2TEX9LOmfO8mP3H7fH5+u5wczNd39T5G7Q1vZbi
         IlToAoOpsxoJXcvzxNukmF2yN68Az1NwhUiz98RI9ErtzGlpv92105+MliSJdqw5UEs/
         4SX3dPaB5xztVzc4e0omK8alDN1yaObtLKymnq2FLXj1sjvdGlVI/PhavhHvhyNe6WVs
         0zsw==
X-Forwarded-Encrypted: i=1; AL+hErGKo+YJXRKdv8zUkgyuia1NOvixzqsVmvsyroh2Gpv9loYxYkbOY1e9acjnmlWqU6qz0wYIwRHXdP6FxbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wOWqyVqhGwwggI1V1GzTYTEJiWm7dJARlgrn98MBf2fedMoGi
	tj0Tn4SKgZ+f35TKV9OqtrFuEOpMFNUfMIjLwP+hCCIkeAU1azaF2aGU58+NJLH13rdYTKcIGC4
	IIVGyHfelGUXl2hqNPuEnqWOldSoINQ==
X-Received: from dlbtu19.prod.google.com ([2002:a05:7022:3c13:b0:1a7:6a69:e56b])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ed07:b0:1b2:588e:f89b with SMTP id a92af1059eb24-1b503169362mr10450930c88.47.1794839287889;
 Mon, 16 Nov 2026 06:28:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-ID: <18e88cd2a725491b.3137322e32332e3235332e313736.c1dd7.0000sendgmr@google.com>
Date: Mon, 16 Nov 2026 14:28:07 +0000
Subject: [PATCH] percpu: skip sidelined slot in pcpu_balance_populated()
From: Chris Wiseman <chriswiseman@google.com>
To: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Commit f183324133ea ("percpu: implement partial chunk depopulation")
placed pcpu_sidelined_slot at __pcpu_size_to_slot(pcpu_unit_size) + 1
and moved pcpu_free_slot to pcpu_sidelined_slot + 1 so pcpu_alloc()
checks sidelined chunks before free chunks. pcpu_balance_populated()
also loops from pcpu_size_to_slot(PAGE_SIZE) through pcpu_free_slot,
but was not updated to skip pcpu_sidelined_slot.

When pcpu_nr_empty_pop_pages drops below PCPU_EMPTY_POP_PAGES_HIGH and
active chunks have no unpopulated pages, pcpu_balance_populated() walks
into pcpu_sidelined_slot and repopulates chunks that were just sidelined
to save memory. Because chunk->isolated is still true on sidelined
chunks, pcpu_update_empty_pages() does not count those newly populated
pages toward pcpu_nr_empty_pop_pages. That leaves the global empty page
count below the threshold, so subsequent balance passes keep refilling
every sidelined chunk back to 100% before reaching pcpu_free_slot.

Skip pcpu_sidelined_slot in pcpu_balance_populated() so sidelined chunks
stay depopulated until pcpu_alloc() actually needs them.

Benchmark results (4-CPU arm64, 4 sidelined chunks with 60 reclaimed
pages after triggering pcpu_balance_populated()):

   Metric                                    Before     After     Delta
   --------------------------------------------------------------------
   Sidelined pages repopulated                   60         0    -100%
   Sidelined backing pages (kB)                 960         0  -960 kB

Fixes: f183324133ea ("percpu: implement partial chunk depopulation")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
  mm/percpu.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index 3eff382e565a..ca83773a6728 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -2045,6 +2045,9 @@ static void pcpu_balance_populated(void)
  		if (!nr_to_pop)
  			break;

+		if (slot == pcpu_sidelined_slot)
+			continue;
+
  		list_for_each_entry(chunk, &pcpu_chunk_lists[slot], list) {
  			nr_unpop = chunk->nr_pages - chunk->nr_populated;
  			if (nr_unpop)
-- 
2.47.0
