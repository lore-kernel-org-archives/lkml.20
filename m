Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722864854F7;
	Thu, 17 Sep 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640493; cv=none; b=LrUebSRVS1XzfZnsXgwd8mdXqLJPC14tWQg84d611/P3otX152hevO+yoqEhLkNKtQGmy1Azhrhae1zemMq+enRtuPzYUGYImKIV+2CMkneJwjnRDkNR7zP3KLW6gGIs7h/uGJr73kxw0IC+c0SOdYtfMrBaGY+5KX0Om0MIHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640493; c=relaxed/simple;
	bh=pyFS4GH6kEuP/hgTpOLQnMka6kUAtfrX4quWG43DPrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlZxgpaRVU/ssdOtOdvvzi0tHJaI9o4P0ddjbqkZnUcOrt7JLs4sFqzzSDws5mKc/KZizXwqOyprFioxt086vw7+2j5+Lajb4ja3vD3uja7cT0N/KmuO/w3EiMHhUFzhEdIrbz/0M7UAHId2pyIeIxRUnYTS59HxOcj6uNB3C80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3/dZ/DH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3/dZ/DH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FA71F00893;
	Thu, 17 Sep 2026 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640487;
	bh=zlOre8D5QQVvvP05imvNKxbj6rXGs7MCktL3AIZN9lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z3/dZ/DH57Ua7kl9G248oEnrIhi3+6JEj8J+UB/5HIdv6tX6j1B27cfqzihnhlrCM
	 IEdHP2AtpgFlVDhjE+V+WKZLQP622xHcbH1q28z/QC804CkGeevqzbDFXx0xAqXdD2
	 18EFFfzc4LMLYukX9yX4nfzGI3uxYW7h/kSuCUUB80aQobef1/H9k4d+Z4RsagYo2Z
	 XIRQr9tVkn0RBsXDUR5ArQyfy1zKtpP0qZ9uHyLGbM1hgfyTYLnS2raAP6jxEI90Rr
	 JHYWg7t8Yo73OzUiscKUkZXy2/w/ag/kzVeeGPGckTfw10XxKzC5DRAw17OxkNgt7F
	 8QwVFaIyQoKTg==
Date: Thu, 17 Sep 2026 12:21:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family
 compatibles
Message-ID: <20260917-heavenly-weasel-of-criticism-1add6b@quoll>
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-1-cbade54919ee@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-dipper-v2-1-cbade54919ee@ixit.cz>

On Tue, Sep 15, 2026 at 04:32:24PM +0200, David Heidelberg wrote:
> +      - description: Xiaomi Mi 8 family
> +        items:
> +          - enum:
> +              - xiaomi,dipper
> +              - xiaomi,equuleus
> +              - xiaomi,ursa
> +          - const: xiaomi,dipper-common

We do not make "common" compatibles.
git grep common -- Documentation/devicetree/bindings/arm/qcom.yaml

See other examples how this can be named, even one below:

> +          - const: qcom,sdm845
> +
>        - description: Xiaomi Poco F1
>          items:
>            - enum:
>                - xiaomi,beryllium-ebbg
>                - xiaomi,beryllium-tianma
>            - const: xiaomi,beryllium
>            - const: qcom,sdm845

Best regards,
Krzysztof

