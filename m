Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855743;
	b=FSXMU2iuZSj/ayoymZt0T9decZjIlFmWLN093zHkh76byux5XMAr8wBZ91Ehn6Rdougb
	 yHZlBWiuraw8hB0jZ+5zJqURZIiwxldK8pjUF1MvZCJz5Qwmqxj4VgFcrxcpcSavY0vqi
	 KdNew0p8i21haVeEFHU7hChJw3PbfXWCT6QeivZ64/6tH3PWSpXXZF6uvYXtlqNp+DZ2k
	 3gAEV1t9UxUpxzKEOUys0/JZZYadIS35sPNRgCZYvfLCcpSu6aLNH+ni+idkLU2f+9mPg
	 lkG8zlfGpwT0oPOwvnHSBVE8Z0NDDjJt1h+EMusl3rnKgBksfXm0Y405hSo7jk0FByw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855743;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OAdG2VXPRF5Xn/vZR1PiPlejI6VYWCGC/es6sAOg6Bw=;
	b=nOUI0BcTRdRqqIratTm1155HvaVDc8fl++crL/dZEpFED/JrsZYr2kLSS+DqClYq7N3w
	 MjIjlOuIkOoxAjEdAccGk0vP4F+o/BoAs+ud38HzYskpn2/ObLsfQTD5vzq1MOKvK6xzy
	 xhk7TuECtmKhQ8+vSo8q0sqejkrePVmmLSw3B99m/H4HhkummL6RY0xTMVQXnBmoZU3RZ
	 qMZXXdK47isI4Zdp12rjQDopRzY2PdgBzVDlHZcjWFzN2oQr33S59829GUqryL7B47v5g
	 FH7NgQJY58LlF1d+3Kq7Qlq+pGu78EAYGbmT9zHr81N+WTx/tMBSj/vvvjZSGNx+LHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIV9Lpv8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224C606A896;
	Mon, 16 Nov 2026 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIV9Lpv8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D871F000C9;
	Mon, 16 Nov 2026 19:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855743;
	bh=OAdG2VXPRF5Xn/vZR1PiPlejI6VYWCGC/es6sAOg6Bw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YIV9Lpv8iu2shcZmWroFNGsKuwtCT4LVC1j+QlnyryQpmeQbEohfTYp1bTLRkNWtE
	 lU7TbrLqZv5QSxhUPDSYlB1181qb+xdgImB6VAVSaZVXB0Y8CgpPT7jSN+qetHmXvJ
	 a96z2B5UVLDHjvXnktECP3ZOJlEECApP9+SLewpOOPHhqI8b069PSOfw5fX1D7Ad/P
	 OxJt6we7zq9HjWi2p7oA8zXjQ5Sh2AaTZJcn7tXqElD4a0JdTSjQJrBncoAiDg35Om
	 +/GYBQajX4/ntswGyEWYyvQuRVmbXpcQd31e87QiSaU4yRlAPUOJln7f2+bxGC8P1N
	 nmSi5ZhWlqYmQ==
Subject:
 Re: [PATCH net v5 7/8] net: dsa: b53: harden mirror register programming
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 19:02:22 +0000
Message-ID: <179485574238.3136.7987059479392278091@kernel.org>
In-Reply-To: <20261112180202.324504-8-florian.fainelli@broadcom.com>
References: <20261112180202.324504-8-florian.fainelli@broadcom.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Speculative; needs datasheet confirmation.
- [Low] This patch fixes a regression that an earlier patch in the same
  series introduced, but its message says nothing about that or about…
- [Low] The commit message says the patch will "Clear capture control and
  both source-control registers during b53 and bcm_sf2 setup".

--

net: dsa: b53: harden mirror register programming

This commit calls b53_mirror_init() from b53_setup() and
bcm_sf2_sw_setup() to reset the mirror registers at setup. It checks
every mirror register read and write in b53_mirror_add() and
b53_mirror_del(), and only increments the source reference count after
programming succeeds. It also uses the ingress/egress source masks,
instead of MIRROR_EN, to decide whether the capture destination is in use.

