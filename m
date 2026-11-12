Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469869;
	b=0FWVbe0gNnnb+SU6lEywnoQbGXZbI8w2AjX2bYj6Am369jZspz4PkPboYoXOS+uAwO5b
	 uhidb6kz2BXR7zFXnWyqtTlsQh2CCzTHZUcANTa9OFJ00amZSyrjdorOJbhEi3mY0X3Zb
	 Aq3Lg9hSp6POhc29tEJELHqhmxSQYkeq3eOK/HjMeH6Fl27J6g9XJil6uwy3vPWGT6it8
	 0SEMNgxPnLZUGSHBGxpVfC1JVOVFDXS3NUtRWD8y8Z/y3DhgXGsYwYgrCeQWDyIDkv6yj
	 0N6kSGqxDp5ZTZZwS8aONvv+09+LgHoR8IdoUTa11KST9QKq96qi+rHli6Tx7v/sRlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469869;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SaQKmVmkA5b4Dxf/nCLCceZaqsgAoFL+1WLaeeE3/m4=;
	b=UpWCg0sLKQAn92SGsMNYyA007mspbcUZcy/dZA9kIoa5uKeOuygFdUzbo2Xl8QZz3/Bb
	 7yaEAjOAFiTnJo7t/SFqLHyCkdjiGbv2arhzZN1XbAymFik734n3olgEv9z6gT1i7VZs8
	 N83Q/6otVQuvE1n2pzCaH+H9W/OhqcR2Izhc98agy13oJXKGH+8rObVPhDWuhtXIVh7Ak
	 TGXo2m5FAytCRETftqOTO54PCLoaIDJg4HTv6/AnAnFfWiB9oouEdGmE9zKsFECblih6k
	 Z6WtAZUM9Ow1t8vx0NS/JizFxES0KNtAeoZV+mu1h85UoIlN9FUYSlE9IiNnOpIm5Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JL6YBOr0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF7606A8BE;
	Thu, 12 Nov 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JL6YBOr0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898691F00A06;
	Thu, 12 Nov 2026 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794469869;
	bh=SaQKmVmkA5b4Dxf/nCLCceZaqsgAoFL+1WLaeeE3/m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JL6YBOr0UVg2V8GLj0ZKsLZ55Rfjh3Pv5puOkD1/zhpaFsjsUSVy1/Gge3Mb3pOUG
	 Ipqz56Ldkm28d7yg/dam/qHxClf3jtmCT4yxBasOg8kmsyB0wp8Kzap/gm6h0SaurL
	 5kQIvA8JSj2XZn1GgWfKpuNV84hyuPdUab5R0QbpLoDgtRm+4Lw+5A1GvWgK7++ZvH
	 432teWUl7SB41egXYbKwrrnMOx/+TMo9A8syFkT7/F0IIuUcnXwdgcH8UfOkm4Ceox
	 BvO6jpEka6U805f+5OePnZPgh5+dfgxGc8tg5Ir7Ub/HfWZdQvpeosgCtPz1MSJTBm
	 xfVEux5KU6VSw==
Date: Thu, 12 Nov 2026 13:21:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: george.moussalem@outlook.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Stanislaw Pal <kuncy7@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/13] Enable USB3 for Qualcomm IPQ5018
Message-ID: <avVv6IyiHlklZdvp@parshuram>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <4f586fa8-e7c1-42fd-b853-a2093e8a243b@oss.qualcomm.com>
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
In-Reply-To: <4f586fa8-e7c1-42fd-b853-a2093e8a243b@oss.qualcomm.com>

On 20-10-26, 09:59, Konrad Dybcio wrote:
> On 9/8/26 11:40 AM, George Moussalem via B4 Relay wrote:
> > Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> > present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> > USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> > Either one of the interface can use it via the mux selection present in
> > the TCSR register. Current patch series adds the support for UNIPHY with
> > DWC3 USB.
> > 
> > The series is now split into 3 parts:
> > 1. Flatten USB Controller Nodes on IPQ SoCs
> >    link: https://lore.kernel.org/r/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com
> > 2. Enable USB3 for Qualcomm IPQ5018 (this patch series)
> > 3. Enable USB3 for Qualcomm IPQ5332 (to be submitted)
> > 
> > ---
> > Changes in v4:
> 
> [...]
> 
> > - It's worth noting that I left the logic to register 1 phy in this
> >   patch unchanged despite Konard's suggestion to register both
> >   (PCIe and USB3) to avoid changing the existing binding for the
> >   existing PCIe phy instances in ipq5018/ipq5332. Although the silicon
> >   is capable of supporting both PCIe and USB3, the instances in scope
> >   are wired for single mode only. The next patch set will register both
> >   PCIe and USB3 PHYs for the combo PHY instance in IPQ5332 and use
> >   #phy-cells to select the right PHY in the respective PCIe and USB3
> >   controller nodes.
> 
> We need a bindings change either way, so might as well do it
> "right"!

Are we getting an update to binding? Or is this good to be picked?

-- 
~Vinod
