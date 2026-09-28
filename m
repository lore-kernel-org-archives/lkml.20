Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19749158B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632195; cv=none; b=FcTuWfCQtLfy7RM4kFVTwnOlM1y6l9Obf7YMdeyyHIy/DDBr5WP4qvcs31rDL1C4WQNTZQF7MDJLsbbo37j7bnypxejEH5A+HnvxL5msaUYkjjSgB+Mv0Kp05KokfteaZSr1ySjAUeNlo2KrlX5svsAGisnvHXuSfMyNyJuy6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632195; c=relaxed/simple;
	bh=ilQXaEciDmAvPZ2ZCD3kX6pyRzoHKCk42twk2gWnZPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RAwQGWe1RagOgOYsDNgJxpDXQ8MZjOJ5gec8bt/lcbN56qUnDMffHINd+xN/8KfvWdTCK3XXZW48mHcpHgUoOhTS/LLV0WkFh4m39i/0E02D42nc2jxG9zBHpLWCrnLjgJL/sn22bcKONzsNZRJbbWoW74VGIBcBDs9KivWQ2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwfN01/v; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwfN01/v"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so19731405e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632191; x=1791236991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81S92gRsTze5dEkVsqAlBNRD4h1XA9f5yyArW4yZOQA=;
        b=KwfN01/vdOTXCooUL3QRj7PoEWtCQInhwg0DWAKz8DUcdVRjG1Kf/sqwIOVteySWAx
         8ENRqsBYC70x30LY9gcuTm6pUZMjbT50ghUf60g+gKNx0Qe9kxwdxXWgwRAMVwY2jqJC
         E9iL7lY50N+4lEVAmkCFYFgI7+Or23IAFO6X89f+MwZlQH/p//aHZ6g/zvloIkklUHBa
         89fmsG6K2+BWXMzE2pVBwWbzMNE7BxrwARqBVP9zaoWbXq6jtsLufLB2J+AKIk160dYA
         tU8MrFtEe4SBwA54HdVKjS/zWrC1JriRoMdhwInyM7makGLXGE5r5uje2gAf8M+ulx1/
         Kd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632191; x=1791236991;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=81S92gRsTze5dEkVsqAlBNRD4h1XA9f5yyArW4yZOQA=;
        b=gBEpfJhc+KouAXCpwB9WVL3ykMGMca22s9yhXxJAUx2NMRNKI1r2PPwVf3v+5wVUrI
         9CQp3oGAAXPiiJUx545G6baPIIkUxW1WUdnOz+b5h1Z1c8NL6llL+i8Yn7jtNryD0XQI
         85ERTkGUJsHXLN1Fm1DDVo6ixsK74wqINooxpy1k5tJ7aT8DZkiuQWtuEywSOAB7ThE6
         mGS5pRJc1/Wq6GIPk58/iG7mmO8RgWooLm7GI1pIRtmT0VtucFRvmlKw/pDEMmNK4HAC
         l+6sYoVSSowJoxN6fTWWBx7blf6ou7q5TeSqqqGN8LRDRBXkKIWIz8H+aWhxYOhXweLK
         JeFw==
X-Forwarded-Encrypted: i=1; AKwUvBxD3McxN9flnNhGU9TqMtjwAcK8WJKDjDOSCm5CQl8ntaawy0cVuWVGrIU2hpsFYhJu9CxSMCukNLqkYL0=@vger.kernel.org
X-Gm-Message-State: AFuF++mdWfB7lt65h1TEiC8Kc37e2InoF/xts5pXO6vjFh5fdoG+pR7K
	Pbam1RtWNipYbfBsshk02KGz8CfDHnIa0u3UZrwmU8kBhhe1IGj64bso
X-Gm-Gg: AYBFou1sgCqSu4WRtIZ94L6z5KIMaNg3to2D+AKut/NKcPL5OTkRuXc8t9o2AmbRHnP
	5YJH8AMP1XQsEsc6Q2SZsHodk3CF3lzXQI79XB97fbZ9Y83i8FihISRDghmQdhT/LXCZvot/iX8
	oU3LLazYBFpKEkRtufxTB1wqk5vRgGPVQ51Psoyqj6D74iJT52N6icWTrW3WavNi5Z1f8BN9X6B
	GcJDb3WQKNC2SymKfAboWRZO7GVa46MOoSquACeXmBny4pJSri8kk5ac8qHudzQs6ZrtNKJOlEd
	R4vabhrz+HNWpO/3KriDmkNw+Gw4PZB/VlT7pOFtKNeyhkAv236iCsNIsfHgru4OnLy80ErNazc
	zhU5GjMH9UswH9UUAXmROphkmrB4UM5PuVsSCkUwYHUt6PCfLXUtdlcEb485vmnoZ4D7JjGkQkZ
	YM/nCQ8Wwg6LWYVYr8CbYb4Yy0QGHmz8V74/GvACE2NyDLXbdVyMGrhoVSuQ9gh7KPmj/I8rGeU
	tNgkrA=
X-Received: by 2002:a05:600c:698d:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49ff06e504dmr192580495e9.21.1790632190773;
        Mon, 28 Sep 2026 14:49:50 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa57d7sm22704295e9.10.2026.09.28.14.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:49:50 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH bpf] bpf: Zero-fill non-target CPU slots on BPF_F_CPU insert of new per-CPU element
Date: Tue, 29 Sep 2026 00:47:29 +0300
Message-ID: <20260928214932.544124-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pcpu_copy_value() with BPF_F_CPU copies the value only to the target
CPU's slot and returns immediately, leaving all other CPUs untouched.
When inserting a *new* element, the backing per-CPU area may be reused
from bpf_mem_cache or a prealloc freelist without being zero-initialized,
so non-target CPUs retain stale contents of a previously-deleted
element in the same map — a same-map information disclosure.

pcpu_init_value() is used to initialize newly allocated elements, while
updates to existing elements call pcpu_copy_value() directly; non-target
CPU slots intentionally retain their previous values there.

The onallcpus=false path in pcpu_init_value() already handles new
element initialization correctly by explicitly zeroing non-current CPUs:

  if (cpu == current_cpu)
      copy_map_value(..., value);
  else
      zero_map_value(...);

Fix by adding a zero-fill pass in pcpu_init_value() after
pcpu_copy_value() returns, covering only the BPF_F_CPU new-element
path: iterate all CPUs and zero-fill every slot except the target.
This leaves pcpu_copy_value() unchanged so the update-existing-element
semantics are not affected.

Fixes: c6936161fd55 ("bpf: Add BPF_F_CPU and BPF_F_ALL_CPUS flags support for percpu_hash and lru_percpu_hash maps")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Tested with a reproducer:
- Before the fix: CPU 1 retained 0xDEADBEEFCAFEBABE from the deleted
  element.
- After the fix: the non-target CPU read back zero.

 kernel/bpf/hashtab.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 8cc07e54daaa..dff4321f2828 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -1099,6 +1099,16 @@ static void pcpu_init_value(struct bpf_htab *htab, void __percpu *pptr,
 		}
 	} else {
 		pcpu_copy_value(htab, pptr, value, onallcpus, map_flags);
+		if (map_flags & BPF_F_CPU) {
+			int target = map_flags >> 32;
+			int cpu;
+
+			for_each_possible_cpu(cpu) {
+				if (cpu != target)
+					zero_map_value(&htab->map,
+						       per_cpu_ptr(pptr, cpu));
+			}
+		}
 	}
 }

--
2.55.0

