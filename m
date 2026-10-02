Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCDD4FE2D3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961008; cv=none; b=onRE2WyVjaCL4pvG7NSp5cTvmSP72l9nfsy0GQprt8fnyEBgBlJd272nsEuun0DFsr6YLt5/ffgEkOlW1BCtlInArwrqH867fOqMBuYv8O8Z0nP0ASkn6Bjkk95mZUWVy/jlJq7+UduBHeIbVuiA37U6xp1GFA/86BTnKY5X1/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961008; c=relaxed/simple;
	bh=9wEbN2n5LQFaWEnfgc/fjcdj12CgL82mEepIN/jxNKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oaJ7ntQ0TVG9lMzhQrshK7GeqGt3IrPS1UBwBxJUf+QawTfE499UtoKA2KwOSQSb1TblE4fL8rmRnRDKsYMfeZBr5yeQE27rYIpF1Zl/At9F7FwIGkiJzNCMlPaiRQh7WvU5ozF4sThlumex6el7+DIMFZjI0h8nLamGKo9m1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dalPDMRq; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dalPDMRq"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so114485a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960998; x=1791565798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=dalPDMRqF/pTMZKC7gM+vbuuHhe+AzE9gT3Z6UtI20aEydFwMb2S3ppM8uHDc4kq67
         H/5HHerSCV+pGQ6iNfXLUDLrmLvI9zQHbE+D8F14nVDrMeZZ76mjeF4RYasyIGFuyHjc
         bJZ1eRwSeTr09fQyXxUTfGaW9GEcX6NrqQb7BXe9o/VWo1heh6veKHTWuc+bb6y1XWeT
         7ieFI9GptxE5VYBmWMT3+gdABLWqRDSPcE3jmT4m/e1sxCTm8dgYz59rAb3+fi01bSTh
         4/1sIBX8Mogz+e84NsEJZy107IZm5s5lIh0jrd5wCH0gpKTXZ4JHAut6q0afhEaOaJdZ
         +ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960998; x=1791565798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=SX4nD215VFwjPLsSL0u0zGbkPYREVnmaglHrJ2xeUa40ddk/IdfaHceE6n+cqt0WPQ
         uixHXiug1Od5AzakRJRb1LP9ZM1JSCDyWv/SJh3EBOvByCf9w1hgWZyPHpyFFFxc34IW
         JsBxO07BznuMy+a/Zgbag/aBlkfwat2bf+vRXDgmHY/t+18jGS5SeFQ43E6gzwT2wJZI
         FT5KYZ6Pvb6GWVCxlxucY2lIpS4WFXyxuioihsrjGR+ViBPK05H3P80y13rvZd0KXOkA
         3PYmopHfZrf1nSzRtDK6QaSF9edyKHF75pFvCDEL6JoZJUDPb5qiWgnj7JN5ALXZbhMR
         r1sQ==
X-Forwarded-Encrypted: i=1; AKwUvByCARr4UOWCekPLCyHsPs+Aw19oHS4RSH9zRMyDoyhgbTV32QaBwy16RAmCDVquJ5TkOpZM8ARlgRwnzCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUS0ehp28H+KgQ/OI3m0jyZmbwetm8Vn6A6RPCbQVDdWioe++K
	A6lsF7QIlLTKaZW69EZkunr3vCsrueEQnqxQbIwE1H9M45Pa4Dq25vRu
X-Gm-Gg: AYBFou0cDVJuMZSglFwse/+ousTYVC/fQjPM9yptfV0H4Wp/5HHYGIrhqcgUx5Kh8Fh
	j2dsNpTf8VRoG3NJWVeDere5ESql9hq8+CmMcpV7vkkderUbklCs6HqG9abjcT1Ys74qIEAE6Bt
	Kzc4+t7l9kO7W/jOiEV6Vd06pzgEbOpaqyFacwtjDY5emkpygEM8zuDYog+auWsrD4CijzL0Lwg
	c4nSMLr8zNxKSDTORkVU8ggDAQTXM2n9Yi4jDx89OMEiUOWOhxSevWVuakYOspg1NHW5mqmzG3O
	kx6lE6SEsirYBYrGlrvv5cMoKO7rCHcrFQIe5fKHbS4Fdecpv1c3Nd6R+UnnoPC6B26CU+FqpyS
	9u+4PQB4OQKKWBuEaYiev7EkioD8c/Uds8ADDgumtaFKRr0m3vnfxK3lwd8yQf6fRdDesGilj/Z
	iVoxkPmzWTw9ubZFrVMEr+wXbJQ6glG+wD/t0kLCttjHD/9jLri0JDH/p53/JubiebsmbtZK8Lw
	0blQbafMZd4dDIuMQ==
X-Received: by 2002:a17:90b:39ac:b0:3a4:a7eb:1da7 with SMTP id 98e67ed59e1d1-3a6ce7f8bcbmr2920094a91.42.1790960997498;
        Fri, 02 Oct 2026 10:09:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:09:57 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 05/15] hazptr: add debug option to force the acquire slow path
Date: Sat,  3 Oct 2026 01:08:37 +0800
Message-ID: <20261002170847.3653663-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a debug option that makes hazptr_acquire() always enter
__hazptr_acquire(), even when a per-CPU slot is available.

This allows the slow path, including its lock acquisition, to be
exercised by lockdep-heavy workloads.  It also lets hazptrtorture
exercise the slow path without requiring the per-CPU slots to be
exhausted.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h   |  3 ++-
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 275cbe54b075..4ee02d23abc9 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -245,7 +245,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
-	if (unlikely(slot->addr))
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH) ||
+	    unlikely(slot->addr))
 		return __hazptr_acquire(ctx, addr_p);
 	WRITE_ONCE(slot->addr, READ_ONCE(hazptr_wildcard));	/* Store B */
 
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

