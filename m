Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AB372B5A;
	Mon,  7 Sep 2026 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770393; cv=none; b=ikHXWi0KeN0fN6UTkw8CuncqPKhBnF+ZlpQPNUtAbRfRVKDVyY8OjT4OftFYVrdyp1LL7rZiaQalBARzhOx/SetMnNz/LtABzO9Ur7NiN/l1vKEZFENFYS+x5hsTok6Do/RJMreig4hi0VZ9ya62OukEWRArlqmjlvUxyn6vBtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770393; c=relaxed/simple;
	bh=zDoK6+uGZXA/Sq7ZGnOPxEQJ0Y0OInWk3V3q0nTs78g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2BhYUFvyGKo6Qf8pW8LVv4Z/XnlBb0KqIucol1D6/LZ/rGOi+gkS8ut9o9VrfO+GfJhPgBM98j8jLcs0CuJ5mNHO3EOeqF6dwK6TTZiZsRk7vk8ZgANtJDzE15ibKZbwKrkQMO/OwW17GDCRlU6iWq5lQvRXMiATMFY/FS8wkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpMfsl+f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpMfsl+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D501F00A3A;
	Mon,  7 Sep 2026 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770392;
	bh=fGHehMKmF4vNAA+hz7aiKGQEL9DitcSlByhH2VpikK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpMfsl+fbf8jPSU5uRwCmr4e5mkw9aTiSY0tjtX184de8qnIL/+dxxf8u6jODlHLD
	 eGsFCS2dmv8egxxCthJ7cgrXydv05gr3wFY1+AVhFnmVwrXAWMxBgLJEy7/Za7ezjP
	 wkDz57LWE5Nwd6fZQzrFUavNIr181G/PHOj3SBQpNfptmxJAhlsyauzYANDs+xjGoP
	 6j/lsm09OQoc7jjBIs0ewHQTXxWwdEwV97n8JJxch/dvCVJyK3eZ1CebVI3tu8x+bi
	 zaVmSb1XIJ9ukVqjAkzQ/T1q9CR1Bt/f8tvJw6Om5BQBzOvONvtNa7FMRgoUeB9dw1
	 nB1/tSljxWQpQ==
Date: Mon, 7 Sep 2026 10:39:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Add sa8255p USB PHY
Message-ID: <20260907-neat-sandy-silkworm-839edc@quoll>
References: <20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org>
 <20260903-phy-qcom-qmp-usb-8255-v5-1-e251e22b341e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903-phy-qcom-qmp-usb-8255-v5-1-e251e22b341e@kernel.org>

On Thu, Sep 03, 2026 at 09:44:47AM +0200, Mattijs Korpershoek wrote:
> SA8255p platform abstracts resources such as resets, clocks and
> regulators in firmware. The SCMI firmware exposes multiple protocols to
> control such resources which are identified by protocol_id.
> 
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
> 
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
> 
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.
> 
> Add a new binding for the for the Qualcomm QMP Super Speed (SS) UNI PHY
> found in SA8255P.
> 
> Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information. Since it is not mandatory
> for the PHY to be functional, we have ommited it from the bindings.
> We can document it (and make them part of the dt ABI) once we have more
> information.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

