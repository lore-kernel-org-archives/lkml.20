Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E863C1979
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257473; cv=pass; b=osHhmH4R9+0OTXm5mSKbs6Qm2qBuJpo4sDcz8LAU35TCCeIIn6jeQwzB6RBURb5ZH9YP3p9aZPxsixHWyuXOIQHZg/wRLmuZnX+QCyldbsgZxzuU5469xZn8Z2mKs98qN/Y1wxsM1m7an4Uko3OaImlYu3xOQFkRmd7WSPDgTB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257473; c=relaxed/simple;
	bh=w2T8FHdfNF5NvbmlR5/foiz0hmQwj34PxDR30yrTsuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQdxnWbHm2R6cY7FCJE38pqHYMWfRfEPZacs6BKovoKOnIjAbGFISqkZ361gjnhDNEYQbK2emj5eTRg3buRabspQHHrIFd96FkaFJ7+xnRhDtnFEWC94IceOo12vIhpg+aJfpzYbwVgAyLPJSaeM3upvN7va8+WLR5cS+rkgpRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBH9I7To; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBH9I7To"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35943f55c06so1222527eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792257471; cv=none;
        d=google.com; s=arc-20260327;
        b=W/Fo0qL14Rs+24HX35xIf+1QS8W69rk7uLB/68yYDkfPwiHmX6gnyDZoWDbH3/fbtf
         ij3Iwf53xHE4JHkg15L89Pd23XZ+lnUjfgdiUnr8p6VSCrXWnkNtSwsoi+b77UzYcu1Q
         cJargMgchZJQbq/AGeMI0LloOlfqINmOWEEVpIqoV7lb7ydfdOLLKDou7z+1XvHaAD96
         t3yHNcG92iiyeNynq8lkGK1R1jz3rSuEj8hGk2tf5R5jNvHlOdakTTXF6yIed3Zqu6Bf
         +thUS4064sNeTCwT5XrA4dwhyJLV63430QQwBXRaG9tNob6P/RVxiaGu9nlHY1b8orBW
         2RoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2T8FHdfNF5NvbmlR5/foiz0hmQwj34PxDR30yrTsuA=;
        fh=gIoLNNuo1X8AwBMLdri5YxlUBOtDPyGOyNNvKSDAHmQ=;
        b=oyK0PsQw/nVcfuBfin76wkeXx6WiNmctdc/agpbqwiuV6bddnrZZyvWDvSwt/48v3m
         cp/Yf+asXQgznI2NzIm3Fz8sIS82mxCYcUNvxRwR8i4G/UKogMXslSN98AZSGwOLrhXo
         lNFsR34XfnH5jF8fF944iwp7G8Cn5fjWjkj+TStLOLZdpGFlpe6lwjMlfI78UHqbgEoq
         51wiySz3YyA3E1AQuW5x7o5uJsnozwn7jtRtZe+xZ/QLoyw21MFIF63zSMwIanVAHKSX
         eU3iyx4EGXMfdCNE/XMGm1iJ3GpxVnyQc/C/JlBNdOYhoVGk7JfW69elnOhdO5SkS2QY
         b54g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792257471; x=1792862271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w2T8FHdfNF5NvbmlR5/foiz0hmQwj34PxDR30yrTsuA=;
        b=nBH9I7ToBPazLmK4KOED9iC1+yglSlOE55oq0Uulb85R/fos9Gr7XiHZP6y5PqTPBX
         eh71OlUqwhxhZXnJ9Fx2bbyP+kIUT5QRd98+ewhSvPlOtiK8Pw7KYu2LqHQe7E69OJaD
         4SzH2wAJ4kD7jSbR6pCQWeehND/JWH1N6PiYTmhgQZd95ftKmO0Yx9Uu44q6AX7Jo0E0
         MqnwxiVDeXFEDkgZG4tP+XZ/Jz2m/AyVsie76xAtda64h0IOuG0rkwgPolikbsEroU2D
         LFK8fQJqKcsrS/Yk0bDjYDH9VNkWNH1Qdf5LS/Z3tZUOoGU6epxkEkuexeD9SIqz4M8D
         wXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257471; x=1792862271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2T8FHdfNF5NvbmlR5/foiz0hmQwj34PxDR30yrTsuA=;
        b=HgnkjGdOGMTwbNmysHGIw9COfb43L57Txs949uke7MtVnTBU22OFKuA4wq1McRoHoq
         97OhU7aPDs/FWmyJ8rvUMOclVDDLJ/LRU+6pB5NlGjmBQuWGNiF38BtqeJEA9VxpGXp1
         +k4osRGB61WEp024gLNgEBHGMvnoT/rggz9CPGzZthxVHKJuEnWMY8yls8y89T7uSiPF
         BWJR7GCe2Eb+LQ/5JQWx3vFpwN7Rhikzom6hw1VbGmsQC7IvAn+EP6KTrpli1VlyTQZG
         yafL7hXhCpK78pHV6LB69q6TpKCx9TK72h2z2dUVtJWH21fu5XiyhMLrOL66d+EPdRoF
         guow==
