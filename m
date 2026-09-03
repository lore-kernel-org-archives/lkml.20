Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC3416873;
	Thu,  3 Sep 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429521; cv=none; b=tdPh3nwdmVoP4VKlIRib/j4DSixN5Hc/9/5mkObVUHobCW0fUUBBI6T8JC5Pi6vhmeraq4Apzf0lutZAnzCEYYXGRoKby/teJTyyUbSV2h/83dRnXsUUC/nW5dhhvn8bLcfjI7qEhpThqGZx+xR8FTu5wnHysfeDgu+ROxDPtOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429521; c=relaxed/simple;
	bh=PoX631ibcyST4N2YXaOeJEQK2DngMS46Eutob5G8cQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJGIqwLAHqdeifAp0yuPlF1OaCIeK5yyR9A15AZfOMUpXEQMIVeBxLixsW0CuRdDdemWwaxRl//6P7V4MbrBPA8Y0j5oBbMpKfrnPmbimzB6sQxyZDDUw8w4oMppaQtz2KlKR00L/596edW74dNyxXmjoqRN2JtLYgzln+qCfgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxdBZNUv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxdBZNUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBCA1F000E9;
	Thu,  3 Sep 2026 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429519;
	bh=lmm3428uIGZfnMghqloe1oSMva2nsLIIykVSeNrcwWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GxdBZNUvkRHNeVaZPGcXElfte6UPPciaWDOp856KGakYjr0aZD+cUD9Vsis7yGX/h
	 4FIrcApQbZbgAgntaqexYkoNUZ0HPi51IZoXAKADNCX8eVKq8pCctD4SA/Z6sL+8BY
	 WE+kq1CxJIenBpKJFtx0MtWrD244+rvGRW/4nSwPo3RwYyC/baHZMfp0dcl8cQ7g/X
	 yqFLbh9INSb1hSiSDteow1zok8ajbqziUsutxXuKxhso8oPKamalcR4/1HnZ9y/I8i
	 nOH6t4RJ3woMy5q+7a3V5iZ3VAHUsdHfXOtNQkAGB0qORlHkDAQvdtU7oW2bTxrokn
	 CmPCB8TVr+oMw==
Date: Thu, 3 Sep 2026 11:58:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Support Opensource <support.opensource@diasemi.com>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260903-hypnotic-pearl-ladybug-8ed62d@quoll>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831201522.51294-1-Frank.Li@oss.nxp.com>

On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> years) check_dtbs warnings:
>   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
>         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Previous try drop dlg,da9052 at
> https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> 
> but Krzy have concern about compablity.
> 
> https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> 
> Conor prefer update old dts.
> ---
>  Documentation/devicetree/bindings/mfd/dlg,da9052.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> index 1103a8cc5cea4..d1d23c7c4d0c2 100644
> --- a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> @@ -18,6 +18,10 @@ properties:
>            - dlg,da9053-bb
>            - dlg,da9053-bc
>            - dlg,da9052
> +      - items:
> +          - enum:
> +              - dlg,da9053-aa
> +          - const: dlg,da9052

... and the dlg,da9053-aa alone from earlier enum should be removed and
existing DTS corrected.

Best regards,
Krzysztof

