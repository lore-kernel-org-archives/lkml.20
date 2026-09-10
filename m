Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA34CCDE7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057282; cv=pass; b=JjebFg4pPFBoeaX19ZoJi+chtDJHmqjuWlMrSs7y3nl+tCz+7K9HD72mQmta9VAFS97a18E3cRT751GONZMvjq9fiheiHw47AWOMULbOqrrDDK4qlYIeIG17eGjbAdQ6nKGlVnelbm/II3348k4DX21MHgEc9BQlMwfN88y2nzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057282; c=relaxed/simple;
	bh=rUo9u0Wn3HX0BHKDm+fuwzmG4aoAVjhxf19bucJp2Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAs0Yv8FLAR++Kb8xtAUNI1Zmrn0X8JLUrknS/P8tb+yjDqronY0wh8L77PEXsF0ZUpXqgo+giW4vEaSMgCYxWPRXbAidGR+23Yu4CT26E4reX0IRbKEOSEHxnEIwwAz5fG+56N674AxjwMBn0PxVD9p8LLK+F+dOjWQRrUhNJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QMq3deqI; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QMq3deqI"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso284261cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789057280; cv=none;
        d=google.com; s=arc-20260327;
        b=g59LPRWk1ARgIQzriqpTVy0Z+USHZslkB1xM7xNx8r7Bx/xd6yoP+x1posIMXaMGms
         RhJJrjEbbNEAZPQ9b7lnRcrqf5knUw+pxng5WKsszojGTsiwxoTEWM4UrHG0KQ++Atds
         ZprVqEvvQjOPxATqvIc0RecUHz9YLOiTWBlUAme1w/5utBdkQH9wveLT+Wnf2vGHwIdG
         LkchVEKJTI9bmljt7ZPiOSma8C/H0K9w1jBiZiQhkEG9VoCPJRCd6PIOVaWyN1GuVOxS
         wsj2x/kItTfgueFociQ57bSD9hmYQUZMHQywPD3Hm+K9HLubRjHm04/ImmVBKox4OoyR
         c4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUo9u0Wn3HX0BHKDm+fuwzmG4aoAVjhxf19bucJp2Hs=;
        fh=arwsgn7fBqDncTpA1/9oWnKeLl4u4hp9JXcrLKoNM1Y=;
        b=k9UL4ZrBIojh8Kf4EEhv1O3rGFSIxF9NQb8lvWj+xvPxwJvDTTpwYg4uOOkZ0MjG8z
         QcwZidBJ1/TiehhxetXfXaj/DoKL9PyJ6MHnEEoVpTjhDVTvGv8FqlCLim8skkyW2RKC
         yKICdiwjJO3Wqt52M49xHr9+kI5aJIfE1MzeI9GxCGohFuvtHma/L8rUdMizzm0DW5kA
         4mlHMeWhAskZFiSir4zegz4XM85Rkv8AMHev/OzFrjVIfxQ7n0jHuH8yQ1DPol2ZXMbO
         1ODjWFVNpsyOL+qH6dgvy8mAhXQ6J4FuEjV2ZocP/i3Xj5KMywGKEF6qmRH0bU1svKIC
         cmJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057280; x=1789662080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUo9u0Wn3HX0BHKDm+fuwzmG4aoAVjhxf19bucJp2Hs=;
        b=QMq3deqI+LmGdtJwl38wS18ApMjevp8xPZckvZxiflSaG6R2TMaZLeBZHltI0SjyBr
         tbGr7Agcrjufe4ZoNlDw6HS6ZCO+LirQruc+5gDi8ekW1tT+W8VQM9KNio/mwNi8GoFo
         yZ5ixGRjY9wHv8DnkC7X0g2S+zaWEHiuTRxB4pW0rqg138H7jHh1DhZSMq+eeIeZ/cLD
         RmlVXXFhQxo6ocTaNRk0KcLOzJWW8McQkYkwYNNB9RB+CVmJmpNxDCaTw/m1d11oXW1T
         ruvUMI7W4Ck29/RVWwT1N82pYoIrC3NiEqQS/uCmtS+lVGnxCFgUy6OOJEkBJWgxCuKO
         DkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057280; x=1789662080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUo9u0Wn3HX0BHKDm+fuwzmG4aoAVjhxf19bucJp2Hs=;
        b=BZ47s/ijF3DlxDk8j3wEKBAFcudY2kh3JywsQKzWqNCfVdGdzYBpNukTx9AOgWRZ9P
         +xy4QeJRcBcm+vjuTiXZsdOfQuIY1xOQSVfprgbLXCo5xNp8YsDLZfA83SFB6/i0qili
         jfzwsyOPnc0NlpB4+ctSZ9aLvrQZX5XeLO3SUixlQbUOc9Cdmism7qtNXgqFfvxSAGJv
         IYBaQkBLn3LfMqFWCI/fY7BD9kjp5IxlKrUIldnsIbxGXaw5gMpPzGgrPZJRNrYHm1oL
         OjDz1wZNROgGI1pQEh3cZjMgmtOTqom/4dH6MWbK+KS2M2dXXWjg+JfJITwZfKY6PmqY
         Sh9w==
X-Forwarded-Encrypted: i=1; AKwUvBwyznZ4J6onUOLRDcHsqNLtD7M5JIJg9j6bqOtWGJUShP2p7xJ/ovZHVVabbLhto1S2in7B+nhK3zm83GM=@vger.kernel.org
X-Gm-Message-State: AFuF++kE6FDcWMjrDo6feQbbLoVmQSislPHRr3DABqKRUWMCwrHL3j/n
	DIojlfsvedwhmJh2G3YWMJlO+nYuTUtHMcsCzyfQ3D0Vr2SjeuSzBrOqB6qTfVlKgh1tROHtyMn
	fd2hEUbw0SC9AckqYvRiGmvGgvo0bdNfqsMYG+m8S
X-Gm-Gg: AYBFou0Gv2IMAlHAaryHADxbNk57rNJBqLi6qbZ4nvjS02wKO+oI8l/mDomor6OLnso
	5oaZjIkGMnal142facuQXL+z8DmfLWomWxJlj7pr5YgdyKRICma6nqMmLAuSgLco13LIs8HoUpi
	wTsOsVYyD0RgudmQ9T5D6WGkun7Do5V7I55FqaHl6uk9hckl+9GzkDVMP0ng+EGjnKfPyDY0RIV
	MN7DK/P/VmYpxS+mESTrJH8I2eh7DCFJKyk+pNYuym04V7oeWSB1zy8Haqv725LI20q+YtxGkLM
	lihGddTCqmTUlk7vz8RrDQveSttR2NusU6uxYnChHdHWxqeloU8wasY7FUo8WBPdZ1ASEVkIe/8
	iXLhVwyuYtA==
X-Received: by 2002:a05:622a:14c9:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-530b601cf18mr16999061cf.1.1789057279175; Thu, 10 Sep 2026
 09:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-4-surenb@google.com>
 <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org> <CAJuCfpFL_g7tELjT8p8ExM3tX_v2gNDM9rRKwwefPV_KW=fHfA@mail.gmail.com>
 <8e643f51-a47f-428e-9443-678326288fa6@kernel.org> <CAJuCfpEYdj=u0wczKRrsB8uDkbSzPy+hrsCo9TW9-3J3r3p0xQ@mail.gmail.com>
 <2336140f-c993-467a-b2eb-e99dc9427a59@kernel.org> <CAJuCfpEL40p+vk6-km6_BBuE3+YY0WqkpbvQnQGFEo_73MAomQ@mail.gmail.com>
 <9e48cf7b-1700-4a85-af83-8883789ba87b@kernel.org> <CAJuCfpE9_1VYqHp6bctUEihSW35TaTw_LZuOGP2UAnF7SA_UAw@mail.gmail.com>
In-Reply-To: <CAJuCfpE9_1VYqHp6bctUEihSW35TaTw_LZuOGP2UAnF7SA_UAw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 09:21:07 -0700
X-Gm-Features: AcwNN1UFxQ2wu-uZyXCXVwqJ9KTg7zgVVBQWwLZe5OjPrLr6lqSMAklG5FZN_ys
Message-ID: <CAJuCfpGvi10sibu_=cE76h2O14WA4KNOd1vARu0r1CYmAiCMEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:09=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Sep 10, 2026 at 9:01=E2=80=AFAM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 9/10/26 17:45, Suren Baghdasaryan wrote:
> > > On Thu, Sep 10, 2026 at 12:41=E2=80=AFAM David Hildenbrand (Arm)
> > > <david@kernel.org> wrote:
> > >>
> > >> On 9/9/26 23:51, Suren Baghdasaryan wrote:
> > >>> On Wed, Sep 9, 2026 at 12:16=E2=80=AFPM David Hildenbrand (Arm)
> > >>> <david@kernel.org> wrote:
> > >>>
> > >>> Ok, just want to make sure I'm not missing something subtle.
> > >>>
> > >>>
> > >>> Ah, good to know.
> > >>>
> > >>>
> > >>> I see.
> > >>>
> > >>>
> > >>> I was obviously overthinking this :)
> > >>>
> > >>>
> > >>> Sounds good. Will update.
> > >>
> > >> Likely worth putting that into a prior cleanup patch, so there is le=
ss noise in
> > >> this patch.
> > >
> > > Well, this is a cleanup specific for smap_gather_stats() funciton, so
> > > I would prefer to keep all the pieces in one place.
> >
> > I meant as part of this series of course.
>
> I understand but this particular patch cleans up smap_gather_stats()
> function, so if would be weird if I move the comment change in that
> function into some other patch. Unless I completely misunderstood your
> suggestion... Maybe you are suggesting to split this condition and
> comment change into a separate patch and making this one a pure
> special-casing elimination?

Ok, after re-reading I think that's what you meant. My first
impression was that you wanted this part to be in one of the previous
cleanup patches. I'll split this into a separate cleanup patch.

>
> >
> > --
> > Cheers,
> >
> > David
