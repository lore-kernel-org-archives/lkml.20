Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311151;
	b=oXNdNS02dUSv7r92ZF4ggqF/GVfbWW+Rc2B6qDQuGAE6S3OcU/+040unuidZHYtwO1XO
	 EpXPZLxP3JKNwDLluGweR2Gou+KkC82O6KA/JTJ1fN684hkZTBs4xIRNfe2zmZ7B+XzyQ
	 XMVIkel+ZCIuo6VCPJ6v8X24euebCqVCHZUF08Mapq2lnhTXItcV6NJHxbKzSBoymudtV
	 vAq3Aorvuk8UPOg44oe4LFA6Ea/p5x/hy4ZCRpjvw2h/bTGRVKijo9OpIaOO3QLVy+a1K
	 R/uqEyY6xn0s43Ula+VZNpYUnM3qLqEz1IjpDUKnlySEMolwwX+5j9wmmdiOyN+F1qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
	b=hnFrjPm6TH3nn2z+KkYT3DSdAZBClch8lKNk9XazoV16jyvVWpUyzWMHs2tlefJaXxIa
	 fki2zXNm0A2Qxu+eno7CQGt9lmXstGshnLLfmJ4wjW5NniRBTrFA0FoI+lCHJFtHideJW
	 tqnAxHLxd6i0eZB/1XLOiopuCXgL7rl3mGDfC+teE/PyB+S7Ib3WwKexy8TuTgL7XiPEp
	 CoxrK3qhGld1S99ZqgVEyTeZQmjaosbbU6gSS3grp3+/H3rzZHilLEkftoMnGthg8LuGK
	 lGUxGsjIdmRVrQFCvw5Jr46pkKkZYDuJgdBIu4/dQkn4Mb2ikEnd9knKyyntMW/MY3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CXE++N5d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50CCA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CXE++N5d
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a54bba0442so7705e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311150; cv=none;
        d=google.com; s=arc-20260327;
        b=ds3IP7cWpxcdegzHrSN4Ix9KjKjYIUgUgWzo/hP+gZ8qlF53JTQhLCrpp+L/lA3fSA
         6FHjjcTsWnADZ+XA6AsZT3tGq2QuN8Omed2XspNgjpsy0o1FF7XyVvehtTmZWe83n8Xm
         ZI+ZCoHAdzyB0EtbTg/fVOPymryC6T6V4fiep0l+pdhExV92YjL1M58rH1k9+I/9zYck
         cKohZz+pA+8ReffWfDBlqAmQhNXKd0cF+oUoxrSoa4xcV7EwQGHyzc2MLxCStjHsq3uE
         OgIrqj+/yvDXg8VnkmdJ3pwFgbwsWYSseC0RYs0V/6fOtSMYpxS5EmNGTghJl2lYQ0Yy
         HqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
        fh=RgIfkNNAchTPCqiI0gxCSRX2l8nru7TbyVl5nMeJlAo=;
        b=CFq0emAZLUedBO1XAoRHg+fnsYrSgyPAUCrl2vNbJrCVi1fSmkfWc2uDsrUzwzJuol
         KWczb8t8Ps0iEsdz4l9BjgBZqcoeEP8soY7nYj4Mni0ZgA3SVU4Lcm/Gb+D6SqisuiAv
         3R3bED41ieaRV1VFlSPm2DUYViiKUu4EpznNu+hCc1AvqwxY18MloqUiioLL0rgcLlJO
         xSczxNli7VdnrdWG2IwF6lv+VkVIwVkg7EQCKaLdHSv2aWxPDuJky3CkfW5IC2lm5s+f
         Bhjg9CoRmvbc05BSWMPeGBdJyYZ8O9ej9dygX3A51WRGrOhEh+EFZ4lMRINoBohPKcj+
         Y44w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793311150; x=1793915950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
        b=CXE++N5dmB5IkjGlxZH28gvFCgXnsc2wrfnP5g6TtCM+sSlbwflisl0R1KLXrUnOKS
         Ek3rbBE5w2zml77efBruyGCAt6HbvlKgxrYbB50rITUBf2xJK27r5d3N63AUEoW7o8Bd
         UXyRMMLOQKImOAV3gkeB/wxDTy2THktDT6MvhfJEeFDtNy5QPzoRlX2efjLsM/dFBXJ8
         /yLJFCaZNVaBzM7KAWLwVt9vg/09he712OjVvnwAFjgkpJLA1qFb31g41pzV+YA2mD9W
         uoFCbzGcga040rzzCpMd6UObaPwww4loMtBHFsY98Titg1RuF7k5rwYfAFKXNx8Q4IgU
         sRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311150; x=1793915950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
        b=F7g3WDoB9eM4EE3QmlqnGVBO9tXRjwv6L4o3lddDw+AVlnz4WBVD/M7SAiRIrsNIBB
         tf6lladR54VXfZK51dSOdK4pnuAOrDUU1Vzf9NjVdh88rYtG2wDGdqqS/xrkeRvAjxVg
         ccvWI5KpLNPqilr5zJm2W+UE6Kqqt8jogKuIdz8iN8HmxiZZ16Zwb6yd+aPbkozFykiJ
         lD65Qnmf/EnL5RxdbT/QVrhzbnhJxLvIJsBEV75AModIA8huzyf30d+2bMNZz+V4/dZ1
         H641dXKq88Iv+SncmVqESeoBrEkhWjtX3Z5KSVT1Vgdg5HVNFeMx1yu2S80BLAe7zqCv
         CQwA==
