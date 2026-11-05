Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893578;
	b=TWab8cBhA2s2MixW0APr8vSyIMForwgM2YTl49I263tX8+VT9Apbfzq7f83XaWgXOD5e
	 J5rciWBvCxauagU8cEtbVKA4Mg87yCp7htsJ+Je6e8TPeXx6sNoR/5T+3CAAEbhV4Q025
	 Gruqx/30q0ttqieeA9/lkqxkLpFGzbMMo9fcaectSBH6WiA+fkoA0zM+/QHn6KVyxp/PJ
	 eWf7JUx45xMj5pjEjlNckCaxmGz8/sEHzmbUK8SPLlyYkialKgWWQb7L+bCeHFrEHf2MD
	 q193FHJFu9+rsOT4liJFH3Xe5WvqyenPk7x0kvgQ/vwAHMKuQJ/JAavxRIjEU8thNUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893578;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0/qr3c1AK2Tepy8EGz4Od2AYxn0rh20DABwNQF9edZ0=;
	b=R/r9NOM/xywxmdh85tcd8vuYqe5njNyUy1mA6NycJuXNMAJ5x+4pg245omKxg2uF8MsX
	 3Aa2U8XerZIkLNRHqB5iL1HeFZAWSQW8S6yDfUnMBACqmE+UWqZKRx7vzXPo4ZASa2aZX
	 6asPs8Mf7CbEJypkZlbW768frl42cegFjpaIa4ZXilwqDgcbOgZCxi+z8phwtQTj+mfYY
	 3LKuJmPyb+I/9q2asoF49S8WXecl05QK5jx90xkmuVXSnDJDpPe4s6aUoSvxuCfjT8Lsl
	 S6pLSWe79etAQUTBFI5v/xnW56aSQsGffDj0ToI4ArlseWoJHeNdEfgSDR/7lroE/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddDktyz0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC0F606A332;
	Thu,  5 Nov 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddDktyz0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577C21F000C1;
	Thu,  5 Nov 2026 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893578;
	bh=0/qr3c1AK2Tepy8EGz4Od2AYxn0rh20DABwNQF9edZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ddDktyz0itKAhRuKPWwjmk5eRxPR4DfDxSQBq7PNer7dvt80IQf3AVH+fQTXnsQdm
	 lg21Dnq8z9J8UGJ70T/tMMOmYWbwmj1PqxNyiclrlk/1UxJAzfF0fPRuzsTD24VSY+
	 bx8kYUzjuuAkuiu8TD/aFO+xouTiV5tbHxiZ/N0Uysax0JQCxNPYmxCSXANiYTeHth
	 W6C4Pc/wUjqx+G0aS4dmmeZ5JWsqlAX2QJHq8zf4hehluDnqzkNN8WDzdUOzbzmcpt
	 ZSkZcgnCTxdL2eC4AzwNSIZVIEVh34/6QZ8qCQdNG6FUOFZ8Dtt1LZSINH+8Jp03QQ
	 HcurQHc+7iQzg==
Message-ID: <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
Date: Thu, 5 Nov 2026 15:46:12 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/11/2026 14:01, Loic Poulain wrote:
>>> The CSIPHYs are connected to the CAMSS input ports, which can then be
>>> multiplexed and routed to different CSIDs. The mux identifies its PHY
>>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
>>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
>>> connected.
>> I could not find that information in Glymur HPG, but maybe I looked
>> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
>> looking at wrong device description/interface...
> Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> (CSID_LITE0-1). These blocks select the PHY source to be routed by
> programming their PHY ID (PHY ID = PHY index + 1), as defined by the
> PHY_NUM_SEL field in CSI2_RX_CFG0.
> 
> If the CAMSS port ID matches the PHY index, the port ID can be used
> directly as a routing reference, which keeps the implementation
> straightforward.
> 
> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> makes sense. In that case, the driver would simply maintain an
> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> } to PHY indices { 0, 1, 4 }.

The media-graph informs which PHY connects to which CSID. The 
port-number in the DT really only identifies the fact a PHY input exists 
- it should be considered a mux in front of the set of CSIDs with the 
media-graph being the route.

Since the route is runtime selectable, the media-graph is the boss, not DT.

You can try this on any CAMSS device right now, PHYs connect 
independently to CSI decoders.

PHY_NUM_SEL is derived in the driver, not taken directly from the port 
number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is 
the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.

More work should be done to represent the fact-of-life - the mux. This 
was discussed extensively in the standalone PHY series.

The ports being numbered with the PHYs was a consequence of the PHYs 
living inside the CAMSS node - which we have the opportunity now to 
break with and should.

Port number in DT should just be a linear 0-X for the number of PHY 
inputs. Which CSI decoder that port routes to is still a runtime selection.

Honestly I don’t see much value in continuing to treat port numbers as 
hardware mappings in DT now that standalone PHYs have landed.

---
bod
