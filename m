Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB54DCB29
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419911; cv=pass; b=Pvzj1XMQV8ebmPmtrEp72SDqKNQpxHyM3jmA6Q7h0XiSkAATQ3ytqIVPn6nxZElO3vTHA8QC4wRkTZBa9pzPYkSdXhnDz3Rb8+S6ijGk76FugKdztiIW+0e6MJK4wLn2RxLrMtoVglx/gyLnUGhC5FnddXRFXMaVmtkWY8gSmfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419911; c=relaxed/simple;
	bh=6FPHXzxOfaEvuVnHK1AKn0tEnzGm7yA7ItjkggCP3w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpvCdrbRrtUyv6Xbh00hLJnTGsXbsqojiXojUub9/OShxLrgYjT5TXBRoGY9AjeX9Q6Xfxwq1W7UO903nSDIFmPu9Rv7OO2N4pkkHrCFex9DFoV/lDFdirvsRCQBNtnyxhVXF0Hyih/Sjy/Itr2pa/Qc9Ar0tf7zOIw5dHk2P44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKtg/Ky8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iLji+4HS; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKtg/Ky8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iLji+4HS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792419908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
	b=SKtg/Ky8hhSqQWZZC70Dii/bKDBmLTQdOKcMZBjxQTA828Yb4ipi6yJ6H55OLrOS7+t+9c
	6ZYgAP2p7QbAdy88FL+3Qa8CDYzriABLc6hwffkbQLU9XPzMwrp9OO3CIGGZq9Wf2V57vm
	OniOr9nb0Qw9CYgIPlG644DqOHRCm+A=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-Qzc6sRg1Ne-YFvNuCCOk9g-1; Mon, 19 Oct 2026 14:25:07 +0000
X-MC-Unique: Qzc6sRg1Ne-YFvNuCCOk9g-1
X-Mimecast-MFC-AGG-ID: Qzc6sRg1Ne-YFvNuCCOk9g_1792419906
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab39e6e817so5261181fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792419906; cv=none;
        d=google.com; s=arc-20260327;
        b=aAA2TXXNE2aj2NsM/7FbAHGKsXXacBQX7sLeq1SRxPFc3wVxbLbTc2ckEhYW5U9Ppi
         +Z7IdFcFp4yJQHoyLwewJsgasy/gLTR32x67uLoExQQVvMk5t+xy/7fFEzeyl6go2rpf
         e1k1ovF3xdRZ/ESGGzAPTZG1mopi1JTKkMdk5nmqXocdDYmkETX0u79nxs6RslVXIe52
         qOpP/cYec2gX4MC2TPL1BrUvqh0oft7u8VNxicQmGS9hgDesv7B/rdbb1W2zWps3oEnT
         cpGaKQWRA6Wy+V+8teKsEw1oyyE7zuRdyaOTntP5VpMpVVLZplgw71Ar7bMH0nx/TseV
         2rCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
        fh=3H9c1EwywT8/Iol1LLs9Uvp5Vv6FjvAfAi32d5eweo0=;
        b=jlX7JawRiXiLRJjgJUohcw9VT2bi/obEvMUy9lunpnSIMtC1/mbEc2BPM3ifybVNNc
         DcmxJ6t4XUpDnoe/ZqSivjWWPruHHRyIPEmRa0244hVXcUE7na1mhkNKOWe4dhTWCVOg
         GpR+luZh1XtWwe4LvDHf3BN9Stt2wkbxamVXomV0tRUZf2BMndFD/OiBJflV1FiJ/YN3
         ZQQeTX3al6yTDNI7ndsl2Ep5SuJuCbSaTC/coLTQcuoW47GbCO3/hf9gEnay3sHG4XMU
         FDFeX0Y9oYW7JB7DF+vZf2wCEdMUk7fz7Jx2huiukYRPMzMnWE6b8vs63fnQVstKL+sV
         U61w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792419906; x=1793024706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
        b=iLji+4HSRtF7J18SYHMX/Two+5QP/f/UA6qiW1t2jjXQFN/8F04ye915ucsE5OOk3C
         gxBjOwVuW29y1m4DZpYtc5KLyK8NENguBx/8/fQLSZ97s1jokMTS0Evx16RXJmQ98Lo2
         VyhyEyIadbFfMjJYNU7NP+S4shdDBIqnmMNLvnFr6ZwFyJWiUGQbTmfuwMC9zo0XXtP9
         KH9sN/Rla2cR28UdAVe3Vt5wKxRj31cEobEBwkrfXuJV9NFGy7wqGvSZi5e6uUMkIgHT
         5J7DTYYFzyk8sJW1ci0p0KnmbS+EYaoAhJOLEi9vPUZfRJTLjScWdrmhgCLkJXJkWkBB
         uDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419906; x=1793024706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+XXPCAKR9i1PdeuwWGGQvHpwQuIulYAqTmpYB26s6s=;
        b=vpq8jY0TcuFwCjl/nRQy6bMuRwEP8XJW81YX11sE5w21Odv4EKTRUz4SR/uw8H3DI0
         8yOxOqtM5mJduXNADlx2j3maFRbzlBliUkl9cvhnAJ7geYkKYt3i8/JCE2OGEwkPkEQE
         XiPOnfKggvWr+KsZINQOORak2MHCOy8A7im6OORIsDa9DV/C/IrFxXgmRskXXEdo4w+P
         bQE5cN5zfhFcClq6rLt4rYm/8boPvmQrGCGCk5EVd9fWDWJWHURQqTZp2X2WRD+96PE5
         HnTgQs3vgb/CZFIx62zkAnnFjgwcct/Ls7fRFy+moB1rzj8RlCdIZgn0GKrfjGK5E1Sm
         Mw6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwoj0sVthyp8/edZCgYkRfbj+lqUvWx6g8W+vhxsn+ybGL2SbUDQ6GDpZkCakrCHFhBN32ho/E+xNRa8sw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy7LD87fs7H6BC8Gn3F0nhk4HwqJrtRwrz5GHMw5yydWdnvdH6
	H6xhdNHDUUm/AMjyJ7oJkdpIMK2MMbVw+kVnaeyClq4w44XwZy4BxeA+vXPD2y37jEftbbqYCPB
	SX5/SD8roRbP5iz6udS7igRKKvdC5rUFuSxvArHeQTT/5k0GuF2Jwsu+GETcyQX6TnFcqMjvn/6
	jxJroVz5Qn5knQ7EBFGAHHwDIjtNgmNVdvRKT+MZoa
