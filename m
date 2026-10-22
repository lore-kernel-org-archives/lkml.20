Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658927;
	b=5QjkdTRpeqqEIAlKFxVjrW70AkybeKFXk5P3kiV6qbrhbf8EdTT6rAWv2ssvCqAUcgtp
	 UFHv1s7NWyIKiL8nAxMKevxcwBArQetrVfdbnY3a+81xNtyHV3f2OIV7rARKRUI8Ik6ZB
	 vHqkZfbTqz//WIQckD6QPopd7BQDXYmlqK/dj3ChrxUEIixE1cwkdHuqoEUL4tI5pxZ5i
	 SNreKMf10v6wScgnp8BLgSaYCXO51nFPJWEI7sK1Rq65XISOdJEJF8NfU51GAl9lZ0zG3
	 AQgpZPmjkDYwpLFyZNQ/rWzY4cdY3ZgYQXrRzYen/VLcYmCvptwRw3m5YE+cw25Khpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4ExUq/OiRoy6v0DOAUuIV4LjAOQa0JqbQKdInvj7hio=;
	b=jMMYqsCNCIxiDFG6raJ/RWKT103a4Rqv7N2BLnjFPfBhbNAUIiYuQtcuoEDBtFGXIrCs
	 t7whcDUfbRBamprugtmGqV6yKOyGC+kHTAg7wALwRe/Xsy6WJ997M3ZbhHfhWEBZoltNf
	 LrIBX5KJE8newrs5eWhZ8dvxIn7D1A8iNCc0HuIEuTuhE41jiLLJM5stc5/+jkujnU6ky
	 v9ylOpbre6iM8C/EtfNOF8SH8aFb41Ykd5Wz91Vo25XmRGccfdygRJOtTumscPVHmIsIo
	 cywv54KY4tatiWWfGMZiS/Ym712jxIXeGeCGIu12auw3TI0iAt48zTjYq/pHWwm3oEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+yZc2Zk;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBB7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+yZc2Zk
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2826812eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658926; x=1793263726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ExUq/OiRoy6v0DOAUuIV4LjAOQa0JqbQKdInvj7hio=;
        b=s+yZc2Zk0aUrpkm3TdzIZRhuwxBS+KXQWMJaTVdZLmm9gge2brv8foEli5l5DvxWsq
         zAUIPIg8H95314NepUq5Qxn38FNZJ7yzJ502v1xULuzxmrmZw8mxoURVTM4KojgiMPBR
         THZGayDJmvr42+O/abedsaHiBXzo9pnDhnLrvFPv9wGyEKA6BH9D1UIosIwdxaNUdzYU
         ZTGIDiYN08GmdSS/AJTB/S/GT8WgmmCJZkAf1EfNwyflgkG5LfJE6147lY2Drl9PcfmT
         +pTU5uGv8yxkftnGZWdImDJtAi6qLpE1qEUqRmzNGlp6ATJ3mbH9gESAcufytB5sJwAf
         Gw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658926; x=1793263726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ExUq/OiRoy6v0DOAUuIV4LjAOQa0JqbQKdInvj7hio=;
        b=E102W+dloU0S3Z6y7792XXeYnrinH1lWcJIbqEZ+ofVUxsCWUMRPC9OTpFGKZ4zPkO
         V0T+mWP+TU5QO4Cb4/WW2qCWojR5rHKG4wmuIT9A162/2urlHPhv5QT9NdGW53KffvJ6
         uxSjNiIRdfUXWvCUijohHFhQgBG7KPuJBIS3f/vA7QSflDyHd0G7JXwg0/Agn/dzTlMD
         tYi/UsSb03KnP952qM6qluNFDAw7gJWESKwp5uWifsOqgoOW0Kp7a+LhU60BA+nboM28
         xN6XgWmxH1uV/fX5msu6OhR14Mx/v+1nK2DjEdf6fOieN5BxaiKWDVYktMvU2qlgOeN/
         GVmw==
X-Forwarded-Encrypted: i=1; AKwUvBzCCoITiGHQjxWI0rZJGW0cdju5GYLmD499Cf9Rr5I0a9/jNj+gDO/813HUbSHRXys3XutVYBhLslx6xZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKig82045a0lZnszM6GU0SrcU8fz434sm2ykf9n7SkuA7NWgu4f
	7nvK3bzFtlMa+zRSqMiUkAb/4q1rwyxtG7nssQ8uE5NlrKjuZKZTHJeh
X-Gm-Gg: AYBFou3lb7GDe3LB9nG37T0Y5tAllukT1xWlrT9rVt/cuqKrYhSUA1+4lnuh4wKAJrz
	uB73oCTb8kjrWfWXybXC2RqAUkow555RAmvfsi0TtoazkTxljBa2WPvfjEREt/qYP16mHk5CQGB
	/PdtzQ8hvuPdYvo6vJr7Y1j7zyR9LuzuNpLdVomnOD5SYR8ihjzCleCPEOCXyQFyRyFThJ3A5m/
	EDIqo+hBFSee2xlNnNA4uQjl4t74wpE3wodvNw1NVJMg8flKIYcoRO0kS0ARQUnTpLUvxLoqYDf
	Cv304SChmg9FtQR50CWirbPrE9hiCN2YXIbGednf/3Jdo2fRmaZFG4tHzIZNcnAK0T0o9EV4qet
	mfm/fSAJs9GcJersgmUsoxN3FCjOIUc0BZvjHTF/ajfzMdrf/XzyIabwcAfWwKLHGvxhgqWO+BY
	xxFgv/otzowy7GIFkZYMwN/SJ6TSlfxCWfNJLcUM61karQzIzzj8SLFrDyVYQnC38rMFLUHsC19
	NG33kW5o8nhHsBYSJfeKKIpRsZitVH5JMCC+s7AX/r6/yg3u4E=
