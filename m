Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837046;
	b=TBOvG0a/BzeEpgyYgb9R0dARGaEmBK1pOvFdRQcSReHC8T7PJJRK6E11QwBbPPySxi9d
	 LiC1s3xqrYq5qIIZdq/Tk4dFqYwZkvkRy12TAgXTsMeFJTY5oRZ852DaYaIqa1/XfhKqp
	 Z8qX7sS5xQLFyJqYcu9ma/WAmdlxV7Svp9HleF+Np5Xax1ooZURJqM6aEQ0u7eCRn9qYn
	 zqayOsp6RuktNgSG8lQXXvaGGKcPwUP6fRMI9e5orHGk9mGEJjmrV2JRYBe6I0FcLxQa5
	 /AZTxvgP3gZ0hmrYHLum1WiwY1kXlm0TJ7mtqhhrE694yaaC+3bo2M5XGAP8+qfZ1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837046;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=akTGnfa9Y+dF6UITPcBnRtwKMfecwTjl7OenkZ1Dweg=;
	b=FxptMtqJpjHJzEVSuXSzgWtgwa4qx13cfE0K3NQu6fUiRlewSk6Q22J18n5VoQMtfchn
	 GwrJ/nNUdyLyhIKZbHuIIGe8aMMKT4T4xCm+r8ugARxuoYUO6k9kttlFcLCAnoNbJZ+9v
	 zPmq/HemxSEgZxhTn8xUo1vC/kgpsonnXMnMztkYXdvYcCOzL6PbkDl9aIk5Sd58Oevcp
	 lr5VzuojNpWHk09FJNeYUwy4WZ5bf2F745hWZ0pJWvySfYe7HKB9RncxgJiwVrpo/TwBt
	 ridw1UhM11i0UAqio1FOwCmGGRigSavH69RyyN+5J9vgmdhb1o4fvUsvCUJvqS5Kfzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SW1sFwoT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76760A2609;
	Mon, 16 Nov 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SW1sFwoT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31411F000C7;
	Mon, 16 Nov 2026 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837046;
	bh=akTGnfa9Y+dF6UITPcBnRtwKMfecwTjl7OenkZ1Dweg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SW1sFwoTWRup5UEOuaHBZYneSmOkK+5oO8zOo1IIhSWnZXZZRxtjq2M5Quy4+hvKs
	 uSOhBKwjVJvL+j3+nxUUwKKxFhQ9AqQ2Jj124uiVzNBqGGaXF4PCkDynGM+rqF1fEq
	 rQ7HLPk+bpMG07fCXwFosfSY7bRjnbZVQfWTUow4k3t0YVIdba7FwMjor6PYeULCdw
	 Sg+XEZtAjywcERrocSBCY9aQ7imoWYrHo8kzqOlYe4khk+PfzbBZcCwXXQdrJWfFOb
	 4/vvevXROogfcAFVDAMLiMSNt8s54ozAyVR8Ad7nmg85euUShuqoTmJMV9AuvGD6ZB
	 FXc3YS2j8iiyg==
Subject: Re: [PATCH net v2 06/12] net: au1000: assign a valid MAC address
 without platform data
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org, jeff@garzik.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Mon, 16 Nov 2026 13:50:44 +0000
Message-ID: <179483704445.3136.5178913144882531268@kernel.org>
In-Reply-To: <20261112045301.3669532-7-f.fainelli@gmail.com>
References: <20261112045301.3669532-7-f.fainelli@gmail.com>
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

- [Low] The commit message overstates how far the bug reaches, and it
  carries a Fixes: tag.

--

net: au1000: assign a valid MAC address without platform data

When no platform data is passed, au1000_probe() now calls
eth_hw_addr_random(). Before this, the device kept an all-zero dev_addr,
and eth_validate_addr() rejected it at open time.

> The supported no-platform-data path leaves dev_addr as all zeroes. The
> device can register but eth_validate_addr() prevents it from opening.

[Severity: Low]
Can any in-tree configuration actually reach this path?

The only in-tree au1000-eth platform devices are au1xxx_eth0_device and
au1xxx_eth1_device in arch/mips/alchemy/common/platform.c. Both always set
platform_data:

    .platform_data          = &au1xxx_eth0_platform_data,

au1xxx_override_eth_cfg() is the board override path, used by
board-mtx1.c. It copies into the same static structures, so the pointer
stays non-NULL:

	if (port == 0)
		memcpy(&au1xxx_eth0_platform_data, eth_data,
			sizeof(struct au1000_eth_platform_data));

au1000_eth_driver has no of_match_table or id_table. It can only bind by
name to the platform devices above.

So dev_get_platdata() never seems to return NULL for an in-tree user. The
failure described could only happen with out-of-tree board code that
registers the device without platform data.

The code change itself looks correct. It restores what the !pd branch did
before 7718f2c27dbd, which only added eth_hw_addr_random() to the
invalid-MAC branch.

> Fixes: 7718f2c27dbd ("au1000_eth: use eth_hw_addr_random() instead of random_ether_addr()")

Could the commit message say that only out-of-tree platform code can hit
this, or describe the change as hardening? As written, the Fixes: tag may
lead to a stable backport for a failure no mainline configuration can hit.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112045301.3669532-1-f.fainelli%40gmail.com
