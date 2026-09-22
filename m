Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFC528437
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064169; cv=fail; b=QhOo+TFxc9HyW0vS26AHW1tujHzxoKDwFf8o5GB48vNUbgtBtNlDeFmOeT8UfElFOpTg489oog60939ddFy4Mve8GtihFtjkXwqOafD8/K9wE9dav20E21ylFBxfDxkYKirtPgPP72nc2iCBxQL8kFUMLbeEatOfz3FQeaDId2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064169; c=relaxed/simple;
	bh=H/OzxsKbK2vJpy7UAxboOhkPy06LOJjeG7WOO583CF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0QQyXEydONmcUfx1tAxperhK0JSxFyYxnJ2NhLFu0oYAUX9v/8xWovF/edQ1XZUk4OxievkfqR+BRHVPVteOuu9H9ADu5yfpKI6DuC5VHT2rlkv6uegsxfZfCHZ4mCyvDGfwlEElNUe+OoxNSPaJcu0ohh7OmY4ad9hFJ+9e9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=QIgL3xs2; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="QIgL3xs2"
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M38pcU1840319
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:02:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=egmYixSLLeF19Mv/tNU58KhSmS3CiJ+DF96rq
	ezYCUQ=; b=QIgL3xs2MQdGP+ceuMp+xGDiuPjObtffSkBzwla57wq+b/sZk0zC0
	+FY4VGRBp9LiTYMH3noKGO29YTZglDRljHeMEnn1GT5WVZnZnhAiBVI/vo1d5CbM
	bVKBWpP2jHWh+87OCAhAuiwXuLZUpjI6kVfjw8m2s77GDC0PHCC3mA1fi0+GzT7i
	7vNws+LGMsmyxVn5PauWIENiKQzk7pN1ybYc3l6xAUWcemfBftsOe6FrOr4qNNMS
	MF+aS+5fTjVZRyKhoZag0U+QCQaHwqvZWFXp74hx6AViPzt0YcmzrXZs3HVfCNz7
	uG6H6oTZdNACGBPybn+hUAnMAgapBH23Q==
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gtc1ee5dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:02:37 -0700 (PDT)
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c295b027ee0so341665266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790064156; cv=none;
        d=google.com; s=arc-20260327;
        b=eKqSagjBcvyeLwmvpCreKH/CSPTNQox3SqNK+Hr/k/OIJKZBOdQq+dPPh/fTqM35Mq
         qT7HTj591fJsUcaY/HQiFzM8nxyNTwZ9avJ9xLFYQG5KNO8RYDxbyFagwyHDiYqhHOpz
         1DkKZu7XTIii99l51zUBxrR3I+ZfJ+7OzcrD36Fq8oXZ1x91iQSQQPtnOdeJZ8GB7Lyl
         gGL5Dxlj9zKsh4BCYEWuXzMXJuxdWyrFsKX9urXYPxAfjv7o31Zj+4f+9/6nJ2SmnREX
         4b9VyRBJq2rgHaR2e1p9HnPpkGk8m1oEj84p2EUaLfkDBrNjvny9Wqtvc7+aerDNtEk2
         e/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/vF7mH9KYJUeUFF1RIVzuqynyDLbFuOXhfCpPUVAiiA=;
        fh=JMS1sPRGNPGMpbkxVG25xRmsJ2BASKe8DxVRGWl0vLI=;
        b=otp2zB1OyyDi9jk1vtZ/CK4k6ydbv3GFrogyUjwWcVdgjgc1iBHKkVzZLVD3YOMbs3
         0fys3I091q0UyEP/EG2rjUYmScky3iYSSecLKHTN5NYP860MxU4ZFlmYMloODg3gf4wY
         iJ8v6GI/J12pvBe2JbItl4UUaybKRNYTW9YugysqXb2jG4BLf4uEDpyhJADTVAFsWgXD
         cAW6TVQcQMNLVQ6SgiRSX92sGdmm3cx1aqAhdaZNnMVrYpoBG2Kdi7W93IWtl9BuebM3
         gpvApWBKHo/p7DayKX7ncg+DWZTWlxyq+yrzE/amvKOSrp/BJVROuW51EXz7/Wept4p8
         VpVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064156; x=1790668956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vF7mH9KYJUeUFF1RIVzuqynyDLbFuOXhfCpPUVAiiA=;
        b=LTN31yuwcdYLbBVaQK3fagvnCgXDos4RAuYTlStXtJl2/Oo5rSQcPd1xQK2lxlHf6o
         f/1pwI/UKNcBlicAMH65Nz0eHhShIsEzw3MbMRlZdpwdMe9WygkW+1kqjs9JbSJkke9d
         EXuN2ltxSa+blM97nXyV1yFLuOlli9NdPKO91xpSPhXtweeR1Z8y+wCWqptB6KItyU8x
         zcUB/lDh+d0PhpAisNNXEql/L8yleeyXJlTaw5hvvs1Fu5BIEaMG8kUP72Av/i/fUHfx
         nUo3O0npUrQEXKdyr92qIt85QalvmZ/vPile212gLgsCsAiAtXSP3ruhOffCcsmI5SOc
         PH1g==
