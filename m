Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4C830D410
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948555; cv=pass; b=fWqHaxeeeLW0fqxOOKyZkpVQYIzvu6R4ROceomL/jTdI/v7ptCM6El2TAUNKTGCVnhCFkYm/xf+n9DClGRtkAKMcZuH/3pXXL1HxGi+j8fUA5g1c0QnCrn9e1tnIY+z3fg/9casgNG8bcLjlwEChCWiAjO8n/SqEJaPSsGQ6stU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948555; c=relaxed/simple;
	bh=y8f3NArIgEMVykQ8UPcZVmembmuVMbH9zJsVPQ/zXO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bp9Gk8B33Vyt2RnC27J2E2D/t0CHa7n92y/ls6UCEShuW8C7TFRwlaLzUBmArMtDKn+2SYOho8XPqdDQjUOSEWB4HngBa7edwBXMNTWdjrC5xLLDckoUNJE/fhvUxlzsNbUfseqXjMYXZpf9//MgEJulmc63p7wZWxMbx53nByU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9D9wcfh; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9D9wcfh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6aa9164072cso5292139a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791948552; cv=none;
        d=google.com; s=arc-20260327;
        b=N14LzGxSl2JyEkwsNURj715pQsGk7okYpPKG8ywOqT9BBy7ghAxsGNk/4rCKzYBD3m
         1LexIMKc6EQdrFMOlohwNwI2pkj+KsQRn4yTVtGePBKOc9ToxFCWANwn+Uvu+km66YRF
         pZdfm0yk9OiTCDOZOaIkta6Ogq2CntBO4IBxoJKZ0tW5eZYwH+hoGfrJDX9X2X3LDkoL
         JX/7Sz2nGe+63a2vMJ0DsN4MROCKkpJs8o4/+Wla/5xXkl6rZ3dAVLucvNqXo2HdyHV9
         p2ylgvdOjVdL/+C7KBebvUyV1Daiq/myOi3NjeRB6i7YBZaO/TycG6yEYVC1V83j3wsY
         6DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4KsaoaK9H/7EPqTqddbEdGkjTfIPX78T4YiSu6f0Mn0=;
        fh=VA0HL4KTk+sryfjKsTt9RxP4bWNm2Oj6Kd/fqe+xJeA=;
        b=KdvBmU81JJrmN2XFqy+ss9z7kMFAWD6Azsz+oaGXwzUErkEtaHlB3hVZqNQSJL47uj
         ua06NZxd7PT93Mu/9C0wllWtJ44CqGZIteWFlUvKO7wcPoxmX57MdjtliSPxDJxqagMt
         Dsv+tBUWaMPXwQK2xKjWLfu9XsbqbBbeUngOOTLBWukbBupzlbyzcLpn0IVZNG1U97RY
         IolP/xqTm1V69D4EIQBseS1RTgTvi4DsVI1AYT8ufx5uK/Lw1otTIXl+Zz0Cf2H8r+Le
         Do8trKCM8RSVC6Xy85+6GPUeu7lzYmbJeVj27wKMBVLNEPnm+D/pLcDsU7M3lK6z7ohh
         pNLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948552; x=1792553352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4KsaoaK9H/7EPqTqddbEdGkjTfIPX78T4YiSu6f0Mn0=;
        b=m9D9wcfhF0gbsRXTQbkoIAZaZqIQIDZsm3R/Kb7hrGALKSqcdTnfZ08BRegEdjApjN
         MFJZYVQwzeVMLroFh5ltBP7/ypyNFOFRLF+yZepDJ4VOZmEM58KlMi1OFhFGtuZm3pZP
         GqwPfxnjGDXthvzcO7Z4Du08GImFVZAPUEelNmMJemseq5w2SoobNpxLS2YEumRh5mMs
         Q/ykb/B6gotBJaV9UXYoqVly2eNFcSv6Bf5iEhzcpKWN/eys2mcOhBxf8ugUD0RJwRMb
         fY5Cbn/xCXid3fhvAr3T9bjvWZzrcnwYacaYjkVKZbmknMqYR5VxXvXdXY7F5FaUuCyH
         ywDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948552; x=1792553352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KsaoaK9H/7EPqTqddbEdGkjTfIPX78T4YiSu6f0Mn0=;
        b=m/BfFikafCIqR8D8p+eiT/L2lQUcR5yeaOuUzuFNkFTWuKG6HRAvZEZuBUE33354Hr
         m40bQGP12LLvXyvAjkyY547Sd1jT66ce7PCSxzcX60l3jUH0qszT3KzgwLW+w2SWZFZK
         cGcFr4AGto9PuFVQZV5DuMjpZvJ1c8htde5xoJChUoPX6dftAGzU33x3j5FMFY3O7QeC
         NcNyLMWbSJ46ltGWEPBrPdVYgTtD32yZ/OM8A3b9VhTp1sVleJJ8NXwA7AUZcVIzQ9KP
         yae6jIYsF3zDUEy52rEU6AwiWGUVwAxIiX86PQ9NZfcQ8NFrVajEONHcv461nyFnYXAx
         U+ew==
