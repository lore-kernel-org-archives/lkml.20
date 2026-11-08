Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111996;
	b=lCeDJUEAviDRxPsSB8nHXXMcTl1K/vUBgVPDU8jCxJpUvv0ZiYjGtZtheCli2XXATbKJ
	 dBczxuN9miJReC5xuHhE9DIkxacTVdr9MSBPQmqUkbb4O3V1sDKmrQUXZRCMcmJpwh6Cy
	 av3UujcY9TrFxQuopgg2HMCVF6ZYnMM0b96AI/GLnelTyvbZ2IX1U81jVj0rX/JK2Oa91
	 Y9Ir4X3rIbc457UUoHe6QewYpZo6+b+Jg76v8XB7xluLXII9ombOXURhw4R30bNqdlQg4
	 /7E6QfgE84i0sW4d45J3IfMS9TUU+HoGdwBLzT35xxGbxHWHRZnZQQfXJyxrERjWpBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=njyJJB6va/RqrZ7iHDzS1u9pLjUtbXjnhiE6IUdL/0g=;
	b=R62ea8fJqRrO2cmm88cbLClF41olazD8o2BNzKUap91wbYZJ0G2YV9W1o+W+M7P4wLJA
	 QZx6JTUBlKNj9gewSVrN09c6myTywHm0wlFGsa9aVe8/ZoSX52VyVUPZqhFrPfGhb7H2I
	 3EBH+tEYOe0HWPxmrU468BRx8z0mDKigt5NLY4PGj1mBy+vJf1l5hXNgpup4YiWZp5nB7
	 nW64B7tlBTJglkkgFHjFwkJvuK9p6BKBdaCxhLp1qdfeADUm8i43HDTAe+AKcAeZXMABX
	 mBUb24y+vIfIQW7ueSxqoYGOIJUjNIoWzGsFWHSRO92kOoUU0rt3tCSALlpHy3dDKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grc0VMcV;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B9606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grc0VMcV
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso442792eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794111995; x=1794716795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njyJJB6va/RqrZ7iHDzS1u9pLjUtbXjnhiE6IUdL/0g=;
        b=grc0VMcV3BVdh7jhhMbrgmrNGnHzKK6cEnqHqxstWAnN/QYUJwS5zwEhIFMRAI0sVV
         9Fw206AdgEWJmCY2ufV0R0u6UdpM0+lISrWzgFQNlb2WaGkUM7cNkA8AJN/z8TvBYw3z
         TdrCrm8TGkLzV5G8Mz74TLTag0Hd/EQAkYKqxUnmAruUUQlBX066Qe2o01oFl3XwCk8C
         vdzAiLuwiq00MBMY5TW3jDKtz9UP2u+vFWondWDSntenxoTH0trLQlea5WPFJQWZzB+6
         YYCTwJDFOxp3IRD0CMJCJ6S+55aljkGiot5N9+LY2L2GcqWCsubWXF8PXS2M+0M+Bz8n
         I1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111995; x=1794716795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njyJJB6va/RqrZ7iHDzS1u9pLjUtbXjnhiE6IUdL/0g=;
        b=N4b9CPsvItpNkD4/C0z1s6cWftHfuQpzfiLaFZngUOf/tY0nl01TwfqokaGjRAgEv1
         ZqGo8pOBKR2QMrZ8oTdMGTDyJCHFJuFbLrBXtQ3w6EIMCdAioHYwWqt6eEETGPFyy0br
         jPRaDRAu92zIMSYo5hO6xA3QuaQsyQY4J+2J+qecY8yT8NmuBb5HDXMrHhw9BmTeaNPb
         sIjSlQFm/lEZ4QdBErdHBZQrTs6tbZ6mJ7QKtmGLvg2fO/LiFYgXj2+Cp/W3QOZQ01WO
         w8QcLxuDC6iqMFId1hu4qebkwHsWpz0s3IIVMM5B4+UC84XO0JqGW3Lua6HH42IzKxG3
         EBKw==
X-Forwarded-Encrypted: i=1; AL+hErFAAB8ka6LUZbZUfn6lhIls6RcYG3hMti401QHfZ7lbL0D8Vu4pZxlDYWU/iQynpz5DSYu5kdd+YAI5XDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ebhnr3Ob9zpV7PyoNPnFkgcKZfTXezlpl1q0HQUPkn2gxmGU9
	rqAUQ5rnjCIZnvR/a3Un80KZQrWk25qNHHdcKYOeWu7+QVCzmolPoakg
X-Gm-Gg: AYBFou21tQvuP+/ABKewI/AE0bX17DCtfqKRmcPSf90n5ViI8KTLwMJRltUt281BABs
	ZeHbyHL+kEVrE1IccJhAwf4pU4Hm7+bxsyrtpC8j9T/VtVQQCYJ0IV9EIw1v1Bbjyjf/VLv3Jh9
	frWDUzkiI5NQIvmLc/e6XySYgsVA+qaBIOdubOuGHRGJrCyzR/fN4hB6UHW0qahXNtNiEriHT0V
	fQxSyHu/c+98ITgTGJYGeVhleYC3H1HixbNq7xVzdfVeLLcxrsiocEKJshSFtnaFF+UkXW6UOpS
	zb0upTEINcSwO3ML4DienFo1xeJk3b67hIB+sn4681qScF9JnMnk4yP/eCGFZckCVoAbyZlIo1Q
	cY3rIJdpsvvo10s9wO09f8wlsP0qoKJsrwstNEDhmxfjP9MZMRRlMUd9ojPpZlijdmH/qoRLs1i
	/+xsTPQkDoOo3zXqEEG/QMAp0reYshxy3NJfg2gW/beXfHtVdci2WRpx7ckkwgypeSGDo8wtNXE
	i3cU9qw3nI/SfQUxToUmK+h2cTH1jCZeEd4sAyFhEF7FQegm1J+1Y1ABkggl6dIEopSPNWoEN8b
	CeNFOhpB04BQBQ702eZQdSLu5ihnsCT1t41jUcgvsB6yyboJFWhnOSQJETiFVHd1rpOkZrerNMq
	FjCMY9Dx/NeQfJQ==
X-Received: by 2002:a05:7300:79c9:b0:36c:b1a9:542 with SMTP id 5a478bee46e88-3725e04de3emr1622032eec.29.1794111995038;
        Sat, 07 Nov 2026 20:26:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:5a4:1cb9:242d:4f00])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm2251480eec.10.2026.11.07.20.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:26:34 -0800 (PST)
Date: Sat, 7 Nov 2026 20:26:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: amijoy - remove amijoy_phys
Message-ID: <au_59Ml4mAdZzg8a@google.com>
References: <20261107234349.382944-3-blum@kernel.org>
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
In-Reply-To: <20261107234349.382944-3-blum@kernel.org>

On Sun, Nov 08, 2026 at 12:43:47AM +0100, Thorsten Blum wrote:
> amijoy_phys has only two entries and is only used by amijoy_init().
> Select the physical path directly and remove the array.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied, thank you.

-- 
Dmitry
