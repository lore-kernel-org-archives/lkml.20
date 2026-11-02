Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639226;
	b=Fo4OnkKhcu5KWw3iktbDH3BAbA9rcATbSDNjmks4LQ4k17JV2bxHsEdbeAZ/85YXHw4X
	 JGdsauR5XvNpR3xXyMLkmggncCPXqWhY14M9SO3AIPz/3MlVQFGjzVAPIF7XrWREblViC
	 QHb3SCJoLyHH3ruROzCSK1BmUIXCs+/aQsu8GJaqRMa7S/7r3mBy6i+E6ZXJYQ78f/QcO
	 edqtBPVJZ6RE7nKgRZ+RNjcx7tQFlX3FrD9XjnuApyH3KxMzRPxKYhXeGLFLCa1ExE7XI
	 4zXtcg9as5Qfh+0naCYVX223ysFrxNihC90dK/nN7pfsnJ2tNx4od8530XLsvUCzk1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639226;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tPpiZDKFrIQtvG9yMjofjvqjwXl8aqbif0+kR9reOlo=;
	b=mHUx0mKtywfm4qe+crJZ2DB2eTUI2Hk802MwEvwJFlbMghyC0HxU30i24krZkDCWMmGh
	 6J0AwAiN1tTX7o8XczDmGTJQBjxocPG09OkoSqn+aalzL6z8WZEuzgHyfOHW9iU5f8418
	 YnE5p4IbrBuusgRDizA9In9Ia4kZjSSV50jAmS+PGOEaaZ+cr1VnK/TxwAASmtuwPoR3z
	 /yWnvnw4aQx3HGaEUXsKL6cXzXWQiokzx61bLm56qWVzL713eIoxve8pOZAvPVzzSFT2X
	 1SopQpWUFDBrTWRr/+31Fj8uGCt1LsFUzmwEiJonDmh8Tn1T7YRw2nYD5RGodG0z6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mH88SDxT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB09606A905;
	Mon,  2 Nov 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mH88SDxT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B011F00A17;
	Mon,  2 Nov 2026 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639225;
	bh=tPpiZDKFrIQtvG9yMjofjvqjwXl8aqbif0+kR9reOlo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mH88SDxTBmOAkSE4+B2JPJDnr0NJ4smpk02xsDqP05zsiJ/jC2u3eZVLhKcmeROJk
	 mi450vj7OlYhYeFklocAvJqA18XrNIpy9SOT7EEWk+dLJMX4nCXUySb8fyyAhGsNLO
	 tKrG732vWiIq6ptAmQDZL56C1dIK3qrYbvnK/kqtrzzU5LmuaE+U5COLXlTMunEVTW
	 fy7RobyqQVI859RkMO/YOzzCxcHjnAGQZqXjKvPyQUmeLxl60cEKM97KCsPam0xApm
	 uTD+IpEYfn/KQkzmfxN7yKIWCOFBFDLDgyuw7BlLxNl64ZChW+xmyocHaA8RFtWNJa
	 Vyn6QdIjXzo+Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C79CA23924B8;
	Mon, 02 Nov 2026 17:07:03 +0000 (GMT)
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
Subject: Re: [PATCH 3/3] ASoC: cs42l43: Improve pop performance of the
 input power up
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
Date: Mon, 02 Nov 2026 17:07:01 +0000
Message-Id: <179363922126.2092401.5458739879351265933.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Sn44wvmJQcYY2MXBVaGYD7pH5eVkxHkHZ0pAIpv1B04=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeHDa//jfRlfvU1uJLvSfbG9ouCu9XvsB+Uu2GQnvP2
 x33K7dd6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBENtUx/NOyXr6tvJrp6euQ
 zgd3DYT3F4h6xQT6RPtOij570kfkTSzDH75c0TyjxHbFTVYhT4t2r3wqukDPW1lfdTfLqWjeH+1
 h/AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> cs42l43's decimator is particularly susceptible to discontinuities
> during startup. To help reduce the pop noises adjust the high
> pass filter settings whilst powering up the microphones and add
> a sizable delay to let that filter settle, then restore the user
> settings.

>  struct decim_info cs42l43_decim_info[] = {
>  	{
> +		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
>  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
>  	},
>  	{
> +		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
>  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
>  	},
>  	{
> +		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
>  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
>  	},

Sashiko is flagging a bunch of concerns about the accuracy of this
table:

   https://sashiko.dev/#/patchset/20261102155440.3995136-1-ckeepax%40opensource.cirrus.com

-- 
Mark Brown <broonie@kernel.org>
