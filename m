Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799392;
	b=15Ftmu/laKUTOA/Vq5kknAyCiXLORhyMtyABb/yfKI4LMKjoRuEVaYlLtGz0Jxq0Ixy3
	 fuSUELMrv7IMMpy7tV1nB5IQSj2fApcwPR7EcflxjjWI0G3JigFYadOIm9mtbPbS54dy5
	 dqvUUYy8KffCWzab0HmAZfti+dAa0n0E0VrpcELAPz5wHBLG0P4nAaZ6oPHfIIWGmhxEa
	 eSdIAz9GC7UmLL1SwycS9wyG0DEmud1IAaTmfXhmU4CQaogCzqdx1OvPyNRZrRQ0XodmZ
	 2PRmIPlV4JAQEOGsbHNnVJshT/+iaHPy+ISMJxlja6R/0LOBhG14UtJGnfCuyNdrJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=sqYPU2TH4ZpVQU5dx6i0fuxfEm+4/xI1XBznqOgTzQY=;
	b=aKWjvRqslR0UGhXbmVU8cPS7dn0JRIOAKijTV3kFZ0eV8htUFfp//cAgfYp/GkUnkWHf
	 yOsNyQiUhokIXorWXiuHi6AXw/PxaGV4fJHIo2Iw1CMZ/Ajcibvis15FEKDzyOYahaBHh
	 8DoCCdvZlQQOsa9ObyF1SqQObnUaHiu9N/YnfPRsSeY6F+4y08zv5tczM5xV5Phf4pAOD
	 pHwoZifLTDeo2YWt1YwosIGpH0w1Cv4ibUR81ndRMJLVoKUytAmJVMAqyzUYCoBU+CqF2
	 qJP8eMz/KtPLPkF6hlYJeLOfOx6WLfaRnmewNvC8FcKVw/2Fb1yrA8GgZnlm0mpW+ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AcGO8PAf;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2C606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA2C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AcGO8PAf
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so6873035ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793799392; x=1794404192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqYPU2TH4ZpVQU5dx6i0fuxfEm+4/xI1XBznqOgTzQY=;
        b=AcGO8PAf9SmeyNVCu7zsVFbrJUOQF9rKiDfOKLWeHjHPhurUweVemaXtKYFxc6/st4
         xX75K7ymGyCAW4Z14nQUgHyMAEZLZJzdUdE0O32LQOhfA2xW0wqs4y4Qamzu4jsn7tjS
         8CgnE6sg/uNnvtLWBUKxrXRWcbNzAjNxNYuSsUsaHJzLHlthF4OExcw6y6WoqyuZ72g3
         NsEIgI0NtPb9LX9sdjwQNQaEMSpXzo1Yq8ILottgNafLSl8pUvOLp15WZ3ArVN9Q1mAE
         jKi6NfZBSgOPAuQZxx0Cv4S2O5RVDsa3BER/3diaVRbJeMebcEgv/emPvElXduY8BLsa
         STyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799392; x=1794404192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqYPU2TH4ZpVQU5dx6i0fuxfEm+4/xI1XBznqOgTzQY=;
        b=KRrpDP7qzGXqpngZosnRmS1ebUa9Lcmajn/Zih7JuIEZ4yWt7JoFNUOYdVYwTtMylj
         i7sPYNqbH17LOAfPZeRyRIQVIZonJZGaWeQfK0UaG1wZeAGXH8Jh0fGq0bz4iK5jYCOB
         Q8FKl6BCFexmxVKSairmOXvPjCf1DsNkJW3ZcwOFdmYDZ1oI3pHOl0D1PyCOocfGHgmK
         lXmMCd5bTSAJRPPn874awLM8MIdquo8tPsbhWPVTHOEAiGXk1hv8jUdrSvVgJsuhzKAc
         FJGy3FPEhEJNe63BhL6H31nzb8e1p8SPe7cm6CUybACeGsudwmkTAfighk8riKlD179Y
         ugyg==
X-Gm-Message-State: APuU4Z+rv2pySo+Ss1hadadaHhvcn/blJdJj1jJys3/nSqVVKA9YMcjO
	l2749FgTYW9FiAKef8AX2PI0cKggBJrsbF0QyA+EMhOel+tSObJtbrLiIVuQfeS/7+9dB5TPy4d
	jEgkscg==
X-Received: from plhc12.prod.google.com ([2002:a17:903:234c:b0:2e5:a015:564e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:7d8a:b0:2ed:146c:cbb7
 with SMTP id d9443c01a7336-2ed146df644mr5080405ad.16.1793799391397; Wed, 04
 Nov 2026 05:36:31 -0800 (PST)
Date: Wed, 4 Nov 2026 05:36:29 -0800
In-Reply-To: <20261103015238.3780910-11-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103015238.3780910-1-sashal@kernel.org> <20261103015238.3780910-11-sashal@kernel.org>
Message-ID: <aus03eVALC1m86Aa@google.com>
Subject: Re: [PATCH v2 10/20] x86/sev: Use non-instrumented bitops in the GHCB accessors
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Chuck Wolber <chuck@wolber.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, kvm@vger.kernel.org, 
	Marco Elver <elver@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 02, 2026, Sasha Levin wrote:
> The GHCB accessors are used from noinstr code, such as
> __sev_es_nmi_complete(), but use test_bit() and __set_bit(), which
> call the KASAN and KCSAN checks. arch/x86/coco/sev/Makefile disables
> KASAN and KCSAN for noinstr.o, which turns those checks into empty
> stubs, but they still have to be inlined. Instrumentation such as gcov
> can prevent that and leave calls to kasan_check_write() behind in
> noinstr code.
> 
> Use the arch_ bitops, which aren't instrumented, as is done elsewhere
> for noinstr code.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
