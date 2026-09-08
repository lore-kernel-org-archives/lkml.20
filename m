Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CB51A739
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863981; cv=pass; b=jXpnqP8pojxDiP3x+CoN0ErcsvNJ/g3aGFOUjz3CZz5/ULCi7VmDBL27aXQ8s/9INnGH74rngTqtJ/wKJmim06m3Bwgp5bF0oqH1XbCVssf3BZrqRZhampfJieHnChv13UQefn5dxQecE4aYMtW5iIQ3HGbjkGhkbZ3ER8Z1JTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863981; c=relaxed/simple;
	bh=tt+pGvMYz1FVN4+bRmcox4/aVEQq4bCQPvkvBGNFnW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRmVYiCJe+Ghm/a/kOE0D/JOzi9jcL5oPQdMqBwRND+3IGNofOKoBvNNYGMq3P4MheVxZPEeqF4H53UJ79ZKfUc68nTHhyKtN06OVnmFjlgE5+h8y7RRuAio9Ed3Ze/flNzxLgyl+0MpMJKpo1SfZRc2bEB/pEZ6+KVgvrh+SqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaeuMiFe; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaeuMiFe"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84864086bfeso3888750b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788863979; cv=none;
        d=google.com; s=arc-20260327;
        b=KSMXjksVDqZbOvQOhF2GORkG2vNtlR2G+yNy1EveRO3/EaTRAaD/RtTMBrNnwgmSRg
         7MZza/Lk4ilGhmPKfoJWj4jtbgi20hsXv8NElVYVsyi0OOzBmjGyVvZ748A4u9ql76yY
         TgTieEWai6yjwG6+yKiVnUWWrhD5w3byuNBqUwMbkWrjeAoQ1PL+V/ZMxTH/yhxJqJ50
         XCw3Xjae1VJ0sbnfWkWEyQyoBK0y5r09pZOcAtQ+8vhDflusbH44/d5DQM4CJr8Ewrzz
         4j8qA4aU/yQHGoG5P/ks8G0tpCdLSPJvi/8rUotXZQoPhZnhmEwEshCVwGwX6HpCEw2g
         sKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jl3T9yA5icn0kDud2YKhOUFI5zpsByTY26KMtyiXHpU=;
        fh=JPYGUeNmeYjwaJqbLGJRBxM4gJYCCzSNK2Ogo+x4jvI=;
        b=JIqK9ANRyml7GE9JLsiA05bgtWx7Mijc7fEJT4JDVb+enL+UnpImLCtX1HUN2542Cj
         uJXWAD0q69GPid/2EhJwK+Wr2yT8gzxlaf2qzxZHNzAr+5iXJnZAri08nWt0b4GfaWQJ
         XEiiUr4wlrl3xHorKZD6BNFd9HHoR0FfXTtHRCG+vOfUWwZvg4DLXm3lJjFmiXcOVaGa
         jvA6YnwO26TEQmIfuA2Ynq2AVZinWLIFiDFhVy+JxYu93dq1m3WT72QiQtCZgSiSO3ek
         rI8YgnxYAQZOfAfZs6D4Vo6Wpb8f3X198VCDULPA8XU+d4CzF01dKWkAHibHodvCTDl6
         25HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863979; x=1789468779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jl3T9yA5icn0kDud2YKhOUFI5zpsByTY26KMtyiXHpU=;
        b=qaeuMiFeZ6gorAS/l9kOotuRrGXyP1K30N0J9ziMvCVKvHiYBt5am2ORgPTzOFC7UD
         nGXcdkQkfobSIhW0z9zy42lDFW240VrasF71CW+rkMKJ+bsQkkFOXF0SzwTwC3CAdov1
         PAbh3QzvMQ/fdzoTVxLdSrSPU5EnYb58drW/eonBT/fS6ctvdG6qHho03fl1xRhQRwRf
         Qji4NrdVhuJOpPA9L8gxxlsmfn5WksC5thP+3vdtPih9Xs8hMANlmDIdVCaqbKAM0iWW
         2G0em4gDehh+wi6IgTsT55egea4iVrOXU+Stcs8WHz05vM5S160AadyW0bqAyMf3J1gl
         /8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863979; x=1789468779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jl3T9yA5icn0kDud2YKhOUFI5zpsByTY26KMtyiXHpU=;
        b=AiNUO5ZBiYbUdQCYH9QPmDy/4/PSQFyVYs1j7rEQQq6GSDxKRDLkhaBtOQ2IlCTz0v
         NxfQHL1foqes6FPj2PvgE4/Aa/Vqxo98qHfW0lloNXOQ3k1hYePQz4Sj93O65JIr56OO
         drGWalVHpuklOEtqUVYc5gAom3NfFek97ohKUWKiHTvCQT/jpJRGvZfsQ25K+xBshP6I
         VXs91p0kjnONrVZXXiwJplB2rrB085SwQIPeI153SW7CTIQtXgKYa8Qr+LGLIQj7K1OX
         wDA6eIjawxZvy2AuXE+53jYQBhgW9qQe6Lq4J0VeWIIIa6x1y2dJGh6AgwShTnWN+2No
         9TAA==
