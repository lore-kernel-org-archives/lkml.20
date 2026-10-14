Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8A4A68B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016775; cv=pass; b=qLXlTZioohWVLAzJqiKi6cQOmlihDKAfkSDmsRwFpLIcId5f8/YXgT+2RNNMJSofMQpZSGOkg5jxrhXPe1zgrhBa3ctw6Hcb/P0ZYdz5yjmYfWtCPdPL9moOwWQAuHlAxOfKjOglnXHRpkfs+O4eCjYUyUKy1W5Zqrbefw4t9cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016775; c=relaxed/simple;
	bh=hrLsYh+bDCQ4SD2pq57KfdodfbjKTaIF5lmaAgEwzww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jjxp2rYsr4mqPulqjgH/3U+1CUleCEFSV37JLhqRqPbakwj2DXn8e7MIaUnxKxD7Dzr+xT+bLGPu+somHZOso0j3MvCi1uPINZD5LOdY33b70mhy4SQ4IIRdR423NrLdW2wuWFqebm/HlEq+NrCvLzRHNfd+k/ZkdiSpcsXSyaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+vRRsyY; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+vRRsyY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2277f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792016772; cv=none;
        d=google.com; s=arc-20260327;
        b=mQR3J+FnAa3Q67VviQCtNOCWB0SwswwoIHAQF4KnWAayrZ/yCzb42SEqOydle+U9x4
         TD2xLYJshMFgB0Nj/wvquimePa+EOvUkRlBHVIBxgOdi9nn4jQH9DNbKlXml3frYWE6L
         ik9iv1JCdfhBEVCoFMwGAwT0G4TGVmmh8yHx0EPj+U7Go11BVTIzMdkD7PyGJ78B5x7o
         oa7orZgRkgjEzRhfzbhOpNUEuOwn9eth+zYSo5sRojFSXoIlgF/xs0iqFd4qJiTEpQ70
         KLdbCtsUrykEEjfArBqDaRElvuLPhjU7vNwE5lv+YKRGSgbUALXqr1No3MgG5gxlg/6a
         7fow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hrLsYh+bDCQ4SD2pq57KfdodfbjKTaIF5lmaAgEwzww=;
        fh=FRgGPqLDjOR96bw62d9cnftVVcaPElw/jO2pTX9yzCE=;
        b=r28xJ3NXbXxgdStHjkiQLZ9VeTZq34FK4Ux/n/8axpC3xiLJUGWe8CGlSqLJtVG3OR
         3MtAVK0QDs/scidobaBXt8Bs7LRCOTqkrxaPQ3pd7XEXCg3mkaBsCikIBoTN7jQi/9zu
         6hqXGdVWrT6U8NRZsLbYHSQOKYYHEi7lHNeYNQQg2qIWnHTvDn9i8dNr717+pPVZWx35
         GW8ryZAN/HXrahQv2uHBnAovx46xiC1mZqQtEvbKg7k+cRBD84oth5b9cA/LSociwVWp
         MfK6BQ5jVhNWy3HzFuHnbxeutxNV6scZ/uijtX8vY5pDsZCEFxHBOOK3LgQSmJXL5Ba6
         wLKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016772; x=1792621572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrLsYh+bDCQ4SD2pq57KfdodfbjKTaIF5lmaAgEwzww=;
        b=U+vRRsyYf1VPz4EDCCYiMcLlU3AeHaiwPrhkP8xZpdm8KuJAcQ6unZNbbU1Yk3IrNH
         9n7n9ne/6Ge4jv79oIhj5hCWFAb+vU9Lpbo2I89QvYfygf9F1kq5DnJ7+ZkcNdk21myK
         rcjzwr8fIgVSA65F2BVdsis7O0pB5bZf4SlAXnljYbuQeien+TWWyc9lFcM/AehztgeI
         wPXt9fXau/SshPB7IaZeXgB72h80fAfSIagwpzP4XpeA79dvff846nXO9A5e6gntNcOS
         Or+vyCTAQewhxha674X49Sbgf+6a7Lm4t49K2VSJ5chNuxqk7i0Ove5nLz8W633GdhcR
         zn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016772; x=1792621572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrLsYh+bDCQ4SD2pq57KfdodfbjKTaIF5lmaAgEwzww=;
        b=FODY6vVXdpq7mHc4nhYhxBWwaEHoMjjheeoh1sSpTuIpJtG1QL3bBQ1j7z/h97YkIA
         ScVHVjr6D8gGRZx/4sUEeYyhlFH3l3VwdSzzQoxopbz1J+9eAx3YoepDVVgGZYrKWkVZ
         x7xhrTT7Y+7++hvNoXmAkN59F3uINmVEmSTtxsgF6wCsoZEzMcxSiFnPbmz34O3uwOB3
         0E+IYe+TWKZRqlfQ9TG81ivVds8p34UcKRchoHCNSYzhO0LP7iRcQzk31ESa1VBkILxe
         oIAPuISiB5qt33J0xv49LiLrFlrpwp/jwQh3Qe/zTfyLB11JhJQFmpKr0ZuoYXnHvgaR
         DbaA==
