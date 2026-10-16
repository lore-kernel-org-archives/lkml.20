Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6DA3BC687
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170936; cv=pass; b=QY5zVDmx9oKL/UetoMJhGnaMTiPLktvL6v2/WQZGqXyjrUuPOlzIagnXK4mE745MC18KwRoRP2zY0cpbRwG4b1oI+DiIV+QMAf9qPepRJ6fAfGuHWBbsmU+IOlCH8Dpr5nFf1H/c0/cHMTpqDDrZmU2VtFBksVg5X/AIA7y6NbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170936; c=relaxed/simple;
	bh=rg/Ax/Oz4/ulzZpglNpg+Xvw446Z/2wr+f24lPsY2Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQtJR5aTHuDH+GwvNDaHDw8l00/sU8OLvyo77WQNgDWWW5JnL3Emg6Tqh3GtYIZ8oxl25fp4mT+UT9NSIwlqj/dHQudPuZkpr5ht2b9QLX29vSN6HcqBNl//CFRxA1p8q++QHHtYVCw4fZwwJUcGtjGEHSKmo1xkiIP9AIidlI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2d4v9G2; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2d4v9G2"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so143774a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792170933; cv=none;
        d=google.com; s=arc-20260327;
        b=eR8/FGZWfc/D029AjBUzoExfeuguQ+9FxNOwPmv+sYga9v2V2e5uIWJNxqLB8KCp0E
         kjUHMBQpCnvzz7rvIYD/pMFjE9QaCkF5JAEnCOlyvp7juQ/IaN9Th/GzvUX0Mi1ASK+m
         T8budT4Cnko+0gLQ4cmwNGYYsfBBzu5Mxwv5D4loSH6UePqGYSJpZtac/WYZ//Z+G2jv
         Jjf9xIQxpcJiXTJkBudzOk/MHHNG3ME354oRR1WnjJYz7vNb/3pJs46je68zwta1HU40
         pc5itYjLrULnfG66u/BsnoGAT5843t86Thrj0/zNo87o112F6Xu/dU9Oj2HvY+9aSPbK
         AL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgxsgKvEhHdyXpM76IfVHoQp5qK7bpr2TwN8jd0TCdo=;
        fh=2BdV2afRVtxTi5aNUpAoxGsbLTa7DzM4+w5+LrUFt1U=;
        b=isu7hNHJm37rkFdVLxfpQhQZmDgc3pRpDPnd63Tu74TbCar3NMnU3b+RX23aaVQ/wp
         oAxtKZvBn6TwO86L2ET/XAF1lRr6FhTW76S0XP+qqJV4K/5n6j3x0zjr2lQn3DI+vOEW
         FM5J5jaMl9GxT4v9qJMz/TOQePEyArNCZB7n02UNdjlZ/UfVBPVMjiW0o7hRcrLZCwnu
         KQepIUCiDf62n7FoG9L7JPiOhwsLAyfGX1zfuOl1MUiJnUfihZb3a2dmrAl/0P2gufgX
         iUbcZLoOHbt3hUPYt3pKoygMOR/uB4c4+JKPEeRufHkYmEDi7COruY0032Rs3SvP7p2W
         qHdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170933; x=1792775733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgxsgKvEhHdyXpM76IfVHoQp5qK7bpr2TwN8jd0TCdo=;
        b=e2d4v9G2csw+qXy5QBTZRrDXtdWSyVYftzExBKXpq5qZOb/sv/Otb1WirWxSxhTat4
         eSRKYDrijB4YFh8HAjXeEswe/TB7xWeG3ebxi/CsQpxkdfxS8VIqVd8beUZdGjdPamCE
         jdVyUkiOe1sWZ6VM2u+l6SvQhHMGltI2a+YYT89IUwgbuVxm1aw6TvBtboZuYNFzz7iy
         ZGCODsZRozN9EHX0YJFU5jlIH4BiRwtKWyXPI4/1155LOnoeVnAo008rEE80tryB472b
         cwvVD1FQlt5ToKXCX/HGTO6P8ecpt9xLAUvGJBajZdi/ImjfnyIzCi9BCgNin6WE5i0v
         qJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170933; x=1792775733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgxsgKvEhHdyXpM76IfVHoQp5qK7bpr2TwN8jd0TCdo=;
        b=TLPrB6LbGuNWJkajjVyWTXBw8JMHMtAhvOYU3OwAkwJGwCrZNug87oRrbs8DsCW016
         kClSVqXH4DQdNK7w4r/Q7YZorXqPHXlaA0lrLeqPe5Nyl9UXifGnzT0ME1Oq6VzE0Kzj
         PseTNoG78WNBlC7RyrT3OWQZpGF/zLsBgJGVMsbs4eGE0RYDv/LeC89KoCWwIsdiyx1X
         FHfMQNcmbVZ3ngSziqn8m3HEsC4oMbS3AtcgTT3kytKAUgrCRF/3aQ2hlK7oEMlJ4/mJ
         BkKgumODiu5u94IF9Z00ffQjOJSrYugjg8ZeSLHo4Qq9yL78YkumuArM8MtCHtppgMpZ
         BdQA==
