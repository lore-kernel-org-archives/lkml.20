Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482606;
	b=FAEONAkV93THx8KSV6PGh8Cba++FlN9/YeWVt4PMY/knX+9y270ayuW1+DW9Fz0fM2Am
	 VhULhAoX+m815gSL+XmFkuBUBaPCy7BcP1LW2CXdWoqxmT5xXWPE+oMw92NTCYx99hhFb
	 Gl7TX4lksCkZe6om5mUAwb5/0GRzQIYZWdyWvI0FTCauisLXZCWnGpi2yvVhJX+erswEz
	 fd7xHl54jUr/dQSoaElZJ+jeRHi8qWHnFfa4Fo4piPkv++59U0WeqbyfV1JtfvvkrWXjC
	 iDHcFNlQuirCpiDJRZRbe4L4oFcEcEgXtt48jpno2oMBixSa5elGI/NBSsT8DVh+0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482606;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hk8H9NwOSO/N+s33JI712rYWLRzTkJj0OwKivV3Ixt8=;
	b=IN8sjBhCp58Ycvla9JGGiVqiXNGlDANAUZEMCqJIunX8K7hvHp8Prks+lc9BM2oWWnwu
	 VG/PBHr6Qw810+QiFqH0KBKJkFewiJOMs1QwyZnJqV/NPPjYA06PJDiRm24+4aMNemLW5
	 gKWczAOSkr+3Kn4lMgdUU6kM5YZNrUNut3wFYIye2O9ZFehpd3h+PLKyU15RfLfwyGxqA
	 /IfOeH/wuMt6kVBYRFbZajwo9Xa49jA6dOzV5MEbqfW7Bq1KDSoGv2rVCOOy0ZAW4ZZ1z
	 NvORHSCjFRE94sXoE0e1dOe5xJgQY/QnLJXQN232Ug0z9dELp7IXeyt6CraMYBgkZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4wHztlV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97253606A319;
	Tue, 20 Oct 2026 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4wHztlV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED691F000C5;
	Tue, 20 Oct 2026 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482606;
	bh=hk8H9NwOSO/N+s33JI712rYWLRzTkJj0OwKivV3Ixt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4wHztlVNEXdFWs2yr5vXvePYxV3EsdYff3yMFvPVPLnKHsFHz5S09Nf5uM8Cbmtp
	 YdYwYWQdEp7oOjm2T6GcSKFMOxOGViOb3ZQzjrm41h9Ory5C3mHPifSNoV5vkVMr2A
	 ArQSPa0d924niUQ9AXtdH61w8J6NyjLu82oUOuKjGH8y0rg7CxOVMPt4piRj+XpfA/
	 JFC87t95253Ub74AD/p+AMA3vGoe1MBETkA834J4Zyfxjoy49XXl4HKJ1ily+1Czby
	 s20ujL96XOK5ZaP571G9vLvW6yM0tvCEL51EztDMin4vMto6vLuMa9vDeikcm7cc+c
	 NRG7wzIW2DMCw==
Date: Tue, 20 Oct 2026 09:50:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frieder Hannenheim <git@fhannenheim.net>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Oscilowski <drgitx@gmail.com>, =?utf-8?Q?Jean-Fran=C3=A7ois?= Bobier <jf.bobier@gmail.com>, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
Message-ID: <20261020-musical-merciful-nautilus-aea420@quoll>
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-1-bb6db87ff15f@fhannenheim.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-kebab_dts-v4-1-bb6db87ff15f@fhannenheim.net>

On Mon, Oct 19, 2026 at 12:18:08PM +0200, Frieder Hannenheim wrote:
> Add compatible for OnePlus 8T
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

