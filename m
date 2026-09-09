Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC804772A3;
	Wed,  9 Sep 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942832; cv=none; b=tIJvsxh0ba1PmYMuex6GASVFeqkaZkfgPMosDi6AQ8POI5R04hqxghOSodD+Et/PALXiUquxaSxLi7qk4JsJeDjP8VHnS9uMqpwB9gbDwi9KwMDWlh1YkAKpYlpKp3r4A5qlYYNcpJBSrcKvQlh1cIIO1shR1o0vMicVro+dzFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942832; c=relaxed/simple;
	bh=pQfRxL6gEosRftT9MXhOdS5NestFHOBeGSMy3+jkSyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWbauJ7rDAlL/RGOXYftNpnOADxxeRGFuqe0QJ8WWDCeSavwicyOZsycXDD7xIBKL7uDFCKQm0nu8xK1mR32cmaEPzd7P8vAS/qK/BLZZjFHLbkuW9v/la+fNQgNdj2MW6rMhAai+fRHeJV2Qyon31cuzju1cr0wxtZ+JDaM9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy4iarGh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy4iarGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69E71F00A3A;
	Wed,  9 Sep 2026 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942829;
	bh=mQsZ6aebHJQxMkqt08Wbinhh4q6wlMlL8C0i60RN04A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fy4iarGhYC+fWRY4cqIOo4UckU2EIMXS943jL66BN3X8QLqdQmc+dpdmIZU3mx+dk
	 T8pBJ5C62jV4HmOpG+OzT00naRFeuSY7Dt0NFoGkrJLEcHNPk0kx8LGq0UVbEgLEcB
	 QeXk94WlbdJciaYl/0RKL767RGRa0jvIR1Bdw3Mdk3zGiuP3ByXJ7g35V+uWWZRQ2e
	 z/F4MCGVzPverSRjIrLLgnKo2+uRxovZkstb92Vg4jmWifuyQvlCa8bnhpDAgj0MWS
	 yCrOLtF8kMA9RgQuZJqK+zKNy2vWUIy9sxOXD6KWvc++TarkGv7Jz+lVE9EOAeIUNI
	 75C+c7kRhXn8A==
Date: Wed, 9 Sep 2026 10:33:40 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: aspeed: Document AST2700 USB3.2
 PHY
Message-ID: <sb34uqn5egc36c3or6mbhjj3k2sgcdxkdwnrberrnqzn7oqrag@75ghpc6cjmrp>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
 <20260701-upstream_usb3phy-v3-1-00e12315b6f9@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-upstream_usb3phy-v3-1-00e12315b6f9@aspeedtech.com>

On Wed, Jul 01, 2026 at 02:58:17PM +0800, Ryan Chen wrote:
> Document AST2700 USB3.2 PHY. This IP is connected between
> USB3 controller and PHY module.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
