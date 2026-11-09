Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794196078;
	b=rNW45k709TuXGKpFls4XAxhv+bIcLzMmnmCgAQS9vAE629hPrR23cG9OrCyeUSBddn+R
	 Zi6wxtE3SVa9/r+PNmOd1z8R7ZeT2X26tXtvJtFEBh9RO12ZkAO1adYm+1SCg1kZhHipp
	 d1etxmbE+o0i+Wgf+PR14uHfiyvSuFp0mpEW//fjSBcsPGhNgjnsV3YJgnkgY8ZTp4gsH
	 i7O5QlJ7/TuQ8PsdINXzT0CdmylzIp7IzOArRCLbhAXM5y4OtlFvPED2CYKIFcPA8iT9L
	 PkBBRSMUBzkyLsipGdpLd2f6xFORsSOszwFAea/gGpJTzgbM7AAlVTzXvUtkjkMxHcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
	b=2aOT4NpNLekbJXlPeUfVOldPB/0eO7gGXxiszIHMQb2mGjgqGmbbH2gosdioV7pX15kH
	 WDM+A00EPpNEI1NEMa50sAu4BJL1zgSDD19yPpL56fYlgfh92+P3j/czzOldVY6zGja8y
	 AIEcHe6xQWUAXlb1nCOTGOYgNN04f4QPyvEMyCpC1UKCnFoDqeYG49NhIcxyl4mnrjQNb
	 Du+iS+El0TZkTLKxS+qopT7M1E1K/2tuUcKxpxLsa3B/XluqHSyJW9ckDabhOSIWxZsc4
	 aacfe1JKigy9dsEn3lYsjj+HMTbiGsKdGkXOCTNrMMxPClUvci6VKMQuE9OwYzk9fDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BRK6lVn6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E39606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BRK6lVn6
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-85f34b20042so241322a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794196076; cv=none;
        d=google.com; s=arc-20260327;
        b=lTZkdXRqUWcNBJ5aeSYwJfNe0a3vUVoF6tMlkv2U3QH8iCzgQjaeqL9XJiyqfUamnX
         y142VQnw4wI1AShzbrM/wYtFwhMsetbd+pdU78dbFv1dEq7rF4CK58tZYYJBVXe+Abdk
         FCL8lN9MhMsQ4OujI2YHXY5Vm0RyxypOHs81GF/FT5XvEZNIRWnkNdwh6CzfUtolrYDN
         ZMmnrZLyz6HcB3UMFuiy/zc6HcqNanaV0U/mglGLebqP4Q8N8SqOPUb6EyF4aD05CylE
         3eOuhc5FyAb9ELt9Ir1C0Ct0G7gvIvUDcyKqwqxb4Gge6iGuDHiB672gdQl/JXa8a+Wj
         Hzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        fh=VfdY65eiVEGARR8awttPAIOBKUszsXxlxRugu6++uew=;
        b=f474VuJcZ/rcr/tyYLL4uTE48YDBZIvaW+fQqxXzuKlAf29xpiA+ZJqb/STOixsY4v
         AtxKdIRKl0qDAaHCUxDo81ZtqbK5LIWpIQeYitAgYZE9L/gZ3q5ndAZB+cXYtuKTx80d
         DFPXYi9AHtEShMAQnoxBbSYW/ZAXOeCztsJjjvWHEFofG++UpcueG2mc1z5G99aGyJP0
         tUGVH43JODDjieUiOmIilbL5rk++wA5mSXG17f22oGfzqa/phydZyb/AmDY2TV8ZyogN
         Q4aOdSWYd3Bn96TTXzAxg/vZrHpHwz1f56rhOKhlul7oaexIDZNZ7uilHkBbVcfzxusr
         9fQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794196076; x=1794800876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        b=BRK6lVn6DBIhL6CLmwBGU5c3a0fChD+LJ776GTef3sebth8LV/cWa6RewDLR2QfloD
         i6XPg5ZLaEUxhNKfgxDjaJCkeNk8fs4qJubLyMU2BSCLZyrEELPB790zu/svYNIEYZVi
         3o/QiRWXPC8tZXewpeQfZ/1ngVOfPM4Amr17ZpWofEtzZrZAclsRWkyrm2u8RLEVmNJO
         k/16lv17+AO3LzGt0N/wOhx8d2OJ9uuf2zpS5Qz+yvqLdwCl3ai3YQONP7GVOAV/b61v
         liIS9i+EzG4wknet/JDA/2iK5XBHkEsbXmqwpLekwmAWH5SIgvVpSvK2QIAWcUVq8PS/
         N5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196076; x=1794800876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        b=0YBP7HlYwaGBsPBLTVoj8BMAOC8CTSnf+KMU9g5OTe3n6bKwdRgRG5gk52aKvHc4uI
         KV/eNubyke4wYt62cQ6vd6jN9ScoeATaapADu1xTxiGkFY0py1HMMiaA04Fx90TV4FK1
         bnqOaHpnDLVEY7eaJ6vI30c6IpPSgyaTT5VUfEx8zn1NUOF5F+STn4qGQNaXnz+Q+LPR
         pq9iIUeotu2+/WxF5WES2NpoSZiOtF15wZZXoLsvLzxLblkKBteIObeI9W/Nr+5hICTZ
         LFH0DN5RV3O7AjL/TyHwuGo6EuLKwYpYtMCjno4GmsCJOVXWoerMPWd9TLSD+ml6nkM1
         oIbQ==
