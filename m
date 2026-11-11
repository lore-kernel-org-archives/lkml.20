Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794435028;
	b=qOCuN5symZbSbLrQUr7iznLMTtXaWahbBvAxUIi2hNisYBbBssGftRhgUbgeHxSPlh8h
	 xHja2V3nJRKWwCM+wy/wA2zOQsI70n98s1tobeb0xzN13VSa2vhVVfoNPOyY+OD3Usl2J
	 2ftuTqOAAeUQyX9vpo2ryKeUQjO/6Txjd4FT3SFdbcr+GqhLdtd/6Ox2V1ieLGHu4rI8D
	 LQ1M0q0a+5KPAlxbpljss2pqKnPCRvFVaxhZ82r0Aj9qtBB1TR+gStCzcYS9YkcXzZHaO
	 sKZV/XkV2GkP51YJFRYm8WIu3o+nvUTxtaUh2fiFvznw9rhQZlDJ8kHykP1IneyqTlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bLKfpDlOWEozQoVsuZM54f6sj9dITZwkN+hPeWugxEc=;
	b=p+KumCsxqJxvAq++1BuQkRor1shw3xNWk5twpMTvzH2BbDlO3nm/cv7y8ANUYccjIEe9
	 i0B5wHUNTojP8KEbcj1fZBqKp0k0nZQIqlvIWEXwJMVfO9q7tdf65FR31KQtIt2mQ1mWQ
	 ip+Gsh4Q4jxcGz2MqufV753LznqtP6ZiQ42N4w34UtyLh93yrWpPYv4a+AxdQETSMYbB2
	 TcxVEZeTUCx2v+N4ziSr3/KdjvAVQw3pRWplttrQjr4paonNAgWN9drt0nlP6M4yW/SCP
	 JfQA/DAT9H18RJQHKENu//4Rcn0abQNIq1IfFtu75cf3GMVJ4hNDHqxfG90WF9GObyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ejo+EyVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E5606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ejo+EyVM
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so24701cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794435027; cv=none;
        d=google.com; s=arc-20260327;
        b=LeBYs+z2QLxqf2ZFeoEsokIKSO+htMe8UXc+VWYFuFxi1rkKQMGXhrEYf+407M6OEO
         riJ5/sAVKg1HHkJP6nLjhuETcFg5XxjnKcp49ZzIDu0Jtq+rnzd5lJrsCbRyNtGxwM5o
         dRBoyzLdeqkhXQscCuR2VN3QmKllIFZiS7ebmISgk2bJ1sDtOcYqa19baAB31Yt9mO3o
         aO8p6xK6g4ZIt6tOVpu7p00pAmmxDPWS6CT43yIyvJ7QR2J5KzsgG3E22S7DyRVKus6e
         NahFILNIdOWNzNA8qr9kHJKYSmyuDi+JNNZD2BTzgEt53Cz0vejiB7yLg8YsU+O6FsfN
         Q/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLKfpDlOWEozQoVsuZM54f6sj9dITZwkN+hPeWugxEc=;
        fh=nInVFMW2vaXHqjawKV/XGEs5sUmZNhCKQhF9REfH9EE=;
        b=jpI5e7cmqdMAegrH/cNm1h+z0d+xZQwVu06vEnLJGh+BCZdmE+cTdWjfwSF3ALz1TB
         hDyfYTQyZSeRUeyRY4vWUChlSYAOgpGeGLpCWqWNHjYLikVlRG7MAgVfMI9CBCQwBzJ3
         +RW2rlO0yNVU0ubSix7If949KXtVQNRQlhsBzbtilnVyA7jyvSiuo4jrC6GNpBM/yc8O
         RKirGYP6LxJHZVULPzC6p+z5W8MRoScmo1AN3gmir5aWnGFhTDxxvxCRFhWMFwGvyfRM
         yAHfic7y3IlWypfos6ctuWdamEqCgXt7EsPiLR4xWqVWSN0rnuCtSFSc8KV76m119DjI
         pmaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794435027; x=1795039827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLKfpDlOWEozQoVsuZM54f6sj9dITZwkN+hPeWugxEc=;
        b=Ejo+EyVMvYYuZ1+Bmxe8Zs6evHwJ/iIpdwaJqM1aEPHcIR3OC5hEa/gMS8bcn+EGkv
         MFVb0RZCGDRPXy1nM+eGHmPH/+H/2N+wdkEoqevDkMVX3u+5097jmT8oToJHqtlxPG8A
         TwYG1IxeSGLqSkuxt8+yfuZMWTqTt92ZoCMXZi14ccNK8hjbwQSYN4A/YJ6tLFhb426g
         cNmRjMXpNCjwfo/ydLeUGKaKCywGcieEDbOdNOlhDWjjKjUuSN0w8q1SgdAtNKKt13op
         GCErcv0o3G9x6CpyMSHqs3GbSBSmRHezLSK0j+xNblsQRRQ5bg19Xa83LL4SYRUM5BgQ
         DFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435027; x=1795039827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLKfpDlOWEozQoVsuZM54f6sj9dITZwkN+hPeWugxEc=;
        b=Rvr9zP8ytEr2O2oYk70J8rZx/LPWxeAr/xCR9OyTlINbpxmUrC51gYMhe/bIk0AtnX
         vLZELkxLRw4Um+85qI6faSGJr2VVGrl6I8NZvbJn5xdzrKlc0B/ejoZKdvzJA4/M/ySs
         rwaVwV2wzUJwvJ9+qWyx3uKoesz/d39EcAzbXCVVQ4diVdeknJGReIqTrmfHCq7G7oLn
         hQCRo0iHGZW+tYuUI1J0neTpiBwtSMeRsaKpmNEfr38TF7wh3Rwz58NEYm9QFHym5VWa
         L5BeQWRKbkqqHru25nnl9Pz4Y2dnBrMpTxomUjnP1nctUWFpwRXpIuZ5aC+xNI2UITnx
         nbmw==