X-Forwarded-Encrypted: i=1; AKwUvBwbUAvC3tGAlnmAqfPDK4pTeGV9qN8r8oIKbHKWPJgWxf37IiP6z+cjkNuRilXOjbhioH26gNddOi2cK0I=@vger.kernel.org
X-Gm-Message-State: AFuF++nlDQHUdY3UqRtti+IIUBi0Khk6BAvpod49Dj/bNWrv1XRNyt2L
	/ZU+XLRi8scNNA3VYF/lso4ZdepULr5p3YUPY0RRJwv93CUUYk/z5sidWTFa3TomsbI4ujjhyCH
	qr+NGjmuBn/dk6PGLVPUsMca9lG/bmnfl/3taFobsHr21djgfQCu/uxCaA+enonzMCzN8VHpGLA
	j8AS6Yha7Dy4p9hM0jH2auk7X3U4XQH0t9btC5Vbw=
X-Gm-Gg: AYBFou3eVxeIZHH0tX+i0R+XuQ4l3y8yxsYTFRv4RVG9rlrBxdMqfjWsKK/xHbFiz++
	cZHetMJCyQPceUI7uQNt/awKLhux2YjNCjmf8lqnlE/z4MK5kxBD/0ZwQgTWyakd015RyWNar5I
	0e/J9BB2h86RNLFopnNkUEy0e4vD0ML3yd6CRE7Di3JYGbcIotxTozHYUotg1Pc34147Nawcv3j
	Gshoo3oknS307semA==
X-Received: by 2002:a17:907:e107:b0:c2a:8d00:f8d0 with SMTP id a640c23a62f3a-c2a8d010f09mr140835766b.4.1790064156291;
        Tue, 22 Sep 2026 01:02:36 -0700 (PDT)
X-Received: by 2002:a17:907:e107:b0:c2a:8d00:f8d0 with SMTP id
 a640c23a62f3a-c2a8d010f09mr140835166b.4.1790064155845; Tue, 22 Sep 2026
 01:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722163536.773166-1-alex@ghiti.fr> <CAEmasaXi_OFYSPvqv66tXRifw2FDiK6LGCPfAB7oe0K+4SL+NA@mail.gmail.com>
In-Reply-To: <CAEmasaXi_OFYSPvqv66tXRifw2FDiK6LGCPfAB7oe0K+4SL+NA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Tue, 22 Sep 2026 10:02:24 +0200
X-Gm-Features: AcwNN1UYm6sV_NCuv_OfWQYnfZXTQRMWfJhPvjdQLTv6Np1AiS1TUH_6fvC2QZw
Message-ID: <CAEmasaVFpDk_FEt-GSny3BWMjzN5=cXoS1gEkCphfi-qpR=h=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosry@kernel.org,
        nphamcs@gmail.com, chengming.zhou@linux.dev, david@kernel.org,
        ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, kasong@tencent.com,
        ryncsn@gmail.com, chrisl@kernel.org, baohua@kernel.org,
        usama.arif@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XJel2ghE c=1 sm=1 tr=0 ts=6ab2361d cx=c_pps
 a=jJvPsHQLKLf2UdvVr97r4g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=PKu3ELo3UtdNWdUKzfAA:9 a=QEXdDO2ut3YA:10
 a=q7aydO1c4wibL4nb3gNS:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 8zxUW2kUNY6ArYAHncyCETKMhSUyYLpf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExNCBTYWx0ZWRfXy+UWfolsmwDl
 qwCtVgI1nq2vENSK/IEOtTNC9tLbcKvrkTzEkZkvDrTEAvqvVv58gNX1Mj8WIsUAO89y62qtokD
 xXrDL42AhCJeE72k5x2gxmZletK5OV4=
