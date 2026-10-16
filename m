Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042454706C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158639; cv=pass; b=LjV+Ia4fKtocqeuy2p8DT6qlOrtK/VUP7O0TYjfpjCzu/gNE57LGSHMZWfy2TtcloCqux+TvsBDEVbM0oiQwZRpLUN/ETUNx9uTiWueeJqHy3slkhbLnC3kMc+LXnxjNduugrcyT/ZBzbj/bYeAAhvaz3f2Pj+vbQ9tVNzGtSLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158639; c=relaxed/simple;
	bh=EnWk4CEIPOVMQws6KYFkC+XMwt0JNb6o6tfr4D+75nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6XEKQX3PfPxgqL/H/ABG6Q7n8bF49XeUUAE/q5E4hirax8/ValYDVepMTqWUHKvDvKL+vbLtc1qn/UKsZZQd4yEVyKRxgy9zD883RB0Erb2/IY/aprDMvNNTEgifG7mX8eRBDO9c1w9eh0eTl/pjdHHRSTFrGZ9lFrhaBfRbuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rz2f/tQ2; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rz2f/tQ2"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so7580676a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792158636; cv=none;
        d=google.com; s=arc-20260327;
        b=GHBDODdcARVIM1HcgswY6TKJSNWhcKWwvklzWO9YEC0vk4PjzuXzimEMCBkeSOcuVG
         2sezRE20BLXdNaRc1q+9IOPV9njT/afz6mt7PDEYhc4H/jUMEJY/tEHKiq1/WEahacuR
         rJeADgafKjCxNHMsVxeXBQFKVp1Wv0lMADPVN7XPV8CeCK42GecSEKheNt1hZlRsajvq
         xjg1aY6buSBxDA72/rFDLSv1QFu1Bins0rSyHV+tKEuR5bBXejvDh1aucTZIJRJI6kB2
         daA6FRTyPfgdBrd7/+8qZil8aGCiUNHKKKkwWsBnOTEKnmdfFNNJUOv/cqyaIPE4loEg
         QRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EnWk4CEIPOVMQws6KYFkC+XMwt0JNb6o6tfr4D+75nE=;
        fh=plq12o1sjPCvBecOhC3ZwMV/vuf31HQLV6HAq5XMpRQ=;
        b=iDNp6XqLmCRNDRTINlGNsHn9FhxgC8MQPxWuddRcYdF8FI1xn6qh2X0wnKntJz+SJQ
         FSHpiV+K2gG5sJOoGd+yHs+4fedjheg8ROcVN6eM0r+dIatzBkzxqQza32Bi77uPfwVT
         1bXg3o0TLqofY/WVIWpk1VACaMtbNtjk4flmNTfFS+kiBbSgi063VppFqVhM8hbKOyT4
         I7MQ6DilHfv+38qT/skBgOcq6DgcYWJAnv1OesAR7QpCFVmGvn/bXk0csUuDDz9Z4Z8N
         uEk+XDPzBXiUme8DctxB1HA0Z6/0zRmkeU7qRegsTBywE22gGOzGbLTqP2B/nMbt2IAG
         UxKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158636; x=1792763436; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnWk4CEIPOVMQws6KYFkC+XMwt0JNb6o6tfr4D+75nE=;
        b=Rz2f/tQ2LrrHWac2uBvYj7XkeqcoYZU0vGR52CgGv3ycT4i72oYVlWGYOYRTHIb0p/
         RZbYoKJ2mxBo4aadEsbye6uVZcFA55vBrexwXrCwXSaM4iqDQRklN6+Sgj8Td28OVEOK
         MwgXZMHh9l9Yze4q592nZQsDHM9nXutF+QryqylpNLCHDc5iPhPoKbgMgpZVeGkL12E+
         sAlhK5amom0xeFioXN1QiphUp8HNkeQnLZo7Hx5Vm1hoyDd353+BtAG0BlU4hOxbZRzq
         73yRTd4+MqgItrmuVc+l3StGNsV7kl85LF1W8RwIQQajRYaxeJONd/pdNPZ4jRD7NWoX
         MllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158636; x=1792763436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EnWk4CEIPOVMQws6KYFkC+XMwt0JNb6o6tfr4D+75nE=;
        b=DMl4ZkHomg7s9sPO9BKGns5lCRB1VIezHxIdkSt13sYBSTcTJ6v3K3usTrA02xQmAn
         Yhi39h4WyE0YQKmzwRFdCg6Ax55gTmMrFNXg+ajL20gOJhlJn2B/Ivm/ATgbSLZIemOk
         t14iclkXqzsiD7KuKFT0H+nYCcQANYrCj0JZZ8+q47mrGQmPLPJOq9Pp4A3q62sbT1yX
         goJr/7uffhW0AM5SS8TTlZNKsxNOSu2w5bFV0AaPRXuzoHxf4oBcAjrNUpohI0mEq14r
         PuSkyp/XexuDpdwToKq5JiX8rliUJiAaLOY7DpuQcf1eTACpIZkuproHognPfXW3QlRb
         Ryvw==
