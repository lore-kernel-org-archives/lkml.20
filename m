Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73169358378
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406391; cv=pass; b=gSEdfYk7AhlxWx/xoj62t4JFnOP1Zf7VLuNS65ztahw1O/dP4H5m70cSB8d5Jhzk3FolQBvPlkLdLWddOclG8ODapqucuu0TndE2dh1htoTAjWW3xU2OBPxmVa9HFw+HxDGB4qqSrw2gEulgprn9yRD7DX7wGUKEoBKyT5lhFNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406391; c=relaxed/simple;
	bh=1qD3y2a8ihNm914hYgBRdL0v/HOYwucGksCf2ZxMK78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeTTtbUlYa1YXMU27fX21BV1gBqMRjam217sXVPvCxK1n2v0sOlZV5qx0z40wy/GKFTodx+s/x7zvEDXeLN0FbDW2peTHk/WhXxWyr6e3oXinBt8TX1wiatU3BKj/mdPZx1HXMDBZ3r0No9bxAddMeoLevYJalTPN+AIxy46k2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gwck4SJ8; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gwck4SJ8"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso150841866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790406388; cv=none;
        d=google.com; s=arc-20260327;
        b=JSlfF2X9u6nEVn1G9YdGscT5eXXqo/1aJEkfAeVICflPJnLVXnJgypxr9tPO8Jw/SJ
         RHe/6jcyE4H6AwplQuhSfcl7Xxz+MQwR0IVM4sQNhLW6gxsoS/ibdPHI7iEAIo8CP/5T
         HY07X0nCaLQR/d/SKAgWsZF2fNG9JscSAaW8P7B5W/oYvkSeyCi42X7YYfkUbTaARhEe
         kzYUQhX9dpmVoTi4XjnKxpMoB+2jRsfHvbm4hw9g/fV+ioJWVdLjwLTdMakRibj2XADd
         TpEv+4rxaAGXhT8qkGVyKxxgji8XkQ13TD56fUxHWJCZQ1x4ezxp7vwCzmmuURuhX3Bo
         xYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGKzzvyJ/o3BKDYXGpul4dMsPx6vROBnNG4DQ1Eg7QE=;
        fh=/PJHp01gtvegrKgM5nvBcRP4brW39m4DtAG6gXcOmRo=;
        b=X874/KKHmNCV9Hi+7VOpZQ3o6YzAGIbOyW/9lf/kS/n2GDqcR2xhH0W+R0GOFqmDK/
         oeXVdaMEJja3jWUbSp+o8nMSA2Yq2KGl8Bu6+2ZNxH1PRkvnpnywltTvWYak6Vfeh5P3
         NVGi6aokslcNBd31WBUyBXyL+GjSoJ4vrvADIRYisL7tGfKgFPB/WCUTQ60cHOxTnjl9
         01KbxiYfY0JvSTt8RYEeFmn1VqCwoRz6BdRPJstyo+Z0YKcN2+0uBzHucakTR5JqEso3
         4qKFWrcwqqkLB1gewr4/Y2GFJ2YOJHSGedbpRozaqZ/LY1xrqfRCbKT3O74DqGcbJgxV
         SJww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406387; x=1791011187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGKzzvyJ/o3BKDYXGpul4dMsPx6vROBnNG4DQ1Eg7QE=;
        b=Gwck4SJ8c5u9gQQS18ibLC5M1rwtVIIA9ka+94aiGIg692Hc/D7ISAi+/ritrGtihT
         OnqaKmlmIwx6j+FoM6VDBhi73jiwy7BlzKlxHmarimngE1E3c4QcRESnJXC8SCvev4/a
         nD9fsXjGcN43TTMyxo2pP89YOqPfEkarhPOhMYfWROiMitCzj+ezhSWbtE+E/AIGv81y
         qD5PNtBHWbtmTjrmSA8TksRd0tj+v2MHb33OdA/HMvLdGVYKroJDVsXju+R4aZzR47TV
         h8SHQzt4uJ95McJuJydMWSWfnH1iuWFCyjcZoSlEJV2gUvH7ws39jnoTsWbn2dOuXnJR
         Op0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406387; x=1791011187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGKzzvyJ/o3BKDYXGpul4dMsPx6vROBnNG4DQ1Eg7QE=;
        b=Tj/sqjBQTuu1jGSTsAc909AO+uuiulXYfFVEp+OgtjCMLEctDZMck/HvCLVfxqMkON
         Rnmw9TuIjpmxbAt3MVe7eqsS5G7EbjLxf9C2dQmrhluKYc+oI/rhUdyV7S3p1NM//OsB
         fkHF09cOAjgZd/zz+0Mu7KjYwmAZbo09jM0yDmGW0Cyhpu2+Z1T2bgrvjjFpwSULq3UC
         6wIf+fN/Rbyzzo0ky8qzPRJmrQ6uXSWgXxMTdpseE3JCxLyD3f+sog7xH/bgBtz7Fzlz
         ubCAswvjFw0JjVwmazwh0ZVPvX8W3CyqP1e1+GXTLiyeZ7x77XAIKFQWMsz9ZLOu/iD7
         u9/g==
