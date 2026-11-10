Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334517;
	b=TbvBvoBKRVq5eSeriJOoWF6p1VCasi4uQ155w8owYWPbq34gOGGonmYegelutnDIMLtr
	 rANr6UsMgLeOIXrce6kVMJDlP+wBpruqj+y6qLZ26LbBVwV/V4Hud6Lm8SifjW+xgO0Mr
	 CNR/4BgXFr4Qmf8J1MFqeiVM3Q6fYHGuiLoAcGWnCyV6VC25EHLIqwyJuaIKClqumsaUw
	 8DFLIWgpznQEXcb0KBu8ABw/qwFT9iQYChMYaO25jV2EhT7WT+g9NPEcm8KeO6KAfZwvz
	 SMdtJ4p08nfc9cgibzgIgiT66tWkX0Rhns4ynLkBkJeMZKLlQXcwKzrZ0RN+sP+mOcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334517;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RS9m/Mj1I3nq3ufIB2uOxSKiOd/23b/nqkTZfgUv1jk=;
	b=1rNenTH3GY6Dj36u+VrFt8xI7ajaM/K+oWZzh6v75HnRxCrdZyqsDvvaQmH3QF4kgCol
	 Lp2N1FLBl2nIy8RpMdSztXPgXFORBA60Lwg6beDujO954WO4rR/iOKWnWB17o4EMhrnOY
	 KtIP+1ytc+g9EBsWEvAipgcXgWOGE8Uxw5eDxL2ejQLSxM7FOq+h++i/CWTvNY8/i6v7W
	 0dGQg/1BAzTtkoxCgmUFnAmIyCyqnfR4Be9qXpkYimnTWzYWi+y4aZgnnj/QMTDo5sbTZ
	 +xfyx7d6KLxbLGKNdXgaPt0+8QVZdvpcPivGWxq9dsVapiTuob55M9bNS45kNQTgelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1CCaap0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06C606A320;
	Tue, 10 Nov 2026 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1CCaap0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14491F008A4;
	Tue, 10 Nov 2026 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794334517;
	bh=RS9m/Mj1I3nq3ufIB2uOxSKiOd/23b/nqkTZfgUv1jk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=V1CCaap0+sqZ1nlL8MJ1fqbZoMHA5SSNYjPPYR9HxwmsC0gNlBOHYmRr6spmg2bzs
	 YY98k+P8ZGz0+W49cV6xAprky6/WOFTfe9zoHIEybeOv+myLV8dZNIGYZbuoSS4Wbf
	 GcjW2sgvI5/qWEJeg7+MarTC60cJyKAjQ+LMCzt2HH96tuV+gz+fwhOd00APqnF1b5
	 wTR8U50A9F2TI+1kBwb106u52kRztNFpzRfOXMk5UnUylQM1e7P3nDCIn1lI5tCnxC
	 kIUQVvwCq2dKLIMNWHUCsWlKZ67tFi0Gd8xWmqHF2RyQ0bfaeL7jROhGljbVOLsEfW
	 8GDe50sctIEIA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0B6D6316E981;
	Tue, 10 Nov 2026 18:15:15 +0000 (GMT)
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
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
From: Mark Brown <broonie@kernel.org>
To: Lorena Tanase <tanaselorena3@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109165522.6663-1-tanaselorena3@gmail.com>
References: <20261109165522.6663-1-tanaselorena3@gmail.com>
Date: Tue, 10 Nov 2026 18:15:13 +0000
Message-Id: <179433451309.125181.5134090107366845297.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=301; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4LmL7qY2fQFkClO9dtmfn5Bn/BGW929YOyraMcTYl7U=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+xxs9bfapuP3oQpzuxAfMDGKVK2S6Hi9tVfC7ULXd6
 oHJc6vcjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzEzp7hn0LSHlmJ/DUpiueE
 vfadt30idzDO6nUdi6TgydoW/hNBbxgZWk89u5Wc2vZ74S3p52/dHEUf3dHPa9+xeJZVgR/nnJl
 9jAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Convert the WM8741 audio CODEC bindings to DT schema.

Please remember to copy the Cirrus maintainers on new versions...

> +
> +maintainers:
> +  - patches@opensource.cirrus.com

...especially given that you're voulunteering them to be maintainers.

-- 
Mark Brown <broonie@kernel.org>
