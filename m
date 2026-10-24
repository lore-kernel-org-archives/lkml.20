Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792813446;
	b=uqzZCrWjg/FtvxPonsaP5xbYGzadzpl3ee4SVQUEB7nBmLrFq2m6uvW8C0eQlWebQHLw
	 M73mn2igbW47ewHXIAZsRTjvKB1MG7M8sMz3NYDrMFVMrtny8E8rqBt+59mX4JV86F5B9
	 cvnRBVtrlWU+7nriszME3pXVLyA7gN4bw/+sL4q2SsPbaPqVUqh5VW7Bh6GKnmlzu4Kq9
	 NTpxU7p2AdUrLrUjSy43YxQXTYdohWaxcjcbaf2pVv/HX6XM8f8fK8IQwHCsiv7rTu0fP
	 jNe6FPKFRerHLKZL+0UDgKoRVLVRcsslznCJvPJqupCMvv2IcG7G5uLKJ3fcZ2UE0Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792813446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
	b=bT1O+CPA0HArt8gMqYI4VKK+w+P4DEjfI6BRWF3SlQ8C7rEeHpfZOEl7ftpMMdZddpeq
	 GkPZ5WzRo5dM1Dxpfnz3QKGhnN87aMCsFLaSXTFNxbNckwHKWEtQXGZel9qQ3CKGV71Ye
	 dWPuvqxgy/DIJV51besGKR1YFNAbZGeHLzGkwfgNTspJ6/wGe41xfxmFWgbTMot6G8nej
	 QmS8xDSyCE3pe018B1fYY63HfrvfHuRFaUFnOzsT3PlbXhFdCCXv+iCxfwPD7iGpOIC2t
	 QoDe/So1Dk0RJmnMV4C5c85LCQf3oKcyPtVgQeLa8MPS08fP4rXocYDNgJjWnUGoMfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dsq94QfJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dsq94QfJ
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a76f63b243so1854787fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792813445; cv=none;
        d=google.com; s=arc-20260327;
        b=nZJogno7cRb/WhlR/zRJjOBW78nxT0tHK5AyPDfRMKnye4SgNmIPjdIdf3SD7cKDj6
         OoHKXjvwhY9MVlHX7wC0cbTr71Z405S2kctPXlGbB4cr2dnve5gRmXK6UUPdGH5nGT6I
         v0qnRH6bXFaQN6elASi2wGxXugd5ojUsSCiBthJYadJy/xA0ZjgN4pBPQZs42oGzc61M
         gqC6UecrLzkJL3M9t5c1R87Wi0438IQyb2IO3R0iwSZQsxqZMqr/KXkcCldPsKSuj7E1
         6WZpCYgXYeJEbpmB/MzFReMu+r2BAFWt327u1E9G/gZQzWMgMt9c50HzKbbW7nlqpvGP
         5v1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
        fh=x9GtADOFIsSe93bm3piYU+hNzguRfYnteiLFVMKav5k=;
        b=DsbSXVCsnfj5yYcVdW0FtJYcRnZRyeSJsE2QLcC+8DQDWLN8OCfxoczYZ3fU4PHNBU
         AQRGX3ItJjYy3IJUsimCfr1OR49OvYZzZT0UWJpNOc4zER1nyyhzpje5lZNWBfrCfRHx
         s4IhtTI44zj5rF79hHckcUdJQOFcHrPCq2QNId0cgwH02hUvTrhoAEK8nwI8yvbzYh1m
         TpcIhBQCmm8SPo3GKmN1QoM+MO8FjMikscONfxMsfC5EvmOMvqacXPH8ZedMNfvwhmBO
         W3lxDBhEp46sRDc84KbBZkxuXyt7rQck2shB/RWA7s+2loSbXzh4Zjhq0QRDA8McXYOx
         pcrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792813445; x=1793418245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
        b=Dsq94QfJwuxTXWfcWbJgISmpq5FjyjAioasRFdAxllP/qjxzZBiqk61NzPXHzvQJ9g
         KeYQcvhK2rYrU4UWIl/fq0HzOJ3IpNMptHLszl+cnhvQhUeAWNSOdytcduFL9fG4cTRw
         rl3AEyCPBswgrr4UvmxyQgB/i/AeM8DCVRP69Peo5QB22tFJaaEnf/Nekl2wE+JsRaXl
         7oCzA7FFVU8uWHhyoxkfw2+V5Jp3opmBqUr5EI6cvfnUYLO1wwmw++XA92IHK3XGuZkM
         fIkXDzbe3NkN/adKsoPVao3xCKZ0mX5JoqrreqFrbH27cayJ90Ic7Mht2Mr8WL0KFzeP
         ndPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792813445; x=1793418245;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1EfrUVYhMkemv76adwO/TrD45i9KqtzMIzJ/at72g0=;
        b=ODhSP9X2CJuKpTbWLUPGCYHENB1y2O0JlO5Z8BMrkqp4YSSqpAqv70rYD06O79tyzF
         6WWVb7NV3yPuWYiEZbbTv4z/yw9ZTSRhqmzy1DYij8UY97zwgi2SOHlfFECxokViMIkZ
         WdBzDYYLTGG0g+bizTS5Dor06xDbXvdEvb/SNMz8oBp7il2VBnxTT+AMI4HObySgEbdr
         /3Wzk1OPbxDkcfv1+mP9MPsTli5/Q+VuACG01CYUev+nYA8Pn0NX/swqNp/C5DfNPXtE
         57UJnOtOiP12MfSGyRRsVFNQdEvCUGYx5H0u8U2ouOs1Erj/dQgYxMORlFrP4O/nSU40
         3IBw==
