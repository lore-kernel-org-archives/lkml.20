Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811358;
	b=aQpGQPxsYIFIxGmEgzRnSHhg3gFG2AAKwvxzUZvsd+aMXAEfZFQEeoj52lPEPpnMAnX1
	 yq3ugZICeRZOy+aK4u6xCGJVEjUjdVAhiJZnz3hCt9kOI6eQRb5ogPeHc/GRa4ZRTWbdg
	 MdzQ+uLA7tXDJG1G06hSOpCTKa9jqs2OVMxo5ZeuiFLDcqOLTEsK2BIa29mZvPwU1G69T
	 jUmyxi/HrmzGNDts3K1w19wxHkNAewT3GcVwbJV1yiAvs3W9GO5XzZ4HVU43Ud7P47fjK
	 B6RH0mxh98j5TXRIiGzfRqcfdTpHCnCq6wfWwVxG6DeIhOpQ10G35n+1wG8CVXtcu+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
	b=ifB6qCtG8dWEDlic0mjXg3nZK+XS2KbvIOO58UCbWz5aJfuHcYjTAEwmKxEV64CyLt8O
	 AvMcVQX8qslt9w9TY+HOnRa7P+nerF19di22SEcal/PGd18tLJ59vBoFP58GlIdzK7LvA
	 rcaRKkTH48OshXdV9T0+oPYVdzzJQVFSWW+H0e8ua/zZXAFRHAnD9xmuwbNLdFK9x2CDO
	 d23oPv+vlvuutTzfnA4EOMuQw5Z6jxl8B+d4P7gQcNRULHeAbESGcigqevOYOg9XyqEYn
	 Hdgd4uHiX2nPaFltOOmEwQEZasp+VKcGFZGoRzaJBNqRSv/bjTBbxkOzwAiZhzw89eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EycCfHSE;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EED606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00EED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EycCfHSE
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so1894587eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811357; x=1794416157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
        b=EycCfHSEmnC3CFQscfhGc9K6l+n6dnpWstzvFxbY/sgIPYFykCn8zDBIa+oXgrvcMa
         lATgPV090nSh34SBkcJD2o5P/IAiOOUJZ9T6EqjWYQwtHFYs3+jJlnP0aSl5YJKnBvsb
         D3HZepsIez9R0xsqvqmbIkK14qdC8qmo1F+tt9+MY4Mgn2c1pNCmzYLqFkK7IcLSP3Ez
         nMiNU6HJ72wXlRUFfjTnzD+XvBK+8GXYnpb8gQh44yzEnH5gO2xIhUy2Ajro6+0/H3a6
         LV4ZNH2ZAQ2mJ/pmbz/77D2ocF1i4FHzguQLCPdF4LogdcdszkoGbHdgKYSUFDWuTs9G
         pCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811357; x=1794416157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
        b=N9ma/KeRRuY+96UE373gLVrM2klz9Edb8FqyThLOnkthcyF6pvVYC3V22wNX6JvtSW
         HmRXHSf4NXCY6dY1bolPtITliUQvwK0LIwFbygbKUBBP/pPZ/1cZMilWGcOW2QHwNebx
         C3tTBMYNhanMwmJVoh0Ka1adYme9p/NNDXfQj3yDE+lpsQ0bK+6fTFjIU9WErLK46Hrv
         +aVLSUAkAJ94LaY/c3USPhKqkIxYLk1TevSibUoZbnrnN70aZ4jl3Jn4dMDGoIHnFjql
         78Ozqc/5EhngA1uoGf8OGTjjxeney554tZGfNXGRcGS945ICW7MrsM1xnAKZ11A1sIfX
         LktA==
X-Forwarded-Encrypted: i=1; AKwUvBx8zDh5XP++JBo5zt67pMeyVfM58Rxo0fgrn3lljXICIFFWMLg+62VuHjxkJvVsr6/QrwrPlCFDDHTfiW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PlFKtYTbxW95S4M7AWY2qfMkMqItqS9pUX4M9B9HUtJkkrETO
	wTTMqriyfNh3aFCAyXUIvKAcakt1Q7N8OhF6FfWFMtW7M5tZ0czdSHwa
X-Gm-Gg: AYBFou00+99L1DGCxHFkSz7PrxgOQ/KkDE+QLYlfj/OOx1MVqxzwOHm8/ak6XBJxKXq
	7Oge1zzwgIubV+49B5KyJHXGqKcmRW1bsUFQ0MfNWi6WuhMTI+3xhaa5xstnrJjoMsi1zfUrObH
	SRrWOEAKiPkrRwrIGwfIjssSKFVzsxn0gMNI59Eic+Lv29wNO2egv4cgbUs8c8fHS+jgqhmm80J
	krYpGCWy2neUeMhB0z3k6QzeynC3HeoPE3JF9Eh9F+EiryW1usLHYkOJTrVANNfhenMOGQEfUL0
	rAvG2X8r7fEPByU6MndpohHDFFOHMTNeqUU1kxDT4K4wiwzKUOwGCqRxVdF3zWaRlLmfBkNrngW
	uWTHyx5XSKl6WJlYGraAvxTBoqp3BvLbSEzcHEu+XFmlVu/UfdCrC3Qdkl5Hwlv3c0NkiD/l6BE
	Tey1Fku9fFVpK6wwQ9UyWwwZUf1Dik3sn+mDgMg3uFKsEQo5QlreaM6heN92Rr71dLnWcxZpAOP
	Ufydv5cZxfwM69saeeEF0ch+J0lw53k2tKmzqy2InJbPv1sjd28EDAAVse9zcYkawhHp5uu/91O
	M3vDqETOJSjAmrYP5xWDEr99cFFhMG9NIBJkI40=
X-Received: by 2002:a05:7301:2a95:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36c9afefe8dmr5108211eec.30.1793811356604;
        Wed, 04 Nov 2026 08:55:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:56 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 04/28] hazptr: Add debug option to force the acquire slow path
Date: Thu,  5 Nov 2026 00:54:22 +0800
Message-ID: <20261104165504.2430480-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH: makes hazptr_acquire()
skip the per-CPU fast path entirely and enter __hazptr_acquire(),
even when a per-CPU slot is available.  This is useful for testing
slow-path locking, especially with lockdep.  It also lets
hazptrtorture exercise the slow path without requiring the per-CPU
slots to be exhausted.

Note that the forced path skips __hazptr_try_acquire() rather than
running it and discarding its result: a successful try_acquire
publishes the address to the per-CPU slot, and abandoning that
publication would leave a slot pointing at a stale ctx, which
hazptr_note_context_switch() then dereferences (use-after-free).

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h   |  2 ++
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 3372b1cdbee6..299ad8a07156 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -271,6 +271,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH))
+		return __hazptr_acquire(ctx, addr_p);
 	addr = __hazptr_try_acquire(ctx, addr_p, slot);
 	if (unlikely(!addr))
 		return __hazptr_acquire(ctx, addr_p);
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 7c3c6017b266..3a2e9d7f58f8 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -265,4 +265,14 @@ config HAZPTR_DEBUG
 
 	  Say Y here if you want to enable those assert, N otherwise.
 
+config HAZPTR_ACQUIRE_FORCE_SLOWPATH
+	bool "Force hazard-pointer acquire into the slow path"
+	depends on DEBUG_KERNEL
+	default n
+	help
+	  Make hazptr_acquire() always enter __hazptr_acquire().
+	  This is useful for testing slow-path locking, especially
+	  with lockdep.  It also lets hazptrtorture exercise the slow
+	  path without filling the per-CPU slots.
+
 endmenu # "RCU Debugging"
-- 
2.43.0

