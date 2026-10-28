Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201584;
	b=a1NB3JcR5nGS3gdxy+uJNTV3HPGmOR+mSOwR77sI/hBTHDv5PCGuoQJKdysS9SnwCcHX
	 nBO+jp7pRooQqn+V55vitgCpsBLXguCBl5CPUd2avc/m+O7ld1Fm/izkChhfzVcAwpeV0
	 FTI86N6Y92Ip5k9da0JjNFGpEEW8A0qyv2uvDj6jrRXfL5rInAUiVgRIQPhZrEMaJan2K
	 frkloTblsw/yWYtcttmoEXxpB0d/oMxtmtQPapswvaomT12nRdkfjqLylNkkYRw+n2xbd
	 nHoGfk83U0fy/ewWm2+IuYT0F6BjQpmJC8r2ZUtMKpJ3ewzO13IgdgzU6N5QV12f7Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201584;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U88fBYEUYN5OT/6TCcASr7FaH7yWjMN1mU3NJNh3hMs=;
	b=1oqD6ZPzrSo1Vzy/QKFpJ2UCro8bMrzQVOOkMI57yrAMj9zE+SvwTvKLlcc4vrJabpAw
	 VK/cXMNB9mTVxIH09y62VTTqIe+/wW9WOqLvbsI9hsQ1HoZ0T/NMbWOUC1D/91rPPGI4n
	 TIwzoiJpArYk7imqEfSNomkFzR1zzfonBW++bm2JSRLw5xMxFgf5VugTIUeXwXYDr0D+z
	 BjvMZvWS+9R97quNPZgB46oOfr2KBpOaNkmGJAd0sHmkMiMp7MrgH/ROGgZyTGi5V4psg
	 nC331OHZ9JeWUoaxwXM130wqvpEm/VPO3wyInm0iVr5flYNMc75J4N0r9+uhubpHU1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAO7Grzg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D7606A31C;
	Wed, 28 Oct 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAO7Grzg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64C31F01825;
	Wed, 28 Oct 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201583;
	bh=U88fBYEUYN5OT/6TCcASr7FaH7yWjMN1mU3NJNh3hMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAO7GrzgGnJ8o4pOAB27C6V+0eq5cOgABgjosrfUGqN4+UWbdqpxIU2+7BxV0DPaQ
	 WG755PWCKcKHkcG/VoB6TmfBaWqyZCDDM5TlcN1L1gAtCcbWc8EPdvhAJ6rkEZY+JF
	 TelRh1mFJaORQqhSnFFZAavolnRBZ2KFcsOxX3h3Z6uwhQ6XArrM6ejJvDELIbjnok
	 VO4EF+hs8Tifo0VLqMZGiikDKt6BeJc5xHgWZn78BrjbMRU45eJ3Ep5l4sjqXKKQya
	 AejfMm4+MUMP06f9NU0iTRaruZhw3i2AucTWLpJbMQiOuzWsMh6doZ+kklE0sM0EH5
	 DBrsBHvEfZ+cw==
Date: Wed, 28 Oct 2026 09:33:01 -0600
From: Keith Busch <kbusch@kernel.org>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, kch@nvidia.com, hare@suse.de, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] nvme-tcp: validate TLS handshake timeout
 parameters
Message-ID: <auIVrTJVjWk8rvNc@kbusch-mbp>
References: <tencent_8B4F08A2DD4BB093ED7FAECFFD20272B3C07@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8B4F08A2DD4BB093ED7FAECFFD20272B3C07@qq.com>

On Wed, Oct 28, 2026 at 07:57:18PM +0800, Yingjie Wang wrote:
> The NVMe/TCP host and target expose writable tls_handshake_timeout
> parameters as signed integers. Both paths multiply the value by
> MSEC_PER_SEC and HZ before converting the results to unsigned timeout
> types. Large positive and negative values can therefore give the
> handshake agent and the kernel different, unintended timeouts.
> 
> On an HZ=1000 kernel, setting the parameter to 2147484 overflows both
> multiplications. On the target, an accepted pending request can queue the
> timeout work on the next timer-wheel advance while the handshake agent
> was given about 24.9 days. On the host, schedule_timeout() can report a
> wrong timeout value with a stack dump and fail the handshake immediately.
> 
> Make each parameter unsigned and reject values that do not fit both the
> handshake agent's millisecond field and a safe jiffies delay. Read the
> parameter once per handshake so the two timeout mechanisms use the same
> value. Also keep the host completion-wait result in a long: a successful
> wait can return more than INT_MAX remaining jiffies for an accepted
> timeout.

Thanks, applied to nvme-7.4.
