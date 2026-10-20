Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515628;
	b=eDReMZOSjQmxaQ60iXfyy4NEioKvTw7QUm0zTivxNxfzFcuahrda5J4Su3k3v0hTEC/p
	 369fW28NfdpR38vDgcqT18DbGA555m5vh4zQX9ZyaymUjKGq86TJeKG4B8ItcXEtH2feL
	 CgNDgzwGb2iYc6/PtmQ405f2d1VPIBK9qB4pIo17x+/5R8XtdEsC8i3kN6SvkgWLK6bPS
	 hX91i3tl5J70TSGxyLaLaywBqrY/YfgtyN/hFKbEhWchvMuYgPZKAOVzlvfzLx33o0dUm
	 Dcxk4T60JfBdAxaV3uXVhlA0GWCsL1GiTks7By6nd8sRsI0hXvIT89Dg8wqZ8gfm0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515628;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Q/IySxjUF4Mt3d1rneRc0KccNmdHoqcC2DkDjhXr9Qk=;
	b=Ru5Z6k0gt0tI4EuUE8l8fWKBdPwjdJBnPdWyo7YEwNPVPz98y27scotu0HaXkYgkoXZ9
	 uF6QjqjjSvabYZusAbuwIm9A5G+7ob0/2AilI6DdW5EfLl8ImY/2tHLXp642Oc+USEiVn
	 onQaZTSfDvkNzr73cBHV/ibVPuPLou2H63y7KYWZdSd+zPWkEQ+LLtBDIUPikPSCdZ9Jk
	 lEkC8UVO7fzmMePIk5JHFRYATV5dAExSMcUWAB8xsOQvu+U3wOFowXvGuWWcx1CTTdBQv
	 YO0enHoDLf4SfgUvE1fxzRr7sov4lYXmLYs9RSdkQg00JcJ8uWmKo8Zf1TAGVObroEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837BF606A320;
	Tue, 20 Oct 2026 17:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321DB1F000CB;
	Tue, 20 Oct 2026 17:00:28 +0000 (UTC)
Date: Tue, 20 Oct 2026 11:59:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-phy@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Message-ID: <179251559688.4163940.7901807887627397046.robh@kernel.org>
References: <20261016071225.2092-1-ansuelsmth@gmail.com>
 <20261016071225.2092-2-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016071225.2092-2-ansuelsmth@gmail.com>


On Fri, 16 Oct 2026 09:12:23 +0200, Christian Marangi wrote:
> Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> work. Add the required register to configure the PCIe PHY and provide an
> example for it.
> 
> The PHY link to another PHY (the QPHY as described in the YAML) to
> correctly handle Gen2 speed and mode. It's mandatory to have this PHY
> configured for correct functionality of PCIe. The QPHY is a unified PHY
> that both handle USB and PCIe PHY.
> 
> It's also mondatory that the QPHY setup is done in the PCIe PHY setup and
> calibration phase or calibration might fail.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

