Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792795142;
	b=XLML1VFDTFXTyKHpvsYlmn2ka3IgUVOp/AgMcSujYkFLLjsQ3d0hm6zel0KSbKiqFonq
	 898MkAQ+AN8xOURYL5qzzcVL0hPvEF+Wk4Za4DHiuOmRl+BxpErihCeo9YA79U5Q3dezZ
	 clGSBtBQiC5FnAmy001S3C+RvCgQjgzocBToJvWK/reZRA4eKjZTrDD8tkjVC6G+n6DLU
	 KU0WIeeMUZX2PQColoBo+wx9M4gn9TfXsNruQMoz8/LJi4SGyor03LVIpMKlJLTkj6WHA
	 aPm7vNJ9kf9+vTI79nCkQ1Hlla9wB0KM4FHOUfXekYmq5MSTjfusp1A6rt2o482gujA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
	b=VLU9iuSw5GboePaT6AuFKdvt/HG2fSPqxtkt5WfSpJaKFiwlj07lA2cLhwCVihQcG18E
	 o7fJ2x69ERRPfl1+p1A+cKdccl2EKdkvh684PDwllWTo6ID42xIWIY/AgOuRFQm5+nTm2
	 BI9SFbXafJ/Ts3raf+jMIem3V5vPQIVBC/yrpOcVRPqOohrGidPI6OCoNY79Ge6+mg+vv
	 9FM+/eAsJHaRxoL2oW68YoA8OO4ibzr7kCIB5MqFs1SBA0OEfx9f1p5afKq2OTlcBW3U7
	 kFeCZJ8gCxUVVHPR60OrIDVcXMVm5fbP2ie20tizBRFFQjXxileEap8hBU3btXpmtog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h2JEsMGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DBA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DBA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h2JEsMGR
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dc202a60eso698504f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792795140; cv=none;
        d=google.com; s=arc-20260327;
        b=iPR1hn3lY3JFMgl6KSAaBFgqB2Y+5+lDyCsxi06/36xPnEYj8jzGvLJE1CMNOrdA+x
         pU0e9QaePUaOwD3vJzE/+eU9+ocWIjAXYVbDDH3IPgO7gN/Ud4hnr8LI1pp1jXWS+GBE
         lWr/codPOjal1Qs9A+0euhHEKCIZnMLBzwXeRnbQda6NLHeO5Mwn3aaOGrb4tA8Dn85L
         fn49IuLWVMHzKKXXno9NJvVi81+dpOgMqwi5patwL+2h+NGuON8EjIEHDWoBTXi3x5qQ
         sfBx7g9mM/zcSgsRa6O5zNdYmfYeamFDeTVlA27epFyifTqZy39tF+Q3ydneP84s1P5r
         nKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
        fh=7inVXxjVBgnOgcW7GwTYuGJSD4QBRfpm3gzDnDr4eSE=;
        b=ncw698Jav1qbiL8jdjG/IFNmfFN4Kb8N/fovODpf8l3xfH9GBK1gO7FH5NredBdMX+
         NWZFsJBNfUZXazGwOqwEoIbPMxC/wbVdDbwILNZg+C5UWNDJqfwIpUpMhILE3mUjLDAq
         sdapFisZf4tpFjeQDLHi3OOoNjsIv6JtmyVCcZk0FMW5c6Z+KhL0EbJAdaUuODcneNPP
         kGxRuJKOSpMOCvooV2rwUmskZ8wsoviqU/klxkfponUz3mNaZh6YuJ7NfBfU1vPU9vR+
         z0Uqzm8ufnmBX3Endlf3tCdlGEjMp0lb52S/e075DwhJ+CS4td2Mgak396TRpo5pzZ2T
         bUfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792795140; x=1793399940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
        b=h2JEsMGRrVURSB0j47TGc5GJasxIhVL/JHhnfpggkvfbknB7iXYx4eM3fv179YZizS
         UDP0PvSpu3n/sqjgLr1SrF3YXEfIYj+wNtrMzD4T2trvVG1avenYj5g3ZI+meZwGPRK9
         opn7VSPA5ZI7wDpF+91pO+99cubxigV7u0ifnJvgrwnqjxpMGyoOflnN2rJ4GbjRUn3+
         UaYcfeSvsBOUXLlS3Itld7VGw0rSpsygpl6Kkm8EnqjFSllNzdz/+Afc6yuZBmetCJHF
         b5ayg8KUcHpQIuOh3oxQ67ZOL86P+WJV6NHR/yZMHzjfHGdS/VoAQ/Ssp4lKbf3Qm6nI
         x5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795140; x=1793399940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQb9soIuy2IWf1LrfZEp4aNcssN1ddSrfFmGCMehWsg=;
        b=K2/r0cD1156IkDX1K0DW5E1wPh6wT1ASvl7dfge78iXQh+fSM80P42PxM48s7YwEPY
         ph5SdKjnU+TmNyil2obiiBWY6leQgGAvAZefG2LAK3t0Oax/cefqzoTRFQdfaT+UtNvX
         ud7iLW0b+Qxvg3t6bxDO7yKT2IcNmK6pTMOfsPH9SnQ9Hs8ZwvIEcOVvRexBBsIagBO4
         xeO63jikKaFt3BmJMdSJwAp7gu4eUSpsaDfpO+H7pjA1X8cEOWYyQcH3UVRQgh8/5k/p
         /o/9nzdW5RbE6WieVLio3Sg1ReJZhM6g1NdM3fTYsz81MKStzKY9czr2J8pBFk4sXh+X
         zoKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj03yDjnn/9rV7mJNx+Yic52Ca9GYRmIZE/BmhYF+0uF84C9iWGV5sCONQ4HgkxhJyHytn8xQVv5FAlhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE5PBp/5KSmdlc/9jpKZ0UJfkUEvQsleD5BRZc2NvAnMO7RAQK
	PZwRTO5tBnwokIPZxc/rJPdKKBG7CrocvZrAb/vJYeP0BL0P6uXNXwtvEiZgL5t2CIvtHGy9CNn
	pLtb6fY8OtBe2goLTRair1geTX4GE7BI=
