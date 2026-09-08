Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008351A737
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881141; cv=pass; b=BmQ4Bqph6572+UlBcicncpKWOMYj4FggXYX+f50eU+QSl13iygwpwS5J3qmWxvK6XR/nZ1CfLIq3IqYpIMAOMRTWbzRigD2vykbCZzGhJFumcn5+lxsikZWR9TpHoesuOwrlQChzgKQGOUzNxxhXvC0izRnez8TNJJIB8u9xPDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881141; c=relaxed/simple;
	bh=t8WImo7+n9dGHNNYXwp0YcVyTAGR3nfBD1HSrw1H4DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfMu8rXaOo4COjKXuV5eWx/emRGOr52TPshQDsA3LGB4CzyOcHFJ+YXUa/oD5t62FZ3VdFBnDfckW+shQdwZ80vW4zo1j4Q4PW1ORO07DIsz6xh8i1iZ8kWdNW7Mgdzafb8yRSa6L/v9ET12s6dqTRR3olAPSzuCjQhwPoygqIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Ep4K5zJr; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Ep4K5zJr"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-86b03b75fecso72435257b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788881132; cv=none;
        d=google.com; s=arc-20260327;
        b=Azn0HXFroDSw19Rqfr4u8bmymdQJXyiTT/mD+r11IxJCOji85YsXVcO7PldjaL0exv
         EyQ+817xDmLsHLBHP8IaYzLia2EnLJB3TNBT/AJky4vsumCubjabtXDFa/+3jV+kiAAG
         o6u8Y6W3u1STBE6ovAqsWG9CRcM+REOoFOw5JJOaYkri7H+QANSLr/G4uPH6tahtMFWL
         YVyf6LP94pXW9VN0oXuP3/YSH22nbt8gI2Afm84XtpiUX1L1ZXWjjTrwPhquEvOxAfbW
         Var5j0m4v+8NpKzLjg0+/wSHMYwbaC6Yietb0Bobph0cbcemt+hkeOf+DSPPvL2YmT4B
         /HNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RwEMdhR+FDlWteOIcA0A0fiMGSIsY8o0hBxKa8vWjn4=;
        fh=zrkHwi5cladSGZ8ZfCWo9t7JGEUbUK4KO9N9JAM1RHk=;
        b=sCh/wIx9+6lP0zos00FCKlVBPfQfvwxfzQGBszCNkt24XqWN/P9kkFCBaEc3/0Kqcv
         b8aEJPL/GeUPBlS7ZxAWsbp54XvBykLYFQOGCN7m+7sAPNSCrB3Oe5ylpWz8xC+flzni
         +yIqfTp+bojGihtZTvMJTTKszNmCtFKYIWumHf8vDeJvE5PySafOQXuxYaBSBc64z+Ww
         Bdh2naVaewqAI1z3NyPllJKLi5KyKHsxwnF776FXGZnqyt3gnxkVubqiv2xWeG3oDc0B
         du6iMBAchk+jaICEzFVIdkaNFVP/Pvdzt4JhHtt/wo/D5QgxnsSAOUxbCNR/LatbAQEk
         6ZGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788881132; x=1789485932; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwEMdhR+FDlWteOIcA0A0fiMGSIsY8o0hBxKa8vWjn4=;
        b=Ep4K5zJrgqeywwGudHXAJoGRwWe1rx+4tlaK+D8EIvNrRAHzH7Rli5rtu/rfBvqWbA
         vqqEyQsJNNH/SF5NfIahTFM153sLAruHrQ79lQP836IzzF922nwlgQR1+J9jjsDga15I
         S2Z6IQYiDiI2T23vs2c8r26S9ozfWHh7T0+WOGmbx1Ia6Ud1mPaHkhb+D77tphm8NWeg
         5yNayhkdzP5ok8afn25YG4Ow/ILgG7V40y+K2xynsAQUGXuJwxjsbIHl+Eq2KLwHxoOI
         zaOs9zMVnKrfQ22OyX6FaZ9ZdehYD6EdOtE3wkvcmYzyCX2iPICIf3I2qGcYyR8BmEZw
         F6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881132; x=1789485932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwEMdhR+FDlWteOIcA0A0fiMGSIsY8o0hBxKa8vWjn4=;
        b=sG7Ek7hstYpTaYkh6A+Jk77ci5gJf3A0tPMWKImNUR6YnxJmTGVIPAvrwcYqa4wXmi
         gAkeS3r3iYvvUfbBkSIIcU7xLk8mXHEIOKvL0CFsrRUsnVSBDfj8iAYoxuyfSS6Hp9Ix
         uyM2Uwn3EzOAkILU/X9/b0KJHgEh0scnqP3gVRDyMfaP1Vxdpc7xwrCVMYriKfdxHTWx
         pEF1CVsGzAtHzpWh9DxEzazvhoizVCEGRy/NJBOAipKrGODVhWHf1Z6gOtv4Q38Y1DGT
         aRuw+k1HOJkr8J2HMeW+SjwK8fkzMiLL/3qRhPW5gIBZYJbtld4P5shvEL6B2bXyAc9k
         xzxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp5rnDMzVJaUae4ofcGI/xkIyO78wM5/cHKbKKr1r3Cl/0P+3TXUUi5IFZeech0jZqEoRcaS+dWiC5sw4=@vger.kernel.org
