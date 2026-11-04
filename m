Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793801270;
	b=wKCbPhc42IA8oRJWnfl8c0YO/LvHEWR+5PKyttFJtFYCgoRkcO51piARbunRUIhzuhAM
	 BZxRWfOfTEXkn+OF0RIob4BW5COTCrvlZveoReiEnxj4qzV/Sv9OIWN/Juq8LR8tCgjis
	 yOI4coD2drRCRYP6h9YUOHoXxJjdT7/G9ZvPlmvrGfLYzB36VRCab84+80LLmOadLNGbF
	 seTFYf5oPAk33wrkQJzd3GC9tWFcHMEyT/lId5TKFp8wbzep9sIHjrZua0eP3OLiz4Kdj
	 GcFHVhlu8YErOoESPRVkODGRiCp+oURpe6AxwkCBtOZuj9d+j9l7MwREUZdUyschCzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=StALzT24QP0y2nM7ZiWwYHN9H78Ev4aIYAoLlcMqH34=;
	b=NZPIY6x//FJD3brrrZ2VSc9ukePHnEFfxt4BJIMe+NtjJ9c4UX6jdr7oGUHmS8P5on7V
	 O8NJ8licfVqeElcQifeSYg0guvzJprZQamm3IXGHuz6kKtwdc9KGZ0gsM5p6wLRMxvapY
	 KsRHRH2S2UvrMXKAGMDUZ60Zn3+C27Z0iy/d77/Ii8FEWH9rA9KPiviwm/Fcb36cdQdmY
	 7oBQY+o8KI63bsqk4xuux4ShcCRtXYI6LK1gs4cRfbMa3xqNvqxwkfTyaPUxz+I2LnODi
	 6e5pFu9k+L0NPFbiuTS2Nq9Ek8VQIX4Xtmr9qjtP9rYSsrpYLkAiHuC34XkfXhyqKuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=fa7C4CtL;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6465606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6465606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=fa7C4CtL
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BdeTi4089404
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 06:07:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=StALzT24QP0y2nM7ZiWwYHN9H78Ev4aIYAoLl
	cMqH34=; b=fa7C4CtLjbcjLBaRp1kFwGlFvkm8a9/klCNF05YwslLz6lgMrtD+P
	UUAp2pu8dvgXJhZJJ8y/rMv3FaiuDmTARYEjR3SZUNagIut97wcOWgQHWP2wqkM5
	ch76lvB0QUHUhp7rr1axC6KC3AWiYTaHpYljLy4aGucqOP0wQJTAtUCLX1inzr1E
	6tfK5xAulkthrxOHEIsds9kRu1ND3yYwr6UFBn8cH6juEcO74BulCa3CGiGJtDl9
	BFv1HAi6roBfaGetmc1HapdoFI/0Ks+CxyociHXcMCRsWschcfNXFzk8scpr28Ko
	vXr5T8o0htuW4894q+QTG6ouYs72mkYPA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hqhqag423-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:07:48 -0800 (PST)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a3664e1fso1248981d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793801268; cv=none;
        d=google.com; s=arc-20260327;
        b=iunokdH/AXv5akCIG1J18bhSMBKO9h0LDzvpaa1gQFatiSyiznjbTHIKK7RvzZGSJE
         uQuRyZCndz5p97hhm9jd4GazTkSBC8D8rxcObKsXwZWOMRBbf46TTNedJJBv/3W9jjUF
         hHm/oF3NyDssuWJaI16eflMDC8P5plQS83NK9wudz8uuUEdPxc57I/A1ghIYyTG0Hpdg
         hwsqkKlL12PV6Jrk3CZQdEVYXtAi+caRXM9ZHN2K0yOZwkuvx/NtsNOlM9RIvGWP1Ux8
         MnIvE+NuBKSVdI5HfpIIpf1pPjjBhMoTWd7b/31U0u2XG+O7nxOz1BqNN4v5B80j4scW
         pCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=aZOMwSWiKC1/xAL/tFc2vX9N5EC5GmGBMCzQuc0a7ug=;
        fh=9K9p+1QHWKOgVtOiXngDcOKIXj71qplAiMo3rwQLMq8=;
        b=c4G9+CDNiKv3UQ3OtX82nuwAIaKZbPMzE8JRQebBgoFaHMC5MleGGaHkLC+tM+eYpl
         5z3csny6JCC0hZWOoQ26i3Z4UMYqv1dOjXUcoubdTYa4z7jMhnNwZ31xrYTN+4cdi58s
         DU7mGD4iPC/YjJzZPBz83BvHPBqhehkU+vyUfQMt8/MctyEiTmmAPf7peklsY1ZmZV/E
         EajSf15FL6P6bKM1j174SuXhzN29wzzLq36wSsxkntt2Aa9f4ZYE12DwyVHQuWmN93dx
         gMq1vv9WmwPJ+/KDhdWRbk5bHYkiCEgp3mbAgagUV3L9OtNff3jF7mJ5hphKgCtMvpnv
         1Dqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801268; x=1794406068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZOMwSWiKC1/xAL/tFc2vX9N5EC5GmGBMCzQuc0a7ug=;
        b=IgoqJXt6JmTp/Wxz3ePrHpK+VWnGUjNshIIFoci3kNsKAAUHhUOUZlxS5t2Cd8sxWU
         PXqaTwX6tyEQfV4tcn0B3BHHKM6L5ohhzasCoaO2tC0C5mM3sg3TKmX2nkDdxQRlXFAY
         TyBaC9L/Tqf49aaG7lc5ViGgorQMk8mcCLOsbW4Fug1O4054AULLWmp0BPwl4r2eXf/h
         7R+oS2O3Ke4JQJyUId9kPx6xLvXu/uAkr+Mdq+SBJJOo9L0ifvhZk79FNfSxxJ2CzoXy
         lqQULgrNtg4a9N2RzT7vYpnyoSJ2ts3St7ocZyiUKZKErNt1bEQmf5nFLRx11Y64OOFb
         tp7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4krUDjOqex1Xm15yU6wMlecWbLwUkmXQwq45KcbhF3fquFSMJiu6NPFHpB3Ql0n+X7fQO1lRdqxFoYDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HKWl+ScEpN8w2VIXKz3yChasi63hqP0rLHEjgBPt5hq8ZXbtw
	YI2HG2xt3Aeu/2p+NzHBSFz3pRKNYIB4BMVcMlpCuaJy1JHXe0o+rIgkEhAUzIWIrvkQgHVTu6U
	+f9N3uLXlZaMoWB2CV9n2FLlhYKu3wBaiZHRpMTBAmBl1hpKAVivyxP4bo9OL/AiAlhu6MqocdQ
	KpqT/P3zBrGGDOZUIgPLfdmbZh8DRqtoynpnLhDaw=
