Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792589067;
	b=FEsdkXGwFzrfGKJeKAFJV1WC6glkKAB8Yl1zgZNQeJErIKvmvPxyOGnp5nq4p5TzWLsa
	 gjloSPWYFHqkT4XMD3xlMVfAt8HusTBqDIfPXe7WKcMHgDQhsuEVLEKgn2dF4u4nQqvcY
	 jh2hBl/6ePnSk7vln4nu1fQqAp7rm6CsZIWgfNypyewxvK19NA4bTPWNJPqCLPRPqlmJJ
	 0NOc8CDZ1E95WNRrcdDCqQXgrjhAXwjrbDNxp4E3lN542Q89Q7EzPqSegbHEP4IK5Ap6g
	 5iQcx4i6cy5ORLl4ZbZfj1XWV2LytygPQews3R2sFRJ5iSIqg1e+IRGPquqclJMQ9fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589067;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=QWlbQkZ52E+yQp842lt7Y7wEmZewPlzvIVyMCCF3inM=;
	b=Deoi8hNCmtVSSabdsco7VJ9akdRpJjW6kgdkwEsUGitUWEmXH5009onP6LE/14HYP002
	 6ZLq77/P/4kDEGz/PWauB78rGLB065+t1UP0uPdmjkP08X+ttgOuqJxJNAx4da23CGD8u
	 EUHMyYatB1/Kv1KdWqZhhPJ/2oTq4f6HYBMpBr+HVkfNnWirc3Ycx3QXHizoIEu1eZNjx
	 DnBl7JtimHsjpVa/O5lvhawVCnW7fC7bQux/QMtKVehBBqq82B8z8Wp2MO++XBty+/vBn
	 73bXvI+m2zpTr9kmwits6tJpUJaXy+8s7zSs+j126AiTQQixhwXpffjJhtzCTZIZXig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CcezYVkU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3F606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A3F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CcezYVkU
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E3F37200F26;
	Wed, 21 Oct 2026 15:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792589063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWlbQkZ52E+yQp842lt7Y7wEmZewPlzvIVyMCCF3inM=;
	b=CcezYVkUzLiwnNxLGAUUxpqDI+n5JSK0nB4Gf7mLeCv33Jzu5KSrs6qBZn4u0t/aVKvXxq
	fO4tvS1nH7ej79eG1A6HUNR9LU6Upb9WtQPhqqSIAozR1fE9DNG8syRq8TDKzEsGgMPONj
	3JDD8MdcNKKXZUyJMuHxCtBDZUph9KeXYbTk+NPpjYjox2m0MnTv6/XM6+6FR6V6Bxblx4
	0PLGOVZJ3JpUqAAgMA2TjcrwWQuvjfNs1EyKIA7eF3hO3lv5M2jeDfziw2JZ9n0BY3aaCX
	oyTIKBA9WEA6xZ47lszwwKhNAnX9+LRu6T3JOjW8BMRPmHgCR537lV7V9eAgXA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792589063; a=rsa-sha256;
	cv=none;
	b=HqudT7Z80DQ5gw8NEicLSkBWCyFWhaHHzTglX+wzQNJY1e0BY89XHKE+VrJK24+tGVWJ5j
	6xyJ4CyQJgGRjhY2KIadPUYBG/2jLAoEKZLV7G8o+j9/sx/R9EFpjVl4gMsTuId2fBQmjp
	YAaZs43pFyTrug7vUpQGQnfNMC1s8ejljYlrTaaP/bR2f3URY7iZBDUa6Q6eBeUk1sCMxY
	KN1B95Ma6vb9TEbDtiaFCYPhDXMxTJwHLyVq5OoWGY+RC8XRtgzTTQM2a/aEDoc6quvewZ
	iyG48xCuZB9yFPLqzL7XYhIhC3H1UdHaAWY6SgbQ6bucfMrROqHEcQ/C3+3qjA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792589063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWlbQkZ52E+yQp842lt7Y7wEmZewPlzvIVyMCCF3inM=;
	b=ImbpkUQro4j+/Ubtdeg/U6UvqmjkgGQ8kH5I/dLZKsWJOlhwpWoF/bilniR1PuVyrtHY89
	YlDXU7QiHxKzLE1z/j5E5GoqXS1c8VStUl+/vDTCj7mvpHmIpW5ytAtpaP1gPLnjQTfavZ
	x+2gSStk0wouIJwH5FddD/2462HprTKptHVfybWO2J6aYpznEj9PRgVmFmDdXl08S6KnGf
	ztfV44AHczvZ1+XkWYqjNyKJSX9undGemzwHOEKxZrWATuhPTl6XJTDeR/4Dpp5EVfpnXu
	uujBoVbF4bTe/4cYErPJxV3WwDmtKjiq/USQKd8pMzxm60rfBoIPTZMWEXt+4Q==
Message-ID: <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Date: Wed, 21 Oct 2026 15:24:23 +0200
In-Reply-To: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-10-21 at 11:09 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> reset_control_deassert() and reset_control_reset() are documented to
> guarantee that the reset line has been deasserted, respectively that a
> reset pulse has been issued, by the time they return.
>=20
> For a shared reset only the first caller runs the hardware op; the other
> callers just bump the refcount and return. When the op can sleep this
> breaks the guarantee: a second caller can observe the bumped refcount and
> return before the first caller's op has finished, and then touch hardware
> that is still in reset.
>=20
> Add a reset_controller_dev::can_sleep flag that a provider sets when its
> reset ops may sleep. When it is set, serialize the shared refcount update
> and the hardware op in reset_control_reset() and reset_control_deassert()
> under a new per-control mutex, taken inside the SRCU read-side critical
> section. Providers that leave the flag clear keep the existing lockless
> path, so callers in atomic context are unaffected.

