Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3F3B27FA
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093569; cv=none; b=IcGTGTqm+4duP0t2lDlq0Bw94RzTbsueu3uEFfuecjGcVE9BszyRUdHscwLB+4t8JVhaoJTVZS2gD31bfYC0Ni82k5MK9Sn/5HHzit6z5xcEvP8IonT6vKLiFt9OzgyaVXUOoUodXMd8w/mlcao/nD8enFx897yUbZKImF0At7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093569; c=relaxed/simple;
	bh=HnKrjkfl5gWCT/suxFLjCHyQsNTpI1T4DcF3kiW3xDQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AWmEgh3kpS2jfAdISEiXhYE3zhEzwRNf6rlCAxN2KTl82EM3nf4fcR1S0NredfB4XY8dQOcGnJyOK2+kS+hx44nuAQmyo4dTDWW8qrxArsPhwiXJzFASstOdkGvX32hZ4dbnAAKsHFsKDtYPf2B9iiVxS33S0P/VHa64aBcigjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=IiA9jw6U; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="IiA9jw6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8lgaUawsvkbyEqQ1bzA/Q5gCo8KQllxlnFV6Z6dKQ0E=;
  b=IiA9jw6U39vYPm0mg3qhxmc09B5go49jArHvjPcMBDfkvhYFJGHorX4A
   MD5CQZ5Kk7KRuI16yIjnvlJ9J9yG55UlQOCJhjVybHDES/p0at8MY7H9e
   AHOOw07fmqv8p6MAipUT4R6GQarDMpg3Z4f3tkO38W9Ek1VNSHbU0kWkO
   c=;
X-CSE-ConnectionGUID: rdcxUyyeRyOGT4uFugn6fg==
X-CSE-MsgGUID: nG93uweiQhG2qZmldGNIsA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,252,1779141600"; 
   d="scan'208";a="292190008"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 14:39:23 +0200
Date: Sun, 30 Aug 2026 14:39:23 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
cc: Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] coccinelle: atomic_as_refcounter: drop
 atomic_long_dec_and_lock
In-Reply-To: <20260823161826.3805598-7-ekffu200098@gmail.com>
Message-ID: <618633a7-eda8-5a26-b03f-2ffbaf4f1af7@inria.fr>
References: <20260823161826.3805598-1-ekffu200098@gmail.com> <20260823161826.3805598-7-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 24 Aug 2026, Sang-Heon Jeon wrote:

> atomic_long_dec_and_lock() has never existed. So drop it from the rules.
>
> No functional change.

Applied

>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  scripts/coccinelle/api/atomic_as_refcounter.cocci | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
> index bbe5b2932933..af82b9e094aa 100644
> --- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
> +++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
> @@ -26,8 +26,6 @@ identifier fname6 =~ ".*call_rcu.*";
>   atomic_dec_and_test@p1(&(a)->x)
>  |
>   atomic_dec_and_lock@p1(&(a)->x, ...)
> -|
> - atomic_long_dec_and_lock@p1(&(a)->x, ...)
>  |
>   atomic_long_dec_and_test@p1(&(a)->x)
>  |
> @@ -69,8 +67,6 @@ identifier fname =~ ".*free.*";
>   atomic_dec_and_test@p1(&(a)->x)
>  |
>   atomic_dec_and_lock@p1(&(a)->x, ...)
> -|
> - atomic_long_dec_and_lock@p1(&(a)->x, ...)
>  |
>   atomic_long_dec_and_test@p1(&(a)->x)
>  |
> --
> 2.43.0
>
>
