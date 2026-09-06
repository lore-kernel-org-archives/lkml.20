Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126B13FBB4D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788693575; cv=pass; b=WWnCTBw9R4Txe2KDGgyqQ2OwRaxrfh426eITV5Nk+NveWSOkYJx/3E1J/4Fa6ndMC2K5gonkyBld4W1/78fkP2tBtsCnA16m3Vpir8flKu8lEW4L7xSkpdKt2+BPVAUm2NhPvcSYO+CY7P46GA+uBNKcpSTo/MwmzyWPwG+xmv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788693575; c=relaxed/simple;
	bh=Giupk0J1ZNfcLTZqdMpQz4eJAmUP1rE7vrmVirAraPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nr3pNONobNaBntQzEZ4IGH+r+dJ/GJhnql9u3kWxS47w//nd49MmuxPRmN6PryBdrC5DKxpNCZloZ9hpxs4MyLUGHmwuxLgoQIhbScfO0HUftp7o9XoVIKKcF9oER/nRUsFwJDaxt8dVsuuRj6bqG1BB21AlGAdtBkL1+hsxTf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=A1bL9ZKz; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="A1bL9ZKz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d9db539a54so20437165ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788693571; cv=none;
        d=google.com; s=arc-20260327;
        b=akKCEOpNZNJgwy+Retvz9YUxrB1bIo96QCxUE1+SXJAzrg+Ue95D9a4fUnqNuMb/mP
         5V5WgKF+ApRVgz/xg8+83ToN+PosbRxBotAUBtnLjNd1M5cRUQ6WtEqdSv9+jd0XcOpE
         VaYYJzAT1kD6ktbW/k5fDsoTZq2wkAKYiQ4wpT7Z5CncvcxglZ1Yb2cttPyLnFkSDtSt
         DGtiwYM+Xxwcw17GTGmhEPXaGXM+8beVit1+XExDsMxz9N4VpPj0Llt2N7LK1IlRdxrY
         +w9+YI0frFMV0wtDLJh6BgTnw3zgULhoIPuZfcvNX2HlV9/c8CpE8QYX9SREPYFZlx49
         hkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTgCA64EfXR/PGZNkFArmuKTqa5lqNd9HTFkrYCnwOg=;
        fh=AXiwWcinuEZjFrSG2ratem7wbrowrHkW7zz+mogqelQ=;
        b=WWdQnKi2rs0s7G6OPZROS18TTR/8lMvxtsLdohhTguE7Y5jJBlvWZ9b4uUv1IXKqsz
         5hDBXeLYsEY6fQHVufAplSzxH9mXDnaDEKKP9K2hcAz7u25O/ouA1vm4T2MdsjFyTtii
         yX/ZahP6vrOfwrjS6HSwxda/tMJ1YCdtvbBPA+wbu/30E3UZJDtVOIeaxtmpYWC/G+wr
         /CGemZvdJ1/jubS5jT45PrYbwWfsjVfLMkHdXMeYx8rsSEmi7maghEQjwttRjUCpXHdh
         +c7Ye13q+Q2nGZMdF8i/qnfyLVm1mfuQMTITa0aZbN6Vo4y0WZFQgmhxv7yEfp+agCxH
         JRjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788693571; x=1789298371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTgCA64EfXR/PGZNkFArmuKTqa5lqNd9HTFkrYCnwOg=;
        b=A1bL9ZKzb7548j3SG8IvKUw8uu5Cv8yStzLDV5IU2k3rYh5gqplkpxABa+PC2u5bSk
         rtgZ0LDXKmL5xE8hw+fy/H48oTeUOTTuPCPbza/wZZmGKVLx33/v3R6Pd4Ht4cCrhJ1k
         V/DSEqmfKGGP7P4mRGDWmOUegU9yHpPwi2SSjrhQCD8W8Nzn+GK6HjoaUPR/VBGmPQ2e
         YmF8K6Y/N3NhQIDnqcs9CEBMp6DXM7MBtARGkR8LPm3AMUfKQwQ15xVFGkZorbaHqa0+
         uiGIhqFv0ZCExOztgd1hZeYFa/5a7hr+DmpCnNvmg32i4TfUPwGJYG/oNQCYgT80OE+d
         vQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788693571; x=1789298371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTgCA64EfXR/PGZNkFArmuKTqa5lqNd9HTFkrYCnwOg=;
        b=iZ8D60VJchVzKwuAVA0C0XgI+wqRYBV4Dsl+Eh1zBPHdXrnhGprPrpQJFtKrL4PrY7
         f9ypyZHxNrHWiLdjJwHuq+noX9oishPZWoyq5y+ig5Z4840aZ7JeOGmn3Y/5uTcLdEa7
         6JCesIsAZUy/PTn1JrTze6nijQONKruFspVhPUQUmLmiXVL6YUocNMzJJkJjI5hJXxxm
         ArW1IixPzoUAVpbOIkv1OLHyX6rVJ9jtSvJEqJyl0/axLaK0MH5XPvSdd18dMKAHI6V1
         UisFHdy+22gSfN1iINQXShnzfz1KnkLDMtKJUiGnJivLUGZdL8tuGH6lHUcQCgjs7XXr
         o8tQ==
