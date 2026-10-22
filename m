Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658932;
	b=Xu56mb+V3V5ppdbIKyjs5WvFxuDTjk2xNKbh6cyAx6UMQsPticrN8bS0O8LAwy9tyP7M
	 hnen4MfQet/0oaVuW0rrtHQ7CCAw10DvfbRCDFLT67D1ETRIOSUkOKpCMoV3JS9hwFoFV
	 kQd6x1hrBkc8WtUhTCmuw4lmVJxpHmBlMEunIpq/mXKDbF5zIfmxGOiD9FyLwczGEMYAj
	 CtYSstT+wGlFCkRaFrvsearJAlI3FR+27zUdjCyqijlr0JekRhDRV3Xcb2FJ9aJoYg9YL
	 XhXvAy+isvycvPbpvqczHuXllolZ7Xu61cdl+m/69Je2ivoEY55V0sJl9KmH9/oCv6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZgxGYakB4OAbqmfUpoRBZ1h/Ym4Uy7aZcRmLcKkfZ3E=;
	b=GqMwJR/Y5C9Xf/b4twsIm/tND6XrVJqaxdLIDu1IlEyWeAe5plC5wGB/6M32S+FJTcFc
	 bPkoTuut+VFE+cggcNemD/M0ySsWH2UaOYyWFs64JWQkh9bqkiIQkvUGrPkJRMaM81Id8
	 mjRaiLI0DnPE9zJMpZsNSPteyiLGLCNS9jRiE/eVYOsUZaakSzakku/RCfcPV1Rj/N5/X
	 Nm3I5N/+CKzPC8vx91y7t+gfA7tYQiBKxHweXBEuJrdRv4B35ackkuIxqE05bTGJxbwPz
	 iBQQDm/C0oWvRW9uw/4/1VcWbP3C2KybPFgJ/GDbuexNdFbydqkF5BISlmPep6LCgsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VthhSAZa;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A413B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VthhSAZa
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2764293eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658931; x=1793263731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgxGYakB4OAbqmfUpoRBZ1h/Ym4Uy7aZcRmLcKkfZ3E=;
        b=VthhSAZaIu93ccIM+niIeQn2HJ3ppWySTcvgZII3J3/FW08bGRYdhYCWc/sDlR6DKl
         EQrsyEGsFDyJQ4ZW1/2MBY/YUGWy/yFtiLD6f0OQhjpgH14hJnIs67sjNYs3grMdQNi+
         sXfs+IeK9S+QWQoz9VQP1+z63C0x5OjL7k4dUCn3m/hTw2MKGuGxLGeKRG412vqKk4DD
         Rch6C/2OJZDJXQoWaqdG9i3uRU4oBFcabPyC8jl3RDOZi5yNVIMLmJRm8bsM8izsB0Wp
         rD13hfKY6IKi7MjAyrFGBoju8SNp5eV/M87mbDyZwrM7FuVNYRr2qk8PCSsunASAyyDb
         Gs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658931; x=1793263731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgxGYakB4OAbqmfUpoRBZ1h/Ym4Uy7aZcRmLcKkfZ3E=;
        b=YlNSn1+rQr5q9e7KpreVQYOGj/jDPlIbWWPW5JHdr4u6VZkQ+mQ5XtOc/toZckLv9S
         hUu9bgiP5LOA5JsSewL45ka/+3ePO4mdxZ8PHfZcysAB9gj8zkIWuxm3X1mSpKFw1MXA
         YKaO3oOmA2bqasG7UZ9Gd8OW7ycx3CVBriZhvQbw237sHePax1CP9sm7A+ZCjlNcphQl
         MmCviPAfLEUnE5dcSVA7AOkQ+HGe35aJXEwxKeuqLuBFNWLyajptfcu3Wzbg3rEKZ3+Y
         mGS8cjBnpi5zGYsuKJ4AYjAojgdwW8wrzduZ9h6HqqXAZ/WMUMKA/VY+hbzwRdB3WcXU
         PAew==
