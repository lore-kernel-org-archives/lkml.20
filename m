Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC2C4F7CCD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910900; cv=pass; b=USzoNOrc4nKWGH4+0rwebiHHuIYNYSvgPEpwXiRy7lR03vDtgiN5TXX1iYutS9Dypd8S6vtLeV4DsLMOgIX4HplC0wLDbh2QH7GI50497sdMSwKdOWhvVBwAGlhYfWo8f2xAStlbJ0/uqb2nslPOEc5obK+ALiJBbcfFeVgHdjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910900; c=relaxed/simple;
	bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsACpSx1qc9+sGLiOwrxgTOJPy6PQNM3LGeDJ2U/3fQ7GvzQ2pPhxc3UJWRXpm8pa1nh52NcvKeyGN7tnnoLSCMopl3krNEz+PFzF+aAlR1XGnthLb12SEdGE/K19QnnrMLtu2IhWmp07AxOLj+evxqLlR0zdEfedavXkE2qpQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY0w+n4Z; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY0w+n4Z"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso3089516f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910896; cv=none;
        d=google.com; s=arc-20260327;
        b=FTWN15+vw/l3EJUchQeKN+IGK1mz8XiNnyFoC5RTeSHvkeju0awzsOHjuiTaY20TAC
         nY7Pj/IGqEL57KsjSPrQLdzuLV3if7ycsG6CIRcfqta706I0k+1h3wnYK3lCOd47Jh8I
         OzIYPSB1sLV58Wk4HunWDDZBsdMRIL2ji6JQowuaeKa8a1LG7hMXw89ZputH2SF+kqjL
         kCNT1Gj6ov6eHggxE9OBMjYMI5JxiEoRv3xX+VdKmUXSOhh5GUfwzI2FLr0881IQ3uOO
         +JA1zvk8x1vzJwvi8Cl1jCEcCUelrwxztZY4EKVorguTmyNKgIdDl1HUGhzojH+gIGEN
         I03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
        fh=mL3YGUYr8fltGhdlv+7YtOX1IhC8xOjn8o6aDnN1mKg=;
        b=U6ur3EV38w5QYafGayCQ6fZfQ6vsYKBez48XCQ5k4ecHlUZ+29hVIkKTaE3SBMbAaW
         Pf7+qFIJbc/bN7EXDf9c1+ogVIBJ89xZ+P19+A27H9qWrVYSYtvBrMSFQRd53MhOmc8K
         hmK749ofymfSdE1rph9MFI8uwTgq4Dw84q9bZopK2Uv8CXuSPnxegFIfgx6qIEUh5Qdu
         iBF5QkYaNxm0l3EJwmYX05W3n7Okl0/cUQFWTe/Ag2VXpO89RHaRvYEfSJIq8+LLMDOT
         qtZXQl7O/WY3ks402oM3Aggy9TX0PoH16eylecYyCIxh0fxoKoFDXtWDvpKRcAMW5xDl
         t1kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910896; x=1792515696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
        b=UY0w+n4ZI2oEz92mn6vCgB6jDiC9Q6MTYhpgmrBlOiYQ+W32a1miuVNeU01x6saIGb
         qpc768FDg6saRtoVwUPZYmeX5WqQruAQiahMwZDC1/QWoHSRSro+OkXAMacQ9lJ3Qai1
         uSjK+wdtzYTLfz97Dq8jCrLTZEWtqs83AATENF+WLPiXusbT9aXLOigGGGq2Pb5rCJdI
         0zVXytwmGVqd4wvXdHmKOlCi2EfoGh2o95hVwO7eWmAxJ5dUfnJEZ4ilCxSJXom/cFjO
         bZAmCD+EPKj1ZqbEK40f9Q1UaZ6uTRwDbUv6sKoah14RT+ooPCdVLnJ0ncGwRA7oUyhd
         EOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910896; x=1792515696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ6am3LgmR/Ys7leJ+gNMiXEAQz+mkoYeAP0NcDYoRg=;
        b=u5lo2926wrKCH60z1vnXkDCafebPVNnWBEMIkXOhJOjMZeJ85eV8gm5rK3KYVVKj6z
         Rn06VsuYAlI2LocdoRF/ExZ/7//78Te3Vs0JXlQaP8BRwFBsR1WOucFxgAC5t+GkEaay
         j8TllzD2X5QHInIa3i8OQo6keGUzDCH9w+zN3gORzsOaDa+xtz12/Sh2N4jyTCwt6rnc
         LIpTbZHwNh1uV3cu7Teqg83MkaBSWeCnvqLarOq96GDOT0qd8mlQCBFVOvD2sMvgikzu
         Ebmn3MRVFwEe9nYp0AB9Y+M16bFV1oYoIt9GGTpQah4xKP32WVgA5PyuV/hZQz+J3Ndw
         VkDA==
