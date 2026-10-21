Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575743;
	b=Q5ImstKYOK/VoSeajfhUTrHAS5sXgQSnnx2//Nj+eE5e70MzZUQlZqPW8p7c4cToz55J
	 muyQV7Ov2zFmMRhqyQCZDj439dT1z4dsuhQh4b+wxrpU+cnzfyKAkI4I2q3f1fFBtqViP
	 sIsrdt0rsHmaUhPXplXtG87K+dGYhVMjipOnb1wEsMS1j7VC5riWLzcDCOVoKmJS5yyF7
	 76hUZqk/sBm8Iqk3RHN6Dk8IFb7mjd43JP7iCuoTzexYL6dyZvreUwYhRVoQqV2ZL4duW
	 UUah+fl2VzRsLCdzuATOdWQctNGH3svZzNd6dEFk91HN0A3Fkc/y61JN0Onc8VklAXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575743;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8G57XmwynB3mR6uqi8qOOjUgqBbEb9SN5unyoR6cdBc=;
	b=YXVRAW5PVEwIugoeuPhmW1lEJ/iSRKX3pVTr/h+6CHMy4lBSZ5XMngD9qi1sTXUBw/6I
	 dV/1c0K39FhVaQt8xRNIkg39cO+ecvDMXsTFEf2CYZXU28YeHPEhn91vDueAgXwxT/Le7
	 tfeewiEyGnsA+44dI2KAmge1OEJOgtFp4GilJDViUx0W1E0twDGJl0sivnJKm+Itx+Ec3
	 RFfx4AlYAEtp1b8u4Jx+NbW+t8NzAzb4jEeb9Pwk1+UhTzU/KjjjlY275wBkVHmM43zrl
	 tF371cM0ITM8Pkp4Fi+F7sbdIOBorXfl8FVw6GuWdRVe4RuRNvKYk0qwyC4o0jhpSag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jilo8k6Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1FA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jilo8k6Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825CB1F01573
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792575743;
	bh=8G57XmwynB3mR6uqi8qOOjUgqBbEb9SN5unyoR6cdBc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jilo8k6Z5wiwnrH4plvBWdxS8RtonTg/JgZofxZHOOXxDzU8nFF6LsmfOjOgIikTC
	 ddSVsbXALA+BsGCsSOppLQ1BdnD88owUzKlN5rY/DiDqEDmwS/VDJwB72CUkL/fyMQ
	 PJrxg8ms6x11WCb1ryTiPltSt+QYeAJinNHVpecKVCgqjy0sLMiGx0k83cJp4orDEp
	 hK0DW/3Outxkn2sdWPm1l2a78M+rTs1KFy5r09Ww5R2lbukzefQyRt1v5+2EpLBSWR
	 vBTcsrTQCio72mFDkCi47TM96QapYh9ntgmQ1KL20OFcxyFdJB/xT2e2cNsvt9h+gq
	 vofQPTxDvMP2A==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f20b304c0so60390185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5Ismxq++5nlJbLGcPdCfQsKBzqZCZVYKDORWN/iKWRD2Vr9Wlne5LNr/zb5ea9dVLvXpli+3vbF1pB3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyR8KrqtuCsLLXCoeZT9C8QxWy8Rn6laZq2sMfFsKcCmHjgH/U
	wnPZK7/D+EDoS55KgfOC2GJSR99pCksr98PlTaw8HF42Y/zM68s9iD0rwlvuO3tV8lTBYHDGNTs
	7cP8XHJcLin1wRQnj2TEzPbllwPGiLcU=
X-Received: by 2002:a05:620a:40c1:b0:93e:6283:eba6 with SMTP id
 af79cd13be357-93f57f1cf03mr308028285a.38.1792575742833; Wed, 21 Oct 2026
 02:42:22 -0700 (PDT)
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
 <CACePvbVbMPZTrD5y=--XgBS+sa4CHb7e4RFTYCbWfzHzVc3vXA@mail.gmail.com>
In-Reply-To: <CACePvbVbMPZTrD5y=--XgBS+sa4CHb7e4RFTYCbWfzHzVc3vXA@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 21 Oct 2026 17:42:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w0A_xwGZrhZWqUB1Csj1QsMx3VzjwKuSSrP0ajymCw=A@mail.gmail.com>
X-Gm-Features: AclHuK-Lnt40pgtt6cgtli_2uN4Jy8RyL6YrVOTjl81POv4J0v-Ixt1q8_SZhk8
Message-ID: <CAGsJ_4w0A_xwGZrhZWqUB1Csj1QsMx3VzjwKuSSrP0ajymCw=A@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, YoungJun Park <youngjun.park@lge.com>, 
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

On Wed, Oct 21, 2026 at 3:41=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> > >
> > > On 10/19/26 14:24, Nhat Pham wrote:
> > >
> > > I'm traveling this week, so it's a bit tricky. I cannot make Thursday=
 morning.
> > >
> > > On Thursday I'll be traveling back from Cambridge. But hang on.
> > >
> > > My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.3=
0am - 2am.
> > >
> > > I could just naturally join that day.
> > >
> > > So one day later would work for me.
> >
> > Would that be too rushed for you? :)
> >
> > For everyone's convenience, this would be the time slot:
> >
> > PDT: Thu Oct 22, 5:00 PM
>
> Works for me :-)
>
> > EDT: Thu Oct 22, 8:00 PM
> > Europe: Fri Oct 23, 2:00 AM
>
> Ouch, David. If you commit to that, I understand it is very
> challenging. Thank you for taking one for the team.
>
> > China: Fri Oct 23, 8:00 AM
>
> Other swap developers: Kairui, Baoquan, YoungJun and Barry, when you
> have time, please comment on whether you can make the meeting as well.
>

I will be glad to join.

Best Regards
Barry