X-Gm-Gg: AYBFou3J0wEAAGONTXvhzXKQ2PWvucCZ+DT/QUdfa8kOUXsXCewiOPwWJ5SEDam40+c
	7FZQrOSQTw/jTKvJchaD8FRTmGBhjQcpBB1q/RJugsLRzjATaDAUgUMBZi4CxsxingwZlEyyS97
	RAsF8J2iHYk3L/+SLdtz8E1zIuwwl3Z0o7quGYRjgqafctSzleLy0wSmEYYbB/lQEZUiMvs40GT
	sjY1/jvJhE8Tmzknw==
X-Received: by 2002:a05:690e:4885:20b0:677:d4b0:47fd with SMTP id 956f58d0204a3-67ba4fa153bmr8030541d50.23.1793801267615;
        Wed, 04 Nov 2026 06:07:47 -0800 (PST)
X-Received: by 2002:a05:690e:4885:20b0:677:d4b0:47fd with SMTP id
 956f58d0204a3-67ba4fa153bmr8030528d50.23.1793801267013; Wed, 04 Nov 2026
 06:07:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr> <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
 <CAEmasaXz2GGoy4dyhbo9Em95Cnz6QL3u2fcnAa2=8pJOOJyH8g@mail.gmail.com>
 <CAMgjq7BjOeboPMP64PfGDoY4yMGq0xR4E4Wa66U0+gsd2tnu+g@mail.gmail.com>
 <CAEmasaV0D3ezZyWf0k_84qXOa1c5KyUjvX9Jez+RXMDPM7FdBQ@mail.gmail.com> <CAMgjq7BFbXEKEt9faj_rg5AStfLkpJ0j57EQOOJ+L3-w2xRvtg@mail.gmail.com>