X-Forwarded-Encrypted: i=1; AKwUvBy7/zWQw8YBqteWsbx23U5KXcGGqUkvvXT9AQt6MZXPjOpT9rydHisJfUPF3CYZbkYQRMxiX/M+yzWxVz8=@vger.kernel.org
X-Gm-Message-State: AFuF++kFVTh2sTnluR7+kzD6OdNgpp87SqjkPyRkbwjHEM3/OS2qhI4X
	M9cpEEaU8OWaMnAcCzqqdW55frM55SKFaUm2YLxNBODXMvf//ziO7pC9O9ZbA6zov3CXXiC0Yku
	eq/SWHtMf4TLDnrdxAHKlsJyuK408kyo=
X-Gm-Gg: AYBFou3be+w1hEfW1EZCFbv+DnUuEqNN9gLqjntfWz8NZatk6nh/+AP2WYZ/VE6wpd2
	y+ZHL/dKtzaXI8lr33S3Z4/mZScuEV9QDyyc+YMPGErU1uu9nSvh2VsXr++tz5FhRwd9rgRPeQe
	AkEMRL9V/qDqF7AN4+CZ34FMQkQfj9B1xKKEOiesh/LtiIxSyAMcQEljP7q+crHlnGMBQ9BVJS5
	mpFvzilBBV88E0eRB97otBb8svdj7Rf8rSiuOUKeZWrXpa8gzzcUwuFAcrFJlCHEVgQCFeIAqQN
	b7YnkBnkTAj9v2yc+qigdcAszifySEpa5s43SCDHKvaUMUk04OfJEuH9T41sbnfXWyIgK4OWdX2
	h/Q/ypXmVPXmkkV4aIvYAwiOWWQxndWVrpSVtialj05Vdi6Bv3ZIghdBK
X-Received: by 2002:a05:6a00:c1c6:10b0:847:8449:2ba6 with SMTP id
 d2e1a72fcca58-866b2eace9bmr6165210b3a.8.1788863978907; Tue, 08 Sep 2026
 03:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc>
 <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc> <CAABR9nG49YgFejWRAkJrCcXF8p03A=HwWhbetmoHSjk_L3h9Gg@mail.gmail.com>
In-Reply-To: <CAABR9nG49YgFejWRAkJrCcXF8p03A=HwWhbetmoHSjk_L3h9Gg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 17:39:27 +0700
X-Gm-Features: AcwNN1UgTF6tGEUV4riCUxY5ZHDu-I4a8KfbZKcCu4UtgQm8VpsUF5cE-CTt_a8
Message-ID: <CAABR9nFg-V9XoNTt=dKCeAmXLECrZT0hPdxwEB4ONKV3kB1BHA@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Troy Kisky <troy.kisky@boundarydevices.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Simon Horman <horms@kernel.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I got this wrong.
Please disregard my previous comment.

On Tue, Sep 8, 2026 at 5:13=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com>=
 wrote:
>
> > @@ -861,6 +865,12 @@ void fec_ptp_stop(struct platform_device *pdev)
> >
> >         cancel_delayed_work_sync(&fep->time_keep);
> >         hrtimer_cancel(&fep->perout_timer);
> > +
> > +       if (fep->pps_irq >=3D 0) {
> > +               devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
> > +               fep->pps_irq =3D -1;
> > +       }
> > +
>
> I noticed that fec_ptp_stop(pdev) is called only from the failed_init
> error path in fec_probe():
>
> failed_init:
> fec_ptp_stop(pdev);
> failed_reset:
> ...
> failed_ioremap:
> free_netdev(ndev);
>
> There are several other error paths below failed_init that eventually
> reach free_netdev(ndev) without calling fec_ptp_stop().
>
> Since fec_ptp_stop() is currently responsible for calling
> devm_free_irq(&pdev->dev, fep->pps_irq, ndev),
> could this result in a use-after-free if the PPS IRQ has already been
> registered and one of these lower error paths is taken?
>
> Would it make more sense to handle the PPS IRQ cleanup separately on
> these error paths, or,
> use a devm-based approach so that the IRQ lifetime is managed automatical=
ly?
