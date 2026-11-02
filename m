Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638743;
	b=zwKUt9a19oT054c6K2jDdm0zHruKcYsQjrrFizmuQP2fHxEkMt3q+K1GlYBo0am0C7b6
	 qm/7tTW34eYFqBQ6HCvUMXRv/Da/j49xIvVm1ftwKSJEw8NK5cmGBHvwF7o81e9xWO4d9
	 EMuvb7z3indbI69ZXgq9vNdNzCcsgKjFMTcchEDBc8ckIYM73ymEA9QihnvyYosjc2Lri
	 Edrh3ZT6FR2FmeitrQs6jg9i6Cp835Aj4cF6ScPuJAKV0BaqWdgJfNR0SMMQdtAgVwCju
	 l+Ll9k9z9lWVzRZX5o1pJP9MMwRL9dWNvlhS1gyA1EACw2/Abf+k19L1WYIfhGxK/SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638743;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0uwoivLJiAvzutQ7aY0JF+5vLwoMB9+Ywm79ON4BGsE=;
	b=LtenXy9YjZI+KoLxuzwZGhVpvM+Bmh5vfxBzmmoyn6JU0CJU1+9H5YVn717NenFePwYR
	 HEm23A4AYAIPe+jKib+7mt/sl/CPv/A5T9Xo7NLM11mAm4GdS4aoXJf6WL9n2QIVazU7i
	 csw8yJw0erg4Ig438Z1CgeKtPtjMMRusqcodeK48xQ4VarQazK6ImzaYOtNo2S2+lHY2x
	 5KFJfEipI8vWyTQGhZ4TXjOTkYElo9c+vn0jGlTJTEwl+tk+MVzv4luwp8DJN2xH5j+RU
	 lAfn2xu4RxmqBaL41EfoC5PVQDVe5UQTTq416MbtRTFcfJ8DAcBm1nQzudLb99ITD0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bLoGyWGd;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57F607505B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF57F607505B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bLoGyWGd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793638741;
	bh=CL8t3c6JLDGRR3T0QVgRjVlabSJH7qyJQ3Ydz55euyg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bLoGyWGd5rx6L7H9iLz5O1gc9zmLZqtiSNZ9D4eZXoFydq10BOPzjlAdV695cDKNV
	 YMtUccFIMB6MHKsja8kI2ISszG8miTcchRB3RrG/X9EVBIGEV5jxRKMvBp1uC2H2QE
	 NMpSfaOQSf8UlUmk/BhITRogrby+JF7I00lia6DLMfkniAZuOLVrrwSezIhPaXqxU3
	 mBEZiV8Bj3IJVn3bkT7NNzoxoBHjqtP+sC7MED3HnejtV5zE3eg5QuLxL8mNsYkKNu
	 U8jJFwd+r1ihj/bzSZk39sWpK4sg2xKDkRY50TySvENmSgNNWOTk8AoryXU42JXjUG
	 TlhnPGpicFtlw==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9911817E0240;
	Mon, 02 Nov 2026 17:59:00 +0100 (CET)
Date: Mon, 2 Nov 2026 17:58:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Akash Goel
 <akash.goel@arm.com>, Karunika Choo <karunika.choo@arm.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Florent Tomasin
 <florent.tomasin@arm.com>, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2] drm/panthor: Add more reviewers
Message-ID: <20261102175856.39e4b36d@fedora1.home>
In-Reply-To: <20261030144805.667158-1-liviu.dudau@arm.com>
References: <20261030144305.666845-1-liviu.dudau@arm.com>
	<20261030144805.667158-1-liviu.dudau@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 14:48:05 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> We now have more people that can do reviews and contribute patches
> to Panthor, so add their names to the list.
> 
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> ---
> v2: Forgot to add Chris Diamand to the list, fixed.
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 89ea35a35c680..ef92c462a8381 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2321,6 +2321,10 @@ ARM MALI PANTHOR DRM DRIVER
>  M:	Boris Brezillon <boris.brezillon@collabora.com>
>  M:	Steven Price <steven.price@arm.com>
>  M:	Liviu Dudau <liviu.dudau@arm.com>
> +R:	Akash Goel <akash.goel@arm.com>
> +R:	Karunika Choo <karunika.choo@arm.com>
> +R:	Lukas Zapolskas <lukas.zapolskas@arm.com>
> +R:	Chris Diamand <chris.diamand@arm.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

