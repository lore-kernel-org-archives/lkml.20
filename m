Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856452;
	b=HqMS9/fBvgTNvzke70RM7yXnxQWtXEqF8JXqTQIO/XbzGUWO9G7bPKiYkVUgwbhb9mia
	 YAYK65gTP90EM+pUXrnDgIrhctw5ijAgyJRzTogQZ2s4Q5IQrcP/gkrVU4t3p5E0bCTR6
	 BqLwLK3/gOYFce3OBtkXTsrph+U+k42lT53iGJBSskSZWztWu/YHzl4o/DTNo6xhgjn8f
	 Mi/NAMokEONfvvD+ndR+s0GVVDg0gJqIwX1lt4sm7KRCw6eroWb3MHwBxhlJiBNLqId6N
	 mqKVNPrGVk5Sxj5aVthgupat7LRAwZ+GYE8WtbgBwtVLjNq3rFGWQlJqzyxx3ve2UDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856452;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PIRitB8QDR/Lo0+xdO6xLcBPU7Le8tBzn9jvhjsONAs=;
	b=eMLy9CJnuGFSda5gMZ9sBaXYUNWK+spvUPxmhxs+hxjNDvy3G8dYlDzQmqnUPBLsLObW
	 +w03jtfBeviaBJlFPgcePpwgLuJy2EZxvaoGsB2jBM+p75RNi880O7MFQznKVSORJP6Bb
	 eamtFeu1gvnmoeCo2BztAIVlmyXGkhQIi7nAkbKgLqpcGZ0DjAwx7Xp9UbkPnq8aAWs33
	 5UOAg3fWNlqojhZaVJZU6vOGaFkIp4tHRJTwHK8exQ+0xeYFm0K04IGmW8NaiMwhP74Ze
	 tq+sC5EF3TipUxeLm4MbpXKdIfFreWexf7hSidjWYhgMcv47N4wrR9J3zA8QFqrYTvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aElhuCrL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726D0606A31B;
	Thu,  5 Nov 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aElhuCrL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDEC1F00A17;
	Thu,  5 Nov 2026 05:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793856452;
	bh=PIRitB8QDR/Lo0+xdO6xLcBPU7Le8tBzn9jvhjsONAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aElhuCrLS8NqDddUQydHEiNJYEzM9OPtl+6ROAX2zBstedveaGbexvpJbR90Gg2QU
	 6hJrDLwYqfIwx6b8sQ39yrxvg91ALuo+Y4UeWyUFLebWuO+g5tgmybuQraaaCUtlcJ
	 LGc5abnhK7BBltnfrK8czNL6MPjAZ2ehOMeRHDuyWZe4H5OaSxPU5Y0M0b+btlxD/2
	 deFABTeIEIxRGB3HkaETGirZ8QcAKT9y9V/V9IbqMi6XXlncUOG7f8r0N5s6Q18Oq9
	 JA9yvGO6x0Jkhw/VoD7T5WQek9Q5lRXA7kKqBSKOSs1r+f5v0dvByOayCZ04M2nhMd
	 N343s1MU5K05w==
Date: Thu, 5 Nov 2026 05:27:29 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	linux-kernel@vger.kernel.org, Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH] platform/chrome: wilco_ec: Fix device reference leak on
 open failure
Message-ID: <auwTwb3iKN3td-Uh@google.com>
References: <rc-review-20261103-vc-85-d1e3d35e7c31@gmail.com>
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
In-Reply-To: <rc-review-20261103-vc-85-d1e3d35e7c31@gmail.com>

On Thu, Nov 05, 2026 at 12:47:12PM +0800, Yige Jiang wrote:
> telem_open() takes a reference to dev_data->dev before allocating
> the session. If that allocation fails, it returns -ENOMEM without
> dropping the reference. Since release is not called after a failed
> open, the device data remains pinned after removal.
> 
> Drop the reference on the allocation failure path, after restoring

Moving get_device() after kzalloc_obj() succeeds makes it cleaner.

> Assisted-by: LLM

The tag is no longer used; ./scripts/checkpatch.pl --strict:
WARNING: Non-standard signature: Assisted-by:
ERROR: Unrecognized email address: 'LLM'
