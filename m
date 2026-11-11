Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399694;
	b=2gTj3H0h2eg4S0t350qKu5QCHv+EbuH84v/3Y+t0HkBQPOTyvqnUEKKFNNzp36W4V36e
	 oGy7yntawEqhmw9GMRHXGT+bqFaLUdL8KxySoS9PEF7TG5vpbNQezXFr1An3kjdAS+bZD
	 Bx8dHQOb62ZeWJgmWKiWDBNdj8g9E3AXJe6IL8NMNjlx6heTJvgMQ4VFEP0vVhwFfQ4wG
	 VZUiGhxxdPzDIPpA22WTAs8r2lfw+A9YW4MupaWTRQBJ/uNOAbXDkXYwSSAWgnBGVfQXQ
	 bvj/RbRpuoCmIy/2Bd3TbNfx4Nq+cvbgh6an6ehHgggh4BFB5e8V/nfR4UVQr07r+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399694;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QixnS2+P928Z3P7eYyGnBjyll/ZkDWQqTsXeUlcA1nU=;
	b=OhPRIl+/B9yRX3V1kCa1JSXy2tQxIgO/u2U2eTps0doVQfXeVVUMHQ8XNoA5JMA0GMNS
	 BRqwdaxZ3wvU9xCW6pV8cc7gI2xLI8gdKatpYke9JT1cQ5dCJaOuJhSjKhyBeE+s/34d8
	 pq9yRWfIWnZLGc+1Zbqtt6t5jdCs50EieOnn6TuTtirbls6Ws3NY9Nvr/qvL62oLeFj3e
	 nhD4cT9lURvyVjZdYEP/5LQtyHB91pRcQuP9izQV4+HxpXzjY+AlIRl2w/k9f+iE3ZDhN
	 5m39TEufocGngHkEFmMVAzXaUP8Y/CpJKYbWMiqZfflJ407r/s0RAJsCsd/9Q7OlPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoEIrym4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB4606A31C;
	Wed, 11 Nov 2026 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoEIrym4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181701F00A05;
	Wed, 11 Nov 2026 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399694;
	bh=QixnS2+P928Z3P7eYyGnBjyll/ZkDWQqTsXeUlcA1nU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WoEIrym4EsVqXZzQ8NzbP3q6u2nORtof/OJ/xly5S1cS/jZe6f6AbJbYrg8NFTyUv
	 PHsfQ98GIJQqIFrx21aEtEhbnwW3JxaiLAqZwpzoJDHzm9aXAg+5NstQdcRgugD613
	 b3cBYIE6nx1xM3yVitEvVKBswEHWNo+eZI/q78GRI/M08FZ7IUTnH4cFFEpCxkpFdO
	 HUIbrUZr2NlSlmRvt7qkJDNrvfYO4KoCbo4FMivfjHPMK5u0DQ8/v+HBG4Iy2jwqLZ
	 J34FfMzvxuZFmvA0ytuPhp7j69nA1wMVUrk+b0h5o/2mMrO4CksLKzPB3hPIT5zF9m
	 /15wO+yhDIaww==
Message-ID: <028d9a3b-8de0-4a98-b3d1-07d83143361a@kernel.org>
Date: Wed, 11 Nov 2026 13:21:31 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Remove Tomasz from VIDEOBUF-2
To: Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20261105070828.1992653-1-tfiga@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20261105070828.1992653-1-tfiga@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tomasz,

On 05/11/2026 08:08, Tomasz Figa wrote:
> I've been working on other parts of the kernel for quite some time and
> haven't had enough time to follow the development of the Media
> Subsystem, including the videobuf2 framework.
> 
> Please accept my apologies and let me step away from the maintainer
> role, so that someone with more time available for it can take care.

Thank you so much for all your efforts w.r.t. the vb2 framework. You made
major contributions to it, and you'll be missed.

Best regards,

	Hans

> 
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..af302622c849 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29512,7 +29512,6 @@ S:	Maintained
>  F:	drivers/media/platform/video-mux.c
>  
>  VIDEOBUF2 FRAMEWORK
> -M:	Tomasz Figa <tfiga@chromium.org>
>  M:	Marek Szyprowski <m.szyprowski@samsung.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained

