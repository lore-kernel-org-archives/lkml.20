Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782931;
	b=GPJZoEPf7CX+fJm9ZAZlTjbBN7OYglcoZIw5U6EsU6wDXzQG8vWc1c8j9VbGiP8gKjHr
	 8vvTEbSTJJfMXO8pFzD98PWFGePHL2LkHoW28ALRfA1jH738qAHb0rq/N1eW3YN0YV0kC
	 NXN30wxn8NcvB43BtJ1qGVDz8Wc8VrJ3Tk3F0VBKlRUm2DBvE8sFnV6FL31s9wyoxo9/y
	 LxeDOZ3g9xJBtC+6oCrXOWcW3gq4NJSgyVxDZN4Ai4p0ob85cwSOYTUXYxIxvlYCiQcHO
	 RVaOP5tCmKls955YsOysnD/v0nVauls7pHHUy6FyanXO0d2qMoCbVclEVqyr2unS/mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782931;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=jAf/ZZGUQiG0sLvlhoisLQBnx7eBtPaDBFZqlZYAcn4=;
	b=4dnk/4IAqOObmWKupJloVfbH3adlGQXy2bYPc+YaScDwoGGPkMhAij3ucONhUB1jP+UN
	 FQYrT3cSpfw7QVP+dhtygvpVPi2sqjj1D5vuXXe7NxYuiALmOuLXSwZ1qjvIWx+KGqpm+
	 RtfAlxfgsC26/06GKE9wu5OZkAsKvoV2QoqUlObdaqKrGW6Oc7BIUMdwF0MKBlC4c4qSX
	 dcaptezVAgTnV3pc1I75n+luCOYKIjPnWOhADKCt9+5w9LQDr+NrqvB0twM3CrKdVZTcx
	 ro9Hpbg5YLPyIq+ETTnwdYZEUewZm7rhaIb0XBAEtaAjARXHRKNiuzmXtK722zDUsQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcR3oasB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EFB606A320;
	Fri, 23 Oct 2026 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcR3oasB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D571F01825;
	Fri, 23 Oct 2026 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792782930;
	bh=jAf/ZZGUQiG0sLvlhoisLQBnx7eBtPaDBFZqlZYAcn4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=IcR3oasBpK7zRcENihfBkoMc8cPK+9KGfkCqsvY6e7buRncm4eB7tHwTlSiqfnNLw
	 svAhqEsqiICnRr2h0dFr8v/pcpE6sNg+ZnlCUHiLMAMLUxmXT/yzmApZy5/hhcOvt4
	 mcEEMlutJ7i7+azfDuejOsUr/5yLSAATa0lYHYdrz9g7Oi6v4ZrlRQHjL3uoI1PCor
	 wdPjZtxKTLEttW6gwU69w+rtDFZdf2bXvAWdIjFtsnu4sA7hAXiYUtBd+m2z+Nx+yz
	 h5QDmkyfieOBl3kIJuQ1qnk/+RHt09z7KKzJVLtU+YVLS9/xnOSoB0/+Nm5JJrpiO/
	 WXylhFlRs1vYQ==
Date: Fri, 23 Oct 2026 14:15:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
 <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
Message-Id: <179278264934.3497392.12554729400771682054.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: mfd: twl4030-audio: document
 preferred name for external mute


On Thu, 22 Oct 2026 13:29:47 -0700, Dmitry Torokhov wrote:
> Proper names for GPIOs should use "-gpios" suffix. Now that the
> twl4030 codec driver has been converted to use GPIO descriptors in
> commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
> descriptors"), update the binding documentation to list
> "ti,hs_extmute-gpios" as the preferred property name and mark
> "ti,hs_extmute_gpio" as deprecated.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml: properties:codec:properties:ti,hs_extmute-gpios: 'anyOf' conditional failed, one must be fixed:
	'$ref' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('$ref' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

