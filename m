Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1553CA8F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652334; cv=none; b=CfPxw0Sp1+hHDOxE31rVeYi+wNXxNEneNvT4b2IEPyqjolTJYj8XiXULyTGwfF7TPmkShdRg6kXo55mKIkYjEQ7RpqGYkjO+Lt2+UJxDP+d8it/aRM75MPyRt3qGbGWVe1UQoGE/K4fJFH1Y4XmJwLZ/kCkbtGhqQfdCtDYXB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652334; c=relaxed/simple;
	bh=6LM0tRxIx+t5YerwfG22b7MF1vCTnvahc03jd9dk4Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyM/Paru9fXoJZ3iWOmoJfsLkNsDd8hMoLxL2Rf+WVWtAdBF82zWYF3OOyFqVByQqAFqSFVoOi5zdcXLkTJBM8ahrN/hkRnOlX0BMOytsLh9R9vJrg1gltjHihUvdSkjrcxpWZO3VBrjWaqEz17cHLE/CUJdQerEuyDVVAGgjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d5bQJf8y; arc=none smtp.client-ip=91.218.175.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d5bQJf8y"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6LM0tRxIx+t5YerwfG22b7MF1vCTnvahc03jd9dk4Ew=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789652319; v=1; x=1790257119;
 b=d5bQJf8yxml0lli2MJFk3ewyXZG0lvpa9PKhr7LRDQPmSMA3Y4bprjUGjkGeKnPaDjfoZ8ZW
 3VjxS9dXZtzQe2bnLVU5h3IaZy91FL9NrlX22xxSiufrH+3HdCmAPhjYwmCzeQw8rc2VeXpqZvM
 YXYLo8IoHNNUGbZ00zJhAXUA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c02e8d635a10c1e4;
	Thu, 17 Sep 2026 13:38:39 +0000
X-Mizu-Trace-ID: c02e8d635a10c1e4
X-Migadu-Flow: FLOW_OUT
Date: Thu, 17 Sep 2026 15:38:33 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Martina Krasteva <martinax.krasteva@intel.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] media: i2c: ov9282: fix line time and exposure
 time calculation
Message-ID: <aqvrESE161rLiFHs@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <WBrW1cL2KYmGs9MJYUwvKwoGbzc8ybtUpuNiR3bortL_SdxmbyUjD-a-Gaz9U6CTbbztyGgQmN9up9-JDTpJqA==@protonmail.internalid>
 <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
 <c439cc8c-8da2-4a07-8815-e4eb370de17c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c439cc8c-8da2-4a07-8815-e4eb370de17c@kernel.org>

Hi Bryan,

thanks for your feedback!

On Thu, Sep 17, 2026 at 11:51:46AM +0100, Bryan O'Donoghue wrote:
> On 14/09/2026 20:20, Richard Leitner wrote:
> >   The right
> > clock is PLL2's system clock. With the PLL2 dividers left at their reset
> > values the chain
> 
> I think this statement could use some more justification for the commit log.

Which part do you mean? That "PLL2's system clock" is the right clock?
Or the "dividers left at their reset values"?
Or both? :-)

> 
> PLL2 is stated in the data-sheet ?

Yes, PLL2 and its clock dividers are described in the datasheet (similar
to the formular shown in the commit message).

The fact that "PLL2's system clock" is the right for this, i.e. proof that
OV9282_REG_TIMING_HTS is counted in increments of it is according to my
research not available in the datasheet.

> 
> Either way
> 
> Fixes:
> Cc: stable@vger.kernel.org

As this whole series basically fixes things, would it be acceptable to add
the Cc for all patches?

> 
> ---
> bod

regards;rl
