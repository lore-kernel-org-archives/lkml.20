Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6B2C032C;
	Fri,  9 Oct 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535891; cv=none; b=X0kt4azkwd+8hVhZHxgmSsQfAShTRCXIvQXhILJqwAkCHyFN4vfwOFAPTRob1qfykbC/rMcLnfF/XtSf2ft+vdMXg4p5vPNwTFRNX2pZstsXE1UYGPZNPCgjCxc3L8ERbWwuwH92zMqUOtPwgo9pIao2JjMi27H2gGGan7bKCAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535891; c=relaxed/simple;
	bh=94JrVuKkBJr33RhjQvPLqnKslgAjbN/wnLf644v78dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMXNRowRti1rI1Iz7VTRQEJGHIPnN9yycJ68Bmcns5HfIyyGV1VChatY+ZYiaPLWNr2xk6KrA287IQbGvwwUCu5eLmtm19egpMQHCLPjIGwNMqnPDcI9udWL8GR4VLWuxuJFSOmKQGOHk0VeCqcrrP/g+i91Nl37R8B4W0SAN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vyg2b5yy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vyg2b5yy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1280B1F000FF;
	Fri,  9 Oct 2026 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791535889;
	bh=dR6b3FKrLnTe9BIBL56tDFVWDhHRPUS9hCRaTGfzQzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vyg2b5yyo6nPDAJk1P4CTXySufwY1s6u/BSSut7P/sJ96gpgV57bUHVPymJRafxyN
	 lUAngA3By/b+1XBDWiE7PFpe3GlsIog7cqEHFlWzGlj7K2lrBJuuFTuZXWLc5lUCfA
	 AxWbR8H6KAh3G9eCO/pQyNgdUKIMZMSda+j98pCxrSja0y75REdbISZ3CnVM+lVP4+
	 Kuk8+I4l26tNcKxbHwxH//AGwa62R6Uz1C6sFmApswosNoAPR7Xzyt5gjhBedFFo3O
	 c7afxk2kq699aLj2z26N9BuALMemM8ASV23oQEswqWZkxfLJ4wvKx7M3235ASdcoxv
	 jzJzjsfKi3gwg==
Date: Fri, 9 Oct 2026 10:51:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9
 Wi-Fi
Message-ID: <20261009-audacious-doberman-of-satiation-ba4f3c@quoll>
References: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
 <20261005-gts9wifi-dts-v2-1-c3ac9b0f9ceb@dxdmail.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005-gts9wifi-dts-v2-1-c3ac9b0f9ceb@dxdmail.cc>

On Mon, Oct 05, 2026 at 09:47:36PM +0200, Nizat Mikayilli wrote:
> Document the Samsung Galaxy Tab S9 Wi-Fi (SM-X710), a tablet based on
> the SM8550 SoC.
> 
> Assisted-by: LLM
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

