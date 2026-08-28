Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E223B63E;
	Fri, 28 Aug 2026 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911474; cv=none; b=OYbx5rOYk+eWYEP2A1RK8ILioqmsc+L+Gekq32i1GT+hdZqs0QcbIpoEgg5WUBscxLFOwXQ2+EKf//4g+ADKZG1U2EDcqHGd65mUBkdeMoLQcFroNXPzIg7fNzrqRUqSkvaCzKAJZRGSop+c0yN7iiIS9tyoe1QGl5YpOHsVzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911474; c=relaxed/simple;
	bh=YCVvM5M24cLnkU48lkz16rdvbuz4qzGIamcNWPzzPQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB9N6AdNWpM0FScdu6wDgoSCBJvn5EFi9jm9GQ6Q4HbpEPSpROqWupsQZkS/I3lFWGwgEfqyVUGeaPb6umqXiNg2WXrggFEGURoFYkPvRhq2CJh1nsyCcEyH/objw5kFIckVIy9mG7nYxcl0tts4azYTmE5bA3XH1EGvUrpYdyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gc1qbTV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gc1qbTV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71F21F000E9;
	Fri, 28 Aug 2026 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911473;
	bh=IBePXtuwz3UROMrvACxQz+WPm2fXBzAK6QjtPmpsvHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gc1qbTV/hUi3xsY6uZ6QPA3lyHZd5D9dzslTN/47xJwIEUtOYQSMy4UPqmtNIZH3F
	 l+heWhx2oxwNLAW7dzMWQVmcbDA6hR0uFXbcohYtTMOIsQC9PGkhR12cqN3dWGtZXK
	 IJj70y32KKHCobbmpZ6StwIwRzsCHxmM2flyelnXFc1g0kK4PsxCH6kT/Ajp7D8ws0
	 bg5hHEbmduqROHutdXbKNnBe9NA9I4LwlM4l06aq5ggV0ABtx3JpuQq23aE3fKEzMS
	 wEp6yGr/Grolf7sXUKR8FGF7Pi+NQa6PnjeRVF8hur5SJjtYxv8dxJLXHCtgndLfRu
	 9hi48QF2l8tdA==
Date: Fri, 28 Aug 2026 12:04:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <20260828-accurate-wrasse-from-betelgeuse-faecac@quoll>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
 <20260825-ctrl-v1-1-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-ctrl-v1-1-609e2291814d@oss.qualcomm.com>

On Tue, Aug 25, 2026 at 10:38:32AM +0530, Varadarajan Narayanan wrote:
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: cfg_noc
> +            - const: core
> +            - const: iface
> +            - const: sleep
> +            - const: mock_utmi
> +            - const: ref_clk

Just "ref" or "xo" (if it has purpose of XO), so this would fit the
eliza block

> +
>    - if:
>        properties:
>          compatible:
> @@ -506,6 +527,7 @@ allOf:
>                - qcom,ipq5210-dwc3
>                - qcom,ipq5424-dwc3
>                - qcom,ipq9574-dwc3
> +              - qcom,ipq9650-dwc3
>      then:

Best regards,
Krzysztof

