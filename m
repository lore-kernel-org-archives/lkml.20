Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844867;
	b=ChjW2FaxOq8bh5GH6QF2BtBht1OlzoZu8O/t4IZ2+JUsOt6IlxDaaRD06ZExQZ1psLrS
	 JCa10XBBSPJHb8mzpwMiuQKUe+N4BXJiiZr/55i5KU6CEtOd41dYx0cWBslDTME2DMb8l
	 0UBcv+3Xmj6Hna5hmLR5dtncxUdjHs4SURIOkuDm6pfYjolfXAIQvrrD9ladVk9u6Outp
	 YepAMecLa2qygPkH8k06PNzSJWWrzNYddiaHVB404vxt7wNtFpz3camia9kFpE5dq0Rx1
	 pg0Cp4ZU3T5CufSGYx2aD0FGWOHDI3CsxC2z2M5cEHN3NEemtWWDLRtPWUC/LIEdJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844867;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1yzaqsKWntD6D7WhPRLpd4zR5p+pFWl1Lj+jCyzgHHQ=;
	b=hP5EdB0bHPbjl8ASqoHL7cZv++S1mNDPqBtgyW/hXKNG69bfXiOorDxRKBiP5YEk23iE
	 LMNVSWgQSz9g1Xb6rXvwWGXmU22hjlnsYfBdlALuH0qSJ3m5igeS9I2T6a7T4uoAqa9KQ
	 TAwzl8M31XQ4noCgBrdmnB5XvbkKoFavu9/I1dfA6IwzJIaiIr6Wjd2KH4352Qi06kcCa
	 NoOkZmP8idaRyX3fzmYfH33oSneU8VStuFG/5rRyutR4GpVHjGFTLZI/X1QaPsGEuZ+oy
	 hngiF15qEtRRhtE14U99uRhuKDwlD1cqYUPdBwlt3yKrwL7lFHc+qby6ZLnE1UvmCFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzElkGHn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EDB606A31C;
	Mon, 16 Nov 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzElkGHn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EAC1F000C4;
	Mon, 16 Nov 2026 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844867;
	bh=1yzaqsKWntD6D7WhPRLpd4zR5p+pFWl1Lj+jCyzgHHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QzElkGHnsj+Vy2yUPNEIflYwrdtpxPlJZdYMfB6W0neh9fP8PhO0YQ85l75ANNcyz
	 6fbjRzIAG3CeerrV5J0mW26Ib8Xx6REjz8+nBVWZISoLzbLwsjQrhEbpqGqtKuYnsb
	 DfJp+L9Q4U4AyqGd+SGabb1agjQVOW+RSxeC2c8tKeP1YknqeooZTk0CbnJDzNhNYx
	 o1Xc999YlX4Q050yskQYZizLPK1lCgMc3ThNDInLypAB4/cQdIVUvGM/us2tkz8kk9
	 RS6mhH0a72CL9ugnhz4A18PwXGbncu2epigbeTB7futH1m8Pfe5H/hYDST+SMnerJd
	 Mf8VSNL0DgGYA==
Date: Mon, 16 Nov 2026 10:01:01 -0600
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <20261116160101.GA2015740-robh@kernel.org>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
 <20261105064117.277495-2-chancel.liu@oss.nxp.com>
 <20261112225328.GA1784283-robh@kernel.org>
 <dd68ae61-9dfd-4138-acf5-b77c63ba0fa3@oss.nxp.com>
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
In-Reply-To: <dd68ae61-9dfd-4138-acf5-b77c63ba0fa3@oss.nxp.com>

On Mon, Nov 16, 2026 at 04:14:26PM +0800, Chancel Liu wrote:
> On 11/13/2026 6:53 AM, Rob Herring wrote:
> > On Thu, Nov 05, 2026 at 03:41:14PM +0900, Chancel Liu wrote:
> >> From: Chancel Liu <chancel.liu@nxp.com>
> >>
> >> The NXP AUD-IO slot represents a physically present I/O connector on
> >> the base board. It acts as a nexus that exposes a constrained set of
> >> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> >> electrical wiring. All actual hardware providers reside on the base
> >> board. The connector node only defines index-based mappings to those
> >> providers.
> >>
> >> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> >> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> >> same add-on board can be reused across different base boards that carry
> >> this connector.
> >>
> >> [1]https://www.nxp.com/part/IMX-AUD-IO
> > 
> > That link is pretty much useless. Is there a pinout definition 
> > somewhere?
> > 
> 
> The detailed user manual (UM12022) is listed as official documentation:
> https://docs.nxp.com/bundle/UM12022/page/topics/pcie_interface1.html
> But it is behind an NXP login.
> 
> The brief pinout table looks like this:
> 
> Pin    Signal               Dir
> ----   ------------------   ---
> A11    PCI_AUD_RST_B        In   (GPIO)
> A12    AUD_CARD_DET         Out  (INT)
> A21    AUD_SPI7_SCLK        In
> A22    AUD_SPI7_SS0         In
> A25    AUD_SPI7_MOSI        In
> A26    AUD_SPI7_MISO        Out
> A29    AUD_SPI7_SCLK        In
> A30    AUD_SPI7_SS0         In
> A32    AUD_SPI7_MISO        Out
> A33    AUD_SPI7_MOSI        In
> B5     I2C6_SCL_1V8         In
> B6     I2C6_SDA_1V8         I/O
> B10    AUD_SLOT_PWR_SYNC    In   (GPIO)
> B11    AUD_SLOT_PWRDN       In   (GPIO)
> B12    AUD_SLOT_MCLK        In   (CLK)
> B14    AUD_SLOT_INT_B       Out  (INT)
> B15    AUD_SLOT_INT_B       Out
> B17    AUD_SLOT_INT_B       Out
> B23    SAI2_RXFS            Out
> B24    SAI2_RXC             Out
> B27    SAI2_TXD1            In
> B28    SAI2_TXD2            In
> B30    SAI2_TXD3            In
> B31    SAI2_RXD1            Out
> A2, A3, B1, B2, B3      VCC_EXT_12V0
> B8, A9, A10             VCC_EXT_3V3
> 
> > Looking at the overlay, this looks incomplete. It looks like there's I2C 
> > thru the connector for example. There's also power rails.
> >
> > The idea with connectors is that overlays apply to the connector node 
> > and nothing else.
> 
> For this patch set, I2C, I2S and regulators are
> provided by the base boards using a common set of labels:
> 
>   aud_io_i2c
>   aud_io_cpu
>   aud_io_reg_1v8
>   aud_io_reg_3v3
>   aud_io_reg_5v
> 
> The common add-on board overlay references these labels directly. This
> allows the same overlay to be used with both base boards. But the
> overlay still depends on nodes outside the connector.

Using labels is a solution, but not one I particularly like because that 
makes labels an ABI yet we don't document them.


> > I2C we've kind of figured out with something like this:
> > 
> > connector {
> >   i2c-parent = <&i2c>;
> >   i2c {
> >     ...
> >   };
> > };
> >
> 
> I will rework the I2C part using this model.
> 
> > Regulators is still open issue though.
> > 
> > Rob
> 
> Good to know this is being discussed. Is there a mailing-list thread or
> patch series I can follow?

Search lore. There's been a number of connector series over the years. 
gpio-map, clock-map, pwm-map have all come out of those discussions.

Rob
