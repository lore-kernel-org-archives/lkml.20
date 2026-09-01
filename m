Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF98238C2A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270356; cv=pass; b=QMJygAThC17jLPdKXVHI4WPFmtasJSpF0In2lHtPsxEuuzWnWVIH29rBj2+vaaN9liEM5/84mEkkthKX+mvgXkGiFaL9df0bte3rFTG9tYkpcWSE6z+4fTVHFukj+wQENkIXVa1pFMp4LalzqPYw4fp8Z3P1JeFuj9SjQ+q7kOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270356; c=relaxed/simple;
	bh=tKDbMMYPaNcmLVO2tAPonX0ljJNkNnM7cJ7pRD/D8BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QORZqVuvYFloxqwFSm5UdTTEQ2wSrobpfk4hPiZNeOciPuzrJ4T1OAxNkYuqdNOJSrAKtUxwRrl4RheHwWmdLQ1TGx02s5zYoicpI/QuiBSlDXfZUrK+i+/RidNX9Vuyl90qfHJ/lVNwfbIToG/hgAGH03d8xM2HwSfw/84X6FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p19Ux4+A; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p19Ux4+A"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8568e3ed034so775639b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788270354; cv=none;
        d=google.com; s=arc-20260327;
        b=UMWOtnzVgSXPokPEbri2/eUOHpW5cgRPxJVyY8l0CEM8fe5LyuoAYzaePBEbPwGhaJ
         PKNrxGfpUWc45Eut4Dp9NIDdrIYqYSHY/VVP1SPUv5iNLZaCgSVz7v2iU5wN/Zl7yce2
         41Taggj0FXs+myceGpLut6aYYS/tFSZGpZ4A2ee57EaczKnQaG+ia19zcVb/8uXBysq8
         fLDWDLp7Wc6uy97QYELcV8fTLmtMAngYKkMZvwcggnqmU/Fr4Mayfz/6dSFhhmVfoxsx
         /aw5ohXV0U7RRJrGpKLZY9Cuj943+Zwo7l2yZkw6XNXc1NzP0Qqg0IO0TyynMjExDeDJ
         O5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2cbbAFC+L3aZiwOHrWcyMK0kiQRKZziM6pyyIH5XpR8=;
        fh=/H5wXsPStqhQf/MgB8ohLHDT16ZiMY/Tl9vqbs1Sokw=;
        b=KV4bsaO4pZNWxV2xaR1ItE+ntOu775ZsrKLZPKRTeWmOGeU3ez0Iu4UQ84ViN10Tmo
         pOL7igpQ6yLHJ/WbXyJBAppQI3uUxILHbpobm51YfptWDG3AUJ4aX/mg06+04P6fLx0b
         oYSRR6OYSCXeEf70QKp/tY+8i2BhzMSPt9xikI8kNfcYXiYBmr6HXS+nOnN/NsRRJy38
         80ln8NWrlxxBHvQ60CEhgSLEs9gjvJpBNAq+8xQK1u3PSAolhvjxAxS9MCf0Togu5GDS
         rnEUg7r2gGEQBpoN0ecQMqQ6EOP0t7Py8/YlfWINmviLB9eyoHEqChW1HJx8Qb4BQA7c
         rRWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270354; x=1788875154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2cbbAFC+L3aZiwOHrWcyMK0kiQRKZziM6pyyIH5XpR8=;
        b=p19Ux4+AIz9zm+mK6ME3VWxsjulezrSOBl/G4hum6mIVNhfP1QBGtJLbO5WfDxlcCi
         OsWginCRDOkTt/Zpbw9B/QZzi5voytUVrzcv5Dwn0S0n1/AsOOYt5KinpdBDdcfPpfsV
         m2JVD0X3d0vhkbC4TwoRE3GRw9tnzbpBFDz9KueWtW+eE3TpAnDmsDO6uPMgs/cYv5mC
         2yatkeUmGi3pb8USsL1UtayNvzAuxc9+EDxi8ez+viuG/U5vDaF/COzlRbSH5B8agOKh
         9DR78R1vya7RMStOugohc/sf/RB/qN9zqZGQtPs6p2hs5l0skc7MMkbrnS4uq1KwWtI/
         TDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270354; x=1788875154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cbbAFC+L3aZiwOHrWcyMK0kiQRKZziM6pyyIH5XpR8=;
        b=r593JSCBAkHSe6aMNuj86iSSuhaMyQ5axiWwwQAXVx6ePtQg3bfkbHFpHklwH0WaEV
         RTvB9X8SO5XBS3GPFMFDg67z63913q0WGDpdPF6GR66z+l7WVBgpr+oltT4eCz8egXFY
         k3sa6FqDP0CCqTgxQT1rR1mxKiL4hduBW89IhriSAX3kItOe0eCWGHrKanhgoqGG9nll
         FPgHBawyApD6+EdYFNnTSU2MwJ/xKvp52dPhYdE2X2Jmo6Nth3bHia/Q5unR2fHGkiR1
         JmBNcHEILwTFBhchiUM9d855l4Inx5gp0g6Zl79c47pSzCu2XUu+Mv8arL29bdl23LOw
         jveA==
