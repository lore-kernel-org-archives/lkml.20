Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F55233920
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261779; cv=pass; b=AwnzxoYB1MCEI6uItoBVy2lhViZ7DQto5haQE7Rx8VYVPwhqu4cQ+rNAMqZ/sskUUyIXMSOSegChEARRUtIX7sYD+Tnjp4oQHrke1I/NQQh0gJ8vZWZxOfL0tTi8S+vVLmJuAw1vqvcmLFrxmYJKPJArDAJ3RVxESOkGIiiZW8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261779; c=relaxed/simple;
	bh=YLXZVAzabw0uTjvEyX2I+3A9f8zSZu72xxMQhsmY0oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVZwJggwmT2VcEEGED2Rg0Hn7lzNFzv5UsLbz1LpIPAAISfcBGeDgmHPX0Kmnz/8jtz354XAppqp4gylG/5NubLGoNSaCb6ZAmDw+sFgKWLmV7vsF+URk+7B8xmu+CDP7jafmj2CsxEgu4U0Eo7niLMUXa6joml9ybmylqXmuVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn74sYg4; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn74sYg4"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98c8c18a045so89495241.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261777; cv=none;
        d=google.com; s=arc-20260327;
        b=OEtm6mk3vaL5LczSp6E7q5Z2gDVqboWft0Y9+vUhl+NWCIs1u7bARTETvm+XI9ZY8s
         FyYzG59rQwx21mGlVdvzIRk1OnnIcDt18//HIsMMgUQA9RM1VoJfCGgc2g9l36WIlub5
         zJ/35vOn/PGrKE6vJz8tU2v5Ywnqze4j+kpoZG5W74D7GGqvtdaJH2T0wQy1cvNQISVK
         j6Veor7XR/Wo+UAxi/Z9aFLjrdZ88Rr/dhxwPOw5sV/ODWBAahko27X2vl828zFPfOiU
         E6iwRUAQXc7DdXW00vwRNNdx6XbOM8LJwdJZRpK7NDR/OkeB+1iAfg5vxmQbVf1TgTL9
         Ux3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJ1hzyxGEgvXH/ZFAKmTf5EgU5zVKhz644TJMr10DOM=;
        fh=54sokcmsvYBThTJ//JkLLEJ+SlSBQmgsZqsqHXIAKU0=;
        b=NN804SGYPnKzGlt1uJNhzIVROUDAtQYhD2ctgxhcmTWAGKcPwiNpLAs0TN8K4/mUXw
         6jBBYJL6q8xXdWJ9V9xt0HhTcmnx2X3enREhn9um76X4o8xuwkt+6TjukP12lafOiAFB
         8mHtbDpYNfjtoruVFp8IctO8UtpypnkUyJ8CsvqW/94xRyLl1DGXYuuYj1XHd2kWNVr/
         1uTrkc3GGBeSrqj5uhV0pQ9ZtPDJZANYhEmgCgKYs7nwwuFaotyoJGGLvV31uzsxyur8
         FNmmFckXSYI2BDrZ28YF+r2sdksblFu8BDuhR34MKetKTsWJpnIWGli6jC1iA9Vh3F4I
         sWHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261777; x=1791866577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJ1hzyxGEgvXH/ZFAKmTf5EgU5zVKhz644TJMr10DOM=;
        b=Kn74sYg4RbIZxFIr1be683QNaE6gR+31HQb86NKkIgTDrVfCAEUXDCTh/b+SAAPArF
         wKRTD5N5vTQPSkj6vb87duypE4IOCRzMdUpdh901U2/ogvehDZBs4U5WCrqzerWBC+i1
         zoqAn7FEaJ2S11y66nhnQ8fauDttMrx7hGmwQ5SYKTnOF1EUP+WizKXbnGnpLuCGKX/2
         QrtUogRAEHAhpeuwXBwkEfnvqYdRgT4G5oCLDDei7Sw5iAeXg60E4KiLVeFLa64JQZA9
         2+3SdNzReszKR8MjhBXZ3nKSa5HJgD0mvWRgAITs0Sh5wGRM6NZ6mhWqsZdx6gXn/Tk+
         5mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261777; x=1791866577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJ1hzyxGEgvXH/ZFAKmTf5EgU5zVKhz644TJMr10DOM=;
        b=bizG6o4bVV5i7Pam67eI6jwHE9TSZUUFxXYJKxOcE0xpBXWu0Zg9beXIeznirOTEnW
         cNBGRVLk2NDtm9K22QOL65rppxG8lJjEsjNbWGPCQFraUyNMWHSsODpJUhAZ1rAM4Tx5
         BwzXrvEgB37QcnVmEXyH0tvhWtojahA+zV1St+n+UCpT8TV0QpstiBZdDWN+nQxmdsSM
         DfvebBUrBfwyu9PA1VSLK+mxKrzhoxXYwmzqG9M5fdiOHJ1/j9vjjo1ftNd/+RsKQz87
         dtY7pTmkZCmNNCkk2QyZaalfw8xnY9mmI3nYd1QscVa2OSLvaoHFKPBLnX6uiya2J3TL
         Znlw==
