Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603C51FCBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910779; cv=pass; b=uaW/9PXWjWO/iLK7xFJnRq/NEZcDDh3nYLGAdm8Bs/JF/JiQFVmVSEZBptLTUjU20L5L2Nc20c7c/Uu9B5D691fnpgef7JOmBn/WMmm6nMpQ1Xf79Z929w2tfyNUS18sCuaIp28i4ifoPjMFUEyl7H0c/t/Q3ZAhR/xZLJYJhQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910779; c=relaxed/simple;
	bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngJM3oaApXhNCPSNI5d6QNFs+tmRtZyYFV2/khrBOT6EXq1FeGyrVGNchNz6lE40RuilwepP7DAYGw0kTa4ZeOHW7M0WIfhAEg4l6Bz2iyp+MzSYy4KKXxyTTq6+E7qjs1PnRh5pqm3RMjxqCwdzWe5ZSy1hHghI5cI1aSK3WfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpOXiEQ2; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpOXiEQ2"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so517843466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910776; cv=none;
        d=google.com; s=arc-20260327;
        b=MCO3mE3enHIzBjjXR74o8sj3Bpu8TfUODI7sWVtrtuockdMg7AxTIeeA0av1O2wjbF
         IE/ZLeBo/4VSuAnKgqn9Ps3mGVi7KHkAbinKR3jHS/99EwiUu8pzFaoT9ulG834YqCzX
         5vUrZfLylCuWsJxJl5ehVfcuA8iOWwgc3JfSxuBQ7DvYMoXXxS8g2LE+fgoTM3SXZ9iu
         Zr0xY+EfbFvgHdIjrQ/BpB5po3TJQuwuq7+sT2yxgvs2FfDlXz9HygRXaHHx2n58t5gK
         Aj0LHsveU8z5YnLd+n/7wOH4Tb12X0NvA0xmSf/WmHScPXChprOEtTYZgxJyK9qn06+Z
         Tkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
        fh=/npVV/k+0nykZX/ijXvdb1jZj+jz3+YzOSJtmrAjF7A=;
        b=SJGz/GWEbuIvkvilc5OJIL3VuYS/alj9Mu8dck5ztn//fAw73UNN1fRi3SsLI7xhrn
         8TVKfCnX60N4IawpnVctn5aoXR5tK5MDzJx1oLjFJpt0FjcMdi8/GSc4ajy9xZ9IY3lj
         qHAAhD5FW7GKqQj52Ur+d/tj8+m/j3jcplueLw6Npq8vANJU6wGR7Y5M/hLKlFFx1lHh
         v2U5Y0kU4BhfYH2mZFqUUkXOTXtJVkZwKM+le5IMd5MySJwowd4CHbwUzxMuVgaRUbPS
         tT23sDqzJdkdVnKUp1xgnYjZNI24Ue98MfJEEp6abrfE0qsbG3fD0PVTGvCzVitz3qHb
         HcTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910776; x=1792515576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
        b=EpOXiEQ2SPQ6ZYYS52bSNKUx9gytoN2jhpEeJXfbT14FmKBNspqqzphM0++IIjSFFi
         tj2gzp6usgLn0QMPxtm1jfEG11DNn9aiUjDZ3pJYl3NmGZvPQ77rhTH/iostTGbD2/gB
         7KUxKMaCmJzVnW3Vr5/inj8DWr6sk5Pakw7Smk3lFXcvr1rLx/g6ZW/ViOTX1LrB9zoJ
         fsKkqVjdG8zYiGuYzeQo7KIpXSAYQbozbikn6G1G0zEzlWUnXoYG/QYUeOD6XJk4IoVf
         wBuxjgbYBwHk/wtgEKXIdE0CzYxI5cBz6mgybhU/XYNw8MxT2++D5PxvHRY3oE6rVocE
         tEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910776; x=1792515576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Irc52p7IpU94MjhUuTv/4weSSBLioQxa3X0dPTYCCpw=;
        b=sJDxMEfdFJztQsHptowMM3SVdv6lIU+un5P834sN+cNLYkVCwWkp+pDNR1KCJU55Mu
         p3sMv0hB2+ztOM7fWc7mX25OQSiCHJNvlucYzBsGGXH540k//c2yEaRkgrkbKYYwLDG7
         9qvC5h0tegVKlCAS/d+gFifRlQVpM8k5CoLyKHUT67cHoxYxac3DEc8H1zm/bq8XUxuy
         X5ua26PPaYXSc6QnVP7J/EX+RPQCrNcqYN1UaFe8TQoROwSyI0YHceDNu04FTMST5e7k
         v3oTId1cXCSWYMBgaccl91aUpRZofBlw22olPCzO5DlJGmDaAUmn7qGSXxJXZkgu8tqX
         iNmw==
