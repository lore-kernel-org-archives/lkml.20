Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592125;
	b=GJZMU1bG1aFye12k3jYjGfyN5ltc0hhgFcirDqFwOijtIkb42C91AlRTBR8igLHYRakB
	 AoiwnTDhRoHpMGlAZsHWD28UNCq72V6qamtWjeNnY/QCotFxnjHfgffVZhxbYiUJhJ3xE
	 F25aXlCOK/1LG9BkB9/SViwakA9/wP4OqINelCfqxO3I3FnWrAaCkj3TEeb1l5hyUixxD
	 icsn4hOwIt350SMQDuw9ol2+8KgtauL4TA9/uF1pbMqpltHHI5618EyRd47SkSQmdpvof
	 IJvH9H1HFK+Bsh+fz8mCaY0Hn30mz5Z/1JswDrthHu4PoZRJv1GQmDJhGakObtmIN9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
	b=ZzI08LsrLBYj+6xCynRZ//walJnEusNPEwFso0mvdQnJzxqhXleAjCHxhfdXkhzNUCe+
	 M+uJo57KByf/vOdzBg9Zmstom76dbBoP9zq6pSRaybYdxihDjeSHuWKsv3cBGb8fM5Z86
	 NFlO5KTE3HVWs3v4RhEh8fqWZZOX08aozKadAYD4Jhk9oXb6/pa/dDPYg0OZFhL1cyc4S
	 fBKEE9s+siBAHAnGhF5aABOdDV26x782owgR2/om89Jpslwx+jgShtThYp5HEuv+U/LWF
	 mgQ12xDVU2C30QZIOHEHhE0JvvIUGEmk7YrqnNJK1Ywfe7T5+ImKTv0auIOZrNGsj+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="krnMCu/p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC06E606EDAC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC06E606EDAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krnMCu/p
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so300508666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592123; cv=none;
        d=google.com; s=arc-20260327;
        b=PwJpTZrffsdrUg3K06ydSNgDXCln4sfNHfemTp3MAooYo4n+I2OjCbbnJuqbU35glw
         N0yYOjtjpmucjs5jP6bshqgy1ItVw2yVeV72dFTWh87Cseil/S1K8ROTHlGoPiy+iFif
         NUahP2J5m3KN8o7sjBXse/+6wBP0zLhoQe9qJc+xLyWixDgu/UPFp/0O2VqEKfdna1+1
         8siYuJI2U34NDl3FHn5SyoVWQiqJaVMZviSHQWBKEepFUs0ZzjSmynurIiComlEpA2ub
         sGKd5sAjcxF2n/uQnQ7qC8HG0j+FYaQ/UuHFF/nvjILTcGsqWco4AM52p5shpr0pnJva
         zaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
        fh=QbYIw6Dho2U3qAKUlfEdWM6QkZamd8DP6Nv2m/b1Fo4=;
        b=qABiu98KILjtLNjLVP9a70l4cm0c4NuZafADptcEw08riL7rRxpx9he58FS3/zJ4B0
         y1cnPrYuPrdysow5l8WvgeHT9b8eZuI4PA84IWibkR/ecSpGQkgW2Raj3poT+7mtYxzi
         c+7QhOlvY7wdTCmaiWm7YhEUAvbl8uWXeBurhdV4OZfK2dFh7SrJFb8E3EDs0WQm5OPm
         bgyshfwMxjj3Zaw+Yt1GQ1HMuJTzc4szgrcCYbVHnQLqGpt9LufQeo9u3Vm/PurktNM5
         +mZ9ZKWV3ZoRcyP9a3lntQ6UUW06652Q/opD7oUtPLbvwWBmOWT9xVvWwkRdd+r3pWRw
         Pzag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592123; x=1795196923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
        b=krnMCu/pIv+2BNZCz9Kl2T6N0n2YkNCTDfv1sQRh+qPxk08eOSYoB9xrXw7PDundYc
         CIAdiP8zGwF/scWrgUDiUC4r2zOVjFb69USUho+AzheC9DFHlZHI8KZR6NIvJOxVC9NS
         Y7nOxv1v9GrdoiyKHNeK1SOGBlbr7CcuRs/9KPXsd+qrryJUhQ3E5HNFpt6mef0nK2Dc
         Ytf5U13ymQQ7nqndhlGbpASEql4lc4gCtbFKUQnbK1DvFnwGqArP+MLLathsEKak7cEr
         RPzWjd6muhfPQXpyek7l9c79zX0geHfuJZ0TNXfuhkxPLqebXRiyOK2UNQjIGEdTnd8s
         NDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592123; x=1795196923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNynPIYr0dE3TxyMaeHySnLJJrKQN/vNpl2l1SdArA4=;
        b=K2j8HGjOmAE3umZjdPY3ZHvo+2U2uYpPREZ6Rd7AUsvZgWDRSBYVByvwuNRLNNC1aI
         ra6QT4bZBopqLUGm0SR5hxgsFF47Km6VKkNT3dPcF5N0fEMSW2sdC4Ys3ZFS8n4UBFR9
         3dviqNRANG2yVCPFcVi4ZV9mLIMn7Eyf6cPaIqEhqEJ49Tnhyybvo/0pY786JRtW0qes
         qw5665XyNrAg3/0znhh4ha5ZnMBv+O+ZZKkvSg+rydhr9McX1OKPubknZ8SWflwFxc82
         VyzPnQJ0Peh0iRMF6u5EHkW5kjvOFgcI19zJDKFMIss8xPAEjUYTF0RLux32CqKNemFV
         LDfQ==
