Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837048;
	b=rJuFj0HBOPrZf8Nfz5ovWV0cNk5YKDtZRrMgVep00oG4QNj+x7sbqeqRi1mPSSl+6Cgz
	 Oew5anpySJMqJg/Ca7+oi062z/1KTbrq8i/TUKwpZpp9gjPh0wkVjTHCJuwIAvnr1epyg
	 3sOF8afScPpagsiCZPJD6qZDOpGpGaGaQWx7wSD/Ji2u6XYqCR+ZzsHgCMGGTM8gROUBl
	 YVMcM1l9w0+BIhGW00zCyt8EK+Xb/LGA99DlZg3NZc8nGpeQXC96f9GmFF+aarAgq61VB
	 SC/n5SzQL0ocJCcgUBme6yO9bMxbtEsAJTzrR0fEIeFLmA05lB5G5FNnuOS6R4osUkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837048;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ShEPZTXRu5lnPu0jihWcq6zhrQ4h/M1aHTPZu8H9wS8=;
	b=yezCXSfXsZIz1sIT+hvld25bp4lRAKvfukNSut019AhKlBFPhMCvBbKPmu+MgDnDuXIX
	 1nLqpEFPFAefI9pxdcDTCICYTnKdDzG11iTSDmbb9YqpP7w2Ujz3dWYt3lcTObGCUZfRs
	 FfkYznb1YnNzLbQHbzK4ljMg0CkLjue/X8d4W/2HHRQG9u0cF51eV4WLqvZ1hX0pD+ji/
	 tuGF2XeWTtTEjiEOk7Y1+mxTr6S4iGMSZ4jnzNmOffuFqn4TdfDu3clcKFq7VsqRROpAw
	 Qz8GebYpX+NJBF3wXipKlEolJRZ+B1hJm8r2OGkpYXMcb1aFVgygDUx10gn67nJ4hSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTiKHiXx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DC60A3838;
	Mon, 16 Nov 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTiKHiXx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFED71F000C6;
	Mon, 16 Nov 2026 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837047;
	bh=ShEPZTXRu5lnPu0jihWcq6zhrQ4h/M1aHTPZu8H9wS8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bTiKHiXxTNVRTHjtMmTR1aSUiXntHFDP60UO+8okDh5hFYSFKL/vZIaShcUonJDhx
	 MSd5SqH2qRftAMrqKrOdSkQ2CximcnxIMrdrzjmTARBu0q5/g0WEzzKmnFkxf9suuY
	 69wK7ReC9Absp1xlVX54E3we1vKS412/IU3VtHW302K7E6k7OlD2mU6Zk18IuwzP6J
	 d7MhSpH3nADe1NnKhyg0i4gs2XedIJr9C2UV/wvW3f7N8HAjDJYGKWefWow073OawC
	 r1tRdjT9yNiGFmLyYqG8RGKs+MtRbKcar17cbbdZ+KEdu88XxUDiq1E83LiaOGLiLJ
	 2L3/gOtRqY/fw==
Subject: Re: [PATCH net v2 07/12] net: au1000: fix buffer descriptor free list
 insertion
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org, jeff@garzik.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Mon, 16 Nov 2026 13:50:46 +0000
Message-ID: <179483704622.3136.16694282680991633445@kernel.org>
In-Reply-To: <20261112045301.3669532-8-f.fainelli@gmail.com>
References: <20261112045301.3669532-8-f.fainelli@gmail.com>
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

- [Low] The commit message for "net: au1000: fix buffer descriptor free
  list insertion" says the old au1000_ReleaseDB() "loses free…

--

net: au1000: fix buffer descriptor free list insertion

This patch changes au1000_ReleaseDB() so the returned descriptor's pnext
points to the old free list head before it becomes the new head. Before
this, the old head's pnext was set to the returned descriptor. The new
code matches au1000_GetFreeDB() and how the list is set up in probe.

> ReleaseDB links the old head to the returned descriptor and makes the
> returned descriptor the new head without updating its stale next
> pointer. This loses free descriptors and can create cycles. Link the
> returned descriptor to the old head instead, matching GetFreeDB and the
> list initialization.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

[Severity: Low]
The code change looks correct. Should the commit message say that the old
behaviour had no runtime effect, though?

au1000_ReleaseDB() is only called on teardown paths: the err_out unwind
in au1000_probe() and au1000_remove(). In both cases the descriptor
buffers and aup are freed right afterwards:

drivers/net/ethernet/amd/au1000_eth.c:au1000_remove() {
    ...
	for (i = 0; i < NUM_RX_DMA; i++)
		if (aup->rx_db_inuse[i])
			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);

	for (i = 0; i < NUM_TX_DMA; i++)
		if (aup->tx_db_inuse[i])
			au1000_ReleaseDB(aup, aup->tx_db_inuse[i]);

	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
			  aup->vaddr, aup->dma_addr);
    ...
	free_netdev(dev);
}

The err_out path in au1000_probe() also falls through to
dma_free_coherent() and free_netdev().

au1000_GetFreeDB() is only called from au1000_probe(), before any
au1000_ReleaseDB() call, and no RX or TX path walks aup->pDBfree. Also,
NUM_RX_BUFFS equals NUM_RX_DMA and NUM_TX_BUFFS equals NUM_TX_DMA, so
the free list is already empty after a successful probe.

So the lost entries or cycles only ever exist in a list that is about to
be freed and is never read again. With the Fixes: tag, stable tooling
could pick this up as a user-visible fix.

Could the message say the bug is latent with no functional impact, and
either drop the Fixes: tag or explain why it is needed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112045301.3669532-1-f.fainelli%40gmail.com
