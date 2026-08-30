Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD9C4086A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788065271; cv=pass; b=YWE6X1st1RKUvnS4eeP49xRn+z8O/EeAKzDL8Q+fJEK+ue2OMF4nEr7XArn5bQSO361KFA43Y2x+m3IeygAwBE+wDNPkm/eo0eSigcLGwxsKj/jvMa23RqdVW/1YzwZBOkVmThks9bfmAZKY9re/S85cFgB6eqANH6GYT6gFniA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788065271; c=relaxed/simple;
	bh=jU6xyHTH42NJA2Z/x13Z7rL5KlWFZSTDydAytfVrj+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bB0evu9hl1U9IvWTqDSSznMtCsrwx9R+rgU6APvof3JR6V+WezoQuxKn5yGAosb2xi6vN0yW+/I3D+cQAS8OWw1F3yQ1wiRX5nN7F2ItiM+BIaj4lnKsTO+WMVM20eVEcQvhKVUZWp+O/O4wvGKESMs1qvuwOitNPqWYS3Ifbto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtqH01iG; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtqH01iG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20237005e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788065268; cv=none;
        d=google.com; s=arc-20260327;
        b=Xqvcl07Rhgth7gxvz4UYGq4ee7V871AeOwa2gv67mXQ597TwYzbmhBRIY+gaOUg26X
         hHRL6LVgq4i6ClbJ/LvwT7Xb/zcEa/vclv4zKaO7W/DfUYCiRmYmweX2C/coEiJubwe+
         caMnqnyNJxYHMcH7YMn3B9SGJpl4OJreQiNBgKJeCFpWRHs0ZJRWpyjBszLZEAwyprzi
         F1veJtebUz4X5ymtSDr3mJx+Pw3Zr7HvPOfAWR+PR47SlJq4vk61pVLlMQ+rLpyXA/6S
         Xy7Ebu+64XqUdiG3uXl1OlOYKFlOpdUTqzUMXRiHlHOANuUoUwnfxmQkdfWSvhn8Yuax
         N4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Vc06ZNRpYBBHTvqsgy23xgxM38CjEwml45kmCyFTrw=;
        fh=Rj1WYQ/WiPfnwCOYa4VOnEkS+l7QlkLGKIzfGRgqWAY=;
        b=F5n1jvOQSdc/M/LiQaEaoZxnrz57mzYc3eM2QaJCsbkWIiBglO/2utrmd1PufyNUic
         o3I2dnjRozgNz4fK714rqMaxhn9GAR1b4zs+BYZsohSMw8We9yLvqbC7w59Ua81D6rxD
         MzuxQaBfsHwXQVNePho3ZtoH7YdBQYE5MJCgSqkW+vBV+neLO+6inmgTIZdybGnwBENX
         hArK64QlXR90hpUjcxdEiITLbFWTdklJIEW8puJc0vw4ekm8b2bnzJO3IjGYGyNh78vf
         GdDfiaHBESIGPWvsi9bzapUFhgsnbFtvxEEh/LBU/Xn8rCgSUWGlZzCYaQzXWtf2AXe8
         24Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788065268; x=1788670068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Vc06ZNRpYBBHTvqsgy23xgxM38CjEwml45kmCyFTrw=;
        b=YtqH01iGDvuiK3aOQUvM4xq3DHH5Z0x1t3PbudiQgoZFmJEa77GiM7fwDlVflm8tyx
         AzvxE4nTuGtonJzHR1puF5ZB4wXQvXH+AKMVoljBHFxeH4/z7BicfcToVaAs3Fwn3feI
         bUf08kmDXQm8yHRgwdI3g1Nu2YW9Nsky9k8TYnLBshr1AWPA7y69Xo70YEcWpkdU77H2
         tR53r6GFEUfLu4XD9Zqi5jLeveEDZkFx5fpL9zpz9VljVKsZ9f/EOFrIEqkD+pK263Ll
         m0OLEQj0NidmYzc/J28wE221Inft1Cz35AiQJIqv9Y7HPuyo8GOGVesW43Yfyn/Zj0r4
         X8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788065268; x=1788670068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Vc06ZNRpYBBHTvqsgy23xgxM38CjEwml45kmCyFTrw=;
        b=mFrG8dqqXwLzd56sEmiqubegOmpsn08XMiOfMjvzwFeA3aXR0rqmL5jLvN8VfvGjEI
         iH/E+3y5Sy9SnOwO8cqgX1jPWQFpyOhHUpMPINxKlmelKNSIAVsnMHnJX1uvKjDYSNcN
         Pmjuwwm4qOQh8W53t8Ow5IW+FPkBo1yTPGU2z/c2mGWCadyrSqtxcxyHLLCagRixp/38
         rvVh9ba+XUN7doArijQYeOAZKb4oj+LflxN/LFkqYnb4cE85/5DxM0aRMuhpdPGw5D1/
         NlghbrxAXJil5rLskj7mimJeAmeEg4qdEbpLu7e7g0BHemSDFYrbX2LsDQ3I+CgDc8Mm
         ffLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIsKzepahmj9FyilnOLAaNNRElPIYsvG4gDUMxzDBLMdqk8hNzfkQZqvJ3v9jxnosI/fLvpzdAijrhBkc=@vger.kernel.org
