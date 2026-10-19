Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445216;
	b=2p3tP6L1AcvtAmbPOBnKzxNWfgqKVm3h1w6Mf2RNHj0HdDTkaC0Gnyc0rdJcfBld1th4
	 Nz7SWVaftHg0srGQdKOmTI+8cDhMqNj1FFkEywgy8k4GmR5uKZS763T07DYcqN0b5JujZ
	 SKgQf8ZOm/AdjCarU07QOQOaI4gkk4XTYlRDfkpHCdfVmzRbvTC+QojeOmAoFsbn3SKSN
	 bjIIZ4L/ewgk5kAaG8FJm4e1Ysmf11MHvzziu7HQJvjQgzw8EJuYIoxW0Oncdhd5t0K7C
	 hLN5AnWyGeW0ARadMD23aUHA0eRdgN8oAMVJfH5ie9D/90KNV+N2SXFCIxVuRMfIG9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445216;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2/oTajujBgQv2lM0tHVLlqdb7xrNZwTMKNXeSsiaOWc=;
	b=Ow7sBraULjwm0IXvnDPGT2fpf/0w98lgXX1Pw240iopIn68N6ywd5HSXJk+fqZ89PXfV
	 cEag1EcaQTWluuq7Ulb4reFbqa5DdCFaa+Xy+oZUUk5o7eKdUlWQhQyCaV0Bj2fYHPwwT
	 VlUQ6+hh1obFk6wK8tN7k7gVL2gnDBPysfgJ2eM6Gx33834gOSKV1zQBFgLPAof8xzpEr
	 ldN2Xb01PCXIGJoM783Mz40fiBgToLuaLTBRORcrg6ITmsxbrHjFdEqh2NocHl99A5ANU
	 WG7b2E7pbHmPdOEbBdlI6cCGX2LVsPE9B0BZj0WbVQfQW4EgrKSXoL0d0qKnobTgypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jr27XPWF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0809606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jr27XPWF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793871F01573
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445216;
	bh=2/oTajujBgQv2lM0tHVLlqdb7xrNZwTMKNXeSsiaOWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jr27XPWFooKKoEeXO0QG8u/hyF5wNO0Ouh7l74J4PhTBsLJpZBMh4KqS1y/0+kL4z
	 dtCdVOkZ8syA1Wc2nIspEhfWs4nm2M6Hauz0nnMHIgje7yBkdm+Efy5EaG+3CRB94Z
	 0KvnE5E9XoS537a1MkzfHucZcLsWI0b5qrw36Jszl6bXn/AdH+2wvG++t6xKhHpVqH
	 QLxR0H8CiJcL9O0fHHo6TAlqdENzs2hdaXvP9tL8zQ6UJyUobsaBrh5sHgOyF9JVs7
	 KM5C5SHyEppfUi9jKgfr552Bd6vEU3YHHchlRM+S2qRcTbW+d5HsfZ3yZP9yztQWnc
	 ZCCX5r8tmsWcg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c414e5d282eso298126566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:26:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzs5/a1/u3L8j3pwRYvECM3z8Y8vBWtis9mDXm5mxy5eh3AfoHd6rSnC3hGZF7tjirKzzFQaQYLMQz4Q0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvdO45KxF6EjBDnSjCQlctgp2I43LlL0FjEoanLkTGjCg7H1Kc
	WlFt3v01PC3Hq9h6UengzBzgj44VSgGH1yYkNJTjVi1D/6SQJR0hwLrX9PVoM0H45GlVrlHJuUU
	DnqeH9b2nngBg/RbYqDs+57kz/2D1GQ==
X-Received: by 2002:a17:907:b046:20b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c42102f35damr377191666b.34.1792445215032; Mon, 19 Oct 2026
 14:26:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791623422.git.kyrie.wu@mediatek.com> <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
In-Reply-To: <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Oct 2026 16:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL3+ySM=XEt3SfT_ukXm_x0i5_Qa3p_2Etu+SMiA3mMew@mail.gmail.com>
X-Gm-Features: AclHuK8cez5FtL6SKEsML9LRxKLTKpwdtokleLqyHyBFJ3_4ydfzJsav_z0NLA0
Message-ID: <CAL_JsqL3+ySM=XEt3SfT_ukXm_x0i5_Qa3p_2Etu+SMiA3mMew@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Yilong Zhou <yilong.zhou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:24=E2=80=AFAM Kyrie Wu <kyrie.wu@mediatek.com> wr=
ote:
>
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It uses only one clock. At the same time, the decoder
> supports the vp9 decoding protocol for the first time in single IC.
>
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Withdrawn. You need to define the clock names. But that is a mess and
I just sent a fix for it:

https://lore.kernel.org/all/20261019212431.4109371-1-robh@kernel.org/

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
