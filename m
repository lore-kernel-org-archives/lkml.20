Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906423EEAD2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345881; cv=pass; b=A4ewPJHG1JF2Pim9jzLHvZe/8anAJbwadtgPE2QV2M2exeQq4iYLIiz8b5qOkAT3ELw8Mh7ZLjYSTJhDZnMSraZ7Sdc40pZew3PqG4AjRFDkJ+h7sThI/vQ8LnI9Dp3olFeAYff1DbEUBszOvPRIUEdyuakU3PTg7lIew9qU00c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345881; c=relaxed/simple;
	bh=HJ7jCLw2FdEx8ZSWU4kyWZlj4e9ArZJhEALqSqij3gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OK8hhQ8I2o83+nb/wwuWCsr+YxJ/EUZMhsRec77kjmRZwN1/di2itCkkeNoZIYfaxy8APcN4ffEJgvpbr4JLVCFdudmzUcpvDkqc+G8LygqvoWKa2fmg+6zaS7Suv+BbMOGwrM8REeUUO5moz7HMNxyaQh3J7ZMpJ/3ayTYwYmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1nYoBWr; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1nYoBWr"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a75f960be3so14467621fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792345878; cv=none;
        d=google.com; s=arc-20260327;
        b=m2KEhMPKf84nM9l+NSgOJjoXZ0W+PDPsqWC9pXur/49hzA6Ck97666e3kd/tTE5rdE
         2nOOQ3l2JZf3n9KqwVZjA8+yUjQyT/d18/362kXoEcgQ3hcgxwuQmMVnBSNFBdK6rTqs
         9SgTr4mGz8FWaADMrucMTYAIJMNkRkZWarn94r36EujvH3PvKQ/yylqAwU3QZxyxR3ti
         RpXa1Ar3k8eyDCvMk382fKnig0K5pr3Ic8tXRJ8BG1kZJSXbG7bYW9znreEHBZDvSBip
         MZVxKONCBobQP5i6lsjn2I/2O+O7qko7/0TZNNxhNWMYHaSISYPbcwiLvVTJjfjT3rqW
         CB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ7jCLw2FdEx8ZSWU4kyWZlj4e9ArZJhEALqSqij3gI=;
        fh=gyJ0yOSgDtV8lNNtxpOqXcm2izYVRMI7JWPZ2VQadMM=;
        b=iDL62E2nIVsyxxTkBlsoUMpiDtEw1t3GEHf1LuJ3PkDFfm64ZfhHmo2FKFHklyljbu
         kwN9z+HF/j73PF1AyZqJ8wIBAc37qptiwjek7zuJs2Jb8tU/IWJPAOOwgQ3JCttLqSKj
         bX+77L/T/owKU0kC2fFRbUj++WgndQekg+26NyUhO1EuacWNEFTH4wscS1qeOUj1NYUy
         g0eYbYiVNzhfT36fX/KpBBqwdUpDlY4E1DppaKQmau6uaXKGLk5s9rKLj4xo61KS/bOI
         50xFEOHqeF7tzbFIMW9/uHUzKn10xX6iG9hbtkKiSFIFt/7/YZee792oc5z/tVvntVw+
         sLgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345878; x=1792950678; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJ7jCLw2FdEx8ZSWU4kyWZlj4e9ArZJhEALqSqij3gI=;
        b=c1nYoBWrKJY2+CLJeXf06moOwiYUv+ca63JF3b3TZtUuo989bYJ/pd73DCPBKtPObH
         /PYjIkEF7UcIZRV777lw3Rvi0eJd8UByvd4FpADF4CR4JfwFedGYRBGVoukXSycm0U+D
         w/8cydt58Aj5ps2S6ZPTotLqQL7QCM3v+ahDVquZvQg3yv5LCxOW6zES1LIhqYGaJyBV
         1XqhaWrLjUlRkjV5oPDo52TlnYktnN9R3qRfm9PZXy2EH0Jx3u8MqUDy1mL7NH+H4XCT
         pWcJxhal5fsN4zZxqY8UPIRc4VXHOIPCDWHUJVO6EwR29E0ckrdYJfHtwPaRxsIDMKc5
         XcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345878; x=1792950678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HJ7jCLw2FdEx8ZSWU4kyWZlj4e9ArZJhEALqSqij3gI=;
        b=Gkw+H3pk+QNgehkYHSH595KtdNP2W56MKd0SPxyKGfzxW1k1y9FfAfPWy+lew2pkmo
         kFFnquqLNSblVnbioyN8c1d7eIwmMOKjGWhCpYUI9wLt9aZxg6Q59NOs5uJ9juydsTNb
         jxfOvSelZsAlCLwrLJCXY9ubEmJxs69Pg9jgvSIKCxjuW0lAJNEqrVmXrK0zk1jyCKpp
         qygFuSmWbTaaPGUaeJMIQxGlAx5Kly0rfsxV9KlOMTWLNqJCcd6RXtV0Ism069+BGJjb
         dMWXbYlTn29V++CUlWfJG/qLta8pRPcqsMdVWb8iKIqqDXuFcLRYLnCEH2Ro32p2oHAU
         Gsjg==
