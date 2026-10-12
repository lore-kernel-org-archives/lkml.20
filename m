Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386634EEFD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788394; cv=fail; b=h9MegNFHsrqVBSSSKwuifdJn+68vGVRgIVS1EOcFYXdwIGpBewHUzRtPsz2P16i6trUIZyKy3lgQ+7DYYFHBSVQ6H4DWLZPSanHA7DPwXD1cxMQWbRP2FWM2jXl6l+SgUP3Izl6thcs/iR1Jyzk3gzmkawy48Bzt2pT0u1FIbTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788394; c=relaxed/simple;
	bh=xCoIw8MFbQgQBLF/VEScJv7Ztxo460xsZM2jiZKMlko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N75JcMHcKgPYb2k4T171t8BeO0aTi2GBS5hDTSj3Onh211bAdhHwhHkoGjx4vX9vr7ACgrtK9EOxUyaB/uQON/44xJUWLXqSh2WjgUr6ErbZeyfGgRU+VTKCNKkBh3nnedYtSoy4W91GfXFzBdkawGqRbJytG4AsD/6QCbyH+aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=G9gV4hQR; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="G9gV4hQR"
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55Kvk880755
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=CcWrqNemADK/mln6DNzOJx+M3ACSVL80PiMou
	Dsi/xQ=; b=G9gV4hQR+tfzrodz1RVBmkPNPwacUyqePsb1GVv7iCXF7H1Jqbrqp
	KHqs4qY4nR4K4k+ezZqK2a3t6X2mxpgZnhP/dJFq8Pn09mNrwTi9lw6Kc6lo9BiM
	GQB3+TKyzs73V2LlqDySWrRVictTiZy+4iLdqaw/odxdcQ3LAGsALLskePnIh3QA
	+yvoHC5A9JwfYxa0X9SQD6gEI33+1aTsOHQPIKgIhV1nOHlcXqEFswzHggMG29lZ
	GRs4Ca9v0sr9hsxvrYeY0MWbQrWbBtGGrVsPvsZXZgAIlfDGU3BSs2W0SJON+Ejq
	2EAJc0o5jr9Fgsm8DOl/CoB3bYnJWy25w==
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h870d51s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:59:51 -0700 (PDT)
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c3613c35145so5795866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791788390; cv=none;
        d=google.com; s=arc-20260327;
        b=T6bhrypYPxL+lG+fjEaNctgYTePc0mdm7Fkol/MiDsnit+MpwQBmLZBdtVIguS2B8Q
         0cKOCXLKWMcARmX+n4BZSr3DXbkb0ul4v2eMA0ujv9Mx965W7onP/G7ETgG/TA0kj6Ga
         N6aHmdKFDhlj7ciYJTWT1ESKZjXssOVGYawnKR/mUAxjn3Kz9noMiaCYDmOQ3CioLZ5C
         6zWrS+LmUcGc6JpNsGbJ1vQaK32NBpM6jCq4v69o/7CvolaGNnALIjbsl3JzRI348CSR
         tyF7cAsMZ6eVA8aJJyb5XrxKwx+6F8nigv/E2RMEq3GzhTb3H01/xw4cBe5XO5nrOexx
         25YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=taHU/KI4QI2caWxNyUiB5tVDqT2+4EOk9Xdzto/bT6A=;
        fh=ZxyLYexD1fU9cxnAOUDz8AVECl8flm4sVxebA7MU328=;
        b=VZtJ0iAif8QoVdsvlmAUxDGsPWwUYNcCO4Es8YiUsZKj52y2lKMNLtHbgTay4okfaZ
         Y2tlC+acvtL+C7fG6j11NAexacwc04VXA0pzPMqJ1u/uu/kZzpFI/hg9lKeHctmFbkii
         CtLdp6DPcxoMtI9RSW6+J2CaPDi8iebHPh1YiBuweeCfONEp1P86geDqJ8EWRzr0/M3L
         3hg4kg5XgY/KZnvr2x9PGbm/XBdFR2QgLZFiqalaNTM7ftBLp8tdd1oMkD8n6sHMBkUN
         zyuT9qkHMCIsL80bxzOmZw6JP+ATM5uf9zURGNpIVzg99IBY7ZAsVxKgy+SMmtXvo67W
         zWlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788390; x=1792393190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taHU/KI4QI2caWxNyUiB5tVDqT2+4EOk9Xdzto/bT6A=;
        b=lEFuTtVeqIynJd/GMzJeB2zYQK0EXlpieNRynUlRLFJ3++D85jX573QhcpZi3TZNcK
         Lw1OpmxlEEvKYScpc+7zLqWYnGoFN/WTmp0ZsuxyGAqujExmXVme07giFUWfq5uGoiaM
         +UVhVgB9bmQbIt14Nrnfe9zsZFSRkjlgwVM+ToTkdw00+XkNVSnTydmuiBCWdcc3F+IH
         JJvs22x4WEMo0d6L7ekDx//EpfOTSy/mc1hlZexvk6SC2zbapftj+IKIeqxd9OdnYAR8
         FQ0ppzMxwwqzqul//M49I7YR4ruVF24iGw+BXvpaPGxXaTCqAZz2wJIJt3lhZY7lR/61
         8Y2A==