X-Forwarded-Encrypted: i=1; AKwUvBzOMGmK7ZFhcLvT+XLIjSi8Iw19Pz5Z61AhEvR/f/3HsSgWFduqJwLJsZUUPglo2pqQpHlNOV/14P8m9X8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuKETFQbPaOXUEOD5dVx6qLc/KEv2YyUffN5yJFhkbQumOywxZ
	qmokNkr2Dd6qCdoPXWysSLBEppTSFOKl5LStGR8mQxDPl5fmoXlHmVCd
X-Gm-Gg: AYBFou3YhnLq4rRMfreGTrXrpfXW/l/bvQh3Xk/+jlWLkX9YAN8gBqzyBpBT94XQOZa
	nTHRmo4fou50Jpaq3fb/BWT6RzAY/pLIwSUMNisrmghpTkt2IODFO9EMCmoZZHWn2d84c0ebkqm
	m7AkPkXjKmAajDLQzdmrc8tjWcnSHAFA/3UXV4wp+kpxKBJPO5FsXD/LvozKPEIX8a703yBKP20
	vp98UvCGQQETRgavvLFAcaQjgvVSWLqYDhJ/ymC4QI6D0Ofcx8vGH9hzw7MXzxi57LJ4N4P+Zeq
	4cE4bLQqxW8Ehqm3Iir9kWMy8qe2v7pPxCMMLAreYtCGCG/ul4FOpDhW6m4dCW4VL3o2LO/m4u+
	1/TIPQeDbPV/gZeAchuM0qq4/DVYm/9creoywwTmOpEbk44PmDLk6X1pXusOWRRS7VsbGadYp8q
	Ws+HJTNy01HUQkniVncp/ZTaa/DSB2PgjPMgffYGhJHoKQQ0eKfeDlNGYrq8XH5bjwssijX5eb8
	fHPpc2joKXGhQa6BG7Eo8uvuE96G0WeozUtJcf6Z5qhFDf+RNIht/8J4FnpdRZpzCIgfOjB
X-Received: by 2002:a05:7300:ea8e:b0:369:38e3:5363 with SMTP id 5a478bee46e88-36938e357a4mr859137eec.7.1792658930788;
        Thu, 22 Oct 2026 01:48:50 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm13962472eec.21.2026.10.22.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:48:50 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 16:48:37 +0800
Subject: [PATCH bpf-next v6 2/4] bpf: Dissociate struct_ops progs before
 the grace period of the map
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
Message-Id: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-2-2c0f18e82582@gmail.com>
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

A struct_ops prog is associated with its map without a reference on the
map, and finds the struct_ops through bpf_prog_get_assoc_struct_ops()
under RCU. For a struct_ops map, bpf_map_put() waits for an RCU grace
period before it calls bpf_struct_ops_map_free(), which clears the
association and then frees the trampoline and the kdata right away.

