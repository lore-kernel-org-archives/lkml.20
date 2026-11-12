Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443463;
	b=bJlBfuXADw5f/mD0hUaEJCCpQsrloZOnE3H5S77DqH+AmKvHKZn79ApYsH3KhIb8PnCX
	 C9N5UiUpiOFCBQaVjk3SSPRDHGB0HlF4TNM6XiCUWaDZBOHR2zsm2TYkuILZlZJp8KZSI
	 DG/1f+Hx+0fwsHLIPyoG3TiEzc29niKv+mvICnFrb5AaFSDTZZagDV7dq4cPQNoSpEER2
	 5dNkgsc0uAPVCDFNhdAuEOqn8Hz3sKPX3NxYviKDI7fAhbEYwegvWmynSoHGm6N4Zqc1i
	 FS4BaJiTLlGjyBbeIVxF+Iz/Z35YR21FsO1kCux37ksXf4r/7yyKs1ji6b0B6/1xHMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6u9+23TRytDuYgPE46LNdROZdeRwOWR2OfnIkWa60H4=;
	b=S/H2wYdNImha557GYLc+eIN8Iz+NYE7EurMnujo4+R8v3ZqfIVTR5VuUKorZXVrruW6x
	 0Xi7TjZTPcZHF/05szmFs6wxZqOe0odcYb6PBtANjpkBCIenmUIjYr40f+9bqEVwARNnd
	 ZbtBqBBIdloqr1ezW3YSD3Pk5OmcKqw7IkR3fYX+InQoTXbulafz/3XKku6477/eAUDYy
	 hSVvljDGXt7CJ8O+kFEgyyGSWM9CDOhVARui2l5E4RHXI9hJ7gPiW1fIy1G/HsNMxjIUN
	 3aPSQpLIM0ado0IP5ozyqSCP9mZ46m1dXmYgJSwuatT77u7PA1O73RBuPP+aX1PU9MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cS4gU5v+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA8606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EECA8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cS4gU5v+
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-54492d8a988so56261cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794443462; cv=none;
        d=google.com; s=arc-20260327;
        b=J1ACmLXxTIZcK16kDliOlObDBdmVrhwcHyIHTH//NdLMTM8UM3OShdFvG8v3UZcGQp
         0SAc9NgnoCwevcFxcYpW/KXnHPPuAJ46WIhNev96aN24C2MVxA2hi/bzJfs88fje4Qae
         WcU0Qd7r+qd+gqpN7hC78Luy019QGXXy8iDMorQoK8n9fFXZf/nzZ5qeC5kWvw8vS7nk
         0iKb6XY9UoRZUyh0gXoq+8yVqddfexyecs6UZdDtyTIdlISO97l3MHXyirvf5f65IRmH
         u2J++hKcgTo+tmMQeHMb74uFc9jfEXKte/MhSgTtM1DwNi79MvSUY9OcdeaNOyOeTrUB
         /+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6u9+23TRytDuYgPE46LNdROZdeRwOWR2OfnIkWa60H4=;
        fh=+JW9xGB8O/gqfnwSszVh7nOUiKLDhfYfEvkMqxMnBVY=;
        b=bliRktz8UNREvESB+7OwoVD8FLUNWS8akks8zBjBLnKVxiPHEg1kDicCWb7nHZIKSD
         IlKoLpAMet9lA+mULD/E/QmXZlAJLCestgLdZekvk7YbePHBnP6CyQSvwEiEK94O1MUb
         DudLZRVKeZvDh+6c6ivAWH3vAf272p6iriy2c8w01i54h7anCFC5wbt72fV+35O8mRzh
         LqIWdF/IUrM9l1iHiFxzxiBjugKezlWfd2r9F0Lg3LXWzlcQ4pdUoeq92lQskts5g6dt
         Ck6Bj6oQtmvhhi+uoUHHV2c7C3vh5wXx/XF9MMVpi8iH6TELaBR/PKtiGGELk6S02fo1
         OVjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794443462; x=1795048262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6u9+23TRytDuYgPE46LNdROZdeRwOWR2OfnIkWa60H4=;
        b=cS4gU5v+O0TyZ1iDsVOtlQPiiTgDg/CwQKTT1OLq6TOJA2Y+KOUSdNfb5KYZ2pe/EE
         GQLpwzkB786Fr6MhN8cnUtGZbeeeaHYCWhfUPYHd7PtdNU3+ejbdad6ykF7c273UyzFS
         BQ/AOLaWA4jBO2PuVvyuDQ9Gr+NZNJdXRvFehLRFeaBScogrkP7J1S/R26dfZ9VVql52
         UNbpNLm9T4zRf0UCzAj/Wx/6QX5MOLSVNd4BTiQmjJscdvf8BiL3EEuiCy9TApXMTiNn
         0fbdUBtXFIehB/Ypd2JEVb1KjbFqh8Y+WNV1a5f366g3UFr4eQVBG4pxSOw+TNw4RVLj
         GBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443462; x=1795048262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6u9+23TRytDuYgPE46LNdROZdeRwOWR2OfnIkWa60H4=;
        b=mVmOts1P49/ihQDySvJSqCLOwv+AsP2jfkjXkre7R90aqTH2ZBgTI6orVz5aLbmOkq
         zl1HVFUeI4EgPacTf1ayuH6VIfXxV5UYTJzKVitDoConWORFXfLeSQYwJ4tf9Vd8qa6D
         Et9+p38rggadOPTWLIQhYvmup5Wfa84LX31JY5RlgccpkuiTbUpkGgA+lpX8atqOysor
         G6W+6s40aDfBXRGSR+u54T6i//b7NwP9JWcB45K3SUAoZzy7m08pEpskY+2wDaTVBeFI
         AkAFRvdy31Bw57TLSLVZwD1R/t7d7OxHxm/AkuXxuVXqAzilSMW0FJzQLmJLriIUvrGN
         CQyA==
