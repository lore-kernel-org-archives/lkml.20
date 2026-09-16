Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A423DAAAA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581155; cv=none; b=aD/Bbavag6F+FQzaFt8y9J1qnLp4cFw07lvLJydLUB0CPT6eUPNTg79pXphHFFft3sIz4rUymv89R1kzcqC/ZMy7jUtT9xreBq7lz0aOWwCQqduxaY7w3eCm8LPZbk0IU+Z4szXsj/uKa251VQm84bDAmoTdgbz3ojxUQY4H5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581155; c=relaxed/simple;
	bh=nQGbaAqWh7YshXUT6QNEFc7pPP+a+5udNXQpXTsCuqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Puog9TD8xq0SydUzJXsegEDZUXz6G44mLZos9dtqRXEb7bOw0tHTjUVMVtcWyRDKnuioq+2+HiHKBBN1yWaz+YusALaUtIcH5Rq8XLmRjDGk6lSbaCQ00hKkQ/Mm45DVc4OWDzs00BDQkJoMRUuup/dV5NHFIyylnROkQd8K6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgfAuuOj; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgfAuuOj"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b89a8cf7c9so157174e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581148; x=1790185948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=99q2Kz8VLvsm/yvtFk2tFIeyCDvYHKpqJj7kva7BYPs=;
        b=WgfAuuOjta9V3dEEvYzE0qf0n8+JEG/Wa/EnH4VpDeAJtr9eO48zNlepHQKubPStXm
         JMfgp4BdemaDJlnjVwG9tOcmngGTs2s7dKvkgYX6+f5BE6ZA/u5u84UCGO07h3WoMWm/
         GxZiXxPDI8mBFzYkIEh589yejlexdh4r4NVrgw1X0r/dx+uN+StSISdiExOu7MYdmaRR
         dJxM/YU+zJpt4Fx4W7da/KJ3qt7x1W84ZGZfYkSgwQdgrO/n3ZN4GxPPS7vGL4BXcru2
         EO0hsO+qkqEhZWEhX59+5/+lvQUPW1Zw5IrMjnSAK9WmNnFOiQ6UOUxMiXU5ypeNobBm
         bgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581148; x=1790185948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99q2Kz8VLvsm/yvtFk2tFIeyCDvYHKpqJj7kva7BYPs=;
        b=rILsKgM1s+28Y+SV25du8vB7yKc0E1f6Dp8lSoa98zBOQxfIeKcFcA10tGex5GtpzL
         uTXxQzIqAdYoX34EsEwMmpDYjjS2v1zt5yiOICqbJuu/Xa4mKJL9q8fUi6eZRIGnmnIt
         qMVkyCDEQyxEkqYhqjvYYR8ZsBoHPjnrmiOqXDyb7QlStCxnzylSeUcb6XmAphFVfhCg
         SyJ/BtsiSarhrF05BPtXgNXhNjd8/RgisumIkB+LSgkQ8xE9EwyTPvZsgmiZZKqCZFei
         TPqaox5SnNm59+YldCerAeRYeHx/cXNnf+hIKw8X1d7vSKCaBK1JgvKiPsS0dWyuPc9S
         PSzg==
X-Forwarded-Encrypted: i=1; AKwUvBwMw7fWB220Q2Gl1nHS9LUZpcyW4nw9JSVMEuGvu14dZinzdVIHs0IahO0nm6NVMXAIAiObzPhgmdu7Fwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCsgJh0G17CxjlaTEOHkE9jZNtnhKM56gXHRki2PA02OSVO0AD
	x6xoRXpD2UGN7ZaZjDwVYBu2mY+FHWAdBXoixDSo/d2WNE7eDBWTT/1f
X-Gm-Gg: AYBFou13hV9U4HchhPL2t3uspwMdxb5T81nSkDucmsbW12TPqsXLT08lMV/iGdH7shn
	FwPiJ30G1hXVewIDnW23AYkUiYHGJoZdauPMGVDtjRvzJPvgesCbn93bdwRWwo3uS7UF39DsWGW
	RmmDXkuB4vH5V6UN4s8ei0hKn+UMWmuU1eF8rZ5e1JSQ1iIjYPfxpcFB5my+ZIWOAywa+y3QGNT
	i+ZZ29NpHdt4pLWdbYXp+AQn0FolMNZaaD1vGu9Vb8ROCLCn5gq/JYmIK7IvDeub60H1vRcB805
	+Lt108n/l9fc1W/6AqTPbx2O6k2VHTCfNJ+ZqtME3X44DWM23N3r7nr7OYYZKLopLtmM07hYf8h
	zsgI5WNRTGE07MHtPVEoDzjqB0DXPS/cRjHHyLx5FwhAa8+8F4IgpD1HSqbraB0CTlLvdoqr5uV
	JFFyicoGhJTvTk+/HRKgh+4ZYJplcHFe8rrYoZlotu11X/vSnc5ox0otp5Y9j8s4IexPA+R3krV
	rwolZ2RDwhL