I think this paragraph should go first.

> Set can_sleep in the reset-gpio driver, which drives the line with
> gpiod_set_value_cansleep() and may therefore sleep. Other providers whose
> reset ops may sleep still need to opt in.

Please split this out into a separate patch.

> Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")

This is a partial fix for an issue introduced by 0b52297f2288, but only
for reset-gpio, which didn't exist back then.

On the other hand, the patch doesn't apply before commit 8c91302a29bc1
("reset: protect struct reset_control with its own mutex"), which only
allows this to be trivially backported to v7.1, with adjustments needed
for older kernels.

The commit this is supposed to fix, 8a0de73cf9dc ("ASoC: ak4458: add
optional reset control to instead of gpio"), is in v6.2. I'm not sure
if something changed between v6.2 and now that exposed this issue for
ak4458?

In short, do you have an opinion how (far) this should be backported,
and does this warrant some Cc:stable tag?

> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Assisted-by: Anthropic:claude-opus-4-8

Drop, see 1e035297ffda ("docs: remove Assisted-by references").

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> ---
> Changes in v3:
> - Drop the reset_control_reset_atomic()/reset_control_deassert_atomic()
>   variants and their reset.h declarations/stubs; gate the mutex on
>   rcdev->can_sleep instead, so non-sleeping controllers keep the lockless
>   path and need no new API.
> - Use a dedicated rstc->shared_lock taken inside the SRCU read-side secti=
on
>   instead of reusing rstc->lock before SRCU.
> - Set can_sleep in reset-gpio; no other provider is converted.
> - Drop the lockdep_assert_not_held() additions and the reset.rst / kernel=
doc
>   text about sleeping-vs-atomic variants.
>=20
> Changes in v2:
> - Serialize only the shared may-sleep path under rstc->lock (taken before
>   SRCU to match reset_control_acquire()'s order); exclusive path stays
>   lockless, and reset_control_assert() is left unchanged.
> - Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic=
()
>   for atomic callers; gate the mutex on can_sleep so no shared consumer i=
s
>   regressed and so it works on all configs.
> - Factor the body into __reset_control_*()/__reset_control_*_locked()
>   helpers, and lockdep_assert_not_held() at each lock site to catch a
>   controller op re-entering the API on the same control.
> - Declare the new variants and stubs in reset.h, and document the sleepin=
g
>   vs atomic variants in the kerneldoc and reset.rst.
>=20
>  drivers/reset/core.c             | 125 +++++++++++++++++++++----------
>  drivers/reset/reset-gpio.c       |   1 +
>  include/linux/reset-controller.h |   3 +
>  3 files changed, 89 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 38e189d04d09..dd6e47163f6c 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -52,6 +52,9 @@ static DEFINE_IDA(reset_gpio_ida);
>   *                   only used for shared resets, which means that the v=
alue
>   *                   will be either 0 or 1.
>   * @lock: serializes the internals of reset_control_acquire()
> + * @shared_lock: serializes the shared refcount update and the hardware =
op for
> + *               controllers whose ops may sleep (rcdev->can_sleep); tak=
en only
> + *               inside the SRCU read-side critical section
>   */
>  struct reset_control {
>  	struct reset_controller_dev __rcu *rcdev;
> @@ -65,6 +68,8 @@ struct reset_control {
>  	atomic_t deassert_count;
>  	atomic_t triggered_count;
>  	struct mutex lock;
> +	/* serializes the shared refcount update with its hardware op */
> +	struct mutex shared_lock;
>  };
> =20
>  /**
> @@ -355,6 +360,32 @@ static inline bool reset_control_is_array(struct res=
et_control *rstc)
>  	return rstc->array;
>  }
> =20
> +static int __reset_control_reset(struct reset_control *rstc,
> +				 struct reset_controller_dev *rcdev)
> +{
> +	int ret;
> +
> +	if (!rcdev->ops->reset)
> +		return -ENOTSUPP;
> +
> +	if (rstc->shared) {
> +		if (WARN_ON(atomic_read(&rstc->deassert_count) !=3D 0))
> +			return -EINVAL;
> +
> +		if (atomic_inc_return(&rstc->triggered_count) !=3D 1)
> +			return 0;
> +	} else {
> +		if (!rstc->acquired)
> +			return -EPERM;
> +	}
> +
> +	ret =3D rcdev->ops->reset(rcdev, rstc->id);
> +	if (rstc->shared && ret)
> +		atomic_dec(&rstc->triggered_count);
> +
> +	return ret;
> +}
> +
>  /**
>   * reset_control_reset - reset the controlled device
>   * @rstc: reset controller
> @@ -362,6 +393,9 @@ static inline bool reset_control_is_array(struct rese=
t_control *rstc)
>   * On a shared reset line the actual reset pulse is only triggered once =
for the
>   * lifetime of the reset_control instance: for all but the first caller =
this is
>   * a no-op.
> + *
> + * After calling this function, the reset is guaranteed to have seen a r=
eset

s/reset/reset line/

The sashiko bot constructed an unlikely but theoretically possible
scenario that requires to lock _assert() after all:

https://sashiko.dev/#/patchset/20261021030925.3543841-1-shengjiu.wang%40oss=
.nxp.com

Disregard the other issue, deassert_count leaking on ops->deassert()
errors. It is pre-existing and can't be as easily fixed because
consumers adapted to it.


regards
Philipp