X-Forwarded-Encrypted: i=1; AL+hErE7A256wHIpTR/nv4hvEW73DwoUlJBifrNiCKjnLFbP7Oo0tjaqFU4svhaZYyhgw//ZPnRD6Kqjgyehuto=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KXc7T16l9SoMm5ADIiVr+bE2JGMHo3dM87/dEWHdoUWNGQZBc
	6qfXnxC9EW/ZkgCKzUFM2TQTZa5IWtFzLvn9Z2gjewWOosxyjLPjB6Lq/dm3lWl4ITtrGF9RhSZ
	pqeUW+N2iAD0gFOgrJh0qXin5zErholc=
X-Gm-Gg: AYBFou1bqGivxR0/e9/+pbSrSzJqTPLg35f2L6OsN7njo+bv5Plp5CB4/dKx+v9Dd5G
	CXAyWDfOGoiESsermSdTM6L/mHsnfL0uPPWdMqnx6sHj12kMa4xBLcXoF5m1ZwUp4p8rC6iJ20G
	i1FyEH/EXq7FWMExpHfFEIYBDZAvkj7A00OYpD3KzE5WNYLZRFbTtbFfH9MMWFWii3XxCI+/FB5
	juQR9VBPo1tNEGUYgQeQihgYDpXMskudxF0dn9lBa3mZSxRhElDrYuUWivFSo3cU/voEN2bmP95
	kLUWwqVI9Y5vNPKpzP1zEO/JXp7T6DR71cP5UHqnKRmWvOhJCdO4QoWmMHmfqDPvZJXLOnvZ9bk
	JeZp3oGg/eVxImSc9IywKs5Cr4UJrLWgCv1uapFYP/BymS0X+e8QyyL55l0TMzIm6Y1/9nabSB0
	EpZhUS8nYK/Sak/Ruz6l9ZhA==
X-Received: by 2002:a17:907:d01:b0:c2d:d4dd:8d0 with SMTP id
 a640c23a62f3a-c507c3c72b7mr625099266b.16.1794592123102; Fri, 13 Nov 2026
 09:48:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com> <20261113132435.434615-2-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-2-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:48:29 +0500
X-Gm-Features: AclHuK8Pe1ThNtetEqiSLcWfitdjibDvU0d4btaBsFE8aUM2ODczptrv0nOcYxs
Message-ID: <CADqcGBk==F5ncuWFCec5NKfgqpO1O2sSWVeHY1h-F9MjdbouQQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: spacemit: Fix TX timeout work deadlocking
 on itself
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

Traced the paths: the work and every emac_stop() caller serialize on
RTNL, the stale-work case is covered by the !netif_running() check,
and disable_work_sync() before rtnl_lock() in suspend avoids waiting
on the work while holding the lock. Looks correct to me.

Nit: please add "Cc: stable@vger.kernel.org", the Fixes: commit is
already released.

Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>

On Fri, Nov 13, 2026 at 6:28=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> emac_tx_timeout_task() takes RTNL and calls dev_close(), which ends up
> waiting for the work itself. The function call hierarchy is as follows
>
> emac_tx_timeout_task()
>     dev_close()
>       emac_stop()
>         emac_down()
>           cancel_work_sync(&priv->tx_timeout_task)
>
> The work never finishes and keeps RTNL held, so after a TX timeout
> everything that needs RTNL hangs.
>
> Remove cancel_work_sync() from emac_down(). Disable the work in
> emac_suspend() instead, and enable it again in emac_resume(). emac_remove=
()
> runs before the devm-managed unregister_netdev(), so use
> disable_work_sync() there to stop the work from being queued again.
>
> Found by code inspection. Not reproduced on hardware. Tested on Orange
> Pi RV2 (SpacemiT K1) with suspend/resume cycles and kselftest, with
> lockdep enabled.
>
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Reported-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Closes: https://lore.kernel.org/all/DMO74K2MG3D7.15UUOU1O66K6N@linux.spac=
emit.com/
> Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
>  drivers/net/ethernet/spacemit/k1_emac.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethern=
et/spacemit/k1_emac.c
> index 71a80838bffd..51edc95f54c8 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -1732,7 +1732,6 @@ static int emac_down(struct emac_priv *priv)
>         napi_disable(&priv->napi);
>
>         timer_delete_sync(&priv->txtimer);
> -       cancel_work_sync(&priv->tx_timeout_task);
>
>         timer_delete_sync(&priv->stats_timer);
>
> @@ -2010,8 +2009,9 @@ static void emac_remove(struct platform_device *pde=
v)
>  {
>         struct emac_priv *priv =3D platform_get_drvdata(pdev);
>
> +       disable_work_sync(&priv->tx_timeout_task);
> +
>         timer_shutdown_sync(&priv->txtimer);
> -       cancel_work_sync(&priv->tx_timeout_task);
>
>         timer_shutdown_sync(&priv->stats_timer);
>
> @@ -2024,6 +2024,8 @@ static int emac_resume(struct device *dev)
>         struct net_device *ndev =3D priv->ndev;
>         int ret;
>
> +       enable_work(&priv->tx_timeout_task);
> +
>         ret =3D clk_prepare_enable(priv->bus_clk);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to enable bus clock: %d\n", ret);
> @@ -2051,6 +2053,8 @@ static int emac_suspend(struct device *dev)
>         struct emac_priv *priv =3D dev_get_drvdata(dev);
>         struct net_device *ndev =3D priv->ndev;
>
> +       disable_work_sync(&priv->tx_timeout_task);
> +
>         if (!ndev || !netif_running(ndev)) {
>                 clk_disable_unprepare(priv->bus_clk);
>                 return 0;
> --
> 2.34.1
>
