Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793548024;
	b=KtbOdJiUgdf1+f86N9TfKGVklK2rgoiL5ll+wBizF/4I5nXxQ2bzhe9dCK88c5AWmeai
	 p3tcQe0B2Lnsi8i9zUvq9sr0+XDBUIfrTkL2XFiNi0wiaMrGOQU/XeMLOaU4xuj2cPE5A
	 gwzs0+O1/ohz64Dss/x2LrkQ3phzSXTO7fWJ3V0k07vLpLptOH+7ImDtStOj7V4uvqPrU
	 yB1nQMGtHK9qnld2ZYddfWHcX//2n8k/xb5LoRDbnr44O/jSqSswQP7NsRF6zfc2QQu1C
	 rey1HxOwgxrlft31AmdF56yBgScDeI2drffLPQ8BrgItcYwJUFNb+rEdIR9eGs+YerQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
	b=Agp9nTimrnzpqDEsNWfZjGinrYC8W8kUZ4DUJC14VwDjMKHb2WbLEJ4fGlI6Gl5nb1jD
	 UPQ2sYP8Kjwq3dTlc4v+k2JQWHsm856hSTLz/SkLKrk7X0GCY9Zw49XVsAZdBwxjmVvxi
	 c3llVBTRWilM09Oc4/7a1E54EnfY9vlPY1f13tPffPiODp/8ZAP6OoIRWQYTqz8I8fIh7
	 /I6QbNOZuzagznk9aWrgWoEKmE78Nq7HT2WypSJHwSYaNQUeYNY+37R/4fQVLUSYtuJT6
	 x45w3olsxm7bLlGwouy0EN1O5LW23ugDVWwdvTVLDutOefRY3FEJnaY+hP/oKylejlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=duqAjNoz;
	arc=fail smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAD606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=duqAjNoz
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so263901cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548023; cv=none;
        d=google.com; s=arc-20260327;
        b=eApme3912gLZMapjXaHbmE0S9amgS3jd0IzUfh5BmNJL86tYlEDglhVUSOFd1NsJMg
         jXqILuRBWlYgefeHaJT6DsDnw5K9ig6y1qp4ETJ0rWH1wxbJvrDvIEHbvxaeNMT+2gWW
         gad8SlXqhIRsbGgE3eEc1U61xzrqs726gj/lROx7M29WkKQ1NafAVFMoR+ydI74xCOeg
         0c37ebB7EuJzsh77MwwHoacH2Cev4Ush8dyaz04MD28g5tFg2KKz3VV7YBr0B+yx/R46
         ZndXOR9OLnFa1ijkKLAEOIVo0n0We0hOv+bCYtQ7olKFezia4l2+P3e6x9ay4260p85X
         z13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
        fh=BhOQ3AZQdjy+++s610G6t4vP7QYDjF8KNmaSYrzrAO8=;
        b=VJocdvKUvLy7HKm84WzUmUX1inBteULF/7UDYOsT1tUOxG7XDo+hrlNp3u5Qza7G0q
         rW+YCPqGjpI468Qxpw2ZjLjQNx2oqTSCBieHbJeMn6p2+53t2dqJadxEYny0Qzf00/vJ
         rkTbc5UpdcqekykgqC9m7pJLE/Gign36qtTuo2ME8aYpKp/0ZFjNqOlUfr7dC3x4kVbr
         MepclsdBBvVN3vD8Bz7sP63+RUXIoEgDheMm2+LAxbHSUfxmMQP1N9Px3XMqS4eJ1tSF
         AD37+LK4khfKVIh990uvmdPPRxJT31+kvAafpGi7A538bBvXnEqcVvS+58p24BYEtMOT
         NrZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793548023; x=1794152823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
        b=duqAjNoz/dFrCrzZ1BFFcB4+4xl0U9zSzpUZMbw91EDsMC+PYE2AOFDIi7bVmxaZaw
         BQucPtQF7jA8/IlnLY19d9Me+/9LBKzDySBEMkMYqmWe8RjPH9jt2BciATQklkiq5eqC
         IWjfpHaJV2UdAG7mkb6SIxlhZc8sTud1E4uoWIDgM6muoYXX7v5njA9NAEQHk036tpo8
         RGzSafP2jmZx0Q1T7XL79dPjL5uPBuD04NLCA5A9wOmWE/06tRgndsPKv8Ei9DuKT/IE
         KWNg9jRBYL9b2MrlLz4aQ0G1qV/G/+cyhvLWl0UvcrzhoxZVbAvap0D0ve9JU6HAoyp0
         syLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548023; x=1794152823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rnvo9UG8/PyUCxjRTNkK2BrtMq0/hvvsz56LwYy2AKQ=;
        b=kfHd5j8yze199rZEdfX3EXMs4pe2cnFSkdhqRvj+stEnRIuyaAUL4+DZnOiwfyioqz
         3976R4TC9sZB5MVEgHPgSen8WptTz7D/i1x6mUrIbQ3RHHH1wc3/lCIXbeKuzmb47L0F
         I3c7494icfNKmD5m1FwyAFWry7fVEhPxy7l6PwonZippfNo1kak5Yd1YwQuE7dWEx01X
         FCOQjYpeLHqPsSLidKQ+uEuLQQZW77EihZjCav+khPP32lb2ChGSFBE9ZMfBGNWVfTUQ
         94E2eQ4FooMHcuQDpCx1VqO9JEcZp4j2A+olol1+FQD5RiGW1nUNPxYArMp+JnN86lzn
         CC+A==
