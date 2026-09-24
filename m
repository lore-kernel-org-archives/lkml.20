Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE30F47604A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245416; cv=none; b=jyCFcvnYvKZpTXdk513xYNseczBs/05JxB5fV73uyxxMs9mNqKtwggg3/P0maHeOQ5Iqz17o5Mct9HMYoW4b/6obsdO+/iv1OEEs8Z3f8peSMHkbzz2wNWiqHi+HhP4unwd5pRhmcOBFXRN8WbSdSJSC6hVyKJvMrqrGBtN1+S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245416; c=relaxed/simple;
	bh=+nouV9zt7W78M6dmzDdd5dBqebiYPUKmIdR5QPLIlO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpgjPvHXmQ/UJl01c6G+9r7wUjoSsyuC1uq2ADnvLPY7YjC/V/wPlWouLYLbmjECBM/HDmay0yTOm+UbvtV79VFaBK5sCo/KIrvXbjoEHKxrFkKradMOR0CrTU4iEU+QTazqtJQ9Es6VmueJs0iM2xKOhAwADg5W4U/kopZcgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLXjTmfi; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLXjTmfi"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so610514a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790245413; x=1790850213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYSc8z6uUhpoN5DPnRJYqvNeo+ZWN39hf5KrJMSzHAo=;
        b=YLXjTmfipOU1YvEV2kGztDWFzvx/DUB0Q6CzG34A+HILvW82XH3JxrpdWLvJYyIqt/
         dQW1gs4cXnYIldLc5l5YJqgJjs1M/xVTRAomP55RAtO3iF7cIoEzZlfeXmrNFaakKkeW
         pLrrv+uTsKnkIF6t4I0FsuCY3B8pOCZGYkRqc0WVOMCI0WPG+jwE3KZwyir0rzTubLY/
         Wsb2VZOLCwYHUFuyyV1dDAcxZmTE4GIGtcApWOfASs2grSCljusbi4feMlshPKdXzHYf
         YjE9ZEADYZhxoP7iEc0Jno94Tj4HICQ38fGDlpSK7g/7IPYv3FIA+iWmFPCdIWWoI4gk
         SAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245413; x=1790850213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYSc8z6uUhpoN5DPnRJYqvNeo+ZWN39hf5KrJMSzHAo=;
        b=d5GL3Rwm2eOEjRN1KCHeqqG0vs/qN6DWz7fn1osMO2jjMHXzRbcUn7FCFomG8eGS+D
         mBD/hdV1/BblfkCejEal6i+LaodQhJmJsZvMQ44Z6qyQfHqHHwSiq3hGWSpHEr42kXNK
         ZlRP4QVpwns5+sq+cxG523l7DUltNcV6K4fml/Tz5dHNWxIlKshsbeZBBj9p7WDxd6Tn
         D5YEcHwzT4xW9JkwvIow3S0+4Z4G78TWPjA8bxsEU8V4+5l73/sK8Z13dRGcfowP1cGx
         uHMo1c/+BQb7S992axefVRXNJueSF/VwRJlBYWTVqmrrClcWaPi8zyHqb+a+nFQkQ3yg
         qmNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3yPmExv6VDh+6HT2jRAMUczWVrWw/i4sFFfct9qjrgq12YN+Hs5nco6ccbMP6NMiESYMY219qVoSp38Y=@vger.kernel.org
X-Gm-Message-State: AFuF++maNo8hFTIbOQ8OIRMT8OltUqJOiFAU+4uTx+3S053hnyOYTzX2
	K6PSbX1y9rbwrBFgYMXgu7XvcSJVjlJTsN+O7DpAfon/PW7wHCA6BT8=
