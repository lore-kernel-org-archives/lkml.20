Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793801190;
	b=x80KbwlZUs0Cfr8lkR5mNcspZ8cOSYVokzHMB3pfY05Tzx5AQ9HcnLo1olV1cPkweEUE
	 qkKrJnxRmF+jOXixXJ+fdVanprMGUoSJEwNfvMXh4lXk0fAZTy2fAyze4vPmyDLetcavx
	 tQWts5UQhsTOkVBK441hHRSSUSZPMYbHFYYIttCrH5nrpXi4AAXQ/0RA8UMvAFCaPHyBV
	 c0mwfKpGmqrqSuOp75t0dLNTIPm2X4hUeZBUh50HYLrplzBV9ycGQEr3pp0Qa3lMdhCMQ
	 eIkbXjQ/Asw+7r1u6OvkOvpWkB9Iejyrdtg2zvlFKWQdhRXywmjVjxqrlLxzhaik+9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=QAMpWDWruKPumB6Xa1CYIphLFL78E2eeQCtuZQA6IQE=;
	b=bp+fgeNfIm2NuKHhKqI9AgSYX+nSKrAQa5JHI652Iv+V22OxS/B4DGVIur3jWqUjtds6
	 p5I7SMOcpPuAj5abhOwQ7vGa4Q5Wja4s4wmLIRlf+m6NUlzigacIaWjCCGMlh7voqMNQj
	 eVG53bN2b0pBj8CWVQZ0f8+9tLTfmvGMLk4+WVsONaAWk2gLRXejlx9J2iliZN73dG5WP
	 AK+U1uMTvqD/+UwM1IagS8oa6KpRdOOINF9U0N0+dYk/Ee5BTTvxL0kEY11baBONYdCHI
	 zbhyhTBhKUv2GeKAA7/AWI9ZdZPjZoQrVgXWmvSJbbQC91L/Ug0RO9yTxG04WQSb8Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=YFDMIGSS;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D52606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D52606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=YFDMIGSS
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bcrml850186
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 06:06:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=QAMpWDWruKPumB6Xa1CYIphLFL78E2eeQCtuZ
	QA6IQE=; b=YFDMIGSS7tBalD3DxD9rUovijS31f1vY8iPYKyCDvc5ROgVf8/PYR
	9PUIfbBcNEL6hyRDrPIAjV6H6HpMwYSHNgRElSJSv6yhLkDApUdqhF8Rd9Q8+mlV
	nKgGkb0jd0mGqcokKWVkPUZIIlCfbyvAw25P6q/tZr9GlXjbuqweDSvJWtJPSDXf
	7kLVklEXcF1a1UTyxbeoEVpYJ08wi0Ico/y8i/3VETsnX+s4DAkXhS5wueDontDO
	rE3P9T36rhts8f5GkjiR9XBxnHAHHEzS0EW7sgVRJIcMokrRWufCR08Sf6XMVO4m
	Y8jwnvlMRtiJihnqNy4vXqf9jwI4ke6bw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hqmmgpt20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:06:28 -0800 (PST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b18d691d54so13451617b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793801187; cv=none;
        d=google.com; s=arc-20260327;
        b=LelxB2vfOObNn0d+Z9NqXi41r9Wm003ImsUeXqF4AQbzDPZMes/YYHRHB8baqFlEKH
         cc+M1PjuMSCslPcfspRaAK2TNN9Ipx/3Xnxjn/WV9PJ6K0ZDlb9t/vqRkW2YxNs916eZ
         P7RvA4k1xZENQUUy9dQpDniFPSCUybCQBu1Z1r8dsq6JvpaL5S/U86sdGixSGFQgxGpM
         YHyBomvx+gazRBzUuLYxQNb/Du8U8PC8ezMzBgLeGcbUKiS4Cx9TOCPawGYanFlfAh44
         RpUPaaQvO/zxh97HwUzgBygd/7im/QXjR0xiQGRB+OluWYkxroP2Ukc4YRPQjTYy2RSb
         r6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/f4EP84Fx0L/VX6arx5pyVe+AN5q2SyBdZOt/navcCg=;
        fh=bwFEm9rwiGOIj2ldTD/0xjtL0ieZydAwmMmB84lSKRU=;
        b=BXfCrrguFz+H0DATGWZyHTzDOi1c/2oioLzZKPz6dwQJzr8jdG5V/6ZNXirucYIPJA
         bR8TnMOsYWgbckGNR9pUNzvaUik9JjmQg8c+Gg2cnBcl+xxrLJ5Q58w9ekpaJTKnD8KY
         lYiCXH3J1yeJel2QYAxjpqBUsJJTnfV3WySF5Xu0dohHG0EAOJRIuGklxL+iCHKLU96A
         lupfzBtqF+sIWyS4Fq+M0oyLqOMhcGz1WdnF8Jk9JC/NX+ruNpAqeNMRKIdtVD8vXChZ
         TNK50dz2E+fD5IHJbtnlkn8r1t7k2ptVkD7lretNXP0KdRxGUlgpM2l/9epnSQHX6uJ4
         KZZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801187; x=1794405987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/f4EP84Fx0L/VX6arx5pyVe+AN5q2SyBdZOt/navcCg=;
        b=r9l3WUSfl1W9aQOWGCRxvcEMJjAnW3zi0WogRvDX44kvfh9WIVakOc5d6twB6OucG5
         /bsCOrlGxoCnOfbWqDBR7sgjqWb0lqPj8TpBbqmrSvk31FuHFe6IvDCVeCj6wqtPpU3r
         T+ekFX6TeTV5djEiD+Gz8dP39bMLXDfa8xbS+VT/IRAM/i8D7rFUritjVUuLmAgjsK9Y
         5WUFXzoJqgQQGDucoEHRdGixDDIQHr5pEhkTSZ8P/Amk6ovkhPb3+N6vct+z6k070Aum
         rYTRx0/Ywvp2PiUOFuTm0Uc3muGJiD/XUus69Q7LVZhxuMhJQFGmw7UHyXe7J1mlHdvV
         XSUg==
X-Forwarded-Encrypted: i=1; AKwUvBwWZjamu0pXG/uqoI/yck1Eq7Mx7hgMwzNT3ILwqfxM5PWeE10wgEaFbWbMNhAEyQDuukb/P7SNV3UrXkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q5dgJcr3NELPj9mXYKlXCQyEdJRHmKTKyJvfYCAAm2ZV7WAbL
	rq8fLPyF9+sYKqvkorJ4loGmItUJFh8BbBrfc7ouPIp4TBTUU9Zua+qTLV/dD3V3K3eAueJDKE+
	PH+5YkSIFZS+gCxyaSZuhZ2B5lOX+0k6DnbsxBYfz7Wj/v6SrOgSsOors5IvxQ3YFGp5ZmZxDl5
	scVun++PgM/2hiuowdNv1aCuzmWQjyIYMxnJ+VcSw=
X-Gm-Gg: AYBFou3HoXGDMl51opDqMYJY9Apiqtw3K5X10ZsIh1xwDg7zZhnL+3wqXENTR1Omf8d
	JtvQ9eIUsMnHZXurjEspw/QhY6ygnG4f+FJ85lGn6UgaNd3Zmt4xSWzqHJ1O++JeS+bLH165Efw
	nCfrf49Xt9M2KgStz/9BdSKFrgn+/7LheANy428nhOXSjgnSmIP0YhoKBZiw3x0MFElRYA0o8AL
	TX6vlXmY2FjMwMHww==
X-Received: by 2002:a05:690e:b87:b0:677:b923:dbd3 with SMTP id 956f58d0204a3-67ba5053dfemr8349322d50.154.1793801187379;
        Wed, 04 Nov 2026 06:06:27 -0800 (PST)
X-Received: by 2002:a05:690e:b87:b0:677:b923:dbd3 with SMTP id
 956f58d0204a3-67ba5053dfemr8349284d50.154.1793801186561; Wed, 04 Nov 2026
 06:06:26 -0800 (PST)
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
Date: Wed, 4 Nov 2026 15:06:13 +0100
X-Gm-Features: AclHuK-ywCYCDes2w5waoGRQmyFziLeciMzNMPbjxY3l1ZmHrzYocw8iw65rVKU
Message-ID: <CAEmasaUoAcgwBJ2Q5fa8NNrxw7xeRXWH_sDGs+GP=L9BVRuUVQ@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: cqaTHZKmCoKXYmwXCr78JNIiemDAewcz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX/UI+NuoNNW81
 QM50lP82pxof/EEZR3wlg9DlRm1tSe7xuMl+D3o/jUT6c1Sk+2GVuK88VSDyH12K/St0767s1QW
 WSfOsuQAJluQU9io7IvWEYqI8VUBXlU=
X-Proofpoint-GUID: cqaTHZKmCoKXYmwXCr78JNIiemDAewcz
X-Authority-Analysis: v=2.4 cv=PeZqFShd c=1 sm=1 tr=0 ts=6aeb3be4 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=pGLkceISAAAA:8 a=VabnemYjAAAA:8 a=ScCvlEzxO9iafL6ztjAA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX9oUQcgBP/rKR
 MKV6KB9fescUcOCov0npoZOsU5MlTCZhbkpU/D2m4VRiG6cemJ5vFQINrJOSoYZIsQWQTjhQ2wR
 r20bIvwdpljcmeA7GU4p8W0HPzzypL64SZ9Uj4cE0vhve9oi7IFHVlaDCfrrAZBPly5MRaYpLdK
 rkcjlJkYzeANasxjbPnkQqoSdyqDmx37+F8B6CaBU2k+rON3DlNrpHUaAN3yPmOQrD2SWo12Hqy
 edO+1X6luT7X/dic07P4AE0Wrn+VdhydH+J3sZxnpCoNSU1ixdD8ImcT5unrM5a0NVdgMhKkbpI
 7hWxV1FGm5NL08OacqASRFdg2Eqx1hhe0YF4tLB5h3Ro4hMekJBdi9SHarcY33XJOoWHsSUW95k
 D/3hC4/Fth3v7FMu5T3T048MmSMkY4qpmQPY4zxVx9gkQCiai0nHGMlm+DzZm3e+cYCqocobIVb
 3fYKyVRqmBZNl0iYpZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01

Hi Kairui,

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

Ok, I'm working on this and will send a v2 when the benchmarks are over.

Thanks for your feedback Kairui,

Alex


>
> That may just fix the issue you are facing?
>
> Or maybe some threshold or quick scan in partial_free_cluster before
> putting the cluster back to nonfull.?
