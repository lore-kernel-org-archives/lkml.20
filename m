Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BB7357CFC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673814; cv=pass; b=IbZNWlRNXJoPxFITzRZ0Xhcx8iZQLR4v9xPxtQwKxIlyDFm6LeexogHs6b5XzWMX36s8K1lCbSvSrZ8Z/izF+T4srL1K3fBut9nK2uGLTCqqOTZyBbbB9rSQ4RFMZFkstTiPf0TEbQw/jNdaPAJ2ZbejjKiZTt/pQXz6qNLGA4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673814; c=relaxed/simple;
	bh=QksvSwE46C4aLnRKBD5jKRd87c2ZI2evbemTEctD7D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQoY4Kot0H8MMh4Iqv//UE6zQBppRTKYW02eWNglp4x9mw8g1bGJJBxCnfjTwNra+9RZSMV3/fKSVMHPw93xOaBIA2ZJ+0AaPnjYtlHiZt86ViLi4PPD3V/zqIyWY4wP6pfYDtB/8EYD859sBsshzVSQfOaO8HO1cxOauoXGF3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqOJz/Ku; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqOJz/Ku"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso3284669a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 22:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788673808; cv=none;
        d=google.com; s=arc-20260327;
        b=Bd0eYyL1gA0t2ivR4qZk7lJnrXwYsAj4FylvrbdKD/STXTGWcNJir3Z590ND/2C6E3
         K3P7SLBVUTWHGxfNqFtjFSiZzhnHSEoPsbX6QKZdUsZBcUxuE8KferZ64+qMZy6uX+ea
         11H0uknreUCEWSknd44rzm82OFZ39Nilab5yqiO4ujuFwojLIZnXcxzbus4zXwsab7m8
         R2KX+FUphjmBA0mypspDTDB7OcslGUGobMYsTmCo8yLF0NXACIlbxMzq3QzsIHmS1sFr
         069IFONNyF4JinN5tk3nyw8JxWE+8a2vMlzdKCP+Zl6gNtlsMAeeLGC/AZfjbdRdmiPH
         TE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlSLw0+YBIY2ITDImKVN6Gu2ov4yl998ZNhFCSCffxQ=;
        fh=jR2xef5MWJuxXRHUxkWqPJAkSTCQ+jPNHNLBSwD5UOc=;
        b=KkwcSvgKG6vzB7YC+vdiHXX8xlXyv64Wkk7e6O/Kk6gKu3drXfiMIOVpbKkqMsYjmA
         XJNwWk/3NsbOVGGxhwvpDNHdFaM07ZHDsUzuud0sVvglRWCvPok1qN8u2N7ZkGFj4bDd
         0tNi5hDv+5XMFvT+1nKheCy0b9PhVD7AEC2fNHpjOnko9CjPWlrID52TgzWBScH41a+F
         jLXeBx+wfzDStNeWd7d/Q3FUGA0K7JzeJSYOZPOBINcTHz3gF1s9OMlSiugQVUde2X+J
         d4SBnVdKHKsQo4fH2q2QyVo5sWzjKuQm+FC7DtwXzBvRxrdFVGyi3vuqbY8uxJhaZ935
         7VoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788673808; x=1789278608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlSLw0+YBIY2ITDImKVN6Gu2ov4yl998ZNhFCSCffxQ=;
        b=sqOJz/KuxwlZwl+1ngO0ue7F7cjQaqnNcLdeZbBsSFoquKdvZqWL3LvdZLkNk73xCY
         0cXRI3sO0X3jQHaGiD/9bZhWlXVo343aaCKtFTdbbA9sUEvQUwO3du3m/PKVC3kYvmC+
         Mq/OKqx7YE2K+U+GQ6ooKtifyzQsOZLWxhZjkoewO2hPBUafhwUzNxolILEamP2N7TSI
         hzXB4CWbXDEB40bzTNO2HZ/z8LRF5+Hj1rCzHkbXizs65dPTqmtsnmGYAoYwjG4N/Pwo
         Wv69KDRjDKAQAwmGOKBc1hwg5dxahj8lKUrKi4n4itQoVePYEYWhMloxNvJ5EwekzHi8
         VDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788673808; x=1789278608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlSLw0+YBIY2ITDImKVN6Gu2ov4yl998ZNhFCSCffxQ=;
        b=bLz/HCRLK4F37RG0omJ6SzQ6OGUUwP4zF40Pcem3rsKoPILqH9itzTWr0bGKrTojTU
         kcgaHcl3lPLTWKr+QduyiuFLssu+hLUjrcUEGUkXBnisjTzgThe0GVoBv+SmSNnn6J7b
         ndlB6sg0EqTNrcwXydEdAW090tR7uIcHXOQC3I53VqUU76OyqKh4Vw7BYeEOK82vTryY
         dDtGDsBUGvQ7DvLM/VUAwYKNX3AHF6x4z9ddyDZzrMNnB8lrTT2F5FSI52AknGQjpu+e
         EBcUVZvFDDL7D3YWMYde11vTvS5Ym1Ss0z3hKYPSoWPrzdRlYf86+rQm4sn52fwQU5la
         6PIA==
X-Forwarded-Encrypted: i=1; AKwUvByP5WYJEn6D3AQNbuZD4776W3+P/VNsAgTQUNv3xyaIyyr5VlEPQ75inDsnY18v7APJYgDBEFtaKtFPnh0=@vger.kernel.org
X-Gm-Message-State: AFuF++k2+jpQft9B+gWzMky94VwpNF6sd16uos0pxqA/C7LLiIgKJpUN
	QEYfq8+XW2MvTr+2yzUvUmt6KCmPAYAKQOSmVrBjKlX+LGB701iwqEjQKu5ZJ/1MtXQm2j1GWVy
	q+7o7W2e9r7tX6FRv+wvrLk0GsWeiyCK6fAIZfdmr1w==
