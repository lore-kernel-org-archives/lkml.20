Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592167;
	b=ub+9QoQk9nk4kIOgMfa9hW8ukYwCAM0n5QUAIniCuQ2xUlGizRB7wglIu5ez3lArJzEB
	 Y7TJzNDHvZVnYqZT1cd1uiRvqdVfKqxu3zddQGirHfRQpTegn9+cH1PgA1xAzDPkM1XLc
	 toFy9WGHBipNlFUH0ip1vLkaid7nS2IktY+in1XSk/jGPh5uNLOesUXtvENY5Y3hh2Fcn
	 nNA919exL4g5T2c4zejM/tNdOZqrpB7GiW+Kz0pU4kyHIur7aWfFiuqvO0KlFTZ6WB0xH
	 gYIvKKUKqu6gklYmiWnpclDwebBbqmSSOkH+b9S1wepbSXTZBGqq2T1mmUjkRQUlQkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
	b=4Zz5DYSpRkmjBgnYv+PkCQNfUPwzIDT8CvkiES6luYwWTMdR0nyOAfGv87+8EkZthbWQ
	 D5ABdDDY1JX5b+AkE2dvVboxXVOiqSjlFi2/GENPQmIu1ioZWoqR8efFj3AZAYxfP4HpJ
	 cVf9osmFrZHuYvEJ+DUS1w9dwIEFjxq0EIC601FE2s/DbruVDi+cP4bzpnFasDDAQusBv
	 sMWKeuX9wXSswNiTFqkTb/NdNShgmzaW/tTHJGo1UFURcDbiKPJPEUsQEy4TOQcWphENr
	 PNaRjMTJqrD40Oa5QdYo+4g6E+sR+jNKWBWVLbfAvncA4wD34GdKvAlub5e33BagoNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SU3em2n5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18D8607A5DC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18D8607A5DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SU3em2n5
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c506a231b88so221476566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592165; cv=none;
        d=google.com; s=arc-20260327;
        b=hI6teITGRVDvZ8ow5LUxQxdmD2iM8WcozGTGm3SXaqoCV7ENXknCGjc6Msdo9CiyDs
         S7p1OHDDW7jW+mwnfrO4sWSiHzSVZSSqUEdzoyb+MqF0rK6EcNiC0PMWuMr7lvug8Iqx
         GEyP35yLoROeKSRmb3iSd/aLLZlfWiSZGt7JLACwhlpKD/owIzBucijZtyuAQOo3skSO
         npxZvlevH0mXmCxLjexay5vZxoUiRaOLWCdbklXSVmTXd+uC0Tj6TkcfqPszgf7A4HlI
         ynwUc86QN1UN1CPmjXVL3mK1/YQfLNfNaGahv2MHmBhFz7PK3qFC9gKD/0FaWETwIP7x
         nwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        fh=AbQQ0en61y/mKdSxxUA60/pwGtsv0xSV+Zkadlxxmjo=;
        b=ld/sJHN04+hBZmLKHeYenDLWL+G1TtGBfk7QNyCkA1T9pzCRFZBeBMV/J35XGjnSHk
         JKFcgVYEv92YrqCJSaYvt4pVq0lGn8FAwn39yYYV5tK7ch+CxHG0sZOogSnXyL0VGmoU
         urtqknOCyz39cI7/EVbnsPeTI5dP33UUqnR5QbGmEJ8YBjYwzDOcyntAiS5F3vjM9wE6
         qpxObwtWbhXoju+ZLlm3Bs7hnyoR8SuIMupbzU+/ysSRL3/q92//RsQQIiSbNRCGNuDJ
         zyrkqAoIA2knHuAZwX/UAKA1WdCZQjTGJSjTqrggqVxDwiu/Di8IpAytxQFQhrl+s+c6
         ZWLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592165; x=1795196965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        b=SU3em2n5FzvbGtn5JN6OOJQc2zPRYQVpL1O2W57X89BWZPiFeqvVjlQGk4oyMCp2XJ
         MmIuIGWNCpaYdmVt9Z/v3AuZWvq8wBAa0tJ4uX1hqo5XoJhsZiGZnenGb9uSjnFLAp4l
         /Nj/pNHKV8BsOv8M9ldbCSBGtrlEe0lcyeTKPoFnEErwkCg2UeaSOTkWuxPZJqb6wexA
         NVR7cA3phbStjZOgbbRHF3KQ/HjTSuW9+wU/Kbmqs/LeSr4mbfqJib+SRzQoUxPTPMgw
         4gnY5JQFe8oKkd0gqAT3TaD+z5qdrFGhD1zm+N9pX0WzR8ScK8PHOERn9OrO39UUuRMa
         CoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592165; x=1795196965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        b=E4sLzo8fMvyfcnMbvs3x9/ypCrPVvKkjYcnNtHnYKGgtYx6MF+Bz2NdxSvUq/nsQ9+
         xTedAOCe5Jnj3TSvuNRMxb//y0jdhRdnRdsZg5jm7/A01z+d+IjLIXDy1URYLJIoMLCt
         nKgOJ4ByHy4kZ9CZz72pF2NbdttzSTMX0sBzcDwyljhRed0eWeClS06tOxlkbndtoBSU
         pKyfQssDYouu2suI2AKlTPWGUiCG0QaVkrVN1pUlmyF9sIOAKOX6qlV+wh+MrFlU5L3H
         Rr1aIGo/xYrBUZJzFx7o/eYE/eivUucy5k0ey+30UXYcCPUDom9fMqoPY9Zypx3udMPV
         xQvw==
