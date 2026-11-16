Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826377;
	b=x2FT2Np50Afad0rGJESHhph5m+aSJ5T5sDO3X2dvQiuW9jWz/YSJ2S8h/hu9E2r6cSu8
	 NPQFSMmTYhuiAm3hQBnwRV+RUpEZ0pTJYkoN/RpuV/Ap525jhUfRv2YeVh6ZCXT24gfZ6
	 OcUPWm4yJnqsY12fx1hrZdOxq8Zg9KS2OSiyGGeP6iyx8cDsFjcSv0q12PChuHG1my70q
	 z+L8CtaHs82uCiK2x8UtCDSInw6ajXL2zIaoS8oVuVcBn2DBnldo0v6BxuxKXXN7QrbtH
	 wzRMdFdKXXLNXCAShIAgj4Fqj7eGbZOskd1I60UBAS7lBraARd5mdCFC9dRshNKI+Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s9FB/Bs8Bd5wsc28/znh0roBsQAvM1ySQVBJj73PwBo=;
	b=pPZOArPVt9M/qYfSBYPqkBSVG3EQgaJUKIvZd/f19ll7GdZdj6ffIizuvTqtnqsP3kNR
	 3O5OXyIHP8/PkAG6yJRFyEjZmYRAvRa+X+GFMwwikFCO165/ejPfP7WegEodK2AYVELv2
	 1ODDM9dar6Z4+H5lOFDSoHtPvZiWuhUcFdufT6ajAqzyfWaLLPxmEKyau5pQqSG3cAvXd
	 kKbipn1kNA0+bGCJLDw0zPkItwsiHih7feoUszSeXbgf82tphzNfmJLphz2Jw7cMvhCvz
	 PApjeRpDRFfe4GYH+kZEWEqCXJDWUQ1eOrPR+sGsZS+SDndndCi+MD1ikQZcBBj7plA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SoL0YF1w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA3E606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA3E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SoL0YF1w
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso69269566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794826376; cv=none;
        d=google.com; s=arc-20260327;
        b=JaQszuHFV48J+OzVq/88Ckvs0UzrcpXeAGUkFHnt9y8UkdnwBN5BurUCjlvxPlid8E
         GGlKq2BDQDIVgOvDID8PyVBM3FAlgOty5wS/zm+U3zr1VC9LeuvHUBsjhaRMgV+alWYj
         mdQQYXkg3dyXQDt2FFZNWdkMXicJpC25sy4hBnu3vrwzQg2A3JrRI6B+jCLipBsVoa+a
         7LBOVC0bbIOxXgrImlbYKtZBTgndU8qdfUd+XyHEcywmCwpO3vxzsJOIMn4z4sRuQ333
         l7OQeMW/KGJaPlpMkyWiaeeF+TaqHuthW5jyHf8wYycJEBlrKxY5UQ9mcHwlZ6ESjx+0
         xLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s9FB/Bs8Bd5wsc28/znh0roBsQAvM1ySQVBJj73PwBo=;
        fh=NEBZyYJPhIwRptrg4Gtl5OACEwK5IhM7I82nlr8B3ew=;
        b=F00YNaEL3PO1nrzg/8bXK654oqAeaOisSodaMchX1bc/llQEh5OdDetM3ZEQ9Ak9fi
         32eDWs/cUzMS809wdnBEg0u9YqvfQUM376EQ03HKFsfjy1vB6RqAlkALYaOMuLF+X88z
         ileXPt5gDXjFTbAVmaHtwRjvSjUC88CvaXbs5flHT2Xak1a40vyfUUQx5vPDrpIMc95C
         4Q91XgU/feAMpKeOu3lh0Da9+ew/u2+/Zm9HrPaNxpyENUdP/QOEgQ130NUXrUiOdTF9
         r+38QiK0ah0Url9Jw3536CJ4YeQ0erp7eOx4PCc8nGLayXh7NXGGUgxm/KQVXdI/Tclt
         2Dhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794826376; x=1795431176; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9FB/Bs8Bd5wsc28/znh0roBsQAvM1ySQVBJj73PwBo=;
        b=SoL0YF1w67O2J7dNyp48D+VRR2CeInfci74PcgSve1N1zOU87pUt/1L+2JjQv7NWVo
         6FZKjNEDLi6GPBnAoXYDHkmSt8UJipbV0ytbV4La/B79RlFo+y9YqZEf9FBm2TGVpC1l
         8Zz2KlqTnsYNOtDTfPFSNVqJUs3VBErYDiBugrGwQliZ7BSnLyhX+UZ3BFeObWf+LmeI
         cJiqu2lBt/xjTfUpgIhb0urUvMHuyEKdGdcJDLLHO2t8tINlzYOPar49hJqEKYPnWb5q
         AyRJJZ0P3fK/Y/gS4531TsrQ4/+xFEc7MrcWToxv0blPrPrwS+NVsQhLGvXzawNNCnl/
         yNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826376; x=1795431176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s9FB/Bs8Bd5wsc28/znh0roBsQAvM1ySQVBJj73PwBo=;
        b=1pduVgLzp/Gibdc+RYAIG+3zA+tHb8N6o7UJVVwmkBGLQDcPPMDCOvU1NrGwVys+7/
         7lpver1HiHqUVfJIbHAJJl+YKNw0TSuM+lOEYq0ayT6i3101yyDpvH9NKVad1QGqJZ7R
         AG8ALDBadWyixt5xZO5qmCbFkIYEeMkiN/Wga+2TJsM/7DBSiGKqPfmBJ0seJ8Ad4oDJ
         CG0jjz9N5BDQrNFQQlkJqt9IYxrGaW+CVJr0fVL+hXUQ7pBhXVUEGFc8HOF4mtuyTD/q
         twYhOC3tR7Wuwa4eqPOpRNdtlHGddoz6uXnvIBtXZEFHXF4MUjJVvdaDUADFXQMG/d1Z
         O+SQ==
