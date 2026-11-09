Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229831;
	b=Uf1scFXDZMfZx3YzhkKz8LR7kVSxWP9rvUPkgSNc8coaC2I/fMQ9rKrltj6kD/jkOfMg
	 Mv0XY8ISx8jNCmpVCNK+V5AxfCExNUwk1ublNeSjc0bKpJ40a6uydJ0MaGkc32AwWZbCR
	 pTYcDsjIcxyhXsPTeKi4pFjDbalrLoci/xW0oKcer8IcVI0KjNBVn0BA3ruMLgPmIy5zC
	 t6FSN7dgngpsaX3C4Bc/nqwJHvsVwNN0LoCndGbSTvrfkrxQI2HDnPxckeWDk6OewsZDb
	 UQ4y5cp5OEk58r67PlL2amvmjlDdouJwOthvRAU7FIhuSZrH09PnonQ7xlJA4nzVJUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
	b=RDXf2gZOmrjF4EmRZ2Um2KzfLBecA7falt4KLU3b6JD2ozSlXT3Bne2acDGkGaP8bjTE
	 tvjmTIKXzf0GSs2hfnoUJjvkl43MGbpMJHT2RRH2OBILN0hORb3bkrdLhYcVaiD2Mn8r+
	 ilN9zGHea+bFOnuiuTZLyYT+eXnmsufibgyG6B7jXXKG1+547lshLhsNpg/Mrq3N3jzLd
	 Lam5JkVHg++WBQinlxbhdBh2+cPnGovmRVCxMZ5gwfeYFZqqWXXca8mpE/DkoNlQ9dSph
	 ShPqad77TaFvzM5hUkxJy9kzY2iciNTgQMdOfqtJgEr+eili1yqWVP4ZEy3O6S7bbTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWlB7agj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710D606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7710D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWlB7agj
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c09dbe96b1so29010e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794229829; cv=none;
        d=google.com; s=arc-20260327;
        b=mBLWc7eIuq0zJx+6efSlUm5iZ9lM4JVploloZJuPmB3ASHFNcFnddQ/lLa+pK/2N7O
         KQuQDHYN4N865MpcoDzK1sgrAm+X0WU0zDZnwmL/lDAkE7tURi4TQ42+ejEuBim91U5s
         tti5tuTOPMjtT6y3eLSfPda/PRHEXsRq9bqdF48ekE+DkW/7Z2DhSwfXk8BblBvD3aDb
         9J6ex4Q2e9hGTYRzuDTW921PdH2TCmrX2lJ6Owy50LyLqk/Zq12Vv4vg4fg1pzQs8wGS
         HjbRiL6fHHhJuUOX8DKTjeKfbJLr6e4hy1KkqE6c/JXYB/eYvzH0B1SwP+liPY3nepnA
         gxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
        fh=rww06LigGioKBq+DYLIdxk8cwkAFYFms87z4j56jUgI=;
        b=GX2MsYeL55DI9BX50L6tm4GM6ED3Gz22GsmJwgi1FaDpEwBfQ6+4jh0aORiYwblNxL
         kC5YAbz2JxDwtHD2PU+UL+1QPEVZnU8yuLE6BFFpqmJe0Z/ZtjL1s2uzCJvK38tOIekd
         i1GYNh8Q1O3ZmOidStad0T1bbOLxqgQ4JWE19l0gvoS+GbFT6gNfYYwbikR/UobBLu/e
         RhxPE8StJDcgM6j/mTwm7HVhPEsjbwryR6BqTg2KDylkcKpsgHEYdjbApHKozdZvugyZ
         g4hhnKAzrK2O3h0xbsfoX4aVjodvHM1CUR+i+ZET/H+UvSKl/w5LhrPfQumvd9/6ZJLl
         oCFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229829; x=1794834629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
        b=OWlB7agjWLGk2gaforKWuj81KLHu1B39NUBWnL644JkcXDk1P2lDIwZjzEtgbRoWol
         kqNKHR+rrkkuRnBgfzHr9kpFWjUNAfLV4PADbSPrctLUpg1w55dCXhSq2iqO3mvtzrAm
         KOxAdt/DZP+2NfnJpkFNhswvVSz8LQRpY9Hu73dY6h+32y+iAkXYS3a9ej+GdK5flPc6
         iNyOI3WvGShV6bpO1SMEAassRwC023rBjoxN3+S16Sg3xlsQJ2hogUv2vxb4yVC4CxrU
         xrgx8SgADUnkY1i6tXaYEqL59YvDMoI7n5omgHoqkjHVs+gLDx8pz1jA6cGLiZmCO3ac
         pKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229829; x=1794834629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WRU/Av5eldI6iBEWFvzMDPRqRo/XhSbuYOl5jHiIpcE=;
        b=tLVYmAhvIX6zGhwNoNQ9pEl6KVRYp7aFnb/Kobcsp5zzvntnGSxy8hwZdwKF3DCS2p
         +VvI2ul3kMu2jBZIpdisZmtL+rXbeOfPtE25sWPvXM6fAyNblPsJ7eB78DYrJwFDjOJg
         UI1SNyzSS61u6EwPE1wJPEjbTQJ5m6WDqRnM81r/YKy3UNX4dnry0lLxBAojS+eDWhOx
         KzYFzGybrrtOS1Py+2VoX1A6UtAceTgOQMN4pgyiqQ8gmpz3/l9SW8asYNVFB8X+G+55
         rqU22pw4qEdlQg89p9p6qiqN7KcmKxwLAwCOsK9NLTJiFRjGf33xxBqE9DgjQUsqOxPF
         c/5g==
