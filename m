Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E203E9C2B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291387; cv=pass; b=pxi5DERAa7yYjz6i0ELxkzX1EUzSqiOZLhFjr09AjiO3z84jPYYfNBk8Cch8cXQZxf2AVc+cDIgdvInddJxx36BRFszqYy4gRetTV1yoRe1QEYs0LOhdB4p9NT6/ky0o50XkM99H6jJPxjtv/z+OsMKatpRfX5d4ft74Ijw4nzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291387; c=relaxed/simple;
	bh=AlKlMcEZvQGx2PeF9qCMp6rHE0hq+vPV3sM/CtLmiyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tyz79wVvVJIaAYxgJg/QP3IjLNWIC0QwOtLbGdk26s/Jie7SszCAmH++33u4wagIiZYJbOZbaotx4z0NwLX909rrcJrcI9wxxRFJWyrmzDpMnAuxLsDOF6/aeyrubD6SQSDpwA1TD3LZga6A6zN9luGml8qFQwDf98WEI3fOpAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=sk/6IpXI; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="sk/6IpXI"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso13045011fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791291384; cv=none;
        d=google.com; s=arc-20260327;
        b=cKiWam25wIViuro16IBZq+9/ZpXlVzuLU/hmjDkbZgUoQy1eVa69DcwwUUA6IoeH0p
         Rt5M36iWr1JKxlP+75r7La2Czry6DhgpmMurQwIQ2UDlniJEoRmXokwJdhXZYJWJwwmK
         qc6+9DEcuxS+sPVToBjnu7rhjH+mtHo4hxE+u9dj3opM3q0FdNRITygWsbC4RAlCHJvK
         ztomVP5jfAYP9bQDRGJgXuDPdQYno/kMjdHmzv3wmADhFwlFaQfJcKAZvTioGAnCbp1/
         MqkYT/TvxTydvGtKEF1a2Jn3TNNBBlyRQ0rGq9YcjMMIe77HtJGBPQhRTUtw49NAy0r5
         aldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AlKlMcEZvQGx2PeF9qCMp6rHE0hq+vPV3sM/CtLmiyA=;
        fh=PbFQaDNmM8IuclUhVNrxLs1drVUMVQLlRPoIw6DahEQ=;
        b=CqYMqyqGf5Mx6uHzj+3J20grwRGRBW6YZ6I14CYizKlVf3O6n6CnqDGs7icnZUI0kv
         9133IZp69lWGjl3+wtrTVybkVBSnTKGupBpTAhCF2nrSTcJYlWUD6GHpTadlWZ9QACiV
         pcm7xMGVc+QCqxEkqKCqCDUIpNVO/I06FvX5ocogH8CzFbUPixiK5GPQDeFpzH9SMlHt
         8+B/BkcHWNkg2HJE/D/DTO1qMzOY0N7en6S7px6TqDsGu3DKRRbVhifQgS0XCw8Yeepa
         2taJZvGbM4P6B5tqtOjubjigqiot6xoI6SAyr1cUKGf61drxk86Yc395RV9tsKlnpiU1
         HcZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1791291384; x=1791896184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AlKlMcEZvQGx2PeF9qCMp6rHE0hq+vPV3sM/CtLmiyA=;
        b=sk/6IpXI46QQjuM+G9a6uGwf5gVm41anPvIQP/rB1vMTU1UgEvjRjkR8pTH8YTkEyX
         f42sLvBvLw30IN/vS/eIHJX9ueBmAYW2PjeKJlFVkviQeWh9X66Yk6HvefzXb2Swvgi2
         ho8EMXfKN1LUgxibAk2KZrQ7KH4F8wZHGiuKTnyTJ/H5/Q3GK3bsNTEe3qJ5KfpqO09t
         7O4giEYGdEurFyaFRCQbTvs+aGiA3+Qke7+PmPb+ZSgqvQvFpwq0IN7NjkXfhA8yzpdP
         u4bxQSN5tuj/BbVqpg2LR5hT1c0/tCMrOrTJG1mXO1+iPmDDAdXN2SFm+2EL9IqKtqrN
         +M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291384; x=1791896184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlKlMcEZvQGx2PeF9qCMp6rHE0hq+vPV3sM/CtLmiyA=;
        b=NwgKbi7NIQi67U2EYE734VGH3fhNLxozzNhpYQz3/4UB8pbibYwViB1hKICUMDYVMc
         yI2YYbNw3j8BVgUkatJQ2ToOew1y8MuGRfhLGwvbgckXEw6B8F0sRbpluFL4mh9jy+xz
         sUy1dUI+lUQ3hZ+e16vNohK1HGNIb4KnNydCNKEzsbmnZv9lFsi0cR4WSRYvm3BzBYq6
         AVoO32zdISp7G5Q2WBruYGi7uqhTZfpiwfRCYvedYyJsWfWiYATq469nRFMAwfnlUcsI
         ansfmboSTINm6iyd6ZjnGyARl3tZC4MvTPrNICyMedyzZGTvd/PkxFo09u8yCU7kg61f
         J6pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrw6GnKyszAOATGwyIq1n0vDCpGVEvnVeDZTnu1Gfts3Mb7v/lbSbkLFl6Er+eQWH/gZoq6Crbyew8l8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi725AkIa/HPCmmdVFcAyxrFvDaBtuWeNTo63uQTQcRYzecTY5
	z7r0x4JS5vL3HKsr8bqI6LfjFJuh1f3PGDECMae2w/WuALDp9twdabLQd2glVUcj1LJZ8L/92f4
	AtgQZuu9qSbPrHHpuTQRLirLVu3aMkzA4kLBAUuehYfw=
