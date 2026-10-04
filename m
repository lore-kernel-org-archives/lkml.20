Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C32222A9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791097261; cv=pass; b=aXhkBLs/j/DK3vtLrj9ZG18UnfuuYpGZQEoM61QXkEK4yHw6UW16b4q3AKVsnLAbnD7T2YbbvuRGVoE74mPH/4kdMR7DElVwDDwfaO5pAr+qPTuNbyQ8uNOUxMQafLoaViwNl7I5V0L1I0y486BbPbCk7AvAoZ6QA8tECmyDwOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791097261; c=relaxed/simple;
	bh=8z2Q4aSQIYqwr1uqGgLedKrAGeZSHBHgbKQnEdpHYAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQ2vW+KV3EaIuAMuX6ooR5Ik6dl9vtg/x/1yRG1enlXSaW5TtiJVXPC8Wja5hVtuTmU8sEqMYnC7koCAQK3oMV/K1Ac/JzwRrCuk4ZOy58VM6DmX9RFeZk+jP+xopZiZ3v4p60WmhaoSvScAzHa58KYqDJ1T6J+am4jBC/EpYQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiBoklOG; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiBoklOG"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a2b4743936so6696441fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 00:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791097257; cv=none;
        d=google.com; s=arc-20260327;
        b=fktbHydSymk4aHTU+TvfAD7Zuw+NJjsk3IEVRyLQjMPUejNkaVXaGqd0poeg23kPLL
         8hBy2HIqSgUK0tLBU1k6V+R1LRsbHhbT05R3DHuQDd77qGA2ZS26Tr56Iodif/b+g9ia
         XT1rJJ1Pl8rBQ2AmH4+PgolFR7bSJC3C7HfWRvOPN9K4QMmHZAJziigluOvLGiCcMfgz
         FQr7V98b/cqHuOauMs69ydQTO5MS4QW3GGmpHKH9ZlLuCtZ1MBjhny4APZdLeiebZqlE
         iFhCFx2g2jJytubESeHoG6CNgEoJlGs9tNIP40b7CbMZ7woPXKt7DGn+LDR4oImYxv3G
         7Ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=;
        fh=Ep7b1gLIuncsE76PYn3JP+gdb5oRMqmV43g5I3N/YGc=;
        b=mIpk4CzztsCrvsLv7Iemcd2ig7U96Eb+0YLrcynX+dS16+qD/o7lcEDMmDcRnsVY4M
         V8tA0eItUpyx0rlWz1T8typIvv7KGxaQLNfT73qRvyKjlEiWSjLOA68gZMeBChUkm7MZ
         Ts5E6BTzcpmvkEIEKRMOdpy6HhNVmCKdqXJlXDhmpGGgbbkL3kGM5v1xzuzxWXDYXMdb
         2VWG58EhapE3BvTSFRFBJTOKmbyxg/TwipQLTAgqNGbAu3RgT4yEZBzlrpMsxR+5YC29
         rhM2P9i8oqQe9wfNrjyDv6FbpdnOxaDCbHrPk/mXdkwxVjr3mVLL9CwWSWkkt75VezUs
         igmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791097257; x=1791702057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=;
        b=LiBoklOGGsS/ZVUtxvjGuvE0/LLEQtcXqoGRRE5kCqLj9Q4dWGW+tCoRsvoRDwiGZQ
         Q+xJyMPEOm7tmd7El5v+7DuRvY+mvmVSyJDFJo5OXV7b1aHAlhp+z0p77x3duIWvPvmq
         puqQNveL2I1RBwxMBb8O8ElWPXpCKtdqqRJPloAKsvvncKHyzB6SmtOvJxROmPDWCzdL
         ibvwTKFLGFO7FpoiLxU8AF1TLrldNPKxFXNcBiSzpG1kBz8r8xyKUjJ56wwJPgZM3/MP
         Wcz6oOX6sw6j9QFfLYnKlLWfMr6/l9p3iVyzULkHz+13sMnGDTYos+bYIRCdyK7PV3O0
         yvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791097257; x=1791702057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXHSUTDfF56/ebo2tUNw1YI0rOH2BaPU/almIFz1WKg=;
        b=ymPb5rSU8GFDL+FpjjXnnPpJ53oCuE0Xs9B/lj14MAqmmcOO34tsWYs9kt1PhowWRu
         MGHhv6fIjhQS1dZSYOPVB4dpjD4f1rm5FevtFc4mzoCyHxNJadP0L8PBdixHBlFG0OCh
         TWXFEJ2u8Yx6gjYadqJuMAw5cyisVbA9u0YtPQM1s80Hz0lhrn2Sesn15m40d44N3ZKE
         TQBm1UfY3QFsCG90BymGmgNZ7rRJYg8bh+F1nZmWQFzucvMoUzuPpqTMn5ocfeBQcN8g
         M6KZhYZawFFp7xd4z4cQUlCr9UFE7SxckqghQPXlwpehefhI1xvSTNpAylzCBnM/sOLK
         7QeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2efCbSpkjZ1I2USBHyM9+Jssm7WmqXLNPut5aGCLMdbvcQEZ3HpRJZ10FRy4PhfsEkzgvGOaqUfWJOPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoFm44NG6SLzjk0jTns/b70uf8Ci9wSvnL71m0hAMz9Vpwxkha
	Jx96aTBt1nxo4usyligDlzx0cgnXQBDZR+TQegy2IL3yi/I6uOhmX22UaqJ/yuWs9ldaxanJijV
	O6ZtBXYn/4Dq0ttijE0O/qjzEOyz6tAI=
