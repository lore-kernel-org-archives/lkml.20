Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783697;
	b=ts2A35syhgv1vwEN53z7rOAtUxZ+X6KVKpGvA3zvZ0wccf23H56FnSUlSzXJtmu8vqnq
	 /odLal7ocyzx7VradTEIOWZ0PS75b8OQQFYvr9wCeK/T0v39/NqJDI9MXeW2tvQLo9Qvw
	 A/izWArYhXdak738PANlgXUjUhW2avfZvIaJds/caDt4zVntRKrmF7D3jQKMaqwys0NXM
	 BIkGCSNOwwWXhyrRMh3YKFCUbgf+7b5aHiRKLmxtJGtcyqbFxEAH7gkH0esXw0uZB+M+d
	 4KMmTrza++CioL4q8DiiJ9aATJ6ctGCWl6ZY0S2VpOqI/ZC6uw8unWVShpGEgzmGoRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783697;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9RKTXa0mNQlc7dJEGQNmec9AiGXENbKZqhKyOZqUSlw=;
	b=guloqnvBlLXjM20UFWvdQJZd0WuMjgFiK2i0BlX4fvSGMdm8092Q8r6pxxu04gRIRpQN
	 RSkq+W/engzgrLSD6pGGBXqrp4ia+8q6xvtU9yQAPeE7qrEdX3CqgsfAy3weP/5y9wD8V
	 79hjE4/3eH37DN2wEZF6Og9ZwfTIV910WiB9JphwDeCaO6v4Ltby38P0OPJqb1iF8K+j+
	 y/2N0yOXSitvU3TI0Bqav0W/0Xv0kdaayCjO6yeKgPoy/wVuBfcJ59YwSBsx4ShivcOj5
	 bn4EsEacdcGfFMQTUucjMJ4z8ZcJT3dRe1T8jwr1Vp+vYkeFZJjpTkGMrWRaH9AJTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YH0FIjmg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B072E606A32C;
	Sun, 15 Nov 2026 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YH0FIjmg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D7E1F000CB;
	Sun, 15 Nov 2026 23:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783697;
	bh=9RKTXa0mNQlc7dJEGQNmec9AiGXENbKZqhKyOZqUSlw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YH0FIjmgCqvZU43dhFqZbEYRGyPV8I0nI6jeXqxq9BpiS6XuitHAUOSJAiZxWafjp
	 FZkdFSpDtfwlPA20XmTb6T6qQaftCpfSwg2nBJmRMysu+FpYVAf7oh0jT86v38fc4m
	 5Bz9mdazY6ykKw7tDd2CxhwR5yB5Fur9yYRkA/+ab9h2nOuccgGzAkveW66o6Ngakj
	 mS+Hdyikk1TXOEshQbDPROR/m+W1EVS+kitfXC6gCoSZ5G45ry2FtB1sc7GttTr/qH
	 PVBzzGjKDEmYj3wtjgXreZ58nYIqthIVAtqdgfkmtXCGMoiM2bFtQL5nMFaAwoyufJ
	 aeal/8mJaB0uw==
Subject: Re: [PATCH net-next v2 05/10] net: dsa: realtek: rtl8365mb: describe
 the ports of each chip
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linusw@kernel.org, luizluca@gmail.com,
 alvin.sipraga@analog.com, andrew@lunn.ch, olteanv@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
Date: Sun, 15 Nov 2026 23:01:36 +0000
Message-ID: <179478369620.3136.10648334333290440373@kernel.org>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-5-f8e6fbdf8c99@pengutronix.de>
References: <20261112-rtl8365mb-dcb-ingress-v2-5-f8e6fbdf8c99@pengutronix.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch lowers RTL8365MB_MAX_NUM_PORTS from 11 to 8.

--

net: dsa: realtek: rtl8365mb: describe the ports of each chip

This commit adds a per-chip port_mask to rtl8365mb_chip_info. It reports
fls(port_mask) to DSA as the port count and rejects devicetree ports that
the chip does not have. It also lowers RTL8365MB_MAX_NUM_PORTS from 11 to
8.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index da06f952a053d..1e6cdc61f6bd3 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -115,7 +115,7 @@
>  #define RTL8365MB_PHYADDRMAX		7
>  #define RTL8365MB_NUM_PHYREGS		32
>  #define RTL8365MB_PHYREGMAX		(RTL8365MB_NUM_PHYREGS - 1)
> -#define RTL8365MB_MAX_NUM_PORTS		11
> +#define RTL8365MB_MAX_NUM_PORTS		8

[Severity: Low]
This isn't a bug, but is "family maximum" the right description for this
value?

The commit message says:

  Lower the family maximum to 8 to match.

The constant also still sits under this heading:

  /* Family-specific data and limits */

The file header comment still describes the family as having more ports
than that, and it lists the RTL8370MB as a member:

 * In the same family of chips, some carry up to 8 user ports and up to 2
 * extension ports. Where possible this driver tries to make things generic, but
 ...
 *  - RTL8370MB

Some of the family-generic register handling was also written for port
indexes above 7. Examples are the 11-bit RTL8365MB_PORT_MASK, the EXT bit
for the trap port in CPU_CTRL, and the L2 flush code in rtl8365mb_l2.c:

	/* Now issue the flush command and wait for its completion. There are
	 * two registers for this purpose, and which one to use depends on the
	 * port number. The _EXT register is for ports 8 or higher.
	 */
	if (port < 8) {

With this change, 8 looks like the largest port count among the chips the
driver supports, not a limit for the whole family. The BUILD_BUG_ON in
PORT_MASK() reads the same way. So does the later static_assert in this
series that ties RTL8365MB_MAX_NUM_PORTS to RTL8365MB_QOS_MAX_PORTS.

At the end of the series, the header comment and the placement of the
constant are still unchanged.

Would it be clearer to rename the constant to something that marks it as
a driver-supported maximum? Moving it out of the family-limits group and
updating the comment and commit message would also work.

>  /* Valid for the whole family except RTL8370B, which has 4160 entries.
>   * RTL8370B is mentioned in vendor code but it might not even belong
>   * to the same RTL8367C family.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99%40pengutronix.de
