Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484507;
	b=EFDCasCSdGbDUWu1zCB0/dWieupAgUBT/gnGNd9tXuSC5/b8QXM/pKtojqa5Wv5J7ZCs
	 MvxTKx3XKiI/7DIQsnAGqWNsmCBjzF4D/0VnnCcXCOuS9v2Cz2ROCkr04oDexjCnFRxac
	 s51vfuLGWsjVMzAJJI7HiqLC3Oy9vW+dhbnqYRS7LaGjEFr2A0bhX+mWx7BAB7EMwuho5
	 /nwzQfyYBWY74HeDn8o7MPwXnwJESWJebkUrqrwcnvCDGgmf49VN7aaMDp57MDzsZX9sZ
	 8lQ3by2fvymfSXG7WCf2vlL0hTlv4I3snXKz6ovTPPJKBLd6G7pTdqt0pJfR293CS8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
	b=BBbQS+e7+1F2fDKigPLkWi5X6YwhL4QL2Xo27PVHR+Bgp0Ry7mc7MIJZd6biP46bTQg1
	 Dn2Vj9ZlSbU7QKA6IO1B4sAz2vyhyyQpcYG2BZB/wkLnB4oxdNgmXzLgUQa83WaBEx0ZL
	 Ly0bdbZ3iNEIs/qHUuaYtoZnHhPSOg3T/lEASHeB03eH4PwCIBzjTRz/u1XSsRYZBElhz
	 NvbzzE8XtyKNka5ZBAw1kGXfzazjArEy8HoTBQDR4NR/yu2b4eNPqqmovJqkOdmICY4so
	 vxbgvfOPADjRaShmIneQwO075o2HJQcRKcN+2bvPhib5Nzl88G647g0F7JqG5gY6UiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O0fzRnoe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3998606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3998606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O0fzRnoe
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so2508440a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792484506; cv=none;
        d=google.com; s=arc-20260327;
        b=B2yWaI145RI9U4DLjp3NVeW3Q+tDEJJTiCgEMvIzw1B86emMs5xf/31ZZWTG+it98e
         MK7Y2OHm/WeASDQylBMu9QATisB0MmDXWMjbB6TpoRfZUz9sR/MWKyYEOy/kQI17ne50
         1tn+IE0RdwXW14bY4yZw6aZySQ4QCy4ok+B34G/EAwor/SFH3/ta60iffEOaI2vZXyEp
         p705edM0VZP0WtXMnKsyBw+Lvv0YXIvsqchEgHCbjwoaL+ktogVzNmnAA7ooUgWQ8la1
         R+mbYy6xXQ+IMJP3RrkIg7x89w7uK/K5c6BYOjklDMZPTZkXX2cILyhhNcxEq2FXom4A
         Pimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
        fh=p/T9XFG9P4aq6y4sGHf3fmiiQz5FdQ47jpXrtzEYsZg=;
        b=WW7dexyQbhexT5qpUv7QlpGkKQPCEv/+HajxGZs1mDO1FANVfGWipRVBjlx2iIa3Oj
         VJs8mlFoFwnHmplzBiV29HUt/lAmaPoedYGAYfkgHWX3z//VdDLdJoWiAu4Ygny9AaQS
         2UnZ26ARxPyadx4MVfLtY+BPznbV5l8SJXQSA/ITm/ulASPmDXiSRz/F+mb4MZQwQDtD
         rNl1K78mDklejcMaS+xuB+P4znJHZiA7edtMSBV/R/deNdNkeJeaDWAbRTv52U9W+wQj
         lllRLJWzLc8VM/7t58/5ENrPlggDt6s971B0AQwnCLcRy7abkRDmGsBBdYv3+/+udXIk
         Vd9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792484506; x=1793089306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
        b=O0fzRnoeVxfQbQIYUo7PeUK+SRH4bVQ+dJAQOjiPcpswyJ8YUvQCFvZrS2BImII5DJ
         SSiQXUnw3wnHjbHaSgjLXKBiw7o5RovbadDG9K6GYYtV6uZiPlzNO3ivfRxG11jj/kCc
         zmtBHMZHJ37bR/RrrqWe9KMsqXvXg29muDYIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484506; x=1793089306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TrZi46+bzFzU9yGi+5LBKjzX2gZ2wzymm4R8mV+ebE=;
        b=X9jL3MEKuLsboIZGt5qK3fzeViYkV3hN7fWGXRVu0zF9qjYhEGGmzPL1uEU6B9bXFY
         XA50oGGNrjVe0Y2JA71sx7huZojCLVJ6anHaoSIDl2KPfG0+2rIywq+KfeAf1KzSC9el
         HuddbcqtWxLgXU5QCNnkiyvmi3HeaoSKyNT1Uq8LY1Q4lbwwa5fBsY5ANoob1ixXhuRc
         j0Qk6EtpVSa9spEC/mGnLAsF4jptGKyuWFZHOtGij1+/b70GPw3mTzgOey/T8qJdr3hw
         9ARultshHvJChwApVGkAwIGouZpBekpchpeY3IFtK8bL7bqVuvF0lZ8BuOjmZzZJXZZZ
         kE+g==