X-Forwarded-Encrypted: i=1; AL+hErHsv/wJUrw4oUTUOl0yfP/8exgZcRYFOK1llgQHubQwkhz/ahqL3ExUETtTGTY0lwew1JC20y2RJH/FS/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f27efx9gTy6t0RjZ3SMwzyMib9skcLo5/aOUUDZTtj4RdFq+V
	m8bGtmo1mU/H+lTkurq5KWCZNf5O8udle0UCT3zsd49z0wNKM8CWE35F0CDbyGB7uaH3YjgGbtU
	OegXzTb9EUrt+VIGP7KME9Y/kiHF18G0=
X-Gm-Gg: AYBFou0WVj0/qUYnwgQ/6XyOR+35Gq3afgYNb/NPvmAY7sJlF49n11BtstA7qGw4jd7
	TgLUa+YIuIvrWs7LCCDz6JACnKo0Lzb9sKGr9cuv4rsUDQwfLMH3pKguXi0C3D4xbL9KATMgbDS
	PkPVw9MV1susAiw81IeCHquQewS+w8EbTbsTBlY5aHpOFVNqTdKgNFm2WVufVTGtE7LTtLXl7CH
	8UPrUKHYH4JBBXiQlwNxEYy7HDdZQlmmIGeCgsZbYJSulB8WgXPJ7OdUl3knelkX4M1OSgKHr8q
	2rjgKqZ+bF+4WXMu93rhmisQ1VC1iblYHKgUr/fOtKkbmarn6TQTm/+WUGVeAHgzwQ6GOT7zs6S
	5fwOIO55AKDMRupZMcyGoy0CW+GEQUu/I3GE2NyvhTKDFxdl7j+qROXQ8qEnQHZoJ0GudB7+oJM
	SUy2ekI+KvunCjIiDc2M9BidWeRJm3nQyV01DJyjuraF3nSek6YA==
X-Received: by 2002:a05:6512:651a:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c14bf1a47bmr1514981e87.0.1794229829330; Mon, 09 Nov 2026
 05:10:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113545.708896-1-chenyou910331@gmail.com> <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
In-Reply-To: <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 9 Nov 2026 21:10:16 +0800
X-Gm-Features: AclHuK_03ccXXizffE4OAP75MLBYHctz6Ol7u1jIuG3fnh6PAcKhACPLB5mkQ6I
Message-ID: <CAKspUhJVs7A7GrhXEw8EoAmPCvv8+pu+EWXzCMaYRTru4NA=4w@mail.gmail.com>
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Weijie Yuan <wy@wyuan.org>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This patchset looks good to me except the newly-introduced top-level
> labels, which have no references.
>
> tw_researcher_guidelines
> tw_applying_patches
> tw_pgpguide
> tw_changes
> tw_deprecated
> tw_kernel_docs
> tw_maintainers

Thanks for the review.  Nothing in zh_TW refers to these labels yet, so
I'll drop them in v2.  Once the translations start linking to each other
instead of to the English documents, I'll add back the ones that are
actually used.
