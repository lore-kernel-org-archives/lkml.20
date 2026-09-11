Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63B49F13A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143659; cv=pass; b=nOCLPRCLEZ92g0TKlbj72FF9OR89IyPnJySHGcowLsUB568sUQqCR+0VM/pqu6Djum6sTNHzRstkNCQHm/6RN98E4XSfrqC2cpd1PHGnvdKLZLi4++Iv8wBIOvYYPcqc+thEEbvTRn0PlRT70H/7nS/5xyvLCscnNvjcoQYT1yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143659; c=relaxed/simple;
	bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zurdnyl3AmHHQ8Are8Au5zrG7WA2e8dMEd+gaMr2A0S4rHzh7BdwAmTnfSYq/vfeKE7h6YfgfMgBv9+FXov8WL4WxSgLrZzTyOePX1G6J0uWc068AvI+zoe/fE3nj9wfXoyWEFPcooVI6tXZh6iXFAtIV4DWHySX9dWjm2QHezc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWMLKD1v; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWMLKD1v"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c255c58156bso261355266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789143656; cv=none;
        d=google.com; s=arc-20260327;
        b=CMsyJVZsIoXlANjI2jspBIpxE1p6ZVNFwVuS0F5tIjD3ulyBUjqghFoF5lvOTnGa3H
         5NVHRTsk10Np9J3HPQq9PYNcUQFHwIkl7xu3FCvTkMPQuYIn3mIT+M8g0BFv9sM4RMlZ
         H8WLFzWKxOuBJCQ8shFamRZLieSpYR1aQB02c2esDEA8K5EvxhKdOP+A1gzSK7L12JMl
         q7axQJl/WH+VFeVvr9aAKAXTtta/cHXbd6k2HOMsxnisE6X/rRUNI4a1nFslGJLfxT+E
         OL+Y5xV1V2uxDKJCgOBWSV0nHis6xz6lqKj2u2dzUQuN9fXKTJm86OAM+H3LfSy3lr4X
         YLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
        fh=zbCP2+CwfyyjU5BgSVfKtixwsHYFJWTFf+UG0XiQWV0=;
        b=gV24mrJvpaLK3g/V96xZNo3dU8yMEIm6AFwyXX6R0UUE7lOJlbxRDTTqVM8obL7X5b
         1PaPSQU2CSnYfs9uohq4v8scHRhGp8o9YNLqlNiR9SMxH0FQxag/sD4TTtwzW6LnvP+z
         6ywHwuE4fiqd3XCpeQN8ioA1Fv2kdnzCP2WKYUDQ7G2X5IzKLhqvx4KQ9UfDU2Cx1GkR
         ghMuJdycJAsMh425OETwWr3oIvfxw3CgzkYzYcwuovsBUeRE7iwn7wE7gyugl7TIpgdo
         kKMVMic9InKiC1cWqusHTiXCN0eQ9aarUtQeAA3DS8jUiFOyrrLiDMv313FkdD6HND+X
         lJgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789143656; x=1789748456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
        b=rWMLKD1vCNa1MSkFM9EAcQ/BzM+sRbFwc1QFC0icP30QjihsMH0RPDp/Ee9/4AnQCq
         Sz4S5mfJJS5km9J08lAOM1vrcGIF6tT/lgJ67qGjYxn5u1OkG4TLBXEAZ8eSoD75imsC
         gHeBZ2StBFaHXq0OHOxC6g7Vv84EHRP6O6Wue1JB7+bNeesfXPelLRRSnkJEVOBWGHwF
         MVXKZlhKYFm9eS6I/+RUaSuhrPXKJSuw+AtJqcpxehV08+bP74jRNSTRy1bcNDOQjBKi
         l7MtxA98vwEcjXb9FdY1d6bJx4zoTkqehPMIfu3+m/iYWAKlsHJ9JiAYV00k21t5aqh4
         3uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143656; x=1789748456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+30lDlcgxH+NCGTyCWjhWPMaOa6aoqrueHB2CoYy+g=;
        b=WfXqnlgEbaVOf7UM5FlFuHOjHvUPuwcffvii8cCjFCrEBAo6PVMXozu+BuhGYpGwYS
         totkC6bBurvIvLPmiAzjr4b6Dw8FvAmE8SInz5eOAa+WwUsAWd260EBR1IkaKzOxFs0E
         lKNYAdnwv2faNysknw9jpGW6vL2VS1X3PHY610jfeYo+eKaMXnXJub/vp9s9v2+p92vT
         Jyb2K6J1F4g2ULyEhQSK2//Q7k4SNu7KOmTmveUmIcMiINGu5HFCzrDlCLCBZa4hW36U
         nGn9s/g+93vZpho3QAZeNPYIr7X33eEBiseYCZkWelsOPxSL2pn5f6bVHTigg/EQxM8C
         bcvw==
