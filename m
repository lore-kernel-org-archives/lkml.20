Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E639B4A5
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792265261; cv=none; b=nREPTFQg2hzbyhsF2Zc1v19sDC9f0lPqw08IicOiyR5IYcFRiz2GbfvaXCtAxfqUR+QR9JUzys3eo1hG4dxFlOyPDzVFT0r2hTAyUbTgVk1pfyuMGDEecix1uUKYHCIDff+sSKkCxXQVwDQMtTl3mFXqP6vKU6loCespYurrKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792265261; c=relaxed/simple;
	bh=jKwUZxDzBTXv7npOnXS63IWyg9CTCjdONjWlbqCEasU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZT2wgllqO8rhYsVRg5MqE1DhGmVKMClVx6m+LyJpkkcEOvSrWBZ3DR6PNQD/ov2T2P4kxFEe8C70r/XrNo+pEww7eAu7X1kbWPOMfaioJfkHHc1qcbu/sfr09zyHM3PuJ915w2xknEI4ZHxkLkENsJEt8lN/JFj2mf4ldmP0sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ION30B7a; arc=none smtp.client-ip=91.218.175.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ION30B7a"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jKwUZxDzBTXv7npOnXS63IWyg9CTCjdONjWlbqCEasU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792265253; v=1; x=1792870053;
 b=ION30B7aMv87daUgx5DfdzajWEKTAkD6RDg+6E+zveRQSLu5au6Vedl3z5FTuFkneCqPHZaJ
 AE9Z3UzCiw3WtWXp80s8uLoxHfzCr6Le6Tw4EqKJiYwhQWvBLeZlKDuB4zF6fAT0MIWJveWGMAU
 9XcI6HH8COMkLx1YEjCuezV4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 04868edb1c2d1b23;
	Sat, 17 Oct 2026 19:27:33 +0000
X-Mizu-Trace-ID: 04868edb1c2d1b23
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	terrelln@fb.com,
	tglx@kernel.org,
	x86@kernel.org,
	torvalds@linux-foundation.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Sat, 17 Oct 2026 12:27:25 -0700
Message-ID: <20261017192727.2760919-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atCpTMcAALymqADw@thinkstation>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 15 Oct 2026 11:39:10 +0100 Kiryl Shutsemau <kas@kernel.org> wrote:

> On Tue, Oct 13, 2026 at 03:04:42AM -0700, Usama Arif wrote:
> >  SYM_TYPED_FUNC_START(__memcpy)
> > -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> > +	ALTERNATIVE_2 "jmp memcpy_orig", \
> > +		      "cmpq $512, %rdx; jb memcpy_orig", X86_FEATURE_ERMS, \
> > +		      "", X86_FEATURE_FSRM
> 
> This grows the patch site from 2 bytes to 13. On FSRM the replacement is
> empty, and 13 bytes is more than ASM_NOP_MAX, so add_nop() puts an
> unconditional jump here, executed on every memcpy() call on FSRM
> machines. :/
> 

Thanks for the review and catching the FSRM padding jump! You're right,
the 13-byte empty replacement introduces an unconditional jump on every call.

> Maybe it is worth moving the patch site into memcpy_orig()? It already
> has a 32-byte check. Which brings me to the other question:

I tested the 32-byte cutoff on Cooper Lake, which has ERMS without FSRM.
With warmed, aligned buffers, 32-byte copies took 10.906 ns with the
parent and 23.148 ns with the proposal (+112%). The increases at 64, 128 and
256 bytes were about 66%, 65% and 22%. These regressions reproduced across
five process runs and all four tested entry placements.
 
I found 2K to be the spot where REP MOVSB is better. For the entry, I moved
the destination save into the FSRM alternative:

ALTERNATIVE_2 "jmp memcpy_orig", "jmp memcpy_erms", X86_FEATURE_ERMS, \
              "movq %rdi, %rax", X86_FEATURE_FSRM

The ordinary entry then only needs MOV to RCX, REP MOVSB and RET. This gives
FSRM a destination move plus one two-byte NOP, without a padding jump, and
keeps the entry size and scalar layout. A separate memcpy_erms helper checks
2048 and falls back to memcpy_orig below that size. Returns stay in normal
text.

Below is the current state of my patch. What do you think?

From cff8b5af45ec9ed10a6884e9c251f0e58147b40e Mon Sep 17 00:00:00 2001
From: Usama Arif <usama.arif@linux.dev>
Date: Thu, 1 Oct 2026 14:15:12 -0700
Subject: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM

