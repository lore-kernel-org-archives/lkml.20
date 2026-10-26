Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793031131;
	b=nYCG/4cJEmXkYBM4uKs+geAwCwOZrqH/z87PCWaf0KzPzA/v73UucBatU4TqFaCIYCkK
	 OcctXHeWiuVxM2QvdAZuatBQzJy7DEWTEdaAq8qEMHIQAXpxR5th5ZR1t8Gmv9X8pWbwl
	 oOeC2vjjUwotjWEjrQdxMsmngm1uR6eHhuWGQAJQ7A+X919uE3H8xLKzKl0WEWQuHAr1i
	 7OAjaKLhfyr3GA75U7ObflDgIJUS8W5e3xfscXsB+p3Hr5CshXariYnztfJvHjAcIYU3T
	 LN3D1OzzCW5H5XMiqw4Gg0g4HFB9JnwjDJjwG/hTxsjIZ2TCi0B/jTf6oNX70v27Log==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g+jO8UtF+vwChY1eYvPs5m/UaJWywgw4H0Nc0Yjcw8U=;
	b=CsWFY4dTE3xaVY7MJtFdIistYgA1Wm4oMfvwHUxOQE/zONMPjFL1iockcGPOVd6sfmPb
	 KMOtj5MygNbIH0L73I8F/ijeaip2Zz91dks48dp8AsdbtwLCFCsa8WF3ZGoPVLDh8ijEO
	 oQtWJAstgRNVrPy/0VwOBXkSTHvzQ6YcGEYWBSkwTYwMBy49ILSqk9hZBQbPuBFu9llE/
	 WyqcBU2ZsxP8VXW8MR1wiso5+SDEZzyCq/gA/CCp6OgWvM4D02ygVmE44YdIXh96z5d1d
	 ZhLE/1lwNQZCCHmbP0sY7cIhaccEXd9w8h8D9pTVzALK42F+t6hncjHN6wkwYNWWZYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=BCOoyner;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=BCOoyner
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6774639a8a4so2603557d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793031130; cv=none;
        d=google.com; s=arc-20260327;
        b=dd4yDKUAiLdfD5+S/dh6awbQBaLHTRHqDYEtgsDSxIVZg6/bk3QBS/VEIwvCcJpzxt
         TRL0nU3MQrUjjlLusYCn5J4d1nnbZbl0hh8x/Z48zTv+ga94dsW/8hfHSd0A+GuhRVkj
         J7YudroIj4svjV8+33wpnnwoBFukh9ygqgqvGZrZUFBUQvs1pl12i4as69ZmzoEhlmmd
         AS1hQU/WcbiSJJq6BjjheHvQqAGKhIB61aXLg1kt8h6RWEBz4GME1rMw4ynWxujaXmOo
         eUJ+Vobdm6f/QlyWzSGPhVh3tn3dXF+GdGusYKgMQv+7/AOL29uAXQTSiq9PYT9WA4+/
         RLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+jO8UtF+vwChY1eYvPs5m/UaJWywgw4H0Nc0Yjcw8U=;
        fh=hjzYZXvkcpnu9lS6eby5t4x7Ns6aJE9v6d3gtnhxx4U=;
        b=qOosqBH1xo9jTNjfW3GzeoX+NYl0fKNzSB+KJVy7wSbjg634UgnR00dZiUQ1RzlecV
         qss1hEIXAVmtEFdZCS0qnObCjX+/tcYZ9uS7MSZ72Y5LGPL8/cIbgDzAsTKwWxWRIPsG
         +9REDjX/eRoX6LaW7lEcfuCQsdmdWsFTELBmCq+oSN6yJpucK0eDS6xOR60Xp0SyF3EB
         ztxV8pXcilmuLpM3ul1DkEeSkS0jD3jW+vjnwpXeWtKVR0Ss8sxpcO769ib74BOAuNk2
         VmvS545JiBcrOO3HK/h/3FoE+GtdJIa/OoY6I9aSi9RNV2aiYIUj+UEaItum7Zz2SXYb
         FLqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793031130; x=1793635930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+jO8UtF+vwChY1eYvPs5m/UaJWywgw4H0Nc0Yjcw8U=;
        b=BCOoynerxPBmx4TfZqjaHtvb8EEeqiHNIttEq5gd1To8yKvCYUYYFVfT8ytW+Nao0r
         smoWbHLOO4gcs4AQx+yWis2QxWRnZb7Ng0KPzNEGupleQehW3p91GFUGc+HMBfxf1tcq
         Cidz7jfeGVyzPsrxbKM13HkWyKVbyN+Yp1dSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031130; x=1793635930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+jO8UtF+vwChY1eYvPs5m/UaJWywgw4H0Nc0Yjcw8U=;
        b=OGX8SxvuAsTGbj2vZm4ai28OrhnuCEu+i1vhNEStpTng9hjxHD/rEBUmheYSG8wk09
         OGE+5rDntJMOPsxRsfTcWEKeK3J3rMHkuMiUOPSpM1Baz20sRGhDfF7Fn8Y10ZApa5qW
         ogeGHQObLLGHUd82nhf3QYKSFS7fOXuqpvz3rXE3ELdP593FAA2+MckW1snWp94IOsW0
         CXwCvljjmAUQFPbPeH5iUy8jdyrcNVSIIveBvAs64HAwbUQvR0g/WbkQhhWp8gdAV1q7
         ZGLNzBN6rsmIbDmP6EI02uG/VkO/SPMZ7lGmcSYHRvVFsRILYLOOdbyS+r2xD/7lHdkV
         nnfg==