> The mirror destination check can reject a first rule when a bootloader or
> previous kernel left mirroring enabled. Not all supported switches receive
> a hardware reset during setup. Unchecked register accesses can also
> corrupt mirror state or report an unsuccessful rule installation as
> successful. Reference counting must not record a first source reference
> until hardware programming has succeeded.

[ ... ]

> Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")

[Severity: Low]
Is ed3af5fd08eb the right commit for the first problem described here?

Before this series, b53_mirror_add() overwrote B53_MIR_CAP_CTL and never
rejected a rule. The check that can reject a first rule because of stale
firmware state was added earlier in this series, by "net: dsa: b53: reject
conflicting mirror destinations":

	if ((cap_ctl & MIRROR_EN) &&
	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
		...
		return -EOPNOTSUPP;
	}

That patch does not clear the capture state at setup.

The same is true of the reference count increment that runs after
unchecked register accesses. It comes from "net: dsa: b53: reference count
shared mirror source bits". That patch also defined and exported
b53_mirror_init() but never called it, so this patch cannot build without
it.

All three patches carry the same Fixes: ed3af5fd08eb tag, and none of them
says what order they need to go in.

Suppose "reject conflicting mirror destinations" is picked up for stable
on its own. On a switch where the bootloader or a previous kernel left
MIRROR_EN set with a different capture port, would the first tc matchall
mirred rule then fail with -EOPNOTSUPP?

Could these fixes be folded into the patches that introduced the problems?
If not, could the commit message name those patches and the required
ordering?

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index 98696bce368fe..deb331b3629a7 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -1360,6 +1360,10 @@ static int b53_setup(struct dsa_switch *ds)
>  		return ret;
>  	}
>  
> +	ret = b53_mirror_init(ds);
> +	if (ret)
> +		return ret;
> +

[Severity: Medium]
Are the mirror register offsets the same on every chip family that goes
through b53_setup()?

With this call, b53_mirror_init() writes zero to Management page offsets
0x10 (B53_MIR_CAP_CTL), 0x12 (B53_IG_MIR_CTL) and 0x1C (B53_EG_MIR_CTL) at
every setup, on every chip_id:

	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, 0);
	...
	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, 0);
	...
	ret = b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);

Before this patch, these offsets were only written when a user installed a
matchall mirror rule.

The driver already treats the BCM63xx Management page layout as different
in at least one place:

	#define B53_AGING_TIME_CONTROL		0x06
	#define B53_AGING_TIME_CONTROL_63XX	0x08

The mirror registers have no 63xx variant, though. Nothing in the tree
confirms these offsets for BCM63xx either way, so this may be fine.

If BCM63xx, or another supported family, has a different register at 0x10,
0x12 or 0x1C, would that register now be silently zeroed on every boot?
A write to the wrong register would still return success here.

[ ... ]

> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 98a4a62ca73a2..85ea32fb501db 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1063,6 +1063,10 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
>  	unsigned int port;
>  	int ret;
>  
> +	ret = b53_mirror_init(ds);
> +	if (ret)
> +		return ret;
> +

[Severity: Low]
The commit message says:

  Clear capture control and both source-control registers during b53 and
  bcm_sf2 setup, propagating initialization failures.

b53_mirror_init() does more than clear these registers. After writing zero
to them, it rebuilds the source masks from dev->ports[].mirror_count[] and
writes the capture port back:

	cap_ctl = MIRROR_EN | dev->mirror_port;

On bcm_sf2 this also runs on every resume:

bcm_sf2_sw_resume()
  ds->ops->setup()
    bcm_sf2_sw_setup()
      b53_mirror_init()

So with this patch, active tc mirror rules are restored from software state
after each resume. A failed mirror register access also makes resume fail.

No patch in the series describes this restore behaviour. Could the commit
message mention it, so that readers don't expect resume to wipe active
mirror rules?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112180202.324504-1-florian.fainelli%40broadcom.com
