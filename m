Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC0E3921D6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485428; cv=none; b=cJYp1qAALtkapJxkJd+LSvA4d77o1oRCihEvL5wVDY8nRCvQDbBMk3tHZ764gqmx0qRr8HyOM5LDlbpaYb7l60gqr3oj5pvTSavisqIzimAv00hGRfzQU1Y7b24iyl+AOKwewrQq2NdNqctSBhEAZ/Z+0VyZkRRfaKh/38dvekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485428; c=relaxed/simple;
	bh=blDRYnm+eYgcYCYVIwypwt6R81KRKfjTWhx2Jnw4ho0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k78T7idqnOJoOUQa8jOSCpK4MYkR/cVwrpmIW48ZEhDZ32WaUzzymqmj9u7DaQnqTSw/cjVThiCpGJ2i3jtHcRzlv58H9KqK3iGpirL0SFfcyww3N8OtCkboW+GYSxGsHcaNXqF5sGyPZRot+o8PhQ3B+6LyQOYV7n3mtBrZUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A7sRKtXM; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A7sRKtXM"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-5351d76e1baso47735321cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485419; x=1792090219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ArLs8huVVv4YGyFYXEbwrJuK+8e9tYytWAQhJ+uGSg0=;
        b=WN7a4Csn5Jg4iR47Zy+PziNxARDxcrB7u4h5On4+wr3KriVhdtbQhr+h30fpW8cLSf
         RnMX0C7BTs9cWPPynULGS1p5lmJiwiGP1XS1GvG1uhaqzs1mzJFusz5qn6FOZ80SAGkH
         fyDb2UOA6sMQcXwqOzA414b5+RLxDrFCuh70U8pIfnZmysq2SeCnwoUIzPlrMXdiH0E3
         AlqE7riK8jwDIvA0kCjCMlzuenZY3cxvsHQ0h/dLUOXMTAx8axK8XmKRlRrd6DxFelhx
         6+L/FDNxaf21iOG+xcn9RTuOJKDmkINhob70ML2KLGXzohcuOIQYQ5GDr47nYFcNHhu0
         Wv1w==
X-Forwarded-Encrypted: i=1; AKwUvByNLc7xpsKY4OVrhR7OeStIwWfdLQSnT3pC7UX5W7jkH3/BLWD8ZCsTbV8yEakVDumD+T4QvfHk8IyVBeg=@vger.kernel.org
X-Gm-Message-State: AFuF++ln6aweIdeOwdmGVLF0BI6fEmAZUhqDN1739bmjZB+p9k+6DvyH
	8uqP4RI6L5w/FEW3mfPFPmzJe/vU/w74QPdi0wZHKoV7UHYwf0tmY8d6kXqStF9i+NkNm+Ay9cJ
	zCCFBr7Amyx6NJ/N2jPzZHP/ct9GnGE2NN/yQ8SfYQeoDpjqaDEwTHZpa9TGYiNy3f+neAML3vr
	yDVtnYHbUgDI5+QU5OPD7RhAk69VxnZuYReoJPwQd88HjqY0yTkJ8p29FLPmHtGg8tXEOmGQgPQ
	KlNWMoZaqVWZbDGzxCqSboirA==
X-Gm-Gg: AYBFou1xSF6NwBkJHc6Rxjdn0puwORRLsvcwlekEjKs9Tpm7QvcEazFWI3B2U8OlmQp
	W39zE+UjR5Xkw7jvCU+owVvKvylnGzgBt9+KR4QnMpx0BrK+LNx5BJwqzfVv9tV3vy5pz42G72F
	80EaDprqzAppbI4QduH2dJtIxRg4yDIaes8yjbdjmtcsDxQM5N8J3tnw8DCUvnrrYZhOupC9VnL
	sG/j3aBONdSXmoZUI4zw7dZQQXR/+fxfwzR4QrbFGW/KbtBmxxceLUgcrO+jrRaZwxwT5qOLxEB
	cN3oaDyIjONXYpQ/+EAcUlqxSZT8CuL/i9RXragkxRI0tKcQKP/Idpr+E7XnrXmkxViOim0RbAp
	88tjbnoqT/AiW90RhUSskiiRkBNiJBZ6GMqKVx97aQpXuuhk4gp+Ar5bCSRuf1j+I3wTr0CFrPi
	uwRbOCoqWE7D2U0igGtudsTUwg/BIwC8RjSGLWqt4+sg==
