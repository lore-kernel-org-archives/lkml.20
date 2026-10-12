Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413543E5ED1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813028; cv=none; b=rgVBkZp83tuJ73trlMdRHk09vFWNTqfsfWtvSx56XknPDzA+JawaoOY0dRsPE1niqg9UQNV6tAbS3evJUy2df1I8SA++6u2f826NlrAlKT30K5oi47n6bCFc+/zf50zkecKbArJK4LhRFfjQmI5acSOAFRWgdFc2WM3OH2DuoAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813028; c=relaxed/simple;
	bh=AOaJHzkVSqUbswf92A6xGyprhL7vg46+nlQdZPHjJRg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2fSKX3lOGwBCgfUOTUja0dVfjnpvelcCi9njoVW8bAcToHyHKvmHX/RPXzjJbB6+GvqrkJIhJ/pNsYX5AOQN2zBAxkktFyn8iDHiAWwDoAPgPSgWLWyposp+Mk0PFWTwH4ZmiH2llIoRKQ8Gvop7EsftTYo+ghdXKLoKtQokYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz0QyIzX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz0QyIzX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c02782159so1152226f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813025; x=1792417825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zE6VoN+PiWAA9KAYU57i+n0fCcZ23h1hk73tpEWp1XQ=;
        b=Jz0QyIzXS6SOTx4hk1NekRhn8qhOepd9UyGB4Vg+zYY+4ufxsVw2viqS3KebXUD+NX
         jigTDkHE7NdJzugKAXUqtSw5+ObIu3Ok1KdVySagZnN6Upb3OHpdDv8QxKEtYAWoz4j1
         kMcBJS9wkFNbYADLxk9V8Vj4bSL8+iKr5v5XLR2oUAZbO0oN9q8KDXxbH58plTFNVrdn
         bROvq9sDJPPwXP5zfPwvSlrgyJFlmpcUvE0eNDLhZYJ9YZTdajV2Ngx12oT4tgvhw03N
         uzuGNTp3cbhZCjVJpBv1KSyFFaFE8zwpCmVObVVVt3wB346fI6s7IZfNaevagsgLjtRL
         MA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813025; x=1792417825;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zE6VoN+PiWAA9KAYU57i+n0fCcZ23h1hk73tpEWp1XQ=;
        b=QonfS0JsjEeIEZThVZilrKJAxGirlbU7umXFvXG9hjN1ZdU3/MBeiPMnL4q9IStDI9
         sGBivgsnk9XgywlljoP4+BzeW2vZohRpaLyw0hV22//uom16yq5T6Lqm/sXd4c2ny4c6
         ItfQNrkwdVjj4agLkMhSMcS8bJ4OL1B3jkIlzC4LAftPy88gb1cz94J6HCdsmg8D4z7D
         px1OlNrqgh4CNxXTncwoUaxZvoHdwiJx7vgEFX6th4/0lbxTrdYKb0rOGc8p3NuWCDrD
         lOIlMUI9opBcgwCi8PY3eaj6pawDtxfS/v5bjW65tvJEs5HFQn+WSXIA783pb0svVY9C
         8WgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/AP0h8aG/ZtVsehKRI7/o9MozN9I7913uCH5uyQvtwKaV0mmbTEeSIxIiH0iq7ExCGlPgZlQHxjxfT1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQeJYBVAqhTRqLTiKnL63srqMtZyummsDGYQXX4ZUwWfZxm+Nw
	8rnZfbeCExm3CfGGJcr42DJWKFVzV/f+8X11L4f6aDBgxpIh/tOFKmo5
X-Gm-Gg: AYBFou1N6+FKQ7i0kea/dzyIb+lG/kPM15mIZbkn3dE+0Web+3MZf7xxKARdTDc6WUf
	jOpkGbmbTZoGjg3oSidhM8ufYSGOLEsGxbnj68nFEJFbgOu9V4mo2uOEYLlIgwQlYQSONxk2kVg
	ZSPc3Ylp4VTGqeuBhiZDXjuY2YG2n1CvwJw84ncpxTbAQM6mtXd1QztObyRgqH/0C3U2foQnF0N
	CP0b3IgfZvuKW8okUPsny/Nq+3QFmxMYshjdZ708ILPNXzxApLDm1WrNQJ9Gj8JTyi1onUY3XMc
	uREpFXxH1ygy6p+3S3KVRYVEwd5nMMriiN7awAXD4GFUyuRoP6FSPPBiqH9yv2532j0H8k/8mV2
	L35CGkEU7MFdSggSoa2qumb6RB5CDBgMmwo9FqekQGKPza3weOnxkZ7RZ5BUOVwmQwsJHrmK/8e
	I7VGgH0P1EsSSxiY8Y/qQHC1pXINnBIpLlLPIgsS0WLr5v7VZrwa2w/vrQ5yy+lMPwtaRi8om4k
	sPCfwQ5BKDJrpTO9cMA/m2Tto0hDOD9IAytRJYlzDboPaKbFV2eLlZ0EuQgZNNbzlruqQ5mwXio
	H3P/qWUy66G7LXgXKUtKJ2VDOB5N8Z+vzM7uQHvHIQh16YX1FcJXpqfMH4sYUqUYD/mQ09Qcnc8
	Txhvgs9S/rCkN6vIkr7ByAFF7m5VXuYvpvx/TBpnTItZ7DhVHNtJO+PLtl8lqjh3cifrkRFc4e/
	3WAB1e
X-Received: by 2002:a05:600c:8b28:b0:49f:ff7b:f056 with SMTP id 5b1f17b1804b1-4a18e4a3c24mr158578585e9.9.1791813025261;
        Mon, 12 Oct 2026 06:50:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm166741385e9.3.2026.10.12.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:50:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:50:22 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Radu Sabau <radu.sabau@analog.com>, Janani
 Sunil <janani.sunil@analog.com>, Salih Erim <salih.erim@amd.com>, Jishnu
 Prakash <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 3/4] iio: adc: ade9000: add support for ADE9039
Message-ID: <20261012155022.00000412@gmail.com>
In-Reply-To: <20261012111342.48040-4-antoniu.miclaus@analog.com>
References: <20261012111342.48040-1-antoniu.miclaus@analog.com>
	<20261012111342.48040-4-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:13:39 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> The ADE9039 is a polyphase energy metering device that is register
> compatible with the ADE9000 for every register the driver touches. The
> differences relevant to the driver are that it shares the full-scale codes
> of the ADE9078 rather than those of the ADE9000, and that it has no total
> reactive power register: the register map has no AVAR at 0x211 and no
> AVAROS at 0x010, only the fundamental AFVAR and AFVAROS.
> 
> Add a chip_info for it and a channel table that keeps the dip/swell events
> of the ADE9000 but drops the three total reactive power channels. The
> fundamental reactive energy channels are unaffected, as AFVARHR is present.
> 
> No change is needed in the CALIBBIAS path: with no channel carrying the
> AVAR address, that case is simply never reached for this part.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
