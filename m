Received: from mail-yx2-f28.google.com (mail-yx2-f28.google.com [74.125.224.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957047D44E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.156
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251246; cv=pass; b=BSS5sAP4CdP5m8EUDZzmJ8JcFwSMY3Jq4IdICAyt1WjgNyY111BoOPINIGRSmOdo2KxYRMmHxJecUDBB/K49UmJava3VX2xPpauVLmo2RFqiH8oRAuSQDGcLzEdKtpNFYdnF9sC8wQgCzOdlxWPlsTvoFQWBmz878CD2DCX0eZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251246; c=relaxed/simple;
	bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ee9Fb3qPdqkNEoryXlVQlvXH0HrnwHtnF40wVMBK5RAn7KC5eWLUnXBgAnd1kU2iVUoYeFp8ZkZwDgnlBGUrIpaUJWmNOuCRUgzPZnefNhoLDzCeeYS/i3w1al/uac14oKlvoXkoRcxiAHZ5D8ZB+W2ygc0Tpedq/u0N4VUXqqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdVWudRr; arc=pass smtp.client-ip=74.125.224.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdVWudRr"
Received: by mail-yx2-f28.google.com with SMTP id 00721157ae682-85d43db0c16so26050477b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790251240; cv=none;
        d=google.com; s=arc-20260327;
        b=LGgePDpOWYDYwH/LgbVV9cH7cU2oPwJsv3TvMwhBW8aqZ/ku6Js02ZKp+J4NMtPOPt
         3UYmah12Ixbk+E6Czb6OsNqWamnEyorF1pryCXY2ZHc9a6OpUVKBfA7gZ0jYCWGTukih
         RiVxqzhpkrF9lYO8tsJaxTfjMTWPxqg4htj+E3k91f2M1Ee19XuFyLGAMuyTxQbW/nM+
         g5V1WSURAUziE59MIYO2MCBPQkmASdNkKtCsdub4bzMBqBCnuQXP8mix47vzYbQQmiEl
         IcV/dONKoO12HjWC91nuknau2n0cuDqxFD4TxGjwGbanYfSFc/XOunw0+Wt7woddyl9P
         heog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
        fh=5u4ugYX+G9UhTF5iNXzbGZ1gD+xpiDignf62kwJRwFo=;
        b=iXx/5nas0SH8Qgz83EHU7TwfpfDwhAqRyYFjkyI2T/8wWmo7VqU1A0HaVOY7zb4YO3
         HCgLb+yp9irQ6l02fwgRaQNLbes+qv6E88IORQX3cFOfQ1kWrIzl3SXK3ZgtjGGqv7M3
         DIznQLgIBYn0Qaz5Bb7Yl9PMoJK6GMvTyAJ7Q1qhhEpzgMA141NOlPgXaypgMGGRuJui
         Sb1Tkgv6A6vcPxS8la5XEO57BQ6SThzESh+FLMk+y3zzI1gR3w+fZdD4ufn/Ti0dlYMz
         uBrMYh+5UM7OSc2PsR/jHLtB5bWn4d+wsN/WWCFsGN3EUl3g32yShCH0pRxdTZVKyKCl
         hWaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251240; x=1790856040; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
        b=JdVWudRrI3FiJXAk84gED11cP06wPOP4bn8sz3yLOTnjFy+NL+YGTWLdT7k1EuZpwN
         /2B/ZVI+G+P/+P8+Yx/5rtP2r9fyRKdIS1oZSYI1OQfB7WQadgNH3um1vbhViybI48Dl
         rprFZGxI8OUzJ5NocUYfmftLftP+I1rnUJS2kkHascv+eDrf282C8sMkQDLQwHMkcICJ
         F/E2HT4o3LydGNkzlZ1SVUrDuVUMGPz2MctzQft+lmtBihkefOnAkRj5YsY50+QsnT4S
         jH46oDYc1LphzuXOyBQOPLowvfRkSK2WrkIlxuEYTygwTPnyZjV/GFKgoouWdXngmbVT
         3cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251240; x=1790856040;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V4eu6A97YuNjzUNXoyTJh0xukmvbj4affVPwK+58STs=;
        b=o+g6eDE+f6dqUvVWsNoHjJQX9xVPMIat4BgJxjAD7aRsFCy8ewdR85SjGxkwuOwGlQ
         kZyK1A0zyLRp7rTofhTvV1Y54uyoexPzhq5TlGauzSGunCGgSyi8uwzjaEY0mvKB6pb7
         X94tm2i6rmlBJ+ObW8TsS3Qgvnju0gLJh677L93VEf3Xy+sVhtm320nEop5a7/2+DlE7
         pxb2+ExwUNll6kRvtnLl57ezNUg0J2pORkgBnLm+pabFtRwVfiBqTBMvsnNAmq/JLK5A
         zHUbw/KeVxx8dG6fO7FMOgC0CxZO4/5MKLXpLSsMx+nn7ynBQbs1dJc5GMjHPelvehcC
         SdFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkd6eJO9095BL/MaNmdPQnCqp8ExQ4VTJZ2+1cvQTKVtBxeb4uV2kG7EnMC7xmMyVlEPBTc1PMt1kV9t0=@vger.kernel.org
X-Gm-Message-State: AFuF++mXibe0ztqSqDM4R6yFPwKVscKEc9773cMiY2f5H6BL/4KwHj/D
	srhGy+km0jRt/RjelZzgpYLt/eq7Fc7S9e5S92GP9VUBP8lsR82EdY98/kHwaHoVxFRzkAZd/CP
	te7wsICVD0ySG9pDv9Ti7N7tPUFJtOmj4f4XrPIA+wHod
X-Gm-Gg: AYBFou2MAZTvG3OET1e8kO3rp0wQ/esFgRU7F00np2OJQs5mEY/FMtjtXf7TC5H2yjg
	d3g0XuQ1g27FbPGGh5dMRelw8W3+aM/hsp68Wcrq2auwZaJg8bIIKg8LHinU0QoHi6wD1xg+cBj
	IsAsEqq6QFkjBS7XLfz/xM+09inA+J+UOKGwSLS6+K/bg63GLyIfQwmJYUH8Ycnabl75jlwpUcj
	80Un7S1rRMnMqRYSdB0rojYdbIxtuIpTF8pCQSVB18Uz17D0i7rGEgNeCOttm9fKMJXwTtsZFKF
	dVHefTrPE1N4ud9MmiZCyVpIAlKcYQImUjAhoHbm608UEbjMSaXFOIJOCQ==
X-Received: by 2002:a05:690e:c46:b0:673:938f:684 with SMTP id
 956f58d0204a3-673938f08d6mr168889d50.56.1790251239884; Thu, 24 Sep 2026
 05:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921104058.353748-1-lgs201920130244@gmail.com>
 <20260921110512.GS106095@black.igk.intel.com> <CANUHTR9gA-mKn8Y496Pty4_Fhu3BSSyhXWrmiod1WvuVdQjkag@mail.gmail.com>
 <arJ0pDlXpdlsF0sT@ashevche-desk.local> <20260922123315.GF106095@black.igk.intel.com>
In-Reply-To: <20260922123315.GF106095@black.igk.intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 20:00:29 +0800
X-Gm-Features: AclHuK8ajLz_1mV9OsX5cTlVyofvFYTK8P24xEanxXIUMhPnGnhiLT98a2I6OJ0
Message-ID: <CANUHTR_Su1KxOeB2fJDwzVeyW4WpnWuzTYm=6Yz4z12Pr6GugQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Andy and Mika.

On Tue, 22 Sept 2026 at 20:33, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, Sep 22, 2026 at 03:29:24PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2026 at 03:59:32PM +0800, Guangshuo Li wrote:
> > > On Mon, 21 Sept 2026 at 19:05, Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > On Mon, Sep 21, 2026 at 06:40:58PM +0800, Guangshuo Li wrote:
> >
> > > > I think this could use devm_mfd_add_devices() instead.
> > > >
> > > > > The issue was identified by a static analysis tool I developed and
> > > > > confirmed by manual review.
> >
> > > Do you mean converting both MFD registrations to devm_mfd_add_devices()
> > > and dropping the explicit mfd_remove_devices() from the remove path, like
> > > this?
> >
> > Won't work properly. The rule of thumb, it should be no 'goto' after devm_*() call.
>
> hmm, isn't the unwind done in driver core and has nothing to do with goto?
> Maybe things have changed since I last time looked? ;-)

devm_mfd_add_devices() would remove the children when the parent
device's devres is released after probe returns an error. However, the
current error path tears down the debugfs, LTR, clock, and IDA state
before returning, while intel_lpss_remove() removes the MFD children
before those resources.

Given that ordering, would keeping mfd_add_devices() and adding
mfd_remove_devices() at err_remove_ltr, as in the original patch, be
preferable here?

Thanks,
Guangshuo
