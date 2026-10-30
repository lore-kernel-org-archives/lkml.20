Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330916;
	b=yTCwlQsQQt298RWQApeem8g6CpyVxv/Ctp683QTzH7kiDb24Lkpiurj7fC/ELkcgDL+T
	 v9N4BrUz5GhuqHpNQ+w64OHn4ggY+KnUktMtvr0MxZyjSsS16NWM38dgIDRdsnQPLZR9v
	 pGWkjYT+S4cVvDSJowx1yK7+k2i2QldNOXnzG3hDVHKkHCxU1PEgAmv9Ren9kucVD7EIA
	 a3pcIbvp82hf4yBJHP3cT2V5DvbkcmMtjGLS9XMablXsfP7gjGPgqTxju8C8uuwK0zsLQ
	 GI9Nb54kCuepnWOX+J0z0TcnewdP0QakpmC2IIvxelB3oolfyhlXScHr4IEJ+Frg+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rWkYmMxnln0QriqepcRyKjYwr9FnzCW7HaHhYlkwxYY=;
	b=KTR8ASKBFHpNMc6/n6AjJJQYPfok4k0e+emMVQU3WWb5NUDVAQooJr5kR0CoCr0WRQrK
	 1UK9E7EUZas8eW0vYSohPHXMNGLC5Drqpyn3RE/RU5HTYqGF0i3U3z65YN2dujuoqKJF6
	 bA/3W3aI8WW7qvGxubmM3pZIlWPP2TSQH9zE/P/4uWC/jA+ocgLrnUlLIrrxWD8NSYdq/
	 45gRKijAlT3PakhXEeZWZpAQytvvwP9+y78zi7yTkDKxG3z0U8xD/eXc2SNEBEr4PN5sY
	 LOdsYn8cc8ckEuYwngxRHRpxlZxyb3gCedgC/ZTgMMeciygwdU6aQK2u52GElcFh8/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kZGf6OgU;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kZGf6OgU
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso276055a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793330915; x=1793935715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rWkYmMxnln0QriqepcRyKjYwr9FnzCW7HaHhYlkwxYY=;
        b=kZGf6OgUQijTlvWT+N0FZ7YJ23W29i8U0gpsLHGluqCfC7E3qssRsUc93sxLXqovqB
         hRISUApklpOewj99H+uuRF+ApKCUWTYuy3TIsm/t7VmVqcrNqWviV3T6bO2HGZEJSDtg
         yNiJg7H0psZLps09nJ/xrUbiEh1HGnZD1bbss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330915; x=1793935715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWkYmMxnln0QriqepcRyKjYwr9FnzCW7HaHhYlkwxYY=;
        b=AbOkN+Wg+nkyBDBURkkrSTXSDfskyeyEHYwYc/rkYP/HXnP7UIqLi3oHrJOv4kcUXV
         v1T9wFpcDfEOJJ3/gRJpAaVolAFAnM2kByJcst9ya4+kMN+wHl9k/YN4VldSkvhb+0c4
         ciGTMC7oUUQL9gIENrJFUlqzPrK7ShE1xBjM+i1jXQ07gI8Xs91pB8Rk8MKEDTrtfe91
         PJIU7Nj2Aw9eG2lHzibt2O6QSie2+bVlboPCKHxnEmoxDeSJbpcE57CU69P5KEH0i9sB
         loWiMQWKL4dotzBTc//0iKWmT3hzay4VK+6/NGRqEBl9aTcVzE8Ty7trEL0KiqFFOt1E
         RLnw==
X-Forwarded-Encrypted: i=1; AKwUvBzksz51rqNgmRZw+tg0u4qVsxwZQPxM9yw4L5qX0s9CIsOTxoDANqT3sOnssLZQFCWHUG1+pdogNnsMKj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXPTnowwkoCY79lbGQ5aRakdEyNEweUr7Q+tcffv596F4f5C5A
	vk3vxNzryZhdukEAolVmio2QG7VU5yfLjWqBlf+798mUNWDcNuUTGWx/2OSxoffG5HuZTh62Yf7
	0FsG241Wi
