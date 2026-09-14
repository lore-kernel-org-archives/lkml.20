Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50C472F9F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393607; cv=none; b=VWD3NrKxWVsOym32yqXZXbw68YNC/MFRoJNAPaQU5+Zx81skcYvt5tz/+p2nLlSxxWl/LU26S4ixRqVbB0uiofwqWJ/zZJYBOBo2hY1vmj9urE2slr0wvjRN1FJNE0bLwq3XdhyzvehHJYczRgqp6vtkH2KSF9dSsnr1tT0r9Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393607; c=relaxed/simple;
	bh=OueWNPJAtMeRT9tAOf/SNItTLh11VOYa++V5fUJ5R6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FpBL7hObq9ARkU7q2EjjU3E0eOa0zcGS/KUWmeejvxDvi5XCPW61xnGEBGgcXUc/VaFtfqZNNcgztjFd3us6bC/M5i1BPwccP9KqEjDIDaV+zBb3fhusRHEBprvR9zLznnwOf4yjP1A7mTxNnetzIYoO/ZQuEz2gmGWOQYuefWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJRVg2Cg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJRVg2Cg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso26725845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393603; x=1789998403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OueWNPJAtMeRT9tAOf/SNItTLh11VOYa++V5fUJ5R6s=;
        b=jJRVg2Cg1fsmWKJRE5y3raHgfN8pVTy/bO/2m4Cxmi7Y6uapPXXuHsFV2kgtomwn4m
         NAI49d0O29uUU20ixokvS0FvjevtBuQOQEMcR5Stnl44n4OfXReIlcCbG8n+auOxJ6qR
         pVBF0OqFZNISyKtxkTagZKRIbDROkoYBYpSFbLCa/W7kra2NWNjnlP+fGOX8ttbA6HvI
         Pj326GzEwK+NiwzYZA+C7SKsGOamjUkjYAyDccqS2DnlqlHuv0OcEhHCuqYEH0OAc6WV
         300/ULeGk2f/5Uc+ygj6OrYOT/bDvVk1/UMbVovFJ3vUTkUBmgu2+85FYq7b9/kwJMBN
         2IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393603; x=1789998403;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OueWNPJAtMeRT9tAOf/SNItTLh11VOYa++V5fUJ5R6s=;
        b=b0rGAr4s8iAmyxanMMS9O8aWpbRBfqYa4ihps59lpka3TZtzZhZN9UptEMHB7vCZNS
         PzCKmDZnBCwMEx7OpNLP9QQqAiZh9XaJGiWI+tAzcBXl2146D6pfFNFjBTA/wqkcmlgo
         tcwW3rGSPIJuv2Sq30emPO6+rnqwfT9aYC3GJhMqWCMCnbmSikVaM6BGLySh7IbCODSK
         K4WbVqDp2jsihWn8MbwACuDSLyNH+/+/DwbzXeU3xmXumPR2i7YTh/eGXhfgSr71Cs1j
         qYRsRdG/0Fcia2xeCgBYJCNKmxA0FuHWWiGKU2Oubx+PfkDyS75KAjOYpU6Y03Dup/e/
         QCpQ==
X-Forwarded-Encrypted: i=1; AKwUvBybcVd1QzaqLqPrHwqOX0vpUvqiEUjS8Wtalg5F6gsJaTeFM/kugwf9iFGBl7AKGmvm2sKji8wFiacr3tU=@vger.kernel.org
X-Gm-Message-State: AFuF++lz+pHJvcbdygOArihtp1MdGEX6IVFQWhFcJAk03ERWbFHYgKtW
	zK4nfH8GORKh8ATNgwU8v3BgmZTyjYn9cuo3DE5LA12LvtZxiVjTpCf1
X-Gm-Gg: AYBFou3eX9iLWP4Uy+/9q4UMeG1Zc53uWhgHrtQZjUowmK7cnQJqVOtyMNhZF7fThl1
	a2zd1Ob+lL3VW7UTE3RXKqj3WTt1ZSkJqIeJbeIGhuh+5wVT8jHLCf00hcMZckWXTXHEvNSGH70
	Pu2nj9yBLCTjSTdCCf1uN0oX6zpF9AtTh0/oz/CU9NI1H9UCxOwLpaX9Jp6pW6qfrRL9k38nATB
	mNjxZktrRmQHxwUoB4UYIESJs7i4s1hlcJkmqYhtvTzB9pMFASQipas8hs8gXw+p7/Eptm3yRNK
	lHxkwdB31GilSuMlvJR4E6Dlp0rcJ7uglmIqxPrsabukZ6oXm00DIg9pgghuTUNb4E+6r/2Lf9Y
	fcFTZLgjAs5eFrM3uNKp7eXhsEYHY9HfIu9Gx8zhh3rU+RD0sqagw0KOP8YTiZhKjrq+YddWVAz
	8BhsTSPxMWmqkTZB43CWRodssj3pzFg3m1UV7UwbZIg1ZyEjEaFsXmRHzKB5730apSkDmEmtU2q
	TIrojinOady0tA6Y8qAOcA+9KSmwOPQyaz2
X-Received: by 2002:a05:600c:4e41:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49e7a65cec4mr34147585e9.3.1789393603344;
        Mon, 14 Sep 2026 06:46:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2af31dsm1341885e9.4.2026.09.14.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:46:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:46:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Kuniyuki Iwashima
 <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next v2 0/2] net: a sockopt_t quirk for the options
 that write past optlen
Message-ID: <20260914144641.68edc88f@pumpkin>
In-Reply-To: <20260914-getsockopt_phase6-v2-0-e48befc9602e@debian.org>
References: <20260914-getsockopt_phase6-v2-0-e48befc9602e@debian.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 05:20:06 -0700
Breno Leitao <leitao@debian.org> wrote:

...
> and ipv6 comes next, and TCP_AO_GET_KEYS has the same shape.

That is the sockopt I couldn't remember last time.

It is really horrid and shouldn't have been allowed.

David
