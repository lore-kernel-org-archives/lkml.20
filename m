Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600823EAAA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788637307; cv=pass; b=Th5aPECH3ilsku9XG74GZweSYSg+Lk6F3HU77VbvYfMhU2d3tOqUPsOnz4Ve3AvbClaJYR1X4IAoQOxKM30KFvp2+GmoVlKgMaI+sVsDSa00zU4Em7bijpe34KFIJ9n+YWd7H6LEUMKdk32FdPPmvQG/Sw+jQ73Z/m+/i8i/g+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788637307; c=relaxed/simple;
	bh=mPlWpZRi5Eu4mAVG1Y8l412zLMdWeHMbxSFc+qRmK9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z609vjHPoUIgRDOt+N+zUroGRoET+WxwVAca3SlK/YNmvo7WyYsCq2lTwAriZgh2XBFljIWv9BlYXPTxLkzWYHlEFBb/XUEjMKVS6pHi9nNkwTsLhcJqSalsjDiIuVa7gqOmrhJoKn+JHyDYo27MBB1EXfHi6cGEnErlVypyhHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbxaKcPu; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbxaKcPu"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3271254a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788637304; cv=none;
        d=google.com; s=arc-20260327;
        b=sa07y/G9SzFJAD8yEfQvr4usSzOLVNkgjZtWrLeFHYYWKiC6DEqxuJd/819+M7SlgJ
         24ItUdBmZoQDGK/eOaVCVVhkywwinwYVAFQIIzQdqiTl7nFBrHshakB6zk8NcvnBnHhk
         uzm0P9ZVANZRep0DjtesDyNFD87rnivdrDiWSzTT2uOEA/X6izVRcZy9pWKzYtNBVbnu
         lnDBCrd8ShEj/mDHosBk5tPtLfF9wTFxvWrQ34I9AU+H7ibPDnkEczX/Tr39H2FKFPh/
         X76PTZM/i0YbHLicLESbhywt32tesXvS/4l7bgtBxgnyMmSvDOq1r5UhNiaIDsDe8V+K
         IBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mPlWpZRi5Eu4mAVG1Y8l412zLMdWeHMbxSFc+qRmK9s=;
        fh=/nqGPOJcBG2t9Grjh49jFUq+v0FUv/GJNyfRoeYh1LM=;
        b=GWIMayjkKXoubmdU+FJ3Gc8s4i+ky1vgGxD7qrQwSMoEY0wXLZjM8mtSyHnZO6bCZP
         ozgBe+rUwCOC/MAK7Xs0UxhOgOmbmeB/cGbJGl35IUTzMHA8s2r/b20QlTVswNUNXxZM
         DkQxGmz3hf1WNMo11254KiWXCHF0sxCz+sugHOvMbS+q/HqywC8uUzMLq2rwuZigu9T7
         fV5czckpt2YRzoo8aDjWk/TPleUT+t/YIE3Ll4YJtpSH8h4AIFRPbOcrgXXYKoUbCxTG
         BER1FWXThXw/Nz06ay3VLhL2i6B8zmiJjOk1YhCiLXRkuT6BV05x/ZJVZtKERmPuxM02
         /2Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788637304; x=1789242104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mPlWpZRi5Eu4mAVG1Y8l412zLMdWeHMbxSFc+qRmK9s=;
        b=VbxaKcPuXqmScnhOHuCsdocsWSBj1NW7N/gduKOBfd1in1ECzMioH5EgdWbb2/Wwia
         C1if73FfiljqrLp6RPgjVDK3pzbMTVpu0tKJW7R5AU0wiaR2vb/WtLKzMWS2Ym9P+uN0
         CtD+AjNvxSWZEIdU0DIJNYDPoEgnprMBRPbcLubxurv+XhJIQ4BFuaHTuJkzUwHAJ3Ls
         pJTM2jQ87OmWM7D0MqrjigbYOn/ob0DfBOvLg2hUzeW/twH10gtqfuG8OHxhU9kdIq7R
         jMWDM964sE/J1Qz9P5N+zehhBNACBSDGgBSgGMyJ/O/bmfn8+uun8iQvFYz/hkXaiFZU
         adVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788637304; x=1789242104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPlWpZRi5Eu4mAVG1Y8l412zLMdWeHMbxSFc+qRmK9s=;
        b=RQbxO8rYR3zjw0uvq1MPJTR2J/ADfe3+fxhXiOp9hHYFwss66Wx4eG2Uj0k29XGGOj
         lWN7W41w3ZFBHj46ik10wSbI3BwTS/meVSdXwxY+EPKtLnt55cqbZSgXgwsy/SVxD+4P
         09t8Qy5WjBYJP6oIhPmv0nV7Kkl9TySfJzk5Dm1ROgl01LzY+JvvOSr3/riPco40moWY
         G1Q0EtfZm5nttgJcX4ms/Bwa9lJL7+c3mOW8idE6hVmkXy/W6ui3sdEorrJJRaBdbi3L
         5nW9b/isElrJmAeEvd62ljkpK6imG41/a7vKu7FZ7qZ0DcCqO382xFXmO08lT0NFCR9G
         WzHQ==
