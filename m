Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B93B530A;
	Thu,  1 Oct 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843571; cv=none; b=TmK9i+SK7CjLLLsA7XQPDYqYbuX3P/2EF7Kp5wO1+us9tLhrWjGlk8oGkUxIcGGRxJLMQWlhAYkdgURt/1teWAEkBVcyomTTKRrv+1kgQxjMo3XUct1Vx1FaZ2zjgKzkbwbN/EuNs9W1y/WLd9Tc9Dl3OIcGMxgRKPZFiU0YMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843571; c=relaxed/simple;
	bh=Tq2clok+ScDGc3LXVq5Ad9835b/aMtHGaftsGkCQ8YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADOYPzn4a8zAluQWsn2RBg+m7th9tqsJ5GoIIriHIcePeycQAhA5wS+qqhLbllGtjLztF3Wcll1sOKSdH/K0dt5hlhIKzku6jd+cq+HE2tRJWfi4G2tlRsQpCammcynBFYwmS8BEJzfBPYo2AO2Vs6OkjwYn6cUctIlqRBaH1Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipWPd6Vl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipWPd6Vl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697381F00899;
	Thu,  1 Oct 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843570;
	bh=KuJMB0R2fpyv246i5bflCVnaHCMCzlODoqds21wYmj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ipWPd6VlKmPWzF1y4l5rakilJRkBnSbPuXbITRmkx5ZaNzK+TpSyElGbF0i71wDT4
	 Uta0D1qYFrFoc6Y/wQeyoyRPpsKaUYkvlLdI1nSBlA7m0guCT0I22WX8NXOcomsI9d
	 Ely/WhK/Had3ecTlQapdsJzMjkIc5f7FTK+TPmEkGA+7NawPJuGbCJTGW9ypqnyHSf
	 Z8C6LZcoD1zzCxPDm70XGwaKY/QOOYrp0LiB1bbL+Lgx2Hnhx3GcRXVCpI17xS3CqR
	 0nAHM4rTLFVy4+IqZa3+bTj+GV1DpMyzgKvOscL/Cfl8XYcbNHq/ISyc2GZYZEB8pl
	 qRtiNAMht4mJQ==
Date: Thu, 1 Oct 2026 10:32:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
Message-ID: <20261001-enigmatic-armadillo-of-finesse-2ec4a5@quoll>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
 <20260930-ok3568-c-v1-1-a0ffd55f5c95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930-ok3568-c-v1-1-a0ffd55f5c95@gmail.com>

On Wed, Sep 30, 2026 at 02:29:04PM +0500, Dmitry Yashin wrote:
> FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
> This SoM used by OK3568-C Board.
> 
> FET3568-C features:
> - Rockchip RK3568
> - DDR4 1/2/4/8 GB
> - eMMC 8/16/32/64 GB
> - RK809 PMIC
> 
> Add devicetree binding for Forlinx FET3568-C SoM.
> 
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

