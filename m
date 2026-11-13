Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528908;
	b=kVHgtRpxaHl45V2RzoNQi1ErFY3jrjOP0iz748WVZrlXNTZyJC5WE7WFHJUFCz3yWJJw
	 qnxJQh3BfKkTfXBEVE+2hW2dmXkrZU2L4QcR7NgCd39MRk8Rvs4rc/g0INNALxIlUy+H0
	 6J6JB51xzhMNJcZHjGJCOlBe9d0LOFDVEXwJ1icj0abYxPIBqOZs7CwtAqy0+TQISJUuc
	 RZi5cBbY4LSH7AxORPy9zQINDiib+0KH/PMdJU0V5XLEK4UGmrckxwjooJWCj9qS3gYzq
	 9ksF2klAbThkYPcdbYpIM1tNEulfZYWsQPxCu0FKgnw4UV2U0hAP5dmOdBenbSqlTpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=d1TISz9BJ+a5QOSJr7M6z9zKZhHkNytH1MrYfjk3YS8=;
	b=YxiNnmn9FAZKxBs097TzOuTHn7e7Dkpvtar8ArYxivpZxMhn5+JtKf9LkjD0Y0XnfjJv
	 Eub5wNk5weguU2RUllIOhkqfQe9r3O0/eGXTICS9XfdBHZkFF2ajNszvGzzuAPciZzWWx
	 iQbt7ap1Ir/BPxHAbikjlcthn+Fs9RzK71XSwRHqZDktvsY7zvsQRbcwUfcyiItfV3scV
	 D1y2LP2x9MrJtUFg48oa4QA23kvKeYgzo4DFN1495puj8xIo//v2I+yoLcHQHKKoMxxPD
	 2sbmYklLVZ+P4SYO4/sG9QRCc0P5tsYYFndxlcazPkKl7UjJJuUFJw4XcVv6Fk8UDjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9pPI688;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE47E606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE47E606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9pPI688
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so4495121fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528906; x=1795133706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1TISz9BJ+a5QOSJr7M6z9zKZhHkNytH1MrYfjk3YS8=;
        b=I9pPI688d72yPRjRHlw6kj3GU7v2h1ixM7pkk6hqmI7kG0u6+LdgOG0gaRoPYgZ2C0
         4Yt4DGXgyx7SX7dZRhH8R0Q93eqhCwV8tiY4sX2n9RGWRwNrgwijrLbqx8HjAb40SP+Z
         ikfb1jCrIwgZkztujjNMyXZ8H12YewRY1TX8ZaheH2uYot2qyWnkRYhiHmJ+9axeCt7f
         N0uUWn/MvIkPaW/T3YDOuB5dxuIW8XmGHNavaK0ztpr/uNSs1AS96TDps5SbUJt9JcAh
         XyHqKZ7OLMKNVZyQIpuN2xR5NEoixr8FfwaAkkBZc4dZtXcuFg9zfrhia6n7QFpj0i9+
         dUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528906; x=1795133706;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1TISz9BJ+a5QOSJr7M6z9zKZhHkNytH1MrYfjk3YS8=;
        b=N1OpcFUgINPoRnEURnq5ePrfzkr2iLcClAqCBtHNP9K9YPdD4y01Nl5D4V1uL1jM6u
         SCyKk60bO36oKmnPh5nZtp5z0DAViV3WvCRZDHpaohAHDI/8xRRgs7dZMuHeCMKBd/NO
         w2csRAXBN2lvQz7lYEaAstvhKco784a1AS+WtsnNhXFLzcJs1x5wJWSl8m9szDA3EZLf
         bfh+q0ghJta6Dv8nAvaKN4oGNU0ZFk+9NTO+Z1R50VQHgoWxIcdR8O5l8bBlgkfvuDKd
         74khAuRpHbjDb5RF5cMx6S8t3gSbbRh/5PO72Y7MJ5CoFB+R5uZO9n1EK3buytVs8sex
         Svpw==
X-Gm-Message-State: APuU4Z+IVy3vshAS0GT+uSFt//HDQpHRhHFcnasY61/U8Nyg/OIGYUtS
	E4qWkhGE0wCBd3sETc8zkmN/+cpxNGq4EUc3ZH2XpWCy7v7nwe429zHqYDn5K8oumW8=
X-Gm-Gg: AYBFou3KIe1IVx+42VV6VG6/gKyVuxxqqCfr+EVmThzDGBDowNuxWYbb7deHjVYRl4L
	3r9ciNlJOi1RWhiEXCODghGXH4G3zNkfugWc4hC8dh81Rk3Xbh4xwjn158bufkqt7pL3Z4xjhiJ
	iUB8EoLOqcAdoTdU3sUBCSIbjGiDm0icldu3j0cF/HlPngk9ltpeYm6vr+ocBf9mYIESQtC4nFX
	wpEmMhiLlRDGwTbnLY9Vsg6tBqUelydfPqHAD+MYorU7uIQAb23qkH6EtXz1SvnC/ClGa9WJM1F
	aTsgDxvNoJORwZ4OXGgIQQDLavs6qiPp1apiNGn2xig+llIRoHwDTDdNrNcI0pFgyTJwaVAz7XS
	ucE8vUo0jllCPPwA6feqgb805m2qOVMS6jbS/rIXqY4OeqXOEDpKeDaoQzQwZKTdGavYYxWBENW
	x0293EZeRgrPNfDrwYyqpl/51CZ/LgDjmV1r+Em+bOxUYFrd/MQ72IybtpNLo9Qt98J+ZIVca+n
	eoEK+tcuQRE7NcMKQI7BM0m8+IskgEW7lyVBhZsMvuZyX+AH+6U7fnHM1Di4uHDSd2HeZBlDLrZ
	wSAoRX0saujPg6kAlSORpgxa0mJtPIgtaLJd0FS72R7oHs96YaAOkaIIvzbyM9VcvQnagk4hJ4x
	WhanQL1qTdQ==
X-Received: by 2002:a05:6512:b92:b0:5bf:bd7e:197a with SMTP id 2adb3069b0e04-5c17079aab8mr424399e87.16.1794528905892;
        Thu, 12 Nov 2026 16:15:05 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:05 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 02/10] loongarch: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:08 +0400
Message-ID: <20261113001432.128201-3-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/loongarch/include/asm/idle.h      | 2 +-
 arch/loongarch/include/asm/smp.h       | 4 ++--
 arch/loongarch/include/asm/switch_to.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/idle.h b/arch/loongarch/include/asm/idle.h
index f7f2b7dbf..9913191cb 100644
--- a/arch/loongarch/include/asm/idle.h
+++ b/arch/loongarch/include/asm/idle.h
@@ -4,6 +4,6 @@
 
 #include <linux/linkage.h>
 
-extern asmlinkage void __arch_cpu_idle(void);
+asmlinkage void __arch_cpu_idle(void);
 
 #endif /* __ASM_IDLE_H  */
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index dd1457065..c21a5b60e 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -87,8 +87,8 @@ struct secondary_data {
 };
 extern struct secondary_data cpuboot_data;
 
-extern asmlinkage void smpboot_entry(void);
-extern asmlinkage void start_secondary(void);
+asmlinkage void smpboot_entry(void);
+asmlinkage void start_secondary(void);
 
 extern void calculate_cpu_foreign_map(void);
 
diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index ab9e0292c..aa5d3da68 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -21,7 +21,7 @@ struct task_struct;
  * This function is used whilst scheduling to save the context of prev & load
  * the context of next. Returns prev.
  */
-extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
+asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, void *sched_ra, void *sched_cfa);
 
 /*
-- 
2.56.1

