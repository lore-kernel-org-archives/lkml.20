Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794726208;
	b=VJNATaytKlPgX0Iplzh40TgD1zTdvYBBSYQm5/tT5AQ13xNrhqZYJrHHd/KRQYu/vJ9f
	 KGfEVFP3wWvvCV3K/f0sAyz6ijH8NOLEmbV5rv5ZBiFsFNsE6U+7ua8cHKl6gG3SYsQPF
	 40l+NEE72oIkDEhYgdLfbFTuVDVGmjB+CT69pONBmISpxPgKXUGuCuRsI/VdGljZHxTIl
	 JBkojxXxsBok2Tr0n1LufHVaUM1UTaaCO09kTHGppyZrPxPLkLQBd2htko5Hh8nkNDL8D
	 7038BHfL4rpG4dbq0jwTe1q/KQ+1R4VZKn5LLjpRx6Y15EIY3VR+dKCwFaZYyD403Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794726208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
	b=D5ztemP97wHCykKEedTawzyWWFq8T9tEOaN2wQ+ofq2in775iGiKtNjbwgoGqnUUU+rz
	 5y0yAOay+kvErWdoog4HJxngSTaos4sei6LN9r9Uvhm0xqKQmqsW0xx8N/25ib2sONpHB
	 Ub2ui56T/YgXBOpJhFOB3gykeDqXvdHL+es7eAyutEZSsNyyS0VKZD0yxxtfxyPJhgYs2
	 SilVNuMHMB1DrPNTllVUEplOBKjoGxD4C17yVZ2a10irPZ+E6UYcx0ZRaxh4zuODymdo8
	 Wp81RZmu+x3pb4KzXklOYnWSsJntQXgplIArdkBJQKdeaAs3U9oVpQoGh8bbZyePN9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KHnA/YKk";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5225606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5225606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHnA/YKk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so6529455e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726206; x=1795331006; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
        b=KHnA/YKklGJIxa0kJ8/uPpiypIOP1BDnfL44ExRGNmJC8MfDs8cWMEIseZMYZfK6H0
         4OjzdwBj0SLY3+gKqeWIFCqtoVeOhsjbk2WGupMtXaiSGxmVFyEPk8Z3AxppEpFGRU1s
         RkygTQGAoHek5T9RDo6mQgTWDrL0/MEPk3eCK0w7IH3868+KDzId6EAySbenPnLSX08h
         BdkPJ8aEnV5JnPPmGCocv//35onidcvdnz7en7j/y70R9KKxBrCC1cASzt6ALGEwr9MZ
         kJ8gjkymKKNGfG5NIZaSUL8JV6E1LB4IQu+GsBWD6NBx+Gg/SPov7IxR3b49wvtz36Og
         37SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726206; x=1795331006;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0wnVTzo2SMTqUhE+Yi1XoqVrkmPjT5CK9ef37B0JVo=;
        b=tkfhX98KE16PdXgyTCNHxY+JP2bJKHSi/vEcaSPbZRgpfYbY95lAhZvEIzidbLvMnF
         6OLG1oDKxuuN5vLQuvj3hTy3+ZdU6TPDrJQauehiosuiqHt8b2J1ItkrEYdYggeejUhJ
         +ajfFIc3YKOzX3+rCWZz6igWIxjYyfQEEmh79LHbIJ/KAyAPFtGhBRU0eqk/kKh2uIiy
         RGcyixQ5/LC0XiM4BDVx2vFdBDhFPgVpgZzHjTe94slk82uGlR1Y4LfZYRFp3HSGLfW7
         EWH0uzaDNuTK0Faurk0FQa8vfOJM/aJNRsp2/VwS/hzz8fcFE7EbpBJgHPs27v956i0t
         M1kw==
X-Forwarded-Encrypted: i=1; AL+hErHeSDqoAPcC4cCAjo+tqcY2XTDRYzddb7jR+INnJQNvCt20igexbxxrXCTSBdBOsHf6GLa/EGiuwDMaZIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HGS77nqp83gMRm4gtWE2gaEiG3xUkIf7KwhG9slR1n7dwtVat
	heWhMoD8pX3kI+HOaDZpfdWBO+MY1QBPXe3sII4qax7XUgHCBTHjCbHd
X-Gm-Gg: AYBFou0MmdJq22o/OlVdYlQLe1ns9lfwVsh2seFCHPoE/WzTRCtiqiKEgGo8Ra8wHtX
	KmGq713b3XblaBHN+Rq50Ynyd+4j+asjqBJ30dCYFL+wJssZgoQbBoc975u3/uN2ALW0jmI2kW1
	0rVHkpytFfaIInxAsgtGSOA9/fXB8k8vgiw6ndInwc9qu0dZ4WxlxgOk/47XWeOd1yN+TrV3+wC
	b3/osuvMThyys9f2OC1c+8JydCh16vMeIJVzn5n549d1QBK47/Jr9gz6oA+jh2SzOpRQrR6+cRr
	Z9Sm/kPuM3j8qsJKw3FMbftelgq5VVL1ESq6sQlCPv/rKRccFU9F8sCJ0X9ZftRFjz8BdDWNCoX
	jcD955Ex5aDww2CkrpQPZctuqkNV+0VCp3Xl6kYIdukTfXR6y8H5Wa6VOxb935H6+EXj0NA/wLQ
	CMFxFH079kx37uZ53bgH/6WHme6dSiyP8WbtjJ91EEo/IvZoFoegHJWIQvg8j6zPNbrOrrtNPKC
	KM7K8+dSM6iyEsEstSDPN/90asSSZf4WTb2q3w/sdkCUl+JV+fWkRS3ovUMXOoG8ex/DD/AjuAq
	cHUGTJKUs04W9Er9q8a3kOEdwTIK8ELEDgWioUuovUn547kR/FD3KSPO0Otapuw0xwvLkt7ctSg
	NxPZYl16HaoIlmgvnmdF99FsykMm72Gh3g/QJGb9gvMoPeAtNIIy/etZ0r9WuIDrXcUud5m55nz
	InZ5FWbSkB4k+cpBVedrR34ELzy8y85XsnQ0BnL8sdAJizsqht1r91ftJikJzxt7NDLcdHr8icp
	apaaZzAgLEgHc9K3loYv3xL4gyNTt8fWjqsxZeyrh7F3Ac=
