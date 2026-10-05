Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B184825B5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205360; cv=none; b=kqQuzpej/fg4dWXwfHa7IvcIjTGInn/t/UAdHTIpviC0Pw8NltC4Z3ugs0X01VKbHgcKLC7HZIu1pH6MrKvK1NccOigcmekcsFFr/N9k+6sldfMuOeuFf/oFe/t1kFEll4S170Ln9F7j45mfoxxUdkEsaf3ETNtCgwKczK7iVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205360; c=relaxed/simple;
	bh=CDfaEShXrMYOYgZSl1oxsCKdKM5taZ1dfpXvOPGn0UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiwL6ltEmR7nHm1+d5AxC0aFxiL0O5+DcGOQ/82jj+fgO9/Qi9LvRm5Zn4vN+ZYxPBuN2zdLCvr7wWjFttNTyA3sk+y4EycfBsf5d0ZCSga7OhO4rtRiFXV9KdotDyENQwCjZrGs7SNy8BJaezMAPt53clYwb0LjOx3Pjs9IyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxwJW5ZU; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxwJW5ZU"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so890943a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205358; x=1791810158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW3ihpEXb1U2gPYZCvxngoSeqPeNauuAZiT/ULhD+3k=;
        b=rxwJW5ZU8+tAGLjNrGZbf4KFFv+q+SJ1z/u/PR83g174vM+s5a7StRYL06XTqc7QiR
         fMaiNepR4Fx9yIZOtwo3j2jmmII8+kI+6kkIM0JU3vkyy+J62cl//VXLnk8LEa9QWuuj
         0k0auo5vhCUH7DjmuuOzKGctMKXpdhkX3ualo1Bq6db6eiFzq/HpHj6uJuAY3Ho4MNo0
         d0YnBYM/n4uvESNbm/RQ4i74dZO39fv0r4cQHYENItSv+0MT7zPjdAq6uxqSr20cDs0+
         5ReH9qRPMMQNK1l93Hm8LH10apHy8eUV36XNjZXurQ0Mv+dcWc3PH2zfbQYvNu7Fbjot
         /hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205358; x=1791810158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WW3ihpEXb1U2gPYZCvxngoSeqPeNauuAZiT/ULhD+3k=;
        b=c9cEzNOdn8oq1HlrNVNQ5dltPNrMSdFZTPCuFltKCmjJtx7ifSZycq8XD0KFpJSpNa
         Wibh3ZdnNGsv+i2DvwY++nBlcIMzjeWROZ5BWBOkSj8WlETU0sAJLgKxoB+5Dxk8DZPg
         9ExWIB7TjvTd8VySgXeR72CTLthRod+WAXdgXwrSZDXlMnHyh4dR4+2ocBe0QPFEeyyJ
         aNTZr9wVezPwtOabYglzgbV4jKihuBrOCsVRvlQ97Djqhk7bl86aytuq6HwvrM6Hl8Wd
         t8v1HwrlkyPOE0ygwTXIQ5cwZztk2+bHflbk+/Gbt+hn1XIAj3RdFjKJemzMwQZ7vkOj
         w9LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYHWoB9/VkuV3Sppd13ND8VBWYsM4RONbw1bmkU8w28dv3/LaArcUBLFZi5UrXB79a68nMawVIzL+1nN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyDn17IcfZu/v4BVND+jwnHcZpWqySWGt7PMa6ikEYfDNAljy6
	sfFLyxZ9bU2aFezUCR/9oaKa+7tvYI9vwaM0UgjNMdO+JMvGEoXnvLFxi4q4iEZ6/W88lg==
X-Gm-Gg: AYBFou1eDxXFIgljujCvRBu0FcYA5ihm4GhkZcNSdqXYbhM+7BNP65/RMJ0aq96SJJ7
	PQmGjeLZYflMtpdnsT1ERaRoBPnV0GCz0kLSWbr1CPP4JimhfVa15l4FZOHC6Q8NmAlGasnsA6Q
	otPS75q6WftB514B5j6LZUdHxJR3co5dVtP0WsCCrikPj6JgnMF8l/prOfa/cPEgrydpYnVg17V
	zZCeE11gXfUQx0vVje4f7PGSvoLo1XYIEpj3tHxHY2QG7/MSm5+tT5doVwU/uFW/1xrTCJ1U/EL
	rcxkathOgWPWgfwh51GVrNfOTDl7uX4Hh4qaVtcjWbGxjR+2RcMDkXVzquAhj/KHrboPSgPHtYM
	23wE7cAI2vJVPDL+wGssHKj5mcnTU3T7x2YcUb4gBDSDhIqL0Hmw20yO3PxSVIFKYwijK/Ke5rX
	vcpcMESLCS+u50vJ5psTEdf40VglC3jbtACTlsqK91iatY18EaKCC8HrzQJQeRnMmLPYdtDVDCK
	0TcE2P5kvOWVEY4DzUhk0o=
