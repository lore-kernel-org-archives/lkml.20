Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DC466B09
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391672; cv=pass; b=gzfdv2sa/2PZ5Pbcqq3y3NziZrVud4KWxQz31OO0cx3mvzt0ewQekhGS3tgRh91Z0HZvXUaBeDDkTmZi56GwPa9o28nEfEFLRBNG2ykpYrpUJHhphVKzuAJ2KrJy4+DziTyswZMwKBjsEXgy9aVhEWISpOdD4lxbmk7wZvAAkyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391672; c=relaxed/simple;
	bh=mUg8bGzuDc1hntbJS6/jkPP2umt4kBrIq8LnvLb+dZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuJgcfWb1uXlzYhtmgWMkoA7z7XSkQyTfONJ97Wh8f6/SHZZlEXBsskdGxvpQYaRiGr1+4sT1DWUmyEgo9yeafcuE0DLfjOXvTivTHKR4XrqhnP5p4pu4MQTtVl5eOSwLhZUFk88P+6SPgM8a0aKZzLIQmMzsj/NgYJA8K9AUlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYE0ZNhR; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYE0ZNhR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1436396f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791391668; cv=none;
        d=google.com; s=arc-20260327;
        b=msqk+bHxP9OJTGwLSkoMfGsOUrknqhsTKPzBoNl4l+FnVOhL8k1eiy3TmXnSP+138u
         GeNXfcWW5l0LCdLNUTnq/4xZIw0xT8xXJY8lirtNdij6hu+8eT5/ngUOqviEslWbPHmS
         TNgJKaaWnkTePG4eMhg1yyi1aBz+ccjuHKiheUKZM2W2f24G5TKfFyaxdmgGuBxqdmRR
         Q1l+LHaBrpEQ/EtDIpBQcfBEJ2/QmwKCeXyxssCrOO7ku8+zRMf0gtoXURuhMJefxuBr
         jqXRMOXIo5ob0iNzo+n/drbl2+30IIMD6nXRL8xkDgxUc6RTfjhlJ72KUSqlfWDt2s95
         Uyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mUg8bGzuDc1hntbJS6/jkPP2umt4kBrIq8LnvLb+dZA=;
        fh=w3TUXLrKIAw37QZx9XYa0obs7h2wAe99VTf/P2tAO04=;
        b=nB+E0n9pElxN9r/V2WjY/O1MGCNShOPXJgMlQDajr9zOUg+9fX8Bs8X5l1sHFAuRtH
         lSjT5LK0Y7wpJLym5oNovpQdOOFPoRWL06GfVcAbLcyA362D+Nlfn1p2IfaeLXFfFNbU
         SzkYTYLrliSCUOFQRp7Okt/wZlU5yMVGNw919LxTN7jjGERFTvAEUkWswebgz82glAaN
         Ms1HbZnmllrwhRCi5cB9y+C+ZjiqKa4v4BnNOHC+6ROhwpNbZyGYQG8CIXfFmBfE+s7y
         asawH+bnBYbva65VpFNhbv4ZpiguXI43mby1AHSi2w2Bg7wqC+ng6ARRSoeSZ4G6Cria
         rIwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791391668; x=1791996468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mUg8bGzuDc1hntbJS6/jkPP2umt4kBrIq8LnvLb+dZA=;
        b=CYE0ZNhRW7efU8KTspmjqXfyMHO4ZYVWRTFgwe7fP+knJzS7VUE2CH1STR36Eny10m
         RFiUt0tFf3UIrJ4nKHc4trvWnPwCYxnep2REErqho/RImTVdXsCgSjMFWI4Caz5Gecga
         QvWjQ/QSAeaxJrRiVNvpHuXlZYxH0VFjCQK1gV8u3+ALDz7E0ITRPhhx0huF5fi/0vSY
         2RKlARcRv6d8+0/F176Hmxyv5jTIZCTNCn3AoR3A/rWhaWEMPNMsgfuMyarfUK0KeFaI
         TkUV4o91p7LAaG1PN/pk1NA29u1HSq88X1T4R7Ufn7hWBo2WyC9dWFVLAjtW/l8UYuWU
         ojkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791391668; x=1791996468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUg8bGzuDc1hntbJS6/jkPP2umt4kBrIq8LnvLb+dZA=;
        b=ZZ1OwMTzZ4c3jh18reLb6F5BSXPY0uWEBH1DwCWYqoVsR/cSvLIltGLVDUlYk8VruC
         pFaBrWIQ8b5XKnWkilXAwYMpzYLNgopdMvJQFLQrAsp61G4xUqnO51XfxyRzRYyPGELs
         SxeqCF/+14ATANqzKxgvPapk9zmsLvRVQIhz3S1bSibCEPj3RvNxnpPQjIxwuJsoPfFt
         qDNuy/QG0g3F9+BVm0uOzbUoQgVOe6GE+3tC0vRjba7inXuCov9fPfYH8Fz55+/hkQ57
         NVx4cOB9F0fxlTxH4nG1kiCnyNSEhBTVTJbRHWpTsox23onScQOgYTII1CVDwgEwfNtD
         AQAA==