X-Forwarded-Encrypted: i=1; AKwUvBzw9aPE++o1vZQGcCYFqH2spRo2AQKJzZ6Sy/UjOc1KIaLoSFw/FSA8tMLuz6gb47/3hmLGa0OT/8heIVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwa3gPaSnXVHdJigImvTG84rkR5Fihj2pVMH1e76T+PhYN8/mZ
	+Bi3t/2ZNvZ5O5+cR3Jzc6w5yx+PTCZNjmE1IKAikjA6BntpfFE/tv6Z+TSbM4oGac/3qqGBdrA
	FaDuLalbP9+r2uQV4vzuB8FMOPrig8qBwI5REx158
X-Gm-Gg: AYBFou2iP50SQwUgFq9GYFn647CodOVL5Z4AMWh9IVUPSceem9hMOzq5fz/+vn0fz7d
	WBMU7RTpVOPvh3RMMoAQ3DFGOdyIiN0fm20RJiJ3Guuai0EW/NgYiDnukX73s2ZMDm1m/Jf+Cd3
	A/cEK6/jQ9e8vamlyEIWHITZwP0eV298vWnHgatynvllKX6Y/AQv1T7Ka73+HzQSiHTvLEuLEvD
	B8d5JN1G75Uvya8W3IcsVamqPP8rHbcSUJOhsc19QH/DgNYrXNMB+c2Syfyl5uVbcrvFGjTCoUG
	MvU7mxT35iDM6xKP1kbutb1QZoqn9yafOJBDuZmr28YF40jAmrjqR6XkBJ8s4bakZkOrCv5L56s
	FMUxI3YwAiQ8ZcI4RO1YxAEZhkbPUR69SuxnZ+MAFqwAVPmNSCk3ATvEJqoaYzeqLUdHpF05JHZ
	lV97f2oLzoRUllesCw
X-Received: by 2002:a05:690e:4390:b0:679:c9af:6d30 with SMTP id
 956f58d0204a3-67a453fa58amr2903732d50.54.1793031120103; Mon, 26 Oct 2026
 09:12:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <BYAPR01MB3830CECF5D0871064C59BA0280662@BYAPR01MB3830.prod.exchangelabs.com>
 <CAL4WiipTihtytPEPj5cSY+=t9NwRwRTfUQ_efCSWPT7nQ=0K0Q@mail.gmail.com>
 <willemdebruijn.kernel.178cac71d218b@gmail.com> <20261022160251.GW2009045@noisy.programming.kicks-ass.net>
 <BYAPR01MB383065E105701C81A3D0472D80652@BYAPR01MB3830.prod.exchangelabs.com>
 <atplVXLEE_mNqhek@1wt.eu> <20261022212025.GV2823843@noisy.programming.kicks-ass.net>
In-Reply-To: <20261022212025.GV2823843@noisy.programming.kicks-ass.net>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 26 Oct 2026 12:11:47 -0400
X-Gm-Features: AclHuK___KN_ZCi6KmdQxWiaEn7V7IZhvF8iqyoioEnZWSerq3wzmVRKx-efROI
Message-ID: <CAM0EoMkD7AL6ZE1Z21-fQteo55SJBVk_piTp4ekrYSybva2kMw@mail.gmail.com>
Subject: Re: ZDI-CAN-33367: New Vulnerability Report
To: Peter Zijlstra <peterz@infradead.org>
Cc: Willy Tarreau <w@1wt.eu>, 
	"zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	"security@kernel.org" <security@kernel.org>, 
	"maintainer:NETWORKING [GENERAL" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, "open list:NETWORKING [GENERAL" <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:20=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Oct 22, 2026 at 09:34:45PM +0200, Willy Tarreau wrote:
> > > We will have some discussions internally, but in the meantime, we wil=
l send the cases to you as we always have.
> > > If you don't want to do anything with it, that's fine too. We will re=
lease the findings at rejection, or 120 days.
> > > Whichever comes first.
> >
> > The main problem we're having is that it's not possible to have anyone =
on
> > your side nor the reporter test a patch. But I won't rehash this, it's =
not
> > new, but *this* is what makes your reports way more painful to deal wit=
h
> > than many other ones. You (unvoluntarily it seems) act as an insulation
> > layer between reporters and develoeprs and that really doesn't help.
>
> This; Willy is far more eloquent than I am, but the zdi reports have
> been very painful. And as said; this has been raised a fair number of
> times.

+1 (from experience)
They just dump stuff and run. They wont even respond to basic
questions about what they send.
It looks like those parking enforcement people who have a quota of
parking tickets to meet on a friday.
As Willy mentioned, on the positive side, though they do produce good
reports (although once or twice the repros didnt work)

cheers,
jamal