X-Forwarded-Encrypted: i=1; AKwUvBw9qsFFfQG5EEkfk4g77N3viNiNPL1Eu+14ANhkOG46N4+u18FksqXaPhDZHmfPTyHXyTOVBCY3m3Sz5M0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk49s7P8BeuemkV1NLs/TLEkrSsnTGO5GgjupDsVXeDmG+bbEi
	G5HiG9wBy2kJPLrDpH5H65qy3hBjDAM+/bCyDsTJWJL9V5QutdsZO90QPabS4YuoJ+7xg7Mw2Mm
	MLjJWxce0hJfx4gZKnrzuMaI8pELbBw4=
X-Gm-Gg: AYBFou30CNN6KcrlfWPlCk1pcMJEYYVlNESp79r2XgvDG/UXpGDEFTAywLzprBdE/Bs
	hXNY5Z23UlPqN3NR4ghzSbSzXpafah3a9fn+UhHZsCyntaMh6bSdDqtjZD/GSJEyYJE7P1hDR+n
	xhIl0x4R46fGRx0fFqZfY3irKXVfjd1y89ZM9GOigpfitZ3W5JvjCf8+6s0dTzXa8P/Xy6YAjCb
	I12tOG2GJTSW1d+QgcJDyoP67dQufBvkZjmVvEPlUI8UZIG9x/2R0q7KSvqT4HaSWZk5u3tj3uA
	pQnlpyVdtHJwfAU46F+StKDIuC6RK0gfGChDreYqegZS4opMmDQj3zOaaGnsx9lA46HqP73/39t
	J+VDERL2p1bYE
X-Received: by 2002:a17:907:3d0b:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c31a9feb26amr1246342766b.10.1791910775410; Tue, 13 Oct 2026
 09:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com> <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
In-Reply-To: <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 14 Oct 2026 00:58:59 +0800
X-Gm-Features: AclHuK-dRyf9eKLDd-E-CAUCwm0MgTdU0FQN2EyVlbP88Wn126rzBlk5l-Sic0w
Message-ID: <CAMgjq7CT2O2VHpwZazugQRopi4grF+T4oOxZznoAGvy93Yjh-A@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
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

On Mon, Oct 5, 2026 at 8:19=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 9/22/26 15:38, Chris Li wrote:
> > On Mon, Sep 21, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> w=
rote:
> >>
> >> On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org> =
wrote:
> >>> No that time slot is too late for Asia developers. I don't think we
> >>> should use that time slot for swap alignment.
> >>>
> >>> We should find a time slot more friendly to Asia.
> >>
> >> Any time slot would have that kind of problem. We're spread out across
> >> the globe.
> >>
> >> Let's just use a standardized time slot we have for MM alignment sessi=
ons.
> >
> > There are more swap maintainers in Asia than in the US + Europe, at
> > least based on the maintainer file. Please be more inclusive. If the
> > alignment is done without key stakeholders, it miss the point.
> >
> > Sigh, we can't even align on a time slot.
> >
> > In that case, let's keep discussing on the mailing list. At least it
> > is accessible to every one.
>
> Looking at the mailing list, that approach doesn't seem to work.
>
> Finding a time slot that makes US, Europe and Asia happy is ... tricky.
>
> 1 AM is certainly unpleasant.
>
> US vs. Asia is also tricky, but doable.
>
> China 8AM vs. US West Coast 5PM?
>
> China 9AM vs. US West Coast 6PM?

Hi David,

Thanks so much for suggesting this. Sorry for the late response; last
week's travel resulted in a lot of piled-up work for me.

Both slots look fine to me.
