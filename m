Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875190;
	b=O9btq+UfQDV3NuSRlONlMGaE8Sqs029btRRUOmg+tMOJZiCsXq2GTKvHdWp5Sq+lsRur
	 at1r9APTO65/3H97Q7MeO3bYDqpJfr9zi8RqGN0glrWpe7C77qdvCEehb7WvAecqp2rLG
	 VC2ACqRXG/OzNIhElzD20zha28KLONhg/Ty49U/A/4XyDo0fl8KHRsbf/PefRz4y6Yh8G
	 UslAUuJTGMPt9y25qp2wHHu7pp6pbjoqD9ECxgZJ+8wKjAQISEdYc5YaOvMwbH1FwoCHq
	 w8alPZR6xcLgZMdaW/hwF5HIYPWU/ZN7gYCz47FHuyBtAlxfi90YLclTe8chWzlU0jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uFIhQY+79JG5rknzOWA6767gSvTCQmC5gGZYO/Mt64s=;
	b=Pdu7XubUm7ghN1K9bxkuoeSG6wlFJCNVL32tdeI6dOCtEjblsAjJHyUQhX/ltFIMnYEi
	 pSOX6yhWJ74ZwrZd9lJIcfSNKOEk+bDDc4TjoKhqbVWVfbhjtW2cmN5c7i4qdpod8zBf/
	 6cMIXgx7Gbl13mRhyu4ZzaMESuf98Q7FZfdK/Y3YElgQCx7m5ur3+YEB7vP6lptSCGc4w
	 WaSIykLM1HEO1dTlds7j20vUXRiBQ2FAoSOGBoHri/yKqJj4nEFFcpiGNSY6k5Tpi3xSU
	 Ut1BwsVmEZwS/x/ba8Qd1zrAFBAF7+R4mS5uIzPJ3CBjbHXHmwXAsQqdVqQHsIV+lbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Z5Hen74/";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A83606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A83606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z5Hen74/
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9d52f684fso16983725ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793875189; x=1794479989; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFIhQY+79JG5rknzOWA6767gSvTCQmC5gGZYO/Mt64s=;
        b=Z5Hen74/IL8+CT9mVHy+9ZSGz4YnXj3mgq2j0XXt6Nyo5/5Mg/fGpCi/Ix8jbKZxBj
         uvlO+OInggQh2wCo1igKQsZieI8dgqjhy9TvknLksmUZ7sR3mIODaYuEjuGeVLdKeS6p
         lgswcACgo/nGPGqzbGzWcIXRZRL3kSK9NhOlHMFEfmeI0hxjZG66SykFvOXRm2BA0ZUR
         XY2jdESaeszWs+zkhiS2hb7WR9H4S+4K0fFza4fxEeYmK2d6k4bl9/Gw+GvC3i9pC6j8
         rn7kEdaXOhMOq0L1jRnklRHDAkpdktLz9lil7qQeH3MdXbiEKXq0tSuMFJijRyZ6d1Vu
         IJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875189; x=1794479989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFIhQY+79JG5rknzOWA6767gSvTCQmC5gGZYO/Mt64s=;
        b=m2yd7jhVVMgSbJbNWXDC4OXdpYukVG/2xe1Uuutc5c854RaDkXmBfnXjlI5R+eed9N
         8fQx59uZXJhYgFEKlAoG8fZUjCc6iq0Zd8lCCnH3Em1diU1l3+dUFkHo2chcN4BDM7p4
         sVhJ2SfYG/WJOugzeIEE3zdxNjFpOCEKZtrEoy6L5DJnKytTgLOEeAclAwvbRaBzJ/FH
         Bx6MZcEbwEQ42EXc+7kOghDLj+taSY0lgfFcnYyaU8clTCWO7er9NUr67+UHhYQzCSlZ
         QBMgaNkuLD2igjQlZIUiKLEApq1MJk95aZD1udl+uxR+c/MjebFgLVt6SBN7kbxhqLuL
         vPPw==