X-Forwarded-Encrypted: i=1; AKwUvByg2EPShtz+Qf/HhkR4bci73v2i2YSd6zuo7mHKSWA6m9X+OPin7OgvvP5q9Sk+MuN+b5IhR3zRXBy26iw=@vger.kernel.org
X-Gm-Message-State: AFuF++n8B/cFyEi9sVsi53lsJAO8rns40Lf6UOo2uYCRwPtMbfzOs203
	BiHHBDZgGRQt4cW09LnHGyhDjL2TVDIfbBXAmsk2vf+3PChgZhX2eNMkPZQDi4151MM26bRMB5e
	iNjvyoeBlkIWxJfDKodNsAjJU2bl4KTXCjoRR0ybFcqQbLFKGspeUMyTK
X-Gm-Gg: AYBFou2uO9K+HkCeILUFjJ2mFw3YCmUKipj6Z15Xuzmd+ZCDSF5+C/dcucA/2TSR8NF
	aDa2WwsMU7+785go7I1wTcAbLJCTeklI+xhbTdNaxzICwkoc4DFuNiOrFBB0bn2vlGv2nBB+pGv
	RIQnLcwinomu1ip380eEftp3ZEZ97FSQjDWVYdLaGNtFPxaZ0+c2LpEk4+mhKnNIECcFyVDczer
	SJn+jFGvWW5EfFVkHj5fWoPCAqqbf91onhqhNXJs4HE/NoDH1fb20WT2p7rdA267XI/YYQzn/o6
	sDWQDoJRxFhZcXcw8eyZ5GRBi+WXxg0x0bvcU27Zg1f6eh0L5LV0aks3EZY+hQXV++2pBHDTNnW
	mZHTTEyWdADDY57CBPu10NxlJZQgWYUNC72Y=
X-Received: by 2002:a17:902:f68b:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2db12495a80mr248860175ad.6.1788693571315; Sun, 06 Sep 2026
 04:19:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <upsCxxaJjg2FJWhfCx6KjFXLlh8o4IhaHKJi@bugs.sh> <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVVqfqvueX-jk_XfM5tE9XScZPe1OLqGw1MUC=Kd2reBQ@mail.gmail.com>
From: Xiang Mei <xmei5@asu.edu>
Date: Sun, 6 Sep 2026 04:19:20 -0700
X-Gm-Features: AcwNN1VwRPW3yMBdTVYbJmlJsVs_CJngzLBHUrX4gAO4o_iesE3RGTS14IgLAxg
Message-ID: <CAPpSM+R_EH-grYvEs3QFCsi-tej4yhUqrAib2XcDLh5TKKeh-Q@mail.gmail.com>
Subject: Re: [BUG] drivers/net: out-of-bounds in pcan_usb_decode_buf()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: co <co+5e2bcf11e7027510@bugs.sh>, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?St=C3=A9phane_Grosjean?= <s.grosjean@peak-system.fr>, 
	Oleg Nesterov <oleg@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, cedalion@bugs.sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 7:04=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Co,
>
> On Fri, 4 Sept 2026 at 23:17, co <co+5e2bcf11e7027510@bugs.sh> wrote:
> > We found a bug reachable in:
> >
> >     path    drivers/net/can/usb/peak_usb
> >     crash   out-of-bounds in pcan_usb_decode_buf()
> >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/trace/linux-trace")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you patch the bug based on our artifacts, a tag would be
> >     appreciated:
> >
> > Reported-by: co+5e2bcf11e7027510@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an LLM-generated root-cause analysis and a candidate
> >     patch. The patch passes an A/B test: the same reproducer panics the
> >     unpatched kernel and runs clean on the patched one. Neither has had
> >     human review, so both still require validation before you send or
> >     apply them. Available on:
> >
> >         patch.diff  https://bugs.sh/b/5e2bcf11e7027510/patch.diff
> >         report.md   https://bugs.sh/b/5e2bcf11e7027510/report.md
> >
> >     This is an open science project. The code and the full set of PoCs
> >     are not public at this moment, as we intend to disclose our finding=
s
> >     in an ethical way.
> >
> >     Happy to test patches. Complaints and suggestions about our work
> >     are welcome at:
> >
> >         cedalion@bugs.sh
>
> Please read Documentation/process/submitting-patches.rst, especially
> https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/process/subm=
itting-patches.rst#L928
>
> Thanks a lot!
>
Hi Geert, thanks for the reminder.
We'll learn the documents and make sure we follow the documents.

Xiang
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