X-Gm-Message-State: AFuF++nNAvSz3Gqmi778jclPmLsfB3uZduSBeCTO4D3d4Ev0Igf1GAiS
	qlRUoDLKfIEkLjlM/ct5NSB0xStatI4drGc+BRtUctZu6Jf89CSadOtC7xJmtyrUJNNd8C6RyI+
	vltthqkIqyIgClMzFHYHN6HlbHOjQmjHdfl/K+E6VYbaTvvaAaMz5ajlqPiQ=
X-Gm-Gg: AYBFou2Lm560k4irx5AAriC1Gl1xshX4VU0YrE0nLxetyLcsLY138NgMSbDcPN7HhCM
	BrSK8WIcDqdP2Y7VLzGL+lDhwSZ/tY+LOZFmRBQDxNYBd9DNAYP693T6dy+nBil6pyyF7BcAARQ
	wcM3zyQ1KSzhsBdKmPC2dc5vy5UxB75QgqFvg0V1ATKdtUbWb1m59KEiX0CDQczWobrX26UfnmR
	0P898JjV17RhD78FiyZMK83PtYVBEzM+pr1o3OOZHMMou+cpe6OQ2U7oU3F4brJkDoy+9kqOmWd
	YR5kQ4L+WgvDjuF1LWGj5iAfHDbVWae4619qum5yEKSaffMyB9ybH1lz/4DJbXEC/W5KAz5gXyF
	BtTkUdeXqC5fZzCZYISggGjI6qBs2YTlo8n31T9AY0cwwVBnfF/wDSGkokBrbzmkK1gFW8L7jrQ
	M9I5Z9AMLQMx2i6nCfAcG2gigv94aazvHxFetG2S5w+Yr+kU4gviLLOoihAS4goP9yYeB1oKvg8
	9wL2xF/8k6ISp+SPkb7A1I0SsleE0JoBR1Aw1hV2r4ArJEfMc8kOWSwkxDM/+LezC2NehF0Majl
	TA==
X-Received: by 2002:a53:ac95:0:b0:668:43f8:a83a with SMTP id
 956f58d0204a3-66fc1b62c21mr6813732d50.15.1788881131797; Tue, 08 Sep 2026
 08:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904092719.534318-1-julius@bairaktaris.de> <20260904182346.2940a049@kernel.org>
In-Reply-To: <20260904182346.2940a049@kernel.org>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Tue, 8 Sep 2026 15:24:56 +0000
X-Gm-Features: AcwNN1Uxb4FTuLJKMrbi2XtU7zrpLGVjqqtccUjPX_JwkWYzN9-bh9N8pzPGpN8
Message-ID: <CAC1t37KdqVbSuKy5yR2OwKKTMDbQGNGzev_nHyhcndBKc3zFhg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: offer a flowtable to the switch
 before the conduit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"

Understood. Thanks!

Julius

Am Sa., 5. Sept. 2026 um 01:23 Uhr schrieb Jakub Kicinski <kuba@kernel.org>:
>
> On Fri,  4 Sep 2026 11:27:18 +0200 Julius Bairaktaris wrote:
> > Tested on IPQ8074 with an out-of-tree DSA switch driver that handles
> > TC_SETUP_FT (openwrt/openwrt#24806): three flowtable unbind/bind cycles,
> > hardware offload of routed flows after each.
>
> We don't accept patches without an in-tree user.
