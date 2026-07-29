Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5304A0F00
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634930; cv=none; b=ZSho0frISrG3C17QtAS3wu9yD31fKArD0aI6WnXi1cfuEtne8WcfzuYYCqUIbgy+ow5/IcdNQf+A4z5Ur8kH9m6FqonoCa+/U23w7rQ/78wHG1+xQoRPtutUlzY/U0GFZPoejl4R9CmAZbPIKz+fCLoT5uFg7LLPNNQIUNbJJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634930; c=relaxed/simple;
	bh=mOJQt2vsWvrLdsJ2aAlHSWLo42eJ2H0/jIjEjOIaHAE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=eo03Es9exIVC8Hoi3wIjOhJU2C7M5stFNWgG+uIkn4cfdFwApLTQaruW1OdYICRRxFnZUEP3OYP29A4Oldmy6UA3NuP6kUhIByYtLvFwDAlWzFNZWVMskgPjL1Bz47qH5udAWsGXc1oiWszh/9rSeCeAEJf/0Wb+qe3nAd0K09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4t42vmb; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4t42vmb"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso866554a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634920; x=1790239720; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mOJQt2vsWvrLdsJ2aAlHSWLo42eJ2H0/jIjEjOIaHAE=;
        b=Z4t42vmb92hSSVClm8ybubh8P4qrx+xmGFBUExvsKVsFgomiSLtdosDxVHrRP1nMzG
         /+Mb/Ng6okHzVpJ93bmULRZBMRqLWziVE2eWt44+mwkqvyOsGgm3i0gqUg3hX65dLPNW
         M5WCIrqeEEXU3RZDZupJBz9ns9Shlxw6Ju0hjCH+Ne8AZJzKx/h5B5J9t/GJS18EnYdz
         NokKJ6MuExf5OagnCjBdKEZXMoCdI5Z83ulJao3dE7KbAzImOBPO+ykKBOJh3bP52SQp
         zGTYWxY5ltlQvIFyNjxFA2yAqhu9WGvEvEzwLkmxLr+voWXww/JcogY0T256VHk9E0Dm
         aYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634920; x=1790239720;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mOJQt2vsWvrLdsJ2aAlHSWLo42eJ2H0/jIjEjOIaHAE=;
        b=yi5Oqyg3U7hFLwP2H3euP7HrMpJq8FbRECa8ddqzg5Cj4vTevz+vSq6aoLyY0jDaO2
         5smjOOVxxhTZxDy9Vw2c0L1p4Mx8qOfpw5WmEMBUxeyWLRMTdUCNeSoxYQghjb7HYMd3
         P054ygo0dm1D8z2oCbspxMHN0gOswd+zZ/GsEeRBHrQd5e2oQtU84rG2EbpTkKMYJPXf
         jPDjQts/lrYzdoXgV5ueR0hpRtQhjtQ+/5SV97xH/ZFQklaCPuN/bOgIA1gu+XTTTMKX
         WgRyeUU2VFOGjQzAlXIdKG2oZOFmAfcrdxjBNFceYoPo4uQtmsuKwFvYBzDbu12Uosy4
         7y6Q==
X-Forwarded-Encrypted: i=1; AKwUvByfcoF47UmBbKxmHNjeDqIfjy716fZfu0jn/xcZDV3spmydIve0m08etFMnZp1wNg62Mld3C8YYtpfJ/FY=@vger.kernel.org
X-Gm-Message-State: AFuF++lRpmconNFRUNzgMJpRlCCi3I7G5KGissHN4G1LHqp2tTYgY2DB
	QX3FIV8zJpSunxHOEz9DDXCWkdvkMoeA2fBHDzkKvCh4Vl6Ln00ZSsmRyUsjbg==
X-Gm-Gg: AYBFou145wplMHOusPT+rgK5ZiqShAq5yhEnlnQDUe1NhGK/R1xvElh5tm+qEP9T42z
	oWTJaHOI50beOhVWOrXc7aX7JcLhf0RamBQgpuqhzUr8njRoZdWpj6xyyJeDFOFRBO07jsT8XJd
	+QByT+wsEwfiKpKm2t02qkcPblNgJbIj2sZgpXFzQABRfOF6H05EGvfZ0kYb9JYxbMB/QkwWjQW
	EO1XN3k8Cnf8BBv8Q1+7Ri1AIzFQbfqkEQ6OP+0El9BS5nWZ7+1/5pJqt7uOH3kvEfMkLtVURvh
	l2+gIxyyLNWW53N4NZ+i3ctUCqLdIwWTZX8PMomlQud1KmRcXnQfKg+Wyxb45y0vLhvVrhfvEQT
	7/TcoETTrb0fjDrFBmKoXg6fm0Ptqi7EEeTAYNS/V9n99CFwYNMadY+0nhLzfE19y+OvaePKYfK
	mRYJwCYeWwDn5aK9HgW/fVVyop4HqWn0PvOx6rMTgB3kAlS3ByXIxgJ2dPnr0MtCF1tVohLy5+3
	GZlhk69
X-Received: by 2002:a17:907:1c91:b0:c25:2cbe:edeb with SMTP id a640c23a62f3a-c29e521b5bcmr397397166b.21.1789634919601;
        Thu, 17 Sep 2026 01:48:39 -0700 (PDT)
Received: from imac ([150.228.9.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fdbcsm245938866b.59.2026.09.17.01.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:48:38 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Ayananta Paul <ayanantapaul@gmail.com>
Cc: kuba@kernel.org,  davem@davemloft.net,  edumazet@google.com,
  pabeni@redhat.com,  horms@kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: netlink: fix spelling in tcp_metrics.yaml
In-Reply-To: <20260729034147.6970-1-ayanantapaul@gmail.com>
Date: Wed, 29 Jul 2026 10:27:21 +0100
Message-ID: <m2cxw6i1s6.fsf@gmail.com>
References: <20260729034147.6970-1-ayanantapaul@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ayananta Paul <ayanantapaul@gmail.com> writes:

> Correct the spelling of "reordering" which was incorrectly
> written as "reodering" on lines 113 and 115.
>
> Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`
>
> Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
