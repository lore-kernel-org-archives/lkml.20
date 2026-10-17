Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9F39A7F6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273362; cv=none; b=SKRYcxrauB0hmsdvxQGOffHDPpoQsS7m8H9+p61vY8J468+U1RaCbKU80FBzCdizBxd5IWTz2Pu/zf8QWKhEDF17qXoAWYPQ47UXmmUaV1g6WD2vz+7s/gFcIpELYXX4XcN0FfMjHyso+JZSm+bp7vS54xhc/OhpD48W/qVaGSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273362; c=relaxed/simple;
	bh=B2mOTfHypE9+t6ZvySF67KzWRgvdQ87X2gU/7XD5CxM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SoaTeRBn4QsbDZmUsMsTfohfdzZNAmfoGpSrT8adTi9q094ZUESBVxo0EvI2ZhA425AdmboKTbIyUwIIoLud2C+A0yj4DElLu32dWRS8OMPNUqyFRI3ErZvil88ZlqYZxa9AwEpaiU116FxojIMcWcjmukrra51Ju+v7Il1Ya70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S95J/I4b; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S95J/I4b"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso507935e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792273359; x=1792878159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgMVP/uKFITmAr0H4FDlGcG+o9Cg6xh290cXoaYsLxo=;
        b=S95J/I4bJOHiaSCPnRzcHj0u52xukpbQ9VQyAHzS7wdusO3S798CVnWZrh5kPYSUpN
         UKe2/Xp3zv1xASAv6PVqfJixRd3jmIphx1M9KjBwdwnF9m4uiTQiWLyM4GbZhy5YGX+i
         OOaoOimhmaiEE8DLhgt90mFwvIDQFTjWGhCFO2+X7TfsV9f1HG86XatKQEBTEWUN8ayl
         +ObuBDOa5gKCbmacysAVcIBGTWdb47cTS4v24oeII7VM0hS0QZfOuaQhZLvGxAj1zG+J
         fqn4qQeCTlSJxqp2dvy6dIQwOMIKo6S/6gebviFwutHSRFZLRI5RAVBIiXgbTB8EVa3F
         ZgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273359; x=1792878159;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgMVP/uKFITmAr0H4FDlGcG+o9Cg6xh290cXoaYsLxo=;
        b=LMQ3NLPnS6jUFVi7cI6XPQ35no6gdJqm+UQ7115SGh/Vw7ku7YjxQUcHmSMYmgXpr4
         e5METBFVDbrBZkpZtn6nbUT3GiLs7phse3HqH7kh3VyyiK44ptHQxl8t78ZGs6KQHUJc
         t0Pa0xybjv/E+h7luaaxVmlMZK3Cj3f40c3dcWWwVNt0OT26Ey9LJaiaTH7qLiM1/1L5
         cAhR2Sv8O1GhS5uvV9APachD6kUkboUzHFCy4LBdisyzNAvmcNT11XCMQkY0wvE+ftQr
         45XK8+MLmUQvCGDoK8fu6rfe4b6BAw5M803r+pwGC9EaQcju8qY30cZ3c+PqHNdJnXea
         GYNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlAKr5W8FtMbTdtCHYXR25lEeLvngKgcfbHhEsJ77E8e6YAxp6oPTomdylPOh6bWRvDq4iIvWYSGMwORU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE6OjKkuSDc0ZQk19TRuLVJTX7tZBq3fVWYuwSFg+Y/M2SiTI5
	20xSA0SuerE/aQd1gqfQz8yr42Oh9AcuCYSbZivsA33jPH7aZQaCfJ6c
X-Gm-Gg: AYBFou1ghBBZEYK5RWSSh3cr8VW9tEZG0kDY8ouUjJ4l1e97imJSt8EufdcXpOHS/fR
	aTSAfmaEUBOaNw8oEKr4x580v50pZqKtSPEUDCsiWTSJ9KKMctpbMvm/4I3ZGzbpNOgGb2naRro
	d8ZoBQuW3lO+sqxhb8oFNVTKjxpM/S53aYadR7JhDt/MAjVhHizUV4P2QiTYE8oc0pD3DugspTC
	X9A0GLn7BExlS11qkXywKClgcXV3G1adew02I5O5180HZhNKtOOfT0ek5fxa+1oGUFbPA3l9S/5
	BmbuTO3EVU/XopXO87B+pnnaix5ptr9MoH0lb+VqBiQQj0+Z7+A5kBt9/LtefNLnlVNWZViJkKV
	2ulgKejzkQPQ2OwUxP94YoHfZBhDEqUo4Kqrdy8b7CTp0eK/tdxEL/BuWxocRfvYbmDM8KtN3yF
	aVUKTsD8F8emJdzYMqglMg1xCA4aKvqKceG8TlM2t7AOh3IBljA1mmwRIhuA5uA7Y/Sv3h3hHLH
	LGxcV31OAKBNGeFNppcgfK1jMqe/OgldUg=
