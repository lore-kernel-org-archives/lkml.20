Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EAA52FE48
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071992; cv=pass; b=Emak/yoGn+2Omcdw5XAKOGx1Fzxx2/ZTRaA5J3JMBsK9AA7df0ybEbaBSZiczyEJ+wEmKafCTH4Q5McvIDgaeV0m6Xm8N4tYEF0lugGtcdAgAu3a/FOwXj+Jxi1x5DMYjV6ZJUz9ABHXoQhpD7WEeRw3TMlVmYMyTujrgC4jkFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071992; c=relaxed/simple;
	bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBb37jbVhl7jOmHhjZFE8Onhzm9Pspa3QWtX0a5jVf28/86YhK2RxtRWpu1CF2t9PeK4KBD/uh2sYz0iHlQU2rrBmRf7nBuWpk+/hXz5xBksrhXjnlyNez/unu0CiWs0Mp/l1ilIGabfBjsDJC7drfxL/gv/zo/XeMglNUrGuL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIsGQHnE; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIsGQHnE"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c985f055b9so861800e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071989; cv=none;
        d=google.com; s=arc-20260327;
        b=SLySi82CHr3+PfYRyTMWNud0MIN8TrYvkrfRBMufSoVotEYtOOETdUzFAUX31uJrW9
         xZNj6Q26LA98sCpayFk5LbyLzgNQi8pNwWYPH6Rs1cgtk4PHyzdF6rHohxSEQyUdiI4o
         vATNLcYga3AJ6m4got0wbf9+7gtYqKY/i1zD2t9tAQfVNd1PCCT+41h9iNjhPYCAHGAI
         AYse3qc2Hcp3k6VlhQ7u2maQepVD73QENPzx3HvHNrE1ShGiGMcNp+oz4ABVKr0a3IfH
         LsleJlQ16RFWC2IrhodrbKgG+gANdO+4+tHsgj4uwTdwl0A8mrRlHel5iro6qGBu9L24
         5+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        fh=DDf4pMQJxjU4jvNHnFkmBx29UUEfPmp9HUBESzaqkhk=;
        b=KgN1x118lJjSFnSPjXlu45cshqNVFBTGD5n3uTh1lkDXyBzOX/Wl56BX/KRBV6KFMJ
         z0RWqRXQ5F/jSkKnCpg4rI6+9xc9qtxUfENzymPpbQxexaJ9Aq3mIgdGshTaXmwnq6Pg
         VjhKqYpNsGXDC3Jv5kr/Rbec7F2eLIhPcU9tYAJNroZCVlTW0weSu6XFDpWHrH14Tnfl
         c/jpnDJjjTxhji9BzDEKk+Nw1Pwc60JPzmc259wkYYlYMbpUHgIM1HRO50L2X8FIxHvk
         U25tj+X5QQ4QHxPZOPo9Pc936tawrWJqMyf75Yn+9qv6/IpgPtHRNgpPW4TKSbRCt293
         gXzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071989; x=1790676789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=XIsGQHnE1pPlKZKqZgo4ilQtUMe4Cj3c5voawIYa1Z8Bh3WzEN1H8/7GoChObEaZVW
         G4RZsHUbNEH+/yAoJ7SB1VFNsbEl7hplQzwO7i9tjnKmCTWCkXOsYksFfyyQCD/H4koF
         w8utch5ZpXHMzcSx7/UDCPTrouFxQenf5hPqXLJKYjNyhbG3NQv06eHCSM9klgCX2oY+
         21WnEIAk9gzxld6HlD24HeKtJaShfpUtWoIrT1JiOWZE/mIulzWtk9Kxc/sg2/ThOs6k
         J2H/HmSbyhu8QUlqqZrhwM/opShTb785AFnOI0kiOp1Ko+gc4+J/nvtin+4EgKnZ2Ayb
         fdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071989; x=1790676789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=vovCnLWSvOhO2A7joZZ8cwFPO+KUAvonIk+eLq884w22cVdbkJENOBcF3WrzRM5hKV
         8I1cntQ33JdZOum0VxGT2pQCFi7m6pO9sdS0m/MMPSlS4G2gdlBLjWUx8wns+c+yQt3e
         bjCj681T2C5k+k9suUHjMizKKyjITbdsjc+QEhF4k5jV5svJvP4RDSDUO8UjyEYGDL/i
         /152PHxI9LlBmiM5Ji6tSgRRmX2+9ejTWY8hH2/tt+Qpggu+QbS3OlRNoDXFws8Z66jP
         pWhZ6qk01FhxdBqVSDp585nXu6yBaags3mWZVWty6h1j4lpjU4ywrFHbpG7I+7b8W/2c
         RcDA==
X-Forwarded-Encrypted: i=1; AKwUvBzkSWyDG44FTTdiQJ10I3NkPzpQjjRfglFfjqssamA00kQ8repCgY+KIZcCyo/b8wG7edo3DQNvt38Hl3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++khcXbFyiFnJmlwdqvTaYnuJ9i1palbumyXVqXE1Q/9Gv0jLf1k
	gQcUYNWWB0EzTdCrt2Q9PfeBuHn+rnVh+HmzSsZo0vux3ofC2/2MITNIfPxPUMsbZi8lFRFvfmT
	3liMqLZXDMWdD2XBD8MrZNqyzJI8cCJ8=
X-Gm-Gg: AYBFou3iobEo0nITvZJWfZMWVqtxl/itMg9Q0GlvKzK7xj4ejG4QN26yo7H3/LXS6XU
	62WsWzrKWO2WAG01vgdagFc4mgFj/DiMJ0/TnBNlxngDoO+pQpgGKGfqJwF2Ha2MJ9UAV8RheRE
	kns2JhFdQoL+gG9kp90URTz5v9wHd8v4eX1Cuze/ZBeDgcg3zsaDvuJcpwrUSN0UOW2lgdghhFA
	MbwjNgwsYgoRDkj6TlMn/M+HuKIaFv2ueUZI8yHFExiTtXq7U+0bipzteIiwf8lx6WIUi3fUffK
	ZKnpsf/PPMqkJ7QP8XGVbZwLf1ASFWWkXk15NLrW8hdlLdrtx96TLg==
X-Received: by 2002:a05:6122:2b8a:b0:5c9:9f03:cb07 with SMTP id
 71dfb90a1353d-5c9e343983fmr1483343e0c.2.1790071988975; Tue, 22 Sep 2026
 03:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260921135933.7e8857ba@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:12:56 +0200
X-Gm-Features: AcwNN1XO-IQtQQeBFy8m7z0RqgCFyAn_vcQf_nLSSDZxar5hmkBbTIMafTrhl4Q
Message-ID: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> >
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
>
> Looks like the review for one of the patches failed so it won't be
> emailed out:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>
> Are all of the issues invalid?

Only one is relevant, but expected.

The remark on the fwnode patch are invalid. The driver is expected
to return those error as probe defer is not supported.
(a notifier and late attach/detach is used to align to phylink logic)

For the specific Airoha PCS driver it's really speculation from the AI
but HW doesn't work as described by AI.

The only real comment that is valid is about the alternative way
to give supported interface with the .get_capabilites OP.

This is currently not supported as there isn't any user and it will
be implemented as soon as there will be one. It's really to limit
the patch delta of this change and to progress further.

Maybe FIXME might be suitable?

>
> Once the AI review is cleared, some human will have to review this
> and vouch for you as a maintainer. Better still be your co-maintainer.

I think some revision ago there was Andrew that reviewed some code.
Anyway thank a lot for checking this once in a while, I feel it's a pretty
important change but I understand it's complex to handle as it does
introduce a whole new subsystem.