X-Forwarded-Encrypted: i=1; AKwUvBzBcOWaMxSFxGjVHXXtdilSa11KXTsrKbwjVQBExizP/6FHqH1he2xGJ5EDe7g6lFmJnQztao3iIgIc77E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9wb/Rafl/aZZ9UhRWEOWIHgkX2nwUgRYjuAB+HMi/mLZqXIrE
	IbqDCLveaJk08J3YJMKTKUoF2QT9m/4Dt4kR2/Vyl+Lkyitalt40J4ObVcL4CdorpoO+ejXPvg7
	8OWbk1YgwahLEUZHwvRmzrqYSq7GbTOGkhGgUNOMHJBBn
X-Gm-Gg: AYBFou2ZvIvizxwcth9ogZznYHBMdOfkMHL3eYNWYKhRJZjF/4iCU1xnrR/aWUoN2ot
	RPpjGtzH8pT5B4QvO1tJwuEn8RGop4YoQMhWIHEQ/8y6WINvbeiaMJ7VwpdHUsJfqxw85UdlqsK
	0HFFCxEFHzrSlN+kyofas4Rc4qmTOqKui2+YPtcqcewcfhHtZ0SNncq97mmT7O45R3i98NIH2FJ
	TFygdJPVxMSde/Q5lJz78yurTvzQYlXqQfja7W3XTx52GU5r2ULPVSBpicT8IfCLqvbXg202EGz
	IF6ipO8BmVfizWBMIAKWjLIWQQLOSo30TtKYOjWeW54qm/qc4fFddkI=
X-Received: by 2002:a17:906:9f90:b0:c31:e19c:fc4f with SMTP id
 a640c23a62f3a-c419d83af2emr40954266b.14.1792170933227; Fri, 16 Oct 2026
 10:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016141208.2641974-1-e.velu@criteo.com> <atJXYHJa4jkUWJmP@kbusch-mbp>
In-Reply-To: <atJXYHJa4jkUWJmP@kbusch-mbp>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Fri, 16 Oct 2026 19:15:20 +0200
X-Gm-Features: AclHuK_r4vb9kbzFWLHQ6q2g0sJIA58TCtZTbc6GcrsDVimIHbp4lA9EF6qeKpI
Message-ID: <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
To: Keith Busch <kbusch@kernel.org>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, linux-kernel@vger.kernel.org, 
	Erwan Velu <e.velu@criteo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 oct. 2026 =C3=A0 18:57, Keith Busch <kbusch@kernel.org> a =C3=A9=
crit :
>
> On Fri, Oct 16, 2026 at 04:12:08PM +0200, Erwan Velu wrote:
> >   job                   | cache   |   IOPS | fsync avg | flushes |  gai=
n
> >   ----------------------+---------+--------+-----------+---------+-----=
-
> >   psync buffered, QD1   | back    |   3885 |   247.6us |  116552 |
> >                         | through |  48325 |    15.7us |       0 | x12.=
4
> >   ----------------------+---------+--------+-----------+---------+-----=
-
> >   io_uring direct, QD1  | back    |   3886 |   238.2us |  116593 |
> >                         | through |  41924 |     5.7us |       0 | x10.=
8
> >   ----------------------+---------+--------+-----------+---------+-----=
-
> >   io_uring direct, QD32 | back    |   5088 |  6173.5us |  117793 |
> >                         | through | 140196 |   107.0us |       0 | x27.=
6
> >
> > From NVMe 1.4c (sections 5.21.1.6 and 6.8) up to the NVMe Base
> > Specification 2.4 (sections 5.2.30.1.4 and 7.2), a Flush command has no
> > effect if the volatile write cache is not enabled.
>
> Yeah, the NVMe Flush operation should be a no-op in the device, so the
> dramatic performance difference is a bit alarming. Surely the block
> stack's flush machinery is not the reason for the difference, right?
>
> If the device's flush handling is this bad when VWC is disabled, what
> happens when you have it enabled? Can you re-run the same test with that
> setting?
>
> I'm not necessarily against what you're proposing here, but your numbers
> are unexpected.

Maybe my table here isn't probably clear enough.
The numbers shown in the  "write back" mode were done with VWC enabled.
The numbers shown in the "write through" mode were done with VWC disabled.

As I'm doing lots of fsync (on purpose in this test by having
--fsync=3D1 in my fio cmdline), you can see the "flushes" counter is
very high when VWC is enabled.
The impressive numbers (more than 10x) come from this workload : lots
of fsync for little data.
Please note this patch is following an investigation after a report
from one of my users complaining of poor latency on this NVMe drive
series in particular.
So this isn't an unrealistic use case; the impact we see in production
is of the same order of magnitude as what this patch reports.

Erwan,