Nothing waits for a prog that reads the association after that grace
period started and before the association is cleared. A timer callback
of a struct_ops prog that calls test_1 of bpf_testmod's multi_st_ops
through the association while the map is freed returns into the freed
trampoline, whose image is filled with int3. RAX holds MAP_MAGIC (1234),
which test_1 has just returned:

  Oops: int3: 0000 [#1] SMP KASAN NOPTI
  CPU: 2 UID: 0 PID: 31 Comm: ksoftirqd/2 ...
  RIP: 0010:0xffffffffc043114d
  Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <cc> cc cc cc
  RAX: 00000000000004d2 ...
  Call Trace:
   bpf_prog_ec591f4f9d13f364_timer_cb+0x96/0x1e2
   bpf_timer_cb+0x15d/0x240
   __hrtimer_run_queues+0x264/0x5a0
   hrtimer_run_softirq+0x1a7/0x3b0
   handle_softirqs+0x18c/0x5b0

Dissociate the progs in map_free_pre_rcu(), so that the grace period of
bpf_map_put() follows it, and make that an RCU tasks trace grace period
for every struct_ops map. It then also waits for the progs that read
the association under RCU tasks trace, e.g. from a bpf_wq callback or a
sleepable prog, as a tasks trace grace period implies an RCU one.
Stop setting free_after_rcu_gp, which bpf_map_put() no longer reads for
a struct_ops map, and update the comment of free_after_mult_rcu_gp in
struct bpf_struct_ops, which now only picks the grace period of a cgroup
prog array.

The st_ops_assoc_in_timer_free subtest of test_progs reproduces it. Its
timer callback keeps calling test_1 through the association while the
map is freed, and test_1 spins in bpf_loop() when called from there:

  $ cd tools/testing/selftests/bpf
  $ make test_progs
  $ ./test_progs -t struct_ops_assoc/st_ops_assoc_in_timer_free

On kernels of the same bpf-next commit with KASAN enabled, x86_64 VM
with 32 vCPUs, before and after this patch:

            before                     after
  outcome   Oops (int3) on run 1       100 of 100 runs passed, no Oops

Fixes: 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period optional")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h         |  8 +++++---
 kernel/bpf/bpf_struct_ops.c | 10 ++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 17b2a425e05eb..ff04367812935 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2240,9 +2240,11 @@ struct btf_member;
  *                           and its progs. It is unnecessary if the @unreg
  *                           has waited for the correct rcu gp or the @unreg
  *                           has ensured all struct_ops prog has finished running.
- * @free_after_mult_rcu_gp: Same as @free_after_tasks_rcu_gp but waiting for
- *                          both tasks_trace_rcu and regular rcu grace period.
- *                          It is usually needed if the struct_ops has sleepable prog.
+ * @free_after_mult_rcu_gp: Set to true if the cgroup prog array of this
+ *                          struct_ops needs a tasks_trace_rcu gp, besides a
+ *                          regular rcu gp, before it is freed. It is usually
+ *                          needed if the struct_ops has sleepable prog. A
+ *                          struct_ops map always waits for both.
  */
 struct bpf_struct_ops {
 	const struct bpf_verifier_ops *verifier_ops;
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index a1ae30b145a03..7c5cd6086e273 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -1030,6 +1030,7 @@ static void bpf_struct_ops_map_free_pre_rcu(struct bpf_map *map)
 	struct bpf_struct_ops_map *st_map = (struct bpf_struct_ops_map *)map;
 
 	bpf_struct_ops_map_del_ksyms(st_map);
+	bpf_struct_ops_map_dissoc_progs(st_map);
 }
 
 static void bpf_struct_ops_map_free(struct bpf_map *map)
@@ -1045,8 +1046,6 @@ static void bpf_struct_ops_map_free(struct bpf_map *map)
 	if (btf_is_module(st_map->btf))
 		module_put(st_map->st_ops_desc->st_ops->owner);
 
-	bpf_struct_ops_map_dissoc_progs(st_map);
-
 	if (tasks_rcu && IS_ENABLED(CONFIG_TASKS_RCU))
 		synchronize_rcu_tasks();
 
@@ -1162,8 +1161,11 @@ static struct bpf_map *bpf_struct_ops_map_alloc(union bpf_attr *attr)
 
 	mutex_init(&st_map->lock);
 	bpf_map_init_from_attr(map, attr);
-	map->free_after_mult_rcu_gp = st_ops_desc->st_ops->free_after_mult_rcu_gp;
-	map->free_after_rcu_gp = true;
+	/*
+	 * A prog dissociated in map_free_pre_rcu() may still run the struct_ops
+	 * from a bpf_wq callback or a sleepable prog, under RCU tasks trace.
+	 */
+	map->free_after_mult_rcu_gp = true;
 
 	return map;
 

-- 
2.43.0

