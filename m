Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756498;
	b=J4NQFZmCJ68q394pt6XXUyn4n2ACI8lVGLNYRUkm0tDOJaxj9QXB6YdAGHSNtfqFKTKK
	 kmGGLKlx4Le7rwcq/Uuz3UqnAGcDAmK4v+wy+MnAPcMsPRZkTHvanrd2tVmeLZIXKBKgA
	 jBUWPzGybbHt51NQtPwKR9wuJjHzLGu+Nifv1/FMTCIb74kyN0EZffiy32VV873+sX0bN
	 F42LpCwKE7Xdayk9RT9++uvwNas0AJPGAHyP0Lv8EdliKOZIoLGipsWYszzaGnuksU75p
	 N3iBXhug9KZHO7tIX687ZptNTA+RKUc1aS8ZNqgsShiHsmqpl7BxJp+LGhHcrbKBVbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756498;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nrEpzo2FbyYGf4WoydGR8O8NAthTAxRR3fiKImw2LBY=;
	b=MEudNlKSEYHaTgMBbVZESgpknaRKnN8smMTla0MWSaFewiKvCTzcbzs1cB/nJE+Ee1My
	 zyCoQfZ6rUjq4LAOZWGVZYFqewFKAjUCuDqdQeSUAXWThse0U6Oo+ysakqpHksBZLatul
	 oSoz8vvV9Kznwh7nK/m9avT9P2vRvpuQR89wb75FEZz4mc3Xa0+kPRjElvx+zGE13WLRz
	 3W1c4eoXAMQUcWfrc9EszW44VdSGgQDLgkE4S2my8Z0k6WEkg02SuSmkBKks0KBEPlNQD
	 Fp6AlgY1sXV/vqodWAMiz8uYp1ZJhYz3dHb/xs3bDfPL+yrHLJpDTm9ZLtQR+DoiF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2KAliKC;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFCB606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFCB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2KAliKC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793756498; x=1825292498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vDr2JILrP7CXpfLgY8bKxkAuyrvod5DOQU34EM2moew=;
  b=c2KAliKC7pExndXfYaCKkJIJPiMYnKFyeJN/Y5wtwPxWO/stcOJiix58
   PbzD4IUAvZCM/DgFjE8PqbYNvuBD1YTJ7Rg2bwhwVY5Vq4sN3fi8QdOzV
   4AoHvYSxWwyASzX2IkQaWISfug3KK85T+9/MXwA+eus9VjkXDespwGsU+
   ozpLYYsUSnsO/Jf0TzRVBeWdR7u1XeRCExGA+mnY3ttQJBCKv5him0+0Y
   KB2DRm0OEejZfaj1ZdeE+tm7aXdwd9Us0bb6Vy8GeXwDKya0xDl20C0At
   wjeUNrojb97FR/9HGwBU8GSKx/H8tRVbrMAuiqJsZ7s1Ej8d1g/K+9UHW
   Q==;
X-CSE-ConnectionGUID: t/h1vc8nSAyNcCyqq461gA==
X-CSE-MsgGUID: D3acwIt9RiSrjAH+vBa5Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2509025"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2509025"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:41:37 -0800
X-CSE-ConnectionGUID: nOdDaauHReGtVTXCAtE9IA==
X-CSE-MsgGUID: z881yAwyRF2NYDW1Ta5Bng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6912924"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:41:37 -0800
Date: Tue, 3 Nov 2026 17:41:35 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Youling Tang <youling.tang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
Message-ID: <auqNT3yNeA1ujmW3@tassilo>
References: <20261103060658.696994-1-martin.ankerl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103060658.696994-1-martin.ankerl@gmail.com>

> +#ifdef CONFIG_X86_64
> +/*
> + * Every x86-64 CPU has prefetcht0. Not __builtin_prefetch(): the kernel
> + * builds with -mno-sse, and clang then drops the builtin without a warning.
> + */
> +static inline void prefetch(const void *x)
> +{
> +	asm("prefetcht0 %0" : : "m" (*(const char *)x));
> +}
> +#else

One thing you should check if the inline assembly pessimizes the code on
gcc. Normally builtins can be better optimized. Or keep using the builtin
on gcc to be safe.

-Andi
