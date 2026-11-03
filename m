Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701323;
	b=s2bm+g4iIdEiskfNLjkLH5qrr068MthEMtY9pX7OcBN4CQ8d/nkI2N4x3kLwnxRVOVTw
	 jtmDaOISibJeAEgtFtlH4/oyjvud3lZEraWXMQTCCPk6kg+ryCK9gu9LHef5BYCLR932D
	 WX16HUAbBBaAasqyGyUzgXaLL7htvCfU1g+L1U+jX723A55ZLih55ty2dDvpaiVyoXpV+
	 ZM2RgQ/xfLZeSAgmCjigob8JswFDmA1xCAxeAj3opoJTc8QGl6DEQpqMZEYRVTq3fGRcQ
	 RRB9gNBmo9PAfSU4ZyW+fQs7Ydby/Ac51fj3UeitNwRfj0e8XkfU8AzpRwqIB6/AtIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701323;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=+QaWJ5XuuUWt8kLhoR+LPkBukE/7L+BqVvrpm352Puc=;
	b=ze21TdQEJtDbi07frtoh9fVxwPVBKdepY0Y0pfWKQyWDVOVDWbDqH7LU5p+OKK7SE6pf
	 UTFwn2nnYJf9B0qqgBGZzgCBhR9MKQmX3gn/L3RBbw4uaRY/lxGxxeIYwauTBJ8a5ewzV
	 uXv9uKj4X5XHsLNa4A8P2QZO61NjYm4NXjB+UDCDGwgje9Cp8f3Yj2YOBAlWaiLTCKQy3
	 /DF39SIf8v/Ne70dJ2t7fvnrBDmDVUg/JZPoTUxXoQtmOyZXXJbXQ9rXfZjupqRFJCNKB
	 h66sLHmkXTs+Qam064hv08YpbqeGwdSSH/gO7xewRXCDX7FKuFNea2UTtqX7RZLyTVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XHkKpfO5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6F606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA6F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=XHkKpfO5
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CA041200318;
	Tue, 03 Nov 2026 11:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793701313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QaWJ5XuuUWt8kLhoR+LPkBukE/7L+BqVvrpm352Puc=;
	b=XHkKpfO5aT1X4oy1mX3lecbImJyZJ3+U7RbgruV9RfIzs3DaCNp5bkJwZRGZfo4QgTXS1s
	I9W5HYjK8fobYAV3VwCnQgtIpe6xiYOaimT5v341YSH01ic2snrcmElxSh+TNrk9OW+61Y
	LZyWe8jaP0X0OdIURCvqjhUspNCweiNEsj94gDzxgX5dGF4xcPhfNbP2+KmjZaA5YJWoNj
	wfq9JVuV06gms06VK8V0HqYUE4+SY7m5XlRdrjAgxtHxJKKWZB0ztxSHF1cHpmRnVRaLXk
	l1HTNSDh4PXJs2UL5TyERY86k7rZupxmwzXuff/t6Lyc2xopofB0oU5wxeU2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793701313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QaWJ5XuuUWt8kLhoR+LPkBukE/7L+BqVvrpm352Puc=;
	b=I9J7TKLvxQiZFhB2s4hGZt3z0OiInPmy3QWDuMNJjepYwVBx0IPTgQr6iams4mubujGHrb
	kvibOGmz5nNUyufIcriQ1VvRkzNdVSJBJ39Wcd2g3JUROIEjnzp3lWgwDZwfr82AtMAjLn
	d1GmjfTWGAW20ZfgXHOalVH21mJaTTLV1L2p/BcumBGPnWXY/fA5YlXKfL8cM29TYu6ZJM
	lgAsAGd16llA0iuV4qx9wMFDlAL4R82lZNACMbJKtnkM20TwK6TC3nOnNBjGKTt29X7aZe
	x9PBykx7NO6R/bU6cSfQ2iDCsMyfu4NZ/yFzTN/uE25pa9651Ok2CtgXkHK1iQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793701313; a=rsa-sha256;
	cv=none;
	b=DLzoq2LwnZMP/o3XI46iUhsJhiPhwCNCP2MeI7HDeiGuOvx4eLMCXWpq7/6/9W+aUQyflm
	/iEtjukuP32W+1LEh4iTkDdDADVTFQdeSiRg8eyDRvhkQNq4rxCw6sAfbPWb2EvOhaEPFx
	YNu6fWFN3RuVje73YuIzXGCRGPk9o4RA1soBzXN/DkU2jN7RKQ+zSyAaZ9cHwOfmdjRITL
	3uyaUlzlgIaLmHVgrd+oB3TWDpQXDLc09mCK0dUZOcs5V8j/EnLE6AkdXT+OFbAPwoeg4N
	81b5nCh/4jou8fbeTXT0Od5PLtFtuBUMtvW4QIN8y10ZZjg+eYdxk6mPgCSyyw==