X-Forwarded-Encrypted: i=1; AKwUvByNj4+HTH2NSTRM9/6r2RHszPtqT+9iVczlF42uxd+fWd5BW/xIkUoST68MLF2JjhLfUKZL6Hwz7v2VDXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFgsWygZD8nOaUr79l/TLHoSYtZrl7jHMp8BPahAaJGfu79U84
	cbHZoGTWztBqcItLpfB6AFWZ0rks0tTKkmV9NPtzqKYtIe5S6R01HUz2UxWUlsnQqMilo9um5M+
	dtGSiazELmUPfTCyKyVp97SmxWcNrJEwJ+PL685uwDXeo17RmiQcz9yR90QbdwfubQrulH1YKAC
	xY5V3SyzKpf26uQKN8nfSttdHgwK1lpu9CiHsUDqk=
X-Gm-Gg: AYBFou0BiCXPtENi7Wqopemn5HllJKkjpda5jQBNETD76MmqDEgI/GVeJmOIlAHH/m3
	JRbP5syPgQMYtcaTn59JLNy9yfSa6bOJbzVyceXdHq/DiCjzCpf8NGtkgqORXLgAtoISxS6tKE6
	YprNxNQFZoOVgPG42RGrftAnLDzV19w9UCVr99+43xxvwCRpJRGVgD2+RSIZWYwr+dNq+8sy4a3
	g5UmiPZDrIw4ioRzA==
X-Received: by 2002:a17:907:7210:b0:c2e:3124:2394 with SMTP id a640c23a62f3a-c31a9fb6cb1mr848802966b.41.1791788390421;
        Sun, 11 Oct 2026 23:59:50 -0700 (PDT)
X-Received: by 2002:a17:907:7210:b0:c2e:3124:2394 with SMTP id
 a640c23a62f3a-c31a9fb6cb1mr848801366b.41.1791788390002; Sun, 11 Oct 2026
 23:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
 <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com>
In-Reply-To: <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 12 Oct 2026 08:59:38 +0200
X-Gm-Features: AclHuK_YHJJZcoS-MZ9-u5zq7ARhz27VmsFbDhDGqeJGqqJr4YJZ9_eIeNErZcQ
Message-ID: <CAEmasaXa2pB_Jm_VgBZAWQwu1p75yUSY2=dr0Opt5okLgWk-YQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Barry Song <baohua@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org,
        hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
        shikemeng@huaweicloud.com, baoquan.he@linux.dev, youngjun.park@lge.com,
        chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org,
        liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, kasong@tencent.com,
        ryncsn@gmail.com, chrisl@kernel.org, usama.arif@linux.dev,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GdWCDgXL c=1 sm=1 tr=0 ts=6acc8567 cx=c_pps
 a=jJvPsHQLKLf2UdvVr97r4g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VabnemYjAAAA:8 a=VwQbUJbxAAAA:8 a=fcEPiMyxzdwRcWG7a60A:9 a=QEXdDO2ut3YA:10
 a=q7aydO1c4wibL4nb3gNS:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: CFdVomONP8VijiGB912qxjMiZb6W1JrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX03R/WecMkg29
 pJC97MXr1GiNaVEXHp3ZRARmBllQwMFw3Wu39UhB97w6/ibFftfCK8IGhPT8q0HJoRqHFlugMyv
 4WdARwrf7w7Nq/E5XE2L1qZQfUKg+eOdVuUbQEbxDsuLT8A6Z461VO+i4kcMf658FRru0Udxhqd
 0liSG4TscQLNO7yPQEJ5lMkn2Rg1NIvs9W9LNehGYToMgiV9HdjkC9LcmBKIhW6Bzi0XUh1Bz5+
 kAnhSX7epKKLN6BjMN+9ZEUmixtqStolvIFHSPKq1GLX7dK5KBdZUTqPd35dvM9rv3SVzLEMrZV
 LMuurOBcmVdg95Pd2llr7zwA7T9+kMSE6HiLdteESrI7MtAgsxeIiyWMaXyTDjNoCnGftMCkSUN
 xxnprJ7OuRoT1SD9wBV95YxbY8/IB1bhlBYftH3kY4cweW9mi2lACx0B34zTUhkv10RZ0NmD/T7
 S6NUH1B11GAAqAUsrAQ==
