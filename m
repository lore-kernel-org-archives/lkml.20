Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520305;
	b=w87e6dQNwXwzGTznv/oOtljEfPN2eKijWNMFRyVKdSgYHJ8jfG9zUKAWpNqEs5wzy3fw
	 VSZmrgnTPEafjzcM0OOYs6OqSWXpgsvsj9EjZuGMtemTwo24ArSACTOMHIS+wL8tBl4do
	 43qyaYS/6Ew3k9QrQGAWWeOIL9fT+Vryh+aJkrThgAI3Sxmb1IAkWu8COjrWTYtW6O3Y/
	 fO87SqR0t8Q2tFUz1gX+P/ykoapAIzsTIebPEdXnOLJRdqEwRsjUwCcX8jy0p90wsLifd
	 L5rA+eM6wQGt8LcOsd9B1whvuAkYPs/ZDi1wACdnnk+f92ZKd3J40W1tI+RHcmTZJnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520305;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DfBhKtajucyvfmmNTsKe2Ab7sqyhk9L3hh3VIyXeDhI=;
	b=ilUVyx3xzo1EPTdw4ao60AnMwpp62AuKBoezQRmcjjnRD5asSYNfufOlLh9E6aQnvUCP
	 kJGzU38PVk78p6n+FhiFoYnBTql6LDJkG/CNl73/VW/tXcZlNUl5R7ot6FZFwQR2dM72L
	 NcmaaThpLOAXbfwE5/j5Q5NUwjkJ9NYQGZZR37udUtyxnUdMGn51NQWZdBGelZ6XFSD1o
	 UeK0u2ZchAOPsuOQrEwN3PrsZTvfTxJNgRhqAs5MOrpio3Diya/Gy2ws2U4x7oiCwgbkh
	 7rw1kGeJoilV5xYjl8+QzlX6fpKPQxGM7Tua8ynHg1voi+pCPBI6kVukYvrZ4zxJswQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91903606A31E;
	Tue, 20 Oct 2026 18:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D9B1F000C9;
	Tue, 20 Oct 2026 18:18:24 +0000 (UTC)
Date: Tue, 20 Oct 2026 13:17:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: krzk+dt@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	Thinh.Nguyen@synopsys.com, conor+dt@kernel.org,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: amd,versal2-mmi-dwc3: Add MMI
 USB support on Versal Gen2 platform
Message-ID: <179252027211.589421.5653120976811914326.robh@kernel.org>
References: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
 <20261020112636.2661087-2-radhey.shyam.pandey@amd.com>
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
In-Reply-To: <20261020112636.2661087-2-radhey.shyam.pandey@amd.com>


On Tue, 20 Oct 2026 16:56:33 +0530, Radhey Shyam Pandey wrote:
> The Versal Gen 2 platform includes two distinct USB controllers. The
> LPD controller is a USB 2.0 instance and reuses the existing
> xlnx,versal-dwc3 binding. The second is the Multimedia Integrated (MMI)
> USB 3.2 Gen 2x1 Dual-Role (DRD) controller, which natively supports USB
> 3.2 host and device operation over Type-C in a Gen 2x1 configuration
> with a maximum data rate of 10 Gbps per direction.
> 
> Introduce a new compatible in <vendor>,<soc>-<subsystem>-<ip> format to
> uniquely distinguish the MMI USB controller.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v4:
> - Switch to flat mode and rephrase commit description.
> 
> Changes for v3:
> - Modify commit description to explain that there are two different
>   USB controllers and difference between versal2-dwc3 and
>   versal2-mmi-dwc3. Suggested by Krzysztof.
> 
> Changes for v2:
> - Add blank line after compatible as suggested by Krzysztof.
> - Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
>   IP from Synopsys is part of the dedicated Multimedia Interface. The
>   Versal Gen2 platform also includes a separate USB 2.0 controller,
>   and the mmi suffix uniquely distinguishes between the two USB
>   controllers. MMI is an independent subsystem particularly targeted for
>   deployment in Multi-Media related applications. The MMI block include
>   following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
>   Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
>   Controllers, DP AUX-I2C PHY.
> - For MMI USB define parent address space i.e UDH block.
> - Fix inconsistent MHz spacing to use SI convention with spaces.
> - Move description before $ref and items in xlnx,usb-syscon property.
> - Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
> - Use 'usb' node name (without unit address) for versal2 example since
>   it has no reg property.
> - Use 1/1 address/size configuration in versal2 example, use lowercase
>   hex in syscon offsets.
> ---
>  .../bindings/usb/amd,versal2-mmi-dwc3.yaml    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

