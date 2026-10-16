Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD4346ACE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117379; cv=pass; b=lFDFmM0wjiEz3mn6hcqthRSNRDgcFs/Q3+Qh3TsqteGomAsANPyZuD+TwgctgcmUcUU01KiX6khVWPnnUCigJBU5hReolBYUF1qW4E9lsEBNBrZDFAs2d/U9dmJ4KkQg/My/uotIInHrs02+7v7TmyPhjWBebqadCxdORWFv6WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117379; c=relaxed/simple;
	bh=1I+qejHQKLZ6VA0Vsr9kjAAS61H1zjVwCONTDKcoWsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUZTwaJsBh6ojXa8rDHXymD+OaRuVlEreyybSSKnldkVkacZMuMnIDyEGf10zvxY0QBtSGGhqs5M5tKuz5LyPqOUgSKNHXxWQ2iFTkXEKHoldqYKBKOMd4DOV2kqHzeWEj1EFCz1kM0FHVfpKQq5aeBUr3zJBmcnLZCh8otIw18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/1NMYnD; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/1NMYnD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1791175a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792117376; cv=none;
        d=google.com; s=arc-20260327;
        b=Lw01boL4MhWbGaLYejEgmPyPul5kAMIYVcPt5/JudjP7RM8eaC7ykzqviqh5vX+boi
         7PZMZbzzmJnHnaYre3cWa7rHf5ebgUMUcgspB27YzOWAjpnw8LWWjrPpOkBIWvRaumy6
         By8J45BTLvonBXBOufnySiZf+yIdLTgk9PQFQjUyhQn103eJq/bdrzZ1YfMg2OKEkaq0
         NackJfPmcGET53HviMaUdowGQ0LBJs+du6NsHsuc/DaE2mqLgRnPx6S5k93IZfSGOOu+
         +/fOES2WmgZrWrS7HV3RliURlsAX2NQNvP4ZsEbxc3ESwoqoqpRWD6hU73I6SzAZV+cL
         S+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jh/0G0ZYQOyM/zqDXg34ETho8wDUNuz0didpQnoyiNc=;
        fh=kjRkfrssh7AuXigjSEoyGHG6Rt76EW82sfnfOjekTwo=;
        b=A5BUMfxZbDJHU2WYDmROzffFARNFjSkO5xyVd/ZpLCuayxhwd9Ap5MF5az9ad99UlF
         nI0fDLq5YNnuG1y+f3fVAnkQDuiOgHNf6jVyZCRVZrQ3WPTgDd8VTel+2eeObPcyfBzS
         n42KVsbXC7qEMTOP5/HXr+FEU8Wg/5G/Yn8ocRPPKWTcSU6LCrJozgu1SwHLA3cqGGy+
         xT1rzJo/TMnBZo12ptpRrelo+FuEnrR4Oqmzq2RYvYd8iqdItkklB83k2AR9CWm7+gvh
         0fe5l0KMgzDeOOUGsgdU4HiulcpqipCoDtY0PJjqERWxv/a0UefmPNbecxWRv+JUL80U
         1Fqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792117376; x=1792722176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jh/0G0ZYQOyM/zqDXg34ETho8wDUNuz0didpQnoyiNc=;
        b=H/1NMYnDi3QbQfnfuRHVNdGSjwCbVe7xItEaUUymQV37N3jQYcEqHdanlWawlQXSWR
         1agRPB5tITpRaDs8NqqjRxgVD5B2mpFUVxQlD7agtrRX1obc/QaQC8C8xRZfcy/ICETW
         gNQO2IYWsOoEQKf9tM0oEGZamlbuMdVkiowLXmBSwoIfDZ4ORqBm/lyXRH3100duFqCq
         g/5QzH4ggnKSCPe0YDbrIXCskMcvoOqYvmrZf49rgABMq7oB8pMaBPHN0+aF1s5lbc35
         XtV3awbsp1fkn9hqNxEMzJEcsymCIB7seUdEE14oJTQlwLtdHBXV9YohnlNoa1VN/32g
         KYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117376; x=1792722176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jh/0G0ZYQOyM/zqDXg34ETho8wDUNuz0didpQnoyiNc=;
        b=V1pBno9lY+f0FjfyczrTaqYPs/tZzfj2CIRJyDcLaA13Kx3xyxRqFHV1yMkbqsri+5
         QdMRcEKmP1jnHjMx+QwlGNcJJlg5jhnKoogvaBdJGwVc/Dm2MrlBJP3iTzOkc+sbWIis
         /arUQMQLtofnha0zyz4gDfMPneP4FIF6yKg5CHTA7kKDfR9V4PDON9+DQCU980MrAuJp
         bIPieP5/ISzPjs95YTJiTDM8r6G0JolZFwiiYYl7tF655w0zjnHWZx5MkjzMnu+h4Rnm
         LowOJMaFfG3PgtvVsyIWf/uMtTEnTv6aNfGnSruiFvscQ3g/5o0h/GqablMutfGn9+EO
         fmkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1arVzJ1603s6UlO06EA2Nuk7fAdWzgmRPvGALb9YuR/yuv2mq0o7CpH9DJ7jbC5ndxuLMdy09n4i1G60=@vger.kernel.org
