Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3F353A77
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376890; cv=none; b=WKyKicCsNCZ91egzWPCF2Yptr9oXkqpir1x72fKeYjfZKpybygHmmmVTyutJ3plD9PPnWnT5QfzGbx//dwM6OGmive1Y0CgqxlMNY5JmoLIqjd7jEt5jkKD8/PRDePwMb0SXLEU8EAxk5mDLFy6/kW+JX7O7jGxx7JIgWMlon78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376890; c=relaxed/simple;
	bh=0imXMVLvOwwix9YUdq6XqYgfrrARm+8HJOJ2LHyQZMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBKogtsnRGA5+3ypr5ULA2+Js62Lkq4TE6ngkKOr+rWT1b8uHoido3W3ZqIaK7INfIKUNm8c8tAOOUyD9+vgUojYbvj7XeoqdcMmBlqQJWSJc+dlA40wTkZxFu3sP4gP0A1eLQtpi778Fkq58JNdbC85M5TO6D9JyrD8/9HrF9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anMmvuc/; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anMmvuc/"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3329068eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792376888; x=1792981688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pPuCC48Hy2fsKRIjoJrlINKPfQUMeKQHIeAV5LoC0E=;
        b=anMmvuc/JK6MIeHph1L8ZU9FemErsUkcJQfCdd+PZeD7+frcyU3hE88GtJ7OgQU9t7
         7U6VtWAfKcFO9+WtXRLljNukzYp1hReqv5vFHMeUqOA1M+LnYwwTCbE+oqhqdwB1DHW8
         BnjaEldCqAewf+P83CvwBSOl0IU7kOsMykfMSf74+Rlq4DStl0l//WE5TstwvTQMM3ty
         hBiKZY6ZkrWket+AfCvvWY4w7nhEMaNz/09e3HZCSCbjxx5dRzokgrywxO/cltuLnRfV
         1SbiyYkcu4OSCn9wKlXFMNKEqLWrNOPQ3ejyKMuYjIHznwleyuH8xy4XESr3skeaZBpY
         KIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376888; x=1792981688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pPuCC48Hy2fsKRIjoJrlINKPfQUMeKQHIeAV5LoC0E=;
        b=zIwH6gPyhjBOnDtMSDkdNNOkBzCFvYy2DuttdkSOeHgjAsc5bbrtUXIx18OCSDxwjO
         iqlKJTA5uf3UgzdCT5EBqUqRH0mwT1l5dpWFjmzYgtLEQyOVlZMi40T7LpFKR5mUh4+q
         yj5+xaArgQZOLd+0jxJNuZ/wI1nnAJun5Si4pGG75wNktnNVGFv0Jr1cd4xEJtaNKB/i
         I0RxlrDt/VQ3qLe8LsGESEkpWpmS2Pwgc30xFVg5z40wTkkS5Ex0CXcat4vOeBw4t8U2
         6qNm5fmE0IwDgiRViVvwByhQmiNRiR4lVEnL8AXH5kjPEeirO4o2km8a/mRLExUY4a0d
         IU3Q==
X-Forwarded-Encrypted: i=1; AKwUvByHlpv3T0IR4SbQ+OUbSEiscQxv7+hjhwn8R4TDJ+V7coblyBJpB19OEmoLOM7RGJtjHMlCqhkopP7J6h4=@vger.kernel.org
X-Gm-Message-State: AFq9FYItqeTHsomoPd8G3MOu7eANqNT9gW1BQstrbYRw74M8DLqEnwGt
	khsMOmgV8zreETixZup1T4i5ulbe9vJClflkewyTnFpz8gJFYZbYbTW3
X-Gm-Gg: AYBFou1sjRthr50fZsr+bF877ymHIUk+wcV4LyWTjOe3+qzOXhhculiiYTC+OIPB99L
	Tc8AlHXXMZdwZ1Nx7h3pa6k2r54nVJ9CyaEJvZlxCbP2d9e7hOePPrSKjKRIqQVjoD45p2lw3te
	o1a2HoxekJV2VgHcd/NojqwZxl0uK6gMz4RYoQ/mySaLb9s8cdJeWpJkWrFvKnjkdC15eSCIvEq
	ZVHpIZuYvBNHyDYQwBANZcySdkYr2LZOU46MFvHZZv9zGAzkQk1HdeQMX/SONIYRE5jVswLOPMv
	eES0gfsdpk4eWFqVbulT4oU6nMfHKM7VGraRLXwVZBDnzxwnPrXjNMyVQ3aC1v0zDBJjg42DYLJ
	09wt8uRD6FhcGpznvF/L0ldNzwAB162tyWMcXlHAy6ZmCPEAA7NR+gLXa/0C8LhiU0iySQOKnmQ
	+0EEmdgV0bBW3Ad+tjkSdzFjN5KlY38oh9O2qRMFAfZGQMLd6nBUM02+RtigPD9yuhDg==
X-Received: by 2002:a05:701b:424b:20b0:185:b157:f271 with SMTP id a92af1059eb24-185b157f2famr8552199c88.23.1792376888154;
        Sun, 18 Oct 2026 19:28:08 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm28341876c88.0.2026.10.18.19.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:28:07 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 10:27:55 +0800
Subject: [PATCH bpf-next v5 1/4] bpf: Protect the struct_ops association
 with a spinlock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-1-77b2e181e5cc@gmail.com>
References: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
In-Reply-To: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
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
index 54144372281cb..2a51acd34f9a9 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1960,7 +1960,7 @@ struct bpf_prog_aux {
 		struct rcu_head	rcu;
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
index 05c89396119ad..fd4e4dc4acc8c 100644
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

