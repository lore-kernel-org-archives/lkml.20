Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9728B7C8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898031; cv=pass; b=D4HL50fDqrPjdmKkGCte3g5Wuxl5WndhlfuK0v+y7fz6K9AdzrRrwkdnesIrj+zCwj4XQOXV17SgmB8eRu5rgkmxPEAhEh8TxXhJzy5z8eB3ZAIw19f1o99FQXdGZdfMsjK0C1OSkHZljd0ugM0iOGI2Lt7zKgQvbhxxPXGHSSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898031; c=relaxed/simple;
	bh=vNg10Zs0U71fQcTWh5j7vYz3VG17QiwYWRRRoSBuvTA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SRh8EZT1wwInR5HVZupcUwyUewy+0tqH86n5NueH2abswQh9ci9uTdwrIdOBoYkQjiiAMXU9VBrJO1ceJcYPd0LiwgfueMW3haYSywiJpO+huWIY1Stm9MFgaeyRqhzhGrTybC7zYylYdO9YW/ZZpdPcTixl7uvIEDpCgNNTi4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=fDkVRhNC; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="fDkVRhNC"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B061D201F04;
	Tue, 13 Oct 2026 15:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791898026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCai2Ss2YG9oOBBZ9rE7WbHqS7hx8a9sleJxftTwkQ4=;
	b=fDkVRhNCNhMVvwhdwGAMIxJRX5pLi/T3wW94APSwkuJZRT8LfC8ZCAoeWdPRgbhvfr2DZQ
	iNsqX4wH3lqz9OO0aSs3xjUfyBYJ4xrngCql+0qxylYmYLceDrNQKE/MjfU6heOcAsDmBb
	tmrk2xQ2ot7W2dpfHLRnOkdvUcfrmztxNUHfogEXtV/HPmkUvHRRAs+dOZ4fl6ahcoA6PQ
	IIM9oXzTFqKP6Z0KRy0Q9e3S5af/nFPMQ9bBcjlQP0raqPlTUfEWXTu2sgKySGlvJlvE1q
	7UEu73GWq+YNH9d4+8QJgDn/RxxDzOLBFqQY36rJrPYGNE5tW0jPKOurYPNj3g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791898026; a=rsa-sha256;
	cv=none;
	b=FwcBp50YRQYZxaTOyCtixEaAb/mW8ozKZUebaJBpkGlV3v1uzBc0xv0yecSL7/1nf64O8J
	1aJKpDfQLeoCNkf0mSITOVQRCCo0nS/Bx92H81I5vNbqBg/so9b9YreJHdRJAKBMA0qus9
	VIlIXh+1yMUEc5Hv8sMUlBms1f0dq1vyqCKglRA81taV/12vn64f/JB4FXfiWlEbTU4ydl
	rCBEt5j7n0bpROPqABXhrK54wkFs+jjkTZebMENgsbupLdAfQl4OcrUxJVGYMgB4WTdkoH
	jOvKt41BFMHx2GTc2OTAK9kVc5S8H8UTrk6SUxCsD4fSSGU4qEwzoVsLd2vshA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791898026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCai2Ss2YG9oOBBZ9rE7WbHqS7hx8a9sleJxftTwkQ4=;
	b=Y21tOSHIRH68bqinoaQeD2G17+LdAN2i1gKfk31mmMuHGlzp1kxnVEbaZ5GjmWIzZHxTuW
	gcRVrd1Tehla5RyuB4fXAcKxU8EHYA1E3gfr92saUZVBgkIQZZf/Uhn1LjAFtzmmrXf+PA
	62m2iwHJc6YiiKfOpaksSs3O3KwU7d2cMeUlDYgyfZzvtlIG9OiVsKMUlB0qznEbGjy4tZ
	gUX5AR5LqxEjip+Fu11J58xYvdM4I0lns25MeEg1bh5sqKJGKLvlm1OKeSvOdUxVzs+ajV
	yG1dmAqbW0B3JUNX87ph3nrzvCte2TIDSyHiHaPEQJlf//ju3SbinLFtEtS18Q==
Message-ID: <0f34ec3308f8eca73c949f8c40d47564f6136efd.camel@pengutronix.de>
Subject: Re: [PATCH] reset: core: Serialize concurrent assert/deassert/reset
 of shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: shengjiu.wang@oss.nxp.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, 	broonie@kernel.org, alvin.sipraga@analog.com