X-Forwarded-Encrypted: i=1; AKwUvBzf9ZpAo6f5SMBDp7ybf6qzjufHVTlLXsCcbMRnSOEmoijRd53Wyl80rIL2Ves4XtXYg91f3OQ+F3XrMAc=@vger.kernel.org
X-Gm-Message-State: AFuF++mYK+rqQvSU5vOjVEXKlzwHL5+seRMKNhCTf4j/isLojmzA+4aA
	fb5nVMi9G5s5Lo7wO17W4njuJwHTXMYm9sIxFMmF1k6R6axObx/3JpNSrlnQRLQeq9T2juSxxIK
	Nfio92PmqNT5dKm5GHiQGpXD/DW5Yjmc=
X-Gm-Gg: AYBFou1PBK8xjLP8Y7u4CjTAC90cHJIo+Icrw739CaoyVpUo1FhS07TIk38XvhZGHmA
	jNGX8IECqDBf0syCefVfP2kiS+WYk+rYViabYQ0iLJeio63uMtTYwlrVeYIjtfd6nCMIkFtgrdY
	j8mwQV61wPbT3AbvoP1lhhDdRJLRzi8CLLeo4qYe2rU8E+fLhrNZkOJbzgWiR+bfk1tLUhBktWM
	O5Wg2eWBs3vXOe6d2jpcS3PwOJSikawyh6O8W92J9bDccNQW4THE0v1rstLxlZkXNOnpigFuGD4
	gyW/6eHIPl1V4LMGW24SPpYtJzJAlpRB+0J4Bnyv7zSYMR/4lTppezqwybtLSqJdN2GVukb2l6v
	S2gksZ3YLj1E=
X-Received: by 2002:a17:907:3ea7:b0:c25:5a7:87f with SMTP id
 a640c23a62f3a-c2ac2163c4cmr712043666b.0.1790406387384; Sat, 26 Sep 2026
 00:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apcVhWzEwkwHYjB1@KASONG-MC4> <20260901220430.79810-1-baohua@kernel.org>
 <SJ1PR11MB61051CC2791B67C97BEB2D4B8CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAGsJ_4yRJnr4xXdokVHu85b7XPe0p6rZ+Lzv4sE_gCWdOF4YAw@mail.gmail.com>
 <SJ1PR11MB6105505CAF620B23978FBEF18CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <SJ1PR11MB61057EF65B62E06E2C2049008C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAGsJ_4yHZ5ck1hk+Lo-7aQudApm0Nx=4yssUDrRTz681PuW=tw@mail.gmail.com> <SJ1PR11MB610584E71CD980C9F85952F38C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB610584E71CD980C9F85952F38C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 26 Sep 2026 15:05:50 +0800
X-Gm-Features: AclHuK_Vi673nZpGT-Km1bFZg8K_EDbD_Awuc0fRGGx1yNSeHTuqCzUXAghq6IY
Message-ID: <CAMgjq7CMd7v=kYwWGSyt2LmMep6tQcFFsdyBpwc_X+s_Km=rZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault folios
 under refault pressure
To: "Ababneh, Ehab" <ehab.ababneh@intel.com>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, 
	Axel Rasmussen <axelrasmussen@google.com>, Lance Yang <lance.yang@linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Wei Xu <weixugc@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ababneh, Ehab <ehab.ababneh@intel.com> =E4=BA=8E 2026=E5=B9=B49=E6=9C=8825=