X-Forwarded-Encrypted: i=1; AHgh+RrwW0yD3IBHcwKHTIsTxESJiEsFGcgHLgDP/Iebk8GsqdVKLVjWEdChBv1LcLMVU2pEj/LqV5r5XBYmh9s=@vger.kernel.org
X-Gm-Message-State: AFuF++lm9hXylXPXApvZs7mE4rhWq3vvVmwEzLx92eRveSdaes5ZSsME
	64XB/BswX0LFcfQbZwVic1Ybf/HH4ifv5Oq69LhnovctiKx+ESjLu55foGHq37VypqDfFBf3SwU
	h/Gy6kFJFM9Ay4PboX/KB1FjwKRo4YrI=
X-Gm-Gg: AR+sD12c0e/gVoFrUGJVIRyhUZdAK7YgFNevV+FPLrF/3xZlMdOgf/ulnX4vL4VUKDI
	T1x1nYGYWQ65TvI2ihKUZ0zZQC7iEpw2L4A7HXMpSDTY65eZDSGzykhu0gOZwImKnpJBIIVU/T+
	4BLKcfoKvGyVlguo3JDhNm0M5rtMWbXAvn5EOT06ymTJQSj8D3EFbrCyMVvzja18gVZwCIrloMf
	G5bNmpiW6f0LMRKi/pktQNoYRllX/rTAcmUT/luAEULOASVHK5b9Y21wwcJD7U+I+N58H0Th2a7
	DDCtwEL1EG5fnP4agyR3Iruges3bHz257YmN+34faOgVMXSizRBmd8zuhwKEFdqNqq8qxj+W6b1
	NdIMCqWS1ojpKHFSgmNfr5iHRiengjVDYKU1iqnFBqy0X
X-Received: by 2002:a05:6a00:f94:b0:857:7317:cff4 with SMTP id
 d2e1a72fcca58-8577317d1bcmr39805907b3a.21.1788270354048; Tue, 01 Sep 2026
 06:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a7d8773.c5ad36c8.12f49d.002e.GAE@google.com> <68cb4941-3668-44f1-a889-6b2f023b2a08@h-partners.com>
In-Reply-To: <68cb4941-3668-44f1-a889-6b2f023b2a08@h-partners.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 1 Sep 2026 09:45:42 -0400
X-Gm-Features: AcwNN1WwADgnUO1qZ-igRAeF08FDzlcxT49ayOLVDUIzmVUCK8ZfNwVQ9ZdAm-c
Message-ID: <CADvbK_eY4S1HbdNHuNq9b=Va-TA_6rNFvnCvtOUZ0sF-AWN67A@mail.gmail.com>
Subject: Re: [syzbot] [sctp?] WARNING: refcount bug in sctp_transport_put (6)
To: xietangxin <xietangxin@h-partners.com>
Cc: syzbot+80dfcb1a2235b3efc877@syzkaller.appspotmail.com, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, marcelo.leitner@gmail.com, 
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, gaoxingwang <gaoxingwang1@huawei.com>, 
	huyizhen2@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:47=E2=80=AFPM xietangxin <xietangxin@h-partners.=
com> wrote:
>
> Hi,
>
> I have analyzed this issue and successfully reproduced locally.
> The race occurs between the timer callback (`sctp_generate_heartbeat_even=
t`) and
> the transport cleanup path (`sctp_transport_free`):
>
> Task 1(Timer Softirq)               Task 2(sctp_transport_free)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D              =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> sctp_generate_heartbeat_event()
>   refcnt =3D 2
>
>   bh_lock_sock(sk)
>   sock_owned_by_user(sk)
>   mod_timer(&hb_timer) -> returns 0
>                                           sctp_transport_free()
>                                             transport->dead =3D 1
>                                             del_timer(&hb_timer) -> retur=
ns 1!
>                                               sctp_transport_put() (2 -> =
1)
>                                             sctp_transport_put() (1 -> 0)
>                                               sctp_transport_destroy()
>
>   sctp_transport_hold()
>     -> refcnt is 0, increment fails

This should not be 0, as the transport must hold a refcnt to start the
hb_timer.

Also, the delay below is under bh_lock_sock(), so it should not be the
real cause of the issue.

Could you share the PoC for this issue?

Thanks.

>   out_unlock:
>     sctp_transport_put() (0 -> -1)
>     -> refcount underflow warning!
>
>
>
> Adding a small delay  after `mod_timer()` increases the reproduction rate=
:
>
> --- a/net/sctp/sm_sideeffect.c
> +++ b/net/sctp/sm_sideeffect.c
> @@ -373,8 +373,10 @@ void sctp_generate_heartbeat_event(struct timer_list=
 *t)
>                 pr_debug("%s: sock is busy\n", __func__);
>
>                 /* Try again later.  */
> -               if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20)))
> +               if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20))) =
{
> +                       mdelay(1);
>                         sctp_transport_hold(transport);
> +               }
>                 goto out_unlock;
>         }
>
> Any feedback or guidance would be greatly appreciated.
>
> --
> Best regards,
> Tangxin Xie
>