X-Forwarded-Encrypted: i=1; AL+hErGpWtSO8mExlXtMgjySbDhbh3OenlsBjA3F3+ebgGpXrK4qY0iN1kxNZHnF+ULjoSjxb3EleV6oBhN0+yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DZ5S8GRuiYXoCLlXXymzpXp923bVI1oGmDZatU/3Zizre+dnz
	gaOxiXHQdxlJv5Ky/MWqXoIN+fWIWjXAyHIDF8u3fL9zQDacZyNVHjcSztenFehBlHVPu5InMkQ
	kHFGfgmuCECJLcqB9jatJzFaE5NZnOg/WI85v7S+MLA==
X-Gm-Gg: AYBFou0cFWuRj/hSZVt/RnW1thGnBBkMUmND/+6DWdKxaDf80DRUnYlORp9Sj48l0nl
	/eSaR0xxIEr7dbySjIr71ByC9iPKYajBI4lcgDU/0sIsFcTB6JIi09OJyCHHvMVKOyz0AEgFpUh
	cbuUayPqMFg/peO8Mp+t1BwWDWZIlal9QSCXRvQML5hvUW2vNiBt5sNA1yS9Vk3IWuD9z44ac/j
	AO7i9SETE8qgBrSmwXCNs9dW3ccHUBjl+p/xrgMlVwzZRIsA5MPxTKnRuYQhBa4rrD9a2m/MzDu
	se5r7QSVkdyU/fJ3o4OXq1HXdXrwPo9iuoxImGZy6b+KgSgV+tXzfWkjsBAAjme0b1lNeKYHFTL
	EHxKxNeooNLrfDexD7SSfa7I+MIvHLu0azONZy5G6RwvqSSIdMixtZXdwF6262T+hn5vebA==
X-Received: by 2002:a17:907:9492:b0:c2e:52d6:1fb7 with SMTP id
 a640c23a62f3a-c509636a2ffmr724576366b.22.1794826375556; Mon, 16 Nov 2026
 02:52:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108145028.2483131-2-thnkslprpt@gmail.com>
In-Reply-To: <20261108145028.2483131-2-thnkslprpt@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Nov 2026 11:52:43 +0100
X-Gm-Features: AclHuK9cE-Mnx9JYe1o94mAtkN2_2exx_lHlsDO2PKsOefc_zOkSXXwznfhjwPo
Message-ID: <CAKfTPtD5vLv_wqfGxVB7kEFDQmB6BQDTvJRGLkHXNZ3d0GHuOg@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is inactive
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, zhanxusheng1024@gmail.com, 
	zhongqiu.han@oss.qualcomm.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 15:50, Avi Weiss <thnkslprpt@gmail.com> wrote:
>
> sugov_hold_freq() uses the NOHZ idle-call counter to determine whether
> a CPU has been idle recently. When NOHZ is disabled or fails to
> activate, the counter does not advance, causing schedutil to treat
> the CPU as continuously busy and potentially prevent frequency
> reductions.
>
> Skip the busy-CPU hold when tick_nohz_is_active() is false. This
> also handles systems where NOHZ was enabled but never activated.
>
> Fixes: b7eaf1aab9f8 ("cpufreq: schedutil: Avoid reducing frequency of busy CPUs prematurely")
> Cc: stable@vger.kernel.org
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
> v2:
> - use tick_nohz_is_active() instead of tick_nohz_enabled to also
>   handle NOHZ enabled but never activated, as suggested by Zhan Xusheng
>
>  kernel/sched/cpufreq_schedutil.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 14405a614991..50249cc1a594 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -397,6 +397,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
>         if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
>                 return false;
>
> +       if (!tick_nohz_is_active())
> +               return false;
> +
>         /*
>          * Maintain the frequency if the CPU has not been idle recently, as
>          * reduction is likely to be premature.
>
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> --
> 2.43.0
>