X-Gm-Gg: AYBFou29hl9jstJQET9HBwcPnENVJ1e4Fy3DvwpJuv7AdNtusTSaxC+mvtHq351F2HZ
	wVEehvxjHmWiWIQ4Yu39wM4f4J0MwfjD0jvajOxN0yvl1qs0FX24/0Ov5CFbVDLuGyDqks6jVyW
	+I9UsKjW+jMyY/mvepKAOu5aQ27CQ8sXGQAf4ukRA1eMfQ7XeQbVL6sqQHIW6cxW1S3xofJJDuH
	AD876Kzvn0BlgYuSs2Svq+aSjdebF0uaDafmL5roEn1gIiJuCr/3k4nxx8tSxTmLldmCFfqtMgB
	YOJ12D3ytgh6wK9N5hZwXY8wn2gzpo/VG/oE3TqVTkWuCzfuxS0Iiw==
X-Received: by 2002:a2e:bc03:0:b0:3a6:6f81:1017 with SMTP id
 38308e7fff4ca-3a974f53555mr10680051fa.17.1791097256973; Sun, 04 Oct 2026
 00:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930071536.627964-1-maimon.sagi@gmail.com> <20261001183814.4e9e88e6@kernel.org>
In-Reply-To: <20261001183814.4e9e88e6@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 4 Oct 2026 10:00:30 +0300
X-Gm-Features: AclHuK-gKLM5DyDjTIWluJ54WCoWTSUW6QHXG092v8fap6l1hS-WaFJz59CPzZQ
Message-ID: <CAMuE1bF_=t7qoPxxhXA5pAShnWx9kGpy0BSnRj_CwuD9WUuX8Q@mail.gmail.com>
Subject: Re: [PATCH net v4] net: axienet: cap the TX poll return value at the
 NAPI budget
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, radhey.shyam.pandey@amd.com, 
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, robert.hancock@calian.com, sean.anderson@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 4:38=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 30 Sep 2026 10:15:36 +0300 Sagi Maimon wrote:
> > @@ -1027,7 +1027,12 @@ static int axienet_tx_poll(struct napi_struct *n=
api, int budget)
> >               axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr=
);
> >               spin_unlock_irq(&lp->tx_cr_lock);
> >       }
> > -     return packets;
> > +
> > +     /* The whole ring was reclaimed above, which may be more than the
> > +      * budget, but a poll must not report more work than it was given=
.
> > +      * netpoll polls with a budget of 0 and expects no work reported.
> > +      */
> > +     return min(packets, budget);
>
> Please take a look at commit a58cdf56b6e, that's the correct approach
> (incl. feeding 0 to napi_complete_done).

Thanks, that is cleaner.  v5 does the same: it reclaims the ring,
completes with napi_complete_done(napi, 0) when budget is non-zero,
re-enables the TX interrupt and returns 0.  It is posted as "net:
axienet: do not report TX completions as NAPI work".

Sagi

pw-bot: cr

> --
> pw-bot: cr
