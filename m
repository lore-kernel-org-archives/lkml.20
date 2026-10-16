Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D5443E4D;
	Fri, 16 Oct 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159338; cv=none; b=QrKtdpdPrBCRoYULDcT4jiID4BfakGw+2k9f1Q+YqaVjHRCmvH6XX5Rlmh4qP/Rl3n0R5PnYSqtPbKeZx+Jwo/SaWz5Azby0JknaxaPm2KRpXoQ8JDqMWr6WA2+qJqSonNUlUtzwpDZCM4VRhRAqg/Ge/DYK7WArdOhc2klDdeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159338; c=relaxed/simple;
	bh=Y2FvQqA3wwrRaxn3EfZL9zih7In1RVi6SgvLO/tGnJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhNE0kLLsVriQSU4P3tzQyYUePtY9PGObZ13lxmUFZEDLshB2DxHQWfkXHQOSnAb7VJV/jF8yT8KRqTltFy5GYuorVP/V7AnSGbA0Hxqo46pakYw0PaFQjk/gOJ6YyXeeTwR3yup2+kwuS6eqHAoYgRkrHPBWBQuSi7J5enlvNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNbGzMVn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNbGzMVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841E81F000C4;
	Fri, 16 Oct 2026 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792159335;
	bh=wt98Iyc+xABbKJ0Bzasr4VsNU3ZKhSv2Zzu0IHfU79k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNbGzMVnccpzhw47i9+6W2bX6Iu+ftPzipjZIw/iVUk3B+riOGhh8g976lrlQcQOX
	 bmzzZXPjsjmi1mzgtkrwhVN6SJA0xM983oV/J77LjQXk58Sn7lAHKiTv+9yO90fNig
	 Rp/t9nQppRfwoLP/2BT7JJTBBBkSiqqJ7qsONhDcz356Geb05OvdT4UTDp75n/TsTL
	 k6DvghleAlWH1KI145IiCfuP+AsEskO+IpViR5MGoWFut6jI5zS9rC8prrygs+0eYk
	 BnW4TgFWTzoD4tWdbEnAnKHKNQhzqyUqaYKIB2z4XtvY99n8xx630aHBrIN943r0RJ
	 ey0cBsLxusAFg==
Date: Fri, 16 Oct 2026 09:02:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] media: dt-bindings: convert ovti,ov2659.txt to
 yaml format
Message-ID: <179215933428.1834569.4816794894448499575.robh@kernel.org>
References: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015194142.3488169-1-Frank.Li@oss.nxp.com>


On Thu, 15 Oct 2026 15:41:38 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert the OmniVision OV2659 camera sensor binding from plain text to
> YAML schema format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Chagne in v4
> - update MAINTAINER files
> 
> change in v3
> - update subject.
> 
> change in v2
> - drop rob's review by because use new file
> - use new file ovti,2659 according to sakari's feedback
> - v1 (2025) https://lore.kernel.org/imx/aPdHqCWNdmVkch7S@valkosipuli.retiisi.eu/
> ---
>  .../bindings/media/i2c/ovti,ov2659.txt        | 47 ---------
>  .../bindings/media/i2c/ovti,ov2659.yaml       | 95 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 96 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

