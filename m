Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480324;
	b=5IYrpwWJFyBZy+eV9NJkNXk12JRbFOGcvmiQWdGU81epcjpW7dl3r5X62NYfbn/+Nj1s
	 YqIxr41gmur8QCNmIQT+fA3GmLtsUqumBvd+ZMAj35FXjfsR9vre1kAHY8pZw+td5SSIk
	 JbIi0mmRqx6Y1/F035ogGmTwraFx+pYwNOiNsJP3Y47NgE1VAABcuuVHn0GkEYzy0LU/J
	 2OKD5s38ZdScirB5ukLSawAZ0TcAlGnrS8QZAUIYOmbUexPMcQlNF8xjIFYTV45JjADb8
	 9EAJiTXstqtfL7A9k/zPXoaGuI+BM8orSfeYp41TQ0Fy9L4uSkUmrSkddeZJXVA7RnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
	b=Ie9DtX17qV6hamhvRP3quKimRfP331vRSZi741n8sjchD+/KVHjQ9PRBFVY7AS+SS8zk
	 feuCUkQWhYq7EllENV2V0rmCsLc34n2JemD1T1Dgx3selLfp4CnNq4A/wKg3uJbkCXMrs
	 tLB/jn53gvClwyKENQNjY6VBIkySqBy7/i8QoII8eApvDsIlsBG3gMha0ToZyg2d/X+Lj
	 maWCiTBWCiSEG5IKJZq5AuS/kMlLesUeicqBZ0o78gYTm4KblzISWWplFeMYUuFxuuodC
	 PzzenCKEP7x1/uqf/kU/ETJLeSLnoZZHYTNUpaXc+A0ArJEnPN6KuBqqfWOoMGE1emw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zp09kXBl;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB27606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB27606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zp09kXBl
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so7337900eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480323; x=1795085123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=Zp09kXBl3tmzhNDXnluIDoVu4hJxPbk8hdtimF2khZPOnmQNb/S51ybbT4EWDLGxFw
         Be7xVzGkqwAHxCgQynyRwNUgCxhCFxrW3KOQASvFTF9D8v9z5Ty/Z1wOAnlUMbVzE4Go
         RWxAo8OlK4tyKB8j6Qr7/bQpjb+eWhQrynqXYzLMO/fX+PBfZdj1SoaL4IBkHxGx3rjg
         mVHJPVd0NHLJYHqnhTFUjKsz2XzQFt1cG2JrXhnnmVTqrUwPrdc8l7KrkRFHqmzbjUAQ
         D8vzOQKHC5fSAMhWu8rcUEyk7QBhECesNnISmx9JsCfbfMYsY2GZ9zBZS2JUP9fCcIAv
         Om5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480323; x=1795085123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=nEhMvq8olFYc+d+kZdoN+/zf+zmoI60PdmND+QQ8IouzIuPq/Vm3MrjvCANgI7uDis
         K2Kk8C/FIEIeDp8S0Ib2EgrIiEh9UHzJDM02GWO+DwPpdbHzM98TFdhGKI1AQYFKYg8/
         YRTgJQ3LHTFqlduIgjoTxqr9sXm+WXSaYrimksX0CQdwvvjz30aZ0TWyeA2p8E0kb0zC
         6ucV5U6MHBoRk5qgWBOV6fjZZcNuP3Wik8KuwGWU2x7KCW8oZYdD+JkQHzf7BnZoGc7H
         THca7dFffH/dd/t9cGcBrx1qV1UtMusTW99xLxD8+kEF4LtZqSI/GLjaXS6eGdSTeoNe
         N88A==
X-Forwarded-Encrypted: i=1; AL+hErGfxqrE3N9N+qWdyT+VjqHiB3grnA6ROBvK+Xyfy1+bJFlgHCQ1ZUf9BMb+p4Aq29PCyIWDxuUwbTbKIGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aLjwRVAnnBnJ1w2lUd+2oeTJqUZ3kPl989fAMyhvwM66gXTfY
	JLuruSMP8Q2VG2bRyPq8CBkrcRj/hODEW9kDhzguC8KN/phyRkVXTscBTPUbfoy84wY=
X-Gm-Gg: AYBFou2GjnR+TaDXvqGcvLHRpI2t99DqZ+qfOZBm93woyPEiX3HCOO9Hk9yezm053wu
	3huVrILyPEF5HzxKjiitwqj58dhsWJ+Qn8h2v3N9Zb2z0mhIJ2Clup0FcNldWPwNtjFeMiveaVS
	hJb2gAz9CeO3xB3U9NNCHrGB8xyB9+aX7SnfhGf/DMcQsuFnQjR664qelHzhjDihuaG/rpzsxgp
	a0wHWrGpu4aFJ9x+4gVZo8ke2i1e4U+0OBFiuXSS2x9TOqfPRDGnDmgBEIKbZgiSEENW4pO+hUd
	6i8+IKUuo/15nSc8v+721CLs8f1wna0UhLuQ0BPb3oUlAK8LuM2wFO0qKDUybOnSXjUKOkVzOaZ
	Wa7+1LzcrTu5UJ81T7mH6Avkk/EwKL37UWm/w8jbWvWqasdfbr5zdnlcePbuf8GDcx+QA8x8QXt
	OwmBpypHNvPJXIG2Vgyg0veZXRl3t/NQ9D6Km6ZmmnliU5tkh4puqF4wKShThtROvuA1G+rfu0E
	U4rdfPc2qTJvnpEj7f0lujN8yPy1VP/Hqm5yKPzGQSFT9lqkyxvJQz2N29K1Vk+0Qa3TUr2TW+q
	YSWh2jcwZ3UeTQbnkSrJ7unYieM7RG7UgA5HWqklxoldI+oSg9N9LF3QvX2lfaQ7lJg=
X-Received: by 2002:a05:693c:69c8:b0:369:fe81:a575 with SMTP id 5a478bee46e88-37686756684mr5116143eec.35.1794480322588;
        Thu, 12 Nov 2026 02:45:22 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.45.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:45:22 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
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
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 9/9] riscv: select HAVE_CMPXCHG_LOCAL
Date: Thu, 12 Nov 2026 18:41:49 +0800
Message-Id: <20261112104149.38589-10-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
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

