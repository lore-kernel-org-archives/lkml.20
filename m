Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180883;
	b=f1RAqATR/eIrFl8nPsFv8hND/3Xr5murTVpvsBr4JToc62NH25sG5oUkPCwqjYlgOFHc
	 162cchQK3CYOggfFKqw1uLY/+dd+YjPVZCmDwOnc6ZEkuaYB6/gSZqevLCUP1f8HlDPKZ
	 4n+epa0dhnqUfeYxfLWfPvQGbShwGGfkWOMB8y4pwITL6FmC5LNPVoyEvhG0kBILt64Cf
	 /FopD9FJ9xfj3pey0wVUdCH+fbCPwx4pNWL/tsNZs+chxgFjAqEOWP+Qp2i5XjUgof/ux
	 2UOslGRCBHsUwrR9u/27V5iu6335aJNbVY3TTRonlq5OAfvo6IONwa157QHSPLe7EpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
	b=xvuSHRskeNzdS/LrmiPmn6TeI2+Jqg8UqrHpeOyeEzWcTfmBmObJvD1gEtMibvVN6hIS
	 EfgF4f7xbTalc1PgCcmkeBA24nBcpC0Cqefevo56vDeT431vKnmkBBqwtV6F04Pu3VIiz
	 Dxhfd0Gh9FQ7nH2cdqQP1i7A83dhUWytgSJRxTnx3Wk3OW0BieRn9laKu8RRnQaCPKp2l
	 jivhajtcKh28slv+fcC6gDpVhcuYEeWjupK6logml1vSuY4Ve4OIPW9gfaYuhoHR+CaXq
	 tXk+P87+Ezr3uYpAQgfn/VARJlmvKpEnfe7Th6ni81BepkBulUVx5DOWYcO/NRnhReQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJw6mAzl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D8606A325
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7D8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJw6mAzl
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e30c26a4so297057666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180881; cv=none;
        d=google.com; s=arc-20260327;
        b=itDgxffIXBVmVn4G0JqOzER3xhhBbfgnYA1PWFJZkYDrGFSOk3U2YWNVBNzWXY4C1a
         k0m3bHmoUx/39IDFma0EqaiAPtYoMK0c7tgR4OQZUVTjcOC0w4mR6El/6gfmp7ccbwhX
         mlLWVweS+6E9mEEBCNtHq5GpTvQ6Q/UvoJQX1PUMjgvt6o4adjRPISPu59D7XKLn17Eb
         Iscp+/q0ZHdl3LDM2EvQY0lOVqiXBoOATtCkSgH6PpK6fmHIMVj6YtjzVgzMnB6B9niP
         O7yCR3Pwgle2T5XitR4NH9nItqmukOE+G8pt3uA4WBImr16wpGOM2RZf+zMruq7VyPue
         Dr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        fh=Ol/OmYrMAhcdkkJ3yAKit5L2H9NX37LFpYWTWKKM1LY=;
        b=D9dV+BWziKjm2XVHOFnDMEYCrTSJ0NQ2sxSF6Ek9YhWj0lAC2X8LPdxxSGIhSICJ3i
         93hKPXy8VCigD0RPY8S7Vh4T9FTdqKc73VbQFL0moCqJL9bgYFKrEnIaORjq8LBQQYRa
         xzgEP/doNV7H7D4BmX1K7qCtfqCMbOvyeY0uR4LzQ44aGHTg2qoeXwtgQ1lnyACIWRkz
         pBtw4YAXAehUHfYRAh2KsKvvvbzoiJqtbq+pUbI3giTBuWb1hzzUyb/mN9zjvECrcWAN
         zuRXcLBqbwgaIRAvNy6ZICedM5FjtHLflxa9P6s8bSvtMiaGqalzX6wOFpaVxtvap0Ov
         iEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180881; x=1793785681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=zJw6mAzldYFqYZzdqrK5sVCjCWQPQmTep1dLeDCOodLgldWlrkclOGlwaZnjuK1Oum
         TPJIIs//JWN7qNyOHlCsUAdJNutM2b52i0HJOialjxTrWs4keZvZmw3BRcoJU4Awqzjr
         WT7ZIhJrd4c9JQzrTY2yU8wr3bsllD1F4CAiDQBfntXs5r47SzlK8X0ezxzisTf0fyLH
         V2m79FTBz5/Q8KkYGms7kGw/9UPrH+YveHnhAh0ujkqjlAJ55dCcMHh8t8hYyve2EZ4W
         CPhdOdeH9FP4wI1+y2tqcuYKKYhDPN/HKsHrz7f0EKP2g/ydwoE9hgBJKjkE88fNdPU0
         JRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180881; x=1793785681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=syDNKvOgriaarQ+PO0xfSo6hgJ5q/EyLx6WQpCvBZ2dHUDNfk6MhDr1S2kqiTyjiVn
         WrROqD9TVEt8dIn7TwqLV5ajmpawuOk0//22WDbsRCiaKZzZtBFsc2qhhS9y8IbFQbao
         87JC2XhV6BSnmqpBne8xed/2SB7EhOZXJyFGpU5lX/r3O5Iw09/7iVcObMrxQnYEJNU8
         y2NC+9Q/1hleuKeYnncj0xLs0iBkLmBKJjxttGjYdkCOWuIAksvM8SpzuCtbclqT48MU
         8vEo9aYpITa7KeFHEOv+V1NYZBGYV1FDqxa16cpuqmPhTu3iaFtGFqzKwej08looPB5I
         Nkzw==
