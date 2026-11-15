Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764189;
	b=od2Oy2NtdbyLBn5GyWSTCHLLhCRu+2jAopCdDDTuIpbm5ss39dyK3cTcIeRBfte0tHPw
	 AJG2xMVb3MzQ43olo+a4K5rUh+xzmjPzopaloRqEdDOtMAus5ujItmI+N0tx/5s9DR3Z8
	 F/XfWmaik6u5bsRBMDPhTYjx9My/IlKTpAZw5x1cdpNiVY/sefUXkq2gKYbaiPhJWazjH
	 MnDDs81s/LlHLJVlwkqPU+us/D7yDBzSMNixRHg5H337guZ/QX1VjhOw896hqARu616if
	 y6Y3JGlNHKTOvBcwnMqFgI4lp/L0tmvpdzfyRkA++FLDWFY7Xk/HleNDm9rE7VJPeGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764189;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8eceGqRXAVV+/Ch92OXhS59R1x5EZsTmMijdFTDM48M=;
	b=0SONTjm2EJnzeW5Xql1lnQx74sS8gupHObLxFw4WkUJ1ZeJM6pmMtAXD6YOhWR/iRX9h
	 ppz+52E9QqElQQuPzdWqtM2VYT8TmM4WP+NO0QhUB/B0rGw5Tl8EAshdZ8EKLU3q49ZKB
	 V1f1BdJdw+TTnrYewoW8Jbkfm2DliKZraaShMNEUi4zYuvPHWVgpFCYAbpi+lrsivU9Qk
	 a94wgpSRB/Roq2P1RbY47l7rM7gjnWwQC1zg6NZOUmq4qXKXQKjHsN5qdu9V6P2XlIUru
	 RTVIh4xqeAw5mmGJYNjT4dFnkqKFsxcNh2Q6NLLSmY2DNUVXSOGDKifdwj4EnzXOUUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRabifpn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DFA606A332;
	Sun, 15 Nov 2026 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRabifpn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A35B1F000C4;
	Sun, 15 Nov 2026 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794764188;
	bh=8eceGqRXAVV+/Ch92OXhS59R1x5EZsTmMijdFTDM48M=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jRabifpnq1B7zOHWV3z1wCkYz23//k1iJS43dci4j0WVCK6nC+d0YXW9w/ILGJqp6
	 7P3+nPCCg9UD0KH0TXb/VtaZl7jZD2Y0fqs4gNyr+hMZE2Dm/GGdo6J/+Rr0jDglay
	 Cru6roYbi5rzEJUEZvomLood9/B2gMU+c4UNdMVwT21PO9Jj9yHOd9AZ2efpgB+uYi
	 fKej2iE7n3/90+5R2sBzZWRlSzE8SxXtTHnt/9MpZI1EZytt9TOAtOlIhUveYkhumJ
	 Lml73M6bl8owJG+vzJRdhVj8e/gP3GYOwwXeX6rUkl6sMO6jQu4kgEh2Bc7Wggg29+
	 TuaizpfhYR2cQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 762713386D11;
	Sun, 15 Nov 2026 17:36:16 +0000 (GMT)
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
Subject: Re: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on
 links with more than 8 DAIs
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 17:36:09 +0000
Message-Id: <179476416981.140154.14343442697827559163.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QnygDcPT67Ji6OazEsDZCOuFyKT6QTxycpva3XMVuSo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+vu0uyufjfD89b7LZ1DketX6aM7oa71+R/W58e8nh9
 8v/Lq7s7ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEpOUZ/ue99iyfLJl+kW3y
 sWuHq9b1nmROC5FKE5pjv+ysH/Nv+XeMDAf2rWX8smvRGr46nderXI5lvVqXlrhHYPP7m61XX2Q
 4/eICAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> snd_soc_compensate_channel_connection_map() builds the default channel
> map from static 8-entry arrays and fails the card for links with more
> DAIs. A speaker protection link carrying both the amplifier and the V/I
> sense codec DAIs of four speakers has about sixteen.
> 
> Keep the static arrays for links that fit, and allocate a per-link map
> with the same 1:1, 1:N or N:1 layout for those that do not.

> @@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,

> +	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
> +	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {

> +	} else {
> +		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
> +		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),

This is a dynamic allocation bound to the card's device but it ends up
in the dai link which might be stored as static data in the machine
driver and get reused on a rebind.

-- 
Mark Brown <broonie@kernel.org>
