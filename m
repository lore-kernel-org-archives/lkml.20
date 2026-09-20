Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F8172630;
	Sun, 20 Sep 2026 18:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928787; cv=none; b=l9sk4Q0oW+T9K8Cw0EsA9WO6Tzk31xG2XzUq0FEFkRDZCRzWT6J2wwjWNH9UyHjFBpYaAAPjs82itYO0sEolMBWRCo2TiwzzyjtGjluCif4Od5WUmd/py+7teVWOND43BEtAtpupXpxGkvHlty47RTHxbDU/mAa4dvVZxscWQ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928787; c=relaxed/simple;
	bh=FwueozU53/C2htJ7Fzwy0OWbRV20vukAL5Bpt59P638=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUX/RzmpMAEp8thpTEZfw1S6a8ETJo1N7JfMTRBBV1jK5ZbI1yheOn58YetYpO17tQbdqBHdqsXaUjDlv2UUI9EF2X9ydQya/Sb8qpldIcVG24Ga3qu2dZOK15+xGxWQEyRckATgf/8FDdclCDu4HvgjRw4Hj27NB4vqyHpuGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1f23Xz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1f23Xz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B141F000FF;
	Sun, 20 Sep 2026 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789928786;
	bh=FwueozU53/C2htJ7Fzwy0OWbRV20vukAL5Bpt59P638=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1f23Xz+aFTK3mI51uMNbbCmppEiYPqNdJSPNp+Lbc58x1TTv2AlvldinrQ89kEsj
	 I6i4YnlAKyVp5vq2kJR1SM+V1Rl8pEgeL14SXuCxcmcRpnik05XL4NCir2Qsd+COGb
	 49c7UhfLfAfLeWnh/Bg2kcsbEyAt1vrtCsq4VG8YKxd/HHbU8UgySZIqJqGkT06c/5
	 KNmtf6qCxCCdB2HfxM+Fa2WAq+5B6GG51guSDhlZQdWfHEF4iRcQAURzpiOiN2ilMQ
	 /s5TZrCE/dCMAy+dZ9fEGJH3gcPVNu+NZvqrquXrzPgDMYU5ya7kCsRw3yY8INGjud
	 T3Pr831b0Xb1A==
Date: Sun, 20 Sep 2026 20:26:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Sophos
Message-ID: <20260920-musical-kind-dingo-2fbcf6@quoll>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-1-365615a74ef3@studio.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919-send-dt-v1-1-365615a74ef3@studio.unibo.it>

On Sat, Sep 19, 2026 at 09:44:17PM +0200, Nicolo Giuliani wrote:
> Add the "sophos" vendor prefix for Sophos Ltd., a vendor of network
> security appliances. It is used by the compatible string of the XGS 87/107
> firewalls, documented in a following patch.

Drop the second sentence.

With this:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

