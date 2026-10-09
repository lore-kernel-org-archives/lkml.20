Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35942442FA4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578211; cv=pass; b=D32qyorzIbRzjYGUI26QVvD6An96tPFr+C2CuGjACG3qeMEleF8fx7jbFkOC/ckCTAiaZb+IB4aZ9r+v+I08vs5cZ49KGvinOyZccoA1VBzAdmcgGa+exaf3J2qW1m8VlFUu/ltOgD457WhAMrJvFAJymcTrJVe3sU+1WbATzg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578211; c=relaxed/simple;
	bh=YYE3vIzKUzyIWt2szTE28K6cwUJ5X8wWypAelDLDJJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LokpieH/3hjxrEfz/ZbUWxPZmovxiPW9VLOQufXiYhuYR3hSIsodXHcSF7QcqSCr3uCmqPzAFN2MCLcsJGjuFWrv6qzxZ754jxtHA4aOYr5zOpZblT1a87Tkw1/A5JZ+5SDraxGlFYoYdky+wr8oGwBayi5+fAU5PcnAp9j1tkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llwQQKSO; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llwQQKSO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-887d902c651so14324b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791578209; cv=none;
        d=google.com; s=arc-20260327;
        b=KVCuFtbMgdf+Yzf8jNADUG7QArEPDO7pCBp73fCr/Ub8JZX/+GQdmcvpIk1UuS9jwR
         ceewUWiVs5N0sNwA3sARa/hkJq4Ie9zJuYPx8SIaf7Ed7w+l9/4fPZG6Ndlt2M/s8w7T
         iyWEdGCOKnlRaKusMl2vn9NORPIAueHf0L7c56qfp7c6mSrmmU3PCyz8mwIm95UbwZaq
         CZbX4UIrf5zIfKEz6N5zTc/Pp4t+ltgzrlnBrLDf1hP7GQJgQNw6QL4WREK47yh/8c/I
         hKVBN9pUbrIWBdJRbxWXOvLW5heWOu8ACB4Ko5aRl5JscliRukGy4aH+6JC3xFltaBJ1
         +eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oq75LOykeXhBAHz9PJ+Sey28bzslRUQX2NhydrzoV1A=;
        fh=WdTdGMBslB0EBBmWP8MEDXVF5aIcTjWAd8wmaN7lqLI=;
        b=DR2l5KblOp46Tg2hD/2zEImSvZtm4WPnkW+HS0g2cRDEzsES8NWu+NWuJ27c6sNQuV
         5BFu812qgFpJ5gv1kxKA/bKOQAAmeUw4S+uX/hvfFqWG3CBc4DYbaKBf3yIJfgsaDjzR
         CoOm7p48C9DWpZbJ6L7VoCnR1YRFabLh2lrBmBLkcvvQIXv7/ZNyeYS0H9NLY+45DMVb
         +7Qr76fEGbuDC28szzHdQhH0pQAtALdeab1n4t428o/r3Tvt3yZ3x+LV3OEV/3lgWaOp
         WRKlUKSUMNKaljsLKJIl9FosFx/Fsb6wmyucCDYfWgqcPrqJ309C8e6E531bguVOj0qP
         P6XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578209; x=1792183009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oq75LOykeXhBAHz9PJ+Sey28bzslRUQX2NhydrzoV1A=;
        b=llwQQKSO1YF4jeOJpG9dk+hrB4mS9OGnvC8baJFOmewl3lI6+9ySdPzKa54uy1jWUo
         FelVNyeGcyIgbCmfq64YZl0A/gx2QjPZDt02ExxP6eIDixwQUK5epssJkezpm2tNgei4
         6tsOb67D0AyYDsOq/eyZmB6p8nS+e8c1ciAYGW9/iO/Oc3San8jNzOxI53WJKa+8mo3x
         nmq1Xv5MyhnOiRI8PQx+B3CuQt5tnReGizk5LAEmD2Yd2en2OMqwoSo8nBI5jUULhgfb
         nzotJi/SOFy1i3+b0tnPqkekI3U5xFB6H1qOH6tcE//l/1+67hSeoZ1rOLNNTV8tJZQO
         xYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578209; x=1792183009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oq75LOykeXhBAHz9PJ+Sey28bzslRUQX2NhydrzoV1A=;
        b=d6Ch6n81TLlkhkBqDSnvE1I16kduchinmvNfkcsfLPleDb3TtziGEGUCvH8d1evhbk
         5XdNkPF9bsZpJfv7QnXTVDVHuF8k6vEiKM6VU8RfP2SrxlXzpTBoHOR91GopAdjMC6tb
         petVc1Sgl1S1pbHI9W7V+Imyoo6sAHDwgK/gDdTYJR0P1gVDDxVxu3H66ArTV6JssaKY
         rzKnfcsrlwkt7ZMmhEui5ca+j5o30ah7p4gk//SpXiOvcuVjAwiaBDTXY7tHt+DP1hHB
         Hy2cNiOq+Fo+41bG14OGe8y1Jin+2DAifwzUQI6F11DXR3mYnRKQOI0tdxZgcddI/WEo
         weqw==
