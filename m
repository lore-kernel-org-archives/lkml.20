Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758569;
	b=h8ZwtUFJ6MerzPfqmIXhKJzkorLkio8LtRBVGZU67SxCrXtpZWd/absH2eti27Xqlkp0
	 ZaqffasvPiXRQpYYVwL6BsWm9spS0mpGZ7LsE34p7kZaIZGLDUWN+RrXIhm/FOc4sv9ZM
	 aoUKZvF68X7x5KiKdocEwbjLjU9VOqkzDIUw6Z6BPP21E5ovIOXbFmo6CtT4GPphDfaK3
	 ckbWK+IvxyhBOkeCWYkRhwHF8YO0r53WKmSSU1Hxfd0SOismL/7IukSwintqhsEDyIqQp
	 IljCdjA4ge4C9RIlOf2OCS+WPg0eOSxef0R1OEim/1FlJLCMlrZaq/YzBmO/uhc1NgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758569;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PxPneTBKBcIwmLSq0P7KwXhX0yhOffKOv9PdYMrIZVs=;
	b=gvi3oTej7EdVtLacaMhhPxazCFPAKlxHPLgP6vb3qW8qyYJ/3LxP6dFqvHfsY+eitHuN
	 w/UdHjERX9S2k1MyFEG6U4O5WTyA/yL9L3VH9KjA+1Iit/DLU+xbyITeVO+t9rgve+PTp
	 TAN0/LXfObe9jbkWWq6v9E6KAN1n1h8p4iOaktA5PT+VAGs73MGdxt4NL8oxrOYzUQU4U
	 f7Oj6xlfhhHWKrVwbppU3n45lLZxKPDteqDBnXSl/8ogwvNck9OI50NSIJZdlk9AyRoIi
	 4koTA47ZprRlqyFuDW8am97ndiDbmaJjUldx4Q5ghAN7PtCT3L/uQwaE8IPlx7HxWGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkxR9A+Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753C606A31A;
	Sun, 15 Nov 2026 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkxR9A+Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028B91F000CC;
	Sun, 15 Nov 2026 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794758569;
	bh=PxPneTBKBcIwmLSq0P7KwXhX0yhOffKOv9PdYMrIZVs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WkxR9A+Z2chV56lMBRSdQ2pZG0DuNotLU+BmQ1hL3UdZoiwfmG7zHFpDozrbgBAyl
	 GQtB4PMBK01XRV/i6gEhgdOg19Y521CCrESqkeaAOlzwEZwREksl31kRGqJlfttJYP
	 hXlYk+nElL+uIRyzuoHfg0IQFYNYfk941r7JEFyo014Vx5uH14lZnYdr9QmXxtBoC7
	 fBuiql76wC4zSjQgiIj+vGIOyLRYISwAMWBnCg1rVpHtr06U0y51YTFf97EQp/6N8X
	 rLk5Z96Q0Ea5qr77SeZ3gYhAdv+aiVAJrtYPzQQxXIbdkty35DfBl6nJYiT9KOYo3+
	 aswfyU3KVUyrQ==
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after
 interrupted MDIO access
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 16:02:48 +0000
Message-ID: <179475856853.2199510.11675474406929032398@kernel.org>
In-Reply-To: <20261111163954.1132921-1-mmyangfl@gmail.com>
References: <20261111163954.1132921-1-mmyangfl@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] yt921x_reg_mdio_resync() does not reliably realign the SMI slave
  after an interrupted write, even by the patch's own state table.
- [Medium] yt921x_mdio_probe() allocates mdio with devm_kzalloc(), so
  synced starts out false.
- [Low] The commit message presents this as a fix for a user-visible
  defect: one interrupted MDIO access leaves the SMI slave misaligned,…

--

net: dsa: motorcomm: Resync SMI slave after interrupted MDIO access

This patch adds a synced flag to struct yt921x_reg_mdio. It also adds
yt921x_reg_mdio_resync(), which sends a fixed sequence of MDIO frames to
realign the SMI slave state machine before the next register access, and
clears the flag whenever an access fails. The flag starts out false, so
the first access after probe always runs the resync.

> The driver so far assumed every access succeeds, and relied on manual
> resetting when the state machine wedged.

[Severity: Low]
This reads as a fix for a user-visible problem, but there's no Fixes:
tag. The access helpers that assumed every access succeeds appear to come
from:

186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")