X-Forwarded-Encrypted: i=1; AKwUvBxRq45mSs809NH7kGbH6TmQG+cX5a8wHaxDLGPSgHK0yOLG3H8OLG6F5tdCZUBlDJm/19Kkvc57MzdGxWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbuk4SsYG7XejQtDYVUOxOh7lRtxm/tV5W/T5fTm6aLW9DQavQ
	ql04v/7xtarEg89BrZ4BeiIc7RvWN/oFIKdv1Ke03FL6VKQTOBFMcTNH4sRpHobSILZ8uc1smzl
	YbrP6JCpofFzJnbkYuia0T6IC0MoKORI=
X-Gm-Gg: AYBFou17X7z1tgcs3HpkO6uQ9rxYU/Nt0r5DQlLJsEB2Jk7KsL+bNwDQJdahNY5GNhA
	4MC8qdB+rlJX7GVo+AHmlP4KBrlN3TibYcxINiEqxfO8YyOPWMBTizffI/tsPF9FzjOGphYi6MN
	hmPO8YDA2CQD8E21Cf5PBFQjlTWAiLsgetRGWrwX/Zkqrrd4iKfQE2ZdMKMyj4B/9Q1M/oWlRj0
	neaBuGMzeDx5ib24QnMW5h78y32aBCkb2htTlr557m+bHu7vCcgPxgheuYfilzLhuHrB0WsLdf7
	qReKhsKZlfrgf65aG8cTNF2ZnptORh/LiHaZ+QMa3w4KSpS74K5WYB83VQmLaKmjw9INHwk0iho
	Eu1PtzLMvHUTtUx2p4rNxLEqeCwRjpR8bD1YXU1FbnYF3xX8p3QyuN62BHynjBxTo0Y+pkUteM5
	ihOJ4gp2B6UvIeB9JFvS3FZcXezH69u1NPOukTQd/PczQpkd4KqTvojMo2xPLaVRxMCYGByeV2n
	WTskQsHgwAnkRlSWC5Z6/Yrwg==
X-Received: by 2002:a17:907:86a5:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c49c6357d34mr69949566b.18.1793180881026; Wed, 28 Oct 2026
 02:48:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:47:24 +0200
X-Gm-Features: AclHuK-8N84O0Y9k-BLOPVpeywTja7886uZe3ugxN4eM-96m__IvC7bzZgS0MkU
Message-ID: <CAHp75Vedr5J1WJMrAkBjRSLKA_zf1kt3GD6UhjzLcy9vowxnaA@mail.gmail.com>
Subject: Re: [PATCH 03/10] lib/list_sort: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.
>
> Add spaces after the commas in the __nonnull_args() argument list to
> follow the usual coding style (according to checkpatch).

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