X-Forwarded-Encrypted: i=1; AKwUvBx+rws/5jfD93FXvkzwj1cwHHUuyiiTfJDJuk1/wqjQLO9qv+JQuDd89Z8Ii2nVJIC6Vy1T6R62+sPxqz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ7+Zfths9bJK8yJrN0/18QK3D35JXhRoa4hFYBbzNWCJLgyQf
	FpxzoQ28XVjigSrqm50Br+9gv77R8Ile2I+mGAWocSJujaFkQvp+wukOzk+/v8KOEzd6QHTPM3m
	ZeSnpgcpJsCKVYn7YfJSgeZoDpQAR9Fo=
X-Gm-Gg: AYBFou31n4gM+6RHdZIKbXpzH8p1l95qMl9lET4PbmFzdS93YMkpU1I+AGf5ZcwY2bl
	wdlbw36MyvISv2HV7moQ+VgL4pqnPZOeB2je0kC2fV7gB1UX0vjqw55O6zpgwNsaR/Ic2rDRrO1
	uE7RWj3JmK2HRg73D9oqmsIllVNnT5mLdLJvwmcRI9id2YMWGJl5byD0CQjDrx/0+TlSuxNzbY5
	/QHVRHnAf9BSl932M1JQnOQam0PHc4rf/thGc/9NksDvIQmKNBT3fiwm9nT3G+8jltRDO6bB2b6
	vK3mT5kBgehjW5p/Xmyr1zA/Zpb+z06PTwUxnJ5JjlCPvaFUR1bouYHDSQ==
X-Received: by 2002:a17:907:960e:b0:c41:30be:4f84 with SMTP id
 a640c23a62f3a-c4130cd9cecmr98912066b.9.1792158636247; Fri, 16 Oct 2026
 06:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com> <7bc13c51-6e93-4dd8-bf4d-b65d87fb36e1@yahoo.com>
In-Reply-To: <7bc13c51-6e93-4dd8-bf4d-b65d87fb36e1@yahoo.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 16 Oct 2026 10:50:21 -0300
X-Gm-Features: AclHuK9gnSAfyz4LIToQnUxhKHIgo22W-MecVImvzd-daSoaPswgwHlQNEh0rNY
Message-ID: <CAJq09z7zJiSpVApcqsp9B=Kx6TcaBoom11jn4GY2fnPyjM7P4g@mail.gmail.com>
Subject: Re: [PATCH net-next v6 1/9] dt-bindings: net: dsa: realtek: add RTL8367S-VB
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The RTL8367S-VB (chip ID 0x6642) is supported by the rtl8365mb driver
> with the changes that follow in this series. It is identified by its
> chip ID register, so it does not need a compatible string of its own.
> List it under realtek,rtl8365mb.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
