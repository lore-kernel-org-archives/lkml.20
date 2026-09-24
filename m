Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D66351C20
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261218; cv=none; b=tSNhfFocUu0xZE05yVxk6piTtocVpeg2JJL1EhPdaYbJUCeNCxKC2+vh79RQKjPZMf/V5fwfLLnmZn5oKjigg2p3JeIe4m9ILn/SQcI1iWVMk5k86SgpwUAiMWFSvKOyHjv4mWO8kSWlwftKFw6FsTnim5ie+RJFEl+P85GGeWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261218; c=relaxed/simple;
	bh=/GJ8GnOfRx0puU2ZCnCuvCEi8zSIK970ER6rdDhYSpQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSADsG0osGbbOMN/Nl2ISApxd90k+POPc4UMnbi4SJWrWUA/mBZJ+EMFosT4a6fS6ImpimPB/3kwE+Pkm90XXTIZtLdHR0EWS2zW8rn/AGqrTjzEjaV77OZUhdydbUgfCROKChcD+DSDpcNa5ZmZy5wHGc54jFu5zBWlVpTQbww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhJ8/GyZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhJ8/GyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4AF1F00893
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790261217;
	bh=/GJ8GnOfRx0puU2ZCnCuvCEi8zSIK970ER6rdDhYSpQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AhJ8/GyZED80rFlcMiQhdOPpsFu7XF+zMquWmMmlilezsDzEoPszQoRMg/8HLu3k1
	 eOXi8YlSGPu5gchsD7pdo4SQFuM+k0l+oc5DvuL6lmhtdd2apPKiD5U1ZWW2B9rFQK
	 L/YkxGUOuewmv4HZqmQoE/RU6MALIljAY7YXrOpbcSebitWjyhuRELpqPAMvIsQEdI
	 BsEq9HMQYdarSDlzx43AgP/Pd/z6RmPRJpSbP/9krvRPeNI/pjAu6B+j6DDPR3L+Ne
	 IeL14YxXH9lMBxPpAkf9Q4Fj+XZx2l1BZ21xSLDe9ACObeslznezsxkhESqLSeZdcz
	 IhDA7fXwPApiQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so2058700e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZozmbTe1YI3UeWo1aVjnfOWIULfElaUyM88+h5P85f3g5WRx0DPa6YWZ1wK48i0X5Db+IOBiIkeTsO2A=@vger.kernel.org
X-Gm-Message-State: AFuF++mYXn1lN8RLhKNYfxmsRbXE51I6tuwBiLgo7pBs8NnkonAf5lYU
	jSk6wvblJbwtMPkXEGPLlDTX9FzM6887A40hiBAjh92TOTkGc/VxZBsvt3JhngRFGXWe/Alvfov
	n0VgqZbPVQD/+VTbi9fxHmecwDZeqNdn/F+LdKBKmow==
X-Received: by 2002:a05:6512:130b:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b8df0dbc90mr1281593e87.44.1790261216402; Thu, 24 Sep 2026
 07:46:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 07:46:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 07:46:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260923182243.41060-2-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922103051.5257-1-farbere@amazon.com> <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-2-farbere@amazon.com>
Date: Thu, 24 Sep 2026 07:46:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeYjKY2gjXorrSKvoT4JQxGnyUAyaEqG1N4+mMR5BkFhg@mail.gmail.com>
X-Gm-Features: AclHuK8DlJ5hNJm6JMzivbmwyqHAxKbZhQr31gcttS4XGGEHTD93hUStry5s9Rg
Message-ID: <CAMRc=MeYjKY2gjXorrSKvoT4JQxGnyUAyaEqG1N4+mMR5BkFhg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] pps: clients: gpio: propagate probe error codes
To: Eliav Farber <farbere@amazon.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sep 2026 20:22:40 +0200, Eliav Farber <farbere@amazon.com> said:
> On the two probe error paths that map and request the interrupt, probe
> overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
> hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
> -EPROBE_DEFER from the caller. The request_threaded_irq() failure message
> also logged the IRQ number but not the errno.
>
> Switch both paths to dev_err_probe() so the actual error code is returned
> and logged symbolically, and so a repeated -EPROBE_DEFER during boot is
> logged at debug level rather than spamming the console. This also matches
> pps_gpio_setup() in the same file, which already uses dev_err_probe().
>
> Fixes: 161520451dfa ("pps: new client driver using GPIO")

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