Date: Tue, 13 Oct 2026 15:27:06 +0200
In-Reply-To: <20261013101947.2478989-1-shengjiu.wang@oss.nxp.com>
References: <20261013101947.2478989-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Di, 2026-10-13 at 18:19 +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> reset_control_deassert() is documented to guarantee that the reset is
> deasserted after the call returns. For a shared reset control only the
> first caller runs the hardware .deassert(); all later callers just
> increment deassert_count and return immediately:
>=20
> 	if (atomic_inc_return(&rstc->deassert_count) !=3D 1)
> 		return 0;
>=20
> When two consumers of the same shared reset (for example two codecs that
> share one reset GPIO) call reset_control_deassert() concurrently, the
> second caller can return before the first caller's .deassert() - which
> may sleep, e.g. for a GPIO-expander based controller - has actually
> released the line. The second consumer then proceeds while the device is
> still in reset, contradicting the documented guarantee. The assert and
> reset paths have the same problem: only the first shared caller performs
> the hardware operation while concurrent callers return early.
>=20
> Serialize the shared refcount update and the hardware .assert()/
> .deassert()/.reset() under the existing per-control rstc->lock so that a
> second concurrent caller waits for the first caller's hardware operation
> to complete. The lock is taken before the SRCU read section, matching the
> ordering already used by reset_control_acquire(). These paths do not take
> rcdev->lock, so no new lock-ordering inversion is introduced.
>=20
> Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/reset/core.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 38e189d04d09..7536b61cc5df 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -51,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
>   * @triggered_count: Number of times this reset line has been reset. Cur=
rently
>   *                   only used for shared resets, which means that the v=
alue
>   *                   will be either 0 or 1.
> - * @lock: serializes the internals of reset_control_acquire()
> + * @lock: serializes the internals of reset_control_acquire() and the
> + *        assert/deassert/reset of shared reset controls

The lock is also taken for exclusive reset controls.

>   */
>  struct reset_control {
>  	struct reset_controller_dev __rcu *rcdev;
> @@ -382,6 +383,12 @@ int reset_control_reset(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_reset(rstc_to_array(rstc));
> =20
> +	/*
> +	 * Hold the lock across the shared refcount update and the hardware
> +	 * reset so that a concurrent caller does not continue before this
> +	 * caller's not-yet-finished reset pulse has been issued.
> +	 */
> +	guard(mutex)(&rstc->lock);

The current wording of the API documentation does not require this, but
it clearly makes no sense that the second of two racing
reset_control_reset() calls on a shared reset control can return before
the reset pulse has finished.

Could you update the kerneldoc comment, for example add "After calling
this function, the reset is guaranteed to have seen a reset pulse at
any point in the past, not necessarily during the function call." to
the shared reset paragraph?

That being said, this is not required for exclusive resets, and I think
there may be users handling reset controls in atomic context.
Unfortunately the API never explicitly declared that
reset_control_assert/deassert_reset() calls may sleep, and this just
happens to work if the specific reset controller implementation doesn't
sleep.

I'm not sure what to do about this. We could split the shared and
exclusive paths and only lock in the shared path, or fix the atomic
users, possibly by introducing
reset_control_assert/deassert/reset_atomic() first.

>  	guard(srcu)(&rstc->srcu);
> =20
>  	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> @@ -503,6 +510,12 @@ int reset_control_assert(struct reset_control *rstc)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_assert(rstc_to_array(rstc));
> =20
> +	/*
> +	 * Hold the lock across the shared refcount update and the hardware
> +	 * assert so that a concurrent caller does not observe the line as
> +	 * released while this caller is still driving it.
> +	 */
> +	guard(mutex)(&rstc->lock);

Nothing in the API requires shared reset_control_reset() to be
serialized, why is this necessary? The comment doesn't make this clear
to me.

>  	guard(srcu)(&rstc->srcu);
> =20
>  	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> @@ -599,6 +612,12 @@ int reset_control_deassert(struct reset_control *rst=
c)
>  	if (reset_control_is_array(rstc))
>  		return reset_control_array_deassert(rstc_to_array(rstc));
> =20
> +	/*
> +	 * Hold the lock across the shared refcount update and the hardware
> +	 * deassert so that a concurrent caller does not continue while the
> +	 * line is still asserted by this caller's not-yet-finished deassert.
> +	 */
> +	guard(mutex)(&rstc->lock);

Yes, this aligns the function with the documented intention for shared
resets. The above points about exclusive resets also apply.

regards
Philipp
