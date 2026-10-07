Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDE3EB110
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397669; cv=none; b=cMiflDxA9um2J9w1JnUkLPeg1HNyJEQsyMXbOvTD9bGeOxTC2J+P005TvwNizVq8VXx5CEUv7hcKdcuq2Cp/TQqTcYELf4YjmgNdaGDDmjeM0TCdlt/uvFUjSStDGU4uODvcRjKRckmGqnhVsZ7crPrt3nOC2QyZQI2Y0emtHdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397669; c=relaxed/simple;
	bh=NHKqORzXZxe+d5sw83Mv9OBGTje8qL61qlIGG+Jw/gc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TsoZtJsum3DqJCrsMh+MWJuNl/4ZpcuRoEDRBJQ3ChjgLmw4ig56w1hVGrk+2JkcUHbTz2SIdU9BeGUbgr/11M9fsGGLfsFbhcpd6R3IIpqQk9z9U47ekllkVLOgS1SjXS4zy1vXY++de+T0tHZdIDwRs/T5oG5NZ01SJT3zOxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=jRgrbsHZ; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="jRgrbsHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wgq+kVLiaScSBuYufgs1A4KejF3YRVrCItO6QYXPlSc=;
  b=jRgrbsHZsNQdDvBJPqvMV5pkxGEEobuLUv6AH2CFRwv5bsp+jwcCiG6r
   rZQnwb4oNCqSUdSOmmoMg0+AdTMB9xd8doFk9B7Ej08ePl+4hrSTFlerv
   rwzk3fmw1+V+NaVz/bnQ8ZSPxo2FAkkapdBQh9oi+bFvPkII32Cuc8JV4
   4=;
X-CSE-ConnectionGUID: ++oYlZDdQ8CdBfLQ60/ZBA==
X-CSE-MsgGUID: 7H9QVZziTxGye6MKvPA2jA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,144,1787004000"; 
   d="scan'208";a="159154691"
Received: from ip-78-44-132-10.bb.vodafone.cz (HELO hadrien) ([78.44.132.10])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:27:34 +0200
Date: Wed, 7 Oct 2026 20:27:33 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Ella Ma <alansnape3058@gmail.com>
cc: cocci@inria.fr, linux-kernel@vger.kernel.org, nicolas.palix@imag.fr
Subject: Re: [PATCH v3] coccinelle: free: add a checker for `__cleanup(kfree)`
 usage
In-Reply-To: <20261007164316.15102-1-alansnape3058@gmail.com>
Message-ID: <f635d9fd-8dd5-47f-7996-239bc74bd828@inria.fr>
References: <ec578f57-a7f5-7afc-ec2-9156c336187@inria.fr> <20261007164316.15102-1-alansnape3058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 7 Oct 2026, Ella Ma wrote:

> Using __cleanup(kfree) will pass the stack address of the annotated
> local variable to kfree functions. This will lead to invalid
> deallocation issues. Inspired by CVE-2026-45959 and similar bugs
> recently detected.
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
> Changes in v3:
> - Edit the error messages to clarify the reasons and results
>
>  scripts/coccinelle/free/cleanup-free.cocci | 112 +++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 scripts/coccinelle/free/cleanup-free.cocci
>
> diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
> new file mode 100644
> index 000000000000..48e47ed2186a
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
> +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> +coccilib.report.print_report(p[0], msg)
> +
> +@script:python depends on org@
> +p << free.p;
> +n << free.n;
> +@@
> +
> +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}; use __free({n}) to free the pointee"
> +coccilib.org.print_todo(p[0], msg)
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
> +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> +coccilib.report.print_report(p[0], msg)

Hello, this is more words, but is not what I was hoping for.  You explain
the effect, but not the cause.  And to fix the bug with confidence the
reader wants to know the cause.  Here I would have expected something like
"__cleanup usage for a function without a DEFINE_FREE definition. This will cause an invalid free"

julia


> +
> +@script:python depends on org@
> +p << cleanup.p;
> +n << cleanup.n;
> +@@
> +
> +msg = f"ERROR: __cleanup({n}) will cause an invalid free: the stack address of the annotated variable will be passed to {n}"
> +coccilib.org.print_todo(p[0], msg)
> --
> 2.34.1
>
>
