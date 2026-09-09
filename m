Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398033D4F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934938; cv=pass; b=fXGJEc0KkVbQ4dECgZFl1jy68NN1BDlHEhhse0ks+bQ2ryUriWQFyss7haNJP5bP2vqgGcKM7J/SvWlO+00wAyetwSxnZpFCuND+DgGhcXOB7kjTBgg81/KgTIJRUnoRa1+KHFDMGDo0ONuCYe1mm2NBjppmq+FxM8xhHPdVbro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934938; c=relaxed/simple;
	bh=ZUMAL4Md/OW/2i7TX6skK5sRb7fbFz1d/4ElfK5ssWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1BY9WIav+WHdCcxvyxR9IpI23cs3xEoHL2TXevhhPtaVjGsCklI3jcTcq32OnrNMlOOwtoUEe9HyyMVGMeNfLq/rtVxcAAnuQQiESKFYshbXGWWA0UflBhe1XzZeRE3Eex6nH1aOfFhADP6jG88EwEEHGhBX4i1pk/XNmDAttA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ql0FwmNg; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql0FwmNg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d58efc7356so70230855ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788934937; cv=none;
        d=google.com; s=arc-20260327;
        b=IRLQklkql3KcusxBmqObJSTcVkYHVw3bojOsOMWRNeVMPGc+pYVcuiljeUm+ZzW8Lo
         6LPunnmxE1RvuoZGIG7lSFVAEzx3Q0mTO9S021FM3TFkOTzeLtUuhDsehA22xrp7mKDE
         WlSZhTAJpIn4YDM4vE/atKTspLIcaZpqtTC6ZAQ+v3JaQLD0YGS153dqpcyFa06W2AOv
         SxMCB0QpoLiFEqrjofxRVDE+N0tXr6kUkTmeyoLd0EybMh3wibtuPZ+NGGYW3JoOjBwe
         44181kO+lhbsDT6h5+HR1oKsxoOIDJGe70auTcC9WxZP71fxxJNwefXjaKmKsrlNQMSO
         /93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VWM6CeHEk1aJXSMMdnevLIa5hIVREi7SkJQJU6C6uoA=;
        fh=UMWzsvojVJFa1S37cvNhsGNLjp6xOn6/rI7R071TiEA=;
        b=KccJ4ComecUQRKv98DQPSEzwY/0OoAdz99bucBThAr5EPHjhHndZMUqAgny/fY66lk
         01UrzBsk+IuADUzhEiX+f/W+fAOUTBBkw5FndY3J5Kc+MVbzRQag0Xr9TVC8ZrGSQZMQ
         DAJuJpbxYjM5p6YwvEvOkk4Od1DoD4t7WqQZ/OcJcGw2+SOlG/BVcNe5n3NICWch5GKw
         +VPDJaSK9TO0jghbGBZAabGZMV50qZ2D3Mx+mtbgAvHwNWXo6NV0CYGD4fFAe6X6bfhB
         QG25lIb1d1DDmGIUBSRMcY7jrFuY67fRBUkweUL89INVq0QNSIEvpEBk+k/6usWvKBmt
         G8tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788934937; x=1789539737; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWM6CeHEk1aJXSMMdnevLIa5hIVREi7SkJQJU6C6uoA=;
        b=ql0FwmNgoGsS6mrohJjP4yNIQW5HMfiy6B1gImcGcd+aIII2jfSaO+P1VZmGm7Q4w+
         C8qOQoMqviiO7gJswGseYyNA0Bdg+5yyJP+NSMKo3r4Vs0RwQG7YYiryRmm3sLHXPOli
         wKMbUYiYdrldUwJhWeUdObJZYZorC2A/mrDOvA4r7/UOAku4U/CdrCwJDClt5RDg748m
         7PJ1iHJKDg1xgzOhkZ5aXcfcRYpv2Y8LIBccXebKARO/+uUnOXmdZNc9b1/NGv93k1cJ
         2wy1y3wvAFq4DSfkwcZuD7dn6XDIdtyheOAHtm7S+moO0qdO1DSIUYzig3Wp45kVgfyo
         mqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934937; x=1789539737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWM6CeHEk1aJXSMMdnevLIa5hIVREi7SkJQJU6C6uoA=;
        b=QZY61EUnypII1wRiXKEBX6NRl/sq7fXe85vNJ+jPNa/ayaceONN0qe4DHh6rvYXrQp
         wQ0lobxBsxdCu60hlm6IisRJyDd3XRtkLA1fSm1t7rQevZZJaF8WU7zYUB1di32hj3TJ
         3myCOG5MDpdeSKu6Fa5gL1H9EhSXrByRxFSS93Dsix2ckDW0x1xF1cSd8FRGPAcDTOVb
         PMlOhmgr1GNTf524+ZfxtMcqjXDybC/PSdvacwCS9mFCXyQQLcYWX4qFk2Pd9WssqAsT
         iAxIFYDMiXD6x3W3iMNyfiGHUbrPoi1G89sPHSeG0Yhs82EP9poulLNpZukeW7q/cZxg
         spDw==
