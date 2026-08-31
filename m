Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B2B25771
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164031; cv=none; b=CPbaaDStM6W2N+/ggyXPXj8C1nE6KgcU0honPPUwybOyFyVdjvlsTQcUEAt2iaosnRvLdrXkl2Km4lwzneoap+iCOeXT0OffgQALlfLotBO4r6HQ8TFCFekAaOHg3A6hJGXS1Qwj+ssjFaZtf8BCK2eSc/AZiOAABLZBFvM8DCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164031; c=relaxed/simple;
	bh=pZe/tkBo7AVg/nWLPKTCi9tMSARHqWFLj/O31WOcVRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaGRdBlZ1C7pXjS+CTe+sybHMc4fXHWEwzB14jPx8aqA3ZheuM7s3H3S+/8qcE6n42Z6AYAeevhz7woNaqAaxCoGZ/08yPbSKCV1rjwG1AK2uN6Z5pEv6yGNLexriTmS89z96XLS3wBSAbe4ZM0/EHbUU78XdiKJE4s9apU7UrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gLohn+ZB; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gLohn+ZB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pZe/tkBo7AVg/nWLPKTCi9tMSARHqWFLj/O31WOcVRw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788164028; v=1; x=1788768828;
 b=gLohn+ZBMnVExZRiFpmWamwEvigmsEau5puWwhc0gbk1Hz0R4Ng50/jnv0I7DklXNj8I8s3V
 quN/uqOnruVU4XCkKH5ARplHD/WaHezWvaIfcc+s8/EH4B8s5eAtp3GxLg3TONKXt4YBeBC66Ug
 8YsjJ+6xYGE55nORKYOS9fig=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 30540ebc6273e7ef;
	Mon, 31 Aug 2026 08:13:48 +0000
X-Mizu-Trace-ID: 30540ebc6273e7ef
X-Migadu-Flow: FLOW_OUT
Date: Mon, 31 Aug 2026 10:13:42 +0200
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	David Huang <d-huang@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] media: imagination: Fix value clamping in
 calculate_qp_tables()
Message-ID: <apU3tgw67BSgUrPe@linux.dev>
References: <20260727094729.408762-2-thorsten.blum@linux.dev>
 <178514849109.506511.14905916758246243206@freya>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178514849109.506511.14905916758246243206@freya>

On Mon, Jul 27, 2026 at 04:04:51PM +0530, Jai Luthra wrote:
> Quoting Thorsten Blum (2026-07-27 15:17:30)
> > The local variable val was never clamped to 1 or 255 because the return
> > value of clamp() was not used. Fix this by assigning the clamped value
> > back to val.
> > 
> > Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driver")
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thank you for the review.

Could someone please pick this up?

Thanks,
Thorsten
