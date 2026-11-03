Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793668730;
	b=RhC24iQe99/RTWtomOPl7dSCALggk2NVK9H9YJNWDraYTPXpXx6+/eVRm/5di0iPpv+f
	 NW2rE11UHRiDn929TGg/NYP2+IV4yRMT8xNFt6i0ljVem/g/VLqCmIEkE1jbSRFBOWcJM
	 BoN7CP1scxQtCJp7MoKdQ6YW1Gf7TwjDqSVsxRyRG81kWAPlbictY0mmqskCFRBdmUxlp
	 k5+qVS1AZuWdZ3X5yABy5+9BtpymfNishIgbKJ5bVKXTZSpoF6zmYfk1PD/EjFkAzgiEZ
	 +bmhe8W4funYbsNTxZBezAAxn4F+psS9BavhTF7QZiqZKJvmZqsJ+v+fyesVqnFHUcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sT+iwkyUHg13Sji7Ja6rjIl95rvdOCDirpcyZggID1c=;
	b=sjQObw5/6e0SYqLRS3Rq4bTpxFxj2qfffYf4nVJDMu/Q1jWmTMatsOCnk2Ga50R88Uh/
	 RBuhz4ujkhyJSvUsussVUSOEcUtJe1L808qYdOpdi9Ptvwv/kFUrNfPVd5VCRKMZOMHj5
	 ZJ53oTIX6pTMIjEvfTSjstI8/Mmz6QEX58sOg9bY73NSHnTM7JMyBWhIxrQkLqBR89MUC
	 27pFzmXaXPFXl7V83+aI1Vg5SaEjBMLoau+J/zaTRL8x3L8ZSJG9EVt1oBpSJMoiQJS7F
	 UvqX5ixztkAib0KjZSts22z9NFhItgX7ktzjlQrN8nsmIr7XOvMqxkWSRdph99r9s7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oq4CYFX1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AB606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D9AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oq4CYFX1
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b09e07e149so29644797b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793668729; cv=none;
        d=google.com; s=arc-20260327;
        b=Tn2tIm+jEu6a4DSitmkj0FU1r0j+7VobMZWKdpEVu8w8IgjvfzE+l0RlLRZklZBem6
         uUvu/xyuWOudHRAfzFk9EbqjPHTiLEHKtsuZQQLXRO693LgSCDwvNd0nfvBIgpENp8tG
         EdBD6WclH5+7dp1wkTsJ21ZY3TmoAeuSrrzyKr9MR6ccP0xda7ftLGhgr3KiUiUCz9fa
         eHjRzER6VZ+hE7m+Tye6WrY5mmxJijsT6LH2uB5GUIG/9oStDHAfCqfcUXhtJaMIc0Ox
         +iYwMK+4rCGwjvqioD+KM2eEmrzw8OPJUjOyKEax0nM/o5DZsfqCJZxGwmRtliT4A9KS
         Op3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sT+iwkyUHg13Sji7Ja6rjIl95rvdOCDirpcyZggID1c=;
        fh=OuhV1JkAZwxgwNjzcJ2rTJfO77miRSYJCmR1kLdoPBM=;
        b=BWxf3I3L1NhQWBTr4KO/WEnf0JLkwCS2jN4axmKoa148ucFUGDK4Kb0oJByy5HXfer
         I8yUyv0ArcRTSALfNT2I/R85bKiyyZ1UcfjV6fbKbQwXuv2npCEwD/v/sHNGNPX/HZRZ
         qC3Q8mv7VpborwpqBAE+/gOLNUHTLN+g1Jz3npIfkXUUdXQ28zKZVa8ctalGxhxVYohe
         ALpaGRfLKD6VUB77+Rz4xyAoxSUR6dgqNYHN7qAHzkjFFQBNVCuEQIIVIzjrlZ/QPIY5
         vKp2BTTbrqls+aWPhienIfNVaLpwxwcE4LyK7gDdgEKQVJHSvDI4l1k5eEclbXxkg9RB
         9HqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668729; x=1794273529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sT+iwkyUHg13Sji7Ja6rjIl95rvdOCDirpcyZggID1c=;
        b=oq4CYFX1+HofICn9wiVdLbtZyUK0/oHaJg0cj8uuonBwEy60SIZBgFL8Y1JavMIacN
         ZEuFHb5wRYyPuqVW03gP2XFy+D9nP+TYMAFWNYzsKyMffGYQokvNfmwVNg4PgUruJw+S
         WTvXijOrviUUSt38Ihg2NBkDwaI1Lw4tkyIiHhZZxELVB6ZajU+RuMIqjN5EaNFlVTxS
         7hZvaMsnwjRWa0kKXsMseTllzSF/pqUMKS0UixgGLJUh9GFVYzvTaQ1C73YWif1jyuzq
         zRQC6oSY3hifAMiG1/JzLJ/oDEc+hKEr04iJZKa/jy+FtBHNZYu3DdGPy/9j8UC6HS5d
         +GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668729; x=1794273529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sT+iwkyUHg13Sji7Ja6rjIl95rvdOCDirpcyZggID1c=;
        b=2oit6T3p9dZz7usZEPU5OKgbCPVED/x74pYJOUj3Ld6QLYIctjoSsiay6bbCGAg/X0
         Q1M/+Wk3d3xe513qkDNZc+m7hHqq/KFRYTJpouoQ9ewX4yFK2h/vMzK3510ZyxNIGGEm
         /6Q1O19mo9fOiK/6Tza55fwWQxup4pHhRlrkWa4cYkHuNsuvapjlWvWuGvcScMqwlDat
         Dn5XY2jGGoiQEwKmC6fTI/Qlb/FBFUsQSWfCHfydXRaGYd9kdde5szVJUSQ2W1RafSJI
         3uxZtZPZm8G96nhntfHJN7LYgob+f+NkOODYl2WMrW2nID59d+sY7D1eh1qe5hjcPBA4
         AsHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx58eB/tEQg0X5e1i8Wo3bxgrXLS1Z22bD6/RiDp/tLfnfvUGJImteLOR5QayfyVDRjUksmp7rubAziuUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VusdfQeSzcJZdE+gWi43FufvYEcP+K1oi6b/e68xZTr7/f2k8
	acBAMqamWTYCnAg8wCBIAJEYayJj12rv3xLb1wI6bnPNg3JrmccWopCXzqpnBHfftN+VYXWSFEU
	/8sRX84TMaaM+BRbJ64nhVmQamctdtuw=
