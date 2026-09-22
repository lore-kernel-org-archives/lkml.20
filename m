Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99749502A;
	Tue, 22 Sep 2026 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106883; cv=none; b=PDDv2dhhZkAeg5Ox3D1VjU4HWhb1nfTk0PcRiJTp7m9Pwy/kWao//Jc3ay3xKCQPBMBQtc26XdvUli+Od0M2bE8iDPFxaN/q0ybOeg4Q6IRhknI0PlnxWEazw242FRuFkUUtGYrEdZShvl0GDWc9HQQ9sCOOE91sw22KM8+XAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106883; c=relaxed/simple;
	bh=2nqa+pFsDAoUkAa8PolEKrpFLDy1VRQT3wy/jie2kBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaqZrhLuikbxGAYLjg/E9EzFJNB7V3JjfY81MrvoMpnjpvtFuCN48BjRs1NEcj8wTaGIilWxTVg3lAtosQ6k2TtBsg4lFvTGIqF1Fx8UVOSTjb5ME5Gmdagio+hZxmhowkgxDX1Io54A6Hqm3d/Cy1FghYuhphKrKIKn63uFZcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDp4XriJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDp4XriJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D031F00893;
	Tue, 22 Sep 2026 19:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790106881;
	bh=LIY5yH05DRBBVTXJin0NIcOQciDWusw/HEhbfWiCtQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MDp4XriJpBWzGlcYzNGs+wlD37nINMLXUGG/z7kfdSGZVamN+TG8BY3Hz5F72fFJi
	 6DgHXzKMQ6AjuBXiQaRllPm/bb2VP38BPIHsXLtWex8dESW3SXgJ9igT0Ei9Qwy+vS
	 xzCd39q8zJGHgVvjTlSTgc16Ddyzcv1xgYQjw3nclRsCJjntMSRfil7BtZcI4XGT3C
	 5CkutOnqvCd4gz/YnVuE5unMxahhpkBQKS9THWnU974EX8V6j9UPAcRE4qt/BdR/Ux
	 ksp9NIr9/itwFSszzCx2HE/U/13dn+K5DHB5Flr5I5DqnOoDowBTBuY9oikSrKY410
	 hav0oC6/9NVWA==
Date: Tue, 22 Sep 2026 14:54:39 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
Message-ID: <20260922195439.GA806172-robh@kernel.org>
References: <20260921232527.3127894-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232527.3127894-1-robh@kernel.org>

On Mon, Sep 21, 2026 at 06:25:26PM -0500, Rob Herring (Arm) wrote:
> The MT7622 PMIC wrapper has a regulators child node. Add the child
> schema reference so regulator subnodes are evaluated by the MT6380
> regulator binding instead of being rejected.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index e7c4a3984c60..79b755858bad 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -105,6 +105,9 @@ properties:
>    pmic:
>      type: object
>  
> +  regulators:
> +    $ref: /schemas/regulator/mediatek,mt6380-regulator.yaml#

Err, this needs the conversion. Dropping this patch.

Rob