X-Forwarded-Encrypted: i=1; AL+hErEw7rBwCPWwnVY2E2v/iGE3+YRbjr8rv0MFcfkws6t6LCM2xt0RYmSp3Zg2fRKrjEfdIsfUxsSbikbt9pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RxJVigL/jg6oMda0VANx6GtMDkAibMBIlD24POEXbvBBtT3nu
	5SCSBc64UOuHPG88LbY/PGeuu3KfPVaGPy49Z+yMjg6OkbTGRzhwUnziUAzp+Sy6UyxDQv29wEQ
	NiIdvuTS0dalvUNGolkROpCxeNJUW2LyZKWSVtSVS
X-Gm-Gg: AYBFou3Q0lB59HLxalg2nRzJRnfEi0leXs4a073VQfi/4GTj1TRfTSBvDNtnyjD67R4
	9LuI0+lyhp2EZK+0h6yJpO289wFvwF9v+QHWLuYX4dE+iZR0H35VTP+FzacxVw0ypiv9HukQTAd
	bHsc3ORMdQW1baomi1B16DO4NorQT+61LsiV7H/svcbYh9+6Rpri3pZZm0/Z7M9KOjfH2GlnkDj
	K/XuJt1M1o6ac+3PyfUOqGIfUH7WL2B11ub61FUwK0vP72+OzcAXskV4aOxGw8VFFTawwMUCkfY
	D/kTmbdjsy52OXpXNi0v50bjdiqi7HpsWshw6unN/urOOQmp4lQxRUwD4ESUAwDKb8OmGjo2Bro
	4IS+Atcvr/T6fH04OQSF2CPQyizRWXJuMAeDrLMkog11KGiOURPe0FV16ReA6RFCmjuHp5LJap+
	2qeSBn8badDKy/dBDxFmGU3auS
X-Received: by 2002:a05:622a:5597:b0:536:6d88:600a with SMTP id
 d75a77b69052e-5598fa68ba7mr5286631cf.9.1794443461135; Wed, 11 Nov 2026
 16:31:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-7-hao.ge@linux.dev>
In-Reply-To: <20261110112546.261415-7-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 00:30:49 +0000
X-Gm-Features: AclHuK8yVOU0rM_Krxb68wuVhwe9clhKmxqaCwvxpYiiXo0gID9uClDW_ZDomNY
Message-ID: <CAJuCfpHReBDoXj_U3Dy2hksj63KyHNBm4gS+wtR_ywidyJ8mfw@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] mm/vmalloc: only flush the cache after the vmap succeeded
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

On Tue, Nov 10, 2026 at 11:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> vmap_page_range() and __vmap_pages_range() call flush_cache_vmap()

New vmap_pages_range_batched() function has the same issue, so needs fixing=
 too.

> before they even look at the error code. A failed mapping is never
> used, so the flush is pointless at best.
>
> According to the Sashiko review it is worse than pointless on UML:
> flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
> PTEs into the host OS. Flushing a half-installed mapping therefore
> leaves host mappings behind for a range that was just freed again.
>
> Only flush when the mapping, and for vmap_page_range() also the KMSAN
> metadata, is fully set up.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0565cbfe325c..3f98056f8c7e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -369,10 +369,12 @@ int vmap_page_range(unsigned long addr, unsigned lo=
ng end,
>
>         err =3D vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>                                  ioremap_max_page_shift);
> -       flush_cache_vmap(addr, end);
>         if (!err)
>                 err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
>                                                ioremap_max_page_shift);
> +       if (!err)
> +               flush_cache_vmap(addr, end);
> +
>         return err;
>  }
>
> @@ -758,7 +760,9 @@ static int __vmap_pages_range(unsigned long addr, uns=
igned long end,
>         int err;
>
>         err =3D vmap_pages_range_noflush(addr, end, prot, pages, page_shi=
ft, gfp_mask);
> -       flush_cache_vmap(addr, end);
> +       if (!err)
> +               flush_cache_vmap(addr, end);
> +
>         return err;
>  }
>
> --
> 2.25.1
>
