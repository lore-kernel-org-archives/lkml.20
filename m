Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154106;
	b=qfbGgauNNLXu4KZ6VO9I5l9rDfwMmvEdZSFHVISZLqtjyYCSd4QzVoxVXwU2flHNNnNU
	 Gt0uavc2GHoe8Ryil5b1ldOLkZ0G+A3IPltoTDUclQZaOgLzY3dbLfZmcX9ra07CPgkkK
	 kpu/6U9IEgnQ3QXlkqKHMsVmIiggMP/U1BsVbwUoHwEI7lMNGSA7z0JvD5aWuiqNIokS+
	 5TIBwfW+w3uoUwYZMvdbUmnfcOAFpmQHsvhQcNNCz7oczOmTayqigkyJfA/KsvYRW55lz
	 5CwMl8Vnaf1KcZ2S/w4FZ2AFuGg7jLBNENKRidC9h4cozjyVP4/0fRyFExX7qk41rZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154106;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=yvbnuswRAXkLlEZEOKJhfn9CgxvlmHuarpSPqS5Km4I=;
	b=S/9oGwpNkZUgYyrRit9bm9o+aoGPsWwBA+NJsFjHkA0IYNUkl1JPJJYlYS0GtyczOQvG
	 UvVCHT1wEGZXF/yQQSFx6jBdD4to6LKH5Sz53C3NzszUo9/ibJm2uRF9CdbC2p6dIiKze
	 9PVHnS4s+IafgnxpGEw9RdbMBYCKin5TJlGR+FIdVFYRsOoNUYSuszu4KBrG5OsEKpl9H
	 bzVYhoRugLhKHMB4IQbBZcgjewkB8f4zC3ysw0pvE3NLA6cFjIvq4iJDi2qc1L2jq4ygp
	 pcwUNPkeumfvGmQmpAn8AyKLyodyB0ttmGzmde71exwrQtFr5SkHN5Xg1+2quxk1Myw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZjYVER9W;
	arc=none smtp.remote-ip=91.218.175.33
Received: from mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E977C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E977C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZjYVER9W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=T274q3t0zByFtrwkspOzoZhgms0KPFQlU3UuTQZ4/T0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793154103; v=1; x=1793758903;
 b=ZjYVER9WwVXTxAu/l2BZSI0F8uE2tdUvxUPyrE/DAQNe3gq4dQcf53zxs3JIsSn7eiF3xjam
 w5UHFd0Xg75T/XIaRHiQ8GGbucBXDu9/MLraPB9t+iUq/zDo+ojR4FnnpjD8K4I9+QZG+O3OsdJ
 o/iTtN8RHz0/tPQ0gI5G95Ac=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 935717971550bebf;
	Wed, 28 Oct 2026 02:21:43 +0000
X-Mizu-Trace-ID: 935717971550bebf
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 10:22:24 +0800
From: Chenguang Zhao <chenguang.zhao@linux.dev>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2] net: bgmac: fix oversized RX frame check
Message-ID: <20261028022128.GA201431@pc>
References: <20261028011035.49201-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028011035.49201-1-rosenp@gmail.com>

On Tue, Oct 27, 2026 at 06:10:35PM -0700, Rosen Penev wrote:
> While reviewing commit 77dac783f11
> ("net: bgmac: rate limit RX error messages") , Florian spotted that the RX
> length sanity check compares the length reported in the RX header against
> BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including the
> space reserved for struct skb_shared_info. The data area handed to the
> hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
> BGMAC_RX_FRAME_OFFSET bytes into it, so a valid frame is at most
> BGMAC_RX_MAX_FRAME_SIZE bytes long.
> 
> A corrupted length between those two limits passes the check, and the
> following skb_put() runs past the skb tailroom and calls
> skb_over_panic() instead of dropping the frame.
> 
> Compare against BGMAC_RX_MAX_FRAME_SIZE instead.
> 
> Only compile tested. Not tested on hardware.
> 
> Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: replace Suggested-by with description.
>  drivers/net/ethernet/broadcom/bgmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
> index b3a92ae95de3..6873c7bb7a14 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c
> @@ -455,7 +455,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
>  				break;
>  			}
>  
> -			if (len > BGMAC_RX_ALLOC_SIZE) {
> +			if (len > BGMAC_RX_MAX_FRAME_SIZE) {
>  				if (net_ratelimit())
>  					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
>  						   ring->start);
> -- 
> 2.56.0
> 

Hi Rosen

FWIW, it’s helpful for reviewers to have a link to the
prior patch with the new revision for easy reference. :)

Thanks
Chenguang
