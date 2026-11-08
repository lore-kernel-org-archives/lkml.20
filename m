Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135960;
	b=m3YqKICmh/dOB2ldkQMKjOOgyT0QRrHPQfhkP0ebzSzk4+7VmbwsWhwdgFSmqLEeyg9E
	 +xD6xm8Br7aLIf1PQlUQYZyZByuGjAZsvK7yb8pqg4uj0Jkrhn0798cOWTCZiriFFttDn
	 +4lgLTaE7E+Pdvrl/ESHd/blP/ayA4c1c9FyfNgB2VKsF391lJwMqKZX/yk/emQ0MHDqM
	 EW65Qn8jl2Ps9P3kHREj5RHWWrI0W7LiSnDwXqbzMOLp+We7k6O8ApW8NyB05tmxn6uFq
	 LV5e5oO5BMI7VDR5up8LgN2/vRf8g4GZB54kwoCl8BHXsipHh/Z8zt6LNQ1ddLfbNYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
	b=ZJKAUhTNCuEQJxifBwkQp8Q0cWtYhvSIEHwmRqTJEXFQXtMuHwbsHKfSzI8hto/aU31z
	 1bqQfg/PlHPaDNtvOpaGCYcbM6QXpDx3QzzDf6L91GQ1sgHJAhXzeNQAE6nOdnLdvdEvB
	 gl9NQSvCgySMTAPcGbPS0CJITJnNubGsz9axL8UTtig76Uyzr9yOBOizBKSjAOFQW0mUB
	 RImNj3MUi12jKoE2RZA5+cIhSnTAtP599NzRZltxmyOhHd710F8+dCeQZ7Xdhv5gap6EV
	 bWA1VR8gyuVtZQK+bmlQk5idBCrXEtT939TBQ3nlgkRKoEVfFkqp+GXYbR89Pxvc0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=D+POMC6D;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B08606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B08606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=D+POMC6D
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb684859cbso5224a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135959; x=1794740759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=D+POMC6DjnAMXuun5QRRLTq47rbKzSW6rpLIO6+pAax71RS7F4vSqzHL+czVDCiR1a
         LKec1rgU4fX8MAKqX7xxjoyLlpNYxct8bjOiifxLPor04GN8DXvtYvlkWLzhlR7IgYaa
         m70rONQ83iI8iYaSFaRxXH1VeFI3f8l6QemXDsa69/5YQTuUjJpM/aN5A7Y0y6cO91Mz
         fuWUiPn8EEuTSNeeNOPXtzC0HqXzXonppIia329VxHVByAzAnfoSYLsPIDtpvQYxJC6f
         53aWPPUjP1Yhi6OygYQDevmecBxiQHcw/Ac3eJLaBM3mGAkO0cuDPEqNxPpOpprTqdDn
         HLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135959; x=1794740759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=Lwgi0hdrIKiz7cg9QSOrpu+W/9S1labQbJlBAgnOIyZ5uJq/WRQw50YegqdT9mIX+5
         k4M7L2LZzeF/aCkSp9V4tTOja5rwht0sLzYwGsXblqHsXwkNyA9z2D0hNLbqgmiVCvu0
         YgXD3pLBP68gbjtEVY+sP37LXUbFdRi44SdziWImqsILSU4ffpmIDusH4cR5PSqR+n4m
         8GmKSnY7AqSrVk34fW37q6lEOG4vZqvdCJFGg0cAP1exU1pbWwkLkEUGbQlLvU0rarSU
         fcQIJnAMTtk5drgpoNcG3UWa0yyYGfymT7Up5e8WEMEwn0fzjBEW6//K2HQYRAhuWLvH
         7eEw==
X-Forwarded-Encrypted: i=1; AL+hErHoKcfOdNXxVQXoFI/reuhkWc0H1y48ZTiWDQeEj8BrgkI0TPhIrY1BnxyhKqgOeZUfCx4qdyWgJtKgvMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LFXVfT1YTJYr2nUrMVFGgqas9iR+i2xwqMH2qDdTbLQU8m6NA
	Is8cVE2YWyubL3L7VRcOnV9JHtqzuvwbN6YCWvQFfIFl/Nr+N/iAhdvL2Fv9M4squSo=
X-Gm-Gg: AYBFou2h65vMvPC5UT34VxSFLUWuZ3b8QPpR9+VChAN/bTIi0bcqhN8H+EXTIl0o7He
	gkEofPB2mXXsgAQP/+hwzsoTbDkf1YZ7qrIwhEEyn6w+y+N4ajQaWGo3OvCefqNCIMvqLBe+gqa
	Wrsfs+fU+x0utrxRD8FM8vaag2uM0H8u0fbtE3RGAL72tHFWZhOI7lVB0TzOSYERT6mPVImo1f7
	wWHgT+bIVNayFddhC5mqaTtjkbuz8hlgrzzoy7L2BP0H1lTAryfjo/InzkxM6eKSSZeq8Mt+Zdy
	xSZp+SOrIjwBpfoz0BLPQC/4T3Q1EbsTos5K/1EPGFw4VFsqPFQLuh1/MduTFHYnYyYCUKfqSq8
	sPRKREy+ZNlCeVaR368s28QXZBpbisnaplDIa9PO5N/4UtCs0ckaZcsuzPftACt4yZDyTRlDzDQ
	pUNj7eR6bGPluVQD5hfUvhbqjPChaevstlNx3pwS0uIvE+HU+FMfP/SscrtwY8fNBol1Q5kroX3
	oATtJWkcprxyHbDnwBrw2Hz2Vlwf4ryannz5xJJ/Aea0rYS+Il5rBNdfmGRsdpUL8njBFZf+Wte
	aK74l0lZJKrYE++8/ShkpC6SRLmPfctRUMXSjcLoqQiU1P1mP+vN1A8yztghmRY=
X-Received: by 2002:a17:90b:3b8b:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b12d43f8c0mr1076560a91.48.1794135959430;
        Sun, 08 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.05.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:05:57 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 3/3] riscv: select HAVE_CMPXCHG_LOCAL
Date: Sun,  8 Nov 2026 19:04:06 +0800
Message-Id: <20261108110406.97495-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261108110406.97495-1-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
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

Now that RISC-V provides this_cpu_cmpxchg(), select
HAVE_CMPXCHG_LOCAL so mm/vmstat.c and lib/percpu_counter.c can use
this_cpu_try_cmpxchg() instead of serializing per-CPU counter updates
with local_irq_save() and local_irq_restore().

Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038f..458ef01e926a4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -155,6 +155,7 @@ config RISCV
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-- 
2.39.5

