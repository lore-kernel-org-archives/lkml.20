Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524014;
	b=tRkscHKhi8BRfzsBzTopLOjYQANj+UxODUzYxj1elibqsJwMBPAsqfvnCbJfqtupqHG9
	 sqioIBqd98L59dO2zlwNnj7NWwO69elWtX5akk8XFzLssTlFDmW2DbUTfc7qzzlPl6286
	 1thGKbqhVod/53MUfI7z2z4YIpfsCGz0uotdlBO0lb66AHeEvNkQFKSZIheE/2rSgp/Sr
	 bjX4q1DLOixXKrAr2WO4tmp/LgGtUmZjj1OsD3G/6P4ZdkT8OS6mUDT8Twt6V5lwqzdmZ
	 l8tMD+8We/N9YQzlnKPlzn7S2DRlLm2rx7gfD3rOTAGkrQo4sz4bJWBeVqYC/32q1aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524014;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=riOq4/RI64RYT6I791/FAJUl+Fz8YYsU95UzjkX6Fp8=;
	b=edobiOPSsW7Ewwah97wjfqGPgOb9lD7oUhsCVaDm+vF8bYFwR46+sXuYcsgC70jpJ0jq
	 2KpTAaT/h32Fa5JcNunW7A3t+DEyYTDdKWtwwmQs45i5lvDL6Jz/0xdBnZ+S5l6WhVHHB
	 vXSwhCkUuNSg408mOspWJk1+9QpR8dBwgkXt5LVA9ZMrYYcamXH/WMHAtB6VCwJLaWTGJ
	 h0nu9lnJsv0qBnKy4jWpdpaA8nKMOM7Z9ZtW9dqQSGTPI2I/PX4tahiovyO8OxhMI6gAU
	 U9r89PJCVL2TdnuCMXC7iPqnzclsqAmGIqROvi+UYD/tGCnhiGf40/+0QRgllKHsq9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aP0Rk9Ll;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916CB606A31C;
	Thu, 12 Nov 2026 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aP0Rk9Ll
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AD51F000C6;
	Thu, 12 Nov 2026 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794524014;
	bh=riOq4/RI64RYT6I791/FAJUl+Fz8YYsU95UzjkX6Fp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aP0Rk9Ll1GcUq9dX/ZnSLaSfSIIjPHTjj8j1g2Z11u62YwyU8t7n+ZedIBZjm4MLq
	 RUMuzfEw3pplAYYjgUyj9I24yLd0unrJCfa7VnXSvKbiy676uPLZPxGksJve0LYOPc
	 HFtfBeVo0t/WhJWwyQHCYVr+qp6EfGT/rKjDUuUJ16Jmk54Q7Cc5Yx82x7vdi9MP2/
	 901pAruII26uSpT7yuEHSiVHH9RPI57zxWob7yBevhddMcL/TYrEMWGfGiiXBG2RUG
	 63yWDcDlS6L0S5F7g/wvfruSMyVwptBqE7aAt25mIvLoFqmlUStsiy257qADJU4tLK
	 9FHbz4IWECJyw==
Date: Thu, 12 Nov 2026 16:53:28 -0600
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <20261112225328.GA1784283-robh@kernel.org>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
 <20261105064117.277495-2-chancel.liu@oss.nxp.com>
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
In-Reply-To: <20261105064117.277495-2-chancel.liu@oss.nxp.com>

On Thu, Nov 05, 2026 at 03:41:14PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
> 
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
> 
> [1]https://www.nxp.com/part/IMX-AUD-IO

That link is pretty much useless. Is there a pinout definition 
somewhere?

Looking at the overlay, this looks incomplete. It looks like there's I2C 
thru the connector for example. There's also power rails.

The idea with connectors is that overlays apply to the connector node 
and nothing else.

I2C we've kind of figured out with something like this:

connector {
  i2c-parent = <&i2c>;
  i2c {
    ...
  };
};

Regulators is still open issue though.

Rob
