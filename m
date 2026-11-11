Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411910;
	b=Og5IC6nkpJJe3hmzHm/fgAYMlNqDvhstlhbZ37XlxjWhCeDg8m15JwLMFzJ6uPSabW2D
	 8AFkWniBdYOp/Mg5tbLU/yHbsl0WEUn70rlaNi8uDPOfVLjs0D6ORjXzpOB+CL7u/Ef74
	 eFh8CT5iM93qvbuzE84tNm1i7zouYPzVfWpqgq4r1iDi5P0UHYmsW1bAgnakG5DaCXNXo
	 VRdLn/DKbzM/mVMNpDs9jQGIgMiIOXPELxoJ0uKMVItFELNXjZjfC/wdBHdrUJ+zN66Tu
	 XJQ/U3SufqoTqST1pew5V0vFr4zXni2etway4Rbng3Ie1eewvz4q9Ffd3ad+WJThv1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sJv/vQe3wv4xM1igYaOZea7+QqPV13IlBCEtGrk80JI=;
	b=JJaYJnyd/Hoj4uiDs1fTk5hMH1wJiCj0n+3+ctK5jhFRk8CSepjzoXYuQj3xrUZf0zHQ
	 5i9DVmkrAnnYumj3NjVmkxSbmEj9UIv0uGI3GHZa/mD8lB9UfmXEygzJImNvQeMDtMDdH
	 cwr+yrEU9KMBGbhCEohYtXSxbWltfr8y0uENa63Lda4fktaLLTo5Sx6GTWBiiWt/dk1vI
	 ljRinIpQS+Gk9sxMTjdGv3TnHDLnz7BwZUIBjzPRd0vddcUqYc0Wu03MWHDByDs3XNCkA
	 N8/sof8tahB5v3vv9HWm+N5/BKXhPuifjuPp0ipa/b7HgnY2PEfySJsFSEc6qLUS6gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Mz8s7WAp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413C2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Mz8s7WAp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2225303f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794411907; x=1795016707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJv/vQe3wv4xM1igYaOZea7+QqPV13IlBCEtGrk80JI=;
        b=Mz8s7WAp/GmqYam1kVEfEu9vJKr6shFKC56WHoNHjCDtj9xo92HcnMGNfdlksRkdTL
         4LaJXIzUzJClzqFK+sCCe7dmQHUHTtIGTUUuhGPBF9hxaDpcDrOsEyyYbw8+wO08Fiu7
         VtqTx4YcWVw+/EderlIg9oRIZfgrL8xE2m/pALHBrBR8SHkHbXmOSVmll6gQ0p3EGb4P
         7jHNzqaVDmXl7dpm0hZ4cswlK0zcJDsD/D2Uyu/RrnvnB8g2SOJf8z6+QHtgyd3bC+q3
         vVJnIc+eQBJpYKQZ0LDQuFywMVapIkDdYckCgbVUFfuNQflwPHq2qe18S1RVW0seFOFL
         y0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411907; x=1795016707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJv/vQe3wv4xM1igYaOZea7+QqPV13IlBCEtGrk80JI=;
        b=mkNsQYvq4mmojscEVSyQ9x+oCg77ePtHngUIqZllO1/Vr5WYeMZer7Aj1//ioymdie
         oSnhhSaz2EHATiRkbsFkBGdsuKb1i2Sl8eft2qD9x7ujR50kgew5xzV5NyL4+C4iGmKT
         8IF3f0+UT8/TwqXKwt8uZzL1fR+ArkO0jCil5vTO8TjHXvNqLF/sUwCu8jL99U1sAG1c
         +BOba00YlVhUjGaOq2AhL6Kd+xoIEev0El1K/JqHCXYyS10u9xmbbdsrgJo7XyKux/YN
         kewiaI4i+YBpn6IDlrwvv22HFF5zNya4B6xMZQYWBOrtWa2CkZCNpknSDvu3k3TDgbg2
         uncg==