X-Forwarded-Encrypted: i=1; AKwUvBzNId2rMngYEolZa4tVMOO1qSeQJjN79JTGU53vVkocrEtwFTKHluo8qeK5J8+DRQrvkQSd6LxsbaTtnRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2JagbdfIg3sN2I5eLGB+nrlC++1apoZTdqjXc/F3opZ7Aa/Xr
	XfOCHRhL+O9vbDycfuqQpo37qrA4qqmaetn7ew2sbmqGzrV8p2ehtOnCpPTjlWCTSHCOUNWDbcy
	/8aw4MM1IY7okmxX/c3qSQxUmuvJLU/CBOMAhAqQS
X-Gm-Gg: AYBFou2olnAHYYacnWv4KMR5uMNlYmzonly6d6dEe6QJ1udvHeYh5OA+lukxnlr1tt6
	jNaSEMyGwf4QU/R6dg1U2iszNXyVE2azALqJNi+XRvdNPXlswkOeFjO6vVSWZ6T+MFHkPi/t7I2
	D+0eNOO+aUf6Q88SSkS7pRx6/KTRbOGfyOTX7yFidcDcZNmk/UoyZv9j10sSHKs6KuWc9wAc3hB
	63yINAheAXEsHviw5XxaCgFWEAZmifoVp0vxijFbY7XIgYjtwZJ6RhxHEoeqbJPMym+0W0D7GoX
	9gsN3BvotKEuIaVJJ7Xu/nNh9rwTyrDjYPiQ0NYACZV2pRhf3XIoYTSuv0088+Vutq1MZr+u/Lu
	cKzFn2zs/Wehj8g==
X-Received: by 2002:a17:90b:3d48:b0:3ac:9df3:6b07 with SMTP id
 98e67ed59e1d1-3acef0c8753mr8694175a91.24.1792484506389; Tue, 20 Oct 2026
 01:21:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018023438.3902617-1-mhun512@gmail.com>
In-Reply-To: <20261018023438.3902617-1-mhun512@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 20 Oct 2026 10:21:35 +0200
X-Gm-Features: AclHuK9Cw9XpcnOw9Jqd7JDgzHfajpSJvRQRnH2xODkxZsXKOnuVOr2__XvG8-k
Message-ID: <CAMMMRMcBT1TgmOYyYO8dJsLsdzqBiyUU4=S7XzE2zhYh_hpP_A@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_typec: Stop altmode work
 during partner removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:34=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
> responses to partner drivers. Partner altmode unregistration does not
> drain this work, so it can run while the partner driver is being removed
> and access released driver data.
>
> Look up the corresponding port altmode with typec_altmode_get_partner()
> and disable its work before unregistering the partner altmode. Keep the
> work disabled while the partner driver is removed, then clear pending
> response and DP status state before re-enabling it for a new connection.
> Use the same cleanup when list-node allocation fails after registering
> an altmode.
>
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
>
> Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Tested-by: Andrei Kuchynski <akuchynski@chromium.org>
---
> +void cros_typec_enable_altmode(const struct typec_altmode *alt, bool ena=
ble)
> +{
> +       struct cros_typec_altmode_data *adata =3D dev_get_drvdata(&alt->d=
ev);
> +       struct cros_typec_dp_data *dp_data;
> +
> +       /* An altmode without its optional implementation has no work. */
> +       if (!adata)
> +               return;
> +
> +       if (!enable) {
> +               disable_work_sync(&adata->work);
> +               return;
> +       }
> +
> +       mutex_lock(&adata->lock);

That won't be necessary, as there is no activity at the moment.

Thanks,
Andrei