X-Forwarded-Encrypted: i=1; AL+hErH0aJEdpeYO+oYGUjAGmdZjsk2Dwa55vmhV4a31IPVsD0VqpPXSGkuWNXVOIPy/689smBUt21dDHsYbnEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WyfRUbxOGQbrxqFuKthYyvtR7D72DzLHYJ3jfVEl0BCRJmcPZ
	gzQAjEKzI274RtYfblm95SlD1zFHfPADipVgDZNuS1FkHM92ndGxt2ne6WNsHsV35NKjs90a5o6
	l8nQstoAGvf/FkDMyEmyZb8cD5VY/kz46n+ztMC7V
X-Gm-Gg: AYBFou1Fz0v7AjFY3Imc1L+EcYu9B7+QFr/4e4gR6xxucZ+bpzTmeDNe3if41Pv8dMB
	4/IDuMBFuwij43dKCyMIcp8s9nuvoLm13n75E4Cx5s+qqhcwswjDrL2Fi6P5r5N/yAZuIkGmjBu
	/zea50mKqTDt/xGnqNj8GT7THK2QhwLjZL27gE77Z8PWZ/p8Il1Fhcq0ctyais4B2CnT6JnvGxv
	/U9xqZlpfsy6y7Zp2svxjmZGhus6Wd/k/zYzSS8W+ZFTiggBx1pxT5H8eqjTVJWavGoQTt0s86a
	1w+iOaO6jWFLlLHlxN71bDrUQtcuaBSv7bkB63DmaH7dbt+my/o17UP/UY/HRwrttORYTK8CNa4
	XtSMAQCGfSCh0/nZVIFzvQHB6f3T4f9PxJygyJNYizMUbl1ir32zJ8rpLJ1XuOiezwkgUpfJs9y
	VsNAA59qEs9XG0TzgqCPC3LHKFHGItBhShfQAQ0/DRVgaZGA==
X-Received: by 2002:ac8:5c84:0:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-5598d505571mr2244351cf.9.1794435026089; Wed, 11 Nov 2026
 14:10:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-3-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-3-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Nov 2026 22:10:14 +0000
X-Gm-Features: AclHuK_l3jxTpbDz5cj0MqeD6GMw7HTTKbt-o4s7KQ1Qky5aunw_Bq-cT2pqqvA
Message-ID: <CAJuCfpHneeqRFOXyzCPPPa66xfn7Oa1n5m2N67o_pVwJfNgeXg@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:24=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> kmsan_vmap_pages_range_noflush() returns 0 when kmsan_enabled is
> false.  The unmap side does not, so it still walks the shadow and
> origin page tables even though KMSAN never installed any metadata
> there.

Note that KMSAN_WARN_ON() can reset kmsan_enabled flag, so the fact
that it's false does not mean that metadata was never installed. I
think a proper bailout should depend on CONFIG_KMSAN, not on
kmsan_enabled.

>
> Add the matching early return.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/kmsan/hooks.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index a706666db097..107f66841274 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -138,6 +138,9 @@ static unsigned long vmalloc_origin(unsigned long add=
r)
>
>  void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
>  {
> +       if (!kmsan_enabled)
> +               return;
> +
>         __vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end)=
);
>         __vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end)=
);
>         flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
> --
> 2.25.1
>
