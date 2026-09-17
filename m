Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8757B308F03
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604984; cv=none; b=WQkemgkkTxV5fF/ugMOILFGkB8nQXGwRjP+LmIefRIC+NVbVuBhTVRoyAHVD6HuFbrNUEBVH/r1/WX84LQblhEdjRIizlRqw477S1hQ2Iu+gVsE+Gx9dLirJQXI7dleA81KyWUtfARv636+IfAgEYBhLi4CEfi+mu0ju+qRBQk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604984; c=relaxed/simple;
	bh=Mwa9pr9oU264R3StqxR9VVokoxG/c8eZZ9jLBUhxZvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7s7kAubXZyOTZnjtJPlXhRCCRSwI8mtlWs0LhRflz4/qPFJwVY2U0+uAiJ2M/suXTMNCMdxZYBEqorVd20GGnlRA2cyDXvCNkXr0grohRJyyRV9Q8GCH1fYwJO6kXhgl2gfLp6E+rWNJaUQV2odTNI7Aais9Zy8YIRhnRIyX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcsuQ1PK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcsuQ1PK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso221774a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604983; x=1790209783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6/2EsJYoxRx7E/Fv40RgOQ+EmdmF0VbnMJWSDe9QqsE=;
        b=PcsuQ1PKOn3/jWOG5izyt39VDPwvrmx4KbCGLoR/lR2M4Sk4iM/8m+wQnxf6uzNZFn
         xLmR91pho1IZ9suqCkbbTF58l+7XB73qMrfUYkX/9AHiTJjrFYN2QbbRB5a1bYcPuq5n
         7akHeSKFN1noefpOC91pRcJmLRk9EdxwrAmepB9Y2KYHnsp6im5CqC/JingMTjBR6XC8
         s+2bp0pIRTAFRm5T1xl5+YuikGcqR7yBFFXanStc+fPifEWvoGuxMwCjyjIzzUACDLYQ
         YGcuxlhWJHPjw0D/aJeT9xO8QQZIJ4POUDETQWW3e1VvawUsf5plxfrDoCrrx8XKuuSA
         juFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604983; x=1790209783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/2EsJYoxRx7E/Fv40RgOQ+EmdmF0VbnMJWSDe9QqsE=;
        b=rrAUmPSMhUX15PtUkp9MikmuV3sN+89QOJnLZbyFvGoxY2NxqKKr8wzzkMXwbo2dhu
         f3OUWfV1mrjQCFWL9OOh2wuCFBvsgPMRtUNjabJFXh9ffJJ4oA0DoeCozYRSNapYsCm8
         XNb0blLaWY46Rq9ajywpqKxkd1oinXyAQ/fWLSGVMP+RRUGYr0AO+l6xc8TyyKKc1mw2
         HIAUQ0TDRSZiFBbTSZa5i1DKYUjJtmCjh5L0KwoCjIxPLSOn2+BHIZs/TaflmP7kciij
         t3N3RYOyZpeNxtYR5r9YyfhyHXRnp1+vdgA50Bi5fBGXH9/c/MpLx6a2Lz+kIkHFrW2+
         I8PA==
X-Forwarded-Encrypted: i=1; AKwUvBwYkvQClLXZr2o4XAQ8i9acC6rnHR130lrtdQyqsmnzdoARaNgIV/6+4ob203w4EMAunQWvAkSZBhX+OUk=@vger.kernel.org
X-Gm-Message-State: AFuF++moM0kSTRksASZ+m+ixCf+1a65edpwUNGTruG6mN8B88s1OSCt1
	Rs/iWIDuAGEMIRQj45g8+ysDCF0776ph0Yl5PCy478QfMYCYngc5vg0e
X-Gm-Gg: AYBFou2NrvxiBnjadiXHvx885jpMTN5EEvUOevjSvMHVr5o9SZbK7+uD60ijAcCZBkk
	E3J95+Wj9xI5iw77nhaIUXo6Ut114gaa7frC91w1udpZQ6f8OU9fXnQMFazckv627ZgU8Nv0PXK
	eLa4S3+yy823X/ZekVQ3gFHcMk77R2lQlc4lBRAbwfHcxpAZjH9MDq92Au3lW3on0yG8a5EI7eO
	ZefblxRxoDPp3+Q/XXZTeJWZqnCG/aQ2myw3/uz55cFqb0jBs5PjIBYONH5ek1RyhIz7P4DThd9
	MGWEsb7Pte1Qd6oFGjsJfUW9S8oFNINHf2Adww3e9ksiTcNfJhkc7H/ygRgKpN1PxvM85/HBjr6
	8C3jSVJryS1SFF2cjtxNRU76bOhCss0bmrGhtT5KxpbC+FtUfnkywlbzxNN3II4VbbspK2v1MFP
	KOk/9en5KbXhwfyq0OqUjuj7zJqwt6rf0P88v+YLYWYwg1Qa4fLHHDOlA8ofQuElvTtbhBnA5lM
	Jhfk4dGARWG
X-Received: by 2002:a17:90b:3842:b0:39e:3ce1:d22f with SMTP id 98e67ed59e1d1-39e3ce1d970mr731494a91.16.1789604982239;
        Wed, 16 Sep 2026 17:29:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362f0f07sm1919755a91.17.2026.09.16.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:29:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:29:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: msc313e: Propagate error code in resume()
Message-ID: <b652a9d6-69e9-410c-9a47-b583f5029d83@roeck-us.net>
References: <20260912163334.28636-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912163334.28636-1-tzungbi@kernel.org>

On Sun, Sep 13, 2026 at 12:33:34AM +0800, Tzung-Bi Shih wrote:
> If msc313e_wdt_start() fails during system resume, the error is
> currently ignored.  Consequently, the watchdog isn't running without the
> user's knowledge.
> 
> Propagate the error code and print a message if msc313e_wdt_start()
> fails.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
