Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C447B43B;
	Tue, 22 Sep 2026 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069940; cv=none; b=dbXEE/2aJReYi5rtUe+q7gy47IJhvGiYa2FphSbe26kNfjiaA7cxtraDTyDlOwxAAismqpVoVdtTVug6d85z9U4ntjcAzc+HIrOuijqX/OtF9TiUVYfEmag1BmXGVjVZXt/hThoMLQeLynTUxVvHbcCSLfHUa634LlqyZRipdVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069940; c=relaxed/simple;
	bh=y6CF/oKIzhsEK3+BLtkvo0G6TXScff6zz8EBGaulFK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai078s8hM4YHi8s4C/7Hg46I13AoFg5tkP9gaKMYUDV2quEU3yfu8KkrdU5gEfys+GGhi/Dkw4lMzptqulION64l7iFIOJRlobv5K2/UkD8JSz1y4cHGDV7vnHgKv+6A/UE0/8rbqewLAtzbGOt6LYsUjDKDftBcdHdg+5z5/74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIJXExLC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIJXExLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126C71F000FF;
	Tue, 22 Sep 2026 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069938;
	bh=hq5YyT/zdVF7V5KC77tC6utWfg4F8JVDMC2qfMUXaw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JIJXExLCBRy8py2yJQzX13tW7nDrsqlkEnjylva0JeYxMGf44F8QnnQjU41qxASC0
	 FzLouRRO/Y8FaxGuPZQqs6gHsPCTAcmRf/go6vykKXFE+WfeAUImz1S91Gm1oiOmVW
	 QMZ0Pprmqgz3XLFt8qbRdFWAtGpB/qIjLuyc7g1KII6nrtUJqolJa6C7tJJs4PB7rH
	 1oQnflKSeD5njANlp1Jk9AZFTU3Ol5ZEZTdsolEsNDjnPgoYR7HeO1g4XBN+sA3wbW
	 +GPKp0WHhjE2bjdEPRGiHCBQJRnEccRnTSdpPp4i0c2DCZz/WlNZ1qESl8AI6Vu1du
	 81KD2oLNxBbbA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BD00C1AC56BF; Tue, 22 Sep 2026 10:38:54 +0100 (BST)
Date: Tue, 22 Sep 2026 11:38:54 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,
	Hector Martin <marcan@marcan.st>,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Message-ID: <arJMrsl45g2_bLPB@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J3S3MW2YA3wzFenM"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--J3S3MW2YA3wzFenM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:55PM +1000, James Calligeros wrote:

> Apple Silicon Macs have a complex audio subsystem consisting
> of an I2S peripheral (MCA) and multiple codecs of various
> models and capabilities. Some machines have a basic mono
> speaker with hardware downmix, while others have a very
> intricate stereo system consisting of multiple codecs and
> drivers per L/R channel. Some machines report voice coil
> voltage and current information back to the SoC, and others
> do not. All machines have a headset jack.

> +config SND_SOC_APPLE_MACAUDIO
> +	tristate "Sound support for Apple Silicon Macs"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	select SND_SOC_APPLE_MCA
> +	select SND_SIMPLE_CARD_UTILS

Do we actually use simple-card?

> --- a/sound/soc/apple/Makefile
> +++ b/sound/soc/apple/Makefile
> @@ -2,3 +2,7 @@
>  snd-soc-apple-mca-y	:=3D mca.o
> =20
>  obj-$(CONFIG_SND_SOC_APPLE_MCA)	+=3D snd-soc-apple-mca.o
> +
> +snd-soc-macaudio-objs	:=3D macaudio.o
> +
> +obj-$(CONFIG_SND_SOC_APPLE_MACAUDIO)	+=3D snd-soc-macaudio.o

Note the -y vs -objs style difference here.

> @@ -0,0 +1,1729 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASoC machine driver for Apple Silicon Macs
> + *

Please kep the entire comment block C++ so things look more consistent.

