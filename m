Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD4B4534A7;
	Mon, 21 Sep 2026 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980307; cv=none; b=ne+iVfyfWqPmnvJh2Mzl8IAOgTdw32bx/tv9JgTMA2XCmQWJRleymzLzMaCOTnxTin9JSN4+yZSHW8oObagc1oxFcWQd1Tq3vj65WYyVQ5EvpZaOrqSZ2XWUT2AC+e6oiE1zXU+8ZfGXiL5Ux47c4lYL4aH+4SJgaIJ8Gtlxl4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980307; c=relaxed/simple;
	bh=zLNqymAThwirWrpKPzjL47ACUIlYHrddj+w+YqFsR/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBwjzeALTWHfcCuBkIQU/783UeX250C5uH0lxor8EyMCT+sfLDBhXFMknT9xwBnEeao73BfyLFQMTUT7iPpEw8uIBKDWvwCad0JosrLpX+6Kd8J30UbJpELwWqvggDprm4/nV4w/StWHST4o8Y2az/sQfoWoACc9rXNBQNOPdlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqxNFxws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqxNFxws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903D61F000FF;
	Mon, 21 Sep 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980305;
	bh=gSNN01wFYBHZnpHxJ+PpJ3sqcFTBsReiFtNxr1PV3i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PqxNFxwsJI9qFgkPHnmboduGHAg6kuQJR1GAcVAJFDIC84kvH7d8M/7i7/nrkFZ1s
	 sHxI8sWisRuOGfyPJzvKetrLE9wf/ZadEaVwEwDGsqBXfZDzKk10bYFY7d6+yQntXE
	 DpVuFdonE5gzv6iMsKdCIwW2VSyXD+lyp3aF4nor3SBEnXqZBecCNjASXHZhh6QW6P
	 thtAhMZ2T7Y+PtKzsml+PbKP74PABbJY6PWsWR/M5F3gmp8Ds9+KdRnq1i0zx1qjZx
	 qeMBNp6dO3bzYq3lAUxlPLccqV0bzPz+5qH/YIZ8ZA0mNqOwp/1UP/VmSm3DGTArF9
	 8cZDgr2UUyMqg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2712E1AC52F3; Mon, 21 Sep 2026 09:45:02 +0100 (BST)
Date: Mon, 21 Sep 2026 10:45:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v5] ASoC: tas2783-sdw: add firmware download status check
Message-ID: <arDujlvvKixE6ifp@sirena.co.uk>
References: <20260921064053.932-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JvYbaSsERt5MoUz5"
Content-Disposition: inline
In-Reply-To: <20260921064053.932-1-baojun.xu@ti.com>
X-Cookie: Too clever is dumb.


--JvYbaSsERt5MoUz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 02:40:53PM +0800, Baojun Xu wrote:
> Currently, the firmware download is unnecessarily triggered on every
> system resume from suspend, causing significant wake-up latency. However,
> this step is redundant if the AMP remains powered on.
> Furthermore, PRAM access is skipped if the firmware version read from
> registers matches the expected value, indicating that the memory content
> was retained across the AMP reset.

> @@ -431,6 +432,8 @@ static int tas2783_sdca_mbq_size(struct device *dev, =
u32 reg)
> =20
>  	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x12, 0):
>  	case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_XU22, 0x13, 0):
> +	case PRAM_ADDR_START ... PRAM_ADDR_END:
> +	case YRAM_ADDR_START ... YRAM_ADDR_END:
>  		return 4;

Are you sure these are MBQ registers?

> @@ -794,6 +803,13 @@ static void tas2783_fw_ready(const struct firmware *=
fmw, void *context)
>  			file->version, file->length,
>  			file->dest_addr, file->fw_data);
> =20
> +		if (tas_dev->fw_version =3D=3D fw_version &&
> +		    file->dest_addr >=3D PRAM_ADDR_START &&
> +		    (file->dest_addr + file->length) <=3D PRAM_ADDR_END) {
> +			cur_file++;
> +			dev_dbg(tas_dev->dev, "Ignore PRAM block");
> +			continue;
> +		}
>  		ret =3D sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
>  				       file->dest_addr,
>  				       file->length,

This could skip blocks unintentionally if the verison happens to be 0.

> +			 * failed after Power-On.
> +			 */
> +			ret =3D sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
> +					       file->dest_addr,
> +					       file->length,
> +					       file->fw_data);
> +			if (ret < 0) {
> +				dev_err(tas_dev->dev,
> +					"FW download failed again: %d", ret);
> +				break;
> +			}

This logs an error and gives up on the download...