X-Received: by 2002:a05:600c:840c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb5599bda8mr154094045e9.0.1794726205780;
        Sat, 14 Nov 2026 23:03:25 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm25768458f8f.44.2026.11.14.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:03:25 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Ripard <mripard@kernel.org>,
 Frank Oltmanns <frank@oltmanns.dev>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject:
 Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 08:03:21 +0100
Message-ID: <TB0DvSOtTYKNXNEXzDrlwg@gmail.com>
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 1. november 2026 ob 21:33:36 Srednjeevropski standardni =C4=8D=
as je Romain TISSERAND napisal(a):
> The N-K-M rate code computes parent * n * k / m in an unsigned long,
> which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.
>=20
> On the A33, pll-mipi (parent pll-video at 297 MHz) with N =3D 14, K =3D 2,
> M =3D 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
> 4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
> picks these factors for a 288 MHz request, and clk_get_rate() reports
> 287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
> ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
> 594 Mbit/s instead of 288 and the picture broke up.
>=20
> Do the multiplications in 64 bits, saturating at ULONG_MAX, in
> ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
> rate request of the parent-adjusting search, where rate * m overflows
> the same way.
>=20
> Without the saturation, a candidate above 4.29 GHz in the search would
> be truncated again on return and could look like a valid low rate.
>=20
> 64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
> hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
> parent rate times N * K goes above 2^32.
>=20
> Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
> Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rat=
es when determining rate")
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Notes:
> - Testing: built with W=3D1 for arm (multi_v7_defconfig with the A31, A23,
>   A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=3Dy and =3Dm, no
>   warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
>   helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
>   change, without the ULONG_MAX saturation (same results for rates that
>   fit, which is the only case the hardware hits): before, pll-mipi was
>   programmed with N =3D 14, K =3D 2, M =3D 14 (594 MHz measured as a 2x l=
ane
>   rate) while clk_get_rate() returned 287216621; after, N =3D 15, K =3D 1,
>   M =3D 16, 278437500 Hz in both the register and clk_get_rate(), and the
>   panel picture is right. This version, with the saturation, then on
>   the same board on 7.3.1: pll-mipi again programmed with N =3D 15, K =3D=
 1,
>   M =3D 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
>   right. Not tested on the other SoCs.
> - Tool disclosure: this patch was prepared with Claude Opus 5.5
>   (Anthropic) as a coding assistant, in an interactive session where I
>   asked it to bring up the PocketGo S30 display. It found the mismatch
>   between the pll-mipi register and the rate the clock framework
>   reported, traced it to this overflow and drafted the fix and the
>   message. I reviewed and understand the change and tested it as
>   described above.
>=20
>  drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nk=
m.c
> index 401fbb7524..e5a8f22d50 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/math64.h>
> =20
>  #include "ccu_gate.h"
>  #include "ccu_nkm.h"
> @@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *c=
ommon, unsigned long paren
>  	return true;
>  }
> =20
> +static unsigned long ccu_nkm_calc_rate(unsigned long parent,
> +				       unsigned long n, unsigned long k,
> +				       unsigned long m)
> +{
> +	u64 rate =3D (u64)parent * n * k;
> +
> +	do_div(rate, m);
> +	return min_t(u64, rate, ULONG_MAX);
> +}
> +
> +static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
> +					      unsigned long n, unsigned long k,
> +					      unsigned long m)
> +{
> +	u64 parent =3D (u64)rate * m;
> +
> +	do_div(parent, n * k);
> +	return min_t(u64, parent, ULONG_MAX);
> +}
> +
>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common=
 *common,
>  						       struct clk_hw *parent_hw,
>  						       unsigned long *parent, unsigned long rate,
> @@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_ad=
j(struct ccu_common *common
>  			for (_m =3D nkm->min_m; _m <=3D nkm->max_m; _m++) {
>  				unsigned long tmp_rate, tmp_parent;
> =20
> -				tmp_parent =3D clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
> +				tmp_parent =3D ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
> +				tmp_parent =3D clk_hw_round_rate(parent_hw, tmp_parent);
> =20
>  				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
>  					continue;
> =20
> -				tmp_rate =3D tmp_parent * _n * _k / _m;
> +				tmp_rate =3D ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
> =20
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
>  				    (tmp_parent =3D=3D *parent && tmp_rate =3D=3D best_rate)) {
> @@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long p=
arent, unsigned long rate,
> =20
>  				unsigned long tmp_rate;
> =20
> -				tmp_rate =3D parent * _n * _k / _m;
> +				tmp_rate =3D ccu_nkm_calc_rate(parent, _n, _k, _m);
> =20
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
>  					best_rate =3D tmp_rate;
> @@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_h=
w *hw,
>  	if (!m)
>  		m++;
> =20
> -	rate =3D parent_rate * n  * k / m;
> +	rate =3D ccu_nkm_calc_rate(parent_rate, n, k, m);
> =20
>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>  		rate /=3D nkm->fixed_post_div;
>=20
> base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
>=20




