Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3A3B813D;
	Mon, 28 Sep 2026 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589264; cv=none; b=KlkF5DUXuUouFI2lHFNcz08X+z8p/EMm8XSLeA912sjFQfJ4353fKr3Hy2C3BGwtbcuhyQS71+qtIgTIvkdt4feGeu4LyanzT0DmnrltiEiwGbcAPZphESs6fZSx1Oj/GZrE00eeGIpSf634EEoqaezEgFTbmUDM5wHRe3pacLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589264; c=relaxed/simple;
	bh=uYatMVLSV03EmJgTXrxF+9stvEOX580Lwij0vR0KcbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4+2/rSmbmn11ok+Tw2RsSnyb5gR25bwvyCVtP2IBSseUv9xsmqDehcVb8xQcgKNRijhsuVVxulFj8I2MpIlWhA7Tgjjt84pInHJuHrxFUj7mlLW4OGO66Aag+egD9BlaEFWCeGI0925mQRu9n1G6hXI4HFfky4y6yqiYVfyqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6UgGT3C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6UgGT3C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B5C1F000FF;
	Mon, 28 Sep 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589263;
	bh=w2RS/xxMW4j685aSXnFhy/xzBc7bDP8enBoN/0ACKJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V6UgGT3CwHGxbXbyaMm95Dd2M0CFYObVt+NXiWGsFTlgNyvSbWHgXO7aWe26u4Ysn
	 HzwHZRNKIv6FJ3NBppiWG8pOmbimiifGTh+LiYoDYBOtE2MGNw61EspchSys3XtvT6
	 2rrvzdUGVI9VyvUamONwZzizucrdTCDxSYrYXWMJt76W34hdZojhu+x4Ui/ZFRo2Kr
	 1yA93pP+W62cMq66RTnV0RrLlqm8NhKGN3OZG2iR6elSwOTjaJx3D6bucCJJV2vyaC
	 RIhpixdNKImcpWr1/0xSyplSB37d/LuhfpMrID1UxgkIRixgJpSml3YfpTXiIBBKYR
	 Jka52ZRFXJ2ew==
Date: Mon, 28 Sep 2026 11:54:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
Message-ID: <20260928-native-hornet-of-luxury-81edcc@quoll>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-1-a760312c076c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-audin-v3-1-a760312c076c@baylibre.com>

On Tue, Sep 22, 2026 at 06:00:46PM +0200, Valerio Setti wrote:
> AUDIN provides I2S audio input support to the Meson GX platforms
> (GXBB/GXL).
> 
> Note: GXBB and GXL are not known to differ so the driver binds on the
> 'amlogic,gx-audin' fallback.

What the driver does is usually less relevant. Here, completely
irrelevant. Explain the compatibility between hardware.

OTOH, you cannot have family compatibles (clearly documented and
explained on every beginners talk), so what is the GX?

And I already asked for this:
https://lore.kernel.org/all/20260913-inventive-millipede-of-certainty-dd58ce@quoll/

We have it extensively documented - in tree, in talks, in existing
examples - how this is handled.

Best regards,
Krzysztof

