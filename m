Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BD1FDE31;
	Sat, 17 Oct 2026 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256318; cv=none; b=V3BLFrQpR25CABGo0C4+HVZIVrNhsC2WSUijAN7oe1kN09WkXHVmkhH5Tn4CmUy6TS51g7wS9W24oviaqAM5a0kTNTMZAk3Y3h0cDu/UMJobF1FaVq0EZjAJJjGl3jAwAHoo/1IJEALkFTZpv9PuOcnOtAwVBvEeJGr8ptCQucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256318; c=relaxed/simple;
	bh=tVmUaVOE5v7MAhDgKcrSukmavcw3RTQKVRQiYMIL3eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7weGFzIL5ZDZ4mIuoVWwUmbINj62evvLAavDqku3xLWiZhwghuIraT/zvVfWF+jENy16WthWsJk3RQnCBcnfI4V2IwCKeXarmPKgtM9PU1EvoAz/AJgYeOM3kK1Vsw+wHRoC4uP5HGf4d33LhQzy+qAxR/MCOsrrhKEkhsMClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aL3HoZs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aL3HoZs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5741F000C5;
	Sat, 17 Oct 2026 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256317;
	bh=fqLU/VDlfk8gZlwMtT/68MbOg2t/gc5wVMYh1Jov1KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aL3HoZs4gB691KbrXzYEfXsAkh/asHQqju7/PejvosK/o4TZ5RFmGz4txOJRyXRWq
	 lTAMvsRXEEhuliwJzZO2aArCMevdJ/eQXZndMNV66yBtAKLDwW7yb2TuiaqaOt2WwJ
	 kbEDXNRs1yZj7cR+s7rcwxE8tfHL+QXJiwpb25QzrVq/MQ6MX4SZsKCwpxyRJmN6NW
	 GNxtGe1xuLWmhiD1PQGleGYfDaxADDsUY+kivDLpBb9g7lyOMy65OKn8yAUpss35ff
	 Aj2flIhvTCHYugrBhyUEUFGY70yHTIVN5/Cw1LoSpRuSXYvu01nLMJ+/44SqFB1kkp
	 Ld3XlKlhaEIOw==
Date: Sat, 17 Oct 2026 18:58:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Neacsu <geocausa@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sergey Lebedev <lsa.uz@pm.me>, German Pablo Lindo <germanpapulindez@gmail.com>, 
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Message-ID: <20261017-amphibian-salmon-of-force-ad154a@quoll>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
 <20261015-ov13858-x1e-v1-1-acdd918f4fb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-ov13858-x1e-v1-1-acdd918f4fb6@gmail.com>

On Thu, Oct 15, 2026 at 10:48:19PM +0100, George Neacsu wrote:
> The OV13858 is a 13 megapixel sensor with a four-lane MIPI CSI-2 D-PHY
> output. So far its driver has only been probed through ACPI. The
> Microsoft Surface Pro 11 with a Snapdragon X Elite uses it as the rear
> camera, and that machine describes it in the device tree.
> 
> The supplies are the three the driver takes, and the reset GPIO drives
> the XSHUTDN pad.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  .../bindings/media/i2c/ovti,ov13858.yaml           | 113 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 114 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

