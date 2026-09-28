Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9A45FFAC;
	Mon, 28 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581906; cv=none; b=InsC2TCSziU523GAuqY2biXXo6aN7GQvLarGMqPDkMFiYheIdmD2vP2VvvPgf1Xc1wFyqqL2sGfAJGXN31YwaJVKnoEctr5TMbq2EBsHe1V4dz9s5kGwK4i692l8c4VjIhl4IjwqMZ2KEXJN1hVZROjHZ1qU8+5GOdNTQsya/UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581906; c=relaxed/simple;
	bh=cVfzDaABLlZPz5p9s3s2PIho0y+MsH230Fc2SMYYY4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWJArPueBFrPmYEI7gRxRVnDvGBrECAYodJ1k85wLNIrjagiXbPV6kcaLxbYEnQpZVisr9urB0BgsxBFQE4lAOyCQksDFTJTk9q4t/mqo2vQQ5fqYVia8Soszf5v0Fl4LMVS0/j7+faJPo/tsQVUG9kZ9V2HLpyrvU3iYfMgsyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQCp+9zE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQCp+9zE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D061F000FF;
	Mon, 28 Sep 2026 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790581904;
	bh=OoLBh6lfAWYXvbWbi9rrxy8K4duhjeCURDS3yTBgXJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQCp+9zELY3KhQhoY0zQRV/A7R7sgFnlMnR2lPTBUhauoONhe0Lxc5oCFyp3BL23C
	 qsYiwU0rCBniyWAR0IAw9+9gjRxWPtVPAw9VdM8iKPoS0ggKFhdoYfaN60hjKrUW7l
	 lQeg9gpstoT8qZyTr1qnQP5iPamtvTuE5CnvukbQGb9tftYmTz/hQy31twU0clPNAA
	 JkRlIkaAmGpBfz81dDAX8EXVn6hqfk4rZrUNnt50v6ixRYsu/bIZnNtr7UZ8cRMZI+
	 aFNNHUsOoRQ6XdxR11Ldd5nX9fkS/yVM0lyY8hb7oZ1a4Ki6BIMwZ3615xzurQvRHu
	 BKFIQoZdRSTPw==
Date: Mon, 28 Sep 2026 09:51:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: mtu3: add mt6595
Message-ID: <20260928-rapid-jovial-zebra-1f984b@quoll>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>

On Tue, Sep 22, 2026 at 01:36:40PM +0300, Roman Vivchar wrote:
> Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