X-Forwarded-Encrypted: i=1; AL+hErHDn9kV0CwTI2t/b6b9Sipm0HMuGRh/1OcHbkWqGQXBtnB1Y0prcfjNkD9i0I/OJCzyfUZMBt/aS4uwxAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MushWbL4baevYQ1vbnqMDAUMW08lhug6KBTQOlniXuGtNEv9J
	J/jhBQUv9jmDw6Q0N+mJXWnTwbnJBswgDzrkR3+9Cck8XQvPdIAMoI3UO63Z9LdJ4UxX5TvuXYR
	q7AbvE7LcjDJVbu496JfJi3sv+YJjRrU=
X-Gm-Gg: AYBFou1FAGviQVCI2UoOPBrCx1OACBM5Z5P2HN17n2v2PE+KLBRtsJhX2eqmhy8a7qY
	52Nicmd78FQtokBeTR8l0z4xsLykwtoArgm3bGADbIDbImPORXHMFV0wsgbSJdD+CIB28KGPX+A
	wJbu6Ax2iNNrMEgk7UrYBxpuzZcVouywH5O2tVDuEQF4Cdj1HixSuF6VvKPbxDR4Mj2Pb9Ky9Kd
	BmWdumkqWU6KnjN0N0X0IUjjpxoimziSa7E/OnfxQmwrCcxvPKRfoqZEwyKxY/0J+d3+CIlK4rR
	G+o00NPj6+raxlpDEVQCRIjj8+TUKAT0Z7NLIEII64CqyZ3TQ4bzpa8QGaxNYsPIkUdrlVHgYAB
	EN4769x6xrI2EfyIKdIhXM4pqSaSm/qkoCzyva37XbKl090rDH3MR2lhk18l1K/YFPytRVC5UEg
	CabRYkeSozbGyG7wouISFf9w==
X-Received: by 2002:a17:907:ea8e:b0:c50:9439:bffe with SMTP id
 a640c23a62f3a-c509684d717mr313677166b.47.1794592165236; Fri, 13 Nov 2026
 09:49:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com> <20261113132435.434615-3-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-3-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:49:13 +0500
X-Gm-Features: AclHuK9vLFuFj8StJfQb0gQfm2zMdlEC8vjTlUvEUXwD7gdAHCOcMYM38gGZrFA
Message-ID: <CADqcGBmdLC9jaK4HSECeSO=DtyZ3t-aoaBRUYV2cEQRBPOwuow@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: spacemit: Hold RTNL lock in emac_resume()
 and emac_suspend()
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, leitao@debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Taking RTNL before the netif_running() checks is the important part
of v2, otherwise the check would race with a concurrent close.
Depends on patch 1, as noted.

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>

On Fri, Nov 13, 2026 at 6:28=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> The emac_resume() calls the emac_open() and emac_suspend() calls
> emac_stop() functions directly without holding the lock through
> rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
> with rtnl_dereference(). But since no lock is being held,
> rtnl_dereference throws a suspicious RCU usage on
> Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.
>
> WARNING: suspicious RCU usage
> drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() =
usage!
> Call Trace:
> phy_detach_internal+0x490/0x5f2
> phy_disconnect+0x90/0xc0
> emac_stop+0x114/0x626
> emac_suspend+0xac/0x126
> platform_pm_suspend+0x72/0xe4
>
> Take RTNL in emac_suspend() and emac_resume() before the netif_running()
> checks, so the interface can't be opened or closed between the check and
> emac_stop() or emac_open().
>
> Found by CI suspend tests on Orange Pi RV2 (SpacemiT K1). Tested on the
> same board with lockdep enabled: 12 suspend/resume cycles without the
> warning, and kselftest with no new failures.
>
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
> Changes in v2:
> - Moved the rtnl_lock() before the 'running' flag check
> Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/589
> ---
>  drivers/net/ethernet/spacemit/k1_emac.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethern=
et/spacemit/k1_emac.c
> index 51edc95f54c8..d07d8a1aa5ee 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -2031,11 +2031,16 @@ static int emac_resume(struct device *dev)
>                 dev_err(dev, "Failed to enable bus clock: %d\n", ret);
>                 return ret;
>         }
> +       rtnl_lock();
>
> -       if (!netif_running(ndev))
> +       if (!netif_running(ndev)) {
> +               rtnl_unlock();
>                 return 0;
> +       }
>
>         ret =3D emac_open(ndev);
> +       rtnl_unlock();
> +
>         if (ret) {
>                 clk_disable_unprepare(priv->bus_clk);
>                 return ret;
> @@ -2055,12 +2060,16 @@ static int emac_suspend(struct device *dev)
>
>         disable_work_sync(&priv->tx_timeout_task);
>
> +       rtnl_lock();
> +
>         if (!ndev || !netif_running(ndev)) {
> +               rtnl_unlock();
>                 clk_disable_unprepare(priv->bus_clk);
>                 return 0;
>         }
>
>         emac_stop(ndev);
> +       rtnl_unlock();
>
>         clk_disable_unprepare(priv->bus_clk);
>         netif_device_detach(ndev);
> --
> 2.34.1
>