X-Received: by 2002:a05:600c:6298:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a1d75ce285mr68935245e9.3.1792273358933;
        Sat, 17 Oct 2026 14:42:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7889sm13310666f8f.24.2026.10.17.14.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 14:42:38 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:42:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
Message-ID: <20261017224236.5af552a6@pumpkin>
In-Reply-To: <20261013100442.2658311-1-usama.arif@linux.dev>
References: <20261013100442.2658311-1-usama.arif@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 03:04:42 -0700
Usama Arif <usama.arif@linux.dev> wrote:

> Commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
> memory copies") stopped selecting REP MOVSB from ERMS alone because it
> is not suitable for short copies. Consequently, ordinary out-of-line
> __memcpy() calls on CPUs with ERMS but without FSRM use memcpy_orig()
> for every length. Its main loop copies 32 bytes per iteration and can be
> slower than REP MOVSB for large copies, as measured below on Cooper Lake.

But pretty much all the memcpy() in the kernel are small.
You are adding a conditional branch to all to of them.

If you have somewhere doing long copies then the code should probably
be calling a different function.

You also need to test on a variety of cpu, especially including older zen.
IIRC some of those don't behave as the cpu features might indicate.

Intel cpu going back to ivy bridge (and maybe sandy bridge) treat 'rep movsb'
and 'rep movsq' exactly the same, the only alignment that ever matter is
64 byte alignment (possibly less on ivy/sandy bridge) of the destination
buffer - the copies run twice as fast if 64 byte aligned.
After the initial overhead (which my tests didn't measure) the bytes/clock
was moderately constant across all buffer sizes.
Amd cpu are different, even zen-5 has a big performance hit if (IIRC)
the page offset of source in less than 128 bytes below that of the
destination (the byte alignment doesn't matter).

I need to redo those measurement having worked out hot to time the
instruction setup costs.

David

> 
> This matters for btrfs zstd decompression. The btrfs-tree commit
> e27a6e4823f3 ("btrfs: zstd: avoid a copy in zstd_decompress_bio()")
> removes btrfs' copy from a scratch buffer into the page cache by letting
> zstd write there directly. It does not remove the copies inside
> streaming zstd. ZSTD_decompressStream() still uses memcpy() to flush
> decompressed data from its internal output buffer to the supplied page
> (zdss_flush), and to stage compressed input when the next block crosses
> an input folio supplied by btrfs (zdss_load). In Meta's fleet profile
> of x86 kernels, these two btrfs/zstd call sites accounted for about 34%
> of the sampled profile weight attributed to memcpy_orig().
> 
> On CPUs without FSRM, select REP MOVSB for copies of 512 bytes and above
> when ERMS is present. Keep memcpy_orig() below 512 bytes. The later FSRM
> alternative continues to select REP MOVSB for all sizes, including when
> ERMS is not exposed.
> 
> Userspace replicas of the original and patched entry paths were run on
> a turbo-disabled Xeon Platinum 8321HC (Cooper Lake), capped at
> 1.401 GHz. Results average two runs and scale the per-call time to
> 65,536 4 KB calls, or 256 MB in aggregate.
> 
> Here "hot" means cache-resident. The rows model zdss_flush() from
> zstd's L2-resident output buffer, zdss_load() from a cold compressed
> folio into zstd's hot input buffer, and a page copy into a cold
> destination.
> 
>                                     orig  REP MOVSB  reduction
>   zdss_flush: L2 -> hot page     28.0 ms   11.9 ms      57.5%
>   zdss_load: cold -> hot buffer  46.1 ms   28.9 ms      37.3%
>   page copy: hot -> cold page    29.8 ms   22.5 ms      24.5%
> 
> REP MOVSB was faster in every tested scenario at 512 bytes and above.
> Copies below 512 bytes showed no consistent performance change across the
> possible function alignments.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
> The above benchmarks to model copies in zstd were created using LLM:
> https://gist.github.com/uarif1/8409ccd34284f128dbea5822ec628ef3
> ---
>  arch/x86/lib/memcpy_64.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> index 12a23fa7c44c5..a7b3ce4fae0b4 100644
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -31,7 +31,9 @@
>   * which the compiler could/should do much better anyway.
>   */
>  SYM_TYPED_FUNC_START(__memcpy)
> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> +	ALTERNATIVE_2 "jmp memcpy_orig", \
> +		      "cmpq $512, %rdx; jb memcpy_orig", X86_FEATURE_ERMS, \
> +		      "", X86_FEATURE_FSRM
>  
>  	movq %rdi, %rax
>  	movq %rdx, %rcx

