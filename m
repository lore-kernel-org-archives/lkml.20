Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137080;
	b=anztmRcKmZRLXjpSRKJxpEMAO8++FdsIszdvSqj5OaMZkyfTzyzaJxt9jhtb0dTaPOEu
	 PqPXXdF8C+ozjpRiA2Ye9ObDu2R5yx/F67k9OdvlbgY9vv5Y4vL7Xw2NJsM9z3cLjv5Jk
	 I4lX9O+qFCg5YAE44FKgJCJ0jXyFypNhnYlz9ikRMhqMS1rdzbEoTspS9eweDK3DNtDY7
	 O//VErSN7fzFzmQY9dKXE+46877alAtgX3eeiQrUjgg9f8DyNkxsGDbX2HL0StUlpL2At
	 6jKCrlhAeXBUnFWlhP5gN1MvwNlhN1cClgi64/+lgAgSowyZYykgQP073hE8QnNiKbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137080;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+MPLl1OB9PXd1EmEIm/8JyVcMtBeW139H0LapCZJXuE=;
	b=F/gBcQ45JQ0bUmNRqN5nfg7qaVNtqagDzgff3i3Dl0LaSX9BT6150Z+PdqDFCn0TgPrs
	 ghdnQTXOLfm95B/FEinxa4UCOrhqOOhRpbhyhD4ouXXwgsved+ZbXUGxsxokghXLi8q75
	 spcYGeJHiqxGOJvwSXMym8VCNtivLQkPOGWP9AC/qb2X0FnVhTSWo5i4xWtXRjX+Lpk9a
	 nbBIvvASxJHrh61q9EbqnGB6L2e61HRLKZzBfg7U8CXgQBsk4gBt657FFaCgyl6HYeuLI
	 ht4KSxQA0DxmYtKFgkRMKtfQHzk0FIMgB7OMEJec+hUwNRgzRheLzIJaYWzA2SJIaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOqu+OlC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADDB606A31C;
	Sun,  8 Nov 2026 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOqu+OlC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A575D1F0089F;
	Sun,  8 Nov 2026 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137079;
	bh=+MPLl1OB9PXd1EmEIm/8JyVcMtBeW139H0LapCZJXuE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BOqu+OlCww4cwJNjsZG9YYZlPwSzvGahUH491F72XIUw0EAF7GB1nxw5cnQaCYtfZ
	 i3gGzbpoidkRIT75lW1H0hpYgUNAbvurfdbXanvUgtYG0uqKEwdlHBpA638nIf5QpM
	 SYjj3ofcCIT0GP3Izw0x9SrKdDDKyTe7yNhMVPe7UJw1piLvvCkFeWfOfpLZmWvxA2
	 zjxXuNDC/Wa0HsBrFL5EHL5XAwPC5B0bpD3ycmY1+XJDxXlrjUiV50ExXD6ejGDmFM
	 L9fo8HdYg+IS/pS9x5jjoY2XDHd7TcwWLYL/cergKW8DU3Xif7Dywl0Mg+WU/1ntZ/
	 wS8zq3PCVONTw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5C74B2BF91E1;
	Sun, 08 Nov 2026 11:24:37 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
 <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
Date: Sun, 08 Nov 2026 11:24:36 +0000
Message-Id: <179413707633.3630016.13654136728294242171.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+igR0cQt3uqI5+VxGBTuU6s0hlFK+Cjmjfs8gLtFnsY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RH/VTLt0ek1B96v5L1/+/Wo0NWZB5JYjkdNu8PLP0
 gmyW/bneUcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmckWX4b93jeIt40D/Jzp6
 U0sqm+WPBlTFzHUtrP4u/DczuTpinTTD/8Tsc4f1f1yNvVD488s88Um707R8FdjrTvR8L2HSS30
 bww8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Currently the SDCA code constrains the params based on the DisCo for
> the SDCA Terminal used. However, it ignores the properties of the
> SoundWire port, which in some cases may further constrain the allowed
> params. Add additional constraints to apply these restrictions.


> +static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
> +			  struct snd_pcm_substream *substream,
> +			  unsigned int *word_mask, unsigned int *ch_mask)
> +{

> +
> +	for (i = 0; i < nprop; i++) {
> +		if (prop[i].num != port)
> +			continue;
> +
> +		if (prop[i].num_words) {
> +			for (j = 0; j < prop[i].num_words; j++)
> +				*word_mask |= BIT(prop[i].words[j] - 1);

The shifting would be broken if there were ever any 32 bit Soundwire
systems, and I guess we might get warnings on coverage builds.

> +		/* Only handle the number of channels for constraints. */
> +		if (prop[i].num_ch_combinations) {
> +			for (j = 0; j < prop[i].num_ch_combinations; j++)
> +				*ch_mask |= BIT(hweight32(prop[i].ch_combinations[j]) - 1);
> +		} else if (prop[i].num_channels) {
> +			*ch_mask = GENMASK(prop[i].num_channels - 1, 0);
> +		} else {
> +			*ch_mask = GENMASK(prop[i].max_ch - prop[i].min_ch, 0);

Should we handle the case where max_ch and min_ch read as 0?

> +int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
> +			      struct regmap *regmap,
>  			      struct sdca_function_data *function,
>  			      struct snd_pcm_substream *substream,
>  			      struct snd_soc_dai *dai)
>  {

> +	constraints->channels.count = ARRAY_SIZE(constraint_list);
> +	constraints->channels.list = constraint_list;
> +	constraints->channels.mask = cluster_ch_mask & port_ch_mask;

If there's no overlap in the two masks this will end up as 0 which the
core will interpret as no mask and no constraint will be applied.

> +	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
> +					 &constraints->width);

Are we mixing up physical width and sample width here?  A device with up
to 24 bit samples needs 32 bit words, and something that supports 32 but
not 24 might offer S24_LE.  SNDRV_PCM_HW_PARAM_FORMAT might be a better
fit here.

-- 
Mark Brown <broonie@kernel.org>
