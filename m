Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2411C383305
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805068; cv=pass; b=rUVNa3pdng7U1wcowK8f6U4B/McQDagBtXR6qb0gs21Ds91aVRKKGnUvNXYQNDtI7XUvH+bs6EUFZrzRDpvgtjGtNSr4sIwYyPLVr017xAUutNVaDSDe2Uu5VxJh5DBWCFs/1zGb7KDK+mKfonbpwOMaJXRYA/MErdJoxv16xGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805068; c=relaxed/simple;
	bh=GNF9twBVaAp7G+9eN2s4Q+uWE5O0f0kqDqf5iv1isXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpR0JxrPvJnuFbWDayLZ4qaT/lxheQJvYHT3KUXOwDc+r5T+2GxWPI5EEogiUV68pE+ABtPL3CQV/GcF18YBU/rlH3wnQOCbYfDNyxUZCPGqrwARo2cjJpgc9Yo8Hh1ru2ko5YcU4ughjK0zp658cJIzE8smeedl+41RQvfUAIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1jO6ZBw; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1jO6ZBw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2850018a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787805065; cv=none;
        d=google.com; s=arc-20260327;
        b=p4eAsxWQWn+AxdtpvMZWU18GBEgseat2z9ok8HqbE9uA5qEkanUByujijRpvLGqsfa
         0QSy+BPRENTM+BMZnLy0KXYWE9vlDHoiu0ck9yBkeD2RBRk729OPchM7IVHZvQJ1sTe6
         OlIieldJG1Yr2KxBeO1xGHCjlO7fm0wMt5j3XVDOT+lNbmp4npJwJfQIYQCZpWojH2xj
         qjRb78qsm7A+ynWsOMKdM3/4Wxkm1SzqwBKipQMWWbiVLdK5W/NYPQGcZDBav9elPx/Y
         5Z9ZE7e2FBQxNuZnmeDUcow6FHTavXTA57xYVdc9GyorpILiTqXyUsb3bOOHQh8cHZkC
         UREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNF9twBVaAp7G+9eN2s4Q+uWE5O0f0kqDqf5iv1isXY=;
        fh=AiFB7ikxxAo25SwxIRqywkMmK/STwS16kkLayQEfoac=;
        b=skqLQTZOkUc3mpwU14LTN7W8RMcsp2tdtqPO+4TGsEuyPFyd2zsxJ4dmyHX9xovFmJ
         Q2VpJ/PY47cFXLGZ/jlnkyHY5KP4uOmbg4xk7W35gMCa4pXJguBPdIGELtVgp9raao4N
         Z6Gt3ciCIk4SzcKi5od0HY9JyJ7Fopr5BZKOLFj5YIRxb9SynNXyxfGFZkSVRKkJkVJB
         CKgT4DB15j4XAIt5ABKIzVjMCFT4bUdpyYoGaIaFf6ecimPobK2cld+vEJFUzPzhEWDH
         uHP9ixr4Rb+IF9SbcIw9rYTngSpNJy8PQpxYbulsWjegAR4XKaGoht02HGwnsGD8e4Iq
         0kEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805065; x=1788409865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNF9twBVaAp7G+9eN2s4Q+uWE5O0f0kqDqf5iv1isXY=;
        b=m1jO6ZBwI8a0dktDJi6nsKiNdlcrYjylRoU2/MKiQP2ElKWfJjwlVZ5TcpW0ndWEe7
         TFkiiCU+zPKvFc0TdRB08rO8h2sJrvj1Zx0fdLkh1kT8eYqCCHn3+4voDUAmGrUmVAeG
         VIO1ildLA9UpDNVxwuvK+x18SxH9o2voWXtzxLMll9haWWHuKizSOijVwjs5s0I8CerQ
         qrRWECfV3SA2d8sAiqE3/0fSNWOXpSNzACrFlAqp9QNBOmu01K8yTP82lA+O3S7cJX2q
         0qaSm+dSchPtUPH6kEis9UFdxXzv5rSQ8HyJ1HMtey86bRpiPbdYC5oiH+ituNfnyAOr
         qYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805065; x=1788409865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNF9twBVaAp7G+9eN2s4Q+uWE5O0f0kqDqf5iv1isXY=;
        b=iPfZ8RygdMpbviFThXcFK6ioo+0anABeDXnWxnRzBJ0C9O00WIefh3K3vGV4Ey2RYR
         Bjniu2SRcSuJkbX3unGHreIkvpGO1FqHJ/c3z0Vw6Mvfe9OJkXYCtZf3G+OFZC6NPo5z
         HtWrSTR8ssPlWDxuvAYpuyObc5oAnsOdOgJlblIMO+b5CHF5qzlGE+pBjdpy9hvo4wLV
         /UCgrZL8M2S4n3bv4uZTtF7Vdwonh0kOcqQ+LsUznPcOvEjDVxIndzk4XQnb82EZrgo+
         AeMqOfotlY7CBTKshyCyR1Mz9DK+mGfoCJijxHCqmwKp2jBTP23GunLAjxkFIB4GV9vm
         oruw==
