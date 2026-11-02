Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793642052;
	b=qD9/gRuQIXkptjrInqo+RXDrzyZL0DEcO3sGyMimZeM/PpD6ThkhxKUhD9OgDi+fORhG
	 ozD+3yqqUwz8FS5n7cer1NtZ2xFIDPGNc9hNVo2JduMKStpPm3r1+N5U6Kw4DxWa+JJsJ
	 bJm7pxIHwrBJv6YxF9AjoxdXCUx0IC+2dkylajB2RmlHLX+/ygl36gny42omB97+KI6F0
	 Gmk+N139FmPNjaa3r0MN5A42muOnGxc1aI143vp4c+CMrbzfuQwqIuqFspuPvM9eYRnMs
	 lKv/XoaWkyLDiBRPTVf7WizBUdLITeypPbOzfkrgy2vuqRGhBP8ovxQXqFSWJM1A/sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642052;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ddzdqjxBTDxeJsbhbu2YASzAP0Fo2U89/OIWzU554p0=;
	b=33ipdJ0xkrSA7CB+ki1qNNbo0Y7uLmYa1Js294fwmNE3vlZ+Esnz7i4uZ8gZdkAuHdYu
	 rsBALK89GqmXuDNoGs+COJXO/m7XLbHIcgdLq/tUotiQihgmLTLg0Yos3/F72A1volChi
	 HomD/+//Oki7WIRpmvR5AjU5JTIjVMMd+ZDyXSqnbITCZf+r8e/0GNaGGUEa7PVaNcsBP
	 oomuDVIjrxNpkqGvGPW7btADoh3wCC0H2wAS3N21QDEEjCtwtGeegvbBwOzXBIYKQiaSK
	 NrqFMh7K/lrSojOE+t1Ya9PaVL+2S+FFH8JGKv4UggpPkK6K6kbZV0yEafJbIYSA17w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eUakllWU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65018606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65018606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=eUakllWU
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6852120154A;
	Mon, 02 Nov 2026 18:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793642044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddzdqjxBTDxeJsbhbu2YASzAP0Fo2U89/OIWzU554p0=;
	b=eUakllWUnyYPcZm2Za+GfQyd15Tb9Z61T3+wxzxvwI7ANEbke2zk5nb9xjG+0Js9ZE0CfL
	1J56XlfzVexlgSCM1ca/mGiD3EGuqRy6w7Cr/2MD3deUBI4bZnYHxWsec2ixEXN+Uuce3Y
	FEZzfUgs/37L9xbcNto0FYePQqJDLo0adfsDOesMg+bZJc4CZF80BZEw2REEFKbziGKDbD
	x2NzV684eLzL9ZE+aXATXl0sJ46G0zyfgp7ecCds+MXcRvzQIxPjS/xMWT++7K28JEsygg
	ZE+X2AEClR1LcAzt+9sIhvSKiHL4pEqZ0r6vA8pYNhEJUGiqFFufbdTfsr62aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793642044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddzdqjxBTDxeJsbhbu2YASzAP0Fo2U89/OIWzU554p0=;
	b=fVe8/jh/oIDeQlY2dyKRAsrqEN9ikE9HK0AWLHCsbRPALZxcV+r5PbQHRqgStmE4Nv6hbX
	tl3Rbr45Ny+ttlm9t9B6xxD0jiZI5SJ+7L7wIwChNwpZ6b44HA6rRqy6S06HDj7hReQNIk
	1/4hAM8Z/N1aFNQAi48vB3eooA0m+A83AMScZWyPFWT2AvCg3OswkTI5/kwbmvXLaLNj7u
	I7kXrCralxmfiqRh07NTtx5+mOkpuQSPNkRsiW0GkO3blw2C/iZQvLNN57cUsbDuh7fvUq
	5BCUkk08eC01ZMS+Q+Q22LSqf+wsiXh4D3qL6Rf8fUh4VYvsMUHaz38C2REIBw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793642044; a=rsa-sha256;
	cv=none;
	b=Ze35U9smON41U9aJolxWI+i9ypSpS6GyhWoP4gwgkqLlMQhekB9xBPE75/EN0S4b7cMNKa
	D6Yju5fK5LtLoyG1jaxS76asbX0FYKWR5DyYZ3zUzAx6AHHvDtRiEGgupJF3UadT4hGmnP
	GnN0YKbg+XIC3jVvW+KdecvucjsUncqOdm8SIRDV/nrlZwLPuVRuTP2a0z/dvnYrCJWBsF
	67YY1vOaFHYVYVxvLGZL3G7tfZGoeIvHDTsVbJyLo6pzk/DwLU9tunoXK2iew3DG6esrPY
	jdFRiSwCyIkHI851IjRbqTbPUH2/0IQyAdlzIHgGOWyMCYYWdvEqnw4+atxioA==
