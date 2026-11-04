Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808287;
	b=uL4gyambgb85/t/j+q9HWUjaUd5NNgpzPNPPsoFv1MkhB+lx9NkuJk8htcTUtz8YCQuI
	 UFMlpa34TshXdobG9dNUUzK9h2Dvg28IgpasEgT+N/8niSDwp5c8Vqwydlvb3PmI8idyE
	 nCzk+o5tGTd0cxT8hSK6TJAlG1h2BnMm1BWHooWbAk5Ksfp6kI7B/P2b8RwfljvaN33zF
	 HGP66WZa7yAMMpNMnzaFKiWo7AVcD9jIoMxxVt2s6gaNa+u2ZoYHfesP4ICpRBGLr+T+h
	 MhJ3Txpg5b10XsHta4S+vAlHFdKrbs/Z+uRg/Ji7Nzpeg9AjXfD1yyrrCLkEa4ykMDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808287;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=nRc7eatJO7I+eQckUt9MlTnPkmygtBXlxBL+jP5SyBg=;
	b=FczdgmAp0yKih+o1cAVpWQvngG2BFBXfYeDGzznvK0RNNvuLnFNu3VV7OzfD3FwSnfRA
	 LfWUwAhmMzJDXdFT+xJiNdk/KbQGX4jYx6WUUxmWTofHT8sSJI0BG8kgiFyo1gNGei/0t
	 jlSGYM17HmAf8EtdQkDtN97fGxBj9ZDg+FdZAn3nXpdPaRKlLQ++D8+4kEpQhu7TJdODy
	 XAWDZKjIOBXFexU3D0JbJ+H3mTAh8E41IRsYKkFF6G82QuvbA0/sXHUov412kZ3HQDEVd
	 a+Ee9n4MTdvlGlsY3JNF1fRcZdFBjRkqJDmgH+MdSdOftFi8KvGeL2c9OMDJqPAQ93A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8tHR2vm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C64606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8tHR2vm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2561F00919;
	Wed,  4 Nov 2026 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808286;
	bh=nRc7eatJO7I+eQckUt9MlTnPkmygtBXlxBL+jP5SyBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8tHR2vmvNRxOttvMZOfsFj7Z+aW++rQq3etCxDQX/UEo9qVXr8gvmkDx5cvTIAtQ
	 KJa4rbaBFrd8uBBeBv8mxB5SGMOpjPfHPkMxdZ79odqox8SQordq6idriZMwuCC8Mx
	 TUTezu+fqeczN9J+TegqL1l84yuEyzlgR4yJIOuHezgo95fqmz+HX6GWiyb2GAV3tf
	 +oS008+HUfIySF2BqFABpwGND7iaCt9OaGCPSvUVA39V5A9U1lT50oRhNuxPbI8GI3
	 JuKxRN9lwEIWIC+rL4HsU8I9XuuUbI+qQLnMyDPSLo5gVUPGQniImilO8xkmxTVIhJ
	 yHkFzH/9aSsZQ==
Date: Thu, 5 Nov 2026 00:04:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reset: Add KUnit test cases
Message-ID: <autXm2MrAyFAAM1i@tzungbi-laptop>
References: <20261102155207.19252-1-tzungbi@kernel.org>
 <48d7459fc34adac1ac614e79d9930902345759d2.camel@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48d7459fc34adac1ac614e79d9930902345759d2.camel@pengutronix.de>

On Tue, Nov 03, 2026 at 11:21:53AM +0100, Philipp Zabel wrote:
> On Mo, 2026-11-02 at 23:52 +0800, Tzung-Bi Shih wrote:
> > +	/* supplier0 unregisters. */
> > +	complete(&ctx[0].enter);
> > +	ret = read_poll_timeout(reset_control_status, val, val == -ENODEV,
> > +				1000, 100000, false, rtc->rstc);
> > +	if (ret) {
> > +		for (i = 2; i >= 0; --i)
> > +			kthread_stop_put(ctx[i].thread);
> > +		KUNIT_ASSERT_EQ(test, ret, 0);
> > +	}
> > +	/* supplier0 can't exit.  It's waiting for all consumers. */
> 
> This comment looks like an untested assertion. For all we know,
> reset_controller_unregister() may have already returned by now.
> 
> How about signalling a completion "ctx->exited" after
> reset_controller_unregister() returns, calling
> wait_for_completion_timeout() here, and asserting it times out?

Fixed in v3[1].

[1] https://lore.kernel.org/all/20261104160123.6784-1-tzungbi@kernel.org