X-Forwarded-Encrypted: i=1; AKwUvBwupvOVSwyObkIcp382OK90cKaprq+SmARnYaew15tQLJ7/EOtYJ39Azon3eQnpvtKRx2Naa4aOasDmT9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK51rxpo34mFgtAg+XPivU1vXlUQMEU2OQRkQgeJ8jo4CrDLr5K
	mXg+Nxd/0h+iWZ5Tkony23ol9/Z9nV/L6BJdDW8gWlLt7iCFkePo5ilZDMVQGtnqEliPCA4csXJ
	ih4ALWj3dn8JXYlqtvNAFZQTakOz9CF0=
X-Gm-Gg: AYBFou3bSgAw77tA00xHXn6NBIT4j81tnxKfsDJCDPa8VG8VhTMbQxmFltaN84EfY1f
	9+/Ef2H1DyJsy8RfeNYfTrAaKk4a1YCtFWkuKB+C2/a4ySUdSvhK2dmSh5HoiOkj/iA/ehP9lLU
	79UIg945wCBEc4N4g5X/11T6men6DCAhLNEbeOlVZ35mb+ScSxTqeIwIB8MiNSl7vSFvdYH4JRM
	PmLtWMlcZ6LxVTY+c8Iny3mLjAYUX7xXsJXMYeFWyZz9HYzRA2yh9TcHvrIXQUEBkQewu3Q31mY
	sZyCw9yU9/icHCCg3MvCgy5DFJOqtgUEYEWYIM/KS6BzVTn+tOGRrxnNxdhW2Zn2Ympc1q3caTZ
	l8jTidu3oeRn8y0GpW8DnKzHs2MqRmjg0jN5u+qQeheUs6/8Y8lidNg1xlgLTHsZUYvZVBRE=
X-Received: by 2002:a05:6000:1ace:b0:48c:571a:a1aa with SMTP id
 ffacd0b85a97d-48dba9dacf6mr28217721f8f.19.1791910895957; Tue, 13 Oct 2026
 10:01:35 -0700 (PDT)
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
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <CAMgjq7CT2O2VHpwZazugQRopi4grF+T4oOxZznoAGvy93Yjh-A@mail.gmail.com>
In-Reply-To: <CAMgjq7CT2O2VHpwZazugQRopi4grF+T4oOxZznoAGvy93Yjh-A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 13 Oct 2026 10:01:24 -0700
X-Gm-Features: AclHuK9oUwgVv3XRRzK2ZGaoq7d_UoCd4WV6CrUoKrvhZqpz39_1MbDWEVKEMOM
Message-ID: <CAKEwX=N8qKhhVUR2Xd-UdtE45g80Ges_+BU_sCc2MzoVS4d4ww@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Chris Li <chrisl@kernel.org>, 
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

On Tue, Oct 13, 2026 at 9:59=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Mon, Oct 5, 2026 at 8:19=E2=80=AFPM David Hildenbrand (Arm) <david@ker=
nel.org> wrote:
> >
> > On 9/22/26 15:38, Chris Li wrote:
> > > On Mon, Sep 21, 2026 at 8:56=E2=80=AFAM Nhat Pham <nphamcs@gmail.com>=
 wrote:
> > >>
> > >> On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org=
> wrote:
> > >>> No that time slot is too late for Asia developers. I don't think we
> > >>> should use that time slot for swap alignment.
> > >>>
> > >>> We should find a time slot more friendly to Asia.
> > >>
> > >> Any time slot would have that kind of problem. We're spread out acro=
ss
> > >> the globe.
> > >>
> > >> Let's just use a standardized time slot we have for MM alignment ses=
sions.
> > >
> > > There are more swap maintainers in Asia than in the US + Europe, at
> > > least based on the maintainer file. Please be more inclusive. If the
> > > alignment is done without key stakeholders, it miss the point.
> > >
> > > Sigh, we can't even align on a time slot.
> > >
> > > In that case, let's keep discussing on the mailing list. At least it
> > > is accessible to every one.
> >
> > Looking at the mailing list, that approach doesn't seem to work.
> >
> > Finding a time slot that makes US, Europe and Asia happy is ... tricky.
> >
> > 1 AM is certainly unpleasant.
> >
> > US vs. Asia is also tricky, but doable.
> >
> > China 8AM vs. US West Coast 5PM?
> >
> > China 9AM vs. US West Coast 6PM?
>
> Hi David,
>
> Thanks so much for suggesting this. Sorry for the late response; last
> week's travel resulted in a lot of piled-up work for me.
>
> Both slots look fine to me.

Hmm let's push it a week. Johannes might be out for some personal
stuff - I'll let him respond with a preferred time.