> +static void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool un=
lock)
> +{

> +	case AMP_TAS5770:
> +		if (unlock)
> +			max =3D TAS5770_0DB;
> +		else
> +			max =3D 1; //TAS5770_DB(ma->cfg->safe_vol);
> +		break;
> +	case AMP_SN012776:
> +		if (unlock)
> +			max =3D SN012776_0DB;
> +		else
> +			max =3D 1; //SN012776_DB(ma->cfg->safe_vol);
> +		break;

What's going on with those comments?

> +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> +{

> +
> +	/* Check that *every* limited control is locked by the same owner */
> +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp]))
> +			continue;

This is used from the volume limit timeout work which doesn't hold the
controls_rwsem, userspace can add or remove user controls which would
change the list so the work needs to lock the controls list.

> +/*
> + * Parse one DPCM backend from the devicetree. This means taking one
> + * of the CPU DAIs and combining it with one or more CODEC DAIs.
> + */
> +static int macaudio_parse_of_be_dai_link(struct macaudio_snd_data *ma,
> +				struct snd_soc_dai_link *link,
> +				int be_index, int ncodecs_per_be,
> +				struct device_node *cpu,
> +				struct device_node *codec)

> +	ret =3D macaudio_parse_of_component(cpu, be_index, link->cpus);
> +	if (ret)
> +		return dev_err_probe(ma->card.dev, ret, "parsing CPU DAI of link '%s' =
at %pOF\n",
> +				     link->name, codec);

Cut'n'paste with logging the codec node.

