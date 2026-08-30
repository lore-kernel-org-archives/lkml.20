Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91B3B38AE
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091819; cv=none; b=OOel3kvGMAAODb8+OsLEYGyy4dLcuSvgADh+MCMKW0STj08rGMnt29UI9nWVfPaqK75ghg2ugxC4yvG2dOFUWiNz+j25YPHt2Yl0AmHtm2148AkqwAMT8qR9833ewgUQAZViMfL0zbAkFcvNqEFsEnzdQ+RFUjIEcCHraGovak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091819; c=relaxed/simple;
	bh=bDcq/4MaF+KfJ0uWR8l2pvdtUocoyHnYxeuIULNZdwI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VnpgE7Zyl3RBm42wI5AgKrmTD+fojZ4O78q/lb/iUagHaKY2FxD22E4KJkbS6zx4cLT5CT08kbh3sQnOrbm+KVb9aMzVvqi/QWp6/w2NOGu/qqCMFYzIfbru/DXPjXph86cAu4w7fRoVuUahBeB0OUN2SdLIJXg+OaJRXVuWwR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=DFKa70d+; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="DFKa70d+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wKanZT1RXGv/VQBqsk2MRwPINnZZKd+OPyx386S5ZPc=;
  b=DFKa70d+NUkWrb7q+5PmUCb+uvS9enemAm1Sl1rQbFWBP4q82tYeYb4M
   IoX+/5fufAHdPYJooiIdTLucFzpDhsnCOZXMn4YiR8pRsMn2dnsQfsZu9
   NZ+AZ0ffhJTW6OQMjqn+/LqUzEZiCk4hG+9lWdoi+wGWovi9zuEMoOb/h
   w=;
X-CSE-ConnectionGUID: XVaBxPN/QNagcr7ToBetSA==
X-CSE-MsgGUID: LolSKyHQQ1Wcg+mbWf+CSg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,252,1779141600"; 
   d="scan'208";a="155404682"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 14:10:08 +0200
Date: Sun, 30 Aug 2026 14:10:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
cc: Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] coccinelle: kfree_mismatch: drop vmalloc_exec
In-Reply-To: <20260823161826.3805598-6-ekffu200098@gmail.com>
Message-ID: <4d9d25-b8d1-6e5e-f1-d86396d6386c@inria.fr>
References: <20260823161826.3805598-1-ekffu200098@gmail.com> <20260823161826.3805598-6-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 24 Aug 2026, Sang-Heon Jeon wrote:

> vmalloc_exec() was removed by commit 7a0e27b2a0ce ("mm: remove
> vmalloc_exec").
>
> So drop it from the rules.
>
> No functional change.

Applied.

>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  scripts/coccinelle/api/kfree_mismatch.cocci | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/coccinelle/api/kfree_mismatch.cocci b/scripts/coccinelle/api/kfree_mismatch.cocci
> index d46a9b3eb7b3..bc90d0c071ac 100644
> --- a/scripts/coccinelle/api/kfree_mismatch.cocci
> +++ b/scripts/coccinelle/api/kfree_mismatch.cocci
> @@ -29,7 +29,7 @@ position kok, vok;
>    } else {
>      ...
>      E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|
> -          vzalloc_node\|vmalloc_exec\|vmalloc_32\|
> +          vzalloc_node\|vmalloc_32\|
>            vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|
>            __vmalloc_node\)(...)@vok
>      ...
> @@ -42,7 +42,7 @@ position kok, vok;
>    if (E == NULL) {
>      ...
>      E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|
> -          vzalloc_node\|vmalloc_exec\|vmalloc_32\|
> +          vzalloc_node\|vmalloc_32\|
>            vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|
>            __vmalloc_node\)(...)@vok
>      ...
> @@ -68,7 +68,7 @@ position f != free.fok;
>  * E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|
>  *       kzalloc_node\|kmalloc_array\|kmalloc_array_node\|
>  *       kcalloc_node\)(...)@a
> -  ... when != if (...) { ... E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|__vmalloc_node\)(...); ... }
> +  ... when != if (...) { ... E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|__vmalloc_node\)(...); ... }
>        when != is_vmalloc_addr(E)
>        when any
>  * \(vfree\|vfree_atomic\|kvfree\)(E)@f
> @@ -82,7 +82,7 @@ position f != free.fok;
>    E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|
>          kzalloc_node\|kmalloc_array\|kmalloc_array_node\|
>          kcalloc_node\)(...)@a
> -  ... when != if (...) { ... E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|__vmalloc_node\)(...); ... }
> +  ... when != if (...) { ... E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|__vmalloc_node_range\|__vmalloc_node\)(...); ... }
>        when != is_vmalloc_addr(E)
>        when any
>  - \(vfree\|vfree_atomic\|kvfree\)(E)@f
> @@ -95,7 +95,7 @@ position f != free.fok;
>  @@
>
>  * E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|
> -*       vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|
> +*       vmalloc_32\|vmalloc_32_user\|__vmalloc\|
>  *       __vmalloc_node_range\|__vmalloc_node\)(...)@a
>    ... when != is_vmalloc_addr(E)
>        when any
> @@ -108,7 +108,7 @@ position f != free.fok;
>  @@
>
>    E = \(vmalloc\|vzalloc\|vmalloc_user\|vmalloc_node\|vzalloc_node\|
> -        vmalloc_exec\|vmalloc_32\|vmalloc_32_user\|__vmalloc\|
> +        vmalloc_32\|vmalloc_32_user\|__vmalloc\|
>          __vmalloc_node_range\|__vmalloc_node\)(...)@a
>    ... when != is_vmalloc_addr(E)
>        when any
> --
> 2.43.0
>
>
