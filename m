Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F442050
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675285; cv=pass; b=KQ9Me1XyNXj0/BJH2DDfbJmup8QbihcTW2yLAMjyks+xrujfUeRfvfq+3+AZjX10ERY2kw2/+aEaUwsCOx9AiXH9PQu/enKEmvub83WAYDy3vyFTG+9HD6ANOw3GQz8vvhAxnE3nND2q0fsmkWrFgT2FmRlzAk/ihaTTfj8b35o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675285; c=relaxed/simple;
	bh=cKoxBc8OwSXHhNz7B2JU/p9iKVamOJWx79yNaew5iLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSK5w0ZSrge0kmRUbXgdkl1gVpOgHOukCAZlWz5hmoYGMKU3G0zkAB7A6Mhu3Cqex8cLiU1okbblt22WXRm4ABtdAPg0LrPuZcxMdgf/MYgEPjsoO0G8We/GibKKzQ2XcndvDzweYYo7Vo2Dkg/x6PnIXwsJ1AQqeW9wxWt9K0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmHL4DSg; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmHL4DSg"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso6383801fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675282; cv=none;
        d=google.com; s=arc-20260327;
        b=dB6e1blwhVvZ/1IGLBgzggkRcZ9RlWqw24LnTZwikDJdmsRCnbZCmPQLozoTb8e6Go
         Vf1kZaWrfQc1ffeUG1+FBE1HPOrEQEhiWdAoSqWJMfULy7oJf/13XJ2xnv7oqHzhwg2V
         X9P8nbUtPAUhSKVC1H2G+0LAzixJwTcnsqfZ79RUivGGIu4TYIhXrWFtiq+CuhEPpuEH
         vPMoxcOKmVu3DLzu3N335/qDEfmKzpFijKPKMlhJWINu+tXy5EAw8P74CzLVzug55o94
         U67IvLpbjMhAknlm72xriS5EPTas9LqF7GsOzvxAeHwSMjS1+eB9VEmkGqRHsQL811ef
         1GFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=feaWuaZZCYs3rhB8MCR/+Wo/5xzqgKKqMklPyeWAgMw=;
        fh=dyXHdYeueIpV24Avgh/IIxEpbr7+XNL1cfJhqbqZ0Fk=;
        b=sNsmB6tKqco9Jz16nYalag/LpEbAgFSHPhPygEYxpyyaJzRN69IdYyRpaxgxEWl/Vz
         jCd0NzAu0fjyZwbPdmqFWp7NlujgTGdAdetK6UpRiVkbH6X+/6W+xDWABfhRYPmVPOB0
         0sMGQ62B9YUZD2bv1lXsWzF/dxhTUJOxHkiZ+rbYgaM5zFa80PvKlu+rMU5+B1s8KHRI
         UtBlIrFBvViFJSGui2oAF/H/tQu5/AwWhvB9aKtqepVQVaIAQsrO1dZwP9vyW3RubOHb
         gZlP34fK/H/Enz+MYcieyV4MGGHfE2NQyCQSgSmJSYkEc0kWV6Tx7UtV7j11ebQFfTxp
         gRpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675282; x=1792280082; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feaWuaZZCYs3rhB8MCR/+Wo/5xzqgKKqMklPyeWAgMw=;
        b=bmHL4DSghHuZ7XQ3jdECRR+i9hdWexkN9bDtZu10oph5xghouphz2KaEgyEKcVH59V
         s7JD81NzNxhhPKujC+E/lYkm7dRQXoXMkTYAphaOTqWjfzud3675t5JWvPZKNjgrOsUb
         iWevaTvrt50eHtVfWYvXnbSaVpm+ZMH2qZIIhdG+FjO9GB8sLjcmx45VnWeYlRvkWuaR
         gitlYeSEzo6g3AN7lRfSekMqLew9fSX+83+PyeMH4ms5W73ZgTPk0v7Iap5I3/OVMFYX
         ZrqusnoAw+PwrfADMcUdbwSbFwA1OoMWuuvaKX9ZVN5wjFcghO1RxRQDzpoQhyAIr0+k
         nb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675282; x=1792280082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=feaWuaZZCYs3rhB8MCR/+Wo/5xzqgKKqMklPyeWAgMw=;
        b=nk5HycU685CjCaYJjOv2PSQHskPasfRJVPAAXw89doL3UzFds7leMSu4n2FErOCQWK
         8ZdqFfen726i75FJYa31zsVnfESkQlCKPjDmMEbkAmdBMOAvjytA2IVY4ZppWA7maDfW
         Yu0ocu9qhv2uzqkbN68szndymfVqFt09RE+AnbGN/RSCYxIuKRnDtjYjIgL9WewTN4Nl
         yCstEfZfBMhvfzPYDaSvRPVLODclTyzFi3XlBDMfd2Yd5kCr9o1md4bRTxQ573vhtGMu
         UsJXdysSElqdGbV6mjxCCzc0hnyvwBcbQ0U2cL9KIFIzRzKgE3a1yYCPQeW1J/wPpWLp
         KC2g==
