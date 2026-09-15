Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08643B2FCA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483002; cv=pass; b=m74OytZ436r3NTtP8EhrxfE/X5T/eFDh3hpFz0AoRt+Gntmtx4LS/xMhvqjkjxoIaBTU7XnsFnhB2Q/yFpZxKWx8jRb0gzFHaCweRbryAjSwXeGVU/bHs1wXTI/cFrZx5lVnckJR3uUpRO97297fhGYCoMjuz3FNuJriyceIMxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483002; c=relaxed/simple;
	bh=aenneIxZ8rD8c4yQkH++ZTEx6r1RyupMQQrEwwm1ZJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tdkcdy7P1ww+CGOHp6gbkhlxhBxfVbUWmD2Ci1SufbJiUFnq8FmPemwiI3IBZAukVipWPo2JBhF+Kg88OKYGHEUzhHldF+0sDqkha865LuV1uSs8h3mMFPukXSLmCk8wv0DnU9ZK4SP5scRMQDf8E+w+tqJKZE+DdOujop8mo7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tdQSzg6N; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tdQSzg6N"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so35911cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789482999; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5IFCCLeK1wW4g3ylxHujnhKMX0ojB+4T9trVa9Uu0Tq7ErKiDC6knn8OCLGnwGblI
         8ovxu8eoe2f5yH9g41P536QyytUxiQAzQm2Hv2mX2hbAtu/N8SERnCt0xmUucIXnwNA0
         uDfWAstZLDkwlyuFfgeJYX5+61DGCSOE64vQuT9Y6ZgWYv5g0bXtGHFmkZN7hpx7txAg
         7wswi/Dvf24RO7IHhtOLy+r3yS/0kxUFJs44qmIENCajCoFQw3d6SKeuDm9vn7/CH3/l
         DCsOfJEihaCWEKCHo/w6K/fLLUiE8jND0V31MSQvdFF3xSmhIwOJwG81dAxbJyvIE9p+
         vmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMRn/ahkKA5Dzm0qrPRXaVCV5b26ohTvkifPgSZR0R8=;
        fh=GdQlBL9GBanpZLOu9e5x4gvRTOPi3yboJBXtPwT7Q7Q=;
        b=MfsTomY9PTVJ8RqwpCvu8INMhX7iaQHyKvHfKfux8sj0E7HhuFaJFW5COo9VJMVJRp
         LoLOD8G9cHXrJ3a2ZbUOd1T5bRxgze+BIvt9YvdwmfpBjK7wlW29xJcc/oi9+d24D9GI
         hjPeJvsn5beTe7CdnxO5FM6asaQfFSTZ96P+baW5GQmO/qQh2msuyBdjnuZ0FhULuPZQ
         lbVCPBWW983qclek4XRrNZKpqVCEOWrcU+IIMrcc31xC8jZ+rMZBCb3r2AvtCDtikpHv
         vhtTS9I4gxJ/0J9mXE8yiMzkIJIpIzfB2nDYyP+AUB/rE95+DuqG4iC8MBqbRuWyxGUQ
         I5kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789482999; x=1790087799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMRn/ahkKA5Dzm0qrPRXaVCV5b26ohTvkifPgSZR0R8=;
        b=tdQSzg6NYZDmjdG1XX/Jtd9FkJxPrPXfopQMUEFpXW/2RjjXm1i+J3KkN1T2SCr3Tt
         z/sr2XT7oBahSsFsaqchDQfR6OTJSAiAQJ15zB5LC+3QtA/YXbh6emvcSDtmMRUp05ti
         LdOlIZNu6yHJ/cHcwut8Tlbqvg9AH/zgtyCj3/5K2SX1VSUQudgNMIcobqfMz8GrJ04e
         XFjmi2n6kLcd48xkw2PoMz1o6KCBU8FVXBUhk8EAYv2CLlgF30ZWczFT5No2v79PTTJn
         HuQA84BuerXA4Fn4NL/og2WZEL1HrQyZWHEqVkBF+ul/s+eXJOHJHsGS6Qmn+zhWNYVT
         AVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482999; x=1790087799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMRn/ahkKA5Dzm0qrPRXaVCV5b26ohTvkifPgSZR0R8=;
        b=XMGxG+k+gUrQqU6YKi78PNiyCGk0zFHpdRnMwxgKI342sJqg42+SF7TsxezdlbpqOt
         k4xI0lg4XJHyPowsRb1afpny/qOibzOKkuwOKsy1POLY4KsR7DLgHwhaYyM1QjwD638G
         bQEvvWnQn9dNO/VSkGMFLtBFaxAXVxJxYwngYbWeL+ENocFOpf8BJDeueBlwzsJSr/xc
         aFYS4KamXWE7AxXz7ldorqzSbz5X+oHzZ9GIE4vApokJd/6QiKAZde5vptIK9Sip7CVA
         R1A1ptsKxR4jo2On3uSmbQUCGgAiaGmzJiehJLSHdvP1ysB8FLWmiNJOqXoLnMmqHPJW
         2B4g==