In-Reply-To: <CAMgjq7BFbXEKEt9faj_rg5AStfLkpJ0j57EQOOJ+L3-w2xRvtg@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Wed, 4 Nov 2026 15:07:34 +0100
X-Gm-Features: AclHuK8gSTKeshg4sibYpQasLMc7p8QuNu_htLWW7wYC0Zzdzry0J3NTMCIAiEM
Message-ID: <CAEmasaVKxhV1-fsRLuPth2Bw7+x5Re8mTFwMrppAaFOxLNPNbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Kairui Song <ryncsn@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Youngjun Park <youngjun.park@lge.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX03n0ZK4EHnar
 igoc5PtBFPuPon7RU/CuWs/SzhOXFKtY25eYX3rBeWnYCyx4myZNWOj/D5mEJDlIXH/q4u6WrQM
 OlQ/jC3mFD13kkt6ATSTNNYRhIhxV2w=
X-Proofpoint-ORIG-GUID: bCC3EXQdxLrqm0U4JY0wxKuY-YdmFQJy
X-Proofpoint-GUID: bCC3EXQdxLrqm0U4JY0wxKuY-YdmFQJy
X-Authority-Analysis: v=2.4 cv=Mq7HeGae c=1 sm=1 tr=0 ts=6aeb3c34 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=pGLkceISAAAA:8 a=VabnemYjAAAA:8 a=ScCvlEzxO9iafL6ztjAA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4DjdGchCbokM
 NmI8FyPShXT/9vHzRjT0gE/6v1THcIXTJwoqAKmlBaRCs6XyaEJ6OFIJ6Jke6ukZegPQ4umSvx9
 +WgW+vh5IT6zufxTwTdErvz+Kc0dHXAT+kNl4aJeQUGiCO20WxL95J9VudX7RUP7eXKbQNYgrp2
 pdV/d3sDdsAirvy/4RttYcYkC0huYsw1WMHTMJrq0mduBw2olA/tgwE4u+MQog6uOtiDT1SIjuM
 V0C1iNkbz81HosBmsI1wCYjf5EbtWWh3uVbte+9vGhXbtBBV4gUKdUTNVCXv3DsYTDDps9mcJHl
 r3brDOspDHudZ/nPpzzgMlww4aGD/bVwZjiA8XRy+hHJI83h1HfOqb7szPGmFzkpHazROHWtRpS
 OBslA4es6/yVWU0qDHLs34a0ftI//xFOmTc/3N0+Ida3j4V5lkxbFUaGEgDcxae2+BDzCO0fi80
 Yo/IatjTva5WaJFFytQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01

On Mon, Nov 2, 2026 at 5:20=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrote:
>
> >
> On Mon, Nov 2, 2026 at 5:42=E2=80=AFPM Alexandre Ghiti <alexghiti@meta.co=
m> wrote:
> >
> > Hi Kairui,
> >
> > Back from holidays, sorry for the late answer.
>
> Hello, hope you had a great holiday :D
>
> > On Mon, Oct 26, 2026 at 2:38=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > >
> > > On Fri, Oct 23, 2026 at 12:17=E2=80=AFAM Alexandre Ghiti <alexghiti@m=
eta.com> wrote:
> > > >
> > > > Hi Kairui,
> > > >
> > > > On Thu, Oct 22, 2026 at 5:27=E2=80=AFPM Kairui Song <ryncsn@gmail.c=
om> wrote:
> > > > > Perhaps we should instead always scan the full clusters and revert
> > > > > that one commit? That commit was only following the idea of keepi=
ng
> > > > > the allocation more compacted for that series, it looked good at =
that
> > > > > time. Since fragmentation issues can be solved in other ways,
> > > > > contiguity seems to matter more for large physical swap devices.
> > > > >
> > > > Oh, okay. I thought reverting it wasn't an option given the good
> > > > numbers the patch provides.
> > >
> > > That patch is 1/3 of a series, that series yields really nice
> > > results, but that one patch plays only a small part in them. Or
> > > perhaps we can limit that to SYNC devices?
> >
> > I'm a bit scared it would not help zswap with writeback on, unless you
> > mean actual SWP_SYNCHRONOUS_IO devices?
>
> I mean maybe we can just scan nonfull first for SWP_SYNCHRONOUS_IO
> devices? These devices are less sensitive to discretely distributed
> I/O. For other devices we then prefer to keep the IO pattern
> continuous by using free clusters first.
>
> That may just fix the issue you are facing?
>
> Or maybe some threshold or quick scan in partial_free_cluster before
> putting the cluster back to nonfull.?

I can work on that as a follow up if you want, I'll take a look anyway.

Thanks again!

Alex
