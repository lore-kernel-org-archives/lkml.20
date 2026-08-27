Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5A466AF5;
	Thu, 27 Aug 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836052; cv=none; b=gt34KLKRHv1EDJe6ZGO7pwiBntoATJbZ5WTzUPSc4JqZ0piTmk2vaL7UuCkoZgOOE/Q+weOJVdvCHrkAwNB7V5Avv9y+8c9X3ewYH0mFa1FmqHwsB+ncpYandKnSyu3fB1VSlSXnvQvw3HOO22YOLXYaOoGd4GMuawJwZKRViAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836052; c=relaxed/simple;
	bh=E7idqHOncmG7mF6Fij9tBltdrtulZ+mN4mIw16QKjBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGGRChldbHthSWZj7PyGyMTqp1ElvXT14Yvf26uPij5v1rLzS8UlrRDq6wd0QBPryI64ewhuV3guy2RwgzKDaecXAJQwrSeN/1ip7e/R29GQD8HaLPIXq3a3U2MhephiEo3TuzthwTR3wzNoJt2b0GTQwgyq9lWG0VYaEaRdTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbkNkqof; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbkNkqof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119E81F000E9;
	Thu, 27 Aug 2026 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836036;
	bh=E7idqHOncmG7mF6Fij9tBltdrtulZ+mN4mIw16QKjBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HbkNkqofgca0N5Jj0aw+z4giRuz2xH3T4sWKZErKe9iV4Rla0Ul7qRVW3meU6hTXL
	 RzzC9URElHLfzSvuCUSJYk3m1rOoSCwWZF9jw7cIi3PZc2OncHlWQ+h4B8Y5z6Ddiw
	 n77PfXAVcTjuX5X9CAcdV7kvHjURMrI4WdBes/IYYEwo4uXXFeoFb4SfCnK71sp965
	 30BGGHUNDgnXCTK7aoRz3uiKhnspaGD/wTywqrV4qixFUcFlswhKBVUbRn4tVS+DEd
	 KJQ7cLa5lGntEhy47ujyEYXAFoaD8QVFk6JXT5hbfLWbh+7/oCVqr6vR334kaCWYGd
	 VfEUHF4prbYhA==
Date: Thu, 27 Aug 2026 15:07:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
Message-ID: <20260827-skilled-optimal-shellfish-c548e5@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-8-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-8-marex@nabladev.com>

On Sat, Aug 22, 2026 at 09:46:40AM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
> PHYs would get populated by the OS.

Sashiko comment is partially valid - you change the ABI in incompatible
way, by requiring a new compatible. Commit msg should briefly explain
the impact, e.g. that there is no impact because phy was not
implemented by Linux and was not described in the binding.

OTOH, adding simple-mfd means children have no dependency on the parent,
so this should be considered or even explicitly mentioned in commit msg
(parent clock is irrelevant to child, right?)

OTOH2, you have now patchset dependency which is nowwhere explained.
Merging constraints are the most important part of cover letter so must
be clearly stated. IMO, should be stated also here, because many
maintainers do not read cover letters. Or just decouple dependencies
with using 'compatibles' pattern (see Qualcomm msm/mdss display
bindings).

Best regards,
Krzysztof