X-Forwarded-Encrypted: i=1; AKwUvBy/aI5b6bbi7b0MMdp9d5seDzr+PVmNhCPWt3ty+qJ0hynHwFh6QUopLJWZQoQ8mi5DptsI+9UbsWqvwcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhgGINwoSB/piPy6RAYP7jZFXuELsk961VJgw5w2gnVFLsc4rX
	4ON1vAYmqWtwBsh2Fl/IallDjuBwehy+T03W7/6SmXIOYwqhK30jQVzX/ltjld0PmBFr2EqX8Gp
	74Ec+GSeqBksL9OtaTyAAWzUh3AoUlHw=
X-Gm-Gg: AYBFou01Tmq4757JMph8eEjk0ocX7iye7cuWgH0AlQb1vH+BHyL6jKDsrDj4y3D4Y41
	+0aMt7HbDssAiMF8D9/Le7sDJIOdq04J917Qyc42n0QKrhm2o9Z6mGIQEi/oL2Gk9i8APvQ4Gha
	IrvanCgN0+Aqau6tB2lYvaeXQ0NPUj/KmF9PNqglymeQnlN/GUPqQ9rBwDCQ5kof99b87l2Shi3
	T+HdGe0+BvhduPMeCySzeipsp7KlinYrHhhwbFPR8pxv0lsI/Wd1GZuAZijdlugRM1u6TvcOTc7
	YZqb06wBBPXQsQu3GV1/WxSw3Tq/R1Rm70bxP2/P1DXD7VsABzYDb+xyNDcVbvQMs7fojFnbpdI
	UrHibQN8ZYzAgSB1jCa/qbuudc7wxVIJz3aW8N58CaPtUJ5vhgMU/IFubIgprbq9PDA4G5bE=
X-Received: by 2002:a05:651c:31c4:b0:3a7:713b:245b with SMTP id
 38308e7fff4ca-3a9c53852b2mr14841731fa.18.1791675282027; Sat, 10 Oct 2026
 16:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010144621.974850-1-linmag7@gmail.com> <20261010144621.974850-3-linmag7@gmail.com>
In-Reply-To: <20261010144621.974850-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:34:29 -0400
X-Gm-Features: AclHuK_YN5BbixM1IaQoBobT0UPvBKLfq6NBtNaSR9PNTTL89qZ7WbJcHOjtcBg
Message-ID: <CAEdQ38Hqj9+5vui4j6s2-5OihgtiQGSM9L93RTYdp-PfGK0_mQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 16:33 +0200, Magnus Lindholm wrote:
> This requires the preceding removal of remote slot clearing from
> migrate_flush_tlb_page(). It also requires the stale-TLB series to set
> need_new_asn on both the reused and newly allocated ASN paths.
[...]
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org

With that Fixes tag this will be tried on every stable tree, and the
dependency is only in the prose. The hunk context includes comments the
stale-TLB series adds, so it will fail to apply rather than misapply,
which is the safe outcome. Naming the prerequisites on the Cc: stable
line would still save a round of FAILED mails.

> +             /*
> +              * Ordered before any use of the mm by the mb() in
> +              * arch_spin_unlock(), when finish_lock_switch() drops
> +              * the rq lock.
> +              */
> +             WRITE_ONCE(next_mm->context[cpu], mmc);

"Any use of the mm" is slightly too strong: swpctx loads the new ptbr
and ASN in switch_to(), before the unlock. What the ordering has to
precede is the first TLB fill for a user address, so maybe:

                /*
                 * Ordered before any user access through the mm by the
                 * mb() in arch_spin_unlock(), when finish_lock_switch()
                 * drops the rq lock.
                 */

Fine as a fixup, no need for a v5 on my account.

> +             if (atomic_read(&mm->mm_users) <= 1 &&
> +                 !mm_context_elsewhere(mm)) {

Not for this series: once every slot has a single writer, I think the
slot test is sufficient by itself and mm_users only narrows the
shortcut. Dropping it later would extend the shortcut to a
multithreaded process whose threads all sit on one CPU. Worth a look
after this has had some soak time.

Nit: the changelog paragraph starting "Order the slot reads" has a short
line at "Also issue smp_mb() after" that wants refilling.
