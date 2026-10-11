Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4364A361962;
	Sun, 11 Oct 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746566; cv=none; b=SyX5belGxkB/YXC5T0IKzOQ7MrM51EIXuc2+mDlwXR0LZf5pBbXqrhIBe8vP/2Iy3w1fciYgohm/8l801U95n0kSyzldnQdBI+xcA+Vhkbh8t+LEVxpVXeJJu7T+/TqZYyZJSOrXtFxFHOHjRS+b6gAa/6nNrih3oeyDZ9X3rGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746566; c=relaxed/simple;
	bh=gdW/Hqk9Svm8OLwtKz0K7iwDvXb0EHdBya5BIqnj57s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KTvCs8N9wBYsFxJ/l7dU1yfmDt1uXbI257r6sA0X0nKepHbL1tZYgvcioRjdFP3S8GgRhD8RLESbQSegToxYCsfQvK9Yb+9Qo1uIOi5suA/VURzLqFhvMUEudBbjCG1d14eNpua7S2tIrHi+XB0e6wCU0YW0OTe+BE5VKWz3JLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (bc24bec8.dsl.pool.telekom.hu [::ffff:188.36.190.200])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AA.000000006ACBE0CB.0033447B; Sun, 11 Oct 2026 21:17:31 +0200
Message-ID: <08164314db94522865dd4681d414bc42939da545.camel@irl.hu>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Enable bass speakers support
From: Gergo Koteles <soyer@irl.hu>
To: Georg Wenzel <g.wenzel@gmail.com>, tiwai@suse.de
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org
Date: Sun, 11 Oct 2026 21:17:36 +0200
In-Reply-To: <20261004071202.89116-1-g.wenzel@gmail.com>
References: <87cxtw2y8b.wl-tiwai@suse.de>
	 <20261004071202.89116-1-g.wenzel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Georg,