X-Gm-Gg: AYBFou0+ABiRCE3jbrxbwpnkSrYAFqoPOc+82twOzlhQK7BThDqk8NMbzCcjcYiFcCf
	pLW/+u8pfuo5dz7yBCoJ9xIB+9Vl5sxGpqc1+9B1CjOWLlXQlmRaRw05s9S4F5RFoVH5RQaACTY
	u6UGAW3JOdyi4vwkIy7gUUO25rz+XrylV1321ZFTkwcAlkx4eEbnfTEmFCjXcmZKUusyF0FBywF
	YUHkYmM0byLvG0nQ/54OFQ7ePXbRZu0o+ph0Ap7zAcqx6JHoOfxFhmMJoEFZJx90U8wHoi2gu9F
	IPC5g9frFhhzp589R20/95RfIBNoXGGcaQcQXtgK04XESTyu+M4mcCfPqPd5bt1kkKm3a1gkiLB
	j5ROByEbPZgpUn2njKm7G4ERbO2O0fQouPoPzkxbcE+Q2JJpt2W1ttHgWPwJgwvqSuyZsgdZUgH
	hDtbhNUn/g+RL/BfbOAIjwn86uadX9IOhvW7uNKi9FOxVXR/EhLKbZa1b6kQacSybkhYorSHAFk
	Wi0CVc=
X-Received: by 2002:a05:690c:e147:10b0:8b1:567c:e7ae with SMTP id
 00721157ae682-8b2b67233f6mr47961067b3.47.1793668729285; Mon, 02 Nov 2026
 17:18:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026202313.63122-1-sidchintamaneni@gmail.com>
 <20261026202313.63122-3-sidchintamaneni@gmail.com> <CAGsJ_4zGmtvOApjFH_-V9z_zNWWQnrBX9q0_iWtbqzENCetfgw@mail.gmail.com>
 <CAE5sdEhVfFuiYySA0cNPTV6FjY3wnwccfLR7HA9vhVOF7DH+_g@mail.gmail.com> <CAGsJ_4wHywBK9iYAzH8DY2KMFO-9oGa0f9N8aLUtzNNv6j3C5g@mail.gmail.com>
