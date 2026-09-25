Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813C2D7BF;
	Fri, 25 Sep 2026 01:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300462; cv=none; b=rmRE0VThz0TChtsoHMRRtoL3d+UyT/IyqMSpg+pBuPEKHVNEvPEq2nyvkJYRAaJtf+uL+1WY4bUuKsWL/lOqvhYuGDcimis2MWJ11mZMXm1PfNyk5VK/AyLp3e96gZ5wQR5Gd68twadfwG+8evcnIxeEKnME2loAoLAUyCGA1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300462; c=relaxed/simple;
	bh=bZoFXJpgoRgGQNvSKf0ijTE/N4HzXJeuHZmHAfENcOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNBsKYicoht4TFdwIEKSIZ4bEo5ha+Z0cPreBvcTZytn4LWQ18BnOxHXO2XIAtqJdxl6XwA+uEGXvRYpSsU5gZgaiz+6p2x99J6FnKrxTDu7ABDhiat7SD9SfcvRLpCYHX+GPSJMRM+tnE0LVf/UffOHdO7qMREmzb711tiaMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLIfwRcX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLIfwRcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4D51F000FF;
	Fri, 25 Sep 2026 01:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790300461;
	bh=GJeClNQ/HxgW3QMumsNwq8ksWlWoAADkykp1gvHRHGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QLIfwRcXFGc0+eINozMR3Zuhi/v5tkAUXoqt87FI1mua2DJZ0L6OUUqi962S7dZTh
	 YDbb+kck/CJ6uu3933V4BSmUhdyTp/WY8HhnE078J8LF9C9u2OX6QJwXRxhf1YGrwe
	 n9z/6yVZ3MNNOdApUBeX1Ow/S2LD531UEuKvX5cJh1owjFuu8/wc3UQheJDdx81wYx
	 zjMi9aYqvYyr/7O5iWDou8Ih5kS+Avwppe0W41iZMPpOnV4omJQrRaNOS1ZQGAfnS3
	 E94HNrix6RQbJ23j8Fp4NPn8HSUJea/4+BuAf4iybGey2jeUWHjwyjqDgvtxN9+yhc
	 y763T6P9MIjcg==
Date: Thu, 24 Sep 2026 20:40:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: mfd@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25798
Message-ID: <179030045894.2800875.4900983115442640469.robh@kernel.org>
References: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>


On Thu, 17 Sep 2026 16:44:39 +0400, Alexey Charkov wrote:
> TI has unpublished the BQ25792 charger variant and pulled its docs from
> their website.
> 
> BQ25798 is a pin and register compatible replacement, which also adds MPPT
> tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
> backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
> BQ25798 - all of them reserved on BQ25792).
> 
> Expand the existing binding to include BQ25798 with a fallback compatible
> to BQ25792.
> 
> Link: https://www.ti.com/product/BQ25798
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Changes in v2:
> - Fixed the conditional to ensure the constraints are applied to ti,bq25798 (Sashiko)
> - Link to v1: https://patch.msgid.link/20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net
> 
> To: Lee Jones <lee@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Chris Morgan <macromorgan@hotmail.com>
> Cc: mfd@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

