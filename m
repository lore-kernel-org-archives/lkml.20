Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802436;
	b=xQqAG/EaePw4buOmhIWXrbOeNa0hlqJHKtS1BLGreJMmTb9oRjK2CVOqK9DrX3rEyHEC
	 gcgOVu0jvgicaCw/nS/Q+Ev5LBZCgcRlWwvfLdGEl2x5DBDbRSlFSeCwxaYB0lm6ggeca
	 KTcg/ay9kp8fVetxQ/krmvj91XqjkmwLWFlDD22R7YrVquoPxc/0SIzU6Nrtm8LlMhbx5
	 jIoucl46NAjsCl+F7yKch0OXdo/dTXCDBZUNMTWBiIBRUMOSdh+rn3VISCk+Rt1+2Opb7
	 5WtfpQ85I7NAfIfW2+Ys8sL56ohNJni+fSPKVJj5GKT81YJLzR9bD55vCaNuZBBYMxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
	b=0vopoRYDFGSyVJsgdgpQNV0J/vxR1RYdoRXZ2Mi7/Tbgd/xWyscKr7vMOn38uFMXNoGL
	 tdpnrWN+JDX9HtdLNUHocmesTi3b3aXfoACG9+DQ58GcUY5UTf6NiWSfFmk9cXn7S5Xjl
	 qTqcSCPVt2Vgm5PgHwKucHD1UMMuJFgFDrE5YJPlcKGKXy7g36dIfsxH0jWahzkjiFe/v
	 5F/SvKll6NliE29PpSvXgh79PVmEDzC4a9PQyPJbdTnfxpWo3Wc0OsbXvHY/tUxsHBv9I
	 q70t/08LX6MdGDF9IrC0RtTGOlF2ZJBaxwnopb3lSCkRp/7EJiMvxWLl0E7HPqZS2MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4zuEzmb;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A62606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A62606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4zuEzmb
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso547714a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802435; x=1794407235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=E4zuEzmbrpNoZRIt/by6YbUy2w+tWTHKAEZVPbnm3JkY/QrBbHgxyoAGMqjgH3xEoy
         RLyeyfE6nsKe0uQmK7gpqT6lSbP0sIJ2XkCnPA6V5EOAJB15YDYsRruPyaE8k2qi91NT
         8ryLGSBt/n41N6BEn1gUBHpiYTT5LiZ+uZ65pAvpvTGU0Vay9csyC/FdPlr76MPrXIfD
         Nx0qfdnTQC6ghg7wq0ckNgk9hzlhZuUIHZwfW9RBl4DYV2+cUCHyKpZxLIYTBHl/cMVk
         wUtifLk4Fe6ho5REiWAiX71wsmLDA91v1iNM1ADkvXciFrAXc/tUfClyOU7FwKyHAAH9
         d0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802435; x=1794407235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=CtxDXoTITlLjPI/rcsRoKXIn8Uzbk6TC3GGRQRZ23HH7ngpQEyNKCIk0xqkh9iydIS
         sKQ00goUpmxT8vt35ihZG1BuG3lRQfJhOkCpgl0RjFUISYv4wZ0ohI3kKP2jlVKFQYDq
         01WiFvn3w6w9efS1gGPDVZKsZeVM4NhEQFuTKEa209PCmUpNMqfvVihPCOJwn18h0kAI
         ZJJ97CR7hbUgDYgkh2ngcaTjuqMuri/9D66ZLnw+S6XJSU8+asAb6XG66wwT0nIQGBZe
         wsgg/nAGHhChnVqDGwT0bkcebVoBZHgX3mOa9umcyZGmVw45uAFsOYVhIDufqF8NrD/g
         inWg==
X-Forwarded-Encrypted: i=1; AKwUvByImJkvNyshNZ6xq5rN3MT4gVU5DJ84eT/CanroRxH5HQKeb+sgERHG0GNX+fqEj9M6MLA2GNH8sbzMPSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3hLiPocZtzhlQ+vW4AqLZ4Db88Kov6x9tGS2o/4BhMS5HvA8w
	j1FSU4JtslAmVCnMJLhVHW0nhtOHpehHdYKdOLiM1Z0d9kJkr8Tufi8Q
X-Gm-Gg: AYBFou3+8VJ0oqQUm/mDwVVOAowGYWUGytkLLJmwuXtiRR4wgBJGzAY4j89/8p0i/l3
	pYFNsaxmlZfgQ3sTwC/z93Ct4ldUmRvnVqqJUyWKYmOvgcBFqQjnyL+mtN7bW73wxi0EMPkh6yz
	Ew8Xyv1KsgoWeZe87ZoXYgyVURjT/12stxL32dM5dwinSTJhi+8lVWCcOT8kwMUCNPOcmtOnRwk
	iuixAKSBRB3qhaTvyx0yrGbR33sk+hjaYpKgJhJZRCXddQhMv+5FOFBa9mONSCELm+zWjbpLyED
	vNGILs7qOnUSZhu73dZnQXdIXst3ymhOssdlWk4jbsDFyeKZUvE5HfWvL7KKBQaLeK1zyY2nHoY
	incvJT0pdbM5ayHQ2TdNShqH+Qzy7acvOtSljXzPXXFrwHX1MeArpOE8SG6QvP7oBtTwmPyKd/g
	aMOKkJFP2zxPmsV1sHosC40wxygoemSZLI91sO2tVJDiTTZb8Fkorj7n9qnB7aLKngwPnBOqc/t
	PfmzxI/FHcs0juCUFrE5gfI+y6VZsgLx8khRUItb2bw5jwasA9NXP0S5xfxWxeBC8QZWsPUeeM3
	MmkPeFA/jQJ/prAsONl9XcJ2y+ySmFLrqtZ0NaXNLlBE5MYaUYLgfno=
X-Received: by 2002:a17:90b:5686:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ae89724af0mr13599917a91.15.1793802435021;
        Wed, 04 Nov 2026 06:27:15 -0800 (PST)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5aa69fsm9656842a91.2.2026.11.04.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:27:14 -0800 (PST)
Date: Wed, 4 Nov 2026 11:27:04 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, francesco.dolcini@toradex.com, leonardo.costa@toradex.com, 
	hvilleneuve@dimonoff.com, marex@nabladev.com, stefano.r@variscite.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI
 Cameras
Message-ID: <5tszst7u72cqju6uk2yxtrdexgmpmqf7bkihnno2753xqgbdb7@modjp5vm3wlh>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-8-leoreis.costa@gmail.com>
 <ar6Ij7KJEPbIa2uT@SMW015318>
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
In-Reply-To: <ar6Ij7KJEPbIa2uT@SMW015318>

Hi Frank,

On Thu, Oct 01, 2026 at 11:21:35AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 12:52:57PM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
> > iMX6 CSI.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with
> > a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
> > legacy camera module.
> >
> > Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
> > external component that does not exist at the SoM level. The camera
> > modules have their own on-board oscillator, so the sensor xclk is now
> > described as a fixed clock instead of the SoC CLKO2 output.
> >
> > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > Board V1.2 device tree to provide a ready-to-use DTB.
> >
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
> >  .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
> 
> Please use nexus connector to share one ov5460 for all boards.
> 
> https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/
> 
> Frank

Hi Frank,

At the moment we don't have plans to add other overlays for this camera
on Apalis iMX6, so there's no need for nexus connectors in this case.

Leonardo