X-Forwarded-Encrypted: i=1; AKwUvBwvg8s6W3SWqpR0PIRU1qPdF82/BNQ4hYWjtrkpTmDY2Em0DOh9W9XAQ7vD6DN9FVOXL2ZKNTBJOlzudg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYICBzcywkReSjn2efCWagXKXUXlvOBCk2CQj9rtgSVbtyRbxL8b
	jX4MnZXHOaNF1+GcITtV/lf2gSQpTWHiGM7n9HipifeorIsNrJ3mlCV0LcQB/kUEc5coWiH+407
	v/SF3sfPoFdtUxgOSfbv9WICvF6n53Lg=
X-Gm-Gg: AYBFou10LAQXHEwMRV6NlUgC86NMUZ753d5OLG1ptXWAwZz8O8+BUva92/2ispLxUPU
	CxvdecnXzR666/G/DaEe2hQAW40OyEoS5vL8aeAIytkF+RDXPNrQ2X3lloGwf5tXkYI0aGLJ5Xu
	BChNuEcL5BWzFIFpMgJivUKFGDbaeQGLfvcKB7RjDq/KhC0ylfUMPqRyccuotSm6Y+lpG5Lc9c0
	o3tDw/pU7VlvhftysPWUfgkSuwOwhaP/waLpGmfXChHI+CYVro4/dnx+U5M+6B9CGk88czGCLLd
	pCmOO4AtKIh9aEmx/bEhZT0eXzJmLEv1hsxUOFYrXaAofcKhFEv1CNRcp0bvzGua/3dnZ6wrF95
	jNB/vJg==
X-Received: by 2002:a17:902:da4f:b0:2e5:da30:39c9 with SMTP id
 d9443c01a7336-2e84289f2c0mr38543735ad.2.1791578209212; Fri, 09 Oct 2026
 13:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-netcon_main-v1-1-6d298ab5a0cd@debian.org>
In-Reply-To: <20261009-netcon_main-v1-1-6d298ab5a0cd@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 9 Oct 2026 21:36:36 +0100
X-Gm-Features: AclHuK8cQhu9oRAOSf0i_0swCcZalD-Aryjk-1bUpbcJwiG-UgZTWwXMupX2NYE
Message-ID: <CAGSyskUgeV5cirJN4YSGT6_3SyhG37RGo7qhr49m5CVmv9zHmw@mail.gmail.com>
Subject: Re: [PATCH net] MAINTAINERS: add Gustavo Luiz Duarte as netconsole reviewer
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Breno!

On Fri, Oct 9, 2026 at 4:16=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> Gustavo has been the most active netconsole reviewer, let's add him
> to the MAINTAINERS file.
>
> Add an R: entry so get_maintainer.pl Cc's Gustavo on netconsole patches.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by:  Gustavo Luiz Duarte <gustavold@gmail.com>