X-Received: by 2002:a05:6512:3182:b0:5b8:b53d:89c3 with SMTP id 2adb3069b0e04-5b8b661a3e0mr1304622e87.2.1789581147601;
        Wed, 16 Sep 2026 10:52:27 -0700 (PDT)
Received: from dellarbn.yandex.net ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57897easm1080649e87.5.2026.09.16.10.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:52:25 -0700 (PDT)
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shaobo Huang <huangshaobo3@xiaomi.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] kasan: unpoison task stack below watermark only in generic mode
Date: Wed, 16 Sep 2026 19:51:13 +0200
Message-ID: <20260916175113.1327454-1-ryabinin.a.a@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPU resume and BPF exception handling can discard stack frames without
running their compiler-generated epilogues. Generic KASAN needs
kasan_unpoison_task_stack_below() to clear the redzones left behind by
those frames before the stack is reused.

CONFIG_KASAN_STACK also enables this helper for SW_TAGS. The helper
derives the stack base from an untagged stack pointer, so
kasan_unpoison() writes KASAN_TAG_KERNEL (0xff) into the shadow for
[base, watermark). For a vmapped task stack, vm_area->addr still
carries the original random allocation tag. This creates a tag mismatch
at the stack base even if that memory has never held an instrumented
stack object.

When the task exits and its stack is not cached, thread_stack_free_rcu()
passes vm_area->addr to vfree(). In RCU callback context this reaches
vfree_atomic(), whose llist_add() writes to the allocation base through
the tagged pointer and triggers a false KASAN invalid-access report:

  BUG: KASAN: invalid-access in vfree_atomic+0x90/0x150
  Write of size 8 at addr c2ffffc0a8f70000 by task rcuop/7/75
  Pointer tag: [c2], memory tag: [ff]
  Call trace:
   __hwasan_store8_noabort+0xe8/0xf8
   vfree_atomic+0x90/0x150
   vfree+0x220/0x298
   thread_stack_free_rcu+0x3c/0x4c
   rcu_do_batch+0x308/0xaf0
   rcu_nocb_cb_kthread+0x33c/0x708

The deferred-free path started using the tagged vm_area->addr in
commit 449e0b4ed5a1 ("fork: clean-up naming of vm_stack/vm_struct
variables in vmap stacks code"). Previously it freed the untagged
pointer derived from tsk->stack, so the write was never tag-checked.

SW_TAGS does not need the blanket shadow reset to make subsequent stack
accesses valid: untagged kernel pointers have the match-all 0xff tag,
and the compiler initializes the shadow tags of instrumented stack
objects before use.

Return early unless CONFIG_KASAN_GENERIC is enabled. Keep the mode check
in the common helper so it covers both resume and bpf_throw().

Fixes: 449e0b4ed5a1 ("fork: clean-up naming of vm_stack/vm_struct variables in vmap stacks code")
Cc: stable@vger.kernel.org
Reported-by: Shaobo Huang <huangshaobo3@xiaomi.com>
Closes: https://lore.kernel.org/all/20260806123020.90869-1-huangshaobo3@xiaomi.com/
Assisted-by: LLM
Signed-off-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
 mm/kasan/common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index b7d05c2a6d93..7d21c4db68d2 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -114,12 +114,23 @@ void kasan_unpoison_task_stack(struct task_struct *task)
 /* Unpoison the stack for the current task beyond a watermark sp value. */
 asmlinkage void kasan_unpoison_task_stack_below(const void *watermark)
 {
+	void *base;
+
+	/*
+	 * Only the generic mode needs this. In the tag-based mode the
+	 * compiler fully initializes the shadow of stack variables on
+	 * function entry, so stale tags left below the watermark are
+	 * harmless.
+	 */
+	if (!IS_ENABLED(CONFIG_KASAN_GENERIC))
+		return;
+
 	/*
 	 * Calculate the task stack base address.  Avoid using 'current'
 	 * because this function is called by early resume code which hasn't
 	 * yet set up the percpu register (%gs).
 	 */
-	void *base = (void *)((unsigned long)watermark & ~(THREAD_SIZE - 1));
+	base = (void *)((unsigned long)watermark & ~(THREAD_SIZE - 1));
 
 	kasan_unpoison(base, watermark - base, false);
 }
-- 
2.55.0

