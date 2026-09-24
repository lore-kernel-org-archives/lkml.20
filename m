Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E164223336
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253417; cv=none; b=nBBQkm+b0CQORxNpMeCT016wPGhvk8R0gXjteRo7SFTz7Ny/+lvTtiXM+bx2lnjAkgSEi/txb3WKqoIGV42qP1iVMbVYhcqlcg2dau49iIIgfDO3d6AnyLNXVB086WazxfRduUQxLvx3OapxbpYnrSCq7mJ5TxTl7fReL3f9Cwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253417; c=relaxed/simple;
	bh=CLLX1WGSyy5uutnydf7E+boNfhnOuNdZ5bWoEr7Diic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSqJeLXEcGIhd8PdWbIjK1uZhfOSj1u6SCmHrnPt2S8Gz5BsJxTLrjWN7Bq/XA2CCCLi7uzpnMuOY0COxcXibXYv2Vo4BDRQe0Dvrvmgom5HWiH5zdUeMHXElt61Zyw7CE9JqQ5VHxEU1bx9Vcvji3wgLdJJbENAbmiMHSpBmx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PM2KQyXd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PM2KQyXd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so13604755e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790253413; x=1790858213; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gAR7nTOPxRo/mfR2u3OdcokbjHynlMhWcl3pdNDsUgo=;
        b=PM2KQyXdNyMkZKSZ5df0/DRIQ1EX3ZgXrFINpng5lwi2SbPcINWs2eAUIMzZbNn5M+
         9H6rqGUSAaWzXqKymsrVIVxFqTkuejCq8u4KBUzbr3XXgiGM9Z6wedvpMpzOo37nyPkR
         4O72dC48+6gCqlPHRmKxlINMy+oCF5WwoYi65n1YuYxn3S522XH7kVbv1LojNjcYDs53
         tMOSVNRs7jWduQyB7EypqqSriNHj5D+E1WeI8HzacBkkXwV8LaLoM0cS3l8Kxtk2T9s5
         XXiDmCgUCgMnWrdwa2Issfd+okN20nMNnNmejF1Y5eHL9tBrOTIIcu7f/mu40Zlkl51h
         8ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253413; x=1790858213;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAR7nTOPxRo/mfR2u3OdcokbjHynlMhWcl3pdNDsUgo=;
        b=P2L49s1z/2YpFU01aQNkhl9+uzTlMKq8O4+mUM95oNQVQE4BVVn+ypseqiGmjwfxwf
         Ba33lgTbKXEd7vAlBRMkrl9BgFo6TDd3SRfqEhCwAJmPZGIv5FgtdQXTQyRp+T/Lhshq
         j0rZIP3ZoSgqnrtVT9iWh0nKKrU9uTCwiiHXKw00KACJ48SaIMKpkiWzsfoIoei8MHHf
         ZWdUCtweml63e4et6vdbChWQcdzeOEAuE4mthM+CsTKc4BPnAzHTx1haLyiTn6l5M100
         OjbxPe2oIMckzypE99SaVAQcX64FWivaThNMYL47MFz2ro9zYC/7+0VJrrS+6U/eJTpI
         Wp1w==
X-Forwarded-Encrypted: i=1; AKwUvBz2mF9giEcE01n4WXtflITJE+KVGQF0XCLJx9+A28oW9qxD2MQiofnZ3FXUIOoMqdREnOrNAdjFUg5D1uw=@vger.kernel.org
X-Gm-Message-State: AFuF++mADX5PaRRQET3PMOMYaf+dz5rSVAE7k6YYRMbAPEx4wLAXgs70
	OD4qecs1LJtcwE+nqEf5Cx0aqa4NhIzUzhcwjcod0VIkiGm2QbojRov6F739gtK3LQ==
