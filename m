Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2673B27D5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718939; cv=none; b=YjArjR3R8PKEhc5U0NNooToTWE/DP/zZd75ktg8Y/8E4u/foZIB0mXaaij3jZiD2qEzs7UQH8ZAfconqdcME4KT6AKdxRWn3RwR2G0qzGo+e+yHzlDx2qZPj0c/vnu/yCUhpzh6TmTt6U+2Gyd5NZIXc8TYohEdu8FTvIK8Nhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718939; c=relaxed/simple;
	bh=+sYhXmxhg4HTmGDotTlYf1XN/80V34F0G6WxzZ8U+pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzrTeE+WYPTr85WtFeerBpGKiPW9DMBLAeEp8KEDg0npLTTkzfnaaFIOLc4o10BzzqkvFItyI9w5H4wSFm83gBoN9JyD+Hw+bmdLBBRFKYUEAX/EXlKLlMYcBfSdEBGM98N/k+sqAwfdRr+LIJTHIGY9EQJe90m3hDmrzcLs78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW8xiWrS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW8xiWrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E82E1F000FF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718938;
	bh=1z3g8uO8esjL15niBFprIu3tR1dbGidMoV9Pvac7pvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QW8xiWrSFtSEtFMM6SrWrY/dNJi6s6JFc1yOypboboiiUOBgwagPlTjEy2MVNrHrE
	 u1Xo4HoksZCS5V+MB9UoKJj8lQUJfO4zYuDfFYp5+ypmlYjqzXkRUJ5cN3Y8oxDf6P
	 /+APvPott0EFX9qKhaTvvqQm5OcTd/uLHfC1rwKKOknKPbZXJl45ktfe3nvpKS6Oy1
	 lR2D3t7BOITDNxWFyBSCaTD5hCM8pkPXFioNDSadm0UZ4SjTSDgVOVri6XxXBPUELA
	 uE0f2CVCxg62/vFE/EWmHRNW8FtG0XxBbMUWqvwGU7kHWO3RSf2PE0UqE+6kVloSAm
	 OZ1r4CHe6ODbw==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a9edfc851so611665866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:55:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNbCbRhPzEmr0h0uZ3nrKtE5Jcnm08cVlwo9Zwz8Wl7WZbXCDxBJEBKJ8ItBFvxrBCyhswpqYSPL8rfPY=@vger.kernel.org
X-Gm-Message-State: AFuF++knE6l7eyb2KU92D3UO3/EgTbq+PXqQafwhFZ41worSdfq1ib58
	pGd23AepbQy2CM8Pf1Ru7+o7oLKk2hi/v849vUexM4o3HFjgkxVwr+oYpNo3GnOgENcB7TIqF53
	zYEuskiHvkKYQS0Ya4xJVHaDoz2Gmsw==
X-Received: by 2002:a17:907:6d14:b0:c2d:c414:904a with SMTP id
 a640c23a62f3a-c2e15e9addbmr58187966b.17.1790718936887; Tue, 29 Sep 2026
 14:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902124018.606544-1-marex@nabladev.com>
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2026 16:55:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
X-Gm-Features: AclHuK-k3vl-Wx1oL4KqfwQ_ykCOdKhQDjWBszDB17DIngfFFXqkn-ItikX0PVg
Message-ID: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 7:40=E2=80=AFAM Marek Vasut <marex@nabladev.com> wro=
te:
>
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.

ST folks,

Can you please pick this up. It is introducing warnings due to .dts
changes you already picked up:

      8 syscon@44230000 (st,stm32mp25-syscfg): '#address-cells',
'#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
'^pinctrl-[0-9]+$'
      2 syscon@44230000 (st,stm32mp23-syscfg): '#address-cells',
'#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
'^pinctrl-[0-9]+$'


Rob