X-Forwarded-Encrypted: i=1; AKwUvByMc2KGyFhKSRgKgGcfk/eiGyo4a3dBeK07Eh9S/+QZ4ENlaO4AUh6EFnvay+zOq93qwC3o3ZwsjaR8m5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLObrv33ixwGsmnGPetcy8FVi9Us1WfMspfA1Xt4gNdKHpyhmXU
	XsQTUYFbRmf2TTdtM0m9Di814JqDaZ2V601vvRGxtTHYSQUtmK+2tiplpxwg9jY8cUsM5S/zChW
	LHJVTb/TwEu0yYq4Iu7yUYCN2/dVsWHE=
X-Gm-Gg: AYBFou2BxP6yC0A93nUXWSt1pfXpRVK7BI2smqY2n+BYd/Gr9yEE/JffYUM4Aturt4s
	InWBXpwvocoS0+SH06SKH6GLMtrRBzSomqRsj/lSkCqBfjSywDYzX2Avvf9Rg2co9ocRH/PKytW
	RUEs090IE7fw+CFe9F8voIEjUPq6mdziZX1pMwk3AEOzqBMuIaDFE4iLVNQYEfxe1yd53V3+QBA
	CidCC+BvSQt89OXQKN//jWeyJ+wNQ20tW3ki3LCDaDqebs2B17SUGac8JVnpjfF7soulprUpUM6
	b+HHjie5C03tz5Wc4peOTh5zrYMF2iv8ax33zytMNI60zgs4Q5UNea+cd+Ec/ogtNp12S8FNFlo
	r8aTN6sK/FvzP
X-Received: by 2002:adf:f088:0:b0:488:5468:c23a with SMTP id
 ffacd0b85a97d-48c7277b307mr5249685f8f.17.1791391667725; Wed, 07 Oct 2026
 09:47:47 -0700 (PDT)
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
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 7 Oct 2026 18:47:34 +0200
X-Gm-Features: AclHuK-gd21Gfnuh5UQqK7_tIu770TUyW0AwEOlzN_uNtFL1qi4hjnyF8DTH4ZQ
Message-ID: <CAKEwX=N28g4T8mqniB-e+e57ie9D3Koaeq-EmV-TEk-u41FBPA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
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

On Mon, Oct 5, 2026 at 2:19=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
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
>
> (Europe is 2AM vs. 3AM, who besides me from Europe would join?)

Thanks for suggesting the time slots, and for offering to stay up for it :)

Either one is good for me. But there are folks in east coast who might
wanna join (Johannes).

Johannes, do you have a preference? How about the first one?

And would next week work for everyone? Say on Wednesday?
