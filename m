Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B4C4B4874
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639154; cv=none; b=f4R3b8L5xuRIheGKfW9kvXWQI28uEmsgr5/5y6V+8zEDgbxuuhE7x60vIjrqLYmL/2nfji/aGZ60Hi2agP6ugpHffGrIfz0qx9VxHbGfd/y8CO0S6eptqAe3a5unZLljCMWQgk6D9nNVdvUobsWkXSNAk44E71awHRneZx2313E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639154; c=relaxed/simple;
	bh=1C100L8bLcVs1OmCDJ5ExHbei+nHSxHlT2hyva+aaWA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+0olz2lDupNeOdhfaQmUHaw5RPBOEaV75vU4gqN36zEHEN4IV0yaGyW5m/aZyNrOxJF7uzfT5yn62PFD6ayaofAxw1YU6oW/kko5yHVW3xhoqRTyujYDdMap8S206Aqaw9xc8nnfoKFFRxV7jT2hJUF6iMJdNOWcCg0ockDJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+bjroZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+bjroZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7444E1F008A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789639127;
	bh=1C100L8bLcVs1OmCDJ5ExHbei+nHSxHlT2hyva+aaWA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=C+bjroZKmJEkCHvSXNw/CXxjY+JkwBuhMzng5AA3YvtwfNyvFqFK+/WOLXWJ6PS4H
	 9TZ776QZpY25/FdhzqTWV2ig2qOJthZcrz+5E0/DgTv/dTtQhI+LATRFpJZ0meWmZs
	 XwyLfbxTQ6nhTukV8+YrEiKVCn4U+nLSPwm+/vZ/iISkucA0mgZNHHStcLgVJ2rh+4
	 1kj2uVYrE9bH8m+H3xoG7DnGECFMbbGoYLQbu/NJgct3JjmkwAQqiNXKI3usq9ALhb
	 dSw/uTMPtNHogu4/cr5nSAp62I6bKV7tBAhrrqzLYodYDnbkpbZsJwiXMjv7mdEs9T
	 9ySJKNx7qEs/Q==
Received: by mail-lr2-f18.google.com with SMTP id 38308e7fff4ca-3a354118856so5182461fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKL5FtSTJ9/4V+vFWK0GYRS2fv+0e4b6dEeiSpUqUETXzRSFDjFY+G2gI/m1lJsHKejcQYsFSH9AppbDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l7FAxHfMoGCF303ic4Ki2abC+ymNtBLmvSwaDkaWWqBoP6IBhV
	rXtqnlTc+hI0Dg65Iq7aa5S84VbCOXXbzsBpG2Sx8IkqigHFsqwYUvGTEca+rqH1um8N7NftagU
	Mux6j+A0t0e2ryOydANkWyvxCtFUn1tVr8RQmTsPM0g==
X-Received: by 2002:a2e:8a86:0:b0:3a5:cee6:940b with SMTP id
 38308e7fff4ca-3a5dc9be4acmr11717551fa.7.1789639126058; Thu, 17 Sep 2026
 02:58:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 05:58:44 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 05:58:44 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260917075611.47881-2-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182641.9768-1-farbere@amazon.com> <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-2-farbere@amazon.com>
Date: Thu, 17 Sep 2026 05:58:44 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mff_Lyt6-0qQ2U1aG_CBG=xD2NxoCbw2dhmCffX5s_h1g@mail.gmail.com>
X-Gm-Features: AcwNN1XWj9I0TdBuyBZglQXFeft5zXi_OVwexcXK0RKPOD6pE-syCJpIOfCJxh8
Message-ID: <CAMRc=Mff_Lyt6-0qQ2U1aG_CBG=xD2NxoCbw2dhmCffX5s_h1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pps: clients: gpio: propagate probe error codes
To: Eliav Farber <farbere@amazon.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sep 2026 09:56:09 +0200, Eliav Farber <farbere@amazon.com> said:
> On the two probe error paths that map and request the interrupt, probe
> overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
> hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
> -EPROBE_DEFER from the caller. The request_threaded_irq() failure message
> also logged the IRQ number but not the errno.
>
> Return the actual error code from both paths, and add the errno to the
> request_threaded_irq() failure message.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
