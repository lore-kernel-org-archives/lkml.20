Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBBC54DACB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086896; cv=pass; b=g0IZpwDZFjQtXS8HzpTte+YrpVX9JpgAhD+HbjiAzTLnDDZuui8bMdzXyQXF07mZvzg/lTOHgVT4C5oEv+If6A3hf+PFBfY6dri043f3qpe1ECH9zbw2t5TC/v3vicmVm/mxkVFkprqB2Vu5PDV0qTdi+v9TS6Kxbrt/eGEXIB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086896; c=relaxed/simple;
	bh=f/X6P8bAqbNCe6IwQHhysFBdeZhbUn6ZavkOq6m3YPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGZP+vBexFknRrltbcq+G3P7R1lSTPQgSRNeBZjMtBZ/3HpEMiQqPc7WlTamGfiSwg38JtXVrvhTtaAOEWwaSzc71B6U+ULhZnJjt0MGSyZyVOfYv0moFJaXy5T04erL4gjAiwg0lLlw6gLl60pks2N8VDuI+io4HsO04R15vlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Io3icsxP; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Io3icsxP"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so6131355a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790086893; cv=none;
        d=google.com; s=arc-20260327;
        b=kpn3S1FvTM3AXZhOvcnDqwHYDecgRrWsuylDluYPhR8oyavyQLKMUhrYq5A6hbxXSo
         YJ6EkgG5EqTPOItjVvku3gQ/dsdaIrqzdaYGIpCY1QouyJbQAEMqeHGfmrJHoZZT19yY
         IJk4EBzBvxsEOOlJHnDfs/EtBElsC4vZ8LfKnHxNX9kaDd3Tg8hbZ9RoRnYITPkPD/2x
         m/ArmwebcWiIfpxulnmtcp2EOJP4XoaEEXK7wdWb/ZKJwHrW0djcDy7AGgAY4Im3e1I8
         i/cVBSh1cppxfL69qa5Zf2WQkmUo0euA+RuzI3WfH26e4poqmGzDuLko0YxKw6JmMVqE
         ILMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+GXnHITPOSlbzvkHdpFgpRlJDf9B7mfYs2irEYYoac4=;
        fh=68YiQ6uuf7KY54tKIrJJSlEeS8egfu75poJCE5wlIjM=;
        b=Pb1HNaM0bsoXzGpCXQuARK+1wwBk/ltoIy2sbeQWF3OKy5nFB7UTFLEu/zK1QQ7uxr
         h/+rJ8CaBgp4j9j+39DZB5ddiL/SYkTfBe9Knmq9dRyS18oAhAZRJ1VXvaVF2bK0zZCl
         WO2nn3jS2Rd1PQc6Fszvudk6hB+P+JkLVOO3o7ZIjwKhuZafqa16VLocshEy6ZBG3FIV
         klVjuxIc6gFQxxdKzNQ7r/5t2raTMd934orLHO9qy0SZsDk959x3eRbe+0xem3DqgRDT
         BUC7Vl2qeJ86hkrclISbF4qfNVu5LaEWaz1h2GoRWyecLbmVmsq08vnVkoAi1DHGw8/W
         2JZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790086893; x=1790691693; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GXnHITPOSlbzvkHdpFgpRlJDf9B7mfYs2irEYYoac4=;
        b=Io3icsxPjLF15UAWvTM/7/IQBWCc7TFqA28ARg82iTIFSyBiWCy2nOQ2sKi3n70HIp
         /7uF27t4Xg1ci8lkV0SsDPR2ZTMz1Kz4EdZGR/xcS0kH68Jr9XS83hm5Q5pLnF3HAQwY
         TTFjyTlBmED2y42AD001xOr31uRxsCU0PPSo0HPym+DWawzvldVkM3gaRY2cT/LED0sb
         wdLF6KSEcsvi84zMjtO65l1bNAHwJY5bigcnaB3xoTlbNJWY5BLTGqGuxSFZnhmG+jvf
         6wcUb7vyFH9ZGmGfjYihxSnnYMdwGHoYCbWknDwvPlcGXELM+Dg68GFV8ZdHPsWpsg/O
         bk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086893; x=1790691693;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+GXnHITPOSlbzvkHdpFgpRlJDf9B7mfYs2irEYYoac4=;
        b=pf/RsE+D7gmmF/8nnpZdU5FxwxsoDXwVNftkB+br8pYbrkWSu8Gzjs/nzmr8GpY+6F
         85jpbHF2fSCIDEcUsOO4I8muXdvWtNjfxQP6/E8Z0ph//X3a6S4zDgJPZUY4Q9Coa8JJ
         tDDgniI4YwxF7h9wcHy+wtUk48A3X2js9beLV5WN1veozR6H3M4bPYAqgzDGl/qwGmc7
         agQKepl7XjRbCdOjyItqEEXA696Ra4pvrUnzFStxo8UxIlvW2EMJmjwqtCQcsbEPYIYa
         6jHq9W1w7tWsaFVA91+8MwXypljSaGHbPz/X1gst3mnU/KtJAYLObjOv0owbvebdUjEq
         spsQ==