X-Forwarded-Encrypted: i=1; AL+hErEPdc8e+ZCquPz29Uzt/+mlT1/Z3IW70N2q+gzyXsiNb0/PvNb+q5oW7kHLriyDd3BdWkvfRQDSVD3DfZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IWfCrcAqXSAtQbjHRvrZhyNgT/mMry4v+hUyozkkkQzuv2ypQ
	dY2n8WCerysa5mV+cxjdUg2m/bXgmULEd+FUF/WolmK08uEg0mAYE+Q9FPa14k/klv4=
X-Gm-Gg: AYBFou3M6cdb0ZFpsM0/FAr56xREt0MviddPOOc4WjyDxOgrQd4baG1uK2TZE8svokY
	U2LVhqVm0WW0t4HijMiek2Z5CFspmGCCm0tZGv1TmsfF83EdKJquwdzIRGPg9UF3xcsJsekq9RZ
	Ruqyzn2JzA1mVrIUTAwMQs5qf2dNAhtqV2RE7wRa61lHgMdQuemMom8KSpukmA8PbkrZqodQU7x
	iUel0uARfi/yc3mkr4CHAwFklkp8EFEb18geYCKlv4yJAudn1VYF8Cb/98qjutO6ntTIBoGn2rB
	OdixP8AAquu3TS8W6iyM5pLUgx7fFTv6hdszQKICLZsFkVjto1rlOCJCPYe6VRoWHba+qZFVTkO
	0UH3O/PuOug2VTAg1T5cy0csDtPMI6Rp22ubzp6rd8TzV9+kdTli8msBfS5Sxc3WtaY7c8yfHvC
	ZD009lw9gRftW31kAd6pFlpm1WExJqE85YVY3kIFPRxy6XQ7dqC24uwpgQbmR1UVq3X7wFKm678
	07Gf+kGh/wKhmLmCLuOxj/4uN+XAM5mAweYLMaeMv/up5J7RIxrzM7wj7zUzfz8GCGUbiTIG8Js
	SLwryZx7632vX04lZ94Qe8YGaD2KEQPrki6HnPGMThP4tnY0+utckGtLydQRTX4obTBq0XgKEvy
	eUy3x6zr2musktmtevnWhuHhgtmUC+s4=
X-Received: by 2002:a05:6000:3ca:b0:498:1a65:50ce with SMTP id ffacd0b85a97d-499c7a24ac2mr4382494f8f.22.1794411907466;
        Wed, 11 Nov 2026 07:45:07 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm12392832f8f.41.2026.11.11.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:45:06 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Max Kellermann <max.kellermann@ionos.com>,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fscache: make the procfs cookie listing optional
Date: Wed, 11 Nov 2026 16:45:00 +0100
Message-ID: <20261111154504.1314170-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
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

Add FSCACHE_COOKIE_PROC, enabled by default, to omit the diagnostic
cookie list and its maintenance when not needed.  Caching and counters
are unaffected.  Disabling it reduces the size of the struct by 16
bytes.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/netfs/Kconfig          | 10 ++++++++++
 fs/netfs/fscache_cookie.c |  8 +++++++-
 fs/netfs/fscache_proc.c   |  2 ++
 fs/netfs/internal.h       |  2 ++
 include/linux/fscache.h   |  2 ++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
index d0e7b0971fa3..881b081e3a52 100644
--- a/fs/netfs/Kconfig
+++ b/fs/netfs/Kconfig
@@ -44,6 +44,16 @@ config FSCACHE
 
 	  See Documentation/filesystems/caching/fscache.rst for more information.
 
+config FSCACHE_COOKIE_PROC
+	bool "List FS-Cache cookies in procfs"
+	depends on FSCACHE && PROC_FS
+	default y
+	help
+	  Provide the diagnostic /proc/fs/netfs/cookies listing (also
+	  available through /proc/fs/fscache/cookies). Disabling this saves
+	  two pointers per cookie and avoids maintaining the global list.
+	  Caching and statistics remain available.
+
 config FSCACHE_STATS
 	bool "Gather statistical information on local caching"
 	depends on FSCACHE && PROC_FS
