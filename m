Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8C336897
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336442; cv=pass; b=BVn8XNy1TbniYnJ1Iuy7t4kvQRPpwurI9F0dHWERKYUn785Jt1gjXHoIIJ8JwkikoTynUf+Lr4l0pa3lW+H0a0VnSseOdfH+QbhgqYfIEqCqb1ZfRg8hzjOI7HmP8aEiWsQhabp/9yLGlQdTnsGG2eT0if6brPM1zKaA9EPQeMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336442; c=relaxed/simple;
	bh=7MOrpFUI0yckyiOPON8pTUAfvIKDuzYSqvY32rPk8Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYcHZpBRxuHu9BQtsvO3tsl0aBGDZsA6X8cjZq3uNJBDhRU88rZTRmS8TLTlqZSLf4QOAJyoSkDgMQtt7ac+WxNzIdgsJq6cqCnQh36Nq7Siq6WVdgwmgHSha+lhSPedDBnycVUhoQqsTjhXlyLoADgH+6p4QssdnhxYnNd4VFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUH1XHms; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUH1XHms"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so1514589a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791336438; cv=none;
        d=google.com; s=arc-20260327;
        b=CFbMNmBwB4O6BLp7lq3zPGmtwNIAcqp4pDQCRUm+p1UBQiDmLMO4j/fRd6JyFev8Yb
         ZvqoNa+f9TvbC1Ylr3pyUPrv5ELTv6g3/I70PS0q0fCL+OWetjQxEO/jSKzkbC/X9lc0
         embP8WZyLsj56qfbzDXAcTEDZAJqK7cO5Zb7DxsvHHek3e5t6hHYqCM8Pi2RzjfI1AYA
         iYMyg6j2dxteB4drJZRnmqs28X6xletEz2iWcSG61HoZ5z9YK6lp1yK0vx4qp2KxH5cz
         XA/ZDTSMYCqJgiAH7G8wR1wnxTEwe1o3DMKU6Grmi32IJ0YkS+8uEbd2NrTuB9oNattU
         Sl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=;
        fh=7wo7bX/EZQbsQN0LB0Z2QrpbydSbpNez1IwYkkhScJw=;
        b=m3mnK1XzbuOrb8z4xuoRYRIPwuaCDZNifDprr6FRMVF7WM8/G2hUQyW4TPRv/f3YHp
         k+2yY4/G7G8v1zXaZpq57lcS3EwTFH4gD4aetrKZ0fRA0IM5dkHoSfyP1NGnzI2q5wn9
         xvFze5jQJ3379H7xbPht40Otg0K0noCmA4F/H0drvE8kuS8cD/l35cqW1oQEkANo6w7F
         dFNFTEAv81C4JyJjM5WpxovGRdFi3Zm1RjO9jY0f63l7B2Ik1IWmQlxpyk8p9Etp39M3
         99/MPXFxQJmM38zX8PxMYRLTISay5x6iCyizBVtI9Ma34ZN8Zyjh82zVGlQOtCF79B5y
         gWUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336438; x=1791941238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=;
        b=LUH1XHmsWPem2jDHzrMp0/M/6IgzSDR/VidFy8dA1AmiOQ2jF3zerV2BPmC3fPoYBM
         iyhFaQ4JhkjG8BBO0c+3aMh6f6KKSSH4icLBkzhQmCtB5g2okBuHA9YFaWvHLWCbyVqL
         Md8qjCxk5skemAPeLGyZfpFFlb1w6lkgFgD03ksMORXL5SqML8JDlH8mg6mWnzSAOamm
         parhQOoqtyXyROQ/A006lItxbr18qQmNlEyWr4BMjky9k3X7HhWfQ282tzBi/4eg4uWc
         QDEwMbKqiHvFqzh62Jj+909pKxQxY1HASQ8ys/c8BpkbeUp8w+84XmasPXfFn2yz1cAh
         1qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336438; x=1791941238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s8nYi5HbtoA87tSkC1RWmRECsh/ju1fYhQ7RJquM8k=;
        b=WFTGUf0FTegB2YUBCIDsHoKdhgN0vfZH7c6P1sliOAJ103rZRDsUk1A89/oJKh86zi
         GufNRvSs5oky9Xa+vWCMi3iQHpegljqTlfeDxdU4Hpu4Ul9wx5OCH/g6trwkd7/r5gvp
         Had1Lbug6m3d8BgweuRBXzz27uAo59ruHWAAbb0pVpdmFctSTY1wDEmsfaWBH/EGDht4
         vzd+PW72I46wgZy70GO2wDOnXMSUyQ784w6o50HrK+E0bM1RPti92XYgnGp9peufNxvD
         1ZNUdkDPbLvtrb+s+0/Nw7wMpWLSCMHJrWm7AGsJNyha2spRvgFdRTw5vkfA5q0pgxbr
         hmJQ==