X-Gm-Gg: AYBFou1dnM6uBdSnBr14viTFj/cUB0TCAuD5G6Y8ttutNjC7ixtkl6IL0n+kFM5hWf4
	HIGfOiGTSFklRf4HaI7qlI9yh+tsDvD06NosECZCf5t5QE6HfFZ52g7ybuSkZR/Nr52Suos5gp6
	7akCCoJMiJy4wSi/ohIunfltJtSmBwiXFLQjrT2QvpXsRr9K52MGFLHlztFVBmCFQtpKTYng4UK
	6yU4tn4pj+9N77LONzohojfnRWmPoYgcZjDs0exqlP66mvniHgtSajPSo0CHfgzqO+CgXcIoRJE
	GMc1Fwi5EX/abk7YGPnzXc36Hsz9+ZIJpYVILFfy0p1DGbAHfKeMpq+S1cJihi+bxxAw//aOawR
	elTcWSTBRMhL1yPG96DZJrTAKYCecl6ZHtGzi6UvwYA6hosAGaVVCvUikthoWqup0MfXq1tBRg1
	bpWb5ychR4xmupCg/glVrK/LF2tTHA/iNUjuBCecUz1ckYDrPHI1BRf81gFLZ3E2tS3JJEKsWqC
	4zgnMCzxqcZOkC3etyZdP5Vg4goBy3DGnmzGYodoYsqSRtCSH/WqyQNpS5pNxNcLZo958S2BFz9
	zcMLKFKKfcLn60Uk/uzOmL2r/my0ifk5tgJO+YwHdk6QxHqlNDLy6vglw2us61SMTUKp
X-Received: by 2002:a05:6402:223a:b0:6b1:827c:af27 with SMTP id 4fb4d7f45d1cf-6b4d42901d5mr377879a12.14.1793330914788;
        Thu, 29 Oct 2026 20:28:34 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b1b2ccsm195573a12.22.2026.10.29.20.28.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 20:28:34 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so228276f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:28:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3DtN+8pFJlIJ4VJIuE4nPVg0MIDBKVAjuMDXyUwbP1rEBRFdTdSzsTw+VCUaHXxDsbqZHygC+Qalcn1c=@vger.kernel.org
X-Received: by 2002:a5d:5d06:0:b0:48d:ff71:dd87 with SMTP id
 ffacd0b85a97d-48e6e303f29mr2500170f8f.17.1793330912385; Thu, 29 Oct 2026
 20:28:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014135028.1438841-1-hungen3108@gmail.com> <20261014135028.1438841-4-hungen3108@gmail.com>
In-Reply-To: <20261014135028.1438841-4-hungen3108@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 20:28:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYq56k7rPXi=or=8hE6Qgew_rc3D1EQv_HkJPYrZASZw@mail.gmail.com>
X-Gm-Features: AclHuK81q5phOMs5uB-cPB70ygA_ssYiwIff05SmM7x2BH5I86U5wIylX1DWaGs
Message-ID: <CAD=FV=VYq56k7rPXi=or=8hE6Qgew_rc3D1EQv_HkJPYrZASZw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: raydium-rm68200: Use multi-context helpers
 for init sequence
To: Hsieh Hung-En <hungen3108@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	jagan@amarulasolutions.com, osama.abdelkader@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 14, 2026 at 6:50=E2=80=AFAM Hsieh Hung-En <hungen3108@gmail.com=
> wrote:
>
> Replace the custom DCS write helpers with mipi_dsi_dcs_write_seq_multi()
> and mipi_dsi_dcs_write_var_seq_multi(), preserving individual DCS
> transactions for registers that do not support auto-increment.
>
> Previously, initialization failures were only logged, allowing prepare()
> to report success despite incomplete initialization. Share the
> multi-context with prepare() so that after the first failed write,
> subsequent DCS commands and delays are skipped, and the error is
> propagated to prepare().
>
> The new helpers log errors without rate limiting.
>
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c | 184 ++++++++----------
>  1 file changed, 80 insertions(+), 104 deletions(-)

This patch looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

It would also be nice to change the uppercase hex numbers (like 0xAB)
to lowercase (0xab), since Linux convension says they should be
lowercase. I wouldn't object to a v2 fixing that, but I won't insist.

To answer your question in the cover letter:

> Doug, do you think this fail-fast behavior is appropriate here, or
> would you prefer to preserve the existing best-effort initialization?

Yes, what you've done here is correct, in my opinion.
