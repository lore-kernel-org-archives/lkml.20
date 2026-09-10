Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D875355048
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011481; cv=pass; b=Mq9liQAQ/3LUTihgENGkEWySBP8JHr8/cksQ1SmIlh14ncvwZ65YtQFNNysK23FNALjM1aqL6+AqxwVPGDGUgdO4ywytMOGv2uSW6FRwQKy4ATsL3W6CYDgHIc9OJGxLFIQJacHesuhNyrEcKZkwmbH6bL81ExcxI05PWkALA1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011481; c=relaxed/simple;
	bh=WVugDbv7ZX0IU+zDPoow8D0UiVs389UElI4gBI6b4QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baNKdxSQF0EWbm2bxfxsbIZZqzqOXCuJgxEZjAYOhowHYk8Uh87wfhkoMP3ajMSzBvtna25dZS88KKVAm5Pv+iUSNHC+LSab8EZYcEAGUVRLFM44h+0Jca//xM+KCYXW7t0DE/IpZA3UQ4i03BnFQ0jBHFBdFBG7mZwyjuEz150=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VSBxbjul; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VSBxbjul"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66fcf87897fso6032927d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011478; cv=none;
        d=google.com; s=arc-20260327;
        b=JLok1B+T2vcejM3mES4UUCuGhHLc9Q3CjxDpWTVTvi4xumDa9FagjV15unG3e1a+jR
         KUv9JfxInzM4kTnrX93TIcdfEvL/TOV0gFH9rmWBj5H++x2mn9KiLyZYRKt99mJlr2Dc
         RWwm9+posDmaynH0kO4GVt3J32XrkUB1J1UWfVfHy65nVdGf5yp7Hh4dr+cbUe9FuhWT
         l3ljHSwjoqhwNhUALEamFUJe55wpixuAMeF0LwVSLbVNxaTKqKjkiqk2q2kZAgbzmiO/
         VxCzSYCDXELMzj2p5b8YVqPKsbcHNkZP38xBmQkrgJ3H5an4DcGx1xXuNKlVVMR1AiOR
         MLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        fh=absc/wWk409J+57ODdwyayFEIGQkoTM/CMPJJ98Y8LI=;
        b=RkIW1usp1L4niehhMpEhIbi92JdGgvn0cjnzJ0HLIiuCPiP9YTerGZykSS4ZTREQ9t
         PgSYXRCWktGIS7iexpVbD+CQIdoaAf/fFOfy+kmcOUav5SGZmxccdu4hm5y+IVwcdPP9
         /NZcjtqpd3MZZCPLQk0IRHJgolUGsnl6rFhjGIF52qQQFtQ9xUIztddiug6rsA53HUDK
         LVdCCQhnu/RInNpo0iwxbL9KbULKIqKPwhvsyvtLpmqWTwFSg3w32pOTVYGmR40cmbYq
         ct8pEa9nUgfqjHS9P10R4xv9JQo4/5exRmDspu6XvCHSHJxz5CNU+bLYd4bETLX/ey5S
         KT/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789011478; x=1789616278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=VSBxbjulj124IoBqzITXz5MX+bcYiDXV+R6P9MYmxZVINONqCB10LqjK7QZW8fqI6E
         lMLKVmvj5Cz3rKpkWViOxg5WaWr7rJLtwqeMw35B4+t0CC6iQst4eVBk4YcqAAK/Bpk2
         q+dbBjYCEAwz76zDMxaEMDaMRJ/blvyGGuKVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011478; x=1789616278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvJiCgX3BpdJe3s12OP/yBUKE0PHp9qk9pkbDTxdTfA=;
        b=jVQvNWXFzVXK0ASGLrBfFRQyPtarwb80d/tJLo0HeyqpDMDI2uGNJKcL7NPUng/dQA
         Ddg2Lxc8VutKmbX5PxO/VcTr8im8Nbq0OlJRaCVj1oysK1TAKhYBmeqVFmziHxO4D2VK
         UKjhjne020Wi6XqlUxE4BDGpXie1eY3K2PPHPEBLbncEqqu+UfzJEJYJ5yXSwTozpd/t
         aKQXg8sGyAUgcD9B1vBN5eTZoWCD+FE4iFVQhBSTXFhmLEhQFe+Zuf0dx9shC6e+6Gdg
         byBwZk5G+neLF5CZMG6SLYhUKJMLJ3xJci03AJXgtr6KJR+C1lp9qe7BIN++8J8ZqwNu
         F7cA==
X-Forwarded-Encrypted: i=1; AKwUvBzIP/2nPvk3HTt2CBnnbdWrCzc/P5zYpyc1Vgg8FROGA1Wm6zzwt9PVefnQ/EpJlVTto3bn6Ev3sqmtk3M=@vger.kernel.org
X-Gm-Message-State: AFuF++lfi7AhVITpBSMp1vjdMTvmwQb2t99zG3vTrHkacnJS9KyM7qFE
	13sxDSfg35KxBopVIJo2Jb4p6vNKiw4VunrH6J9aytzEWK58LYQQWDA85hbb8BVlXAhfHgPoPxe
	CUbIEMaqGY+6wlwBJ5c+3iMPzUBMtpFNsMdVMfQDq
X-Gm-Gg: AYBFou0tfTIi1JsOKuy7O5XNL4o0615B9f4ZBCYoA3IvOqawn5asYDQZObBkUWx18pT
	gYFjxiC9RI/fy0SuA12j081uAw0Cd3j20ltQEwSg7zrVJFBLS0Je3VWykN0AT6/6j/cNMuFhbf7
	KDvdGPms4a59fMh+ancehk9o7qebz00+S+WLaRh80wH+ZW0zFBS52kx76RclS6GUEe4UzCKXTtj
	WEqxlLp6HYjCgyyXoCjEyOseNv53mS9TMNZ90cW4cM/dyLPtD9ty0ZCOjGQkL/Ae9a9lgsH/7Yy
	G8D8558L2W6VPoJuChM1PaoeED64Rtk1gXsEVcqwPgsJydNM5UjJm+vSOomqsgp0MQj+ZBIgmwZ
	TbUyT52Yv
X-Received: by 2002:a53:ad06:0:b0:66f:c1bc:408a with SMTP id
 956f58d0204a3-66fc1bc4792mr7713835d50.77.1789011478612; Wed, 09 Sep 2026
 20:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910033000.15926-1-kmehltretter@gmail.com>
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 10 Sep 2026 11:37:47 +0800
X-Gm-Features: AcwNN1XQH0BdJFknR3BDHpgbH-5I3YT4kBpqbiKb-tpDhIaqt5ymHV136QVN-oI
Message-ID: <CAGXv+5E7AjJLxKeq3TetBJEsPyNuKjyn_bSsQccg4g2g6xR-pg@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:30=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>
> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
>
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
>
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset functi=
on with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/reset.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>  };
>
>  /**
> - * mtk_register_reset_controller - Register mediatek clock reset control=
ler with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset co=
ntroller
> + * @dev: Device used to manage the reset controller resources.
>   * @desc: Constant pointer to description of clock reset.
>   *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>                                            const struct mtk_clk_rst_desc =
*desc);
>
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> --
> 2.39.5 (Apple Git-154)
>
>
