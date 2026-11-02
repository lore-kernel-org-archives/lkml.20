Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630730;
	b=21QEq1uahnUCBEBsYdkniTk63mraPmvxIyD21smWKAjNNY5JhYDHD7Uf7p5UXiW54Spt
	 v506QOWEUtkbrit1xg9P1lUIqf1Y1kxTotbW3Ta9ZYBeka0ZfcC8IGnWVNTrkOoDyujM6
	 pK2Uz31tBNLM+80o6C5ZQi0Lb6LFyl0+payubTO14+ROuh+8gfhzmy1Xxc2UyaPbK8iqD
	 PnTHmXTZF2bL7QqPeHC1OUt7xvkoUVnZk8YvdvaTASJ9HaBGHVNvOfOCiZEcGIPm09r3H
	 SZhaIpsXmD3UFr/+4nimhqKKKkuaJrSR/e4A7nHO4och1lkUnKGYcq7Pm5WlB/sS5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630730;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7vvpFbZYF9+EatWYsfyFZjmAL4FqwomgWuTi5Yv6hUQ=;
	b=cF83TaiCyo4nxT9lO7F57/9I7QVx5jye5GtIISQJCXrgYKVaxlzol5lQh3XVN9HeamNx
	 UwB7iPEkqonDQDa0j/3gl5TujImwRQIFollPNbIOTZWkOJsVBLRZrC+LBwOPwCQiVvdJZ
	 RLcVBSDchrokLUtNrJ3Fux4hfXGFYMfZISYUDAuownR0z8OKODblzG4hVXnrQIECC7L+n
	 K7/ye+Ugin+lwuLbB7sWpAQ9f4/gYOGQdIMks+WuLlR1S2jmAGOinUEZpP3HpnLzud/jw
	 gs7os3189QvGnMMLxKDfUBqcwHTZrtHAdEBo245C9K1qoXepXCXICupQTAvVbUYw0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRc7hiqh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDDF606A5BD;
	Mon,  2 Nov 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRc7hiqh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F941F00A17;
	Mon,  2 Nov 2026 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630730;
	bh=7vvpFbZYF9+EatWYsfyFZjmAL4FqwomgWuTi5Yv6hUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RRc7hiqh8QxgBfGnCpjQ5GfLpfJtDbKNTp+S4f+jcYs7aKQiRNt9MyudWdPg9LdF/
	 CgK/Uf9/QQ7mQPSEuMOQXZpDnm4qmmB9cFdu9oFO9wG9Yz6h/4c9hrCW/Hm0J4wjmr
	 kt9kt04KeskZOiY5LXXuA+Hswy+8RdLEH6NxfObkfCJ3RIv7PiTf8wz2Jpaewt3qpp
	 XwG/JJaDdNNYTzoUyiy933ZYLCcSomZIA8Y//PfbGbjkflR7U+FtN3nY3l/4gyNhp8
	 HHTL6fyK+sV7pO2GZ+ri+AqgqNOEN6fxlTNBnXp0gPh1N+xI/f5SA5BjHikgpMB9r0
	 uu0DfftDuebIA==
Date: Mon, 2 Nov 2026 08:45:26 -0600
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: bcm-ns-usb3-phy: Describe the NSP
 variant
Message-ID: <20261102144526.GD1232511-robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-3-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261021172819.668120-3-florian.fainelli@broadcom.com>

On Wed, Oct 21, 2026 at 10:28:11AM -0700, Florian Fainelli wrote:
> Northstar Plus uses the Northstar Bx PHY register sequence but also
> requires coordinated USB2 and USB3 core resets and a USB2 IDM interface
> clock enable.
> 
> Add an NSP compatible with a required USB2 DMP phandle. Describe the
> shared PHY relationship with EHCI, OHCI and xHCI so initialization
> finishes before any host starts operating.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../bindings/phy/bcm-ns-usb3-phy.yaml         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
