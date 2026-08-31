Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F450526AA3;
	Mon, 31 Aug 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188856; cv=none; b=G2makwZVlgyaHnPf3kijh0f1iYuKBLJf8fZM7JTCZv6hEQYnRBiJpq86nUlsP8rMoLeMUPCNy140sG5rtwzGhl7FvAsGmZANobTc/nm4O4wutOcpd4TSA8egwKO6iogZAQTwCCdZw9QfuuVeDRMO1W2Vg4CG61DP2jSlxi/hqoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188856; c=relaxed/simple;
	bh=uwvNsBwgRDntXi3bApmujIjPXdQCFaA9ifIQl/RS26M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn7iGJ6OCEC8vXxqQyyRK391NaGmzj0+bd1yBKsHjGMaFQhfaa9gkj7zjr3r1uf0TS2pbqF0rlQk6y4d+qpHAat69AlvlSSTZu9baYfQesxajZ5YkkNHGgaUgN2AsiZzrlBPoIAF8aFu1VyKTyksvPa8Yx1mY9kv/mi4KPlfp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXn8afgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXn8afgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE921F000E9;
	Mon, 31 Aug 2026 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188854;
	bh=X6L7MXqbHZ2LlW+rZJSNup6Lx2yEH0h06HSnoCAWvZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXn8afgZXofTEy+wnwBgknOyG/E2aYr3Y0oUDpaqxQncpC9LdQQWi8bi/s/SINdZ6
	 Ck2jrm4egCkiV0npGmWKPuRQZ5IL/+kurIP3Y2Ud4IOFUrcAndDPrSpn93CjLnfveo
	 ExrUu55LWxm/22oKh0zoVDSzKUJs/qRHxguDOg8lylm49BDRTwdcsllvmdh8Feg2y7
	 J7Ip1lhtYf4C/0tJXkdGXYhKXJgyzbjS2K7az2zA5S/uMIiwaIfvlu61nfmPzMbfkU
	 rWNB6hLrWWkZwkHLolJPToWTU5+vh4QK+AtxxqRyJJgHS+PriqXdgNRYNb1oxwZysJ
	 +j4dLf8NJvT/Q==
Date: Mon, 31 Aug 2026 10:07:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Konstantin Shabanov <mail@etehtsea.me>, 
	Srinivas Kandagatla <srini@kernel.org>, Georg Gottleuber <ggo@tuxedocomputers.com>, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <apWYHB50MPvQFX-h@baldur>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>

On Mon, Aug 31, 2026 at 12:54:40PM +0300, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line on
> these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> 
> I was only able to confirm that this GPIO is actually connected to the
> EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> recurring them shared between all Hamoa based devices, so I reserved it
> on all.

Such leaps of faith comes down to risk vs reward; the risk seems
reasonable, but your commit message just states a fact not a problem -
so there's no documented reward...

Regards,
Bjorn

> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Abel Vesa (9):
>       arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
> 
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
>  9 files changed, 11 insertions(+), 2 deletions(-)
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