X-Gm-Gg: AYBFou0IbSlGqgMmWa8DR50cRxXuynLEtU4DkStT8I/yEploVA1wnGyIHzwCy/k1dRi
	brQa25MfuabligzpGa3dG+kEHENee0SV//f5H2V6ZDzmzYoqmrIabDsVptyDb6A9xdK1595/GFX
	3m4sJZmEMMiIfl8Hkvk70bZ2KIErEt9vW3p8IbqHMdHvKDprc6X/oRuxuKGsyZtpz5cHzjC/EHX
	peve4Un1Re9GejZpFspzc641lq5qsnfbol2BztczDp16lmX0oFmNPVK8IRGJiX9YrsceHzGwsVP
	i1MSFgXtHOAvWHv+2jwJ+zZ/za6EEseC5VxBWNQcuMfSu1hW8PHLcTSoTJqH4ohy5T7/1vCMPjH
	HBe+UGjoKquHTxOYCf6yvG+2+gqQ+ZpeHJ+oMQD53hJFq3lIfh8UEhM41jpgScCVUzjl2eFPbJC
	df8LuWtiO2hVvx3+pH+VQ5e0kCFHGdHebzhx1W4ml4NTDQ9s4mNZZj
X-Received: by 2002:a05:6000:40cc:b0:48d:f069:570c with SMTP id
 ffacd0b85a97d-48e3eb93429mr575083f8f.41.1792795140106; Fri, 23 Oct 2026
 15:39:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAO9r8zOtK7YYdBNS+h5bNW-miKED7p4G0igy=D-=HRnGqA-38A@mail.gmail.com> <179279233116.3784731.9576593182600250610.b4-reply@b4>
In-Reply-To: <179279233116.3784731.9576593182600250610.b4-reply@b4>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 15:38:48 -0700
X-Gm-Features: AclHuK_IYUAj5HLbnP3AeCgr3emPoTaAjXpZJxAWWXcpmGT_QzEhtpufA_J3jmE
Message-ID: <CAKEwX=Nf57X+Bb7C+0L1L6bkVDw2rjTMSfn=xuMRsXY_qrB_ZA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yosry Ahmed <yosry@kernel.org>, Rik van Riel <riel@surriel.com>, Wei Xu <weixugc@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:52=E2=80=AFPM Gregory Price (Meta) <gourry@gourry=
.net> wrote:
>
> On 2026-10-23 13:25 -0700, Yosry Ahmed wrote:
> > On Fri, Oct 23, 2026 at 1:03=E2=80=AFPM Rik van Riel <riel@surriel.com>=
 wrote:
> > >
> > > +-------+     +------------+
> > > | vswap |-----| swap cache |
> > > +---+---+     +------------+
> > >     |
> > >     +----------+-----------+
> > >     |          |           |
> > > +---+---+  +---+---+   +---+---+
> > > | swap  |  | zswap |   | zram  |
> > > | file  |  |       |   |       |
> > > +-------+  +-------+   +-------+
> > >
> > > What exactly do people want to accomplish here?
> >
> > Today if you swapoff a swapfile, every is swapped in into the
> > swapcache, whether it's in zswap or on disk. With vswap, you have no
> > way to trigger swapin of compressed memory in zswap.
> >
>
> This seems like a missing interface in zswap, rather than something

Yeah, and I don't think implementing "draining" for zswap is terribly hard.

Zswap already has the reverse mapping (from zswap entry ->
virtual/physical swap slot). You can loop through zswap lrus, then for
each zswap entry, basically invoke the first half of
zswap_writeback_entry(), which loads the content into memory (i.e swap
cache).

But you're right - this is something that belongs to the backend
layer, not the virtual layer!

> vswap needs.  But you could just write this as
>
> vswap swapoff {
>   disable new backend writeback (swapcache fault-in only)
>
>   for each backend {
>     backend swapoff
>   }
> }
>
> so rather than vswap.swapoff() you'd actually just want a stop-bit that
> says to disable the swap subsystem writeback behavior to all backends.

Yeah if we can "swapoff"/"drain" each backend then that brings all the
content into memory!

>
> Otherwise the user can just disable each backend individually.
>
> --
> ~Gregory
>
