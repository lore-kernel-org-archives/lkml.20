Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA6546EC81;
	Fri, 25 Sep 2026 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338302; cv=none; b=ACWsk9OWgPCk4Wsj40rewQZkQ9rlZt3IOS/yWKFl25vn4TeQLlA288ICePoRCQ518LkC8iZWIOYhEPgyokM+qXPhxaF13WU7XRfArT+QzVaHJ0rBHxuXk/+vDhL464VrDSEn4ZLRYr0P8nWb2rSeQHyzuhrpf0CKbsmRRyTZuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338302; c=relaxed/simple;
	bh=MXleCkNaKXHwcnVDWYtShyy7DvE91JStN6zFd97fsHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSjI1lTR0yKYt5Z/oxfGRXbKNWkhlTxdlmVscMc5lF6ZeqwlpoNF1L9p4wrB+DzMfuf0lpLVeVYBW4HMQ3DbZLCsCDwslZhQ++tm1T7UKaqDcrx5CS2q6zcoc9MdgqB+WpA0p6qe2xHmhGKc6ZgtyDMWC91ejhzKjiGd3uY0ARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKj/jJaf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKj/jJaf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A612F1F000FF;
	Fri, 25 Sep 2026 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790338299;
	bh=VCJVqIkHLvrWlGtEfrd2kDjsDLmEcvkd47HisPyps8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KKj/jJafnSm9UNeYsnuDB3ePMiIfBYhFPgtoqZRISj4qbeY+CqDAa4krXN6JwP57K
	 cNNXk0BVCxgtvYNnuTPGPciEMyX7r6TbY+YJls6gmxpN5jxaT4pb9CMcGQiDsWh/Mp
	 EixLACGbkEmQ3HVxAtMom5D8N9+2H+wkkkxD/UxN4qGXBMBegB6fDo2SuFtiUr8i68
	 vcbzzPJym0W1mBhzEz1jnQbDYdu/J4ryO4qMkQPB74M5dNgoTyvjhnXqCDS2XA4d4I
	 16Qmm2rGXfkYV96nVZ8h0ujI5sS3sLjtcxXddKs+LH4o5BhBU5hWVuqGBIJX5feJqg
	 GKyTysQltsBVw==
Date: Fri, 25 Sep 2026 07:11:38 -0500
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI
 compatible
Message-ID: <20260925121138.GB677989-robh@kernel.org>
References: <20260923191526.2206628-1-robh@kernel.org>
 <20260924140300.GE453446@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924140300.GE453446@google.com>

On Thu, Sep 24, 2026 at 03:03:00PM +0100, Lee Jones wrote:
> On Wed, 23 Sep 2026, Rob Herring (Arm) wrote:
> 
> > Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> > and matched by the Hi6421 SPMI PMIC driver.
> > 
> > Assisted-by: LLM
> > Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to DT schema")
> 
> What is this commit?  I don't see it anywhere.

Uhh, that's the wrong commit. I'd just drop it. This binding started off 
in staging. Originally the compatible was wrong, but the example was 
right. Then the example was 'fixed'. 

Rob
