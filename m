Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73CB3FA5FA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513415; cv=pass; b=ea+9VzCXyVFKyB+uLbLy8R46TEk43vcPKeF8F/S1KikSh30Xc5xpS0rDZ/e5/q3y083b/XZUO6BqvvoitMsYUbUT4QyW14k70ZgdJbmMIi+ICSN0Xd082d8M44Pzz49sRb71YFdTiFVC+NNVFZ6MVd3Yf1NkUaOgPzNaeVax7vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513415; c=relaxed/simple;
	bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kF2PC0SP87RYj6owG1opXqfB6fGvs2RuMV/EC4eKn5Uyydgp6hbwIxR8/0ZhoGYR/eLmP65PG82KTllsfW8DprcX6Vw8csnC/G8OsKacKDI45hE+o9KPkcWJBFAFj6UnMVeCuivZtP+Jjb4v76nCqyJaxd/RpHst4iXNvxLZnz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5aNv+MM; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5aNv+MM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-85c9a79590aso837333b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788513413; cv=none;
        d=google.com; s=arc-20260327;
        b=RIo6bkr4sRYTOeqcTWE6KwesB9Yi7AQgMquRmNfQw/u0NgnhDehDPQzOYm5FhclIju
         VVsdjzwI3RcFj4jGLZpAtjAV9VyhsLVAmWlvTgxFuEheGTfnI9UneoivPBLy+nvO6e20
         uqg2+du1z1533GxSyYLu/3q/xrH+zcLILOxT4Iu3iFWh7eyceqGbJ7Tg48isIdA7/8SF
         6/1g387wf5GryKWPewJGtgo/7V6v2qqWoTXlmJ1UTmPcpwffE47ZZHYF+Dxgku00kRYM
         N7Gcdmf0LiSIAXqZKnHWPXtk4VpjbcSbK4ocF58p5bWI7F1AJQK9H1y9Rll77xN6kYBv
         ZNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
        fh=bqid8o9Va3KAFZEbvour3ntMiAd5z4QCUYCRvH5XFek=;
        b=ff1ZmngAXESF3vNwkgmvDcK6I975NWpkpxm8ZAXlfTnkE/yD/16avHtKbZp+6raNxD
         ezMeZEU8YJfysvtME0lYi1FTdyecAJQLPRoXcIX+ryrHiYmg5HqWqjAYhuB9212lgJYI
         Ct+C58ucHFoKbeFu9uqEUNTvSNWMctoa6FkiOmY6X3Ay98+MeIesZ2a4Q95dkZWD4x4v
         NojjEiCDKl7DBdXo036eCE1AnEvtgaFtz/f7pAbY1nkMlosqQqtNiVhCiW61i/6jB46Y
         srveWQhRqEsNtTJaKDjxo+8Z2RWdcD6Cp2iROk6u1ItwTuhfxNvdhqcVI6bFLypQz913
         OdtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513413; x=1789118213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
        b=d5aNv+MMj6WJx+K5xCoriHMX5Yz0Vmiwo7OOyL/GTP0Mqx+RKxBhDy/8UbqSKeZ48D
         08WfOVOqW8C9c96LpO3x2u7VUy4imfnuhzFYhUz1q/Qxk+pXY2ypkDYoVYGV5VZzCmAh
         MVAJbPrqbYWLLlrFCFUlTYX7nwC7NR6MZWqLl7L1S2PcJbr75NxECcGUlKROsosz5DQ4
         bWDYsTjSQnQoi0zN0YQ/B3invtckJL5XXge07DArMdEBRY6P91CZvrmYcPMZ/zZuMqV7
         I9vJEAJ/cIOVgX01YgVe/7AWIMsfOKVQujGVWrXMPuuoXRjSK/HQy6yG/Oc4/g7IA1pv
         XFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513413; x=1789118213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U13rcRq5LNpQ6vBXGnXyY3FhirpLd2dEbsFMBIDdyT0=;
        b=Yol6qb16vUvxGxxu1RLQ45HzCcIyXRMRozACKAkCGP7toSggyVVvPPVftbDjoAtCoq
         8MHk6IobdMiQDWWOYnqohVQPQJe0tfoPxSRyesNvfKdMAg+RTzoB3eqJtKXkHXg/77Dj
         mKBPLZK3kHnezzssmAYkUVPQLmFYzyq/qQ6H3eONe5uYkGGvHC78gLVn9ZmL0RMu00fA
         LJphTC5K/8GzXUKwii7jv5UeAFIvT1GHCkzyDe5Tq7uYQwAfQzvNl9RuRQvrDt8UMZGs
         7c+426cWTefWNSymv1Jz6/q2W3pYrmTwNJVQy7CkmBsO6CLA9xwXI09MB0lFmziqqxSM
         Ui9w==
X-Forwarded-Encrypted: i=1; AKwUvBwaZPGYZt6RBvxjW+5ccxvnzmfJpwALkg9ZIsQJNPZ5bVwDX5On+6Bag44F79WhR4g01YU7Tdexpvt+SLY=@vger.kernel.org
X-Gm-Message-State: AFuF++mZpt4ngW+jyBiQs1OOlDnDmDdGMlMVELUKot18ZvmOkAh3Rty4
	Ac6lnlnftKmqhgVQEsN1kVxLDjt6nNBDft/StmvDQnRFsRNlPPrJwH1yxKVeKcjC0uNbpVZcRSf
	EIAtZL1+XKCuLEedcz6XGHXsY8g2BHu3qLXqg
X-Gm-Gg: AYBFou33S3Hz8Th2JPzr7+llrjCEI5Uz8VLQNQI4JaPs9QPWx07Yjum9nM6O8FBAwBk
	cHcJGo61rlvJDKFGFrnYrLK/0yPGStxgC3Qw65cxDVx3QbjMVKmgtmjrIcwC6kKOeKcMEFsE2j4
	wjwTyH+EmTko6W5lK9ESHtl6kXYHPTjUSEqneprfJYEWWIAtuUK1a4hwsb28r0qoqQ8Tk7Y92i8
	RyAmrr2BValgr+zh/hz12syQabJ3FPaNwm+CxQP/418OSdVhvL7LhLlN4JAaA8v3N4yUBjkbIBh
	kMk/QI52k4ffGXH9yTz3SG6GoyPuQniHqaTsiGsN0bPjlk1pATAh5hn/TuXMZ6GjY/hgRQegDip
	hqBK6KdN2RyAXyMHIORxxyQiLbTedZwD9XdGc927IrVLF0/54cL6aya85
X-Received: by 2002:a05:6a00:1910:b0:853:5152:a3e9 with SMTP id
 d2e1a72fcca58-861692844b3mr6680817b3a.11.1788513413233; Fri, 04 Sep 2026
 02:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
 <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com>
 <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFi06-7=uHmOBFGZv1eUYCskv8WspOdUxbDuQ6vMk68Dg@mail.gmail.com> <GV2PR04MB117399ABD55B1D65AAB8EA42E88B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB117399ABD55B1D65AAB8EA42E88B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 16:16:41 +0700
X-Gm-Features: AcwNN1UyZz0SrSd2LGz8BgfAH26qtAAWc51dgQLrq8UzEPhnn0559XUUTa1qyZ0
Message-ID: <CAABR9nGSi5mty-4AQv_vYz0yqCKE5ALh8ZC7bcFnY99VBfq_CA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wei,

Thanks for the clarification.

>
> It is a potential issue, so the target tree should be net.
>

I will retarget the patch to the net tree and resend it.

Best regards,
Phuc
