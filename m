Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494E2F363F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596595; cv=pass; b=SOkU5veuXPNNmtH6laVPLJVHDwr/4FwaTnyYM+58yr3xnfIhovU8YOyz6q4VWGhTQKjHo23EMo0+Mj0+MN7NCjO+otT2jh7jw/1q5hmwEd11OgKUT+9wLI4vSYoz6K8yNIKXrtYextxtTiJ0ihXTMfA2QALXuQUzE1QFoLauczg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596595; c=relaxed/simple;
	bh=dLHjI842JfdyXNE0lCpGbDvN4U+EGuIm2s0SXDnWoww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2MQI/lr6YIM8D+YcFXLV1bap3PwP3EIYF/JR5Mm3Rme52+iRraRhahCnvk1HF6wv3vSngIoGm4E2ROtFofi8yaHE6TpIQyvNFdfbmO3riIMZxSfeYADyCgwLU4iphR6dWYg6+5huT0jova8rjRSwmwu4x7RItV2qMlTMKdN53k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyuU8v9u; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyuU8v9u"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso283945e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596592; cv=none;
        d=google.com; s=arc-20260327;
        b=rHjmZhZiVxkvcOwJB/9QKh0nOi76BoYwk9I1lmZs5g4/E4tWrAMEfFiixV+Mu+rFMH
         slyD9Iskv2tjQ1yodfk2LBwRJwaWBoxGtUnFks1CaosDWDPVTj3Rn8AQ+/XTv7kngbFz
         bAt8kIuENbPI4DT+25nkuhE7yCmN3tPaD0b/fo5dY1QnBhnq8BtMBkNA1FBCfBhP+UbY
         /OCx1GI58rVuuLhfsWRxQ8OcmpELgaBkBTCuldB1dCUQ5QqnegOjRSKnBtiupXGowd1w
         kmzR1dHgbsEOJBGz4TeCeqSG1ZhOW5a2NrfZUdE7nfpLdhTf1r3FL4jR87DBkerN0lD5
         hxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EyysmEI4Etsf9glt231lGx5fXVOH6sNcjfT+1NIiX/w=;
        fh=DswLY4/YhOwId3mxZ8RRKpc34tOIrgHG4gpukT343aM=;
        b=B8OfMvaUKBs4rGCSJY4kI1WqtCrJU2ZtYZtoc2JG4QCxdUNtLu8fg1TB8X3smsRQ/2
         TVUwvOGaUFJkW83OU6Pol3iNo1j5Yf8OuBA46lkCXLqtlaWoR5FEbf9+gkZHUvUoAGPe
         7QSYC6FhzVaJrHnPvTxTTwsMXVZY1jkMR9EdX6OeZOXZ0oJxm3tCqqdPO3FBDqR3iSWh
         u4U+NgWRYitf/KKipTwKDAzmvXH1GGyDKtE2boWM4XQzzJT4lCaE+M37pQk5uICCPIgz
         3/EWQoaYFh1NCaPfdTMweqYyoJ5VIIffPIc3oifi2Vk+9AotTqxfkc3qvxuHVTKYU5Xz
         7x2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596592; x=1792201392; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyysmEI4Etsf9glt231lGx5fXVOH6sNcjfT+1NIiX/w=;
        b=IyuU8v9uBMAt2Og+hiGQJOJlwHkTIx24PQ6rjHShK4vSDMBvCFV5kK3I+cJgzFuVC1
         aB5KIo+AdYB2vLOydrqpW5qjIwNCDAhaT0NOHyVzRXI1Uc85gg69RRQ4rNmBR/ApK/WN
         jxQZUrd0kuvmlSJeX3gm1qBp8A2jlMLe7RzJFMmId4/u7jObrHUczcsWFn1XWH85LMaf
         pXQ1CkX1eBAwlUA5YAkACcLwv2dkmJujTOZuTi/TYnmQKu7vA11h4p6ZOsi5q+jfHcOf
         wHD+Ax7b/4O8TnqqujtTLIqUuhYfPLu0NSUEjhCtubjnhv0OHItaTOZ0x+wVTWgrajZB
         AOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596592; x=1792201392;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EyysmEI4Etsf9glt231lGx5fXVOH6sNcjfT+1NIiX/w=;
        b=shCeha+WdoIwlBbWdI1og2yCbE5aLmAkOWhCivKNeoH90lDrSq4TQigUloOsEk0nI0
         jZ+JFvYVce9xj895rSFzsUDmxxnNkw1kQvopj3Ky1GtSN9x8V0/lQH4D6xAes+HYrcCx
         FuYdnic/pp3dFKwaMhhDGa5O2QqmzP7w8XHrPB4OOKsqgxvTTc80VOK9xC3hSgB8nOi2
         UupipEYHAhCW5EXTy4OE9nAhzazAbUSOGMCfU2cSIX7QIW3frBiHHqh77n4TyW6Lw0VG
         M4C0DYjW9uZjQs+Js4aTjjIYHBWdysZk/gOIb0dEjZR/JQYQSQDOq/qqY5MBfD1YOPb3
         hC4w==