X-Forwarded-Encrypted: i=1; AKwUvByZR9sTBPMH/jBDVNs3j8P+Fntco2DB0IOiYYRv7oK1CPgaxDmkP8+4GovFWZUvN6wZpxqtmJ9IWoESoy8=@vger.kernel.org
X-Gm-Message-State: AFuF++kU/qWASkQTy1mEOLSumfk15EzbSEnzRk1DOtA/fSpKo4aBW5a2
	lpAJUx5V8dkNeJp5Rhcn94izM9dGAtysgmYKBGnHo9oo6ssHQnkdSIP50ts2eM8Bj5IFvkilUDb
	F3xvf/zKkgu3oki9yCZsRXDsAC1qmLijZ294J
X-Gm-Gg: AYBFou1ze9yUupnrl4SHX3yBsYWm/eKKV3fAci23ZYL1Rdt0uOxiBWd/L8A/wXaxoZ5
	jCXGjGBRmQjvnIiieXGD5oIJglbAKFxGokEPAk7pwK7ImckBzGtHx+fUJVbJNu+5u/P65ljSTNK
	c//AdEkBHsheahwDaMHgtGSfp3PjutXLxeOXPG8Qece8KHKnDxISlRcgbPs5G1EWJI7uK22vu2E
	fScrNGUYqXnvTKbD05/+0eeyjelwuj/kWJ47dPvvqka7OtfuPeh1JZjIKWst7yz/gyrsSbS0Pvk
	KHqqnD6tMiEU48Yfzr4rr2pGVeQ3bgutUpec/3i83fC+DMBTt+s4wHCCNNs4PcB6Ovffq0r0pAi
	aUeDJ3PKV9yw7Lzq8XYa2Uujwx83L+Xs/mGQZxoLmN1A2kHWrxe2EzPrjQH4jSQcj6/6AG8f/I1
	P0IcryDLIv9jpy1b6HPU2v3M7fNqoaEMkTmd6rKKRu70GztTleau0nBWE=
X-Received: by 2002:a05:6402:e94:b0:6a6:6346:af03 with SMTP id
 4fb4d7f45d1cf-6a7e8d4b476mr4371139a12.5.1788637303610; Sat, 05 Sep 2026
 12:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815190724.16943-1-rosenp@gmail.com> <12f4b21bb334a49c88bf28428b92589adecfa53a.camel@sipsolutions.net>
 <CAKxU2N9ZPRSotiPhayrQFyzbf=sPcU7X3o6ozRECOibhCj_kbA@mail.gmail.com> <9d91e1719383f8ba6dfc45650a92b1f2c2bc2f6b.camel@sipsolutions.net>
In-Reply-To: <9d91e1719383f8ba6dfc45650a92b1f2c2bc2f6b.camel@sipsolutions.net>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 5 Sep 2026 12:41:32 -0700
X-Gm-Features: AcwNN1XlVa-aVDPxhTE7IGJSf7r3navhvcK8Dd6Vt7emBm5JYrbRuD3ygTdt9L8
Message-ID: <CAKxU2N8Of2h2d5BOVkTQKjtmNuNo8x2DpFjC2pFjDCOb8Cm==g@mail.gmail.com>
Subject: Re: [PATCHv2 wireless] mac80211: stop tpt LED trigger timer before
 freeing trigger
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, 
	"John W. Linville" <linville@tuxdriver.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 11:15=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Fri, 2026-09-04 at 12:16 -0700, Rosen Penev wrote:
> > On Fri, Sep 4, 2026 at 12:41=E2=80=AFAM Johannes Berg <johannes@sipsolu=
tions.net> wrote:
> > >
> > > On Sat, 2026-08-15 at 12:07 -0700, Rosen Penev wrote:
> > > > On a hot unplug, the device is torn down
> > > > through ieee80211_unregister_hw() without ever going through
> > > > ieee80211_do_stop(), so the timer is never stopped.
> > >
> > > I don't buy this.
> > >
> > > Also, missed wifi: prefix.
> > >
> > > Please don't just feed me LLM garbage. Do you have a crash reported o=
n
> > > this?
> > Not formally no. However I am able to reliably panic the kernel. After
> > this patch I can't.
>
> Then you can probably enable debug objects etc. to figure out why?
>
> I don't think this patch really fixes the cause, just the symptom.
>
> Maybe it's related to this:
> https://lore.kernel.org/linux-wireless/20260904165722.044aa432f873.I601a6=
7a2cd558b8ef8416a07554ae7efe896e9d8@changeid/

That... might have done it.

I rebuilt my kernel with that patch and cannot reproduce.

LLM seems to think so as well:

Probably yes =E2=80=94 the oops is the exact bug that commit 29e3d27 target=
s.
>
> johannes
