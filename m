Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585465;
	b=cqSv1jkZ4wD1NPGZdey8PRx6MfLokgm8WpPxYbT23/oIYFHh96tRkhcWM5V8Bq/QP0vP
	 gLAFEv7/rh9NGjorj+HqHewlCfvLWQvzywE4+GbbyWSa+dR6RZ+z2K1hBc2n+dlLYTGWM
	 EuJ2Jo2G7i9npWwLZf/a/PJk3/Y4fKw/u3Vpao6bLfKIi+3EwYS07C1fKxn0ywBWnpcz6
	 eVPvo6T5nKU4d9c40Fu71ziemHy/Q0p1H//NalKqqHK0ySjTbiRn7lgTFvGq/fQB6zH+V
	 S89X2tLczmuJoqbKeInW+FWkszLzIbMtNqXBA06v3IDxdO4los9ja+1vACXmSAwI8Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585465;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=VaPpZ3Rt98E7h75q++z8E+71a5u3xAMC7O0TzKPtW5c=;
	b=PGqOs+/qdO1NcFvDsKpOznSYRQHoCUYVcnqyhKSlPpjaXmZCcIZnOLV/5riYyKFCoy8R
	 NGpOgJRlaGH9CvaYNsKSF5+gorOn+cKr1BrTGB3nvWw6YUuEaifcXPz61fEDphdbhhSVY
	 meVXHHQZJrd8PjXBsnrZoDb2y4dzizH4HPa18/R15z/nJjfHjZphPBUSGEmKC8uIxgQVD
	 2F6kb3vS0EhL42gVuq3Ovaw6rPvUYNqhWOuQP3l2MyT5otzKbsSq18RNIz74Pf19XNtJE
	 s21i+aA++ZV18GDbZfkb+fCA7vmefsZ+OeY6LIOGLSZp8OjlthVp0LFgWe30iGbQqkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WxVWdYHa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aS9AvhbY;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76452606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76452606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WxVWdYHa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aS9AvhbY
Date: Wed, 21 Oct 2026 14:24:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792585462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaPpZ3Rt98E7h75q++z8E+71a5u3xAMC7O0TzKPtW5c=;
	b=WxVWdYHaXK7nCdcwvIdOPKJeoxq/of17BtmnBktwT9IKTR3EuKZt1z+vAWayGCcTgtxCw3
	SaGrMnxEbYQZabd3tRBFhir+EIPm9ZHBojmgoaERkh6xSlZwPYg1eG97aE/L6GO+cJcRZK
	yc4AIpL/GCDbtUXAvR2trzH4ivtuCM1rgA/TVgCEpap/qeQl+PX1D97zD+M/E6C3BMflPM
	HwO1M8LF+wu6ZEw9ldZ1uyM2v+otRLm4xt4G9ym2em8ZDsw/x82HG70hVbGoD+Kn7JpLGt
	B4ETjcoOBRVU2SkjxlhWhWhdEPn0KLQu58tFMMwkfoZ6PqwCg+MezDq6uv9o3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792585462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VaPpZ3Rt98E7h75q++z8E+71a5u3xAMC7O0TzKPtW5c=;
	b=aS9AvhbYUkB+Rs+lKYXm/GhWBoD2Ui73l4NeyYlG3C9zod//AbexMsC0JC93Q3pkXApHI0
	xgrQFujIc6+S8lBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: use const APIs for legacy sysfs attributes
Message-ID: <20261021142305-0144926f-ce2e-4815-bb26-0375bd4e2d67@linutronix.de>
References: <20261021-nvmem-sysfs-const-v1-1-a35251dcdef6@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261021-nvmem-sysfs-const-v1-1-a35251dcdef6@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 02:12:36PM +0200, Bartosz Golaszewski wrote:
> Replace the deprecated non-const sysfs attribute APIs with modern const
> variants.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  drivers/nvmem/core.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

(...)