X-Forwarded-Encrypted: i=1; AKwUvBz9SgiPCuVu1A4dvwkCPMNlm0SO2zDYYzbsi4FnLHTKr/iEN3Z5XxYX84axMJRYYxwjBcI7bFGSbgCnPJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS0OiLi/e2ZLPv4Ehc7UmhZEfEldcIolUa227/1tQHODePxUKW
	AWS3adPH22zPb2pl+vrNNgkHzlE4nGoKSMhoA9RbgHXqVqoIzEN77/5cIPO4+xy3ojv8qjvmfm+
	UWLvtI+m/EMnO5gChe4HEoerAVspMfLY=
X-Gm-Gg: AYBFou0RbR0Bnnrg5C/tE2AGhRhdjei/L4ZSsAok9xxyYC7ppaPLJqU5Z9xCNi7Vji5
	6us5C+sT4knLSw/kyUlJ2vJvzOKxfxqUuTB9Fch8enN9/HDqbMsxGawN+UUKu0uzk1/RWja/+oX
	WnvvjqlMY7MDEON0QiQkkRsUM8uaj+98UwNhwMqZQWqGouo6HcNEsHDlGCLuLsbk7BDWDrwIMw6
	0WWgjeg59Hf9X6WBdmpekp+K7BhkcvC7SoWxFSN3MW0B+m+eAfeJvnJfVd2PYpm9cynEb4ugoIb
	Tt2v6u6gaHhbldZ1QTc05kRAaW9zHV4nyaLbQbw3l/FuDE19SeWQuwP3o/7XrGrq6Cbv7AZliPm
	OdqHFbarFRHB8PH5FFubnX7i1lHs/tYqastnQOA==
X-Received: by 2002:a05:6000:989:b0:48d:b650:69aa with SMTP id
 ffacd0b85a97d-48dbacf596fmr32237437f8f.50.1792016771662; Wed, 14 Oct 2026
 15:26:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013221307.850803-1-joannelkoong@gmail.com>
 <20261014030737.2102-1-lance.yang@linux.dev> <CAGsJ_4wxKQK=caM6a_AqJArGyJdBgq_=i=gSNjiVePkGBZHnpg@mail.gmail.com>
 <75a46520-0771-4a50-ba77-ba815dfb6bac@linux.dev>
In-Reply-To: <75a46520-0771-4a50-ba77-ba815dfb6bac@linux.dev>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 14 Oct 2026 15:25:59 -0700
X-Gm-Features: AclHuK9UfZ-sx1-TECHAp9W_R-OgLeze4vd70DCXAYZ9g1bHKOlxo8H-AHDm1oE
Message-ID: <CAJnrk1Z_5x05rYRCwX=SDvK9v=AB_bHHe=1csaPA_yZj6jbnUg@mail.gmail.com>
Subject: Re: [PATCH v1] mm: unqueue deferred split folios outside the lruvec lock
To: Lance Yang <lance.yang@linux.dev>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hannes@cmpxchg.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	usama.arif@linux.dev, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:24=E2=80=AFPM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
>
> On 2026/10/14 11:13, Barry Song wrote:
> > On Wed, Oct 14, 2026 at 11:07=E2=80=AFAM Lance Yang <lance.yang@linux.d=
ev> wrote:
> >>
> >>
> >> On Tue, Oct 13, 2026 at 03:13:07PM -0700, Joanne Koong wrote:
> >>> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() ca=
ll
> >>> folio_unqueue_deferred_split() on folios where the refcount has dropp=
ed
> >>> to zero. In these paths, folio_unqueue_deferred_split() is called wit=
h
> >>> the lruvec lock often held (move_folios_to_lru() always holds it and
> >>> folio_batch_move_lru()/folios_put_refs() usually hold it for every fo=
lio
> >>> in the batch except the first). However, it's not needed to hold the
> >>> lruvec lock.
> >>>
> >>> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> >>> the deferred split queue lives on folio->_deferred_list in
> >>> deferred_split_lru. The deferred_split_lru is a list_lru with its own
> >>> per-memcg per-node lock.
> >>>
> >>> There are already other existing callers that call
> >>> folio_unqueue_deferred_split() without holding the lruvec lock (eg
> >>> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> >>>
> >>> Add folio_batch_unqueue_deferred_split() and use it in
> >>> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() t=
o
> >>> unqueue each batch of zero-refcount folios from the deferred split li=
st
> >>> after the lruvec lock is released and before
> >>> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> >>> critical sections, which run with IRQs disabled and are highly
> >>> contended.
> >>
> >> Nice work! Thanks!
> >>
> >> BTW, have you seen measurable overhead from unqueueing deferred split
> >> folios under the lruvec lock?
> >>
> >> Any before/after numbers for this change, including the cost of the ex=
tra
> >> pass over the batch?
> >
> > I recall Joanne mentioning some data on this in the link below. Is that=
 right?
> >
> > https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te=
8G1MaU9bXs99w@mail.gmail.com/
>
> Thanks, Barry! Yes, those numbers answer my question about the
> observed overhead :)
>
> Joanne, have you rerun that benchmark with this patch? I'd be
> interested in the before/after runtime and lruvec lock wait.

Hi Lance,

(Thanks Barry for providing the link to the earlier discussion!)

I have not run those benchmarks with this patch yet but I will get
those numbers and add them to v2 when I send that out.

Thanks,
Joanne
