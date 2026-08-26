Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED144AB8A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768554; cv=none; b=gxsubevb1Ph7Ak0WjLBRVxYD3Xelil6sF5BphjD/CBAqQ7f6yorI7GMHqvWBin9yNLSYV1WnjXtqIMOShVZ6bSlFvNMsp+4s9chJUK70loL2L7W6LY+URA3Ll/ZBgVL8ckOTUgCTglwDmZpmRlbIxkOwoxMS+2dCedm0uuxEHDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768554; c=relaxed/simple;
	bh=jTmlZ1wXvKzIljpCaUXSV4XW6lKPvt9wsBPqLa/JBsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3Mn8sYBdzejSKeGvx/T4yYt7n/8gJR0K3ec0Ou1tzEU0ajRv/y0W6Ku89LurSQugTWfZUEoqT5JvHNx10FwMWfN7ZyTP4zS1sR9UQyu7Bq2cWE2hn1moXmfHqtJXZ0SS2pURqprrGPu4XsYRot3KbGXm5BNDuzo2u7FOrkiFio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iDZoe7Z3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iDZoe7Z3"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so2273888a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787768543; x=1788373343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYcEtx+4FYWxMZlHfWugGZUKPIp0WScwtuxkWCMrWJ4=;
        b=iDZoe7Z33UKMLMiMsCzMeCS/oeGYv4ChCvfY5CiJhowWP5UAQoekkL5v2GYUaneztZ
         Pa0euqhAHPjuQyXqdR9dUg+W3wt2ZtrpEEBhKlZFlfPXhC/zcDtSHi8rQHr2D4nUt84C
         9OZ141r9GVjfnvnuOKKn/LHS3e1VaQzTrgjMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768543; x=1788373343;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oYcEtx+4FYWxMZlHfWugGZUKPIp0WScwtuxkWCMrWJ4=;
        b=fkfcZfrGk5NpoCilpBHw3+2KVAkFkWzM31V8nfZ7MJsKZBtQo6Y7pj1WQTdZk5V9F2
         IEL7fim5r+E/fTtlll41ft1aKI2eb6iU4v3oKrWYvNHUglMi9zZqm/BL4GjbSSChgZMD
         Pz0lGEq69WEbXewajnik1D2RrJjb7A/XxuLNhxKDHHCLWmlBkNSh+zQlE5xSCn06uJAs
         YQc08A+qjgxOfQSCFx8tcQI6iTJaAT2TUhgzp4Fkg4e4Z/UVm5c/XWOVOKLVOYtRy9lZ
         ll5oXzu73DENbG4PA/1yVpf6LcmE+HSLZr62Os1MCGzW7eX8T9NrBghEMLRIPSifrK2l
         Bc1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp3MbBZQqIkYb1lRNgCS1NhNue0TE2U2p/lhRw9ZRcErLO2DYrfCMBb+nCD217pp4ayueZUuUCaNfwrnAs=@vger.kernel.org
X-Gm-Message-State: AFuF++nJPC0HGCe+dR0dq4jY1Bx5+OytEmd+Lee/W2DmqKxjRfZ0lvAB
	WLwa0Sf70WWJcXHUeB0iY4dgwpdKwokvGkBWWM/QytIshPd4wcYoP7fS6jCuvyXUDELvqGzDEsV
	3bi2HS8g=
X-Gm-Gg: AR+sD12rhNxWQwvnUJw3JFMY4MFh+dUF6pkdZ6Qkn5psIT8KXT4rlqJybA6I9Or0V2W
	jj/aSkxvdY2zazhQvo+swM4r51c5s1n3VlGQvPn5v4BsNNAAWtawTGI+YBktUjY3KNFaAnIi6te
	hrTCSrW9ldd17X4m0S988tyToKGovteLWfiH7au2+MbI8dBYxhpY5G/RZPAvXs9RDUZ3offjh0U
	D7/Xt0D82+02ZFYrUcdOPTIrRgU12aAM+GspoOhTFtoqxrRXF1n305EbsThtZ0YWhRSX6WVS8Do
	lNvlapBlLmQGHXnkaZUEjRpN18OkFyT2/LIaIb0WML1pL0RzfdTh37uZ+P7WVZLxk1zp0JeMFrh
	03R53SmKKYwT0US93ATUQQqHtlwXsa9kjSwZcLkq/LLjcT0BmkosGYZx+1byy4hOopm0c9NZAwa
	/2Bi0HSdsEXqH5zF2COhvvIm/IYMXfpUV1Wteexb5eWfx5+z6GCzl4aqxFCJQlCiFW5iU4LLfN+
	bXRjixrNmTatBVgXf0JpZq5CfA86pHy+JW7qA==
X-Received: by 2002:a17:907:d0f:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c250c363717mr1259872566b.14.1787768543344;
        Wed, 26 Aug 2026 11:22:23 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d671csm562838666b.3.2026.08.26.11.22.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:22:22 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a3efa2b38aso2386925a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RojKL/bz3FqLrWSUJbmtew8VN3MAapsSWyFFy6CD9nspTqDqlkqAj72W/hawFqev5iKFUDk+w7XfsbXfo4=@vger.kernel.org
X-Received: by 2002:a05:6402:a518:10b0:6a5:ed9e:b490 with SMTP id
 4fb4d7f45d1cf-6a5ed9eb54bmr5775087a12.14.1787768541885; Wed, 26 Aug 2026
 11:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826165611.236321-1-sboyd@kernel.org>
In-Reply-To: <20260826165611.236321-1-sboyd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Aug 2026 11:22:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4E36NECbZBm0aesRX8mhatYXUEaMB14qkBshppBsdPg@mail.gmail.com>
X-Gm-Features: AcwNN1UA7xTkHiRv6GsJ45N4NAts0TsSm1q4h6B3rGFnD1QjSWWqH6dShkE_8dI
Message-ID: <CAHk-=wj4E36NECbZBm0aesRX8mhatYXUEaMB14qkBshppBsdPg@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 09:56, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Finally, I kinda buried the lead,

Nitpicky grammar / spelling nazi time: you bury the lede.

I'd say it's pronounced the same way, but considering that "lead"
pronounciation depends on context, that's not actually necessarily
true.

We now return you to your regularly scheduled technical discussion.

              Linus