diff --git a/fs/netfs/fscache_cookie.c b/fs/netfs/fscache_cookie.c
index 5a226f9cbdea..fe0832ec2056 100644
--- a/fs/netfs/fscache_cookie.c
+++ b/fs/netfs/fscache_cookie.c
@@ -23,8 +23,10 @@ static void fscache_perform_invalidation(struct fscache_cookie *cookie);
 
 #define fscache_cookie_hash_shift 15
 static struct hlist_bl_head fscache_cookie_hash[1 << fscache_cookie_hash_shift];
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 static LIST_HEAD(fscache_cookies);
 static DEFINE_RWLOCK(fscache_cookies_lock);
+#endif
 static LIST_HEAD(fscache_cookie_lru);
 static DEFINE_SPINLOCK(fscache_cookie_lru_lock);
 DEFINE_TIMER(fscache_cookie_lru_timer, fscache_cookie_lru_timed_out);
@@ -68,9 +70,11 @@ static void fscache_free_cookie(struct fscache_cookie *cookie)
 		return;
 	}
 
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 	write_lock(&fscache_cookies_lock);
 	list_del(&cookie->proc_link);
 	write_unlock(&fscache_cookies_lock);
+#endif
 	if (cookie->aux_len > sizeof(cookie->inline_aux))
 		kfree(cookie->aux);
 	if (cookie->key_len > sizeof(cookie->inline_key))
@@ -363,9 +367,11 @@ static struct fscache_cookie *fscache_alloc_cookie(
 	INIT_WORK(&cookie->work, fscache_cookie_worker);
 	__fscache_set_cookie_state(cookie, FSCACHE_COOKIE_STATE_QUIESCENT);
 
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 	write_lock(&fscache_cookies_lock);
 	list_add_tail(&cookie->proc_link, &fscache_cookies);
 	write_unlock(&fscache_cookies_lock);
+#endif
 	fscache_see_cookie(cookie, fscache_cookie_new_acquire);
 	return cookie;
 
@@ -1104,7 +1110,7 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
 }
 EXPORT_SYMBOL(__fscache_invalidate);
 
-#ifdef CONFIG_PROC_FS
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 /*
  * Generate a list of extant cookies in /proc/fs/fscache/cookies
  */
diff --git a/fs/netfs/fscache_proc.c b/fs/netfs/fscache_proc.c
index 874d951bc390..6ab23083cf01 100644
--- a/fs/netfs/fscache_proc.c
+++ b/fs/netfs/fscache_proc.c
@@ -27,9 +27,11 @@ int __init fscache_proc_init(void)
 			     &fscache_volumes_seq_ops))
 		goto error;
 
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 	if (!proc_create_seq("fs/netfs/cookies", S_IFREG | 0444, NULL,
 			     &fscache_cookies_seq_ops))
 		goto error;
+#endif
 	return 0;
 
 error:
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 6b583152132f..855fc47fbe6d 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -406,8 +406,10 @@ static inline bool fscache_set_cache_state_maybe(struct fscache_cache *cache,
  */
 extern struct kmem_cache *fscache_cookie_jar;
 #ifdef CONFIG_PROC_FS
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 extern const struct seq_operations fscache_cookies_seq_ops;
 #endif
+#endif
 extern struct timer_list fscache_cookie_lru_timer;
 
 extern void fscache_print_cookie(struct fscache_cookie *cookie, char prefix);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index ecd14d645690..b4aedcfb5945 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -109,7 +109,9 @@ struct fscache_cookie {
 	struct fscache_volume		*volume;	/* Parent volume of this file. */
 	void				*cache_priv;	/* Cache-side representation */
 	struct hlist_bl_node		hash_link;	/* Link in hash table */
+#ifdef CONFIG_FSCACHE_COOKIE_PROC
 	struct list_head		proc_link;	/* Link in proc list */
+#endif
 	struct list_head		commit_link;	/* Link in commit queue */
 	struct work_struct		work;		/* Commit/relinq/withdraw work */
 	uoff_t				object_size;	/* Size of the netfs object */
-- 
2.53.0

