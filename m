Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D374D4889
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158806; cv=pass; b=KuEqN2YjEFbovJNCp++rOGxb5ipwP1K8A1S9WaW0aIHm3kMColy4dQkqViGebLttstm09OsWUwSB5+dJG5LBCFe0wYEh4lRF+97bZQwXA6WnagXfqB0pSEhxCMTFHv3lhYCDopaey388/pxXgUmKh+IdaQ8XzePHuGAPKaRzKnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158806; c=relaxed/simple;
	bh=cFvCifBg1Erj7yodq2VFcaiWk0MntVdZBsFvLjc5PDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jf/YLV2tLpADvOOgqMk1hEpVYIp/s7DDjC50iQtGOpvFJ/KQwpm4E10l1Og9NuzZnJRVC5uHJMwL1QJk5RqyMXU84UDhlL7ebJphen2LysJ8Ym+THZUWYVqQpbbKJSUFb2Vsw3qSpmGAitqt1+H59mM0hYUsy2OIVxZCs2/C4M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrkPKG3T; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrkPKG3T"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e9aff12fso58843066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792158803; cv=none;
        d=google.com; s=arc-20260327;
        b=ddJbTCkHUsoILfeRdzIlN2kMumyuqXdcI9KPUmyKHEPd3jRiCu9NJ+00utxWHfHCtl
         GadzDsTwqcihaeXTpN+O5Mcm/cNq57RmOXYiLHuLtapAWueIEQriopRsG0+S09mr023G
         wnVCNXgiXqzxPaN9+RFn7whdsCZ1fOV7qmq2Ia7FNqoVSK4UC71kiKdczbIdaPzQ8mva
         mAvSKT08eTEEtgbMPf8EIePvqrl0OGjmb78RTJLzJ6Our5H+vBx1M2XN6Iey3wEWzwJH
         w37KBc5En3PR0gEQS0uVQgkqcMFYCZrU32/q7GFx5MUU9pYPfHfOpNJu5rSVIOxTulWt
         jhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cFvCifBg1Erj7yodq2VFcaiWk0MntVdZBsFvLjc5PDc=;
        fh=8ycVEOlon9AJPHBQThteo4utAdiHV+t2uSHxp86aRK0=;
        b=DDjfof0UpD4+P2dcPBYbcubLEJd8wTLc4OM54ZgbznvmsYB46hO3H4twO62bkKMHm+
         FKX0odIEPds6vbbamJBWPxDsVq41WPfKNYsIfLX/KyiBfi1Dpy7FGnQdTU5ipVQhm5cW
         l8Rt5yxpcblYrC0Bf+iKuokKZCWkZZcuS2xqCVgPgafT9Tw5mS5AQaAtteaB2iugWJER
         61LNq31+yVbCZKD/F8z9OqnmfZvx88RDiil6elfpoNx+7lkjyARQ/wNZhbuLtBmY97Zy
         38fhOY2NWi1f3LA0nFhtVWzlWuG+Dmd0pnU+Wkhrb3V8zRJaVWqZ7p5TSR47W6W6JIxV
         pygA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158803; x=1792763603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFvCifBg1Erj7yodq2VFcaiWk0MntVdZBsFvLjc5PDc=;
        b=UrkPKG3TQqFSqYcoBcmKc/Ou03DNJXJAbsOtE0PveJeD9h6ORhmph1PUQOAhPa4My1
         y9isF1oCV6zbjbSxteywL3yvSxO96cO0He3iGJpUx78oY3L0wzOfGe+Oi5Djzf7ww5G8
         7YEnCPTkylMB1Z1A83rpN7v5en/3m2E89NQXK5gUlDrHGeJeMGwsm2S9CUkUxuRgohTy
         90hhlMlXGnHtmxd61xwJM6Lhf++J4icKeaADsn4LJxgku0nK6AlvWF3XkYiXVrOi+RJC
         WC9f7A9zFPeP7ocSTEFsL3EzVYCrjO/yuL0xOEbqE8xTNBDmuo7kHWbz96uOEdt/OaB4
         Kgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158803; x=1792763603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cFvCifBg1Erj7yodq2VFcaiWk0MntVdZBsFvLjc5PDc=;
        b=Cv8sjenAZ1I40xc9BeVn+hucjcXPbkjvPZdPCJnmT0E4CR2g5JxjraEZGu2uZafDOO
         3e4iViKcDsea0aNdR7LXMlwmJYsTA7mcwgwcFgqy1TNKWMfjQHjE0hr7so0zm1gBFdfC
         gUiQO0x8dmPFTxBPd0rnfKJSaF0KZmP71wWMuHZl0gM7Do35QcudIqwxbk+zHpIgsgEe
         PJi3R3gEEckU52TfC/vsJ0R64V5vBm4IPLLm51lJ+KksXWFXBwyAFB+eVVPgxSXTHfjS
         QtRZEFT89vFw1k0+SvRKnSrHTbkDwKNhZywo3c3frbnK/QJiV5YH9LgB0kWsfXeH5pXP
         4oGA==