X-Forwarded-Encrypted: i=1; AKwUvBz5hUkUjeC5gC9U3BzKy9mD9zGBF7otFlGSKF1u+9rX5NeZhTrph1yXFlREcnIfe/gSBP1k4p5e8+GPAp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGTLjXNbvxb8lEAaGV0QviSCxQdvXdWmljA0p3zlR+qwEdKqKq
	mGe5F7U5KfkaSE7B9yuuM7WZIJSmlQgyPeHm2UkjfbIJlRqrXQgSnepr2sNnFhmCzbXlToZID0r
	1EPx1gPtKJ7+zBgy98Rv5i4+XVXII44g=
X-Gm-Gg: AYBFou2c5OYQhLeJX9Ydf/ncE/NnMJGPTUIi5Ly+s7k29se5CYE7ftN8JvOmNF085MT
	Mr5v5pct/ZbauVMQgZIUIaCfN3wlmMa+Kvepeo6FYgRhLy6MwrZ5JQTnkra5I2osquaB2hlrr6Z
	jPB2xIGIWtSP09+QZaSEKKDC0atoutZqqXCmXY1ZAdFFmXwn7SsLHl3q/6y9pxxY/OVaxk1f2K3
	K92HOewoBJQReQN7AuPxH3+3N3MEdnk6xLJbR1cSdxcenySwFsuY8OBOP78CgKGEBKThu02+gJT
	+yBfCik0AB9LBxi1Pu+j5AiQfydea/QEZISme9PK/8iGxri0BauE3cTRwGdq+N7bg0GO64J6bXN
	Lr59G3caI38Ov
X-Received: by 2002:a05:693c:42d2:b0:34b:3f7d:6105 with SMTP id
 5a478bee46e88-3602e3a6861mr7547000eec.14.1792257471057; Sat, 17 Oct 2026
 10:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013060018.43851-1-clamor95@gmail.com> <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro> <20251021132529.GA4133357-robh@kernel.org>
In-Reply-To: <20251021132529.GA4133357-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 17 Oct 2026 20:17:39 +0300
X-Gm-Features: AclHuK8PuqDaMJH61jp9QkgVw3Jnjuhi4eCGIeZsSWyWbl9ymhpiZkdInIAvvRk
Message-ID: <CAPVz0n3jt04xEwGr1aiDTJ7OonYYgOy3QneteLXgdGruXGMP_A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Luca Ceresoli <luca@lucaceresoli.net>, 
	Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:2=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 16, 2025 at 09:32:24AM +0200, Wolfram Sang wrote:
> > Hi Svyatoslav,
> >
> > > Herve and Luca did not come up with anything meaningful, they provide=
d
> > > just a few rough ideas. It will take an inconsiderate amount of time
> >
> > Well, IIRC they said that your use case can be mapped onto their
> > approach. Which is meaningful in my book.
> >
> > > before there will be any consensus between them and schema
> > > maintainers, and even more time would be requited to settle this into
> > > schemas and implement into drivers. Why should I suffer from this? Wh=
y
> > > should changes I need be halted due to some incomplete 'ideas'? This
> > > driver uses existing i2c mux framework and fits into it just fine.
> >
> > I am sorry to bring you bad news, but you need to suffer because this i=
s
> > how development goes. If I get presented a generic solution (see Herve'=
s
> > mail) and a specific solution (your driver), for this case I as a
> > maintainer will prefer the generic solution. Generic solutions need mor=
e
> > time because there are more things to handle, of course. This is typica=
l
> > for development, I would say, it is not Linux or Free Software specific=
.
> >
> > I appreciate that you tackled your issue and were open to share it with
> > the community. I see the work being done there. However, there are so
> > many things going on independently that I can't really prevent double
> > development from happening despite it having a high priority for me. As
> > soon as I get aware of people working on similar issues, I connect them=
.
> > That's what I did here as well.
> >
> > So, if you want upstream supported I2C hot-plugging, you need to wait
> > for Luca's and Herve's work being accepted. Or provide a superior
> > solution. Or, if you want, join the ride. You already have experience i=
n
> > this field (and hardware plus use case), you would be a very welcome
> > contributor, I would say.
>
> Agreed.
>
> What really slows things down is when there is only 1 user of a new
> binding. Too many times have I accepted one only for the 2nd user to
> show up right after accepting it and wanting something different. So
> now I just require more than 1 user and it is on the submitter(s) to do
> that. After all, it is their itch, not mine.
>
> Rob

Hello there!

Were there any advancements with i2c-bus-extension so that I could
finally configure and make my tablet work? Could anyone point me in
the right direction? Thanks.
