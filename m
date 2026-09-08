Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AE1A6822
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835899; cv=pass; b=euQkLoucNy/3G4I5z823UTEuD0tOjsAUGWsVZVbKycimtzd6/qgN98M2/d2nEO23gr7sqCE5Z3w6r0qGflOEq1x+UJeZ8a/2HzavR9HRIkLYX/eip+CDdh4xDKhRpYvUkD/wG9wChcskpXW06Vu2NI+FylIkfuCrgxa1k0PO/5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835899; c=relaxed/simple;
	bh=I42Ohy9yZwsyID01fCH/7PvGfx8whcB2WSy7Cl1XPC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0ZPrRRtkzVBMPnZWGjcTf57tosFoMO1pMKmKYqzcDWcdIIpD/2gi5h4Okigriw3j2gJOYdBIkHM2fPIB8XrxHLDrKTWfR8wLkUeSg+zwLPl/Q6Ngg0j77dBqB1HwFY9ChA/ERkPZgbyVyxe3CrwoEWEWsjgkMAu6xFCmNgmn1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/TXHoA5; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/TXHoA5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d942c7cc2fso33676795ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788835898; cv=none;
        d=google.com; s=arc-20260327;
        b=fAOxgKIfbM+tJKmzjAF3Xs/ahYDXFHcmlDKqcLspost0FU+CUKOLVkmCOwjdljQO7W
         kJPVb/P46zO3wdiyGhTj9dmxmWsj/lIATadWVTHLu/iDve1EtV9XqQXND8t3qCrbJpkz
         a2oZfgKpAl7gb7r1GzjsIOSMiFv9MCZYEeWZrvLCpLEZjOm6E/GRl+Aw/wS56ouruajX
         YMNAdEGp9Tk2xv/C45bosENVTbMtRTzTkqQ9Om5fXmaMHIIWlcazAJGDGmFRPbPzm/ST
         iyP5N92a+aEcswKIZNGGDWnDT5lcg2H9LESQGFvQNwJIB6Xg47ZmGuMI2l03b18u72Qp
         t/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=;
        fh=5yfGALtwk79ZWs/nrOaiyBTM7sJb+8dH7pZc+E/fFq4=;
        b=SgQUWNQbZ3lQsGfFyA9C17bWgbtcxyzcPpDQmDzrtAQU52OGksB3CZ40Pd/qU8nL0u
         3noV7v/Nvv5Mh9Q6l3v/Lc6kykAoMa6syP7LYdYRVqchHkApNQzgP8E9Ss9dEUsASR2b
         IGBCqtWJyVXa5i5lcLMF7TOQxbreckKDCohlFw4zw8pGSJ0bwFKUw6EV3b3EenJvVdUh
         9cHuGlskcbJqmnnMnW6/WNFpKlDl11jWwlYQZJ2+47EJKrbwpm7twPkpZnJ3HZapiRVX
         oJJ7526S9t7rxY0WunJJFuYeskzr0lmaUz6hXFm1h1pq6pf8XVLS2SpHX8PdFAeVvwRS
         ypxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788835898; x=1789440698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=;
        b=Z/TXHoA5sMUp3mp3qgVpHkUVJdkDkyn/Zvek0DuhAkNtsN0UZWJBJZPOxxZo/aWPWX
         Th4dHfONRkEphFviyKQ/knXp8ExNjmjPCPVn49T1cpa7xC5ztIagedMBzJ23iFMc1IFB
         2OK/iuAwpbe9c94MjlTH0XT2It14qaTPrgIqpgYXQfVhOc/R1cU6aBNYC8L/eKDoDOHl
         Y/fyn0Gc5IGVDpVK2y4KdWGJko9/xvdwZ1p+9luX5gNt3upfTkghadaY1UATHGgIDo8A
         k/TR/WP+J9NEkFKHe5B41idxYfXaEmwY5CcJl573i3DaJjloUs6TUk4ENynGl0ueyZ6L
         yrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788835898; x=1789440698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=;
        b=I3cLEuptEqsrSk9/vHMrE4G8Jfy1X+wXLJqsYZ2qLrPm+UgcIvBpg759fhD1ND3ssd
         yxG7SuCMPgXv52Rpa7cloTwCgqaaIGhi5saWUxgvXuuDfO+K9j1T19Fhaf+u05MxxON0
         7uSYG/IBA1rfoeLmBj3cLl82Bfb/vNmlYV6Wl48SoSgt7ltbJ71E0CERkfaRHNwXQKqZ
         f3F5yu9TUA0CivU2u+j+pNGHYyeqB0grk4JGfBtkrQ5Ju6M9D4dv6wSMyLe3s/CY+O4U
         HEzD6UbQGnWIx8iQ2ZM6Uhr57jSEDFayarKt0ZnUOndZa/kDiWyAL+WbI+GKOxdM9B4p
         HV6g==
