Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B960384224
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812453; cv=pass; b=DLehtjHASsrVWLt57zE/c3VMsKcnx0KdWW2aeXSRtj7SYQdcKd6vbMFdZb81ouWLNlYVo1RVFkgiNSttk41IGRr0VA8zDBMmTm56l19+2mbiqzJnVT9H2I4Mmv/bqmqwS+f5GuxK5k+HInMHyg/dut1qPAp16PrYaNGbdhM3KJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812453; c=relaxed/simple;
	bh=tr28fG4ZEXTsiIAwMe0wjF7BnaOQzBQT7Xkb6b/2La0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMyxS5pLNegz6mjIgxwKYFRZfAVXZlRDUhg+2vMlrCnweFeMx3sMbMqABA69VYrJq8WsTwLMBxMNKNi0s8Zf30Q4ZaAhSVt/ia2XxfRuE5RWckd/iWEZeb1bRGomqhun67VuBxDrWc5WDjd8I499Lx+77hE7lbCntgn8asS8Jz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRyjw5dn; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRyjw5dn"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so379837241.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812450; cv=none;
        d=google.com; s=arc-20260327;
        b=gMqqvmrhM5/N6ZvwcSyX2Pd7YfyumOpZtKsSF5U5565kL6WpsV3z3+g4s/oyYe66xM
         eHN0NkmYRCIrqYFChY3TR9VkIOpnSrssB0MBOTniuLCDc+8dAC3tAh1POPD5cOiCyFoS
         7L/kX1O6gi6rbpYl5z2vg4e8AcfLIIicsboe9t3JfenUmIL6y2X+8x21NnChAB1UHbKy
         p/H+q5jvGF+2nL8g3/E56rYgs3hFDp+xqY5i6naxNkahRby2mvOLI6ixtru6vX28q8H3
         B8U78kcElfar/GaYUCEAzg4bfNhgZGsT7tTAJ3mWUwmDbWUsAPoRwdLWejL+VZP25THM
         aCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        fh=ec/pW8aEzasT8C9dEI087KdacSnYSfXjdM1t4sF5/Ic=;
        b=ajmVtxLPCsr/sEHapHmMlNZxKVHctaGdiELH+ZPAEWsyE3VAlGMTZvIb5SeSYaYO2N
         ziF7YVXGgsNHfxMvYYpob2M1Lp2vLw9zK0yjW3tADHoX382o6vNjT3GRXkd6x6qtac6a
         RrAtsA1QP36jgwmddb2SU4vYSDiOqF4PzblFhbPJlAd+BKYFLWJnQ3HG2jyxDdllMuN3
         j3PJsUaWk45IcpoL/dWAgCJdYzresm5br19tX3dzm3G/1VAqKVrJJq2U5g3JeosSTF0A
         AF8J+plpQzXhiHaTqDTFbKoC3wV3yBNyB1bM7L0aYRcw/NWlyatmCsogMek8njcxEKaz
         q/vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812450; x=1792417250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        b=pRyjw5dn/Kruk86zA3s6mVhdAv8ouj8o7tcJm6whzyn4iWhpQ3HHDSic7Xl1JDla1i
         S93Ivg8rG53EMXchKK2D4dQI+ku4SKe1rMmTJrdsN5woBsaOK1lfMUPsYZuvFzrdiBik
         znZmmtWYeAH/W0Uv9VUm0tgU7kOSG05qmowkKcBohyGzJjyxE4OWMkF9MTSDbASdNUYV
         t/G6TP1PJSahD6Dg8URPLbg+mNMjnHolUiVZQz5FQ6/cuh0lMDaztNBLN8zAc7EJdY9s
         0hPVlflfGWec5E8dbNP5LXf29vF03gaQqlokKoeNX/VuiqwOIWbGMe9raxJNqknwvteZ
         pNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812450; x=1792417250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fISPJgkN0H7LYXqIa8i3iQfM2z/jXKgb3BG/d5Eps08=;
        b=XXVT3gw8xDHZ2awFgDiWt0q1cR17dyTSuKbYisFOe76/dwnzIg42qG50aoiik8oafd
         q9rrUoPpn5DNoFYr/637uohnYg+Tu6Idso0KPxqNjB1TsmHh9j4FlJ3hhCybvaU8j04q
         pu6F3uRHC/h0WQIO0CL44kForRiA9dkf+p4JRDpbkq6RWA8onxy9xkJoxBxIfsbBAzdJ
         UqacwNDepVJ8Rwtsms/e6asrchx3cmH4WjyImgyQ5uuwuoO6xjjp5zWvqKg7OyqbxL93
         tnq5gMbEsn463nVscmocaAF9jPJTorKrfNJ3lUtmSgwCKLfsTw7qviOum0xvaCTh8uys
         ztdg==
