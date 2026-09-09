Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08B53446B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967342; cv=none; b=f5Xd9Ao8EK/iCgNfbG5UoYEIhsfUYdmn8yfki9+1QP//7idziuiOUDYhoRSxXNWJBtCulL2rn0tH96R6JTHEdHYlSe3IpwrUTb34XrccppxaohXoP+N5lyHdu00KqzNpgy1NzAuLlZp/mKM5Mw16a/TE/gzL7wqg9n9FOUz4cx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967342; c=relaxed/simple;
	bh=JkYg2JhCpEtdX7qwSdwLwF/pqEf7ipMDvkeyNYPYWiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhzT17aSNWAdvJDfhnmaamcjWnHH6ppcL5cQuF32DOR1g3pnXOsFU0xC7VGDigYS9oYS47tQLyWGGH6KisKVipkWT7kKmVOXx1bIUkHBF2QcI2BJcqfJpuiEb8fnb/SBJlQbOJvrRXIWM2j+ZYjiGxxggBRW7Z2Lhh/NB1rZBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c83364233eso261994e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967340; x=1789572140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OvH1LN5nROju0SUpXayMHEhowOFfOFw00A7tsFfYyCc=;
        b=c6TyassAHhnSWiS6nv7lznEBMg74Tvpcjsa1MO+wLetBzxoumZ3azZyVvWkjmT0sn3
         zDuGlaFDjjHXlPt++H44ZBJxHYq9UGCbF7/jmFHOYdk2GTRvMfw2wxD64AQasS4XqvPu
         m0DbplzSwTArhVBlDgWZTp89c2x1K0D06s2mCkhHG7i7HuO8NQa8uawjSFxsimLTWR1t
         P1a0X3HM+jBXdvXfes2N2oBvftTYkbwGLKSWOlqBn04klJyii26uNQob7IG/qaLiaQk5
         Cs8jo+IpHFaJRFrkLUfbh0nftR0neKhiB5A19oN36gOTVnP9ZNwH4iQY4BEX0cRaGGtB
         vm2w==
X-Forwarded-Encrypted: i=1; AKwUvBydgElF5Z0G4+35m1IAWp8xe/YTeO24AMU/EDIn791iRTbTt72vkA20ExbUSZaktPCYbmNvJNDhkLsxe+w=@vger.kernel.org
X-Gm-Message-State: AFuF++ldN9h3vQOISBncXRtjBT6r8k1hgdEq2r+/8KlE+bQtTAwPCXyG
	KwxnbYo2Pz/c+KXJJjLGJWPSDcXXO7wGSfytl6MGd21iEEjGx4K408tmKJYfdkbGooI=
X-Gm-Gg: AYBFou1hgzVmvCZq0bxtaCEOMW2apwN+e5mP7wZS8LKSzjd840hZKQRmmFrcDjA4NMo
	dklu0Vt5mOkVfVJjBXuqxvDfgORoT1shmBPI7dRYM9TWFE/zwLhFTm0BX59hLfRU3bbXH8q50Wy
	l+4UChvcf6NM1HYjllx40KNI+fNTieKkIrPaDGqMwpRKgyNHJ7RRi2R8HanKLydSUI0zTYXwvSC
	2zUJmJmKGBh9uIBsfURRqdUBobpJmkaI6Dgca7OmgbR4vRatpds14S7j5G6ITOfhXWmXq3unh9I
	EBJLyEEcRUm2sOWljPok8CeayVktkpQJxu7H/uNDNL1xZZxDF1W1aTSV99INMsAI6KGD5SFwbAd
	resOk/3rb7BpLWBP/mxDMFFKhb/yhufZ2OME/m+xHwQhuDWcFHKb5szTpHacI38u2fSEHIUThtG
	aLMT7QSITU2n8XMrookDA4mUcaZ0SjEtsiP5oDV0qWQ2ANNss/OukbD6d1uyoRAdWHtk3ejXtAP
	7+wNOcYfixYwmbl7E21ls3GIHcvKgGvAooy
X-Received: by 2002:a05:6122:6213:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c7ed7671b2mr19451694e0c.5.1788967339858;
        Wed, 09 Sep 2026 08:22:19 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c81c506f31sm4913081e0c.11.2026.09.09.08.22.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966e7380109so4442215241.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9ETtQOVFbHrA5KRMh8hKFGeWsuqH2oTnwYpxzwiGaIxMvBVNQDK88TcaC+A9QS/xG4Gx26KXyOMNWJEc=@vger.kernel.org
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id
 71dfb90a1353d-5c7ed2f89e5mr22804170e0c.0.1788967336434; Wed, 09 Sep 2026
 08:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151341.28322-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
X-Gm-Features: AcwNN1WgFr7t4mTZJlE0GkQEVjTvX4ia6Ekcpvx97Yyry4KwbnrUZ-lG4127I-8
Message-ID: <CAMuHMdVsr_ahkeEZ=MB5KWCUZ+moSgkuJ2_5mZXy58QE+Oq61w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node
 name with label
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 17:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Align MSIOF1 PFC node name with label to improve consistency.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