X-Gm-Gg: AYBFou3I+M5z5ZyilbAgKwy4vLnV5l+qcpX3fB9oH7Xf1/4s77I/sIh4RggWzTuUcuj
	69zhJBddXmtYhXPvsT4mMZ2Wl9buex1UOT6DrhNdQ7fY75RgMtTXJPNNvfj4BCTTXPhAF5JHoOY
	bbJVWUcdtSnGNWFOeVebo1/niGvkeFOm8T7j/8Ab1Hqoz/pK/PiJ2GrqdA1sJG9Vb5Es3W9cpT9
	cbsylnx5IUhZ2NanY7Jg/Of1SQR1MJM/jOGqMtF3kgrRrOtuog+c3kSkhUgV7tCgJnFzbbH5oMy
	v/yHTimjahM4mQrkyoLnM1xwCr0Dw9BZAkA4nVaAnlqj8FNCcXnF6SWewDm5Nh1ZKICrinlHbsv
	4BGiRbfHngXTAtkvbu8e3idvQnEh9arc6wGN8oHh2CQIaiX91E4D8+61R6jVDFMara5z5M0UV5E
	JYQkWe312REgpPrGGp/N+53C4zyzYGGwetaSTTO4ksgfNp1boEl1Uf3RTpE/RaJpUJqwLRb8Bpk
	Q+0WMeHDDH7pUDesCyIXRWlsvP9HrZdZNTvoAWS1A==
X-Received: by 2002:a05:600c:3514:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fe6701e7emr38631215e9.35.1790253412640;
        Thu, 24 Sep 2026 05:36:52 -0700 (PDT)
Received: from elver.google.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4cc01sm56905385e9.3.2026.09.24.05.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:36:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:36:40 +0000
From: Marco Elver <elver@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Bill Wendling <morbo@google.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
	Justin Stitt <justinstitt@google.com>,
	KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-hardening@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Subject: Re: csky ICe (was: Re: [PATCH v4 2/3] slab: improve
 KMALLOC_PARTITION_RANDOM randomness)
Message-ID: <arUZWKjKr5I5tlOj@elver.google.com>
References: <20260511200136.3201646-1-elver@google.com>
 <20260511200136.3201646-2-elver@google.com>
 <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6106aefa-47c7-4bda-a51f-8a2fba3bf715@roeck-us.net>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 22, 2026 at 07:58AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> > 
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> > 
> > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > the address of a local label, which is considered broken by both GCC [1]
> > and Clang [2] because label addresses are only expected to be used with
> > computed gotos. While the generic version more or less works today, it
> > is known to be brittle. For example, Clang -O2 always returns 1 when
> > this function is inlined:
> > 
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> > 
> > To provide a reliable unique identifier without breaking architectures
> > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > to _THIS_IP_ where architectures provide a safe implementation, and
> > falls back to a zero-cost static marker where _THIS_IP_ is broken.
> > 
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> > Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> > Signed-off-by: Marco Elver <elver@google.com>
> 
> With this patch in the tree, I get ICE erors when trying to build
> csky:allmodconfig.
> 
> Example:
> 
> Error log:
> sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
> sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
>  1202 | }
>       | ^
> (insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
>         (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
>             (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182])
>                     (const_int 132 [0x84]))))) "include/linux/slab.h":759:52 288 {cskyv2_xorsi3}
>      (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
>         (nil)))
> during RTL pass: final
> sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan_insn_1, at final.cc:2813
> 0x779b51e2a1c9 __libc_start_call_main
> 	../sysdeps/nptl/libc_start_call_main.h:58
> 0x779b51e2a28a __libc_start_main_impl
> 	../csu/libc-start.c:360
> 
> This happens with lots of files, not just this one. It is seen with all
> versions of gcc starting with at least v13.x. Reverting this patch fixes
> the problem. Bisect log is attached for reference.
> 
> Any idea what I could do to avoid the problem other than stopping to build
> csky:allmodconfig ?

No idea what gcc is falling over here, but the below patch could be a
workaround/fix. Does that work better?

------ >8 ------

From: Marco Elver <elver@google.com>
Date: Fri, 8 May 2026 14:51:45 +0200
Subject: [PATCH] csky: Implement _THIS_IP_ using inline asm

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

        #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version. Additionally, avoiding taking the address of a label prevents
compilers from emitting spurious indirect branch targets (e.g. ENDBR or
BTI) under control-flow integrity schemes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/csky/include/asm/linkage.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/csky/include/asm/linkage.h

diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/linkage.h
new file mode 100644
index 000000000000..04afd3583e25
--- /dev/null
+++ b/arch/csky/include/asm/linkage.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_CSKY_LINKAGE_H
+#define __ASM_CSKY_LINKAGE_H
+
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=r" (__ip)); __ip; })
+
+#endif /* __ASM_CSKY_LINKAGE_H */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