X-Forwarded-Encrypted: i=1; AKwUvByHCnVt+o4dX0AQCDKXgiFw6BbIzmQjqw7Fhuf6ZkkbG93lPoKjna5cxqV6/up/S/uJkIad4TqE8Jg0vv4=@vger.kernel.org
X-Gm-Message-State: AFuF++n4MU+4w4+XlzpVlOupUMEGNNurYUy8bbEFJsE121abqDgWvWwz
	TzbsiRJHWhG6Zi134XDj9FiD/ynHrxGuR7wNBnn0H42FW1HIjcItjXp46+nv3lS5tsQpIscVjFi
	Rt8L88nGBWa5OIBYJVxh8PTLBO3+HQwE=
X-Gm-Gg: AYBFou0pQQsw8Vnw3gYru7QTf46EYU5H4ZRoq50VEVbh/iP44VEtJrmKuYYStgJRBUr
	rlpMHgwW7yg3sOuajC1Z60qM2fc8Br0W/jtdJFzGwFyGkzNFREertqzkoexiVcbO0F3BtKldQbD
	6XIamrM9s+VT66Ucxjn+T1FApjcKd38nI5OCRSpoHMNx7WCwpl5eY4sT9AiPsh3Xyt/FxknpCac
	jDSL8K+Mm9S8uvcArLrAYgcWCH+d+axAiWWS/BBxYV4NUwUE8B+1gjp0s7xZdd91H4KY+eAJ5Ns
	KPQa/j8PfFW4PL8t8w4T7iYFFU7yktGbcK/lViE6HqVP7IjOhl5SwxIgEGsm1DXkWTuG/Loymlc
	olh+tUTXUWLoX0nJhBUo8Z/g6BPAmcdmLtjAzZCxj+Kyy45vFrSMJtrV2
X-Received: by 2002:a17:90b:5246:b0:39a:e983:d4bd with SMTP id
 98e67ed59e1d1-39b262a3cf7mr42316995a91.24.1788835897564; Mon, 07 Sep 2026
 19:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903073252.339250-4-phucduc.bui@gmail.com> <178880965548.219967.14368880612178322930@kernel.org>
In-Reply-To: <178880965548.219967.14368880612178322930@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 09:51:26 +0700
X-Gm-Features: AcwNN1VwiAbwrJcmq7TcgAi0rtpY-ROP8xxDPfs6JX1Nxzg7aEsWZmU4z3Xejgg
Message-ID: <CAABR9nFGduckDNRGBt0NHdSHNPo1pKD1PJbtpw1eUqL200LCdQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: xilinx: axienet: Fix IRQ error handling
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	horms@kernel.org, andre.przywara@arm.com, hancock@sedsystems.ca, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> - [High] Incomplete fix: the axistream-connected branch of
>   axienet_probe() still cannot request a probe retry, and this patch now=
=E2=80=A6
>

irq_of_parse_and_map() has always folded every failure into plain 0,
with no way to tell "not ready yet" from "malformed DT". Before this
patch, that 0 was already turned into a terminal -ENOMEM, not
-EPROBE_DEFER, so there was no retry path to begin with - this patch
doesn't remove one, it's a pre-existing API-level limitation.

> Pre-existing issues:
> - [Medium] DT binding and driver disagree on interrupt index ordering.
>

This is a pre-existing issue, unrelated to this patch. I'll keep this
patch's scope as is.
