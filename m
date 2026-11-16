Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855739;
	b=eGPTn7SxcBt3RaTbqxR0gVFFfr3Bp2dNW7hkrBgeBfGkvvEyvHtXxjWq8HBs3e9f4rpN
	 wIYExStiJ9WmGSmsMSMlP9bJsLmod9XpOAIBNXKjyKCTJcnqlxE4YyQk/BojEHGU3pdXt
	 m7KXt1Dt77IlG6FdkPQXPQPOrc1UnBEwh4zFjG1Ej12DYZJXEqp/y+XEfwDFOPmfffAQa
	 ydfMynw6a6bwlb6eKqhN64Klkdkp/C8bRh8BK3HHHOTlx7oBRVDh1+JcMX7WCYOz7rXTw
	 EeW0LkyiTgQ/1WxtUMkvfq1F3Fj+gYgzbqnafDqrdjvMOpdIu38XKi9pCSqugfKeYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855739;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=apkEuudvJbCekMTvJmYGOcll41kktITW2BH/+e4mxBQ=;
	b=pqNlm7WLnlawnZD5jTeGpPA7hy8UZN148igRJuWUG7VhjYY22BoV2LJCmLNdCUItYG+B
	 J3IfG3Z3gf7lgxvwjmYuyEoN0jhG+rw/KSQv1zb9wQq7PLHMb7pSOvleym9ygAtRV/L/A
	 t/d3hoCP8mQw1+GRgUVb7/REMPteoQnF6YJutkMJHDEw101BK2SjCHJ+wWLYfNCAg1p6k
	 wBEaRLE46TZhE4oHMOSyHP4g5JerprUGvkcsp1r6OwsCa96Y6hHJdBuwgeDhMhmamhmTv
	 6djtTvsDDlrnR+RTeBTwLdFD6ivg5+o8ytHP/WBUFjVWVR5+ID9ZMLL+mt0pr2r8oJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4MFYrog;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EA3606A322;
	Mon, 16 Nov 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4MFYrog
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075741F000CD;
	Mon, 16 Nov 2026 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855738;
	bh=apkEuudvJbCekMTvJmYGOcll41kktITW2BH/+e4mxBQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H4MFYrogSwS6fMiUMfz4GdTj54tZtWv4sFoApwopsY1RmKb0Klw15GSebGmo8c/MF
	 A9NxaoxHV7wc4D7Cn4L+/IMSc+HSWiyw5WJTE0l0eIOx6YNceLfkWei+CNPxuMKDvP
	 +Z2lD1RjKrSa8cnn4wyHEPRTiNwxWTBZHk3t6/99i0BPYlgRH2Lo4o+/v74/jiCvzP
	 +hb5bY8G48DrGwex2xI7AL7gIl3fRAWBRqvELnB3VKQrHjBQRk/tK2m3aCjxhlRjDB
	 HUFrB7CrRcn02gYL+FRj/qet8r8z8Y4SQ7p3i0zW7/8+SeT/zlSju/J5XdbJekeRrf
	 Lhk039PkTZ95Q==
Subject: Re: [PATCH net v5 3/8] net: dsa: b53: clear stale state when creating
 an ARL entry
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 19:02:17 +0000
Message-ID: <179485573753.3136.13658549628439256102@kernel.org>
In-Reply-To: <20261112180202.324504-4-florian.fainelli@broadcom.com>
References: <20261112180202.324504-4-florian.fainelli@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In b53_arl_op() (drivers/net/dsa/b53/b53_common.c), the code
  does not do what the commit message says about return values.

--

net: dsa: b53: clear stale state when creating an ARL entry

This patch clears the b53_arl_entry in b53_arl_op() before a new ARL
entry is created, so a multicast add no longer ORs the port into the
forwarding bitmap of an unrelated bin. It also returns early when
deleting an entry that is not present, so stale bin contents are no
longer written back.

> Deleting an entry which is not present now returns -ENOENT, including
> when the lookup ran out of space (-ENOSPC), where it previously returned
> 0 in that case.

[Severity: Medium]
Is this paragraph accurate? The code below seems to keep returning 0 for
a delete of an absent entry in both cases.

When the lookup misses, b53_arl_read() returns one of two values:

drivers/net/dsa/b53/b53_common.c:b53_arl_read() {
    ...
	return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
}

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index 1f5776dfaae2e..dac6013f8fe29 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -2055,9 +2055,13 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
>  			addr, vid);
>  		return is_valid ? ret : 0;

The -ENOSPC case is not changed by this patch. With is_valid == false it
still returns 0, not -ENOENT.

>  	case -ENOENT:
> +		if (!is_valid)
> +			return 0;
> +

The new early return in the -ENOENT case also gives 0 for a delete.

Before this patch, the -ENOENT delete path fell through to
b53_arl_write_entry() and returned b53_arl_rw_op(dev, 0), which is
normally 0. So b53_fdb_del() and b53_mdb_del() get 0 for an absent entry
both before and after this change. The real difference is that the stale
bin is no longer written back.

Keeping 0 looks like the right behavior. b53_mdb_del() logs an error on
any non-zero return:

drivers/net/dsa/b53/b53_common.c:b53_mdb_del() {
    ...
	ret = b53_arl_op(priv, 0, port, mdb->addr, mdb->vid, false);
	mutex_unlock(&priv->arl_mutex);
	if (ret)
		dev_err(ds->dev, "failed to delete MDB entry\n");
    ...
}

Returning -ENOENT there would produce errors during normal teardown.

None of the later patches in the series touch b53_arl_op(), so the code
is the same at the end of the series.

Could this paragraph be dropped, or reworded to describe the change the
code actually makes? Or was a code change from an earlier version of the
patch left out?

>  		/* We could not find a matching MAC, so reset to a new entry */
>  		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
>  			addr, vid, idx);
> +		memset(&ent, 0, sizeof(ent));
>  		break;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112180202.324504-1-florian.fainelli%40broadcom.com