X-Forwarded-Encrypted: i=1; AHgh+Rpqv4F/pFBEdWIKIGf3oDGgk1rFUTn4SmWQJW85Pg3p6kplbZjIe4wqcRNbt74e4yCf483fB7Bor+zozQA=@vger.kernel.org
X-Gm-Message-State: AFuF++ntqFNS+yqiQlWeFV2xsxCROUUp0p03lyuWnYJUrGg62BgTx611
	XP/xbqWlMvavnsr4fCl3DhQcATuaV2WQacWDohNpRRQ69AJJuCMu8u70ztXtyFMxWTvobc1GLca
	wx8CXtDXUdvrb2QF3eMjHorP07DfqIi0=
X-Gm-Gg: AR+sD11QOpSlrmDznRzDKKqQPKTcZrRpzWnMlxxuxRR3f4N9pd5IbcXRbeXjANw0cq+
	tEtFhGgiD2kOqVRJELIGw+zt7otFghAB6rVWKjX+n1vt225qGrjgbFfRFq5gCOYqm2P9KWpkGDc
	plwXvsRpaf5+CBKOf+hcyCMmksEzU4JPmO4S8uDVmD08pQB3yPVtbuVi/lqSDxEsQVQs3iZOXgS
	R9VX93wjoVX2C3EInEkYGiLJv3JODEA52BWgFpI8kTb4bOYZehn8zxkHGR22RxeJzDl131sAMR/
	Nm8PJx0vEgm5N8/J7jakaTsPTE49l6PydcG0+y2GLQPz6HseMpjwN2i5r10e7fJBaF4+hhMXh3p
	T
X-Received: by 2002:a05:6402:2312:b0:6a5:f202:c1c7 with SMTP id
 4fb4d7f45d1cf-6a5f202c2d3mr5336319a12.8.1787805064678; Wed, 26 Aug 2026
 21:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-4-baohua@kernel.org>
 <ao6qTTtk2xkkeKob@fedora> <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
 <ao-I8rYv_G5j4wz4@MiWiFi-R3L-srv> <CAGsJ_4zoXvyXG6-qAH+=nv6V92w_U_tk78YAPKMihRniqvTe8A@mail.gmail.com>
 <ao-dewgE9XAfP0rU@MiWiFi-R3L-srv>
In-Reply-To: <ao-dewgE9XAfP0rU@MiWiFi-R3L-srv>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 12:30:27 +0800
X-Gm-Features: AcwNN1UHvc-7ieTQpT5mTwNxB7SGyV9BMF9NVmuEWVsoeKOE2GO6V9vnyqEIeyQ
Message-ID: <CAMgjq7CgT9yCz9bhfNtrsjNHh8=1F4zV7BKG4FRB5xWaLh+NNw@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
To: Baoquan He <baoquan.he@linux.dev>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	chenridong@xiaomi.com, david@kernel.org, hannes@cmpxchg.org, 
	lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 10:14=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> =
