Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869158;
	b=RgUHk2GYJo93vLheRGLTmchcebysup06tQg008Xtjm4IO6pNXNbjxQnuyEAhci/6XWeJ
	 AilAWA5IzXST7MueVLv9Zno5CDXn0c7y0jLu6WPwPXqfDLIigXb7zfRifA3q43S5YuCyi
	 PkNjUpvzPjV4OTkwvpqiWjIjQKQ5+gYyM+qJoqb0vPn4fYeE/ZO4MB8ELkw/+lD/U/0Y1
	 WZtNE6ygRQO6BPitkbIPeg8YF4UvfZ5VF3w977CFJwOnmxlS0IWGhjCSk0+qshXWK8Suf
	 5JaLE+ZJ6XgSMHxDUGj3YQMDIypsOSdjvT6dsTDhnQB/Hm7aE98O0m52bbqUdxfQ7Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869158;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cperLeOZ10xvR2QABkMcO6kpsD+q+HraFWCgZLyuZXU=;
	b=P+YCDiv2OPRdLn5FU1wTlRP8Tf5pP6JrD/bVQUYjNapJw3Kcn7Ovp1scX8PujbhMWVkS
	 +oUgnht56W7zglhUqnpGqxUl0rbm/hctoCQ+4DrUe44wE5kceOeEfJh+DxetGynyQ2lpR
	 wgqYtHpWQav/NuzVHiUEd4a9YTGbYbeSCTo5eDp61VcZ+lLt2Q1iNFriednY+LW7gqG30
	 5MZg3Tamwi6pWc4xViGNidl7fpiMQq7cHl6QwAXRFsDePULeqOiRSV1Z2CTmrijWc2nAh
	 BqDIWfD52CujorfHBnmkqiiG8JGAq6AHBv+YkhkucUbRo2zyim7gTdoGxLgB88NA/Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKyQ80vO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 1E6DB606A31B;
	Thu,  5 Nov 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKyQ80vO
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id F30E51F000C1;
	Thu,  5 Nov 2026 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869157;
	bh=cperLeOZ10xvR2QABkMcO6kpsD+q+HraFWCgZLyuZXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GKyQ80vOubI5f7D0k727ncTLW+M2OBbpwOhV01iS/0zHomLcKREC6XdQZwXXF4SLj
	 X1ZDODU0Bk+cWTSi6/5g5lxIihicSKEvZUqxsxj7cWHZrmBXqRB8oAoj2TcPUYOx2P
	 Kl+dfoplr/48uAxn3y/GOe7WdEswQ8XlT28FSzzr1RXh3McfvPLJOrkuVor66LAgEk
	 RpQIQV2Ilh/BLsAIsFnGmGnmAv5V6lyFQMu49stsjHMSQz7N6oIAXmBeyom8JREnQP
	 tAKzWVYQ20iZWR/5ajcwikVyDHj5xDThg20bYOBDNMTwlbNRsI7x9ol7Uwm8lT/clo
	 OQr3ekh7eWC9w==
Date: Thu, 5 Nov 2026 09:59:14 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: cpcap: use the platform OF node setter
Message-ID: <hnnasmztl6q2pvrbttc6dmzp5hqroxiianvarlkbmq25o3c4p4@2piw3ttc4bgl>
References: <rc-review-20261103-28-afc55c614a25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rc-review-20261103-28-afc55c614a25@gmail.com>

On Thu, Nov 05, 2026 at 01:53:26AM +0800, Yige Jiang wrote:
> cpcap_codec_probe() gets the audio-codec child node and assigns it
> only to dev.of_node. Platform device release now puts dev.fwnode,
> so the acquired node reference is never returned.
> 
> Use platform_device_set_of_node() to synchronize both fields and
> give the device its own reference, then put the local lookup
> reference. The device keeps the node until it is replaced or the
> platform device is released; a probe retry also drops the old
> device-owned reference.
> 
> Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
> Assisted-by: LLM
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261102 (2637bdec0535).
> Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
> COMPILE_TEST=y.
> Baseline and patched target objects built from this exact base.
> No full kernel/module-link, hardware or runtime test was performed.
> AI assistance: Codex (LLM) for ownership analysis, code and changelog.
> 
>  sound/soc/codecs/cpcap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
> index eaaf141dea57..eda72fe830ae 100644
> --- a/sound/soc/codecs/cpcap.c
> +++ b/sound/soc/codecs/cpcap.c
> @@ -1761,7 +1761,8 @@ static int cpcap_codec_probe(struct platform_device *pdev)
>  	if (!codec_node)
>  		return -ENODEV;
>  
> -	pdev->dev.of_node = codec_node;
> +	platform_device_set_of_node(pdev, codec_node);
> +	of_node_put(codec_node);
>

Just use __free(device_node) when calling of_get_child_by_name() and
avoid having to call of_node_put().

Bart
