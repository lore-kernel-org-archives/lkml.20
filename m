Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C12F3B1BD;
	Wed, 16 Sep 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575354; cv=none; b=BE62B41ybzs01gwF2tN1XPDlQoBg3FScb0ZdU9lNgZL1tq/NMMSpklpfm8JktYgkYup2PGBQBof83APymGdaAUm1XHzCfOwLb7O55HhtMYjubn6QCwZdzuLByLRmCED9atAUmFgChnPaBmQisHpqZK2ZDx+v82WPlS+j8ZRGlzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575354; c=relaxed/simple;
	bh=qWInVneJ7RbCBusQmKKzOTQjNWP0GzmObdbyX2HNE8g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XwTQQ4GgSr2dEXa7DbHUxP1NaASh7DUG6Lo5X60PviLNanvOHlImjZd7+MWgamOqXKaNxyZpODRqaJ5j8hIUzGlckz5mLUBNMhdNunnKfgKzykMRaJnGjX+59rmXw06Hb0QGJvSbYA2zBHpHlY6BunfaP6YdPtfqWxNLnS0llY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oom4I5jc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oom4I5jc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6B31F00893;
	Wed, 16 Sep 2026 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789575353;
	bh=gSmdzWYpg2kGEx3qGnltYO8Ah+wVn8kK+NM2C4sxKWA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Oom4I5jcAehOB2uY90+Mn5KHDMTW1Qvurd0KRvUAwDLfRV+uNwRkYAWq46aIpe+dM
	 Q4eVJeLx738DXbbbDA51cokQnAAR9Uzu4ItO3dcKGU3VLl25J+2L4deo7DMhXwQcTe
	 t+V2pfi/OCNMui3p9eOT4iPtQX+KW2VFYEV3bePx7lenk33OZk24DFxmT/wOsgYJAC
	 HNK3rzU2VjIjmYlWEmlPbzlk/GuwzoFl68pjk2ADpm9CfEOZ25RFHlafYtw1ZbekZE
	 aOsWxbWdcj3x9yUKHKTS9RhYSeA9sljwxdeUvsnYk4xmS6iHwUf6uLhsCv6MpKlrD5
	 65Ba1dZIFs6qQ==
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Eduard Bostina <egbostina@gmail.com>
In-Reply-To: <20260905215234.454266-1-egbostina@gmail.com>
References: <20260905215234.454266-1-egbostina@gmail.com>
Subject: Re: (subset) [PATCH v4] dt-bindings: mfd: Convert TI TWL6040 to DT
 schema
Message-Id: <178957535112.1772310.15751079430814296463.b4-ty@b4>
Date: Wed, 16 Sep 2026 17:15:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 05 Sep 2026 21:52:34 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
> 
> During the conversion, the following updates were made:
> - Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
>   misnamed in the old txt binding.
> - Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
>   because modern platforms do not require them.
> - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
>   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
>   twl6040-vibra driver.
> - Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
>   node is present, since the twl6040-vibra driver unconditionally
>   requests both.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: Convert TI TWL6040 to DT schema
      commit: 40bdb5ad52ceb020925557e8d7293bd27262c4e7

--
Lee Jones [李琼斯]