wrote:
>
> On 08/27/26 at 09:24am, Barry Song wrote:
> > On Thu, Aug 27, 2026 at 8:46=E2=80=AFAM Baoquan He <baoquan.he@linux.de=
v> wrote:
> > >
> > > On 08/27/26 at 05:43am, Barry Song wrote:
> > > > On Wed, Aug 26, 2026 at 4:56=E2=80=AFPM Baoquan He <baoquan.he@linu=
x.dev> wrote:
> > > > >
> > > > > On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > > > > > During aging, a folio's generation may already have been update=
d by
> > > > > > folio_update_gen(), even though it has not yet been moved to th=
e
> > > > > > corresponding generation list. Such folios are hotter than thos=
e
> > > > > > already in that generation.
> > > > > >
> > > > > > It makes sense for inc_min_seq() to increment the generation of
> > > > > > folios that were never promoted during aging and move them to t=
he
> > > > > > tail of the new oldest generation. However, folios that were al=
ready
> > > > > > promoted should instead be moved to the head of their updated
> > > > > > generation, just as sort_folio() does in scan_folios().
> > > > >
> > > > > While sort_folio() move protected folio to the head of next gen t=
oo.
> > > > > It only moves ineligible folios to the tail of next gen.
> > > > >
> > > >
> > > > Hi Baoquan,
> > > >
> > > > Thanks for the review! I=E2=80=99m not quite sure I understand what=
 you mean :-)
> > > > Could you please clarify what you=E2=80=99re suggesting?
> > >
> > > Sorry for the confusion, Barry. I meant this is a good one, and
> > > sort_folio() has the similar issue in which the protected folios are
> > > moved to the head, wondering if that need be adjusted too. One consis=
tent
> > > rule for both is better.
> >
> > I think it might be fine for sort_folio() to move protected folios to t=
he
> > head, since those folios have either been accessed multiple times or ha=
ve
> > reached a tier higher than tier_idx. They are sort of hot in theory, ri=
ght?
> >
> > if (tier > tier_idx || refs + workingset =3D=3D BIT(LRU_REFS_WIDTH) + 1=
)
> >
> > But for inc_min_seq(), it is just catching up to make sure the newest
> > generation doesn't overlap with the oldest generation. Those non-promot=
ed
> > folios themselves aren't hot , so I feel these are actually different?
>
> I got your point, sort_folio() considers the hottness, inc_min_seq()
> doesn't. I agree with you now. Thanks for the explanation.
>
> BUT no matter what it is, protected folios, lazily promoted folios,
> and no matter where it is, put in head of next gen or tail of next gen,
> their refs are cleared by folio_inc_gen(). Then in sort_folio(), they
> are all tier 0 of the oldest gen and must be reclaimed.

Hi all,

I think this part is not true? a folio's PG_workingset will never
be gone after set, that pinns the folio to tier 3 through folio_inc_gen.

In fact, I consider this a pitfall rather than a gain; many workloads
have seen regression due to the over protection of such folios.
Especially with that "refs + workingset =3D=3D BIT(LRU_REFS_WIDTH) + 1"

Resetting the tier to a lower position is better if the folio is
promoted by one gen due to protection, to avoid over protection IMO.

Changing that semantic will require many other adjustments; I suggest
we just ignore that here.

>
> So here, I think differentiating them and moving them into head or tail
> doesn't make sense, the thing is whether if we need do something to
> retain refs of folios when gen_increased. At least, for lazily promoted
> folios, it should not be put in the tail of next gen and refs cleared.
> What do you think?

Actually, retaining refs has a very limited effect on the current
MGLRU implementation.

Basically I agree we should keep the refs if the folios are not lazy
promoted or protected, e.g. in inc_min_seq. But somehow we need a way
to "soft reset" the refs to a slight lower value so the higher tier in
lower gen won't looks hotter than lower tiers in higher gen.

This is not very doable right now, the closest thing we can archive is
just reset the refs field and not touch the PG_workingset bit, which
already done right now. (BTW there is a LRU_REFS_WORKIGNSET reset in
the FG series for this :-)
