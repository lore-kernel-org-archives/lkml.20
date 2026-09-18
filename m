Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A68485944;
	Fri, 18 Sep 2026 05:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710770; cv=none; b=XCGB7R+nHG9AFwL/NPgS1H5dykJCNwerygFmE1kGRqyK5imzw3kJc8zw2rUjbZbfP4DrbAoYXhu3np1qIeEj+lNszvBh8be7f9Fk1wyN9U/12cZyJ+tHfkI4xp9N55IXR5K8K7LpVmdEGWm/aODTXl4Y8nOfn6Oz2d/II5Bp/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710770; c=relaxed/simple;
	bh=9gDLaSvfEcxCMzM5UNGOW/P0V0j0lNB4HEBNmiKWMzU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VK4Z2yCIO97/Nkr+BdINhlys1hQhZoH5Ws3h2AGQX+53P6AgbcjuftPSXDBvwFkZi1tDKAm3fLhzpXRWPs2ziXOVv73DhJBZlgrfQcZcoP6uEwusiNTK9OAP5rMkbhlt5HkMEI84NS/v7BwZriBUway9SMhfTXPmZfnnJfQMTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowABnOe2i0axqXE9ICA--.14577S2;
	Fri, 18 Sep 2026 13:52:35 +0800 (CST)
Message-ID: <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane
 disable clearing FB_EN
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 13:52:34 +0800
In-Reply-To: <20260918030125.315978-8-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
	 <20260918030125.315978-8-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowABnOe2i0axqXE9ICA--.14577S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrXF1kJw48ZF43CF1ftFb_yoW8Ar1DpF
	4ay3y8KF4rXayj9FyxtFWvgFyYv3W7J34fG3y8G3sIvrn8ta9xWFy8tFyxta4DWrZrAF4S
	vFs29w47Cr1jkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jUb18UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-18=E4=BA=94=E7=9A=84 11:01 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
> VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
> the primary plane on DC8200-family hardware actually leaves the
> framebuffer enable bit instead of clearing it.
>=20
> This bug predates this series: it was carried over unchanged from
> vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
> introduce per-variant hardware ops table" split the DC8200-specific
> implementation out into vs_dc8200.c.
>=20
> Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon
> display controllers")

Maybe it'd be better to fix this before adding DC variant abstraction,
for easier backporting.

Thanks,
Icenowy

> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
> b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> index f72da10295e1b..25b5906a1c5fc 100644
> --- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
> +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> @@ -70,8 +70,8 @@ static void
> vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
> =C2=A0
> =C2=A0static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc,
> unsigned int output)
> =C2=A0{
> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> -			VSDC_FB_CONFIG_EX_FB_EN);
> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> +			=C2=A0 VSDC_FB_CONFIG_EX_FB_EN);
> =C2=A0
> =C2=A0	vs_dc8200_plane_commit(dc, output);
> =C2=A0}