X-Proofpoint-GUID: CFdVomONP8VijiGB912qxjMiZb6W1JrC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX4ZUyoqs4llE+
 oTkZldbG5rK5xwC+3ueQ5Ik3JzR5xWVCDNKkbDYKW2Ct6h6OEcWhuk2ioOXcxHmRN76sOAuM2qI
 NYMQlgzY0xKUWWd2YA9BqikOJROnMS8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01

Hi Barry,

On Fri, Oct 9, 2026 at 8:22=E2=80=AFAM Alexandre Ghiti <alexghiti@meta.com>=
 wrote:
>
> Hi Barry,
>
>
> On Wed, Oct 7, 2026 at 11:05=E2=80=AFPM Barry Song <baohua@kernel.org> wr=
ote:
> >
> > > >
> > On Wed, Oct 7, 2026 at 11:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr>=
 wrote:
> > >
> > > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchron=
ous
> > > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readah=
ead.
> > >
> > > zswap is the same kind of in-memory, synchronous backend as zram, not=
 a
> > > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > > swapin_readahead().
> > >
> > > Here are the results from bypassing readahead for zswap too: it was
> > > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, sh=
rinker
> > > off, on Sapphire Rapids and 3 iterations.
> > >
> > >   768M memcg (sustained swap thrash):
> > >     metric                 mm-new    + bypass    delta
> > >     build time (s)          405.0       341.7    -15.6%
> > >     zswap-in (GB)            79.5        53.0     -33%
> > >     zswap-out (GB)          144.8       115.6     -20%
> > >     swap readahead (pages)  6.79M       0.45M     -93%
> > >     swap_ra hit (%)          72.1        89.9     +18pp
> > >
> > >   1G memcg (light pressure, build not memory-bound):
> > >     metric                 mm-new    + bypass    delta
> > >     build time (s)          177.7       176.0    ~same (no regression)
> > >     zswap-in (GB)            10.2         7.5     -26%
> > >     zswap-out (GB)           27.7        25.1      -9%
> > >     swap readahead (pages)  1.07M       0.08M     -93%
> > >     swap_ra hit (%)          68.6        87.2     +19pp
> >
> > Hi Alexandre,
> >
> > I assume your configuration is as below?
> >
> > / # cat /proc/sys/vm/page-cluster
> > 3
> > / # cat /sys/kernel/mm/swap/vma_ra_enabled
> > true
>
> Yes
>
> >
> > I am curious whether setting `/proc/sys/vm/page-cluster` to either 0
> > or 1 would result in the same performance gain on a zswap-enabled
> > system?
>
> I'll test and report back here.

So I ran the same workload (kbuild -j16, 768M memcg, zswap only, n=3D3 per =
arm):

    768M memcg (sustained swap thrash):
      metric                                        mm-new
page-cluster=3D1    page-cluster=3D0    + bypass
      build time (s)                               530.0      462.0
-12.8%      452.3  -14.7%    452.7  -14.6%
      zswap-in (GB)                               95.7        66.7
-30%         64.2    -33%     64.4    -33%
      zswap-out (GB)                           169.3      138.3
-18%       135.2    -20%    135.6    -20%
      swap readahead (pages)            8.37M     1.93M    -77%
  0      -100%    0.53M    -94%
      swap_ra hit (%)                            73.6        86.5
+13pp          -          -          90.7   +17pp

Exact same results with page-cluster to 0, so I'll add that to the
changelog as you suggested.

Thanks again for the review,

Alex

>
> >
> > >
> > > Similar gains were observed on an AMD EPYC 7D13 host.
> > >
> > > The gain is from no longer prefetching pages that are pointless for an
> > > in-memory backend: readahead inflates anon residency and thrashes the
> > > page cache (file pages get evicted and re-read), lengthens each fault=
 by
> > > synchronously (de)compressing a cluster of neighbours, and adds
> > > compression traffic when those extra pages are reclaimed.
> > >
> > > Bypassing swap readahead for zswap therefore makes sense.
> > >
> >
> > The change makes sense to me. I am just curious whether setting those
> > configurations would result in the same performance gain.
> >
> > Maybe you can mention the `page-cluster` configuration in the changelog
> > as well.
>
> Sure, I'll do that.
>
> >
> > > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > > ---
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
> >
> > This is RC6 now. You probably need to respin it after the new RC1.
> >
>
> Thanks Barry!
>
> Alex