X-Forwarded-Encrypted: i=1; AKwUvByJGrTIQjmKMgQRxSgO3ZfHvaa8AHxodI3MuvJYwo2qR77XKhnNtAotG+d1Jpwt+jB+3Xivz3g4vfZW7Gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYImqjczAM/yoJWpdb2b4+zu+TSJS2X862R51CkdwDxX1UqVMdeZ
	jL5Wy82nKtNjD6gtzq+3/oAFTZmMyedGIamuxzkPAFAWk2t1tkq5N8PhP6bZSpkRQ13wAFQt9UH
	TW7W6cWyWTw/XphNvrS1Ha2w34yjtk7A=
X-Gm-Gg: AYBFou0IqkDkns1oZm2uQL3SpAeH+COheOf/VDEUkVcM4u3Ia0EyleoIOcidNoDN63W
	TjPI2Dldq39ge0189mZU7jaN0Ei+T6jo5EQ3TJ6KhEyfzs0Q5OEidigFDg7lbJXB8h7EDQx65Ow
	INt3Pl2mWjgX3dqgrlPAZfOiRwwlkY2YS/26MLXk6sBPAXrC3tYnKHpkJE9Ac5JYS2yh+yfStUm
	P320nP0o/ENalJqNYr1Gz1ItDBGJsYBEoUandG7pC2t1LwQ73EPRgbUPp/eRT06THA+wceoJT7l
	Fb+Wxg6RkodLW5DyWpednKVBmiEhg8vCG/7IZxRsl6jaEfYFqCJlbHSSB3E8JsnB0ZxKH6O30VN
	r3hUpY1l5
X-Received: by 2002:a05:6102:f10:b0:7c1:918d:d188 with SMTP id
 ada2fe7eead31-7cb373e9685mr2247621137.35.1791812450478; Mon, 12 Oct 2026
 06:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007182238.1154851-2-peter.hunt@opengear.com>
 <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
 <20261009001714.1078580-1-peter.hunt@opengear.com> <20261010171531.1659006-1-peter.hunt@opengear.com>
 <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
In-Reply-To: <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Mon, 12 Oct 2026 15:40:39 +0200
X-Gm-Features: AclHuK99dZi0qD-kjTJ8chj2shsT6zJyFcPaX8IvEYin0Vx-u0gytz2jHkZuBVk
Message-ID: <CAGRyCJFnszYkYbB8fJneue_DgJY_9yOwK2_T1aB-b+RuK7mqjA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Peter Hunt <peter.hunt@opengear.com>, ryazanov.s.a@gmail.com, 
	johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter and Loic,

Il giorno lun 12 ott 2026 alle ore 14:15 Loic Poulain
<loic.poulain@oss.qualcomm.com> ha scritto:
>
> Hi Peter,
>
> On Sat, Oct 10, 2026 at 7:16=E2=80=AFPM Peter Hunt <peter.hunt@opengear.c=
om> wrote:
> >
> > Hi Loic,
> >
> > A follow-up to my reply, as I overstated one point and would rather ask
> > than argue on both. (Adding Daniele, as the first question touches his
> > recent QCDM ioctl work.)
> >
> > On the AT-only check: I said QCDM has no DTR semantics, but I don't
> > actually know that. I've only verified DTR/RTS on the AT (DUN) port of =
a
> > Sierra EM9291. I don't know whether the DIAG channel behind QCDM ports
> > honours DTR on these modems, or whether libqcdm relies on it now that
> > QCDM ports have the TIOCM ioctls. So I see two options:
> >
> >   a) Keep it AT-only in all four places (open, close, removal, ioctl).
> >   b) Call ->dtr_rts for any port with the TIOCM ioctls (AT and QCDM)
> >      whenever the driver implements it, again in all four places, and
> >      leave it to the driver to ignore ports where it doesn't apply.
> >
> > Which would you prefer? If you or Daniele know that QCDM/DIAG ports
> > care about DTR, that would settle it for b).
>
> I think we can go with option a) for now. The documentation I have
> only references virtual RS-232 control signals for DUN, and we can
> always revisit this later if additional use cases arise.
>

Agree, I don't think control signals are used for diag.

Regards,
Daniele

> >
> > On the locking: I agree the data_lock/ops_lock split is awkward, and
> > it's this series that made the two locks interact. Most of the races
> > found in earlier versions came from it. My only concern is the blocking
> > write case I mentioned, so the options as I see them are:
> >
> >   a) Use only ops_lock, with the whole ioctl handler under a guard and
> >      mutex_lock_interruptible() so a waiting ioctl can be interrupted,
> >      accepting the wait behind a blocking write on rpmsg ports.
> >   b) Keep data_lock for the termios/TIOCM state and take ops_lock,
> >      interruptibly, only around the ->dtr_rts call. v9 already limits
> >      that to when DTR or RTS actually changes.
> >
> > I'm happy to do either in v9, which do you prefer?
>
> I would also lean toward option a). We may want more fine-grained
> locking in the future, particularly given the blocking write path, but
> I think the current approach is acceptable for now.
>
> Regards,
> Loic
