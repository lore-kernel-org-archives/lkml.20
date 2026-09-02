Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B943B6C5;
	Wed,  2 Sep 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344739; cv=none; b=OAzvg058Ms2UNeJI8Bq6v494O61OfIH58980iDqkFnT308ROw0SDFISQYCH+G5b/NNptCluG4XbC54YEIvYEpm9+ijfqDrtVUL2GOWiCBIYxWrjp1GRIhxfqYMl4hA3m3aHBSfxDfhDnc9bBPRJhNLEEo207iIVxYm99Si22eqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344739; c=relaxed/simple;
	bh=1pHVxuhVmZ9w/A7TSdc7iZpLQg3G8aWC8XtVg04bnTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYWvD80kOXEyswgYqnKAbBxhdyEvOvOcJlWehkO4ItmyrJ/y9PxuKDDnvfCdXIBiQYuY/10k79i7Z9+Zx9Ex79s1y5HedKUM7uJvHgoCYyBn97wbLa/PFFpNfclOf771KfA0IhZqcfedvu4ViSpwyRK4lmWnV1ISsUd6456O6D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLMobxKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLMobxKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E531F000E9;
	Wed,  2 Sep 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344737;
	bh=LU9mnnATmFmz33p4Rn/kqi1Z83OinK8HAKpwhVZ9w6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oLMobxKehFsTtuFNc18cuD0TFD9IxIOoRZQSzH+I+CsLedgf86Fxo4LIJTZ6DQ+8a
	 bcsUnPbi5HXqBdsILbJEWiuZ1SA4oAudKFT97gw0Wims/MZPmhNswBh0DYSDTxT3aM
	 rS8owgPb6ODQ+ncRKL3OdSdUdXRy2roKlhqDwO4EE0dRQEW4DoBnmauVKkPECrmUoG
	 YlvQMM92Q81x4w1vyoAw38kExumuCFCpAMx1TJF4wh1PuRr5aNhpu58nJaTM8lS2vW
	 WQ13uEPvFJy+vAEtNI1+CuPtmSN1W02h9uzNozHyAElKtESNRszMiEiRNApwHUHyt0
	 4Nb1e+5Ayewag==
Date: Wed, 2 Sep 2026 11:25:32 +0100
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
Message-ID: <20260902102532.GQ2943942@google.com>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-devourer-pushover-f26c72688255@spud>

On Tue, 01 Sep 2026, Conor Dooley wrote:

> On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> > 
> > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > years) check_dtbs warnings:
> >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Previous try drop dlg,da9052 at
> > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > 
> > but Krzy have concern about compablity.
> > 
> > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> > 
> > Conor prefer update old dts.
> 
> I don't think these devices are actually compatible, so this fallback
> would be wrong.
> The data comes from the match data, be that spi or i2c, and there's
> explicitly different behaviour for the da9052 and da9053aa.
> I doubt the legacy platform ever worked properly, and this is what should
> have been explained in the PR that Krzysztof denied not just blindly
> citing a dtbs_check problem.
> 
> Nacked-by: Conor Dooley <conor.dooley@microchip.com>

At first glance this looks like an Acked-by.

IMHO, this is going to cause issues - please rethink this.

-- 
Lee Jones
