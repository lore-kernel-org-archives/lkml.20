Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558521;
	b=gr7GQPMhNuCsxqjJUmfP7qfllhFYs5w+eUYxqxnXEjl3t8SjzZALT21jvzShUdWI15ce
	 l5hEtLRKt2w4oRvuMXPeiXvbRwhNGBfMWVCsmDtvKzGDgk7vvo/xZnn3fqTmljAxlG0pi
	 i3CSLBcRHQLG03BhsuW5sQML2F0Fz5eT/tqdXDwJ1sBz455CzKDwS5vxB3eSRBak3Wep5
	 j3IKYpbdSrs4XK3PI6xwjFTddZ23bcnx/O2jY6WrZKP2szRjE279WJ4pshCG3sSoeG6IN
	 25MFrMXvTry2JVQg+8vbM9G7rKOgSHKksV0KYnvGC2bcmAs/l362FjC2o07chYydL5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
	b=Jz34WCUX/fpdIQrKwGCviEv+hixV3Dj4AqJQ9xfvLwkP4NYSpoGM8XURCVTlR1EQe1OV
	 zFC8nUlKRQGTSNwNCLE3SCM8lNsldLokQlgJ719bwBfbKiT/lC72KFqQCRnY7z6K9zawh
	 3Djzf/ndRIya3gH3N2vbzsC4crHiGx56JdfT+p/QAaFxxjeVqECxM3eDTX1eWw8iwI0iY
	 v1lzevlLOgBzaGKZJsfV+wvK00R6bteDJPAuCVOUipKTP9W/nVIz0E7CXHh+e4H7d6wEv
	 2xW8kl4wKg2aBgZXTxlobkJe/64CbY/m4zJrSWkFdpknYeRGiUpU6f0YyOFbFMgPd6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOulv2aG;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63374606C98B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63374606C98B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOulv2aG
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so10104605ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794558520; x=1795163320; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=hOulv2aGaS9ZeYnKvdMh6U1l4N+M1moW7Kq+ZGF+AV8yNfLpmz1l/YjkfZD+2q1O3W
         vOzcRXS090dMSTIT6ABgDWNRiQNm2rE2Nt15iV1NZr7LyEZ3Si02OiNVzVyNdbANYNWS
         jwweszeCZfe+J6GH7eD/5rQBCOzgueHigErCyhFdE48sdajr2sDn0KhDPYP9ls9Isvk0
         n1lnuFKtsZumrpxUeYPLR/TScqxjbzGJ8oMycyJReOI8ALgf1cGSLMcspEcWGk7i3SRW
         3MvDpqdZwGMumpG0XjIyKcDBS5eIjfL2CLMvQkSay6LsuQcH9Qk/R1HFRs6gf2bBNR0X
         GMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558520; x=1795163320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=rYdnPthAf7FaVQv4zfQxPVZVJ5M3e3YRvAFPwgZ9YVzRASIBAlgQTu6f/71G1zDBV7
         8yK3GnWiCjvYQWDLzHUJ4Zy92hkg1eNd9ob5w+r5fmsz2I97sRPNGRBUtLRJihjjxoow
         k7E56f/Aedq235clYVCPqqqAEa7JyXctwII0RmN0CkwApypzgYycoz8fmxH8YTHFuULX
         38A5ccvfJTUmvdXtlVH4O4S94BOALQpSP6lqHd3Uk+HBRUseSIfG6ZxAw6NSPPwYnops
         QlDRSkuDDTukqVwN3KMZqcoYlWUDYL8Cs13DrqArhDD4FCoGFdgacT2wIKKwkyttJuOn
         QVUg==
X-Forwarded-Encrypted: i=1; AL+hErGfkHtUzqlACHb1Rt+x+CqgApXRHqrtkCMNR44slwCFyUIfrPmbCzzljPG3IW3Zc4ghAnGo46HGrizqIBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z95wxll0m+o6HH4egMvdgiiCnDDJuJHGycUg+70iJDa09d3NYtx
	nqEzB8VqfXepq/fMTSb4UY1Fm8jGFu3l++eHkApJMwF9CyYoqC5U7rP4qfNR3armaFTFWsQAyeb
	dY1/0UWr65euX7QtdhtyIMg==