X-Forwarded-Encrypted: i=1; AKwUvBz3btJ/YL02seEBO1Q8Kq1+dX0YNVG9IRk7afV4EIxPA8I3llabTWaAAvfoetYKxslaKKBJ8p3mF2bWdes=@vger.kernel.org
X-Gm-Message-State: AFuF++muVDvExVotjkG96xDYryXkhi7hooqa2aPcb7SqXrAo85W9zOE/
	UWNTSoy/okPk3yBDAnMiahkbnrI8gRsu26+53rdOhXXTb+1BxSENG8UrjBzsHQ15EldjVYQiYRT
	Y/bOshNheSx/e7ig0/phc7de92d6sRek=
X-Gm-Gg: AYBFou2IpXRoUVl7WvmM/mL7chh9A6XOVhb8oBDQfzzMWm9lfIbCefxkECzg+HDGSBf
	kd2OPjkgDISfMvq5IiuAHWkVS8Zq/kyRFt+YtSEtKCmZfU/LkMRzliy8MbfVsu/4iYSgve8eZb3
	O5Z0dq1y7kCM3OVfg8KESLpe/foraVwkhwmOTjK1PyvhC0helk8pv1Cs/rBZkoM88XVq+Zia4Ht
	yNRcW+SSMkydEGo0pPL3IhCTHMfTXjhJ5iMtmYOyEJMDjLKRm8dGzi6j+GKwMDoJ7W3wmvFJCsE
	sGd4gizrDq+TVISbK4T6gpkuBdMtmI+kgUFoPa/2zX18oAVLBUDeiOKvIUWTgAQELFyWwMbvqqF
	MBon6Jo0KxUUA2Vg5gvzoY/YRwSlhdvqJmDtKT1rnonWKL+Kc+SMdd4GB1+q5Mlwb6y0=
X-Received: by 2002:a17:903:4687:b0:2db:733c:fd1f with SMTP id
 d9443c01a7336-2db733d01b1mr147964695ad.8.1788934936683; Tue, 08 Sep 2026
 23:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc> <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc>
In-Reply-To: <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 9 Sep 2026 13:22:03 +0700
X-Gm-Features: AcwNN1UJle0sVjQuUbKVCU6-l0sg65xDQ67_7YzJFG8LlrYIbdhc6pOpj-B036Y
Message-ID: <CAABR9nGshJE96aCZVriQeMd+7Zjua5n+EKpUTN=953sowUL0Tg@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] net: fec: free the PPS interrupt before
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

> +
> +       if (fep->pps_irq >= 0) {
> +               free_irq(fep->pps_irq, ndev);
> +               fep->pps_irq = -1;
> +       }
> +

I think fep->pps_irq > 0 would be more appropriate here,
since the IRQ returned by platform_get_irq_byname_optional() or
platform_get_irq_optional() cannot be 0.
