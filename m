Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870350;
	b=zG5lG97g50brVKML/xbqb9shPHeDes167ddsT8mPUjeXudF3dF/zKkoypPKT0GO1+5Mk
	 7dU/ocqNcqjfxYSXY6PU0JxEnsXnVCrwISEfr+my26zMf6ATjWr5E3R4K8aDDP+j384OL
	 0Jsx6GDRKHwb8qJwAX4Roi10b46VD3PoLgnMUJ2NPLoTwaUNhdwIPfMWLncWg6uTBzwGK
	 Im/WlSwFJFTvqPxRtslitdVP7LjG1bq2OCqHJRziY47qw59OGyS6AJlC91QLWiPt4Wy/F
	 fTzfQDJ9OSkeAAaIPxuyZSkfB3btmFr6Os+rdSkvMUFN3tgLZhOoWVxu3vYGsTwYfuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870350;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4iB3l+nANELB6PJ3BfIsvhn+F1Wqb6s+BqDllbjxY54=;
	b=2+qRCteDMpHDhVAePUg7WO3ff+d1rrz2sqTS98IJmORDOVGyo7gj5MKvksg3828TEr35
	 2qFXqugJLdm0CxfIWzh1xdFyW6klHYy09pZT24Ma56DVpuutCo8iH49kOW+AQJGmWZkP1
	 7WQLOFepqsyjwCZHmVLq5aJrzxXGOeL4/4jPAiPIJpk9udV5PPIaquwbLhZQFSjqTi5Mn
	 XAtjqDLa258cjGMhwGXStLGxWtDLECqysm1uGkponkxZ2BNftDDlr/6i+yWe2KBhFzwK7
	 dYZiz5Kdvkt0lbOjZWapsv/Kdwk/QtSnIyv3Kckpi7iCJYH3XofIaAryTKx6czFlWvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzQhbmRs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85AD606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzQhbmRs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9756B1F00919
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870349;
	bh=4iB3l+nANELB6PJ3BfIsvhn+F1Wqb6s+BqDllbjxY54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jzQhbmRs4nW7SN91lZ4bHzkhB9gbcfEFIJGBRGL/Dd48DFH3hgJ4eN23pcpcvxXwD
	 3aU+rMr5QZGCsLp73pPsYAvF3ruecWluggOy5o5uezkMrR3J8gnZeja9ilUHsWJcdI
	 EinNoJOniFTrolIuejrSWc1t9uYQGNFwB/V9jKm6ORQtSnKkwjlHBA/cvO5401PC5P
	 lZ6s+TvzMtiYgfOk6PclBeTBc+FxSsiaC4oS7NB+9T72PnMUIwLBm1NZLznlTL+lRK
	 d9pkf0keuuD+rG7nwIaqaW3gwdrJW8XwTqC0MkkTiS+uMAAb/1s8R16skm5+Tf2B9Z
	 bucl88LT1maqw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfa686881fso1288719e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:19:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwmUvrnWCwP2PeCWUkMMQkkFzLhQcX8xnopSoD2Rwzs6ybbxdrM9jXnzsczhrdUdHxGoOhgQTC816nxIpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OLf5Qw/Ar+AsWPvqRMmfbEy8eua1uBOHD1guNST5XMe67woRv
	tEKX+45AUniv9w6jevrQProNxrjqEucoPVw56kg0u0gZmL8eR3aHtCfV4hsDqpR/DvkG5WEveFO
	PtaMnEyr52DdAyFGlnNmJIVzWZUGY/Q4=
X-Received: by 2002:a05:6512:15a0:b0:5bf:c045:964a with SMTP id
 2adb3069b0e04-5bfd957b6bamr6675117e87.18.1793870348384; Thu, 05 Nov 2026
 01:19:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <08611959-c555-46d9-8e7e-20b85d0c4056@yahoo.com> <5f0dd56f-b6e0-4341-853d-6ac69632350a@yahoo.com>
In-Reply-To: <5f0dd56f-b6e0-4341-853d-6ac69632350a@yahoo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:18:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvkF4JokBx9LcwaEX_F0rhAjGMCQ8-UQ1gZ94tdSh4Vg@mail.gmail.com>
X-Gm-Features: AclHuK_0OCgFWn8ghSua9Xl4cgQv6m1ahyj_OtFwTzjPu2Tjz7Zo_YE5wbnRMxs
Message-ID: <CAD++jLmvkF4JokBx9LcwaEX_F0rhAjGMCQ8-UQ1gZ94tdSh4Vg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 10/11] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, linux@armlinux.org.uk, 
	luizluca@gmail.com, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 12:36=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo.c=
om> wrote:

> The L2 lookup table on family D switches (e.g. RTL8367S-VB) differs
> from family C in ways that make the current FDB/MDB code misbehave:
>
>  - An L2 entry is 5 words instead of 6, with a different field layout
>    in words 3 and 4 (port, age, static and multicast member bits).
>  - There is no EFID and no per-bridge FDB isolation. The register at
>    0x0A32, used as the per-port EFID register on family C, is the LUT
>    aging timer on family D, so writing an EFID there corrupts it.
>  - In the table access interface, the SPA field is 3 bits wide and the
>    address register is 12 bits wide, with no address extension bit.
>  - Only ports 0..7 are present in the LUT and there is no
>    FLUSH_PORT_EXT register.
>
> Teach the table and L2 code about these differences, selecting the
> layout at runtime with rtl8365mb_is_d(). Family C behavior is
> unchanged.
>
> Specifically:
>
>  - rtl8365mb_table: use the family D port mask and address width, and
>    read the hit address from status bits [11:0].
>  - rtl8365mb_l2: add family D unicast/multicast entry (de)serializers
>    and dispatch to them from the rtl8365mb_l2_*() helpers, pass the
>    proper entry size to the table layer, reject ports above 7, report
>    SVL (FID) entries with VID 0. Use age 6 for static unicast entries
>    as the vendor code does, and look an entry up before deleting it so
>    that a missing entry is not allocated by the delete.
>  - rtl8365mb_main: make port_set_efid() a no-op on family D, add a LUT
>    init step that clears IPMC_HASH and BCAM_DISABLE and programs the
>    aging timer, and do not advertise fdb_isolation or
>    max_num_bridges. Traffic between bridges is then isolated by the
>    port isolation masks only.
>
> Register layouts were taken from the family D register description;
> the code itself is an independent implementation.
>
> No chip uses family D before the last patch of the series, so this code
> is unreachable until then.
>
> Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