>  	if (cur_file =3D=3D 0) {
>  		dev_err(tas_dev->dev, "fw with no files");
>  		ret =3D -EINVAL;
>  	} else {
>  		tas2783_update_calibdata(tas_dev);
> +		ret =3D regmap_bulk_read(tas_dev->regmap, TAS2783_FW_VERSION,
> +					&val, 4);
> +		tas_dev->fw_version =3D (val[0] << 24) | (val[1] << 16) |
> +				       (val[2] << 8) | val[3];

=2E..then we do another read and overwrite the return value, potentially
we might have a successful read.

> @@ -951,7 +984,7 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream=
 *substream,
>  							TAS2783_SDCA_POW_STATE_ON);
>  			if (!ret)
>  				break;
> -			usleep_range(2000, 2200);
> +			fsleep(2200);
>  		} while (retry--);
>  	}

This should be a separate patch.

> @@ -962,30 +995,6 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substrea=
m *substream,
>  	snd_sdw_params_to_config(substream, params,
>  				 &stream_config, &port_config);
> =20
> -	/*
> -	 * The two mono amps each render one channel of the stereo stream:
> -	 * snd_sdw_params_to_config() hands every codec the full mask for
> -	 * playback, which leaves the pair in mirror mode and one channel
> -	 * unreproduced.  Claim a single channel instead, keyed off the
> -	 * machine-assigned component prefix rather than the SoundWire
> -	 * address, which is board-specific: soc_sdw_ti_amp.c names the amps
> -	 * tas2783-1..4.
> -	 *
> -	 * Which side an amp then renders does not follow from the bit that
> -	 * is set - sdw_compute_slave_ports() advances the payload offset by
> -	 * the popcount of ch_mask and never looks at which bit it is - but
> -	 * from the amp's position in the codec order of the DAI link, which
> -	 * on these boards matches the prefix numbering.
> -	 */
> -	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK &&
> -	    params_channels(params) =3D=3D 2 && component->name_prefix) {
> -		const char *idx_str =3D strrchr(component->name_prefix, '-');
> -		unsigned long idx;
> -
> -		if (idx_str && !kstrtoul(idx_str + 1, 10, &idx) && idx)
> -			port_config.ch_mask =3D (idx & 1) ? BIT(0) : BIT(1);
> -	}
> -
>  	/* port 1 for playback */
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>  		port_config.num =3D 1;

This looks like a rebasing mistake?

> @@ -1207,25 +1216,30 @@ static s32 tas_fw_load(struct tas2783_prv *tas_de=
v, struct sdw_slave *slave)
>  static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>  {
>  	struct tas2783_prv *tas_dev =3D dev_get_drvdata(dev);
> +	uint val;

unsigned int.

> +	/* Check if the AMP is in reset status. */
> +	if (val =3D=3D 0x20) {
> +		tas_dev->fw_dl_success =3D false;
> =20

I'm still not seeing where fw_dl_success gets set to true if the
download was skipped.

> @@ -1437,6 +1454,7 @@ static void tas_sdw_remove(struct sdw_slave *periph=
eral)
>  	struct tas2783_prv *tas_dev =3D dev_get_drvdata(&peripheral->dev);
> =20
>  	pm_runtime_disable(tas_dev->dev);
> +	regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
>  	tas_remove(tas_dev);
>  	mutex_destroy(&tas_dev->calib_lock);
>  	mutex_destroy(&tas_dev->pde_lock);

We need to make sure the regmap is not in cache only mode to do that
reset, or make the register volatile.

--JvYbaSsERt5MoUz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqw7o0ACgkQJNaLcl1U
h9BWuwf/ZP4Hlq461d9WfvrCUJWDiAmvOiWWFKLwgcjaNRfQiYXrnBYiCr7LeIoC
VuCfSDUk8VeLyvuCZ3WLWC5XtLyIK/W56tnO4I85U2K42duDwIljahVl9TWLywU2
Glmiz682GMHor1jXHKESoZCAS5cs/lhLqzWzEE/4JOoltbH+LY1qR0U9vRVsowJi
YHXJ2jv2iEOvMEPs70GOYoovcN0RcWPsb4iyEEClYbml2Up4kCgrl+PsoZIh8yto
3+ByY81LvxaFAthulFkTbDaVxSYXlcfBlTEtjmoxJWiy9v6+EchG74mODgb31a9c
K3k331xMh2WgtjxcEfGYPPgm3wcuAQ==
=HkfS
-----END PGP SIGNATURE-----

--JvYbaSsERt5MoUz5--