X-Forwarded-Encrypted: i=1; AKwUvBx//7rRs+w2g6/YUZeLg1O5Rod7BX/bFfeU4dn2jh8uOY6/MvnXB1EXi/LASgoSBS7uUaPHz1VvU/rmtUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rmwvodXJJTyxU8k8cn/JLQUtH5zp748SnLbMdqh7/3lThOv9a
	eCuwZUKcYUUH8EtzVNcYx6cqCWm45Nh08CzG5s67uqk1M7cqDCuX35407e6rATHu1cp8jn2+xzs
	aF4/e8SRP+0g+Xt0DpLGVCw==
X-Received: from plao13.prod.google.com ([2002:a17:903:300d:b0:2ea:775d:de30])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ec3:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2eb364025a8mr173003765ad.5.1793875188940;
 Thu, 05 Nov 2026 02:39:48 -0800 (PST)
Date: Thu,  5 Nov 2026 10:39:47 +0000
In-Reply-To: <auwR7gnuLsF0lpmG@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030121700.260975-1-jenhaochen@google.com> <auwR7gnuLsF0lpmG@google.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105103947.7521-1-jenhaochen@google.com>
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
From: Jenhao Chen <jenhaochen@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, 
	liumartin@google.com, benwei@google.com, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On (26/11/05 14:23), Sergey Senozhatsky wrote:
> I suppose there is performance benefit?
> 
> I guess I don't mind in principle, one thing to note is that this conflicts
> with [1].
> 
> [1] https://lore.kernel.org/linux-kernel/20261105044752.1997895-1-senozhatsky@chromium.org

Hi Sergey,

Yes -- in a steady-state microbenchmark of paired alloc+write and free
operations across 8 compressed object size classes (384..3136 B):

1. On current mm-new (zs_malloc + zs_obj_write + zs_free):
   - Clang 22 -O2: -7.7 (arm64) / -11.8 (x86_64) retired instructions
     per pair (-3.2% cycles on x86_64).
   - Clang 22 -O2 + CONFIG_AUTOFDO_CLANG: -13.0 (arm64) / -17.5 (x86_64)
     retired instructions per pair (-4.8% cycles on x86_64), while
     shrinking zs_malloc() from 2,872 B to 1,828 B on arm64 (-36%) and
     2,088 B to 1,474 B on x86_64 (-29%).
   - GCC 15 -O2 (x86_64, without AutoFDO): GCC leaves both obj_malloc()
     (306 B) and obj_free() (120 B) out-of-line while inlining the
     single-caller slow path alloc_zspage() into zs_malloc(); the patch
     saves -23.7 retired instructions per pair and shrinks zs_malloc()
     from 1,738 B to 1,441 B (-17%).

2. Rebased on top of [1] (zs_store + zs_free):
   In [PATCH 6/7], the new static obj_write() helper has two call sites
   in zs_store(), so both Clang 22 -O2 (360 B on arm64, 219 B on x86_64)
   and GCC 15 -O2 (obj_write.isra.0, 229 B on x86_64) leave obj_write()
   out-of-line as well. In the zs_store() fast path, obj_malloc() packs
   (m_zpdesc, obj, zspage->class) via location_to_obj(), and the
   out-of-line obj_write() immediately unpacks obj_to_location(),
   recomputes offset_in_page(class->size * obj_idx), and re-checks
   !ZsHugePage(zspage).

   If we also mark obj_write() __always_inline alongside obj_malloc()
   and obj_free() (with noinline on alloc_zspage()), the compiler CSEs
   those redundant operations across the fast path:
   - arm64 (Clang 22): -31.3 (-O2, -4.0%) / -34.7 (-O2 + AUTOFDO, -4.5%)
     retired instructions per zs_store() + zs_free() pair (vs. -8.4 for
     obj_malloc() alone), shrinking zs_store() under AUTOFDO from
     3,144 B to 2,448 B (-22%).
   - x86_64 (Clang 22): -26.6 (-O2) / -31.8 (-O2 + AUTOFDO) retired
     instructions per pair (~4.0-4.5% latency reduction).
   - x86_64 (GCC 15 -O2): -37.1 retired instructions (-5.1%) and -5.3%
     latency (-5.5% cycles) per pair, while keeping zs_store() slightly
     smaller (1,997 B -> 1,943 B).

Would you prefer that I send v2 rebased on top of [1] (including
__always_inline on obj_write()), or send v2 against current mm-new
first?

Thanks,
Jenhao