Commit 68674f94ffc9 ("x86: don't use REP_GOOD or ERMS for small
memory copies") stopped selecting REP MOVSB from ERMS alone because it
is not suitable for short copies. Consequently, ordinary out-of-line
__memcpy() calls on CPUs with ERMS but without FSRM such as Cooper Lakes
and Skylakes use memcpy_orig() for every length. Its main loop copies
32 bytes per iteration and can be slower than REP MOVSB for large copies,
as measured below on Cooper Lake.

This matters for btrfs zstd decompression. The btrfs-tree commit
e27a6e4823f3 ("btrfs: zstd: avoid a copy in zstd_decompress_bio()")
removes btrfs' copy from a scratch buffer into the page cache by letting
zstd write there directly. It does not remove the copies inside
streaming zstd. ZSTD_decompressStream() still uses memcpy() to flush
decompressed data from its internal output buffer to the supplied page
(zdss_flush), and to stage compressed input when the next block crosses
an input folio supplied by btrfs (zdss_load). In Meta's fleet profile
of x86 kernels, these two btrfs/zstd call sites accounted for about 34%
of the sampled profile weight attributed to memcpy_orig().

On CPUs without FSRM, select REP MOVSB for copies of 2048 bytes and above
when ERMS is present. Keep memcpy_orig() below 2048 bytes. The later FSRM
alternative continues to select REP MOVSB for all sizes, including when
ERMS is not exposed. Copies below 2048 bytes were showing regression
with REP MOVSB as seen below (medians from five runs):

  bytes          orig    REP MOVSB   increase
     32       10.9 ns      23.1 ns     112.3%
     64       13.9 ns      23.1 ns      66.3%
    128       17.5 ns      28.9 ns      65.2%
    256       26.0 ns      31.7 ns      22.1%

Dispatch ERMS through a separate helper and put the destination save in
the FSRM replacement. This keeps the entry alternative at five bytes and
preserves memcpy_orig()'s instructions and placement. FSRM executes the
destination move and one two-byte NOP before its direct REP MOVSB path.

Userspace replicas of the original and patched entry paths were run on
a turbo-disabled Xeon Platinum 8321HC (Cooper Lake, ERMS without FSRM),
at 1.4 GHz. Results below are median times per call from five process
runs of aligned 4 KiB copies at entry offset zero. The replicas use
plain RET; these are assembly microbenchmark results.

Here "warmed" means repeatedly using both buffers. The other rows flush
every cache line intersecting the source or destination before timing.

                                    orig    patched  reduction
  warmed                        371.6 ns   123.4 ns      66.8%
  source flushed                706.5 ns   400.8 ns      43.3%
  destination flushed           457.7 ns   350.0 ns      23.5%

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/lib/memcpy_64.S | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 12a23fa7c44c5..6b3e203b6087c 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -31,9 +31,10 @@
  * which the compiler could/should do much better anyway.
  */
 SYM_TYPED_FUNC_START(__memcpy)
-	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
+	/* The FSRM destination move shares the space used by the ERMS jump. */
+	ALTERNATIVE_2 "jmp memcpy_orig", "jmp memcpy_erms", X86_FEATURE_ERMS, \
+		      "movq %rdi, %rax", X86_FEATURE_FSRM
 
-	movq %rdi, %rax
 	movq %rdx, %rcx
 	rep movsb
 	RET
@@ -171,3 +172,11 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
 	RET
 SYM_FUNC_END(memcpy_orig)
 
+SYM_FUNC_START_LOCAL(memcpy_erms)
+	cmpq $2048, %rdx
+	jb memcpy_orig
+	movq %rdi, %rax
+	movq %rdx, %rcx
+	rep movsb
+	RET
+SYM_FUNC_END(memcpy_erms)
-- 
2.53.0-Meta


> 
> Why 512? memmove() uses REP MOVSB from 32 bytes on ERMS. Can we do the
> same here? Then we don't need a new branch at all.
> 
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -50,6 +50,8 @@
>  	cmpq $0x20, %rdx
>  	jb .Lhandle_tail
>  
> +	ALTERNATIVE "", __stringify(movq %rdx, %rcx; rep movsb; RET), X86_FEATURE_ERMS
> +
>  	/*
>  	 * We check whether memory false dependence could occur,
>  	 * then jump to corresponding copy mode.
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov
> 
