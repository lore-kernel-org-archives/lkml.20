Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855742;
	b=sgJTbPZZ/r+I2xGMnsselwEHIGl/5fTAslr8iiSycbKCYWLXyR7hrrvu4wuheEEPfvt/
	 juHyEvH7tUyFxkBCXdz1U+iL48SO4E0n8fGGxHc6y+CWjr+fGfZWn7p2FActmPt/7Watb
	 TC+6H3hdcOEEpzUtOOxofjNfLp2M+hU/z5uY2m+GOV0qWkdmuTTiWohuUiQAigYSiSk8Z
	 pENiluMOQ/WjXKuuLuDu71A6wRbmMU1NFcB7o/YesiWBC+zn+AC0A7ABZmwG1FF5amYUW
	 QZ5XhfLtT2f8D98XKtwvP8dz7Myzbv4ZpxZcz/qVoHQ6JAgJRVQDJZ4r8SXPTSFg/KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855742;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=N2xKCSrPY1rJ1XkR4LIjxTn9dqMbXrnTZ+YOM+EyOfM=;
	b=Greg5tRnp2nx1ooufw9aoJr9IO1bILp4qcKCtIeAS6Eln7XYUqDQly1xsoUDsJdAnS6k
	 N50yZ9eh4qNnOaot17msKe6v0/BauQ7JUt/p8mccsx/VVydntoBpEp3fPKvaPP7Svw8+Y
	 NvH6hzMfU7w4jj2Jz43zji80W77S3o72maRt4aRdxbI3Eld6D9vLfzvSuqtlclsmgu2bC
	 e0C8jp3OWxmehZ/SFMWsKN19sonvrS68xCODLSjyMcdK/SiLieURt3G4ZRpBCwPJQdOef
	 58Hq0MutsUNIx+JnfEVR56YMj93gqgTB8JvEpp4k24eqtddBLXKlwdAmRIUxoUbbhIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VprP7W2C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C3606A332;
	Mon, 16 Nov 2026 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VprP7W2C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992CF1F000CE;
	Mon, 16 Nov 2026 19:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855742;
	bh=N2xKCSrPY1rJ1XkR4LIjxTn9dqMbXrnTZ+YOM+EyOfM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VprP7W2CiFZmaAi96m1oPMFzTZJmXLyzsL0fDPruE+CMRr2nqOdKIzRWGKeCz7Rlk
	 18d8WIrH32+fB/G9V/UAoZogshvev2UEfW6fCc4iwW4WnJigBcNcJ++2EIYcJ4Slim
	 fifGbJZCCRLnM1oP0w39fixdN1Lh9j21bFMeVjslvLyr9nq4fawN23iapFhQHU+bCu
	 utsiK7PXZzHp6zf8urlYrG2C120A4sRmV2yfgjSBxnnZcXXfnoBitwAbNkS5r7qB73
	 YtJkGP7pIz3jpXRLkd+1EX5zpeBGO5NVfccIBt619OuVkr6HcqO+VL92q0v1LOKBXK
	 s2D4sCayLq6FA==
Subject: Re: [PATCH net v5 6/8] net: dsa: b53: reference count shared mirror
 source bits
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 19:02:21 +0000
Message-ID: <179485574117.3136.2818958695058742581@kernel.org>
In-Reply-To: <20261112180202.324504-7-florian.fainelli@broadcom.com>
References: <20261112180202.324504-7-florian.fainelli@broadcom.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch changes bcm_sf2_sw_resume()
  (drivers/net/dsa/bcm_sf2.c).
- [Medium] The new error path in bcm_sf2_sw_resume() gates the switch
  clock (`if (ret && !priv->wol_ports_mask)…

--

net: dsa: b53: reference count shared mirror source bits

This commit adds reference counts for each port's ingress and egress
mirror source bits in b53. A bit is only cleared when its last tc
matchall filter is removed. It also adds a b53_mirror_init() helper and
changes bcm_sf2_sw_resume() to return the result of ds->ops->setup().

[ ... ]

> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 1747a1f20c78e..98a4a62ca73a2 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -996,9 +996,11 @@ static int bcm_sf2_sw_resume(struct dsa_switch *ds)
>  	if (priv->hw_params.num_gphy == 1)
>  		bcm_sf2_gphy_enable_set(ds, true);
>  
> -	ds->ops->setup(ds);
> +	ret = ds->ops->setup(ds);
> +	if (ret && !priv->wol_ports_mask)
> +		clk_disable_unprepare(priv->clk);
>  
> -	return 0;
> +	return ret;
>  }

[Severity: High]
Does this make every other system resume fail, starting with the first?

bcm_sf2_sw_setup() is not safe to run twice. It ends with:

    return b53_setup_devlink_resources(ds);

Probe already registers the "VLAN" devlink resource through
dsa_switch_setup() -> ops->setup. Only bcm_sf2_sw_teardown() removes it.
On resume the call chain is:

bcm_sf2_sw_resume()
  bcm_sf2_sw_setup()
    b53_setup_devlink_resources()
      dsa_devlink_resource_register()
        __devl_resource_register()
            if (resource)
                return -EEXIST;

b53_setup_devlink_resources() then jumps to out:, calls
dsa_devlink_resources_unregister(ds) and returns -EEXIST. Before this
patch that error was ignored. Now bcm_sf2_sw_resume() returns it and
also gates the switch clock.

dsa_switch_resume() then returns early:

    if (ds->ops->resume)
        ret = ds->ops->resume(ds);

    if (ret)
        return ret;

As a result, dsa_user_resume() never runs for any user port. Without
netif_device_attach() or phylink_start(), all user ports stay down
after an ordinary suspend/resume.

The failure path unregistered the resources, so the next resume
succeeds and the one after that fails again.

The clock is already off after a failed resume. The next
bcm_sf2_sw_suspend() (when wol_ports_mask is 0) and bcm_sf2_sw_remove()
will each call clk_disable_unprepare() again. Can that underflow the
enable/prepare counts?

The commit message only covers mirror refcounting and does not mention
this resume change. With the Fixes: tag, a stable backport would bring
this change along. Could this change be split into its own patch, after
making the setup path safe to run again on resume?

[Severity: Medium]
On this new error path, gating the clock is the only rollback. By this
point the switch is out of reset, the crossbar is configured and the
GPHY is powered on through bcm_sf2_gphy_enable_set(ds, true).
bcm_sf2_sw_setup() may also have enabled ports already. Nothing marks
the device as clock-gated, and the switch stays bound.

On the next system suspend, dsa_switch_suspend() still calls
bcm_sf2_sw_suspend():

    bcm_sf2_intr_disable(priv);
    ...
            bcm_sf2_port_disable(ds, port);
    }

    if (!priv->wol_ports_mask)
        clk_disable_unprepare(priv->clk);

Won't this access switch registers while the clock is gated? It then
calls clk_disable_unprepare() a second time, which would trigger the
clk core already disabled/unprepared warnings.

Callbacks that run under RTNL, such as b53_mirror_del() when a tc
filter is deleted, can still run and would also access registers with
the clock off.

Before this patch, a setup failure on resume left the clock enabled.
The rst and cfp failure paths already roll back only partially in the
same way, but this path runs after the GPHY has been powered up. Given
the devlink -EEXIST issue above, it would be hit on every other resume.

It would also be hit on any register I/O failure inside setup, for
example in b53_enable_mcast_snooping(), or later in the series in
b53_mirror_init().

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112180202.324504-1-florian.fainelli%40broadcom.com
