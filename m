Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D924EBAD2;
	Thu, 15 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060181; cv=none; b=b7Ihw0B9uGc690/X1C+pqi5dTAmEVCeq3WRsaGTQvpsxj60hNeZn3eW+EpBISZZ7pDOpEKVlfS2CsYQzRYVwLo187rCYoqhmkofURYnInDZJo8YjVQNUOnCGSqT5nib2lwhKv2wPiRpIwGb9mnWBPZOrAyyZ9JvV83i5HI5pgnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060181; c=relaxed/simple;
	bh=QeyATWdLiVz0mBd9a7ZVEC9lSYwtg26iZTcNQXiFlQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doSA5zZyzcrvFJWgSICNxIXJkSU9ZRzsc/jWcClgxWNiUfobCIG7a7m6CSzYdT0sWsVSsPCx+j2Vph2M44mvfPUoeKGbCVFIM2PDrN988OytZmp1TFmw0+weBJ7upLuxuN0tyWB6VOFiq8P+WhLja9jjwXYcTjLO80VsEGW/5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfum/QSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfum/QSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3BF1F000C4;
	Thu, 15 Oct 2026 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060179;
	bh=nRrFwb0EQR41J75+EeSGaRwKgeprgDdMhKHn9DlEK5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cfum/QSOVzG7TvPbboCac0Faa7RwSgzQ/taWq7cGzrZldTsYSx/bId2bkBvBNT0xN
	 YMTAjHJcZp4hkt9VIuNC6O8MbU0P7D2/w7uVRMOBS6IyFuM6tYroQj3wcJxSWS5Pjb
	 PHswZWafxcy4Ver9PBHGr6LRouc2lEzFZkTLJk4jfuHRukkAAE/8sQiyyQ6Ad0z81L
	 +uSKxk0OX6IUpzreqpEj2Jc9P5MQm/SWFTOgeFibRVqIkEAcBad9mjBpEAIbVoAn2s
	 qRC6AfYzdVuXbN4sAvqTlg7JrU+7yBZ6Y0YVYegubGAG3EIeEVReg0xvvHBDOOXsFY
	 NDcED4MZPSMGQ==
Date: Thu, 15 Oct 2026 12:29:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 08/14] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Message-ID: <20261015-glorious-vole-of-pluck-10363f@quoll>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
 <20261014-media-starvis2-v3-8-c958362b5d06@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-media-starvis2-v3-8-c958362b5d06@raspberrypi.com>

On Wed, Oct 14, 2026 at 06:54:29PM +0100, Dave Stevenson wrote:
> There are multiple members of the Sony Starvis 2 image sensor family
> that have the same hardware requirements as imx678.
> Add them as options to the imx678 binding, rather than duplicating it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
>  1 file changed, 32 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