X-Forwarded-Encrypted: i=1; AKwUvByhMGFf3FDZIt3zoujIg4jXRMWXWTT7QGQhwnI2hbP8Z8O9MQSPETzpOCT0nSvVZzoF46Him+9mBLpdgos=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ32f6A3/1la7G50Y42AxYL8k9k3Z1qlYCB8762A3IAed2qBcJ
	RQInzuN3wsTw8eeZOWL2FEwsBPPOUJboGbZhGA9O+C2uFFOO5rYUCzEUt/ULKPd8vpPAyYBeS1u
	if+espmHdwFVO9OvS4p8eJ0kun7CH4lE28/xCzHMx
X-Gm-Gg: AYBFou0NLn37xOOH1/2bkaBE5AURAkx6gC+qOA1ZO4BIpXu472dDzl8CJG/H30/bD+f
	Agf8SUiguMVsfPsVewCxL3JyV4sudI13qnyCe9fM4aWxW28L0SiwECysfnm63Nx91UOqvtwAKDG
	CnWSGvryPMe5FpoPvhrwytvuoGFhEHzFF2yzQyCD8WylgdHuGkCTt/LkTKQWN1OQsLprGgWPMxL
	6ZLuH9Uyk7+doq0d8q6MrzOrWmN1Hinll9mb1H/7IPEC/MaBzOL0r4zWoupVAkY2cDmRJikmlwd
	RVYgsYT4VNg8+/qirJFGlIlKGCHx/kfg4MtpKoE7jynTClwp6mFXNdl2/lMjJ7gCOvDnbBaIOc/
	Zt8lOiOw3rkcifwCPKhVn70wQioIhtQDZ7CIBlo+Kfq7BAYVEifLsdjlo
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr76624581cf.14.1793548022450; Sun, 01 Nov 2026
 07:47:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028051312.1505295-1-surenb@google.com> <auHK3k-W4gfL_MhI@pedro-suse.tail5790ac.ts.net>
 <auJO9al4lmAczLAu@pedro-suse.tail5790ac.ts.net> <CAJuCfpHAFXDXs4ZBrd8C=8hkQdJxcWCz+DER5BG_Ki0ndGpf9w@mail.gmail.com>
In-Reply-To: <CAJuCfpHAFXDXs4ZBrd8C=8hkQdJxcWCz+DER5BG_Ki0ndGpf9w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 1 Nov 2026 07:46:51 -0800
X-Gm-Features: AclHuK84MQqzMKZd-OXYE0wk48ZMx_UhE8Hg8QFqNvu-tilXapmhIB4d1-01OeM
Message-ID: <CAJuCfpF=DdYZ7UFH5vNJT-qoF9qrDBW7pgk7tHeD5Z9X7PH1og@mail.gmail.com>
Subject: Re: [PATCH 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:59=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Wed, Oct 28, 2026 at 12:42=E2=80=AFPM Pedro Falcato <pfalcato@suse.de>=
 wrote:
> >
> > On Wed, Oct 28, 2026 at 10:14:19AM +0000, Pedro Falcato wrote:
> > > On Tue, Oct 27, 2026 at 10:13:12PM -0700, Suren Baghdasaryan wrote:
> > > > Pss metrics can be affected by map count even if VMA tree stays unc=
hanged,
> > > > therefore test checking VMA tree integrity can't use them. Use Rss =
instead
> > > > and pre-populate the VMAs so that Rss changes if a VMA gets skipped=
 or
> > > > double-counted.
> > > >
> > > > Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup te=
aring tests")
> > > > Reported-by: kernel test robot <yi1.lai@intel.com>
> > > > Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@in=
tel.com
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > >
> > > Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> >
> > Actually, now I'm wondering: isn't Rss also flaky if memory pressure oc=
curs?
>
> True. Sashiko's findings are also interesting, so I'll need to figure
> out more robust ways to test smaps_rollup. I will post an update once
> I figure it out.

I posted an updated version at
https://lore.kernel.org/all/20261101154503.3203036-1-surenb@google.com/
It should work under memory pressure and also address Sahiko's concerns.

> Andrew, if this test failure is causing issues in the meantime, please
> feel free to remove the ca5480fb53fa patch until I get a better
> version out.
> Thanks!
>
> >
> > --
> > Pedro