> +static int macaudio_get_codec_idle_props(struct device_node *np,
> +					 struct ma_codec_idle *idle, int i,
> +					 int be_index, int ncodecs_per_cpu)
> +{
> +	char propname[32];
> +	int ret, sys_codec;
> +
> +	/*
> +	 * Depending on the BE index on the DAI, we need to offset our i
> +	 */
> +	sys_codec =3D i + (be_index * ncodecs_per_cpu);
> +
> +	snprintf(propname, 32, "dai-tdm-idle-mode-%d", sys_codec);
> +	ret =3D of_property_match_string(np, propname, "zero");
> +	if (!ret) {
> +		idle->idle_mode =3D SND_SOC_DAI_TDM_IDLE_ZERO;
> +	} else {
> +		ret =3D of_property_match_string(np, propname, "pulldown");
> +		if (!ret)
> +			idle->idle_mode =3D SND_SOC_DAI_TDM_IDLE_PULLDOWN;
> +		else
> +			return ret;
> +	}

Should we warn on unknown values?

> +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_interval *rate =3D hw_param_interval(params,
> +						      SNDRV_PCM_HW_PARAM_RATE);
> +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> +	int i;
> +
> +	if (props->is_sense) {
> +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> +		return 0;
> +	}

It feels like this DAI ought to have separate ops...  Also, for the
sense link will we definitely already have a rate set up?

> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int =
cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +
> +	if (props->is_speakers && substream->stream =3D=3D SNDRV_PCM_STREAM_PLA=
YBACK) {
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ma->bes_active |=3D BIT(rtd->dai_link->id);
> +			break;
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		case SNDRV_PCM_TRIGGER_STOP:
> +			ma->bes_active &=3D ~BIT(rtd->dai_link->id);
> +			break;

Do we have adequate locking here, this is shared between BEs but the BEs
have their own locks?

> +static int macaudio_be_assign_tdm(struct snd_soc_pcm_runtime *rtd)
> +{

> +	for_each_rtd_codec_dais(rtd, i, dai) {

> +		if (props->codecs[i].idle_mode) {
> +			ret =3D snd_soc_dai_set_tdm_idle(dai, props->codecs[i].idle_mask,
> +						       0, props->codecs[i].idle_mode, 0);
> +		}
> +	}
> +
> +	return 0;

We store ret but don't pay attention to the result.

> +#define CHECK(call, pattern, value, min)                                =
       \
> +	{                                                                      \
> +		int ret =3D call(card, pattern, value);                          \
> +		int err =3D (ret >=3D 0 && ret < min) ? -ERANGE : ret;             \
> +		if (err < 0) {                                                 \
> +			dev_err(card->dev, "%s on '%s': %d\n", #call, pattern, \
> +				ret);                                          \
> +			if (please_blow_up_my_speakers < 2)                    \
> +				return err;                                    \
> +		} else {                                                       \
> +			dev_dbg(card->dev, "%s on '%s': %d hits\n", #call,     \
> +				pattern, ret);                                 \
> +		}                                                              \
> +	}
> +
> +#define CHECK_CONCAT(call, suffix, value) \
> +	{ \
> +		snprintf(buf, sizeof(buf), "%s%s", prefix, suffix); \
> +		CHECK(call, buf, value, 1); \
> +	}

This only requires one match, things might go wrong for a stereo setup.

> +static const struct snd_kcontrol_new macaudio_hp_mux =3D
> +	SOC_DAPM_ENUM("Headphones Playback Mux", macaudio_hp_mux_enum);

> +	SND_SOC_DAPM_SPK("Speaker (Static)", NULL),

Is this used?

> +	SND_SOC_DAPM_MUX("Headphone Playback Mux", SND_SOC_NOPM, 0, 0, &macaudi=
o_hp_mux),

Headphone or Headphones?

> +static int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ct=
l_elem_value *uvalue)
> +{
> +	struct snd_soc_card *card =3D snd_kcontrol_chip(kcontrol);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +
> +	if (!ma->speaker_lock_owner)
> +		return -EPERM;
> +
> +	if (uvalue->value.integer.value[0] !=3D SPEAKER_MAGIC_VALUE)
> +		return -EINVAL;
> +
> +	/* Serves as a notification that the lock was lost at some point */
> +	if (ma->speaker_volume_was_locked) {
> +		ma->speaker_volume_was_locked =3D false;
> +		return -ETIMEDOUT;
> +	}
> +
> +	mutex_lock(&ma->volume_lock_mutex);

Shouldn't we take the mutex before checking (and potentially changing)
the state?  Otherwise we've got TOCTOU issues.

> +static void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
> +{
> +	struct snd_soc_card *card =3D snd_kcontrol_chip(kcontrol);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +
> +	ma->speaker_lock_owner =3D NULL;
> +	ma->speaker_lock_timeout =3D 0;
> +	macaudio_vlimit_update(ma);
> +}

This seems to similarly be missing locking.

> +/*	enable	amp		speakers	stereo	gain	safe_vol */
> +struct macaudio_platform_cfg macaudio_j180_cfg =3D {
> +	false,	AMP_SN012776,	SPKR_1W1T,	false,	10,	-20,
> +};

These should be static, they're not used outside this file.  Probably
also const.

> +static const struct of_device_id macaudio_snd_device_id[]  =3D {

> +	/* j375    AID10   sn012776    15      1=D7 1W */
> +	{ .compatible =3D "apple,j375-macaudio", .data =3D &macaudio_j37x_j47x_=
cfg },

The j47x entries in the table use 20 not 15.

> +static void macaudio_snd_platform_remove(struct platform_device *pdev)
> +{
> +	struct macaudio_snd_data *ma =3D dev_get_drvdata(&pdev->dev);
> +
> +	cancel_delayed_work_sync(&ma->lock_timeout_work);
> +}

What ensures that lock_update_work is cancelled?

--J3S3MW2YA3wzFenM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyTK0ACgkQJNaLcl1U
h9A19wf/fkTwF4NVPToEqCvVj16AyCprlKjMn1WdPIlRrrtatsDtyY5nq766qxdg
fQXIjO4EKgsMxxPdcbuud62kEHITQAHHec0a/z4EuYshi0IYyDs5YcxN8ev5NzGV
lIugSSezpIm6z9tv6skF/XFxhijMQgHIKc1f6Pwm0EpT3XAW5tNdpWvYhGnGwmXH
b29RJbLLZRGngUyRXBwGOBSfa55A8JnqGgER8UswOi/+qI1rJOdUQ6YuuNBpDYbq
chHJViaseajkwym5RyIzBrXZ/pbXKtxvAVI3+g7jxpuPmH9Kg9fVwclS4XygWtud
om4S5aS+S2w9qHProWNSQvVc4eBQjA==
=+POr
-----END PGP SIGNATURE-----

--J3S3MW2YA3wzFenM--