=E6=97=A5=E5=91=A8=E4=BA=94 01:54=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Barry,
>
> > -----Original Message-----
> > From: Barry Song <baohua@kernel.org>
> > Sent: Wednesday, September 23, 2026 9:08 PM
> > To: Ababneh, Ehab <ehab.ababneh@intel.com>
> > Cc: ryncsn@gmail.com; akpm@linux-foundation.org;
> > axelrasmussen@google.com; kasong@tencent.com; lance.yang@linux.dev;
> > linux-kernel@vger.kernel.org; linux-mm@kvack.org; qi.zheng@linux.dev;
> > shakeel.butt@linux.dev; weixugc@google.com; yuanchu@google.com;
> > yuzhao@google.com
> > Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault
> > folios under refault pressure
> >
> > On Thu, Sep 24, 2026 at 11:43=E2=80=AFAM Ababneh, Ehab
> > <ehab.ababneh@intel.com> wrote:
> > >
> > > Hi Kairui, Barry,
> > >
> > > Apologies for the delay in getting back to you with these results =E2=
=80=94 my
> > > test environment got corrupted and I had to spend some time recoverin=
g
> > > it before I could re-run the benchmark.
> >
> > No worries, Ehab. And thanks very much for your testing!
> >
> > [...]
> >
> > > > > > I agree that reverting the commit that caused the regression is
> > > > > > not the optimal path. I expect there are many workloads and
> > > > > > scenarios that benefit from the behavior introduced by that
> > > > > > commit, so reverting it could unnecessarily regress those workl=
oads.
> > > > > >
> > > > > > I will run the Cassandra benchmark with Kairui's MGLRU-FG
> > > > > > patches to see whether they address the issue I am seeing. I
> > > > > > will send the results when they are ready.
> > > > > >
> > >
> > > Thanks for the pointer =E2=80=94 I gave your MGLRU-FG fix a try again=
st the
> > > same Cassandra read benchmark I used for my patch (4 nodes, 720s, 100
> > readers).
> > >
> > > Results with MGLRU-FG:
> > >   Op rate:                  55.0k - 56.5k op/s
>
> >
> > I noticed this is even higher than your dynamic readahead fix: "through=
put
> > ~51.9k-52.7k op/s"
> >
> > Is this a run-to-run variation, or is the improvement stable across run=
s?
> >
>
> Yes, I can't explain the slight gain in throughput but loss in latency co=
mpared
> to my fix. I'll probably study this in more detail when I can dedicate so=
me
> time to it.

Hi Ehab,

That's very interesting, I think it means we are getting a bit better
at identifying the working set. But maybe a slightly high cost of
aging? And P99 is usually very sensitive to noises, one long tailing
aging event could make it look a lot worse.

> Typically, I get a unique result immediately after a reboot, but subseque=
nt
> runs are very consistent. The variation is usually around 0.1 ms gain/los=
s in
> latency and approximately 100-200 requests per second in throughput. I
> discard the results from the first run.

Any way I can reproduce this? E.g. what is the test bench, database
size, benchmark, machine spec, etc?

> > >   Latency 99th percentile:  6.8 - 6.9 ms
> > >
> > > For reference, here's where the other variants landed on the same set=
up:
> > >
> > >   Regression (6cbdd9726fb5, "mm/mglru: use folio_mark_accessed to
> > >   replace folio_set_active"):
> > >       p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
> > >
> > >   Revert of 6cbdd9726fb5:
> > >       p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
> > >
> > >   My dynamic readahead-credit fix:
> > >       p99 ~5.8 ms, throughput ~51.9k-52.7k op/s
> > >
> > > So MGLRU-FG recovers most of the latency regression, but the revert
> > > and my fix still recover more of it: p99 with MGLRU-FG is noticeably
> > > higher than with the revert and my fix (6.8-6.9 ms vs ~5.5-5.8 ms),
> > > though it's still a big improvement over the regression's 9.2-9.5 ms

Did you test the V2 or V1 of MGLRU-FG? V2 includes Barry's aging
optimization; I'm not sure if this latency is caused by aging or maybe
some other change.

And is there any swap device you used, or is the test using the same
base commit? MM also changes significantly between different
baselines.