X-Gm-Message-State: AFuF++kILkuug/DNGREERpkGK9ecaK9cF/AC5UIinXGGmUpHsEFSs0zD
	3Z3cbJsX7Il0x/7zCBNRxXzm21HJnPukFq6OfJvv7TTlsbom7Bq1y0gf+qIQqqzEJwzGZyxn14U
	m/SjUBTXxmblHDRBeD7VK/gGOawyF+mg=
X-Gm-Gg: AR+sD128Y3Q3scCe0WT7esnEAwbvJ9VfdzRIt0iCAYESuiIWpHwAwRtg1LSNvwc2A55
	RgnGZBYXYgugkD1z1HNoof2y7rSUwFiZ05cT+c8cCR38AnXqJ4mfLeO0KT2WcLh1tSoJad5OozN
	TxCjJUimVPHBQbwASzrnZ6OQCnHfmQml9jubKtlqF/US00Uhb5VLVRy972t0rRiHmv54ZkgkZjX
	dpaMyC0qpgikeLzCMAf1flKfYGIlTPXrliOtqBEiPgzXmfLZzwkwPPe3zD+54mF7s6q5y+Dh6es
	GKGdnZflTezyKv5VRF/YW3vnjFnwF40SiERPWC6ulUADWA==
X-Received: by 2002:a05:600c:c4aa:b0:497:fecd:5b00 with SMTP id
 5b1f17b1804b1-49b91c56cccmr199584725e9.9.1788065267228; Sat, 29 Aug 2026
 21:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827234704.63163-3-baohua@kernel.org> <20260830035843.712320-1-kunwu.chan@linux.dev>
 <CAGsJ_4y0Pz2fiyhS1X4PY+D-z-o8ycSKdFar9R5PQg-o2Kd6pQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4y0Pz2fiyhS1X4PY+D-z-o8ycSKdFar9R5PQg-o2Kd6pQ@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sun, 30 Aug 2026 12:47:36 +0800
X-Gm-Features: AcwNN1X1BM3aFCDy9xWEoYq0B8egfZbvtIFbvh-Pve7EqgmNqihbqIlpuSJ_cJg
Message-ID: <CAN_Opa-zZEHoc5+7peZk0nApJ-PW4oNqy6YDomRs803o26TpUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
To: Barry Song <baohua@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, akpm@linux-foundation.org, lianux.mm@gmail.com, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	chenridong@xiaomi.com, david@kernel.org, hannes@cmpxchg.org, 
	kasong@tencent.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	ljs@kernel.org, lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 12:26=E2=80=AFPM Barry Song <baohua@kernel.org> wro=
te:
>
> On Sun, Aug 30, 2026 at 11:59=E2=80=AFAM Kunwu Chan <kunwu.chan@gmail.com=
> wrote:
> >
> > On Fri, 28 Aug 2026 07:46:59 +0800 "Barry Song (Xiaomi)" <baohua@kernel=
.org> wrote:
> >
> > > Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
> > > as it advances generations. Instead, accumulate the size changes
> > > and update lrugen->nr_pages in a batch after scanning the entire
> > > oldest generation, or when the scan stops because remaining reaches
> > > zero.
> > >
> > > Since we only move folios from the oldest generation to the second
> > > oldest generation, the active/inactive state cannot change. We can
> > > therefore skip __lru_update_size().
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > ---
> > >  mm/vmscan.c | 23 ++++++++++++++++++-----
> [...]
> > >
> > >                       if (!--remaining)
> > > -                             return false;
> > > +                             break;
> > >               }
> > > +             WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> > > +                        lrugen->nr_pages[old_gen][type][zone] - delt=
a);
> > > +             WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> > > +                        lrugen->nr_pages[target_gen][type][zone] + d=
elta);
> >
> > Hi Barry,
> >
> > One subtle point about the `remaining` handling:
> > when `remaining` reaches zero, we now `break` rather than return
> > so that the accumulated `delta` is applied before returning.
> >
> > As I understand it, this is required because `__folio_inc_gen()`
> > has already changed the generation of the scanned folios,
> > while `lrugen->nr_pages[]` is now updated only in batch.
> >
> > So the invariant is that every successful generation increment must
> > have its corresponding `delta` flushed before `inc_min_seq()` returns.
> >
> > Is this the intended accounting invariant?
>
> Yes, Kunwu, you're right. We can't return when `remaining =3D=3D 0`,
> otherwise we will miss the chance to flush the delta.
>
> So changing `return` to `break` is intentional. Another option would be
> to duplicate the code that flushes the delta and keep the `return`, but
> that would be ugly since we would have to duplicate the code below:
>

Hi Barry,

Thanks for confirming the invariant and the control flow reasoning.
The logic makes complete sense to me now.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
KunWu

>              WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
>                        lrugen->nr_pages[old_gen][type][zone] - delta);
>              WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
>                         lrugen->nr_pages[target_gen][type][zone] + delta)=
;
>
> Thanks
> Barry
