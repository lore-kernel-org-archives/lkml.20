Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBEE35F170;
	Sun, 30 Aug 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788083683; cv=none; b=Zk5HeuXkTTVDY9J4a2F/llpv4LsM9EEuVEfUxoUY0cNkCi+6U4KTP4xYXo8jPVNB1CrqgpSIcB+5FAeev8sZ/p9+uXl0j1abIQ1MITdHpSne53mOiZGTbySZFs4ilBvqseXjPCZu7yNboQwemRdSomhF5QFGMlP2OWPXQ3o5k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788083683; c=relaxed/simple;
	bh=CYH52uyF2CtF4DngemQpVHHqkMv7GkRcxpkH5w4S400=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STQo+2TFWjRXedwmw37zbW5iliRe0jF1hj583M+X9SZciHm62QjtRdFvPNkq2oUUf7Yl8a4KR917HiCrA27cplznpmXCg7HUew/Zo51/OPAa/SeD5QnYYInPnqCv9VjHCD8Kht+u9bOUTaMmwrtMGlC2Kr2YiFXPTPIan+FApi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eafQcu7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eafQcu7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CE81F000E9;
	Sun, 30 Aug 2026 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788083682;
	bh=CgBrUiBAKCC56x+TVfnfJ4aLrIDbkJO4XUeVoG5VVsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eafQcu7p8qIVE77ejviVCGXFdVteUCoGSqiX8dm2Z1jxVwcTWqBY8ZoXqFNDmBJ9R
	 v3oZFeQIafVXekVDXXhWMteJC2oFM0yZpbINc2s2dedtyUrNgKVjjdIumyHnlNm6v4
	 H8xg0TfXLy8RnbLabGm7B2gyJPxRU6KJ1Pi/KPPp6yVh5WyRHp6sTLMOZoOHjAsOZq
	 8Ir6HIy2+3fKMZteQ6U3VGKVdSaE1HLcM0Lnr36fRUoXIi1MzauTdv4UBPGkhKXhqm
	 CwY6rNmTxBnCrxpns/FcXJrGU1PmfB/vzXoTfdaLa3lzPK6XO3+8VrYwTODahAphFd
	 y1Eu3m66G+v5A==
Date: Sun, 30 Aug 2026 11:54:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible
Message-ID: <20260830-quartz-hippo-of-wonder-0826cc@quoll>
References: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>

On Thu, Aug 27, 2026 at 09:48:07AM +0530, Varadarajan Narayanan wrote:
> Document the APCS mailbox compatible for the IPQ9650 SoC. IPQ9650 uses
> qcom,msm8994-apcs-kpss-global as a fallback, so add the valid compatible
> string combination to the binding.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