Message-ID: <22d1be8d02ead0c4b669f33bb972da9834027baf.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: Fix circular locking dependency in
 reset_controller_unregister()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 18:54:04 +0100
In-Reply-To: <20261102155840.20376-3-tzungbi@kernel.org>
References: <20261102155840.20376-1-tzungbi@kernel.org>
	 <20261102155840.20376-3-tzungbi@kernel.org>
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

On Mo, 2026-11-02 at 23:58 +0800, Tzung-Bi Shih wrote:
> reset_control_acquire() and reset_control_put_internal() acquire
> `rcdev->lock` inside the `rstc->srcu` read-side critical section
> (`rstc->srcu` -> `rcdev->lock`).
>=20
> However, reset_controller_unregister() holds `rcdev->lock` while calling
> synchronize_srcu(&rstc->srcu) (`rcdev->lock` -> `rstc->srcu`), causing a
> lockdep circular locking dependency warning and a potential ABBA
> deadlock.
>=20
> Run synchronize_srcu() outside `rcdev->lock`.
>=20
> Fixes: 44a0acb2caca ("reset: protect struct reset_controller_dev with its=
 own mutex")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Test:
> With "[PATCH v2] reset: Add KUnit test cases"[1] applied:
> $ ./tools/testing/kunit/kunit.py run \
>         --kconfig_add CONFIG_RESET_CONTROLLER=3Dy \
>         --kconfig_add CONFIG_RESET_KUNIT_TEST=3Dy \
>         --kconfig_add CONFIG_PROVE_LOCKING=3Dy \
>         --kconfig_add CONFIG_DEBUG_KERNEL=3Dy \
>         --kconfig_add CONFIG_KASAN=3Dy \
>         --arch=3Dx86_64 \
>         --raw_output=3Dall \
>         reset_test
>=20
> [1] https://lore.kernel.org/all/20261102155207.19252-1-tzungbi@kernel.org
> ---
>  drivers/reset/core.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 1f6d7ef48a67..a36a4d6ff445 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -179,6 +179,7 @@ static void reset_controller_remove(struct reset_cont=
roller_dev *rcdev,
>  void reset_controller_unregister(struct reset_controller_dev *rcdev)
>  {
>  	struct reset_control *rstc, *pos;
> +	LIST_HEAD(reset_control_head);
> =20
>  	scoped_guard(mutex, &reset_list_mutex)
>  		list_del(&rcdev->list);
> @@ -195,12 +196,22 @@ void reset_controller_unregister(struct reset_contr=
oller_dev *rcdev)
>  		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) =
{
>  			kref_get(&rstc->refcnt);
>  			rcu_assign_pointer(rstc->rcdev, NULL);
> -			synchronize_srcu(&rstc->srcu);

Now reset_controller_remove() can be called while a concurrent reset
operation that got an rcdev reference just before the
rcu_assign_pointer() is about to enter a reset_control_ops callback.

>  			reset_controller_remove(rcdev, rstc);

I think this should only do the list_del(&rstc->list); ...

> -			reset_control_put_internal(rstc);
> +			list_add(&rstc->list, &reset_control_head);

... which could be combined with this into list_move(). That would also
make clearer what happens here (move into a temporary list that doesn't
need to be rcdev->lock'ed).

The module_put() and put_device() calls should be deferred into the
loop below, after synchronize_srcu(). We don't make it possible to
unload the reset controller driver module until then.

>  		}
>  	}
> =20
> +	/*
> +	 * Run synchronize_srcu() outside rcdev->lock to avoid a circular
> +	 * locking dependency with paths that acquire rcdev->lock inside
> +	 * the rstc->srcu read-side critical section.
> +	 */
> +	list_for_each_entry_safe(rstc, pos, &reset_control_head, list) {
> +		list_del(&rstc->list);
> +		synchronize_srcu(&rstc->srcu);
> +		reset_control_put_internal(rstc);

This shouldn't call reset_control_put_internal(), which is supposed to
be the common internal implementation of the consumer
reset_control_put() API variants.

Rather, I'd prefer this to call ref =3D kref_put() directly and then put
the "if (ret) { ... }" part of reset_control_put_internal() into a
separate helper function that can be called from here as well.

In case the revocable series gets accepted, this might turn out to be a
non-issue though.

regards
Philipp