X-Forwarded-Encrypted: i=1; AKwUvBx1KI2lzZwO5SshrbJJNbN4LIPXlz59WYNowED5X1Xt5SKFkR2n7j4P1HRV9eC+R7Zyg5o0ccyAxZppfOY=@vger.kernel.org
X-Gm-Message-State: AFuF++lv/pwE51QNN6uTDvhZdSsVvVB6O1dmDVZ4SENY2mRMWXW3sS3h
	i9Re+SP+wsudQb/7wuYJhl1f4Pw1XR6uvSzBmuNUIyQvTp79mN6mRtynL7DnbCuVvgxPcr/O2U/
	tl7EDLAR3/vN0iBXX0lgDvdNUMBP9V1M=
X-Gm-Gg: AYBFou3UdyCZgqjzOHnU8Q81ZetTH+/qfAOEnWdpjN5f2eak7izCPLAOa1LlHhE8YYI
	dwU0ivepT7q0PATa8xwuPZwv5H+Z7YaebrhOpwxhqqNJU50Bu437Mjkd0fpLFjIupEVaM0i5BsJ
	gquVd8+4Fo2p58xf27PofCyTlfdKljHzGj9DP/BBgSRsyxcCpCFonXyG3QccJ297EjQ8z1HJ/YM
	bkohM6FB43LyczLx252NPI2sLPItVZpcNmeJc0uXLO3wC+2xab5d+kkpGxTs02xmnnTjEq7AfFj
	wSA8xMBMD3WxaV34Hpg55aiyV77pB2r5eNCiBVJNjxbjqGvSdlznOewECvdwj5GT1GVB/BcOgxU
	X/7xRdzeUCL55
X-Received: by 2002:a17:906:c141:b0:c29:5151:16b8 with SMTP id
 a640c23a62f3a-c2966534d19mr204979866b.2.1789143655518; Fri, 11 Sep 2026
 09:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
In-Reply-To: <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 00:20:18 +0800
X-Gm-Features: AcwNN1Wybf6FDfg7sUWRjBvgNHNibYe2e1PczxS_TZMQQ3Wr5_VcCDK8f6zS35M
Message-ID: <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Fri, Sep 11, 2026 at 12:23=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Thu, Sep 10, 2026 at 3:57=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 9/8/26 18:45, Nhat Pham wrote:
> > > On Mon, Sep 7, 2026 at 4:30=E2=80=AFAM David Hildenbrand (Arm) <david=
@kernel.org> wrote:
> > >>
> > >> On 9/4/26 23:14, Nhat Pham wrote:
> > >>
> > >> Hi,
> > >>
> > >>> To Kairui, Johannes, Yosry, Chris, David, Andrew, and other (z)swap=
 folks -
> > >>> I need some help here.
> > >>
> > >> I'll mostly ignore swap-related stuff because (a) -EBUSY and (b) we =
have quite
> > >> some swap experts around :)
> > >>
> > >> Reading below, I do wonder if the swap subsystem needs some more coo=
rdination
> > >> and collaboration?
> > >>
> > >> For example, maybe having bi-weekly/monthly meetings to get everybod=
y aligned
> > >> and uptodate could be something reasonable?
> > >>
> > >> This approach has proven fairly helpful in areas where (1) multiple =
companies
> > >> are involved (2) many concurrent development is happening, and (3) p=
eople have
> > >> different priorities and requirements.
> > >>
> > >> Is there already something like that to organize development? Should=
 we get
> > >> started with that?
> > >
> > > Hi David!
> >
> > Hi!
> >
> > >
> > > Thank you for your suggestions :) More collaboration and communicatio=
n
> > > is definitely needed here. Conference is a good place for this, but
> > > it's not something we can do very frequently, and many folks could no=
t
> > > attend (visa issues, etc.).
> >
> > Right, and conferences usually don't have the capacity to squeeze too m=
any
> > swap-related topics in, so it would have to be side discussions or BOFs=
.
> >
> > >
> > > A bi-weekly/monthly series of meetings sound very appealing. Swap
> > > contributors are very spread out (China, NorAm, Europe, etc.), so
> > > coordination will be tricky, but let us figure out something.
> >
> > Yes, that's an issue. I'd suggest swap maintainers take care of that if=
 they
> > agree. I could try as well, but it's rather tricky right now on my end =
...
> >
> > As an alternative, we could also use on/two/ ... slots in the bi-weekly=
 MM
> > alignment session to talk about swap. (I'd be happy to learn more about=
 all this
> > as well)
>
> That's awesome! Thanks for the offer David - I think MM alignment is at 9=
AM
> PDT Wednesday, usually right? That works for me of course, but Baoquan
> and Kairui (and other swap folks) - would this time be convenient for
> you?
>

Thanks for setting this up!

Is 9AM PDT fixed, or can it be adjusted? 9AM PDT is midnight for the
UTC+8 folks.

The time is still fine for me, though, I tend to stay up quite late
anyway ;) so that time works fine on my end if the slot is fixed.

Is there a calendar invite or something, please send me one, I'm happy
to do a swap sync discussion there.