X-Forwarded-Encrypted: i=1; AKwUvByWBhheWv0bTezsAWrgaIUWumNBlO+FRwd/dH2CwjAmtU7fduq7pdfqIe5YHg64wU+cBLd234YNJLU6t9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxlC04m82aOGvRw8bea+z/t6PZ3SY61dfBRHbj1TNj+zd/Mben
	tUWJv5u4xqJWNh+qhqPafkk1bLxqD/jCf1PTOTwpGXwkrvG2VOY3OsU5M18VsepY2zqpPnpZq2I
	KI+U2VkMJE/A2DReQbpgz6lylV7K/u+o=
X-Gm-Gg: AYBFou3tMfs+ZX4ra9YME9AEtOn8M85pjXcCyIcnqcWGqgLWgwiJMMPmnMqHGzbAhk/
	Ek8I9YpXLSrGJesDNrpetnmEyBAn/4mtkBvvfB3SVfOdYXeS5NH47eUXo9zEti7WB1ESpmbLKvI
	ws+pPD6ozJGHPskeBoR/LFcKTUcUB9LgRld14SNLpViDp1zu7/jbJKDOXt8jCupb07y2KKB3bGF
	4soY3Rcc1MZIHGv6KcWoMEBidy029+kOEgDo1LFFc0tapX3AmK5xObap5reMcbAZxRMhhcOsfXT
	HV8V8BeysKLa5SEGBwP9zyZ7owzYm/Ydyni/qpdzH8Ao9NcNLo+GO3w=
X-Received: by 2002:a05:651c:a20d:20b0:3ab:2517:6a6e with SMTP id
 38308e7fff4ca-3ab292d34a9mr8826631fa.25.1792345878330; Sun, 18 Oct 2026
 10:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016045849.813696-6-oss.patchbox@gmail.com> <20261018125520.GE64621@unreal>
In-Reply-To: <20261018125520.GE64621@unreal>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Sun, 18 Oct 2026 13:51:05 -0400
X-Gm-Features: AclHuK9VhtPON4CZXI1t-EARaMx8fGG5lLL9rRYVGDPs8VyZqR0bY4J0-Y_FAtc
Message-ID: <CAGG=RgAjY-TFDq4+rEspF5R_dTC=6jjHfS3cRsG39fi_LKVN0Q@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/4] net/mlx5: Don't free CQs whose destroy failed
To: Leon Romanovsky <leon@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ariel Levkovich <lariel@nvidia.com>, Jianbo Liu <jianbol@nvidia.com>, Alex Vesker <valex@nvidia.com>, 
	Yevgeny Kliteynik <kliteyn@nvidia.com>, Itamar Gozlan <igozlan@nvidia.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 08:55, Leon Romanovsky <leon@kernel.org> wrote:
> Please drop this series. The flow is impossible in current HW implementation.

Thanks for the explanation, Leon. I'll drop it.

Thanks,
Yuho