Should a Fixes: tag pointing at that commit be added, so stable trees
that carry the driver can pick up this recovery?

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index 33e5fc127244d..8b6c9739b6841 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c
> @@ -94,10 +94,98 @@ struct yt921x_reg_mdio {

[ ... ]

> + * State Input Next Comment
> + * ----- ----- ---- -------
> + * AH    aw    AL
> + * AH    dr    AH   `0xdead` sentinel
> + * AL    aw    DH
> + * AL    dr    AL   `0xdead` sentinel
> + * DHr   aw    AH   abort, frame discarded
> + * DHr   dr    DLr
> + * DLr   aw    AH   abort, frame discarded
> + * DLr   dr    AH   the access is done
> + * DHw   aw    AH   abort, frame discarded
> + * DHw   dw    DLw
> + * DLw   aw    AL   abort, frame consumed as next access's addr-hi
> + * DLw   dr    ?    `0xdead` sentinel; stay or advance undetermined
> + * DLw   dw    AH   the access commits
> + *
> + * The table lists the whitelisted frames only; any other REGAD/op combination
> + * is not characterized and is never emitted here.
> + *
> + * The resync sequence is dr, dr, aw, aw, dr, dr, plus one more dr as a sanity
> + * check: the machine must be back at AH, which reads the `0xdead` sentinel.
> + */
> +static int yt921x_reg_mdio_resync(struct yt921x_reg_mdio *mdio)
> +{

[ ... ]

> +	/* dr */
> +	res = __mdiobus_read(bus, addr, reg_data);
> +	if (res < 0)
> +		goto end;
> +	/* dr */
> +	res = __mdiobus_read(bus, addr, reg_data);
> +	if (res < 0)
> +		goto end;
> +	/* aw */
> +	res = __mdiobus_write(bus, addr, reg_addr, 0);
> +	if (res)
> +		goto end;
> +	/* aw */
> +	res = __mdiobus_write(bus, addr, reg_addr, 0);
> +	if (res)
> +		goto end;
> +	/* dr */
> +	res = __mdiobus_read(bus, addr, reg_data);
> +	if (res < 0)
> +		goto end;
> +	/* dr */
> +	res = __mdiobus_read(bus, addr, reg_data);
> +	if (res < 0)
> +		goto end;
> +	/* AH --dr--> AH */
> +	res = __mdiobus_read(bus, addr, reg_data);
> +	if (res < 0)
> +		goto end;
> +	res = res != 0xdead ? -EIO : 0;
> +
> +end:
> +	mutex_unlock(&bus->mdio_lock);
> +
> +	mdio->synced = !res;
> +	return res;
> +}

[Severity: High]
Does this sequence realign the slave when it starts in DHw?

The table has no row for DHw + dr, and the comment says uncharacterized
combinations are never emitted here. Even so, yt921x_reg_mdio_resync()
always starts with two dr frames, whatever state the slave is in.

DHw can be reached from yt921x_reg_mdio_write() in two ways:

- The aw(lo) frame is latched by the slave, but the controller still
  reports an error.
- aw(lo) succeeds, and the first data write fails before the slave
  latches it:

yt921x_reg_mdio_write() {
    ...
	res = __mdiobus_write(bus, addr, reg_data, (u16)(val >> 16));
	if (res)
		goto end;
    ...
}

Either way synced becomes false, and the next access runs the resync
starting from DHw.

Suppose DHw + dr is a no-op, the same as dr in AH and AL. Then the
sequence would go:

DHw -dr-> DHw -dr-> DHw -aw-> AH (abort) -aw-> AL -dr-> AL -dr-> AL

The final dr in AL then returns 0xdead, per the "AL dr AL" row.

Can the res != 0xdead check tell AH apart from AL? By the table, dr
returns 0xdead in AH, AL and DLw. So the check would pass, and
mdio->synced would be set to true while the slave is still at AL.

What happens on the next access after that? A read would go:

AL -aw-> DHr -aw-> AH (abort) -dr-> 0xdead -dr-> 0xdead

yt921x_reg_mdio_read() would then return success with *valp = 0xdeaddead.
yt921x_reg_update_bits() in smi.c could write (0xdeaddead & ~mask) | val
back to a real register, because by then the slave is at AH and that
write commits.

A write would go AL -aw-> DHw -aw-> AH (abort), followed by dw, dw in
AH. The table doesn't cover that, so the write would be lost while still
returning success.

synced is only cleared when __mdiobus_read() or __mdiobus_write() returns
an error, so neither case would be detected.

Would a sequence built only from whitelisted transitions work better? One
example is aw, dr, dr, aw, aw, dr, dr. The leading aw aborts from DHr, DLr
and DHw, and DLw + aw is a documented abort.

Ending with a full read of a register whose known value is not 0xdead
would also let the check tell AH from AL.

> @@ -108,6 +196,12 @@ static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
>  	u32 val;
>  	int res;
>  
> +	if (!mdio->synced) {
> +		res = yt921x_reg_mdio_resync(mdio);
> +		if (res)
> +			return res;
> +	}
> +

[Severity: Medium]
yt921x_mdio_probe() allocates mdio with devm_kzalloc(), so synced starts
out false. The first register access at probe therefore goes through the
resync:

yt921x_dsa_setup()
  yt921x_chip_reset()
    yt921x_chip_detect()
      yt921x_reg_read(priv, YT921X_CHIP_ID, &chipid)
        yt921x_reg_mdio_read()
          yt921x_reg_mdio_resync()

A supported part might return something other than exactly 0xdead for a
data read in AH. In that case yt921x_reg_mdio_resync() returns -EIO
without logging anything. yt921x_chip_detect() passes the error straight
up, so its "Unexpected chipid" and "Unsupported chipid" messages can no
longer be reached.

Every later access would then retry the full 7-frame resync, and each
attempt would fail silently with -EIO.

Is the 0xdead sentinel known to hold on all of YT9213, YT9214, YT9215
and YT9218? The driver header mentions only YT9215+SGMII as tested, and
the commit message doesn't mention the sentinel.

Could the resync print something when the sentinel doesn't match, so
this new failure mode can be diagnosed?

Also, each resync does a real read access of register 0x0 (aw 0, aw 0,
dr, dr). The commit message doesn't mention that either.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111163954.1132921-1-mmyangfl%40gmail.com