X-Gm-Gg: AYBFou0nCgZAfW0f8vauchNb4XsVPrA1t4OVGdhvdy0VeUWqlRylCvngOKBz/qwoKQN
	p/yZ9KBzJb1SUcAX5tPyMAQrA9VV0ixrLWfgTmWaX5f6O/FXKq8PTlZ3lSw02M3d4zJPBcN2cEH
	C6Ea5tlQg5wQ6fX1C303/g5V29jO6L3Ew0ypUTgxJlOJsW8pRITcQKxUAefMfVZNPeiSyYbXHOv
	BDBkD9M+opyU3S+PuNh5OMLcVbYg033KROxkUIw4dBUZLSYAxaXg1vc/67XZ58ondBGjcx0QjOa
	oSTstkUvaRTP7Dh9LBUtogFapSBVcjOei2L3ZX3yGzn2QkT+hVRKOfoh/FCSIc6CJIrgE29zh0C
	rHGIhviOOdl/fP12yye5nbRT5EOrSfo7AwPXY6aENWB5oliXRovdvaRCFk4PRqn3ncYqoroXFvU
	c8DiGHq4CuzOrTvb3hb2TGi+MKP2BJcVu6LLM5e80MKJTM8Cu7R07z8djYFAdsgIC5hB+ZKMH64
	aFDpb8juzO4RZ8E0L52SNRa
X-Received: by 2002:a05:6a21:a45:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3de0e9a08b3mr2035615637.80.1790245413127;
        Thu, 24 Sep 2026 03:23:33 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb9416sm2661582b3a.7.2026.09.24.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:23:32 -0700 (PDT)
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
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v3 1/2] bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash element
Date: Thu, 24 Sep 2026 19:23:20 +0900
Message-ID: <20260924102321.2120434-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924102321.2120434-1-donggeunyoo.kernel@gmail.com>
References: <20260924102321.2120434-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_init_value() initializes the per-cpu area of a newly created
[lru_]percpu_hash element.  The area is recycled, so when the value
comes from a BPF program (onallcpus == false) it writes the running
CPU's slot and zeroes the rest.

bpf_percpu_hash_update() passes onallcpus == true, which delegates to
pcpu_copy_value().  pcpu_copy_value() writes only the CPU named in
map_flags when BPF_F_CPU is set, so on the create path the other slots
keep the recycled element's values:

  update(k1, 0xdeadc0de, BPF_F_ALL_CPUS)  every CPU holds 0xdeadc0de
  delete(k1)                              element back on the freelist
  update(k2, 0xc0ffee, BPF_F_CPU | 0)     creates, writes CPU 0 only
  lookup(k2)                              CPU 0 0xc0ffee, rest 0xdeadc0de

Zero-fill the other CPUs on that arm too.

Fixes: c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags support for percpu_hash and lru_percpu_hash maps")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 kernel/bpf/hashtab.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 4f495dcbf670c..f9464e566f109 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -1054,14 +1054,17 @@ static void pcpu_init_value(struct bpf_htab *htab, void __percpu *pptr,
 	/* When not setting the initial value on all cpus, zero-fill element
 	 * values for other cpus. Otherwise, bpf program has no way to ensure
 	 * known initial values for cpus other than current one
-	 * (onallcpus=false always when coming from bpf prog).
+	 * (onallcpus=false always when coming from bpf prog,
+	 *  map_flags & BPF_F_CPU when coming from syscall but setting
+	 *  only one cpu).
 	 */
-	if (!onallcpus) {
-		int current_cpu = raw_smp_processor_id();
+	if (!onallcpus || (map_flags & BPF_F_CPU)) {
+		int init_cpu = (map_flags & BPF_F_CPU) ? map_flags >> 32 :
+			       raw_smp_processor_id();
 		int cpu;
 
 		for_each_possible_cpu(cpu) {
-			if (cpu == current_cpu)
+			if (cpu == init_cpu)
 				copy_map_value(&htab->map, per_cpu_ptr(pptr, cpu), value);
 			else /* Since elem is preallocated, we cannot touch special fields */
 				zero_map_value(&htab->map, per_cpu_ptr(pptr, cpu));
-- 
2.53.0