X-Gm-Message-State: AFq9FYIenG1Q0XxUoepJwMDD3Zn7d94JWWRg/6d7ilj8kgkLjF0AwY5j
	91ByQ6xQZPnlHCj7jKyr9UbFEg4z4xvyq8uqcjz7hPLOfuMB6Zy1xGYHA7lkzNucl6qwhG6LXqa
	I3Sp9iArDGlFd9pyKQGHCah8d1/91m7A=
X-Gm-Gg: AYBFou1NBZKnxFb0YVdee9Fq3skCotRUjitxXE5iMx+aqvtmTMZ6cbJxAGibiXsM2wx
	SeyfdLy+RrhXh6c61gPFXp2SfngBbvY2tKAhiKg1XtJA894kW1RubuljCUu5XYnAhPyVkcJNFXH
	wSY0V4Tc2GyzRNjjDtC0BXsI3/jk6hC2rLTMdIBzEynkCMfAHqHHe89nClHcNIEqelnNCeWvS7w
	U4Se9cc6oSzPbxJwJ64F1EyENQQ0KYs8dGw4OPYa5eesmwBJtzeBEBs5ehLjTAa4SuUBQFKa42+
	NqR4wf34qtNG32Jg2UI+8ffOEhk7kRuLoCriXlX0FT2cLxg5Qs8bYaBniSp4rl3PmDufrOm9wwr
	rakNi+7fnOqsr
X-Received: by 2002:a05:6402:1f44:b0:6a9:93c7:ca57 with SMTP id
 4fb4d7f45d1cf-6b17c29942emr17390376a12.22.1792117376453; Thu, 15 Oct 2026
 19:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
 <20261015184014.715dcdd3a25e18fd4df49e95@linux-foundation.org> <b2f925b6-93e6-4b44-bc18-c94a34b381eb@linux.dev>
In-Reply-To: <b2f925b6-93e6-4b44-bc18-c94a34b381eb@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 16 Oct 2026 10:22:20 +0800
X-Gm-Features: AclHuK90w26bVbnVGbbVThIr0n9_20vKmHT-hT2gr5ingTf8fnlIELNh8L5ISUI
Message-ID: <CAMgjq7AGRP3B0UZ9-wJKtz8D-ayivhV0gn2WxsrJ1Q=Qm4TVWQ@mail.gmail.com>
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Jiayuan Chen <jiayuan.chen@shopee.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:16=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
> Hi Andrew,
>
> On 10/16/26 9:40 AM, Andrew Morton wrote:
> > On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
> >
> [...]

Hi all,

> >
> > So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead an=
d
> > takes the folio lock of someone else's page, before
> > folio_matches_swap_entry() finds out the folio is not ours.
> >
> > Recheck the slot after folio_try_get() and retry if it no longer holds
> > this folio.
> > Thanks.
> >
> > As always, when fixing a bug please fully describe the worst-case
> > userspace-visible runtime effects of that bug.
> >
> > I asked $LLM for this and was told
> >
> > : When the race occurs, a swap fault can acquire a reference to a
> > : physical page that has been freed and reused for an unrelated purpose=
,
> > : potentially by another process.  The fault handler may then clear tha=
t
> > : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio loc=
k,
> > : and potentially attempt to remove it from an unrelated swap cache.
> > :
> > : These operations can interfere with unrelated workloads and may cause
> > : unexpected stalls, impaired reclaim or writeback, and potentially
> > : system hangs.  The subsequent swap-entry validation normally prevents
>
>
> I don't see a way to a system hang: the folio lock waiter is woken when
> the real owner unlocks, so the worst case is a stall. I suggest
> dropping "and potentially system hangs".
>
>
> Writeback itself is not affected, only the PG_reclaim hint on where to
> put the folio after writeback. So "impaired reclaim or writeback" ->
> "impaired reclaim".
>
> So I'd suggest:
>
>    : When the race occurs, a swap fault can acquire a reference to a
>    : physical page that has been freed and reused for an unrelated purpos=
e,
>    : potentially by another process.  The fault handler may then clear th=
at
>    : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lo=
ck,
>    : and potentially attempt to remove it from an unrelated swap cache.
>    :
>    : These operations can interfere with unrelated workloads and may caus=
e
>    : unexpected stalls and impaired reclaim.  The subsequent swap-entry
>    : validation normally prevents the wrong folio from being mapped into

It's documented that caller always double checks the folio so this
part is harmless from the aspect of data corruption or crash.

> >> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache =
and switch API")
> > Given the above, I suggest adding cc:stable.
> >
> > Do you and maintainers agree?
>
> Agreed for me.
>

This is more like a optimization than a bug fix, but it's clean and
easy to follow, Cc'ing stable is fine to me.