X-Received: from pjvd14.prod.google.com ([2002:a17:90a:d98e:b0:3b0:9569:4e9a])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d87:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3b1b0a3a2f9mr1460229a91.42.1794558520120;
 Fri, 13 Nov 2026 00:28:40 -0800 (PST)
Date: Fri, 13 Nov 2026 08:28:37 +0000
In-Reply-To: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com> <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113082837.4011638-1-jenhaochen@google.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 7:48 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> This sounds reasonable, but my LLM spotted that Clang will run
> `AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
> `rustc` produced. So the profile ends up indexed by Clang's renumbered
> discriminators, and then the build that uses the profile will not find
> a match for some code (depending on inlining decisions), i.e. that
> part of the profile is silently dropped.
>
> It proposes `-mllvm -no-discriminators` in
> `CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
> using the `rustc` ones.
>
> Rong, Han: is that expected?

Hi Miguel,

Nice catch -- I tested this on drivers/android/binder/rust_binder_main.o
(arm64, Clang 22 + rustc 1.91) and confirmed that the duplicate
AddDiscriminatorsPass run is real and that passing
`-mllvm -no-discriminators` to the post-llvm-link $(CC) step improves
profile matching in both stages:

1. Why the second AddDiscriminatorsPass renumbers discriminators:
   In Stage 1, rustc runs AddDiscriminatorsPass on pre-inlining IR and
   then runs its optimization/inlining pipeline before emitting .bc.
   When post-llvm-link $(CC) runs AddDiscriminatorsPass again on the
   already-inlined .m.bc, llvm/lib/Transforms/Utils/AddDiscriminators.cpp
   keys blocks by (filename, line) without checking inlinedAt and
   overwrites existing base discriminators via
   cloneWithBaseDiscriminator(). On rust_binder_main.o, that second pass
   increases non-zero DWARF .debug_line discriminator rows from 6,245 to
   9,313 (+3,068 rows, +49%).

   In the profile-use build, rustc's SampleProfileLoaderPass runs before
   rustc's inliner (against pre-inlining discriminators), while Stage 3
   sees a different post-inlining CFG once Stage 1 has applied the
   profile.

2. Measured round-trip impact (42 sampled functions in
   rust_binder_main.o):
   - Stage 1 (rustc -Zprofile-sample-use): annotated branch_weights
     increase from 454 to 490 (+7.9%) when the profile is generated and
     used with `-mllvm -no-discriminators` in Stage 3.
   - Stage 3 ($(CC) -fprofile-sample-use): SampleProfileLoader record
     coverage increases from 39.3% (2,832 / 7,205) to 54.0%
     (3,707 / 6,860, +14.7 percentage points), and sample coverage
     increases from 42.9% (757.8K / 1,767.6K) to 56.4%
     (989.6K / 1,753.4K, +13.6 percentage points; 969 -> 1,035
     branch_weights). Against a hardware ETM profile, Stage 3 matched
     function entry counts also increase by +33.9%.

3. Side-effect checks:
   - C helpers: rust/helpers/helpers*.bc is compiled separately via
     cmd_rust_helper (without CC_FLAGS_RUST_INLINE_HELPERS), so C
     helpers still get their pre-inlining base discriminators before
     llvm-link.
   - Flow-sensitive discriminators: MIRAddFSDiscriminators in
     llvm/lib/CodeGen/MIRFSDiscriminator.cpp checks
     EnableFSDiscriminator and shouldEmitDebugInfoForProfiling() rather
     than NoDiscriminators, so post-link FS discriminators remain
     enabled.

Rong, Han, Miguel, Nathan: would you prefer adding
`-mllvm -no-discriminators` directly to `CC_FLAGS_RUST_INLINE_HELPERS`
in the top-level Makefile, or appending it in scripts/Makefile.autofdo
under `ifdef CONFIG_RUST_INLINE_HELPERS`? Happy to send v2 once we align
on the preferred spot.

Thanks,
Jenhao
