Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3943C7DB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433604; cv=pass; b=HJucyYv0rtvVz0MHt8ZJdWV7zfne2ELzEZfA0P9BH1rRkpixAOVPsfBoeJ4p+5prs8lZ0Ge+E5x7BP3qGKoJT3ZvKZkkIMk1afNWXCwIvAOe6L6CsHCcW5q8c1QJ3o6gZXElJUBM/A86cNkm/VKjOeS1Av/gFRS89K2FZCKm6/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433604; c=relaxed/simple;
	bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oh0Y6UWBZGN9a85J8kidQeFm9cn4m9r2JEYvUNBD3xF8O0uUtUp4Xx9DnQTvUxuslQo4w4C+BySwn2/a2nY3XnILCU+Z8Iy/SDLQMxEHX/YpuIob789/QBdsABhN/YIUzJbBGKDEUXI59wH9uZuPDRwizdmOVBgb1h+es1Zp8Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=hPS8Ju1e; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="hPS8Ju1e"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66f8053e7afso1535319d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788433600; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKTf3xE/ppsE4XVyWNR9VPEzNSQjqXRZ+yqaZ9ms4Exz/mb8wLGVAmWUN7S+2NW1mX
         bSN2KoXIhV/+aVLraZY+zHsTwER6UcNJUV/ZUfHzhs4g+OcuITwGbmLV2hPEsWjTd+Mk
         dlsrsWeoM80kHtKzb6fj/HcN6VvgjjP+dbwCsP5fHmZpK0zfccXJP3CHJf9Eoepre0XW
         ckQvG60jg5623qG28X10Mh33Xwr/im09S76jGQ7b9rzkquDKUKGzDqghXaOFWZgr3m+f
         AY5EFX5cN8Ouk6yDs87DcSguNCRxhuYC4IfrVmOc5C5MvIA53k504yHBO5YkKkNu7M8e
         fd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
        fh=UVzCOvmtlYPbF8oFZLpj+ObbJGlXJPLRL39r4T34UT8=;
        b=YqAfhI8ZX3meHOyVIlvg57MbcnZJtFdO4dJkSRqrPn8gyRB4fVM11/qsutvJVlmMe5
         DqplHK8C3fNk75dTU4xaouZnN5lXkk1hbNLiAukwa74V4uGNYE2Xk+9FfSPoD5h6KSxm
         ZhArDuJ9oFzHs5S1CEVKwGnA4H9oc9wZNO47ZxuSIyhAavXdcWHsVVb0Xu8bZYYb1a6b
         TfbH2OBGPINLZPMMe8qCV43RZNGsymycbNp/DREXsc1NIi5Of4tPpyRubKwiz4KcmPip
         vH1VBKxGboFcZ9v5ayZwO8N838JuwjzSWhHi+arVuxs3WHqOCqVlWXg6ts3hRFXHngFI
         TcJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1788433600; x=1789038400; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
        b=hPS8Ju1eU/tGskTFCTqvghEYD0jjeGkiyfrcBVrblxEp/7j7gTs8PNJqhVGyhDUrif
         gw1m/J+EwFfP3J/hUnoxEOhSIC+bZIuESU1BRZL+nqairu7jEryQcGHy8q/fAXDzwSvu
         MdxrNZW58uf25rtLng206/zvkEi3SPfQLjMe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433600; x=1789038400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
        b=LngvbrttkZXtu5XDmwUvM+c6tot7VUiOPdwObmF14sWwIs27+B7icveVMOHxS25B0R
         bdRfWnZnHPai9+l+2WGAyE5ylGLQHuzfPZvyWyGNCoJtR/WZ/JEd85bP3jR5usmJZPC0
         tnCRu+blhGY5wXr2zK0Ayauh6N4CoAsNDlDdRAUVU6dYMLWwlJzyy39Qsnlbgr7oRnzJ
         KROdnH+9vRZwPcaGgWmOyBpKATMnx4BZkqsoHu21SCWfjsVQO2+IMwR2h2SIEnnNxrJ9
         gRp6zrQaB6WDiRIVYbd1cXCV/zLi4nFTLzqTeCm5n692KVF+HmADW0N+y3e7L6iN8RM4
         piSQ==
X-Forwarded-Encrypted: i=1; AKwUvBys6eAdE2vnLxG7BnU7K2uQQEgRbNSpDu1mU6mNGZRI/wQimxvcaKnj8BNxQn5jq8wOuiTqxMlgxrDSiQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lW6J3beWR14zz7Y7yaYJCyOVCy3EqphgdVC8Ey6PhqXD82w21c
	xX1aXmLlXCRS0Qx7C/oENRenskGYOPHxcc1oPSYbN5ESCY+Sf7zAbSPdJlnXzpg2jCyrUAGK4Vz
	M0JUFa3b3rSolG9i9nfV93EHMY7NbmMny0rQ14coTNGDXkoNLhiO0JNs=
X-Gm-Gg: AYBFou35WoLoel8V2712L9DEmYA3VF833hwp1ucrFpruvhZ2TWppGBKKCwYewBpoPef
	U3SStEf1kDJ3zqJWPJLKhJBGNmPARcQif+X7Qke6oNXbsRfBBbhbGASXXUnsz1Z11UL4Lzw60fR
	1H8UBoGuiQGSN+f3+XE0OZ63aINzfkfyBgfzUfwrlcDLEnsljuEUZG6bJGLakrW3NjqhGNNHSqw
	su8cn0S4kccYUp2PucsZAHmKS4GroVeHpXfb3kIlT1uDfGQHawoCYzOQI7S2Dt6o3/CtQME4Xk+
	H2k29n/u4bTr0VMOZAQRQ6fzw/4ZADU+zCe9jyCB7Hw=
X-Received: by 2002:a05:690e:11cb:b0:668:8e5c:ff98 with SMTP id
 956f58d0204a3-66f9bd39e85mr3948192d50.23.1788433600111; Thu, 03 Sep 2026
 04:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
In-Reply-To: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 3 Sep 2026 20:06:26 +0900
X-Gm-Features: AcwNN1U8SZV7eNUxE5uF4XXn4JxE2sLONPUg9FNIFQqQB3thMTAqbRApQMaapZs
Message-ID: <CAFr9PXnAQJ73Lw3SDfFDC+2LFXks_FSTP3CwWK-vViyZ_==H2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Modernize the Faraday FOTG210 driver
To: Linus Walleij <linusw@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Wed, 2 Sept 2026 at 15:11, Linus Walleij <linusw@kernel.org> wrote:
>
> Replace the private FOTG210 EHCI fork with the common EHCI core and
> quirks for its shifted or missing registers, integrated transaction
> translator, speed reporting, and reset sequence.

Thanks for doing this! I didn't have the time to do this all in one go
so I sent an RFC patch for allowing overrides in the ehci driver as a
prerequisite a few weeks ago.
I will rebase my version of this on top of this series and test on my
hardware when I get some time.

Cheers,

Daniel