X-Forwarded-Encrypted: i=1; AKwUvBw9xBPDqbSkiaxVsS4jmUs353Eum6apFIXnvCuHG8+p8oCZlEVipixTBH9BxXbocJN64oL5cNJ9TU45CIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl8V02l4FMJK+ER00GJFh46AWKLfYeQLIVkWtXqZ05/0/Cn6BG
	XaCMel6OmOjZ0SeV/wpsm3z4pbQG38IP1F3hGd/TOUv0G83Xjh67WYBqkNmp0ssRl3OOz48nExv
	/hIorKe7k/BZQjyM1NlZ8qLcwSqLI3PU=
X-Gm-Gg: AYBFou0UWe9jrsJdzdnsbA10P0UkSE0N7rIjExTG18nzupWp0zHLNLf83As0dek53Jf
	h4rKwJau5nH4tHSbOt+OJ4FpNvAuV0XdUaWzb4YTFHMMbxCQ+xWiANoEU5E4nVu8J65J83+4eHB
	8l7NqBS/lyorvy/5bT/cOsRubq53/PZjhYI7cCFhGYP+2IQc+9sC9aJykEEGFUsZpg5FGyWo5cq
	gDSaA9vbJT8vxa31ZDKvNxIfYkgz0cMdPbPmqJ21E8sTw7jo1ydcq6ziOtL1noI7F+PwmB/LpGP
	x0r3LJf2GcxdiLL1+T1yMVXQugdLIsWXt9kviviUbUL0wlAQLSgL1uWqCSSTIjN4pSMd2AyAyn3
	WSKIwC8EIgwAR8xsYD0SUolB2a1zxmDeVY6aIJrzw0MAwF5hrJPtoQX9YpKF+i9OcGmlfVZjsM9
	UcVNtThLNF1tgmWGbTn6/fjZj6WfgN0SFVhB3fGiieHd5Y
X-Received: by 2002:a05:6102:3713:b0:7c3:6caf:bdc6 with SMTP id
 ada2fe7eead31-7c36cafc094mr1944761137.21.1791261776819; Mon, 05 Oct 2026
 21:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-submit-phylink-suspended-stop-v1-v2-1-8b8e5d53dfc2@gmail.com>
 <179122764255.1402591.11842213570415395688@kernel.org>
In-Reply-To: <179122764255.1402591.11842213570415395688@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:42:45 -0600
X-Gm-Features: AclHuK_Y9haDQlUkQ1-OLiXS69zhrfwKJou28sxTeDUaUR8gJdKKHU9izxO_gLA
Message-ID: <CADvTj4qHRjm2xSNcO0qX_6y2mfT0RJPbt-yGnYYnXstxUZaKJQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: phylink: allow stopping a suspended instance
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 1:14=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Controlled failed-resume/down-up recovery was exercised on Allwinner
H616 hardware with sun8i EMAC1 and an AC300 PHY. This was
fault-injected, not a spontaneous failure.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