X-Gm-Gg: AYBFou3eYCNfEfybodwjKfg+vblViLaJF1mwDi8NqTLQ/BvUhRoeAv2VO32Nl8D76Tb
	tT7VtidYEO46P5SoczMeVkxwCoODQsmBzYBwdLYdiP+duDw01gnUPNQrtdYKkYfpwptCOur4GHu
	UBda7tigBbKBMyaBSwqB8NaC0NCH95AHlAt+FQcdx5j1XKla9Xf+1F0gPTWdGOY8tcwtrIcCO0o
	N/kBgZ3UuGqPFGnx1MPxoXGedx6o6PWxZKo4SFSc64U/flSTmxebu6+LflgaipgUJlPsBcoyLqw
	9SKaYoafv7mzxp5FmWRl+XCQnFo0UPrTjBvqCSWoDIRexcC/XTtbwKOP4Zq8KwA4RsNblWt/wX3
	9SGhE50CmZw==
X-Received: by 2002:a05:651c:b0e:b0:3a7:7560:42d with SMTP id
 38308e7fff4ca-3a99ac22facmr3447461fa.2.1791291384101; Tue, 06 Oct 2026
 05:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790688018.git.zihanx@nebusec.ai> <20261005184156.01eb0ebd@kernel.org>
In-Reply-To: <20261005184156.01eb0ebd@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Tue, 6 Oct 2026 20:56:12 +0800
X-Gm-Features: AclHuK8CF-8Mj_c8FfiAmTqG16QSFj-a07fr-EYY9YJrSyWrswvA_gV_jKau6qU
Message-ID: <CAANe3eQKOPb8mzWmSVwOLTQpxEdQ09tJzHqXFgHwptLMgCuDaQ@mail.gmail.com>
Subject: Re: [PATCH net v13 0/2] llc: fix listener child socket leaks
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, kees@kernel.org, ernestas.k@iconn-networks.com, 
	leitao@debian.org, tim.bird@sony.com, shuangpeng.kernel@gmail.com, 
	luoxuanqiang@kylinos.cn, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 9:41=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 30 Sep 2026 13:29:40 +0000 Zihan Xi wrote:
> > We found and validated an issue in net/llc/llc_conn.c and net/llc/af_ll=
c.c.
>
> We found it easier to delete this code.
> Please look at the net-next tree, and resend the fixes there
> if the bugs still exist.

Thanks for the guidance.

I checked the current net-next tree. Commit 003f21868b2b ("llc: move
the type 2 sockets out of tree") removes the in-tree PF_LLC socket
implementation and LLC type 2 connection state machine. In particular,
net/llc/llc_conn.c and net/llc/af_llc.c are no longer present, so
there is no corresponding child-socket allocation path for this series
to fix in net-next.

I'll drop this series.

Thanks,
Zihan
