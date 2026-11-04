Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792624;
	b=IXZTT9iQuZBGHvEEaMaS/tZO82I+nxX7szXAyghGcw0xjjTxkZSG9JC0+ykev7luGt0S
	 86zF1rYNAcRu5SHZpj98JJdjS1NJBLOlyLkBOZNa/G3SBT2rzyiYFMVzwwmPGrM2Q6IbV
	 +0o+GXVh46CpoHOnqZJwO93lrkcE5+WYnBGmd6JZ/WhUmspOKW9mGt/xIQWzSgFbMDFlx
	 glWbJ3Ta4GrO1JSlu0Yn4f8oqUhT1OOSpvGgKtRwXFccMEhPwXEAwlASmRqkzQJ3nhL13
	 Vlz+BZfbzkgAQ1j4+xjhsR9PwrQkhRhsYqrU0aOa82q71g15eZxhbvhLc/tofhFycDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792624;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z9ysQ+XoG+foncX/3jtWkWh7mLG1px8yz8zNNyKH3rU=;
	b=r7shsL2DygTfAankiMAg3ItAB9Cf+xiYbg34tw+z880vq1Bxr9BWOsyiqay6oKQKJAqJ
	 vcuZEYPvrHSt/i7iL38YME0TndkhPJe3vMDqOdOF5MmyBs0BfFCSapzCzYl2E/45NLifI
	 HdeZLGIyUepEMxfFz2wwOPl8Wu6/pA5too1FL6JyJ5r1wjp5RG8wUmQY8GMby4A8gZpfd
	 KiJ6WxsFWOLxOyT4HM6Ul5j83h/LvI1aAy85MwFWKOLfPa7VTFIYXvgHaJ8PKoqO/yRgl
	 OcXZRvNn2gzywvKuWSM6D1aSEm6eJelmckxFrfu7pca7qRUnWfhO47ec75MwfSSMaOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4D606A326;
	Wed,  4 Nov 2026 11:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A4D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 833DCA56A2;
	Wed, 04 Nov 2026 12:43:32 +0100 (CET)
Message-ID: <02af8699-0ac3-468c-913e-a374af1c8d63@gpxsee.org>
Date: Wed, 4 Nov 2026 12:43:31 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: mgb4: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:DIGITEQ AUTOMOTIVE MGB4 V4L2 DRIVER"
 <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
 <20261103153721.1232488-2-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20261103153721.1232488-2-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 4:37 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
>    split to simple patch
> https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
> ---
>   drivers/media/pci/mgb4/mgb4_dma.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_dma.c b/drivers/media/pci/mgb4/mgb4_dma.c
> index cae888e6504b0..c9a15c625be65 100644
> --- a/drivers/media/pci/mgb4/mgb4_dma.c
> +++ b/drivers/media/pci/mgb4/mgb4_dma.c
> @@ -55,8 +55,7 @@ int mgb4_dma_transfer(struct mgb4_dev *mgbdev, u32 channel, bool write,
>   		return -EIO;
>   	}
>   
> -	tx->callback = chan_irq;
> -	tx->callback_param = chan;
> +	dmaengine_desc_set_callback(tx, chan_irq, NULL, chan);
>   
>   	ret = dma_submit_error(dmaengine_submit(tx));
>   	if (ret) {

Acked-by: Martin Tůma <martin.tuma@digiteqautomotive.com>