X-Gm-Gg: AYBFou0hpNxj/vpIW+77Qe6U14iTL/msXdpoBSqRR4HxaHSPwg1cU0CrZJpaXeZoSw1
	Vg/8DeXbJ3bRv2nv34X46QVPEwwAwHewpPy2XNSd/uJj9hTByRg7c+HZ2QEsVLP9TEm72UFV5Nd
	lW2dmrrF5tImtxaikomK6OmF9lmLNrbtOiRoXbhZWqMvQ2i+RT4csLPkazitYEXfguGWQMV7o=
X-Received: by 2002:a2e:be8d:0:b0:3a6:48ce:2b05 with SMTP id 38308e7fff4ca-3ab293008d2mr20364721fa.24.1792419905527;
        Mon, 19 Oct 2026 07:25:05 -0700 (PDT)
X-Received: by 2002:a2e:be8d:0:b0:3a6:48ce:2b05 with SMTP id
 38308e7fff4ca-3ab293008d2mr20364511fa.24.1792419905099; Mon, 19 Oct 2026
 07:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-bug-selftests-mm-ksm-tests-nohugepage-v1-1-55ed54bdad35@gmail.com>
 <4a6ddf56-af89-482a-b173-18e181bfc3ae@kernel.org>
In-Reply-To: <4a6ddf56-af89-482a-b173-18e181bfc3ae@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Mon, 19 Oct 2026 08:24:37 -0600
X-Gm-Features: AclHuK8zKZKMm5fTjvg9yQro-QDDhE55HWKI1sJCDKDoRQ2ReZ01Whinkm8cRqk
Message-ID: <CAA1CXcDZuHkPpRjE_f1J9Z_6a-JJokAEsCNg+NKfrNviBTt_pQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: keep ksm_tests on small pages
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Qiliang Yuan <odys.yuan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Usama Arif <usamaarif642@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 7:38=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/18/26 06:53, Qiliang Yuan wrote:
> > ksm_tests fills regions with identical data and checks KSM's counters
> > after merging them. allocate_memory() maps these regions without any
> > THP hint.
> >
> > With mTHP enabled the regions can be backed by large folios, which KSM
> > splits before merging. Splitting an anonymous folio maps its
> > zero-filled pages to the shared zeropage, so with use_zero_pages=3D0
> > those pages never become KSM pages and "KSM zero page merging" fails
> > its count. "ksm_tests -Z -p 10 -z 0", 20 runs:
> >
> >   THP setup                     before    after
> >   default                         0/20     0/20
> >   every mTHP size "always"       20/20     0/20
> >
> > Map the regions with MADV_NOHUGEPAGE, as ksm_functional_tests does.
> > ksm_merge_hugepages_time() maps its own THP-backed region and is not
> > affected.
>
>
> That's actually something Nico intends to fix:
>
> https://lore.kernel.org/all/20260609114619.144416-1-npache@redhat.com/

I will try to get the fix posted today!

>
> >
> > Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when=
 splitting isolated thp")
> > Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> > ---
> >  tools/testing/selftests/mm/ksm_tests.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/sel=
ftests/mm/ksm_tests.c
> > index 5fd7792a0d479..140ea833353b6 100644
> > --- a/tools/testing/selftests/mm/ksm_tests.c
> > +++ b/tools/testing/selftests/mm/ksm_tests.c
> > @@ -178,6 +178,16 @@ static void  *allocate_memory(void *ptr, int prot,=
 int mapping, char data, size_
> >               ksft_perror("mmap");
> >               return NULL;
> >       }
> > +     /*
> > +      * Splitting a large folio before merging maps its zero-filled pa=
ges
> > +      * to the shared zeropage, so keep the pages small. Ignore EINVAL=
 on
> > +      * kernels without THP.
> > +      */
> > +     if (madvise(map_ptr, map_size, MADV_NOHUGEPAGE) && errno !=3D EIN=
VAL) {
> > +             ksft_perror("madvise");
> > +             munmap(map_ptr, map_size);
> > +             return NULL;
> > +     }
> >       memset(map_ptr, data, map_size);
> >       if (mprotect(map_ptr, map_size, prot)) {
> >               ksft_perror("mprotect");
> >
> > ---
> > base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
> > change-id: 20261016-bug-selftests-mm-ksm-tests-nohugepage-1414868db0ef
> >
> > Best regards,
>
>
> --
> Cheers,
>
> David
>