X-Forwarded-Encrypted: i=1; AKwUvBxn5XgiDmBSa7u9AYzdqS6s0LC8nIxOoRBJss5Mj0Z5/kuJOvXLARijUWsCUElyXWdel8bzIRNoFu3h+zs=@vger.kernel.org
X-Gm-Message-State: AFuF++nh8ncrmk2wopx8SJliLqWXty6DI6Y7Z3iLYE3gIjZl8wWIPXbs
	UMSZKQzJkWo+lSTrjfT+sKS3Mw7/jVslq592RNW19A/kwjfCOv9W2P5sBV99d4Qn0zZ7+q11jnw
	EvinaU4jqII/t+rrlrmkq04qTV1KQcbqrhyHJ0Jpt
X-Gm-Gg: AYBFou2zGCRI9EfGAchMXotk2Z02V/CBaxBzkytZjl+clxng3mvgRQdROqnXLvGrRmS
	ZShXhmbbJT1UT+aVXiO3/I5sycUlD4sPJ0rhdixaYINWMckUBWfHEuo8AU/W1pimqKcdA8zSpzv
	Ste3lWH/YCmBZeCDTN72UPsmS2JFDdbxsa/fv0Qgprz9EjEHX7MaEs5vErLyRRFcV1S+8xx6NEH
	nwHCUAo1+lgNRuTUBCLhVHYIw5ZfvYq8T05nOqjG+e5tjfHtwzAJ6cqbjzr6PBgENRGW/1nCZVI
	WnQVoJHfAE1O9vIf+g/dU4KP1Tr2lcd6jxm0ynBNhGNkzWMU1yDSQOR9VTkWo7rh93IxvjkTe+T
	iOFhNl36ekkw=
X-Received: by 2002:a05:622a:5148:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-5311a698b88mr18698561cf.8.1789482998727; Tue, 15 Sep 2026
 07:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817062726.106511-1-hao.ge@linux.dev> <20260826203914.347c42aa00081ee9e0eb858a@linux-foundation.org>
 <afa606df-3d5b-47c2-9972-f3e0c2e13c12@linux.dev> <af33dfe1-04ef-4bfd-8c79-0593b24c6bdb@linux.dev>