X-Received: by 2002:a17:90b:4f4a:b0:3a4:ffa0:23f3 with SMTP id 98e67ed59e1d1-3a6cec2c05fmr4478911a91.31.1791205357749;
        Mon, 05 Oct 2026 06:02:37 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262cfsm11142892a91.6.2026.10.05.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:02:35 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+342762971f666337474e@syzkaller.appspotmail.com
Subject: [PATCH v2] x86/mtrr: allocate the cache map before taking mtrr_mutex
Date: Mon,  5 Oct 2026 18:32:14 +0530
Message-ID: <20261005130214.1775-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261005102152.368-1-yogeshgaur.83@gmail.com/>
References: <20261005102152.368-1-yogeshgaur.83@gmail.com/>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtrr_copy_map() does a GFP_KERNEL allocation with mtrr_mutex held.
It runs once at boot from mtrr_init_finalize(), but lockdep keeps
the mtrr_mutex -> fs_reclaim dependency it records there for the
life of the system. Once another path gives lockdep the rest of a
cycle back to a lock held around mtrr_mutex, the next MTRR ioctl
reports a circular dependency. syzbot found this through nbd, which
takes cpu_hotplug_lock (via sk_set_memalloc() -> static_key_slow_inc())
under its tx_lock, while mtrr_del_page() takes mtrr_mutex under
cpu_hotplug_lock:

  WARNING: possible circular locking dependency detected
  syz.9.5848/21744 is trying to acquire lock:
   (mtrr_mutex), at: mtrr_del_page arch/x86/kernel/cpu/mtrr/mtrr.c:408
  but task is already holding lock:
   (cpu_hotplug_lock), at: mtrr_del_page arch/x86/kernel/cpu/mtrr/mtrr.c:407
  -> #1 (fs_reclaim):
         fs_reclaim_acquire
         might_alloc
         slab_pre_alloc_hook
         __kmalloc_noprof
         mtrr_copy_map arch/x86/kernel/cpu/mtrr/generic.c:413
         mtrr_init_finalize arch/x86/kernel/cpu/mtrr/mtrr.c:618
  Chain exists of:
    mtrr_mutex --> &nsock->tx_lock --> cpu_hotplug_lock

The allocation does not need the mutex; only publishing the new map
does. Allocate first and assign cache_map once mtrr_mutex is held.
The rest of the function is unchanged.

Fixes: 061b984aab58 ("x86/mtrr: Construct a memory map with cache modes")
Reported-by: syzbot+342762971f666337474e@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
v2: Incorporated review comments, assign cache_map = new_map after mutex_lock()
v1: https://lore.kernel.org/all/20261005102152.368-1-yogeshgaur.83@gmail.com/

Built with W=1 only. syzbot has no reproducer for this report, so the
fix has not been runtime-tested.

 arch/x86/kernel/cpu/mtrr/generic.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 67cf69f24b00..92c3fcb7fb6d 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -402,15 +402,19 @@ void __init mtrr_build_map(void)
 void __init mtrr_copy_map(void)
 {
 	unsigned int new_size = get_cache_map_size();
+	struct cache_map *new_map;
 
 	if (!mtrr_state.enabled || !new_size) {
 		cache_map = NULL;
 		return;
 	}
 
+	/* Allocate before taking mtrr_mutex, the allocation may reclaim. */
+	new_map = kzalloc_objs(*new_map, new_size);
+
 	mutex_lock(&mtrr_mutex);
 
-	cache_map = kzalloc_objs(*cache_map, new_size);
+	cache_map = new_map;
 	if (cache_map) {
 		memmove(cache_map, init_cache_map,
 			cache_map_n * sizeof(*cache_map));
-- 
2.55.0.windows.5

