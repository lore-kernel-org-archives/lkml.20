Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199C469846;
	Thu,  3 Sep 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426391; cv=none; b=J3XDu1AWOiRoF0IOB7Kz3dPyOz0XLAuJPprfQbaJZx+9bvDhMdPHrZ7tyykwalGDQeYI+Dd3h7TIy27jD7hALo9PbcS9AymddE0ekPnNdYj1dkPWHg1CPKMuQxXOXN3jWRMjPgnCadc0ZISNypMqhCleTBiegzdKocABI463RRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426391; c=relaxed/simple;
	bh=T3Nibt0RMBAKTowEo5mkmfusLMTU9MdcH3Q05Dpfm0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDFhNNtfG9rDeVgu0EAg6Wc4p4jK/f+SAn1THuDFCNyImGae5lOLuUCaw0Qf6PMgoWDURoFcJ5tqlURp4YMAjO69T+5+OpLSzw/X8Xmfw12Y8EZGj1WOUzIxDQhf1rJA9c5LDCFynuRgim0CrpnEtFfDYfoyUXvbjuw5EtVbDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eP0zJOHO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eP0zJOHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13311F000E9;
	Thu,  3 Sep 2026 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426390;
	bh=BJurZ0sDL+PdYyxRCXnRVCg/8ycMguZD9/GnjjsgUOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eP0zJOHOoS7lq5B3NSCOQTqAOjmyH0JoBfoujISG2iKaiKnt+WPcEXlo5N3TJU8Ji
	 jn0FxaL+udFQNfzAtnQ/Vq7DpGgE5gtamBbLu0Lx5QNF54eRdnf9hUY1MTtXnco39m
	 IwIQi83r/ftessLmCGUOhzUXlcmJXlHx+tKFuUXUl1TbXUoduudDYY8O1VQaYIWkEa
	 ymKukGLoRbZC+/8Cw5K9ObklARRwrrF9IT+8FM2/ZgaPM2ZHRhFuG2E15B8UwteQbT
	 fBNZRBQ1+x2ez30n0IgBqgj7BjWPOYKG5M1EYkORzVAD5hEljenAdr41RvdzhgbcRW
	 W86ZfxCwWAl4w==
Date: Thu, 3 Sep 2026 10:06:25 +0100
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Frank.Li@oss.nxp.com,
	Support Opensource <support.opensource@diasemi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260903090625.GI2133376@google.com>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
 <20260902102532.GQ2943942@google.com>
 <20260902-varied-unsent-b99f9f007685@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-varied-unsent-b99f9f007685@spud>

On Wed, 02 Sep 2026, Conor Dooley wrote:

> On Wed, Sep 02, 2026 at 11:25:32AM +0100, Lee Jones wrote:
> > On Tue, 01 Sep 2026, Conor Dooley wrote:
> > 
> > > On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > From: Frank Li <Frank.Li@nxp.com>
> > > > 
> > > > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > > > years) check_dtbs warnings:
> > > >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> > > >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> > > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Previous try drop dlg,da9052 at
> > > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > > > 
> > > > but Krzy have concern about compablity.
> > > > 
> > > > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> > > > 
> > > > Conor prefer update old dts.
> > > 
> > > I don't think these devices are actually compatible, so this fallback
> > > would be wrong.
> > > The data comes from the match data, be that spi or i2c, and there's
> > > explicitly different behaviour for the da9052 and da9053aa.
> > > I doubt the legacy platform ever worked properly, and this is what should
> > > have been explained in the PR that Krzysztof denied not just blindly
> > > citing a dtbs_check problem.
> > > 
> > > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > At first glance this looks like an Acked-by.
> > 
> > IMHO, this is going to cause issues - please rethink this.
> 
> As in, use NAKed-by instead or just say NAK without the name/mail?
> Not entirely sure what you're getting at.

As in, don't make NACKs looks like acceptance trailers.

If you're going to "NACK", which I always felt was a bit harsh anyway,
just say it without making it appear like an official sign-off.  Please.

-- 
Lee Jones