In-Reply-To: <af33dfe1-04ef-4bfd-8c79-0593b24c6bdb@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 15 Sep 2026 07:36:27 -0700
X-Gm-Features: AcwNN1WtW5KqgGvhvlIri8T39xiLzrD7Zw5VwjZHMceFUigk0u27nHuuawn3KBE
Message-ID: <CAJuCfpEUYztqobQDHt9GwJZOcn5JrOs49a+8AVpu_ySUG_KkyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] alloc_tag: fix a leak and a deadlock around shutdown_mem_profiling()
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:49=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren and Andrew
>
>
> Update the status of this issue surfaced by Sashiko.
>
>
> On 2026/8/28 11:11, Hao Ge wrote:
> > Hi Andrew
> >
> > On 2026/8/27 11:39, Andrew Morton wrote:
> >> On Mon, 17 Aug 2026 14:27:24 +0800 Hao Ge <hao.ge@linux.dev> wrote:
> >>
> >>> Two fixes for issues reported by sashiko:
> >>>
> >>>   1. percpu counter leak on modules loaded after profiling is disable=
d.
> >>>   2. AB-BA deadlock between module load and /proc/allocinfo readers.
> >>>
> >>
> >> Thanks.  AI review asked two questions.  One pertinent to your
> >> alterations and one pertinent to Suren ;)
> >>
> >>      https://sashiko.dev/#/patchset/20260817062726.106511-1-hao.ge@lin=
ux.dev
> >>
> >> I'll queue the patchset for 7.3-rc1, with a note-to-self.
> >
> > Thanks for the heads up on the sashiko review questions.
> >
> > The question on patch 1 (codetag_load_module() error handling)
> > has two parts.
> >
> > The lost error code issue is already fixed; I sent the patch and
> > you queued it. (Thanks).
> >
> > For the rollback part:
> >
> > I've also seen Sashiko flag this same issue on another of my patches.
> > At the moment this case can't actually happen, alloc_tag is our only
> > registered codetag type, and codetag_module_init() cleans up its cmod
> > from the idr on every failure path, so nothing gets left behind.
> >
> > That said, if we ever add a second codetag type down the line, the prob=
lem
> > Sashiko spotted will become real. I will follow up later to refine this
> > logic and make it more robust.
> >
>
> Daniel also raised this issue
> https://lore.kernel.org/all/675259f9-c093-439c-a411-1937b23ddaa2@linux.de=
v/
>
> I do have the relevant fix ready locally. I plan to hold off on the next =
batch
> until we close out this recent chain of fixes. I'll bother you all again =
when the
> time comes.
>
> > The question on patch 2 (async /proc/allocinfo removal racing with
> > alloc_tag_init() failure):
> >
> > When I first read it, I think the window is unreachable. It requires
> > alloc_tag_init() to fail after proc_create() succeeded, and a process
> > to open and read /proc/allocinfo in the gap between schedule_work()
> > and the work running on system_wq.
> >
> > But CONFIG_MEM_ALLOC_PROFILING is a bool, so when enabled alloc_tag is
> > always built in and it cannot be a loadable module. Its module_init(all=
oc_tag_init)
> > runs inside do_initcalls(), before /init is exec'd. Failures inside
> > alloc_tag_init() are already very unlikely to happen. When the failure
> > happens, no normal userspace exists yet.
> >
> > That said, I realised the fix would actually be quite simple, we could =
just
> > move proc_create() to the end of alloc_tag_init().
> > I am not entirely sure whether we should do this though.
> >
> > Suren, what is your opinion?
> >
>
> I've been thinking about this quite a bit lately. Defensive programming
> is always welcome =E2=80=94 there might be edge cases I haven't considere=
d,
> or scenarios that could trigger this down the line.
> Furthermore, if alloc_tag initialization fails, the corresponding sysctl
> entry serves little purpose.
>
> Besides, I've decided to fold these two patches into this series:
> https://lore.kernel.org/all/20260908092412.115953-1-hao.ge@linux.dev/
>
> This is because Sashiko keeps flagging this percpu leak.
> https://lore.kernel.org/all/20260908094736.2B1A61F00A3A@smtp.kernel.org/
> And patch 1 addresses exactly this issue.
>
> We'll fold these two patches into that series and let Sashiko run another
> round of review.
>
> Please kindly help review the folded V10 version.

Hi Hao,
Sorry for not reviewing earlier version of your patchset and thank you
for pursuing this. I saw your v10 submission and will start reviewing
it. Due to time limitations, completing the review might take me a
couple of days.
Thanks,
Suren.

>
> Thanks
> Best Regards
> Hao
>
> > Thanks
> > Best Regards
> > Hao
> >
