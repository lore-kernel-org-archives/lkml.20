Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580131;
	b=E1EsB40QSscwAhbkUjSx5BY+eXXyBz5KVCV7XDnoRQ9AmWVvv74lD8e8k4DuckyRTrh0
	 PTk7P269OF+P9Q0YGYGAYtkJvjTtApzhgsR/gMmCSvcJsdNBDuS6DBZFERUuIphzD9EF9
	 Ppioppzt3gn89XV2BiEJun9K20cHnpGxAM9ZFI8E6TnamejWVZRGE+FMdPB5itGHZfpyu
	 GuZaFKoqp10E08atb3gr0RSu1bpsSCy93VvSpEThSpHLY82jQSG5RHK3fBbwIF3GuIzQs
	 fc8TxaLDfxkNrKZQ6uP+HSwikjBL4fpOnBOJtGXJ8BMUsuTIToUCxL5SI9V39yqHQAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580131;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lNzgQv09ZNdkTLeSeL52VctJTRtMJtQCI0H+/MVWODc=;
	b=VuAd7CM6w8zDXyBZQ1bfvDZPVZh/lU5ujHTe+hBWbpH88oqiSQhmB4wLX7VIPWh77B9P
	 VL1Z4xvYa5La7UBz9N1cNJsSbvWI8miI8XiLDThIme7+eBd5HnOTH/Phz8M1/68QBUgjO
	 oSVRbuCBLnfpYkqBH90MnEcAQVSUj4RNAT2EqcbvpKqsGOjNiGdhWXiCwTwzulkbqgIaM
	 6xADwqkV4rhkrgTMCdV8bujvVC3I329DUpJUpm5JW6J6SlEpB39OntlZ2MNRiD/I5A73H
	 zJxztY6NWkCfh9jsrJb7p4ZTKMMnhAO6eoBI+Ynl1+HiisEMy4hD0K+Z5FFXOV30e/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPjxic89;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C8037606A890;
	Fri, 13 Nov 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPjxic89
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C2A4E1F000C5;
	Fri, 13 Nov 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580131;
	bh=lNzgQv09ZNdkTLeSeL52VctJTRtMJtQCI0H+/MVWODc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPjxic89jp27FBMG72SVoJCjyog9Fk72fa0sSThJpbNGUhJNO2tRE22dZ66TunITa
	 GV/peItiCNYgobVHdnuzGEn/MjyoYqK7gFw3oFM9eYQa6yipWvclbkKOp2QzMzQl9l
	 nx3Vv1Aksfxg5C0tZgQYmXrzBAEXrb3cOIZM7+0KYj6E3Z7xo/SIZ55Pvwln0M86sf
	 eKcLPdo59HY/ep/rE6YGqecNDaJJcl+cFRLif2epOxtexzQfgjUk9p7WR/RKbXEiqh
	 PXOI13Aq1+ScqVFkFSS3fKy7thLkf6DH76uC9+Imzzf20aPpVuhcJ8EoF+RtFx1i8S
	 NMkHXo0ctUi5Q==
Date: Fri, 13 Nov 2026 15:28:47 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
Message-ID: <lv6hzzf4kif7gio6vuuvy4dy6ugcnkelnfvbrcow3hkgvvondp@mrirempjyi64>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
 <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>
 <20261113-influential-lumpy-goose-68ec0f@quoll>
 <zo5qopdc6gxeoonqxohmnrzwmmrwa3wnim72op5zq2cjtn4pjs@kdjl3hwgxph3>
 <4dc982c8-af04-4af8-8a56-66459f91cf3a@kernel.org>
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
In-Reply-To: <4dc982c8-af04-4af8-8a56-66459f91cf3a@kernel.org>

On Fri, Nov 13, 2026 at 12:47:16PM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2026 11:45, Bartosz Golaszewski wrote:
> > On Fri, Nov 13, 2026 at 11:07:38AM +0100, Krzysztof Kozlowski wrote:
> >>> @@ -229,6 +231,7 @@ allOf:
> >>>            compatible:
> >>>              contains:
> >>>                enum:
> >>> +                - qcom,nord-qmp-usb3-dp-phy
> >>
> >> I don't understand why it is added to two blocks constraining clocks.
> >> Does it even pass checks?
> >>
> > 
> > Yes, it passes dtbs_check in my WiP branch for USB nodes that will be
> > sent as v4 and takes the binding changes into account.
> > 
> > First we add the "qcom,nord-qmp-usb3-dp-phy" to the if block that sets
> > minItems to 5. Then we exclude that compatible in the block that does an
> > if not and sets minItems: 4 for all non-matching compatibles. This is in
> > line with what's being done for existing "qcom,sc7180-qmp-usb3-dp-phy"
> > and "qcom,sdm845-qmp-usb3-dp-phy" compatibles.
> 
> Oh my... what's with this binding :/
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

I will try to untangle it but let's do it in a follow-up.

Bart
