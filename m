Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915383ED5BB
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896737; cv=none; b=nHDUjfd6jCHO9U2oB9sMokAoKHyJECFnYFu0Oq3iFZkrop9F9292fqG83f3OI4k6guvHAAyyPWck5uCKv8xc1/glnrAEIYi2Z59hQNXxIYxI/oYGHI3Bu3lYYZ1rVKxB1Nwz5CCMqeXQBmz+K0iwmJ57jagfAsA/8ddrH2AykuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896737; c=relaxed/simple;
	bh=Yl/TRXYQRrwrqZIfMB9j35S6gGkjfLM8/VvtS5klhMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLX/nga6QCWhqgQedtBFMPefyClHHfEp31d/slAZxVfeaeu0q2IO+xu9rKR2BqQk/cxr62sEktFp+53DKNdUdqGWMP6kjHoqWFkruCz/ROe8ZTlIiFxtgaxGbg5TCXmsZhh4p1H2Cko768sdk1t7TuRmm+e6UPmTeLY0xkIxCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4rIykFW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4rIykFW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so1469292a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896723; x=1790501523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FK+OZxLsOtkm1j6vz8QSVuYBaSbmMv1Cnb3WHHAwDY=;
        b=A4rIykFWaOQTF1k0gwbM/4RaIXVB/GeFIgo3J4hReCIhNGGwIzMcuaR2T8h9AmFE1E
         oSX2W2zMhGBVreqflyAIX4KQgnt5jNGJ/UKCvozdhZh79HIWsSkeCU+MqxCDp5HIN5Ho
         L4A2oC5eqxcyVlrDFH9XtnJC3XzGzGQKf+LpNyXfNRF1iDhunDOoGINXKDNc/TJQ5kEv
         K/Xgg3tVWbuhuC8UQShgJgnP6d/0dTJ0tK7Bx/MZ3wUFw/ugsyNTWk9374flWyqK8/7R
         QsSDsUWdF4OP5mA0Cw4u/KilRAYKv3PCH1fh8tlbOcyUF/JxykAw7wQARUre2Fm7LIv5
         xzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896723; x=1790501523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FK+OZxLsOtkm1j6vz8QSVuYBaSbmMv1Cnb3WHHAwDY=;
        b=0ZPCbvKWdMfpM/jRRo3ExNMGjWRmaQSqvHJvndWSawX3DAwrr6Nr2ahgWjkDgg+krE
         K2i7Q02ROpg888V4plvVtc9syA6wj9m9PIePoX354xeHilrD+/Kx7/mEFxGwdb2upqfY
         W+hCOYUToKpp3KulM7Ix+khWPCHbCvVHdkK2HKbq/nsh5miNue0/KvTu4gBCFv/v4ZM1
         gYZoSUNPM7ZAhU8aFXwZP9P7GfCsHvzGhfU3BDqE+yrFi427OhAn2AWGDQOLYTYrW+DE
         XaSEAVTChKSfALD6zE12BGYbcm/yBkjYMZgWP1LD6mDPdy/uDHbcebO68UH07RJ9qn2E
         B4vA==
X-Forwarded-Encrypted: i=1; AKwUvBxoxrgYxKkHMpVZ+0zziBUoYYeJRTTTdncUTLi4cyphccHID1dDZnWAO1XMXmtfPjFZC0VFcNGWC7RMj7c=@vger.kernel.org
X-Gm-Message-State: AFuF++kZK69JRY/JfcE/qO1+DYc4gbrbY+q2SljHkZm+5B64qPcNIuf8
	vr90LUSL1GdjsBI1I+W1uHoVyF2y+rV3+YG80VTmdNV/qY1c6UtljS0=