In-Reply-To: <CAGsJ_4wHywBK9iYAzH8DY2KMFO-9oGa0f9N8aLUtzNNv6j3C5g@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 2 Nov 2026 17:18:37 -0800
X-Gm-Features: AclHuK8YPGhiAk2Gjr5YusW-Wxb9ms2GlXj1s1TmR61RHXjCn8KMInnrW2kxE7o
Message-ID: <CAE5sdEjnhXK9jL03grhro-_jKWnd0rCFn_pN6SrFNzt8yngCLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: remove get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026 at 16:20, Barry Song <baohua@kernel.org> wrote:
>
> On Tue, Nov 3, 2026 at 7:35=E2=80=AFAM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > On Mon, 2 Nov 2026 at 14:56, Barry Song <baohua@kernel.org> wrote:
> > >
> > > On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Siddharth Chintamaneni
> > > <sidchintamaneni@gmail.com> wrote:
> > > >
> > > > get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
> > > > multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
> > > > uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`=
).
> > > > After commit 09f49dca570a ("mm: handle uninitialized numa nodes
> > > > gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NU=
LL
> > > > checks on NODE_DATA()"), that NULL check was removed, leaving
> > > > get_lruvec() as a thin wrapper around mem_cgroup_lruvec().
> > > >
> > > > Remove get_lruvec() and call mem_cgroup_lruvec() directly at all ca=
ll
> > > > sites.
> > > >
> > > > Suggested-by: Barry Song <baohua@kernel.org>
> > > > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > > > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > > > ---
> > >
> > > It's great to see the MGLRU-specific get_lruvec() gone. Thanks!
> > > Hopefully, we can get rid of more MGLRU-specific code,
> > > such as get_swappiness().
> > >
> >
> > I just looked into removing get_swappiness() in favor of its LRU varian=
t
> > (sc_swappiness()). Do you mean moving the additional conditionals
> > directly into the callsites?
>
> Nop. In MGLRU, swappiness has values: 0, 1=E2=80=93200,
> and 201.
>
> With swappiness=3D0, MGLRU only reclaims file pages and
> doesn't care about the hotness of anon pages.
>
> With swappiness=3D201, MGLRU only reclaims anon pages and
> doesn't care about the hotness of file pages.
>
> In both cases, we allow cold/hot inversions in
> inc_min_seq(), which can help reduce CPU usage:
>
> static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
> {
>
>         /* For file type, skip the check if swappiness is anon only */
>         if (type && (swappiness =3D=3D SWAPPINESS_ANON_ONLY))
>                 goto done;
>
>         /* For anon type, skip the check if swappiness is zero (file only=
) */
>         if (!type && !swappiness)
>                 goto done;
>        ...
> }
>

Interesting!

> Then we could have cases where swappiness is 1 ~ 200, but
> we still cannot reclaim anon due to:
>
> 1. Swap is full, or the memcg's swap quota is exhausted.
>
> 2. The allocation uses GFP_NOIO, but the swap cache is low
> [1].
>
> So right now, we have to hack get_swappiness() to return 0
> to ensure that reclaim only happens on file pages, or we at
> least need to hack reclamation path to use swappiness=3D0.
>
> This is quite bad, as it can cause cold/hot inversions for
> anon pages. I believe this is already a bug in the current
> get_swappiness() implementation when swap is full.
>
> Ideally, swappiness values from 1 to 200 and the reclaimable
> type should be orthogonal; they should not be coupled.
>
> In other words, we shouldn't need to force swappiness=3D0 to
> reclaim only file pages. If swappiness is set to 60, it
> should remain 60 across all MGLRU reclaim paths. The
> reclaimable type should be handled separately, without
> forcing swappiness to 0 and introducing confusion and bugs.
>

This is more involved than I initially thought. Let me play around
with it a bit and come back.
If you have any suggestions with experiments that I could run to get a
good understanding on this problem, let me know.

> [1] https://lore.kernel.org/linux-mm/179248830836.1744016.842421781128661=
6919.noio-mglru-rfc-v2@bytedance.com/
>
> Best,
> Barry