X-Received: by 2002:ac8:5ccf:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-5358a509e9bmr54444521cf.3.1791485418604;
        Thu, 08 Oct 2026 11:50:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5359b786d5fsm3611cf.25.2026.10.08.11.50.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2026 11:50:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2d93b92937so553344166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791485416; x=1792090216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArLs8huVVv4YGyFYXEbwrJuK+8e9tYytWAQhJ+uGSg0=;
        b=A7sRKtXMmnGbmAc+MQRlt3NsqFrX+5ArbtLyjIVCezg7tzxcRu33F4DxTXZL1RPYJd
         F+sSNv6Ey4nEKtnG2upGB+Guln2Mxhm4wx/5oZbiqhs5ZvulMC4yKynWnJXuTPeXy94k
         xI1ioDWD44OCUT2iS8SLnO+uUr4GyvTWcMEFg=
X-Forwarded-Encrypted: i=1; AKwUvBxOGKsTt0F5t726FfbXYZ2yaTKBMKulkB13E43Ey65VUEYl2Xrlh0NSHNJmBYd8er3Q64eiXS2o+VM6jWA=@vger.kernel.org
X-Received: by 2002:a17:907:9714:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c31a6dff0d4mr4826066b.7.1791485416088;
        Thu, 08 Oct 2026 11:50:16 -0700 (PDT)
X-Received: by 2002:a17:907:9714:b0:c2a:ad55:b3fa with SMTP id a640c23a62f3a-c31a6dff0d4mr4822066b.7.1791485415048;
        Thu, 08 Oct 2026 11:50:15 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a4755f97sm6735666b.10.2026.10.08.11.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 11:50:14 -0700 (PDT)
Message-ID: <08bc02e9-77ea-4bcc-b087-de720d2449f7@broadcom.com>
Date: Thu, 8 Oct 2026 20:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: drop glom superframe on header parse
 failure
To: Shirong Zhao <shxzhaosr@163.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20261008103312.20-1-shxzhaosr@163.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261008103312.20-1-shxzhaosr@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 08/10/2026 12:33, Shirong Zhao wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
> 
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
> 
> Verified against wireless.git main (9727d1c4e1c9), the current
> wireless fixes tree.

Thanks for the patch.
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 381801af3..53ffb8dba 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -1649,6 +1649,18 @@ static u8 brcmf_sdio_rxglom(struct brcmf_sdio *bus, u8 rxseq)
>   		errcode = brcmf_sdio_hdparse(bus, pfirst->data, &rd_new,
>   					     BRCMF_SDIO_FT_SUPER);

I would avoid the extra release/claim host below. I modified your change 
to what I think it should be:

> +		if (errcode) {
> +			/* Superframe header is bad; rd_new fields are not
> +			 * valid here. Drop it like a bad subframe below.
> +			 */
> +			brcmf_sdio_rxfail(bus, true, false);
> +			bus->sdcnt.rxglomfail++;
> +			brcmf_sdio_free_glom(bus);
> +			sdio_release_host(bus->sdiodev->func1);
> +			bus->cur_read.len = 0;
> +			return 0;
> +		}
>   		sdio_release_host(bus->sdiodev->func1);
>   		bus->cur_read.len = rd_new.len_nxtfrm << 4;
>   
>   		/* Remove superframe header, remember offset */

Regards,
Arend
