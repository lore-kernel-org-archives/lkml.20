Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471948;
	b=DdOR/sTHSRapq1Ho8WFXgz7a8/4kMJ6PLsF12t0Kz4UOu0i12z+6K+Afj7ddNR6BoVen
	 AL+eYGtkKc0kT9iEQltXOqcY4bPhSoBXwG0oM0sTe1Z6A0HHVoYMwTD7E3iYdYBfPUkXk
	 loDH/YxNghWtDlt87fkGM/D3xvjrAGpyVY/o8CxSMFM050Fsmf8V0EgjRY1rwIUdL9knq
	 Khp5uUcKNry7TlpQsB5n9AhuhV1as/JmkasEYLDNUSNOXvxOlj8ASuW/vYN25DiD03urc
	 ujS7bxb2wIaWhl8oEBm6qocwh451DW0/puvR15dmq0XYicfKQ+JK9mnkmzdp/aGaScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471948;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ySU9YsqIwR1ufjZHqp9vrCefUh/LOd39PBoHEAn2kkI=;
	b=nBl6f1GlgbJYx/+y67k1xDQWpLZJ647YEWryxC6oJaQfnjtlH9KRwA2V9A7lGEJXGrBz
	 CqU3RM2A2f81igvN07foc1R/6TXebmg46/YRSnb6mexT+H7ReOD/PWINliNH1EX/KNLty
	 emgyVv7LjNMxW4irUZFbXEm7S9tWkLz0EJsgIpvvaIu60X1/ZzVj7eNXXi2nKz5l260dK
	 eMlQPV3jMNoWvtkf7Y0rsI+arhwzXxbrCS3MHg+d1/sxv67PQaECDvPUDcqIwRDA8ZWm/
	 /Pr6xwG1CFHBsgUP0cXietn0+I2ZiznsR0XYTbHm7AFY3z1omMPtLfb1adolJv1bWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOOEtx5x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57B606A884;
	Thu, 12 Nov 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOOEtx5x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB231F00A05;
	Thu, 12 Nov 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471947;
	bh=ySU9YsqIwR1ufjZHqp9vrCefUh/LOd39PBoHEAn2kkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VOOEtx5x34WBl5oJ7iR0eG9TcH7mIJktKsS/owNQlfIvyLrDgGWZ3eoQ6FsIHSFtn
	 AWDulVn5ve71+LDdapnT2caitCYpe9K6OKMLUKP10PH04z7BDPQjbErTCNxDbkyw6l
	 +IF/af2uCVdW9KcXQIJ1e8QvwEqK34A+jRjN1aMAgq6U8xEiMfjnqOPcmcJwX5NrMP
	 FcUoC0tidGUAVN1HacKhv/x/M5h2f7v9N+V383zXD4UhiQVW8Nf9g+eqMvgM2lGZVb
	 iSwjNjlwecVnMv9wUnOSjgE+geq+6mONbaDALcQsAOU7tEOJmnrlA6CakqYoIDuvTT
	 TvdS0SKRqkFnQ==
Date: Thu, 12 Nov 2026 13:55:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <avV4B4g-NWtZbLuX@parshuram>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
 <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
 <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>
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
In-Reply-To: <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>

On 27-10-26, 13:37, Krishna Kurapati wrote:
> 
> 
> On 10/9/2026 10:29 PM, Krishna Kurapati wrote:
> > 
> > 
> > On 10/5/2026 2:14 PM, Vinod Koul wrote:
> > > On 13-09-26, 20:10, Krishna Kurapati wrote:
> > > > In cases like USB High-speed phys which can be either USB2 or
> > > > EUSB2, it is
> > > > required to know the type of phy (rather than the operating
> > > > mode) because
> > > > DP and DM interrupt lines need to be configured differently for each of
> > > > them.
> > > 
> > > Does the controller care? In preceding patch you defined the EUSB2 in dt
> > > type, so this describes the hardware. So phy knows it is usb or eusb...
> > > > 
> > 
> > Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now
> > its type, but it needs to communicate the same to controller.
> > 
> > > > Add support to cache the PHY_TYPE and add the following helpers:
> > > > 
> > > > - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
> > > > declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
> > > > 
> > > > - phy_get_type() for the consumers (like USB controllers) to query the
> > > > type of phy connected to them.
> > > 
> > > I am not convinced that this is the way to go... Driver already knows
> > > the type and should use it...
> > > we alreayd have mode, i am inclined to not say yes to adding type here
> > > 
> > 
> > "Mode" attribute describes the current operating scenario of the phy
> > (device mode, host mode, high speed, super speed etc.,). But it doesn't
> > describe the type of hardware and hence a new attribute.

Not really. A combo phy can be usb/type c and we do set that mode...

> > 
> 
> Vinod, can you please let know if you are fine with this approach. If yes, I
> will send v9 rebased on top of phy-next.

I am not convinced that this is the way to go..

-- 
~Vinod
