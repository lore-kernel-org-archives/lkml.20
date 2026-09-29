Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E6438010;
	Tue, 29 Sep 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677006; cv=none; b=HIVk1RJgraex9Hc7BIsPBixdJ8jkeLHZMxnekjV65mB5D3uZFnVYwJh6RuVWUd0zcocknWjBmutnA2V2GQLtw5LcJZ+iza03N6Mlbd5/hnwvwZAYFr0DGhw+ktNmfwPZnpHSg8AyhYFbPVrNkLvK2X6aYaXTiY3uTMJYP4G10cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677006; c=relaxed/simple;
	bh=Z9tLdjmh+/oHeGGd6nqozIari1RMlpQI3JFDPu3/koo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cGRVfi2yOIH5QNqolu/xmU3N4rkPXuKUtULb58pv/1m8YdT7s8umSeQsIbBMfVAqv7k9WM0+bYtTsd0Oo9mf8c9jIsYHVNhramdsBN32ndKz+wmhvPBq5ibaft7kbNdrgFLKmpG744CeELO+rUmQuLO/v4CEFj2sOh+6I96n0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiBzsEHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiBzsEHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EF81F000FF;
	Tue, 29 Sep 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790676992;
	bh=nXjyn6rWbF63j0AVpylNhqNswer9m9ma/bfZhH0Gds0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZiBzsEHTKCQVMOd0DsobFyLiTi9xAS07BJqrTMbHiqIxpkFC35Pn1nJmowG7CUPA3
	 GEwtxz3DSr8NoKPkAq5fQ+1cMxFIYVswriQpq9A1vs01py/ekD/tybyhUS3dPGVAOE
	 iVRXqko1gc1ZDAURZg+gtndSrdfIPNBRssokkRavYcNz1YBH+4btKy8oKnwaKJ9K+u
	 IU3GycS5aQllA9F2n6MyI9AJZdjqB6jkmEx2GhIOxSCO6Cj/V2eYtNK54dOIUlr7RP
	 cSVqyGDxUk6doVQQnL2ZjPk+DUb7Wog5FnycAV7zX6QHIJyAg3VIvSIz33Dq0Q8V4G
	 Yj/T3qYIi+VzQ==
From: Lee Jones <lee@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
References: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
Subject: Re: [PATCH v13 0/2] mfd: add X-Powers AC200 support
Message-Id: <179067698946.2930896.7110252222638220059.b4-ty@b4>
Date: Tue, 29 Sep 2026 11:16:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 22 Sep 2026 10:34:33 -0600, James Hilliard wrote:
> The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with a
> paged register map shared by its audio, video, RTC and Fast Ethernet PHY
> functions.
> 
> Add a complete binding and an MFD provider with audio codec and TV encoder
> cells. Describe the audio DAI, analog supply inputs, TV encoder display
> graph and optional bandgap calibration in the parent node, without
> separate function nodes.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: x-powers: Add AC200
      commit: 687e666eeb2039f8720e27469d4b05b24eb4650b
[2/2] mfd: ac200: Add X-Powers AC200 support
      commit: 1d53aa3f574b77525a39c5d9c5a32882c6f699e7

--
Lee Jones [李琼斯]