X-Forwarded-Encrypted: i=1; AKwUvByI9L8x4sYkXR9e6DJp01l85KReqdNbd9SonRzHGoFOg8dQi4LZy9M/utLy5xOuFlh/L9bwLRY9x2m5Nog=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgH8/5J5EzviW7y0Ukg8IeeicLalRedCtnTqZ5uObsutZq3z4S
	ctCi9pXtoDdm6S82NolJO5LwebGJK2BQn2hNFhQ8l0EOeVFw+sL8YUPtFvocixVfMy7fqSFmmcL
	jlp/Ozv//JJZOttEAH1Sje5ByBcxq1/0=
X-Gm-Gg: AYBFou3jEPxMcmMtX7bOlGJ6T3O8NXLuJNVJH99dNxRQJYhBDxr9LK+Eoi+TWSvbWBM
	/YSDTVSccBhOol88hluQo//3qrXiNyoYd6gLkjh/pQ+9JwqaJk+grgdGy9hPtYBSy6dTW9ZD5J3
	YZF1ADglZgwPkpFoA4rmEDZ/NwFM5Og7yuEnuJXsx49L6CjTtjVv0ltgvFCha5iD45Q1fSQUbQm
	tg8Gp0aHsMBVPz+kAOtq2Wkn0394UrzJq9GArC6VMGo65S4T7f6ovMuYweTQaWNy+rIeD4aUdzH
	ccSdThRCzCpDzhm/BYt6MM8z0tDwcDOdTUTS/SGi3EPZieG3/ZZZ7L/5cvqGcMoWWRl4ioQxznJ
	sG5tUGbKMSwoulDFArnlyuXhy82WouQtvmC/qEVX37eHyblHGfoDMvy/t2FwI7EmvsNOLiRuZ32
	D7z0uNsGxqIQ1G25u4Hxo2sFat2JgJd5LzYLdA4BjGKvkRGHZ7zHct7k7i
X-Received: by 2002:a05:6402:254a:b0:6ab:eb3e:ef50 with SMTP id
 4fb4d7f45d1cf-6aff47a5eb9mr641273a12.36.1791336438162; Tue, 06 Oct 2026
 18:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org> <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
In-Reply-To: <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Oct 2026 19:27:05 -0600
X-Gm-Features: AclHuK9lGFJ50frV5XOEspPFhQU0WOI40P-vsRfzEyGW1xtdFw_gLuYmcCzp9Es
Message-ID: <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 6:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > >
> > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > Please do not repost the series just to address the above. Instea=
d,
> > > > > reply to this email with the missing information, so that reviewe=
rs
> > > > > can take it into account. If the series needs another revision fo=
r
> > > > > other reasons, please include the information in the commit messa=
ges
> > > > > then.
> > >
> > > Please make sure you read this paragraph, to the end.
> >
> > How much detail should I be including?
>
> We want to decide should the patch go to net, because it is a real
> problem which bothers somebody. Or is it a theoretical problem which
> will never happen, so we might want net-next, or maybe /dev/null.

I mean, it's in an error handling pathway that could be hit if there's
an -ENOMEM error on an IRQ-action allocation. So it's probably
mostly a theoretical issue but I wouldn't go as far as to claim it could
never happen either as there does appear to be a plausible way to
hit it.

>
> Sometimes it is really obvious, things like a:
>
> Reported-by:
> Tested-by:
>
> from the same person, makes it clear it should go to net, and it
> probably is correct.
>
> If not, a statement like:
>
> Tested on real hardware, regression solved, no other regressions
> found.
>
> or
>
> amd64 Compile tested only, probably broken, RFT.
>
> or
>
> New feature tested on real hardware.
>
> Put yourself in our position. You are the Maintainer, what would you
> want to read to know it is going to the correct tree.

Do theoretical but still potentially reachable bug fixes go in net or net-n=
ext
generally when they haven't been reproduced on real hardware without
an artificial test harness?

I had assumed that since the commit message made it clear that this was
a bug fix and not a new feature then that would be sufficient info to know
which branch it would go in, but I guess it's not quite that simple?

>
>      Andrew
>
>
