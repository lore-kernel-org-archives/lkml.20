Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028327;
	b=PqTqNhER50KIl2KxUw/wUICtb/B/qj/IokwbhV7n2I61LOQt5pNIU7wBdlhtesSIQwsi
	 /HX6vjIjhooq/qxl5/wTGyTuD84yPl3RcbH9ODd4bCv2KTESTZesmDfG1cbux2lFTP7qJ
	 6/JJkwrSl22hfj4ieiFrW0l9cDFkUO8IUN7fc7qxeCEYfJrbJ4M1cCh9Q5o/M+H/7rYhh
	 Mo4PnrAlJyuTPHZorOS36vBSspKQnOA+/Cqh/v6kZqvBPyrsea4vVy6i/zvWJc94AvEeC
	 Mxnl5sULdTaRDH0MYEwDkj5mSOCcg0dexNkQGZtOlVpbwdqzNWuVXm9pFw2Xpd/fuIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028327;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2Qmg6BcXALG/dj9RRiDDchrevIVukXtgjlaBUO9hEDo=;
	b=2/UGluPHxN3L3HdQmVJOsPIlbBiAbCe4I3tnYyn9fE/vDG0ioxE3rJOaoL8uzau0jHDD
	 yLx1fd1O7HeA30YPnnqTDdwDFv1FhJwJ+AcROyfDljS+cog1kvRouu4UNTu6olFAIeR2+
	 /edJTutT+IRIuUqprxi3Wu51Va7SYU1H2nLjmLU39dAVfgl9glLlpT16zQiFw56cYf3hW
	 sPFBebDWhBMhtH9BAvnZRTbM7wH0ncedxdxsZNveaHw+dCrnZQTt8SElVmYOyJcdMIs/Y
	 GDAm+5BjTNie9AjYP+j54gb/mvDOxTlrdKWQkuVr3WQA47Ji6hxR3Mistb0cqkaI9FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZuEaLIO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MZuEaLIO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EA81F01828
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793028327;
	bh=2Qmg6BcXALG/dj9RRiDDchrevIVukXtgjlaBUO9hEDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MZuEaLIOAAbhvEk+XobWYQbcJbYFGOW5+7XlBCdzI+jTFM+8Wn85I7Ly5Fjerv3el
	 zbGqDVBOgTANr0EokwDZauiniCjDqh4Ppezuuy/J6/4UKectxpYkw1h6e0HGl5K6oz
	 PS7UfhJ66MCbKYnvXAKDRgGnkyM1HRWnpbs4Gr5IQWpkI7OcO+9JXx/RSh4MfOVPM9
	 +SEwiXEh9+Chmfa73VdnizH64uyGt9cNw39eftY23asUAW/kaGWhEXvEUoxFZamu0u
	 m6nyDKM8qA6eg6jslzJKO+r/eeXpQJbv9zIWonXPsdugXpYqRsGQQyKfuHe4mDPZsN
	 Zkz7fGEgP8LAw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so4687129a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:25:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz78ScAPjlPWOZYsAhkQTOuWvxtc0EYJWNFmkFd0QZashKqtrLejzvhxIeOCfVZvqCSTF2O/c+Yoc/Soe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM0qJyIa5tqw4F32TPEPBdcJq5hkL0/DlJdtA1K6WFOTlzBB26
	wLP6pmenh9oDux8R/5rl08S426z43kTwScq8YLgZvCYhzrQJ+GTbVxLi79RieOzPnqbtnkoZTFl
	FBK4r/H6DHDRrEuFngMBa30XLQI1XQw==
X-Received: by 2002:a05:6402:c4c2:20b0:6b3:dd6e:3dc8 with SMTP id
 4fb4d7f45d1cf-6b442ff000fmr5335746a12.37.1793028325770; Mon, 26 Oct 2026
 08:25:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831203137.1331960-1-robh@kernel.org>
In-Reply-To: <20260831203137.1331960-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 26 Oct 2026 10:25:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+FErjac-iqe+okjjqw9ZwR57w2zrVSt--8aTuegdsstQ@mail.gmail.com>
X-Gm-Features: AclHuK8Xogf33r4EIeunV6M14Tus6XobjgJHA1U-35PEmz2V5OwQO2qLgIk1tMk
Message-ID: <CAL_Jsq+FErjac-iqe+okjjqw9ZwR57w2zrVSt--8aTuegdsstQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: sii902x: Read "sil,i2s-data-lanes" as u32
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:32=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> The "sil,i2s-data-lanes" binding and in-tree DTS files use normal
> uint32 cells. Reading the array as u8 only works because the values are
> small, but it does not match the documented DT element size.
>
> Use the u32 array helper so the driver follows the binding. Changing to
> u32 increases a potential OOB access range due to using unchecked
> values, so add a check on the read values.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v3:
>  - Drop the WARN_ON.
>  - Combine checking the values with any other error parsing the DT
>    property. The exact DT error isn't important.
>
> v2:
>  - Add bounds check for property values as reported by sashiko
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Ping. Can I get an ack on this to apply it.

Rob