X-Forwarded-Encrypted: i=1; AKwUvByOTsoozvfa6/U3QWXdqlyPQD9GiMPazz/wa3IghW7/skplbSS0orHIZfvjgYwaWKkTrNOXCBMmzM6fP/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kSSCCtsliyKFxAqxswyqoLGu9czogWPQmMgG3Xd3vcw3uUvhih
	uRpF7WeCRMKaa6JlytRvDEq+Diy67yeXYIUYKR0wRvAIlKCa22Ez2LMPn9yZhQmENaaShUBhVnD
	RzDulbbkXMxTEWhJ04nAwBZHV6ArXmqL8fJSxIlSk8Q==
X-Gm-Gg: AYBFou0WpujTYLcNGjZeqCtizh7eMmbw2bXOkMtEWtgaVyoZoyA4mdOFq75vJM5+5Ay
	kbfuvp5hMKruCTEuqqiL9h44KO/pFlShdGlX+fEJGCXdZMMapqwLfIiu3H9WNP1ESAE1InaBDZI
	c9slzqD+bsKrn8xe80C8rctxNol4jEkhi2o36XxAWtfFLXarT/rCK6P4jaJ+Sr0AJ+QkY+n7v6a
	+fDyCjmNptfMr42M6B+2hccKQ49T5mm13xj543RV53wh9Iovps5VNZxTPNCrX72wb52wYT2eZ2e
	1lwpwyDkA3Vt8/Evolw2ZdwYum1UO4bcqndE2yBrv99CdwWLNayX/3QnAYcIVF2taiO3cFx0MDG
	zElmAUs+FzD3z
X-Received: by 2002:a17:907:3fa5:b0:c29:3aef:f2e2 with SMTP id
 a640c23a62f3a-c2a158353f8mr1097237566b.40.1790086892622; Tue, 22 Sep 2026
 07:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-5-vincent.guittot@linaro.org> <20260922100233.GP776954@noisy.programming.kicks-ass.net>
 <CAKfTPtA3332vNLwvxVuM1CwVG+-bMSdBiTmE1Kz8U2Wxg36kkw@mail.gmail.com> <20260922132857.GF2009045@noisy.programming.kicks-ass.net>
In-Reply-To: <20260922132857.GF2009045@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Sep 2026 16:21:21 +0200
X-Gm-Features: AcwNN1WQWw9qYzeXrXh19SYfvKwXgt7cz4bwIV-XI4HzQoMYepP2x-sLpKPeQ9c
Message-ID: <CAKfTPtC+GQZvL089EihNmzvgEAAgDwd5_KBO12gqSOFaqw-sog@mail.gmail.com>
Subject: Re: [PATCH 4/8] sched/eevdf: Decay positive lag of sleeping entities
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 15:29, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Sep 22, 2026 at 02:56:56PM +0200, Vincent Guittot wrote:
> > On Tue, 22 Sept 2026 at 12:02, Peter Zijlstra <peterz@infradead.org> wrote:
> > > On Mon, Sep 21, 2026 at 05:22:34PM +0200, Vincent Guittot wrote:
>
> > > > +
> > > > +     vlag -= calc_delta_fair(delta_exec, se);
> > >
> > > Should this not be 'W+w' at the very least?, ideally it would be the
> > > complete sum of all decaying weight rather than just 'w', but that might
> > > be a tad tricky.
> >
> > I spent some time thinking about this. The right solution should be
> > the one you suggested in your next reply: keeping the sleeping tasks
> > "enqueued" in another tree and computing a zero decay vruntime.
> > However, I was afraid of the overhead of managing this new tree and
> > taking the lock of another rq to dequeue the task.
>
> Yeah :/
>
> > Anything else in
> > between will be an approximation because W at enqueue doesn't reflect
> > what happened during the sleep period: The CPU could have been idle
> > the entire time,
>
> Ah but if we let idle reset all the lags, by sequence number or anything
> else, then that case doesn't matter.
>
> > but several tasks wake up simultaneously so the 1st
> > enqueued will not see a W whereas the other one will.
>
> Right. So this approximation is under estimating, it is the absolute
> lowest possible decay time, which seems somewhat unfortunate. OTOH I
> agree that keeping the whole second tree and all that comes with that,
> might be a tad much.
>
> Still it would be good to find a more reasonable approach. Perhaps using
> load_avg ? I think over-estimating it might be a little safer than
> under-estimating in this case.

I'm going to study this further