X-Forwarded-Encrypted: i=1; AKwUvBxG/DymAJiJdMCnvlSgXMcaLOclvOKYeTrulWvxXR1TKu9OKj8539F08C06Z8XFgpbLzY+PyoQoPWLxSik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj1NoRqKoXDy1XgFihkbpKDE9K8SbvCLYgljV9KkTodWbRAqO8
	IAWOwrr77yv8RhZHHxT5970/Wo3IjTH3sDj87mE75Np2QrSPR8OHehRDHk+NbHaPLNzQm2mdsF+
	C9by/TOfvziCjDSRxPs6iy0f/1WsC150=
X-Gm-Gg: AYBFou3Bm1iZKDXXQy7tbsAJLr7ahy4EF9ko3VSJqzU4FOnGburCQ3MnbqiGh+65QYk
	aZW1f2esj00RX+2TuB5nR2pI2ZuVYe1FHetHZoAivZpu9u3oBY9OZp/WhL2MVk5jYDSnwEePwMc
	fkaDB2BPWguA9GWhOBBlxGwNHXYmv3N26N1pQYPJgOKuPa/N8ZELWQicWUvFkAnd2LpdTWEemjx
	UH7qbU7kBrtQcrxtUDu+Ra23W6nc+9j88OOqlo/citQVwROBorodogs12HtSZhQm5ycCDEnwRob
	AyxmsUhq720rY922TtiVqqXJJNFtH3TmLzjWd/bmB80TxfxkPVDqfaQf2+0=
X-Received: by 2002:a17:907:3f0b:b0:c29:c079:676d with SMTP id
 a640c23a62f3a-c31a9a2d869mr2007763866b.3.1792158802842; Fri, 16 Oct 2026
 06:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com> <8a7eb315-b8af-45b8-a0a0-52814a5341de@yahoo.com>
In-Reply-To: <8a7eb315-b8af-45b8-a0a0-52814a5341de@yahoo.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 16 Oct 2026 10:53:07 -0300
X-Gm-Features: AclHuK_zgmTCWwlrEtDavnlWwYCxIc6oJyBMHV4DNMVoRBrUuHmo5hygFtbQTgE
Message-ID: <CAJq09z6it-Vz3cF+sJgAP1X3tcr_L3ir=iqoSduiw9XaB5FyPg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/9] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Add enum rtl8365mb_family and a family member to struct
> rtl8365mb_chip_info, together with rtl8365mb_get_family() declared in a
> new rtl8365mb.h so that the VLAN code can use it too. Tag all existing
> chips as RTL8365MB_FAMILY_C.
>
> RTL8365MB_FAMILY_D is defined here but no chip uses it yet; it is needed
> by the following patches, which add family D handling for chips whose
> register layout differs from the existing ones.
>
> No functional change.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