X-Forwarded-Encrypted: i=1; AKwUvByHIdYmgodNjujYK6Nkfpo+6smYBqUEXYLArJdmk79PgbBDJvS6bQbltLFXE3nxAwhDlnChfZYgW7X6oIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmNeu1yq5gYYK6U5zjdY1klQbbZ5ORhLrPUj22u7/DUkdzQDYK
	bOsm8orsQN13GbLNw2aHv43CuXgXP8E44ac+++BFH+1zd1Dfpwr2Wgh9urUBhpGC4rtPKH4URCE
	IJ1uR+1MyR4lJRsluOv5GAzajmzmxKEg=
X-Gm-Gg: AYBFou0DaAYDBtRxCGm5w+nAJ7fEp7Byl3uxBgNe0ciZIGJE6LnfL7TrIZUaK1KYljU
	hBoVqBt/Jm/hivaKwbar3VZRBTV1zXEiXGHiDAjHx8gxinzyQMrdJuc6bQhpQ9yW5g38wNMEK46
	WgmWUYlj8vFj3LpYOX6ebrMz1OLXnkqiGtj/wCwsv60b+8DUHcTz1IDbdqeiEyFdEDqMsu3jkNU
	v8ooXQUaqT2/Q41L2Qqin7mApGRMaJmNi+EP2mQ4ED/Xb27VR3dX8w0qEeQcP8ccu5hAREyem/N
	K5byakAozwZHf0am28OInrgyecGmm4wOf0fXVOzSuhqNWG/7RWQkXWkVvorYA1gwxUpcwYgPk33
	fyKs1ix+cFh7/qBZy6PxQOM6CSct9mALEoPJsMWtvx0vRqr4RZ0WsF51V6m5FmzucgIR4h8o=
X-Received: by 2002:a05:6512:2309:b0:5bb:7ae3:bbe3 with SMTP id
 2adb3069b0e04-5bcde8c142bmr1156652e87.37.1791596591709; Fri, 09 Oct 2026
 18:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <20261009210449.971057-3-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:42:59 -0400
X-Gm-Features: AclHuK-vtZnBj66F3yVBEX9kA7XqzAvRwZHKT-o048qUxLS3G15CGfwGYGZihvM
Message-ID: <CAEdQ38Hu3OvqD1KtcEKLb55aCzPu6+Dd+uA-YQNfxzfv9kfRsA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:47PM +0200, Magnus Lindholm wrote:
> +/* Alpha has no kernel preemption; these callers cannot migrate here. */

Nothing in the file says who "these callers" are. Something like:

/*
 * Also called from kthread_use_mm() with preemption enabled. Alpha has
 * no kernel preemption, so the task is still on the CPU that ran
 * switch_mm().
 */

> +     /* A deferred shootdown can also invalidate a newly allocated ASN. */
> +     cpu_data[cpu].need_new_asn = 1;

That closes the zero-slot case. I went through the window again with
this in place. An IPI that sees asn_lock zeroes the slot and the hook
reloads. One that arrives after asn_lock is cleared flushes the
context PAL_swpctx already loaded, and the hook finds the slot nonzero.

The hook's __load_new_mm_context() now runs with interrupts on, so an
IPI can nest inside it. Both are loading the same mm, so the worst
outcome is that it gets the same ASN twice. flush_tlb_mm() from process
context has always had that.

Reviewed-by: Matt Turner <mattst88@gmail.com>
