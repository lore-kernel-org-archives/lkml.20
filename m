Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568550;
	b=vBX5lxJ/oFTKkRGSoqFQ+Uqnt7qylBMjOAmACSo/KTPxQaO3P2PwbZYlF0/yqWl2XvUy
	 uJjnUT6ONpn0enn06v1TDnCcJUvD28Y0QGqSUPwWynm6xX1xV7OWJzvWuD0gHgMk/Ming
	 ZTbukA8MHjd5qoEGRaq71Ii4KwhK3YCmKZidNq1AUhsnjSpiLqocp1btQJvhberswRfm+
	 5mZE6+AcmSHpzddta6Y3esdrGmqy9FUWVVDk/13Mp5N5kbyqC4JqxrBmp7TB5LJEZuKrc
	 A/f+U/UAQDHG5hLnGqohX6TFDsY0J2tdx2gabjN2wH1Gvcj22R4iJviZdAZu1WZEKXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568550;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cre4L9eCuVphVpCjbYJpM3iWfVVc8tn3djeQ9Evn4Ys=;
	b=T04q1RQb+1GFUawCNOb6Aa2oOA/Iv2gr5mBaPTyAfORJFb/VLlpgGdYhLy7Bn+bCpqL3
	 pSPmjeYEddW+VAG8mkwNK1Jw1otRLFwIzoWRboXPsnZKLQNd6FmQvaXQMOg8VLT0EtRvj
	 /ontXwkbBbaNoVtviwq0h486TA9kYux1SGg7j7C4/E7FucEuUwEgTmfJAMFsDWJsaeoO1
	 Cg/Fl2hfop9LM5+4XpIUpK1JueKSWAX2LtuSeMJofzD/4+qpubruU59RZTR6yh5b9knRV
	 HweyWa3ZIMkdfp3Jcb4VOE2NSicXDhEnMXNCmgCrc49NiPQFFneVsSuSa+eeEOkhXEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cN1Zj2hT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D75606A31C;
	Fri, 13 Nov 2026 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cN1Zj2hT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5501F000C4;
	Fri, 13 Nov 2026 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568550;
	bh=cre4L9eCuVphVpCjbYJpM3iWfVVc8tn3djeQ9Evn4Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cN1Zj2hTX7f8ZL7PmZUiCoyInSaJ+OBYcZ7S4lFpSkZ6/giaTguWgcX5HTAyjhWIu
	 ZCH6T36ZkXZgX2pJ20vg/j0uv7nzDoxWTv/HouuIMRlB5bk+hXqIAVRJRarsXlSClJ
	 zCtn7G1fDenAzY12anbNOTov6Sg3BornbFuC7Y6q81UZp8l8VQAOyWiy44I0fiEsRy
	 jXLolkwpQmvGQQdNLJKEyqDeGJvEz4MdLYYxqO09HrK5eekdjCEJWPLfEuD1rfPAT9
	 HPlDVHWXxhcilpa3veYi5+JIrFRrb0KMt4/lXZvdvaG0kExom+nDXIYNSiMl2b/IPl
	 tGqfFeJHy84cQ==
Date: Fri, 13 Nov 2026 12:15:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
Message-ID: <20261113-gleeful-tangerine-skunk-bcdd3f@quoll>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>

On Wed, Nov 11, 2026 at 12:19:53PM -0600, Ryan Brue wrote:
> The volume keys are keys 0 and 1 of the SoC keypad. The controller
> reports a pressed key in every row of its column, so describe its whole
> 8 by 9 layout, which keeps each reported position inside the key map.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> The key map and the debounce time are the vendor kernel's.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Organize your patches in more logical way. First you add new bindings,
then you extend the SoC DTSI, then you add new board (one patch). Not add new
incomplete board which you fix later.

Best regards,
Krzysztof