X-Proofpoint-ORIG-GUID: 8zxUW2kUNY6ArYAHncyCETKMhSUyYLpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExNCBTYWx0ZWRfX7xFUbiOZnwZR
 15ilVgSSZgAa1t1vq0j8BZC7suO8FYcTPc2tfVK0loTU6nvXzLHDGHOSNFW+bZNMxJyke4ZtqOb
 bnIQQlhLwJ6uqO66Ru8UBDc2OumGhdKFNxGXod2C2uQ2azKn6/9GVOwNcaxWxZ+FFUPeq38mx0Q
 owXy5H9PP4OCOm9Yoxd6NkqES5/NHlVpabRZweUd4fV5TC5EeyAWdxVHsciXu/MdQcllnDNvwU/
 6rg7y7Xt3471ZhmxzT9LnPGOMs73Jr64uTwzv7I89Qw4eiKvS/SZTVmgYrf14jXJWjuhqSrMcl8
 jJjrNHremnJgPXth6LYwpH/wOYC+O54vsor29msbnWmBOd9xTHUZ8pNUQleIvQ24NPxijMQn7m0
 L+U3vPPlnQxFDHhmsSVd4E+1FGrvFoS2NGJKJXKd9QKBz1/QthSuBccCDEOGgTAPkI83tgTCtCG
 hmLFw3mzsay9s8FSCMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01

Hi,

I understand this series requires more review work than the simple
no-readahead for zswap. Let me know what you think and I can revert to
the simpler version.

Thanks for your time,

Alex

On Wed, Aug 19, 2026 at 3:21=E2=80=AFPM Alexandre Ghiti <alexghiti@meta.com=
> wrote:
>
> Hi everyone,
>
> On Wed, Jul 22, 2026 at 6:35=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > > >
> > First, the title is a bit misleading but this patchset is a follow-up of
> > the zswap bypass readahead, so I kept it.
> >
> > Swap readahead walks a window around the faulting entry and reads every
> > neighbour. Some of those reads are synchronous (a zswap-resident entry
> > or an entry on an SWP_SYNCHRONOUS_IO device) with no asynchronous devic=
e I/O
> > to overlap them with. Today they run inline during the window walk, so =
they
> > are pure added latency in front of the read the fault is actually waiti=
ng on.
> >
> > This series splits the window walk into two passes and reorders it arou=
nd that
> > distinction:
> >
> > Patch 1 (overlap): issue the asynchronous device reads first, defer the
> > synchronous neighbours, and read them while the device I/O is in flight=
. This
> > overlaps the synchronous work with the disk reads instead of serialisin=
g it in
> > front of them -- the win for mixed (zswap + disk) workloads.
> >
> > Patch 2 (bypass unless the target needs I/O): when the faulting target =
is
> > itself synchronous there is no in-flight I/O to hide the second pass be=
hind, so
> > skip it. This is the zswap readahead bypass, gated on the target: it he=
lps
> > pure-zswap workloads and, above all, keeps synchronous-target page-fault
> > latency low.
> >
> > Patch 3 (SWP_SYNCHRONOUS_IO): treat SWP_SYNCHRONOUS_IO devices (zram) as
> > synchronous sources too, so a disk-target fault overlaps its zram neigh=
bours'
> > reads behind its own disk I/O -- the same benefit patch 1 gives zswap
> > neighbours, now for mixed zram+disk workloads.
> >
>
> Let me know if I went too far with this new version or if you'd prefer
> something simpler. Or anything else you need, I'll be happy to come up
> with a new version.
>
> Thanks,
>
> Alex
>
> > Changes since the RFC [1]:
> > - patch 1: overlap the synchronous decompression with the in-flight dis=
k I/O
> > - patch 2: bypass the second pass when the target needs no disk I/O
> > - patch 3: extend the same handling to SWP_SYNCHRONOUS_IO devices (zram)
> >
> > [1] https://lore.kernel.org/all/20260624075700.751467-1-alex@ghiti.fr/
> >
> > Alexandre Ghiti (3):
> >   mm: swap: overlap synchronous readahead decompression with disk I/O
> >   mm: swap: bypass synchronous readahead unless the target needs I/O
> >   mm: swap: treat SWP_SYNCHRONOUS_IO devices as synchronous in readahead
> >
> >  include/linux/swap.h  |  6 ++++
> >  include/linux/zswap.h |  6 ++++
> >  mm/swap_state.c       | 67 +++++++++++++++++++++++++++++++++++++++++--
> >  mm/swapfile.c         | 11 +++++++
> >  mm/zswap.c            | 17 +++++++++++
> >  5 files changed, 105 insertions(+), 2 deletions(-)
> >
> >
> > base-commit: 13a1e1a618858407fa12c391f664ea750651f6b2
> > --
> > 2.53.0-Meta
> >
> >
