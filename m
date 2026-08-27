Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB8417D9C;
	Thu, 27 Aug 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822118; cv=none; b=CwO7m3agABES7Xh4n2KBSnQVyXLIry7LqAiyRLGEBZFgRb8OUYutMD0K/4F3xKSxa44MCEHy0ZXmqzYJZOXA2QMzgxE6euTDCc2HhdcZl6kOgULSW+T42qgvi1AmN3iTf4OgWffV+ZG9NT6Sc4gfj6tkUJ5FhYyp8u+O2FCkmbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822118; c=relaxed/simple;
	bh=Kr7o/zNjit8WWWD191s7+7OMGGaB7zhVZg4obMvI8pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq3/aEqX1EET3pYuojH/OxEc4SWWCZj7SHGIDb+8ZZGpSREd1WLQwwwI75L+4KSc2ptyM9L+vFDVF5zIa0RH2sVtFvLk0j3OtVXFSMJzSoGtR4CBtRMdMxjrsmEANgtOJD4lmcpttjZAXtqN79/l2Onc08oSA9fa9uDOShhkyeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ix+B0AWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ix+B0AWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7306C1F000E9;
	Thu, 27 Aug 2026 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787822106;
	bh=LdRXpOvpY8MU9GMUpEh8fPVPCUtndoEd5nrLrISpGFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ix+B0AWXNJJWen1w78P2vTxR1ovIcsbPrDM3oBaZYsZ4Yz8UODavHLF+fd+FrxlDr
	 69z/8n1uDLFKPcqThIe5Iu5S71zbYi1h/pJgVMcSDTTFkNlsKDw/cJ8opO0GLNl5T1
	 yjtEvDmUWBi5wfgVsrGmCxmx1gSSpuzQKjz5IGDMecu9z4W68jHDm3FxFvg+NIHA29
	 w+cbIdrpKCwBd1Z8XyAhWPA8fiORQjalN8SYdigZ+DI8D3ohOA6IZTKVcjMCDiaq+o
	 MdHb8OFuC6c3HfN2NzgpBUUeFDFeRfCH7yje8CF7v4kX3aCkbSRZYjKeN9gyC2EQOw
	 7KfuTHRDBTpPA==
Date: Thu, 27 Aug 2026 11:15:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260827-curvy-competent-bee-fcd81d@quoll>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>

On Tue, Aug 18, 2026 at 08:32:40PM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
> 
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..1d14025b44c5 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi
>            - const: apple,t8103-spmi
>        - items:
>            - enum:
> @@ -34,9 +37,37 @@ properties:
>    reg:
>      maxItems: 1
>  
> -required:
> -  - compatible
> -  - reg

This stays. Which device does not need reg or compatible? I think none.

Best regards,
Krzysztof

