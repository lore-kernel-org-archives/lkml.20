Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586DE377AAC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502315; cv=none; b=KS47bJnqIxUKvn0vasVZd2tdl8Jb9QQ1WZveUMQCrLCkSAvwG6L4BkMazAJW5ElQiykQZgk20nkUdMPVQ+Dg2T9zHfzKOPU55o6kNxSIu0CST6+jlNt7wKBvOLbZ5e3zSzMt8/10jG9whKWdC6YH1hMT6XMM8u64mc3IdKSnVD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502315; c=relaxed/simple;
	bh=pY1XQhJJOEcteSkOyW3vQfcMoKas/e3uBPOyzw3CmAE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d6LDaIq6n3F7dSGYgH82Fli+JWR3EuvS/3JhqEi3grEP8LQhGil5KCm+C4O69TUT7GxnMPKxmvw9tdofq9DMHAdZNHB3Os4uxgXFX+zcM5bhbq1saiLugWoFtg6E3dV4MezoRKXoDOBmJMgK2yjYrdoRMKiYSef/xNyWoPjkTZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=NDp/jtIr; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="NDp/jtIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+WZh0bb5NmAt10ymsdHTt1ccdu2nJSsz3CMDIj2iZIg=;
  b=NDp/jtIrIPNffYX+aWUI7eNdgUV53EWNSCmyfjNU8i9mNfSID/S4s30v
   9CpTHEG5urx1TSskxE9HQKf94YlJ3kWvb0MZLou+7Ruh98+e/zeSjHqKB
   mvke7UBLkkR0jXQNJxFIKJ0daYF3opq8xId7HbkaA0nR6XziOexC2pRdW
   g=;
X-CSE-ConnectionGUID: lu/urvJ4RFetAVR7Z3J3XA==
X-CSE-MsgGUID: Dncj5/fgS+COWeoMAM9T3Q==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,126,1787004000"; 
   d="scan'208";a="158108361"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 11:44:00 +0200
Date: Sun, 27 Sep 2026 11:43:59 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ella Ma <alansnape3058@gmail.com>
cc: nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, cocci@inria.fr
Subject: Re: [PATCH v2] coccinelle: free: add a checker for `__cleanup(kfree)`
 usage
In-Reply-To: <20260924162522.912050-1-alansnape3058@gmail.com>
Message-ID: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr>
References: <20260831134336.45540-1-alansnape3058@gmail.com> <20260924162522.912050-1-alansnape3058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 24 Sep 2026, Ella Ma wrote:

> Using __cleanup(kfree) will pass the stack address of the annotated
> local variable to kfree functions. This will lead to invalid
> deallocation issues. Inspired by CVE-2026-45959 and similar bugs
> recently detected.

Thanks for the semantic patch.
I think it would be good for the error reports to be more explicit about
what the issue is, ie the relationship to the presence of absence of
DEFINE_FREE.  Otherwise, it is hard to completely understand the problem
without looking at the comments in the semantic patch.

julia

>
> Signed-off-by: Ella Ma <alansnape3058@gmail.com>
> ---
>
> Changes in v2:
> - Add virtual rules `report` and `org` as suggested by Sashiko
> - Remove `kvfree_sensitive` from rule `cleanup` as suggested by Sashiko
> - Add `free_percpu` to rule `free`
> - Add `kfree_const` to rule `cleanup`
>
> Currently, the five functions in the `free` rule are all the functions
> of `void (*)(const? void *)` type with a `DEFINE_FREE` definition in the
> code base. So I adopted all of them.
> Function `kfree_const` is added as it is of the kfree family and used
> more frequently than other kfree-family functions (even more frequently
> than some of those having a `DEFINE_FREE` definition).
> https://elixir.bootlin.com/linux/v7.3-rc3/A/ident/kfree_const
> (found in 64 files in v7.3-rc3).
>
> This cocci script can report the bug fixed in
> https://lore.kernel.org/lkml/20260617142632.3298984-1-vulab@iscas.ac.cn/
>
>  scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 scripts/coccinelle/free/cleanup-free.cocci
>
> diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
> new file mode 100644
> index 000000000000..63216ec5d865
> --- /dev/null
> +++ b/scripts/coccinelle/free/cleanup-free.cocci
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Find __cleanup(kfree)
> +/// Using __cleanup(kfree) will pass the stack address of the annotated
> +/// local variable to kfree, causing an invalid free.
> +/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
> +/// Such usage is impossible to be correct.
> +///
> +// Confidence: High
> +// Copyright: (C) 2026 Ella Ma
> +// Options: --no-includes --include-headers
> +
> +virtual report
> +virtual org
> +
> +// Suggesting using __free for the functions with a DEFINE_FREE definition.
> +// Update this list when new DEFINE_FREE definitions are added.
> +@free@
> +attribute name __cleanup;
> +symbol kfree, kfree_sensitive, kvfree, kvfree_atomic, free_percpu;
> +type T;
> +identifier v, n;
> +position p;
> +@@
> +
> +(
> +  T v __cleanup@p(
> +(
> +  n
> +&
> +(
> +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> +)
> +)
> +  );
> +|
> +  T v __cleanup@p(
> +(
> +  n
> +&
> +(
> +  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic \| free_percpu
> +)
> +)
> +  ) = ...;
> +)
> +
> +@script:python depends on report@
> +p << free.p;
> +n << free.n;
> +@@
> +
> +coccilib.report.print_report(
> +  p[0], f"ERROR: found `__cleanup({n})', do you mean `__free({n})'?")
> +
> +@script:python depends on org@
> +p << free.p;
> +n << free.n;
> +@@
> +
> +coccilib.org.print_todo(
> +  p[0], f"ERROR: found `__cleanup({n})', do you mean `__free({n})'?")
> +
> +
> +// Reporting __cleanup usage for the functions without a DEFINE_FREE definition.
> +// The following list only contains frequently used functions. Supplement it if
> +// necessary.
> +@cleanup@
> +attribute name __cleanup;
> +symbol vfree, vfree_atomic, kfree_const;
> +type T;
> +identifier v, n;
> +position p;
> +@@
> +
> +(
> +  T v __cleanup@p(
> +(
> +  n
> +&
> +(
> +  vfree \| vfree_atomic \| kfree_const
> +)
> +)
> +  );
> +|
> +  T v __cleanup@p(
> +(
> +  n
> +&
> +(
> +  vfree \| vfree_atomic \| kfree_const
> +)
> +)
> +  ) = ...;
> +)
> +
> +@script:python depends on report@
> +p << cleanup.p;
> +n << cleanup.n;
> +@@
> +
> +coccilib.report.print_report(
> +  p[0], f"ERROR: `__cleanup({n})' will free the annotated variable, rather than its pointee")
> +
> +@script:python depends on org@
> +p << cleanup.p;
> +n << cleanup.n;
> +@@
> +
> +coccilib.org.print_todo(
> +  p[0], f"ERROR: `__cleanup({n})' will free the annotated variable, rather than its pointee")
> --
> 2.34.1
>
>