X-Forwarded-Encrypted: i=1; AKwUvBzy1YAbMKwYNUq8rZYMYiFRn9qu1bAFcA3oU+daOfgJcVwX6L2gNsIugvc8Utj1g/6l0dEd6FQn/3gaCsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6CXZ3+QDXLCpNiNF+ZsgFRPTQEmFWud2AzNqpEEtLTkZXKcNQ
	vCTL9L9Ty4Tn0p9Sg8xATCAxw8zmReNf3GaA0li10ZSbUkNpwCr+Gh0pY08TslnG1YpkV+D39b2
	sDfipbsMdWox4WM1msNMmFGblHp70iEvG2kKsvdDE
X-Gm-Gg: AYBFou1qsU8B4EMokC3qoV1nZKehcM7dV3AmAjyYU0YkEt44ZId+DIKFcsgWn/fr3+a
	CxQSOGZ8B2zopFiQ6lgMmHeizcKKGXAIJfQXtHgRYyNaQfk5Mo0AXfR/bWx6wrtzXMGryAryUj9
	dSJb39F24QcNycA+nS2XSJuyWSECbFrrIFvVE70Ky/vkmrbCO83LORHtABlUmmmjvGRaEFnFqVQ
	j3QhLsBi3vKQv115wpLU3Oo12oBZfeziKVGq+Swq4EkVYhfFtVvwWgHZRm+M4fQnkQ1XMvt+gBo
	GtD9ssZVkjh3nLH074nyee5LDNgG/zVrXkuxNPg9fjru69WY+h8bdXWsZ5Cv0bHoA7RJn351lAo
	hD4iJWpgGqH4ixq3SyBApVJXPizYLUO1psA==
X-Received: by 2002:a05:600c:6098:b0:4a1:e7d5:5132 with SMTP id
 5b1f17b1804b1-4abf6e63ee7mr351585e9.3.1793311149227; Thu, 29 Oct 2026
 14:59:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 29 Oct 2026 14:58:31 -0700
X-Gm-Features: AclHuK8ASG46JARQbXb1REUMHY0OEjL5EAbmE_577-jrD-4XvLvRMqXYq4UuuIM
Message-ID: <CABCJKufu04HxOurNGyg2uHAeDVyTNQZwBeb4Nw95LL8L1AUFKg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] arm64: ftrace: support CALL_OPS on kernels built
 with kCFI
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Puranjay Mohan <puranjay@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Ben Cressey <ben@cressey.dev>, 
	Florent Revest <florent.revest@linux.dev>, Bill Wendling <morbo@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jose,

On Thu, Oct 29, 2026 at 9:53=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> CALL_OPS and kCFI have been mutually exclusive on arm64 since commit
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
> kCFI checks the type hash at a fixed offset before the entry point, so
> every function needs the same number of prefix NOPs. Before clang 21 the
> compiler could not emit prefix NOPs without also adding the function to
> ftrace's table. Since commit 9315e22b0c0a ("arm64: ftrace: allow
> DIRECT_CALLS without CALL_OPS") a kCFI kernel can attach BPF
> trampolines. A trampoline out of BL range is reached through
> ftrace_caller. That path costs ~10 ns more per call than on a CALL_OPS
> kernel, plus ~4 ns for every extra ftrace_ops registered. Clang 21 takes
> a section name as a third argument of -fpatchable-function-entry [1].
> This series uses it to give every function three prefix NOPs while
> keeping untraced functions out of ftrace's table, and enables CALL_OPS
> under kCFI. The per-call cost drops by ~10 ns and stops growing with the
> number of ftrace_ops registered.

Thanks for implementing this! For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