X-Received: by 2002:a05:693c:4006:b0:368:5750:9869 with SMTP id 5a478bee46e88-36857509b06mr3808591eec.8.1792658926069;
        Thu, 22 Oct 2026 01:48:46 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm13962472eec.21.2026.10.22.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:48:45 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 16:48:36 +0800
Subject: [PATCH bpf-next v6 1/4] bpf: Protect the struct_ops association
 with a spinlock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-1-2c0f18e82582@gmail.com>
References: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
In-Reply-To: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_prog_assoc_struct_ops() and bpf_prog_disassoc_struct_ops() update
prog->aux->st_ops_assoc under st_ops_assoc_mutex, and the latter puts
the map of a non-struct_ops prog while holding it.

A struct_ops map is about to dissociate its progs from
map_free_pre_rcu(), which bpf_map_put() calls in whatever context drops
the last reference, including softirq, e.g. bpf_struct_ops_put() from
tcp_cleanup_congestion_control(). A mutex can't be taken there, and the
put of the last reference under the lock of one prog would take the
lock of other progs.

Replace the mutex with a spinlock taken with interrupts disabled, and
put the map after dropping it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h         |  2 +-
 kernel/bpf/bpf_struct_ops.c | 19 ++++++++++---------
 kernel/bpf/core.c           |  3 +--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 580f89c450b55..17b2a425e05eb 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1979,7 +1979,7 @@ struct bpf_prog_aux {
 		struct rcu_work rwork;
 	};
 	struct bpf_stream *stream[2];
-	struct mutex st_ops_assoc_mutex;
+	spinlock_t st_ops_assoc_lock; /* protects st_ops_assoc */
 	struct bpf_map __rcu *st_ops_assoc;
 };
 
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index 1178acd72296e..a1ae30b145a03 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -1541,10 +1541,10 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
 {
 	struct bpf_map *st_ops_assoc;
 
-	guard(mutex)(&prog->aux->st_ops_assoc_mutex);
+	guard(spinlock_irqsave)(&prog->aux->st_ops_assoc_lock);
 
 	st_ops_assoc = rcu_dereference_protected(prog->aux->st_ops_assoc,
-						 lockdep_is_held(&prog->aux->st_ops_assoc_mutex));
+						 lockdep_is_held(&prog->aux->st_ops_assoc_lock));
 	if (st_ops_assoc && st_ops_assoc == map)
 		return 0;
 
@@ -1569,19 +1569,20 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
 
 void bpf_prog_disassoc_struct_ops(struct bpf_prog *prog)
 {
+	struct bpf_prog_aux *aux = prog->aux;
 	struct bpf_map *st_ops_assoc;
 
-	guard(mutex)(&prog->aux->st_ops_assoc_mutex);
+	scoped_guard(spinlock_irqsave, &aux->st_ops_assoc_lock) {
+		st_ops_assoc = rcu_dereference_protected(aux->st_ops_assoc,
+							 lockdep_is_held(&aux->st_ops_assoc_lock));
+		if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
+			return;
 
-	st_ops_assoc = rcu_dereference_protected(prog->aux->st_ops_assoc,
-						 lockdep_is_held(&prog->aux->st_ops_assoc_mutex));
-	if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
-		return;
+		RCU_INIT_POINTER(aux->st_ops_assoc, NULL);
+	}
 
 	if (prog->type != BPF_PROG_TYPE_STRUCT_OPS)
 		bpf_map_put(st_ops_assoc);
-
-	RCU_INIT_POINTER(prog->aux->st_ops_assoc, NULL);
 }
 
 /*
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 3030beb531d99..0a8ba603f44b4 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -141,7 +141,7 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned int size, gfp_t gfp_extra_flag
 	mutex_init(&fp->aux->used_maps_mutex);
 	mutex_init(&fp->aux->ext_mutex);
 	mutex_init(&fp->aux->dst_mutex);
-	mutex_init(&fp->aux->st_ops_assoc_mutex);
+	spin_lock_init(&fp->aux->st_ops_assoc_lock);
 
 	return fp;
 }
@@ -291,7 +291,6 @@ void __bpf_prog_free(struct bpf_prog *fp)
 #endif
 		mutex_destroy(&fp->aux->used_maps_mutex);
 		mutex_destroy(&fp->aux->dst_mutex);
-		mutex_destroy(&fp->aux->st_ops_assoc_mutex);
 		kfree(fp->aux->poke_tab);
 		kfree(fp->aux);
 	}

-- 
2.43.0