X-Forwarded-Encrypted: i=1; AKwUvBxjh6YSuGPCzSztCexdmoYUEowW19ZklllFx1/FLjcvtxLrcywHXwTkAucO7afgWTmk4+6+1x/l8+12Ey4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7SlUwm9uLgAJB2mW6XGQpQIzmm4+iPEn2Uz6tpHrmhG7Ruo2h
	TnqGvOYZnIKar5x3kvk+FnKbiXT5fa3skeqoF9/s+kuIV7cLMgHX/OHjPTRrAU+9go+Jzmm4WSB
	Aet9uQcXQjPJAwGfTGDb/rAMkOLrYOzQ=
X-Gm-Gg: AYBFou2Ok2zpXOsSTg1zZo0+CjQzRvKGMgJd0NrornMCZaxLHsgj5AOWHVAYLYDu5PJ
	g9JCpW7tHaHJWfdJw/4SocfvIWZBigMOCPB8azXY3MaczNr74BrJrt9uyrUFUAhYrkVidELvtsR
	cAUPxFifCSiQ7vYnrFfVc4dboPmyn2EaVYxaIP+EwndKtZSsNY8YSnvrftfJsKJD3ycwZWoVVDY
	BlkCPA2Blmwjkd/f4jf8emRiQxFk2/IhAZdl60DWTjEsyjkUauH08nDCgn+p+SJHtCiDfomMn8p
	iFDwqE+0Y6Sy3EX+v88/0OgWO73vCBMIQMxAvdZ3Ks06m0zLryKKgY+z
X-Received: by 2002:a05:6402:448d:b0:6ac:c1fc:8a98 with SMTP id
 4fb4d7f45d1cf-6b17c28e3camr12080163a12.42.1791948551636; Tue, 13 Oct 2026
 20:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010083107.15086-1-qiang.zhang@linux.dev>
In-Reply-To: <20261010083107.15086-1-qiang.zhang@linux.dev>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 14 Oct 2026 11:28:59 +0800
X-Gm-Features: AclHuK9wwJHzzzqurxhjL6sACS69pspDCcm-93pfiE3cU9MYx9jyO3qr0weTxdo
Message-ID: <CAN_Opa86yuhp19Mafu61KbSUr6C8YGeFqG2DSfMJhzuST58B=w@mail.gmail.com>
Subject: Re: [PATCH] tools/rcu: Add new APIs to rcu-updaters.sh
To: Zqiang <qiang.zhang@linux.dev>
Cc: paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	joelagnelf@nvidia.com, urezki@gmail.com, boqun@kernel.org, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

On Sat, Oct 10, 2026 at 4:31=E2=80=AFPM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> The following commit introduces some new APIs:
>
> commit 'dab06d6f9379 ("srcutree: Add an atomic Tree SRCU")'
> commit '8df13f01608e ("rcu: Add full-sized polling for cond_sync_exp_full=
()")'
> commit 'd96c52fe4907 (rcu: Add polled expedited grace-period primitives)'
>
> synchronize_srcu_atomic(), cond_synchronize_rcu_expedited() and
> cond_synchronize_rcu_expedited_full().
>
> Sample output when running rcutorture:
>
> @counts[synchronize_srcu]: 48
> @counts[synchronize_rcu_expedited]: 74
> @counts[synchronize_rcu]: 102
> @counts[poll_state_synchronize_rcu_full]: 443
> @counts[call_rcu]: 2498
> @counts[synchronize_srcu_atomic]: 8717
> @counts[poll_state_synchronize_srcu]: 14849
>
> @counts[call_srcu]: 22
> @counts[synchronize_rcu]: 103
> @counts[start_poll_synchronize_rcu]: 1093
> @counts[cond_synchronize_rcu_expedited]: 5339
> @counts[cond_synchronize_rcu_expedited_full]: 5375
> @counts[synchronize_rcu_expedited]: 8134
> @counts[get_state_synchronize_rcu_full]: 17248
> @counts[get_state_synchronize_rcu]: 17266
> @counts[call_rcu]: 119168
>
> This commit therefore add thems to rcu-updaters.sh script.
>
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> ---
>  tools/rcu/rcu-updaters.sh | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/rcu/rcu-updaters.sh b/tools/rcu/rcu-updaters.sh
> index 8a5df3f22550..a0f03a144f6a 100755
> --- a/tools/rcu/rcu-updaters.sh
> +++ b/tools/rcu/rcu-updaters.sh
> @@ -34,6 +34,7 @@ bpftrace -e 'kprobe:kvfree_call_rcu,
>              kprobe:synchronize_rcu_tasks_trace,
>              kprobe:synchronize_srcu,
>              kprobe:synchronize_srcu_expedited,
> +            kprobe:synchronize_srcu_atomic,
>              kprobe:get_state_synchronize_rcu,
>              kprobe:get_state_synchronize_rcu_full,
>              kprobe:start_poll_synchronize_rcu,
> @@ -44,6 +45,8 @@ bpftrace -e 'kprobe:kvfree_call_rcu,
>              kprobe:poll_state_synchronize_rcu_full,
>              kprobe:cond_synchronize_rcu,
>              kprobe:cond_synchronize_rcu_full,
> +            kprobe:cond_synchronize_rcu_expedited,
> +            kprobe:cond_synchronize_rcu_expedited_full,
>              kprobe:start_poll_synchronize_srcu,
>              kprobe:poll_state_synchronize_srcu,
>              kprobe:rcu_gp_init
> --
> 2.17.1
>