Message-ID: <48d7459fc34adac1ac614e79d9930902345759d2.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: Add KUnit test cases
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 11:21:53 +0100
In-Reply-To: <20261102155207.19252-1-tzungbi@kernel.org>
References: <20261102155207.19252-1-tzungbi@kernel.org>
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

On Mo, 2026-11-02 at 23:52 +0800, Tzung-Bi Shih wrote:
> Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
> nodes"), reset suppliers and consumers can be wired up using software
> nodes without requiring Device Tree or hardware devices.  Leverage this
> to add KUnit test cases for the reset controller framework.
>=20
> The test cases cover the following scenarios:
>=20
> - Basic: Verifies that a consumer can acquire a reset control via
>   fwnode and perform reset, assert, deassert, status, release, and
>   acquire operations.
> - Use After Unregister: Verifies that after the supplier unregisters
>   the reset_controller_dev while a consumer still holds a reset_control
>   handle, subsequent consumer operations fail safely with -ENODEV.
> - Concurrent Unregister: Verifies that unregistering the
>   reset_controller_dev concurrently with an in-flight reset operation
>   waits for the active operation to complete before returning.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Test:
> $ ./tools/testing/kunit/kunit.py run \
>         --kconfig_add CONFIG_RESET_CONTROLLER=3Dy \
>         --kconfig_add CONFIG_RESET_KUNIT_TEST=3Dy \
>         reset_test
> ---
> v2:
> - Separate out from the revocable series.
> - Add reset_test_exit() to clean up rstc and rcdev on test exit or
>   assertion failure.
> - Clean up kthreads on error paths in reset_test_concurrent_unregister().
>=20
> v1: https://lore.kernel.org/all/20261011121246.162759-5-tzungbi@kernel.or=
g
> ---
>  drivers/reset/Kconfig     |   5 +
>  drivers/reset/Makefile    |   2 +
>  drivers/reset/core-test.c | 351 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 358 insertions(+)
>  create mode 100644 drivers/reset/core-test.c
>=20
[...]
> diff --git a/drivers/reset/core-test.c b/drivers/reset/core-test.c
> new file mode 100644
> index 000000000000..613db78040c6
> --- /dev/null
> +++ b/drivers/reset/core-test.c
> @@ -0,0 +1,351 @@
[...]
> +static void reset_test_concurrent_unregister(struct kunit *test)
> +{
> +	struct reset_test_context *rtc =3D test->priv;
> +	struct test_concurrent_unregister_context *ctx;
> +	int i, ret, val;
> +
> +	rtc->rcdev.ops =3D &reset_test_concurrent_unregister_ops;
> +
> +	ctx =3D kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +
> +	for (i =3D 0; i < 3; ++i) {
> +		ctx[i].test =3D test;
> +		init_completion(&ctx[i].started);
> +		init_completion(&ctx[i].enter);
> +
> +		if (i =3D=3D 0) {
> +			ctx[i].thread =3D kthread_run(
> +				test_concurrent_unregister_supplier, ctx + i,
> +				"supplier%d", i);
> +		} else {
> +			init_completion(&ctx[i].entered);
> +			init_completion(&ctx[i].exit);
> +
> +			ctx[i].thread =3D kthread_run(
> +				test_concurrent_unregister_consumer, ctx + i,
> +				"consumer%d", i);
> +		}
> +		if (IS_ERR(ctx[i].thread)) {
> +			ret =3D PTR_ERR(ctx[i].thread);
> +			while (i--)
> +				kthread_stop_put(ctx[i].thread);
> +			KUNIT_ASSERT_EQ(test, ret, 0);
> +		}
> +		get_task_struct(ctx[i].thread);
> +
> +		wait_for_completion(&ctx[i].started);
> +	}
> +
> +	rtc->priv =3D &ctx[1];
> +	ctx[1].expected_ret =3D 0x12345678;
> +	/* consumer1 enters reset(). */
> +	KUNIT_EXPECT_EQ(test, rtc->reset_count, 0);
> +	complete(&ctx[1].enter);
> +	wait_for_completion(&ctx[1].entered);
> +	KUNIT_EXPECT_EQ(test, rtc->reset_count, 1);
> +
> +	/* supplier0 unregisters. */
> +	complete(&ctx[0].enter);
> +	ret =3D read_poll_timeout(reset_control_status, val, val =3D=3D -ENODEV=
,
> +				1000, 100000, false, rtc->rstc);
> +	if (ret) {
> +		for (i =3D 2; i >=3D 0; --i)
> +			kthread_stop_put(ctx[i].thread);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +	}
> +	/* supplier0 can't exit.  It's waiting for all consumers. */

This comment looks like an untested assertion.=C2=A0For all we know,
reset_controller_unregister() may have already returned by now.

How about signalling a completion "ctx->exited" after
reset_controller_unregister() returns, calling
wait_for_completion_timeout() here, and asserting it times out?


regards
Philipp