X-Gm-Gg: AYBFou2xM26HfMGlDI4K/F8Tbm6g4gco0ivRGVLIXfsbZf+JPcTeMp5KEC4tmlLDjzA
	9sTaWWblBaawHpDArrcuS+NIvTFJpBEVG1QqbPG4spQbg1iguXPKzYMN6qr/+1E3YtKpI/LAzuP
	N2AkW36foOFxfNpAHLswcn+E7yEWii4KRlXQdyzmocxYXsgRI+yDREvk20LUSvDfDbRF8SzyZIj
	AXF04+KtoeRwu1Ihvp9zxWvnOn9wZ2NCIekqBfxf7jKe5si76WhZdUXT3lqpC51C4mOUipyaLMQ
	1FVg4Py2xobSotMT8mR15WfeMFbTi0bJAM2Qk8IpBHejaXTFmPS/4q1kB0xLTeUgg4Opy4PiRWF
	QAg==
X-Received: by 2002:a17:907:970f:b0:c25:4b3e:ff24 with SMTP id
 a640c23a62f3a-c260c8d8077mr500163166b.10.1788673808156; Sat, 05 Sep 2026
 22:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
 <20260906011820.382381-1-zhangbo56@xiaomi.com> <CAGsJ_4wC78QDTrETC0WpnouN=8aF8ae6Yxgb+oKiOP3A76ATLg@mail.gmail.com>
In-Reply-To: <CAGsJ_4wC78QDTrETC0WpnouN=8aF8ae6Yxgb+oKiOP3A76ATLg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 6 Sep 2026 13:49:30 +0800
X-Gm-Features: AcwNN1W3d0Og_zgj_zuXYW_3ipFK3L8APnvEnnR3uGPVN-t0sokfY9kP47fq6Ys
Message-ID: <CAMgjq7B==MqHXa6H=arrQ9a0bUXWpXG_a5EBxZGjLjYUuEf1gQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
To: Barry Song <baohua@kernel.org>
Cc: Bo Zhang <zhangbo0325@gmail.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org, 
	mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:56=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Sun, Sep 6, 2026 at 9:18=E2=80=AFAM Bo Zhang <zhangbo0325@gmail.com> w=
rote:
> >
> > We have observed some cases where memory is allocated with GFP_NOIO, so
> > we cannot reclaim any anon folios unless they are in swapcache. We can
> > end up spending more than 150 ms looping in `shrink_folio_list()` scann=
ing
> > non-swapcache folios without reclaiming a single folio. This is pure
> > overhead.
> >
> > This is particularly true on systems using zRAM, where swapcache is
> > relatively rare. So let's check whether anon reclaim is allowed by
> > GFP_IO and whether there is enough swapcache to make it worthwhile. If
> > the swapcache is extremely low, we're essentially searching for a
> > needle in a haystack, so let's avoid scanning anon in the first place.
> >
> > On Android this is triggered by dm-verity hash-block reads through
> > dm-bufio, which use GFP_NOIO:
> >
> >   verity_verify_io -> verity_hash_for_block -> verity_verify_level
> >     -> dm_bufio_read_with_ioprio -> new_read -> __bufio_new
> >       -> alloc_buffer
> >          gfp: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWAR=
N
> >
> > Such a reclaimer can land on a memcg with a large, unswapped anon LRU a=
nd
> > a tiny file LRU (e.g. inactive_anon ~335 MB vs inactive_file ~4 MB, wit=
h
> > negligible swapcache). shrink_lruvec() then keeps feeding that huge ano=
n
> > list into shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,00=
0
> > anon folios scanned - where every folio is kept because it needs IO. Th=
e
> > 150+ ms above is one such single shrink_lruvec() pass (not accumulated
> > across a reclaim cycle), and it reclaims nothing; the actual progress
> > comes entirely from the file side.
> >
> > Aging anon alongside file does have some value for a later __GFP_IO
> > reclaimer, so it is not strictly pure overhead. But that aging is only
> > deferred, not lost: kswapd and other __GFP_IO reclaimers still walk and
> > age anon. Spending ~168 ms aging memory that this context cannot reclai=
m
> > is not a worthwhile trade-off in a latency-sensitive path.
> >
> > To stay conservative, this only skips anon when the swapcache is really
> > tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on th=
e
> > list can be reclaimed without IO. Whenever there is a meaningful amount=
 of
> > swapcached anon, the normal path is used and anon is scanned and aged a=
s
> > before.
>
> I notice this only fixes the active/inactive LRU case. To address the
> MGLRU case, it seems we may need a more fundamental change.

It won't be too hard if we just calculate the type and number to scan
upfront, and I believe this is a similar issue due to the same root
cause of the OOM and swappiness issue of MGLRU, which I mentiones
before (see point 4, "force protection of the youngest two gens"):
https://lore.kernel.org/linux-mm/CAMgjq7BoekNjg-Ra3C8M7=3D8=3D75su38w=3DHD7=
82T5E_cxyeCeH_g@mail.gmail.com/

Removing that force protection and calculate the number to scan
upfront, then we can also make use of can_reclaim_anon_pages, shift
all scan budget to file type. Aging won't be triggered at default
priority, resulting in zero overhead. We can then either offload aging
to a worker or defer it if aging isn't helpful for one reclaim cycle.