On Sun, 2026-10-04 at 09:12 +0200, Georg Wenzel wrote:
> Configure the driver to correctly initialize and enable the bass speakers
> on devices utilizing the TAS2781 amplifier. Without this change, only the
> tweeters or main speakers are active, leading to thin audio output.
>=20
> Set up the required register sequences and routing to ensure the bass
> channels are properly powered and mixed into the audio stream.
>=20
> Signed-off-by: Georg Wenzel <g.wenzel@gmail.com>
> ---
> v2:
>   - Rebased onto sound/for-next (Takashi Iwai).
>   - Removed non-ASCII characters in comments (Takashi Iwai).
>  =20
>  include/sound/tas2781.h                       | 12 +++
>  .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 98 +++++++++++++++++++
>  2 files changed, 110 insertions(+)
>=20
> diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
> index b763da613769..ccc0142fbad5 100644
> --- a/include/sound/tas2781.h
> +++ b/include/sound/tas2781.h
> @@ -91,6 +91,18 @@
>  /* prm_TE_1_Beta1 */
>  #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
> =20
> +/* TAS2563 ASI (Audio Serial Interface) Register Definitions */
> +#define TAS2563_ASI_CFG_REG			TASDEVICE_REG(0x00, 0x00, 0x06)
> +#define TAS2563_ASI_SR_REG			TASDEVICE_REG(0x00, 0x00, 0x07)
> +#define TAS2563_ASI_FS_REG			TASDEVICE_REG(0x00, 0x00, 0x08)
> +#define TAS2563_ASI_DA_REG			TASDEVICE_REG(0x00, 0x00, 0x0a)
> +#define TAS2563_ASI_TDM_REG			TASDEVICE_REG(0x00, 0x00, 0x0b)
> +#define TAS2563_ASI_DL_REG			TASDEVICE_REG(0x00, 0x00, 0x0c)
> +#define TAS2563_ASI_SLOT_REG		TASDEVICE_REG(0x00, 0x00, 0x30)
> +
> +/* TAS2563 ASI Apply Register (triggers configuration update) */
> +#define TAS2563_ASI_APPLY_REG			TASDEVICE_REG(0x00, 0x00, 0x02)
> +
>  #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
>  #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
>  #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/c=
odecs/side-codecs/tas2781_hda_i2c.c
> index 5e5f46c9fb6b..cef33159eba4 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -46,6 +46,83 @@
>  #define TAS2563_CAL_TLIM		TASDEVICE_REG(0, 0x10, 0x14)
>  #define TAS2563_CAL_R0			TASDEVICE_REG(0, 0x0f, 0x34)
> =20
> +/*
> + * TAS2563 Post-Firmware ASI Configuration.
> + *
> + * The DSP firmware loading can overwrite the ASI (Audio Serial Interfac=
e)
> + * registers that configure the I2S/TDM audio path to the amplifier.
> + * This function re-applies the correct ASI configuration after firmware=
 load,
> + * matching the reference initialization sequence used by the vendor scr=
ipt:
> + *   - Software reset
> + *   - ASI_CFG  =3D 0x09 (I2S mode, master/slave config)
> + *   - ASI_SR   =3D 0x02 (sample rate divider for 48 kHz)
> + *   - ASI_DA   =3D 0xf1 (data alignment / slot assignment)
> + *   - ASI_TDM  =3D 0x02 (TDM mode select)
> + *   - ASI_DL   =3D 0x00 (delay line off)
> + *   - ASI_SLOT =3D 0x99 (slot enable mask for 2-channel stereo)
> + *   - CHNL_0   =3D 0x02 (channel mapping)
> + *   - ASI_FS   =3D 0x1e or 0x2e (frame sync, device-specific: bit4 sele=
cts
> + *                which of the two devices is the "primary" for FS gener=
ation)
> + *   - ASI_APPLY=3D 0x00 (trigger configuration update)
> + */
> +static void tas2563_post_fw_init(struct tasdevice_priv *tas_priv)
> +{
> +	int i, ret;
> +
> +	dev_info(tas_priv->dev, "%s: ndev=3D%d, chip_id=3D%d\n",
> +		 __func__, tas_priv->ndev, tas_priv->chip_id);
> +
> +	for (i =3D 0; i < tas_priv->ndev; i++) {
> +		struct tasdevice *tasdev =3D &tas_priv->tasdevice[i];
> +		u8 fs_val;
> +
> +		dev_info(tas_priv->dev,
> +			 "%s: device[%d] dev_addr=3D0x%02x\n",
> +			 __func__, i, tasdev->dev_addr);
> +
> +		/* Step 1: Software reset (matches script: 0x01 =3D 0x01) */
> +		ret =3D tasdevice_dev_write(tas_priv, i, TASDEVICE_REG_SWRESET,
> +					  TASDEVICE_REG_SWRESET_RESET);
> +		dev_info(tas_priv->dev,
> +			 "%s: chn=3D%d SWRESET ret=3D%d\n", __func__, i, ret);
> +		usleep_range(1000, 2000);

According the 7.5.3 in the tas2563.pdf, this will place all register
values in their default POR (Power on Reset) state.

So this resets all registers set by the firmware before.

Why is this necessary? Should that vendor script run here?

I have TAS2563s in my Lenovo 14ARB7 and they work fine already.

You wrote that it worked well with 6.16.
Could you bisect the culprit commit instead?

Based on your dmesg something else can be wrong:

snd_hda_codec_alc269 hdaudioC1D0: bound i2c-INT8866:00 (ops
tas2781_hda_i2c_driver_exit [snd_hda_scodec_tas2781_i2c])

This sould be:

snd_hda_codec_alc269 hdaudioC1D0: bound i2c-INT8866:00 (ops
tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])


> +
> +		/* Step 2: ASI configuration registers */
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2563_ASI_CFG_REG, 0x09);
> +		dev_info(tas_priv->dev, "%s: chn=3D%d ASI_CFG=3D0x09 ret=3D%d\n", __fu=
nc__, i, ret);
> +
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2563_ASI_SR_REG, 0x02);
> +		dev_info(tas_priv->dev, "%s: chn=3D%d ASI_SR=3D0x02 ret=3D%d\n", __fun=
c__, i, ret);
> +
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2563_ASI_DA_REG, 0xf1);
> +		dev_info(tas_priv->dev, "%s: chn=3D%d ASI_DA=3D0xf1 ret=3D%d\n", __fun=
c__, i, ret);
> +
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2563_ASI_TDM_REG, 0x02);
> +		dev_info(tas_priv->dev, "%s: chn=3D%d ASI_TDM=3D0x02 ret=3D%d\n", __fu=
nc__, i, ret);
> +
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2563_ASI_DL_REG, 0x00);
> +		dev_info(tas_priv->dev, "%s: chn=3D%d ASI_DL=3D0x00 ret=3D%d\n", __fun=
c__, i, ret);
> +
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2563_ASI_SLOT_REG, 0x99);
> +		dev_info(tas_priv->dev, "%s: chn=3D%d ASI_SLOT=3D0x99 ret=3D%d\n", __f=
unc__, i, ret);
> +
> +		ret =3D tasdevice_dev_write(tas_priv, i, TAS2781_PRM_CHNL_0_REG, 0x02)=
;
> +		dev_info(tas_priv->dev, "%s: chn=3D%d CHNL_0=3D0x02 ret=3D%d\n", __fun=
c__, i, ret);
> +

TAS2781_PRM_CHNL_0_REG is misleading.
It is TASDEVICE_REG(0x00, 0x00, 0x03) which is the PB_CFG1 on the
TAS2563.

Writing 0x02 into sets the AMP_LEVEL to the minimum.
AMP_LEVEL=3D0x01 -> 8.5 dBV (3.76Vpk).

The default is 0x20 for this register.
AMP_LEVEL=3D0x10 -> 16.0 dBV (8.92Vpk).

Why should it be quieter?


Thanks,
Gergo
