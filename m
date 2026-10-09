Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC34E0B62
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546680; cv=none; b=Bxmdbayc6bZbj/jlYiJIXTRTrBoNSz2IAumAPl6x9afZwUHKMYzQ3N5MPR+pDDoFNFa1W3KbzHdLQJU/2ifg+J0/bRECp6MZzrEJJ9VvBV9DKwSRHWQWi2YiZ9EB0m4+OhjRlZHT5Js6YVpSOIEzcRcJSlfba/BnJKDn0Q1rFLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546680; c=relaxed/simple;
	bh=+9VzHvUO+JK+X+9EZspf1HzY5BaMn/HduNK7JOTMGiM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ASEqAOJqdZtCnrwkCmugwwVC4OdQBOE3jpCT/Re24EoXTRI51HrRjNUyvG0OtTT8umjnDA5Ln7cjpmBJG8uE2OQMwF18vlNtoRJnDXrpImTTU3+KSVCi2qwGk8lPNkn4d+iI4mmNkZmW1WqsWnzLFTNE5ndPWKviIfJUkhW0mVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=thNEf7kX; arc=none smtp.client-ip=95.215.58.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="thNEf7kX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+9VzHvUO+JK+X+9EZspf1HzY5BaMn/HduNK7JOTMGiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791546659; v=1; x=1792151459;
 b=thNEf7kX3HJ1BvL0ELc3vdPL743dqD0O6vbegFIvPDHOha2tn8+Z7JAfXw3/rVY1Yg8r9mK8
 zfZUizxsZKIzDbX21I4dYNA2ijEAGv6ADDt48j+zwe/OlN/xQ8j8Tzp4V+xp93OE3sj+Q1OtJcM
 IGNpbtSGS7FKiYMpNABKjzzQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab5c969723dbd39a;
	Fri, 09 Oct 2026 11:50:41 +0000
X-Mizu-Trace-ID: ab5c969723dbd39a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 13:50:36 +0200
Message-Id: <DM0AA2YBXFI2.HD7B6PLDQ8FU@linux.dev>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <pkshih@realtek.com>
Cc: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <pchelkin@ispras.ru>, <mihaildimoski@gmail.com>,
 <tristan@talencesecurity.com>, <rtl8821cerfe2@gmail.com>,
 <dawei.feng@seu.edu.cn>, <learn.rahul.rai@gmail.com>,
 <branislav.klocok@orava.sk>, <timlee@realtek.com>, <kvalo@kernel.org>,
 <briannorris@chromium.org>, <yhchuang@realtek.com>, <sgruszka@redhat.com>
Subject: Re: [PATCH] wifi: rtw88: pci: preserve the RX ring DMA address on
 cleanup
From: "Luka Gejak" <luka.gejak@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261009032339.31786-1-dennylin0707@gmail.com>
In-Reply-To: <20261009032339.31786-1-dennylin0707@gmail.com>

On Fri Oct 9, 2026 at 5:23 AM CEST, Hungyu Lin wrote:
> rtw_pci_init_rx_ring() stores the coherent ring DMA address in dma, but
> reuses it for RX buffer DMA addresses during error cleanup. If
> initialization fails after at least one buffer has been mapped,
> dma_free_coherent() receives the last buffer's DMA address instead of
> the ring's.
>
> Use a separate variable for the buffer DMA addresses so the ring is
> freed with the address returned by dma_alloc_coherent().
>
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/net/wireless/realtek/rtw88/pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wirel=
ess/realtek/rtw88/pci.c
> index 66d2e5f51444..10147375f3b2 100644
> --- a/drivers/net/wireless/realtek/rtw88/pci.c
> +++ b/drivers/net/wireless/realtek/rtw88/pci.c
> @@ -298,11 +298,13 @@ static int rtw_pci_init_rx_ring(struct rtw_dev *rtw=
dev,
> =20
>  err_out:
>  	for (i =3D 0; i < allocated; i++) {
> +		dma_addr_t buf_dma;
> +
>  		skb =3D rx_ring->buf[i];
>  		if (!skb)
>  			continue;
> -		dma =3D *((dma_addr_t *)skb->cb);
> -		dma_unmap_single(&pdev->dev, dma, buf_sz, DMA_FROM_DEVICE);
> +		buf_dma =3D *((dma_addr_t *)skb->cb);
> +		dma_unmap_single(&pdev->dev, buf_dma, buf_sz, DMA_FROM_DEVICE);
>  		dev_kfree_skb_any(skb);
>  		rx_ring->buf[i] =3D NULL;
>  	}

This patch should cc stable so it gets backported. Besides that it
looks good to me. Ping-Ke maybe you can add Cc: stable@vger.kernel.org
when applying to your tree?

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
