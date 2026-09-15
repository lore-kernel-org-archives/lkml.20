Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D1385D99;
	Tue, 15 Sep 2026 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470848; cv=none; b=K+6ImMeAbgZERpUddN50D0EzeWTpWjKcGm7Bj2yh3bL/QxxTlWd4PVA/O5Hg8OdBnAzU3kkYIpDc55uRQW1txYhqCFqsU6HGfZmOe2U+SPHiQ9ZtrjNMut4fLuV1qK9ybyLxMu6OkdqxJRpa56CYLHv+JjtxwJ/boAUpiB3NZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470848; c=relaxed/simple;
	bh=zZekLw5RMVyQsoxrQU2mJkIt4cG75S/ulXfEuGwz8X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlBI8aP4dp8WhuwGml1qwGQpiKf2Gh6MAguSy14C4PtlcmCr0YQ82awwIv7h2WoBtpYj/HxnMVmwKxICvow1AoxsJF+kNriJfvy8GRVJTvo3P2Q5e54Ku36CudnxiU8xypE1jte5xY29X+wI0XY4fRfINDpNwfcZC1xLypMLO4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPIpuyQr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPIpuyQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530F31F00899;
	Tue, 15 Sep 2026 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470847;
	bh=HLagQFQZOyEmaZUWnZfwJED805o1ysF8ciaZJE3W+Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NPIpuyQrSy7s3haa/uTKou3xO0PdgTpAZXLXx2QJ6mrAyTNjNPCkJZbC/fbYK7ViK
	 NHlWGIeEFc+e2v2hPm9IdLId37dKNqX18mNA/aRwOMrepWDtCnMr+yoRsWxD0qdQum
	 PAKa0oHowZvQjNseJ7oexQ7vCIuGFe5Q3kNjL3KqsZmJM2JAnq8Y6xXDAP8fFExVXD
	 1VIqtkv/mVJNTpdeZxPxrwCTroIOc8TBenqTjeGkNtnDWl2ATNJlgD4MzxJnSc12E7
	 TEfgCppNOCabcaDhOgc5/1T5RFmGrT5ytPDR4IiJK0bYv38Qbs6MxegTOW6+ewsYep
	 nuRgswHziZL6Q==
Date: Tue, 15 Sep 2026 12:14:01 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260915111401.GD11487@google.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-5-lakshay.piplani@nxp.com>
 <AS4PR04MB93625052401AF41C2ACC2D66FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS4PR04MB93625052401AF41C2ACC2D66FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>

On Fri, 11 Sep 2026, Lakshay Piplani wrote:

> 
> NXP Public
> > -----Original Message-----
> > From: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Sent: Thursday, September 3, 2026 11:51 AM
> > To: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> > alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> > conor+dt@kernel.org; devicetree@vger.kernel.org; broonie@kernel.org;
> > lee@kernel.org; Frank Li <frank.li@nxp.com>; lgirdwood@gmail.com
> > Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> > <priyanka.jain@nxp.com>; Aman Kumar Pandey
> > <aman.kumarpandey@nxp.com>; Lakshay Piplani <lakshay.piplani@nxp.com>
> > Subject: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
> > and on-die regulator
> >
> > From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> >
> > Add core MFD support for the NXP P3H2x4x
> > (P3H2440/P3H2441/P3H2840/P3H2841) family of multiport I3C hub devices.
> > These devices connect to a host via I3C/I2C/SMBus and expose multiple
> > downstream target ports.
> >
> > All variants share the same register interface. The driver reads the target-port
> > count from DEV_CAPAB and applies the DT configuration, so no per-compatible
> > driver data is required.
> >
> > Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Hi Lee,
> 
> A gentle follow-up on this MFD patch. Could you please review it when you have a chance?

Don't do that!

It was on the list, but since I handle all of my reviews in
reverse-chronological order, you just put yourself at the back of it.

-- 
Lee Jones
