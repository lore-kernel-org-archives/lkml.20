Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262819;
	b=TFqttRSIg4ujc2cgcQJIWLReeTcfHWqpudmrKVyvprMdHCI7gaaf90Uo48qSj+OpV/JH
	 0erIJnCDju2U7Snc6N+zWBTgOC4ruX6JG66lIMKVx3iV7XcDPM7djZAf/iAOtn8u9hLfz
	 ppCp1brmPm9M8nucsgfIQCeBcmkd60jjWokQbRLU087QOT1u4CibbL/DFNUon1bRKnU+K
	 D5M+ewBLmHKXEg3RM9IzywSK5I732ZvLr/x2vz1wiUV4i4CtTEgpwHx4D3Q/TlSJwws6I
	 45Ny6sFCXAGCDFvx4UQH9wDeENSK339RnTGIimgagsI6VBaKBX1n3J6t8u4wuUJysew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262819;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=A5PJVAbWpxbZoD5wzRR3B/q33/96P8Z7eWKDkrRAWug=;
	b=4qFez1bp3L9GbzjKe9PLNHAIe1xdyk6+9O0sdCvSmd2O+8w5RdJpGlQFrODDoi3/Xgnq
	 1i+SvgBiLU1JMp0WtuznKeWVfrFTn2LeM/ycp2CgnE5iZD9lpmkVKn3UiPZZLN+vtzTjA
	 H47WDYpmAko4jkoQd54Pol3KFbhPNToSS/eXMDIx+G0m0juJbDaC+/Qpek2WnsWLH+gRo
	 KJ1cNj68sT2HxDV+XQKGJ8fuhVIVV+OLfVWDRTnZzBC09xb+ZEZMqbCdzc+Zvm0pzJ82o
	 wMA+tJCG5FD5qzQcuPZPNCqH0xl8wL7ov6+5iV3iMJ8kt4JiL23pPJm/9zqHOc/1wmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ilR4iNLO;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75A606A31A;
	Thu, 29 Oct 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A75A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ilR4iNLO
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1789BE;
	Thu, 29 Oct 2026 09:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793262681;
	bh=81jOwX+yqVIy7Vh/+w4HRjDXxQYCNkpXYFAZ5hraABc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ilR4iNLO43M2xWL/zCKetRrMn9gK5lLL9JcOnc1gc9V6febV3r/lUWedUb3vsC98g
	 LS/p/eHs42Jd1DwB2eUyF+vq/WQuNci8Dd1Wz+Tcm7H/TRCcW3Xu/b2WzjvVS6S6qA
	 tLVNUoX2VdIlgfWqvRNXbXvCrvV+V1oFlZkJMVcY=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261029050002.3880-3-lachlan.michael@sony.com>
References: <20261029050002.3880-1-lachlan.michael@sony.com> <20261029050002.3880-3-lachlan.michael@sony.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add Sony IMX908 image sensor driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org, Lachlan Michael <lachlan.michael@sony.com>
To: Lachlan Michael <lachlan.michael@sony.com>, devicetree@vger.kernel.org, hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com
Date: Thu, 29 Oct 2026 14:03:28 +0530
Message-ID: <179326280897.506110.417578504765133305@freya>
User-Agent: alot/0.13.dev39+gd90228221

Hi Lachlan,

Thank you for the patch.

Quoting Lachlan Michael (2026-10-29 10:30:02)
> The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> output interface. The driver supports RAW10 and RAW12 output formats,
> exposure and analogue gain controls, image flipping, blanking controls
> and test pattern generation.
>=20
> HDR modes and RAW16 output are not currently supported.
>=20
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
> Changes in v6:
> - Simplify runtime PM handling by removing the CONFIG_PM conditionals.
> - Rework probe power sequencing to power the sensor explicitly before
>   identification and enable runtime PM after initialization.
> - Parse the firmware node earlier in probe, before hardware resource
>   acquisition and sensor initialization.
> - Minor whitespace cleanups.

[...]

Thanks,
  Jai
