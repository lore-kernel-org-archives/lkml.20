Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882045;
	b=bMIlxbY6/7/uYQaWJuH1VfkJ6qEzXKUN3XruNvzeyL6jRNLwreP8v0sKZ15dOwfLcScE
	 ox7G9Opw4AuzVoRAomoHZeeUwmuPOp5mSU84P0uAzeiMXUeGR7En22UHNv3D+7YwqJtEM
	 lgVKX3Kf4T5+Ugy8acfp2NWoJ2kc7+EV+0oaTknYgtuL44ZAjCUu4aEw4WdmlEh/JEb8M
	 4v244Nr6rZdjbdgEglImVI+dXzQIK1G4afzrGIs/4CAcQNpjiCwDU+Ri88rmfUFOiNYsp
	 zBU6mI/1u/hLXdUYLZRgayFITdo8/WXpDopCKQcXoPN2u18jZu/0LS1CFmXotD7GH0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
	b=YLzmeGPz/iWITBcTQq8aIdiCp/HdwqfTIQRAoY7lUqovRl42J9K2bPvcF0JubYQ90/bB
	 FASOzP/BtAPNxwk6gdcakx0CHYapJTSfItA3kf4jNNNtJUQI8xQt7SdLbvK7d3kvRaSmv
	 qbjo/s0s8Ixwc9e8uLskYfQRJA0Y1JJQ3x01kYbUm8Li5qEmlCGtKFJwqHZvClhXAYdKo
	 VmrRd99qIGbWq1RXk8Q3IyWvyzsYrTIFkksvJiPN8A0LFng7RfTcUWyzjhcF1RBdIc7ml
	 tXDxAmVExkkh2VCLK05I8yhV9TkZyuw0AYWkExGQpROXM/mah23SwlaqetRnMVY3Spg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3Vf5145;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52513606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52513606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3Vf5145
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so7404695ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882044; x=1794486844; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
        b=y3Vf5145EHzu4zbvgwO0QD6W7gydOYBhVi3MiyOqswdv8uwxzrRkWQL7Nd3pcZDixk
         YCjQNgi/xe12Jt1UtiuQFHrtIA82ZZKW+I/it6tpUNbboj4AC+jdxvgVgGyswzR74T/L
         OfxxcZplcFEFfxfpGCQbK5UxMN95MKxhq87Vayogka6O5vmF/vDe8HI2bDB/Px5dcpIP
         itD+uNkK0pW6/g2M+zsIC/GaOIdOVjQ5zI7QZWEeyy6ioZVzkeLJ18TgvSnWloHieD13
         awyEDOG56YUU0/ITwJuCcvOAKjZKU3hZm/NAWXAjnwtPavmdadAVEtUR71dQPy1LV7Dp
         PkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882044; x=1794486844;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnbdQF+mYCE0wEkhXTSh32IAVnsikEgxzBr/xzLSIyY=;
        b=fcSp6VupO4k4Dv+k9PpdZ/Ry1xcDsPD24tn+tZX3n5Xp4LPQ79sSMPDd3lUcBtFnhB
         SXTKt/srqQq/svnmkynQ2TF0qbRVd822I8hfKTuctCWB6OtUGNsn4PwOmlVk3um8l3YC
         SZqCssjm7z7JbkAjZ6/OOjAFWZj2gSIGjVyDcTd+koIx+n8IU+Y7RxnMYl/hNVY62bIw
         4zBATQQjDjvs4YVLUXmTg/gyQx1HQQg3CgUHVzV0WIC7yaAjWvJDt9i77ep0I5qqMTHR
         7Kk/sgwUbrSFjCIl+W9ZqU3a/UmvTDz6qP4Ql1t0imQBf/YAJiMkUZT9Ta9E8RR1eQSk
         XN8A==
X-Forwarded-Encrypted: i=1; AKwUvBwMrEAAIYhh3kOYn2bXXdD+KDh6AfCPy+XXfeQ15mZWKfTiL/yde6O6VeVInZlgmN+y4w6qZpVnF2MtbgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z/iy0+sFR4h8RhdX9nn/rRdM8v/7oYev7/eRIFOg3tgVuPhVY
	XoSJtfBplnlv2GUH8Vck3waEfvxvb5TNxyZmWfNKk5eoXAsyZZNF1/ON
X-Gm-Gg: AYBFou1kLMUdvaiRI/vntvHlaDb3KkrDZfiLVbQYdD7hNd7taS2PIve4YIzNiMMR79K
	Ahl+4e64XucjmkTNYrkzlfy7pWWXdmlzQnBOO7rGh5W57El0yvegyQH4qm7jSrpRy1KE2DpH3Bi
	oMvW/wYoUyMH9PbTzEif8TzUJIq9rUu1Pc8FYVZDOegVzV/UvG8XleigEKlO6xrq9agGsS2qdV+
	pzl6FjVdx8gIXTQtVPn0Bw2bqofbIAK7PZYobf0UCKE2UJYCEAvb0ykUX7CTit8iEhFrVK0kAhF
	cnLt7bVRwOnDCXY/CqtZmDjlXrcbLCh3wD+rCAhQ5FEZHagS+S9IkN/rhl37xtf4INqDvoYj8j5
	eWrQ9CAMwuG2AAAFzmAWybGAlCpMlZ/1uIn+ccY1BjGFyV/qu86cNKuyfusP9SEkWtM/TNlv4RI
	+ctA1bnYWcOX40SYXVrwyqlQ3zLNNKxL+71qAcptauSeedbMXFw0NE2dwF9XKxeupYwgBrZNFm4
	/V1SGxBlZyQNK7SrMrse/WNYF9Ax6SjxLbXxLiDpsaxJJt2Ma74ZvTaOuRItmUljve25Ax8TdBG
	FegoUmzVjlpC8TBDaHzskRcISuH8SnOWtnWrC22ZzrMJ2jI123btIw9rvcOEWeOFDps7UkSC3fG
	BpmyT+CK6MNAMgmXsvozD+GZM/IU=
X-Received: by 2002:a17:903:3910:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2eb3648b6aemr182844655ad.16.1793882043510;
        Thu, 05 Nov 2026 04:34:03 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe55bdsm17043995ad.15.2026.11.05.04.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:34:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v2 0/4] mm/damon: introduce age_ms damos core
 filter type
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 05 Nov 2026 23:31:53 +1100
Message-Id: <179388191315.401969.13923237674993632654.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261105044425.87142-1-sj@kernel.org>
References: <20261105044425.87142-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Wed, 04 Nov 2026 20:44:20 -0800 SJ Park wrote:

> One straightforward solution is extending the DAMOS access pattern for
> specific deterministic time based age specification.  However, DAMOS
> core filter is a better option.  It is playing a similar role in a more
> flexible way.

Makes sense.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