X-Forwarded-Encrypted: i=1; AKwUvByDWlGV8jgyPdm5PSc3Z6oyNJnoO3pBuH65DhQ2+OuiXwHI0/Rtkh6iyJk03qUiCSMfoi+ASr4gv/Pei2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoDLtk7CTnnwDjrqD55aEX/jSfZMWusPvi7mRDa1d4rhFT6A0c
	U2UzyFB3o3oUZ3hIkrR0AvaAlOTMJm0z4XCd2oi3sRVtZDmSIMuYRE4Si/sCLW5qs0Hdn2tYPzS
	xOx1TA3wZ0LHDwdVvDWwaU4yBw1M8LGg=
X-Gm-Gg: AYBFou1NLZwB93n6WgbH8RT0guNrUrml0nq2OYDxjYGJV78kOoVtKXZpDQQdSaosLqa
	UC2NP7YOf6FgnOtJR4MlF9jll8+ALVDfM1vNhsfvaAFtaQ7NeYRQ/1mQMn8AX/4Ky0dCe5pGxYM
	dBVwIXVq9OX6Uvzxd4FIekiK8Jh/fhl9uGrao/EN96tyH1CCmE3sWVi8QlgyAzeMIoGUO6/Zy9u
	Qmv7epfwcgdX2q5TIOgechvH59Mpi02aq5IK7pxLJs+6eSA3AI3ctlOtX7wcFMxHy9oJUhE2Zi+
	Qzy9l0wOoxneLPOXd4s1W98pFrJ0fncBleeYJBDD+ZA+W3MDTcLuA15opQdlEdoly6DFUvKYu24
	n7INh5LZzjeWafJYIRvcsbyapK0/O/BSitOVf1A==
X-Received: by 2002:a05:6871:b2b:b0:470:e97e:8f84 with SMTP id
 586e51a60fabf-4a83f524928mr628402fac.20.1792813444700; Fri, 23 Oct 2026
 20:44:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Sat, 24 Oct 2026 00:43:52 -0300
X-Gm-Features: AclHuK_AGq1lvNz9W2OO7Eg_BHM0lXyGPTbv0z4Ci5LFM_mC0rlj2Yh3p9Rsm-Y
Message-ID: <CAFA5sMeMcqawompHuzrokwhP8icaNVtghqFr0GYxuqUm1TaB_w@mail.gmail.com>
Subject: [RFC] mm: page-fault: overcommit: PPM (Page-Plugger Under Memory)
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org, 
	jgunthorpe@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ard, EFI Subsystem, Kernel Subsystem, Doc Subsystem, Jgun NVIDIA, Kees,

Actually, the Kernel Linux memory management subsystem introduces
significant latency spikes during single-use, high-velocity volatile
data streams due to speculative overcommit tracking and reactive page
fault allocation handlers.

To eliminate the cycle overhead of the page fault handler (vector 14
exception routines), this RFC proposes a localized, pre-mapping bypass
called Page-Plugger Under Memory (PPM).

Architectural Overview:
The PPM subsystem introduces a non-destructive hardware plug mechanism
within the core page table layer, targeting the upper execution bits
of gfp_t allocations (allocated within the Bit 54 and Bit 55 matrix
limits to avoid legacy subsystem collision).

1. Allocation Handshake (ppm_kalloc):
Using the GFP_PLUG_MEMORY mask, the allocator completely bypasses
passive overcommit verification. It instantly isolates physical frames
on the RAM, maps the page table entries s=C3=ADncronamente, and forces the
Present Bit and Writable Bit to 1 before returning the address block
register to the CPU.

2. Desallocation Cleanup (ppm_kfree):
Triggered via the GFP_FREE_T parameter, the release phase executes an
immediate length truncation to 0. It forces a synchronous TLB
invalidation (via invlpg execution) and flushes the data out of the L3
cache lines using clflushopt instructions before moving the hot clean
pages into a dedicated priority recycling pool.

Performance Target:
- Elimination of page fault latency penalties on performance-critical pathw=
ays.
- Deterministic allocation timings with localized hardware cache purges.

This header infrastructure is prototyped inside
<linux/ppm/gfp_types.h> using global tipified configuration masks
(GFP_MASK) to enforce 1-clock execution checks inside the allocation
hot paths.

Feedback and architectural review regarding this memory plug
optimization layer are highly appreciated.

Signed-off-by: Jo=C3=A3o Guilherme da Silva Freitas Lima <joanandalima@gmai=
l.com>