X-Gm-Gg: AYBFou3hxsp+B+yAWjYkt9oQ9zR18b/dtpuNfpJQP3ST7+siN3of4y6bp+SPwQf6+GF
	lfACDJ+O0V8tY0d64D5EWaOsrBBjMtY0z9k6mrMeBZbRlF53Wr1aPg3jShngU2/PB8AscNLyarO
	r1YKuimADNaB+psAJr1ymiO6hbEmi5uZxCgjueZeB5xjSuaAq+KS8OaURUclaUzXKNitG1ccv0M
	6sUrIzPT4EQkxqVe0blMHRto/lpOc2NNVBot3nf6ycKFnfj0IU3glGuaUIG9pMtEgFchS4gezyJ
	WOQO+BgL8aDjL8n7pa5U+7pQ6HhufBIM7zsRymxnbBBtXKms2JcP6X9QcRA31HkrPbD91hYGAtp
	UD/4+xU77uyT5W9DpPVlB1T8ZmX+z+YrHYi6HnyYVilyr/IwrDXd/aSLSXbUZvWqAUJwkIuxZT9
	pdvmbZQB2IgMkb4dEv5rxtJQ/rWUBJEhUARKyvEGurLFQmzmIYQWbVaBZtSU6B5QbIW27Q8SabU
	AXiNYFOSCH79HV1W7inuGBcL/Q=
X-Received: by 2002:a17:90b:2f03:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e54e3d374mr13933682a91.17.1789896722875;
        Sun, 20 Sep 2026 02:32:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6fb75539sm8093503a91.3.2026.09.20.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:32:02 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash element
Date: Sun, 20 Sep 2026 18:31:52 +0900
Message-ID: <20260920093153.439743-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com>
References: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_init_value() initializes the per-cpu area of a newly created
[lru_]percpu_hash element.  That area is recycled and still holds the
values of whatever element occupied it before, so when the value comes
from a BPF program (onallcpus == false) the function writes the running
CPU's slot and zeroes the rest.

bpf_percpu_hash_update() always passes onallcpus == true, and that arm
calls pcpu_copy_value(), which used to write every CPU.  That changed in
commit c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags
support for percpu_hash and lru_percpu_hash maps"): with BPF_F_CPU it
writes the one CPU named in map_flags and returns.  On the create
path the remaining slots are left as they were, and a lookup of the new
key hands back the recycled element's values:

  update(k1, 0xdeadc0de, BPF_F_ALL_CPUS)  every CPU holds 0xdeadc0de
  delete(k1)                              element back on the freelist
  update(k2, 0xc0ffee, BPF_F_CPU | 0)     creates, writes CPU 0 only
  lookup(k2)                              CPU 0 0xc0ffee, rest 0xdeadc0de

Commit d3bec0138bfb ("bpf: Zero-fill re-used per-cpu map element")
established that a re-used element must not return the previous
tenant's values.  BPF_F_CPU is the first way to reach pcpu_init_value()
writing a single CPU with onallcpus set, so extend the zero-filling arm
to cover it, with map_flags >> 32 naming the CPU that receives the
value.

Only creation is affected: pcpu_init_value() is reached from the two
create branches, while an update of an existing element goes straight to
pcpu_copy_value(), where writing one CPU and leaving the others is the
point of the flag.

Fixes: c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags support for percpu_hash and lru_percpu_hash maps")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Tested on x86_64 under QEMU/KVM against bpf/master a11212910cf0: with
this patch the selftest in 2/2 passes on all three allocation modes,
and without it all three read 0xdeadc0de where they expect 0.  Numbers
in the cover letter.

The merged arm no longer calls bpf_obj_cancel_fields() on the named
CPU.  That call is inert on this path: it acts only on BPF_TIMER,
BPF_WORKQUEUE and BPF_TASK_WORK, and map_check_btf() rejects all three
for [lru_]percpu_hash.

 kernel/bpf/hashtab.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 4f495dcbf670c..c4683d0e4c149 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -1056,12 +1056,12 @@ static void pcpu_init_value(struct bpf_htab *htab, void __percpu *pptr,
 	 * known initial values for cpus other than current one
 	 * (onallcpus=false always when coming from bpf prog).
 	 */
-	if (!onallcpus) {
-		int current_cpu = raw_smp_processor_id();
+	if (!onallcpus || (map_flags & BPF_F_CPU)) {
+		int init_cpu = onallcpus ? map_flags >> 32 : raw_smp_processor_id();
 		int cpu;
 
 		for_each_possible_cpu(cpu) {
-			if (cpu == current_cpu)
+			if (cpu == init_cpu)
 				copy_map_value(&htab->map, per_cpu_ptr(pptr, cpu), value);
 			else /* Since elem is preallocated, we cannot touch special fields */
 				zero_map_value(&htab->map, per_cpu_ptr(pptr, cpu));
-- 
2.53.0

