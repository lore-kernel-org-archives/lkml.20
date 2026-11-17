Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919776;
	b=1cCwLg8OfDlQ9khFetPUzBj/vhE5ZpT0GCRXpFMS3M2GBkXjptaKNDEV5AaH0yE90iRn
	 6bUrgtWvE03+nT3jL8HoSY5k84v2LOhQ/UoGr5CnSBwdL2XlBoGXg1OOy3MGog4dtCxVd
	 Kr3LX1fRWrtX8L3ETQPdyFaS7UiQgB8k80ks/qvRXPMBOodHCOfTvzSuCQFkC1wE7PMKt
	 4D8pceeCUuLt3pQMUemJJbPZLBAaJtuwyPwdadDoj8AgptxFaZIRmtopAMpZiFApThaLS
	 jxNc6gbgEJJaOHw5OIJFacTRwc0hqTgBjSU3AZBTB5zdqtvNBFI873Yd29qyYFZ+YVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919776;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NDXZE5uN16UvOOflyM5pOpVzOkug8tVrjeti6ZNqlOk=;
	b=fpND4qIDHh/DyFx0UeLNwCL1bmCLwE8FA9Y/I8zfSPFuX0TRDHDYBiO8+aUAa5EPN7Cq
	 4VsLfgYUmlNAl7nda0+Y6Sto515Wmj9pXDLz1sLSPmIt6QDcBKYQfLPtm7Opqu3rnpRY5
	 K3OAQkbWsHsQPgR0yBYsLq8jP+E5oFNmuN4F7PIfuAtG8ri9rQuwiGCQD774dTppK4Y5w
	 7QmwKlIB+V7hL8xSc09GHn4kWMB5R9Qrn3nz3nSy3TAzQc7RPxIxXvm/xlvH6C+QiGEFJ
	 itaVxivl41aQeTnCuR5uaANS6oqSVWNtMXzB/SabV9A5QWsvZbA5fiOzt6gEhKxUi8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nut6pCgX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655D606A329;
	Tue, 17 Nov 2026 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nut6pCgX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B239E1F000C5;
	Tue, 17 Nov 2026 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919775;
	bh=NDXZE5uN16UvOOflyM5pOpVzOkug8tVrjeti6ZNqlOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Nut6pCgXoh+kAmsX2ASzjgctAD9VtVsFeGVHA5qIw8RWIYMcizQCIKD8DVf6sGKeX
	 0FQg1J2QRXe7Q5DBP6zsRTZIJS1pfmVFrcKujmdIvKTMxWwkLuiA4d9nVjCIe8g/aJ
	 oUyBOXJUpYA9eTMoHkleUYnF17c5Jr37AxJHqI2xQSxwyyC8Avda1Sgkf3e6cRuHDJ
	 2vgivel8MK3Jkes3aeymyZ4yMs4F4LlUI+4sJcpl4frcHiENRc96E3LDUv4MKo7j9O
	 12PuNHxAqKFyrxResu9VmopxolYSr7JBq+qz74DcC7PfumHlmJ/+mfip049tuhHMfY
	 jT9EA79B31bSQ==
Message-ID: <7bebe58b-6a87-4458-bd23-a672eaef8760@kernel.org>
Date: Tue, 17 Nov 2026 13:49:29 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/22] arm64: dts: apple: t8112: Add USB4 ACIO and NHI
To: Sven Peter <sven@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-21-1f80085f93fb@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-21-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2026 20:36, Sven Peter wrote:
> Add the ACIO host router, NHI, DART and mailbox nodes for both Type-C
> ports on t8112 and connect the host routers to the Type-C connectors.
> Also describe the USB3 path from each host router to its DWC3 controller
> so the NHI driver can create the required device link.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi |  95 ++++++++++++++-
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 186 ++++++++++++++++++++++++++++++
>  2 files changed, 279 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
> index 562e7a25a1e8..d0dc7eaaca35 100644
> --- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
> @@ -13,6 +13,10 @@ / {
>  	aliases {
>  		atcphy0 = &atcphy0;
>  		atcphy1 = &atcphy1;
> +		usb4-0-acio = &usb4_0_acio;
> +		usb4-0-nhi = &usb4_0_nhi;
> +		usb4-1-acio = &usb4_1_acio;
> +		usb4-1-nhi = &usb4_1_nhi;

Sorry, that's a no go. I will be removing all of these which were committed.

Best regards,
Krzysztof