X-Forwarded-Encrypted: i=1; AL+hErGjiITWNZLHH5xyVIwlMo+0A1wZsODYauKB6gCLNoQjcDKj9wSE/VnB+IbBgZLh34/OG6YmXBKP1jF9EaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y8bBA9IqlQScawZ9LQykKNPvDIalDUZVHDPGQH9urCR9jnEXw
	hA4aT3iw/oLo7LPpHJh/y5PFGBQqy7MAnp2wj/dT5jQ3kYGzrpqR4ipODKJRH+rDcMyVYgkdFWF
	epY60lvxeArzI45ojKL/BXPZVlr78mSjHUdmEmRKDAw==
X-Gm-Gg: AYBFou3iG6yvOt8GJp0++zxYWgT1Espx/OfW+ziGtx2upjfK8Wt4xpujCBfB4TbShMD
	ajL+HwS3eayO6fbvGm/cJmoZI+qPnLGuGPRJ2pCVPk7OompV4Gu2FpQLkcOjCxSpj4HgSqsGH+3
	jyGdTBjN2lhksoUVvSQr7vvkGEXg9AP0Ro9Q/wuONtZ4J4x1UxHQGrPA2i04PNlGbbqnVQixzHX
	rX0zEGyO5bUvw9lBX8BGi1WIf8YbTtzArBayxoE0r7cRRqnDUykC/VLsjt0Aq675+eSnd4ueTKG
	NSgSq2Bi4ygWis/Qvvqez+ymOLzG/DI2+5hTYb+P3YbjZpr9reByjQo/IW2PhqcU54oQaqom9oQ
	gGniIiI6xKnISQNhjlMo2ZGdeCfWFEk8nuFG+xgnfI2g=
X-Received: by 2002:a05:6830:3115:b0:81e:abb6:7498 with SMTP id
 46e09a7af769-85f5082de7dmr2762199a34.23.1794196075840; Sun, 08 Nov 2026
 19:47:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com> <20261108213254.67805ef0@pumpkin>
In-Reply-To: <20261108213254.67805ef0@pumpkin>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Nov 2026 11:47:43 +0800
X-Gm-Features: AclHuK9B61ylAVcWnUjeFJuyJwDuHE_2RuMPKX9QRnbJ_mu0Y53s1C9cYNJl2lY
Message-ID: <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu operations
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Nov 9, 2026 at 5:33=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sun,  8 Nov 2026 19:04:04 +0800
> Yunhui Cui <cuiyunhui@bytedance.com> wrote:
>
> > RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> > operations use generic implementations that disable local interrupts.
> >
> > Implement RISC-V-specific this_cpu operations with preemption disabled
> > to keep accesses on the current CPU.
>
> Have you looked at some of the schemes (I think arm64 has the latest,
> but also s390) that do most per-cpu ops without disabling preemption.
> In particular they save the pre-emption check when pre-emption
> is enabled.
>
> Basically the code tells the scheduler which register contains the
> per-cpu data so that it can be 'magically' flipped during a context
> switch.

Many thanks for pointing this out and suggesting this optimization. This
is a very useful suggestion. In the common case no preemption or migration
occurs, so the preemption bookkeeping and reschedule check are unnecessary
overhead.

Implementing this scheme for RISC-V will require additional changes beyond
the current series. If this series is otherwise acceptable, I would like
to land the current this_cpu_* support first and then prepare a follow-up
series using this approach.

Thanks,
Yunhui

>
> David
