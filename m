Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525953;
	b=4zjJzsNacFXukcilStnIjyCMoBMF/vUheTDNYf6OK0qMmnOAvrPeOUnquNkL4ZGQPaKD
	 +e7ZhhvW0kxXuvqEMzKCs44kBWXmUXRhI/ZTDUlRx4s3k73WZyiQPMRsoSFOFbiROP+46
	 4BfyvzI+an7dzZmgJPZJXWTMS+zbX6ITxklPzrvqGhJ/mwFxmOw5S/UNOGZC3jYUzw8U3
	 xgq1U8WJ76J/c5awge1xKjifmOXCCFgwz7ggL9AYnVaOFqzPa98y+FVXUCYgZPQj3rd9b
	 UL4T730LvaXxhDlDr+Y1d4ZsjMLdv3yRJLdsahqgz1N5OtgvKLKmCoY8YzfS8Ya+9vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UIlLpTslQoJi/WhjaJsyed+o5SEcLwojJ1nZYarv590=;
	b=Y1n6pZ2FQRep2ZuYLklvkyvAR1LvaKiGw9CSe6CTS8ZYcPMQ/iWR3JEf1Cpg50e9ywgY
	 2AHaKtFe1OMmuBVh//RDWbbH41WbfTwyUwvIR/Ve9DHkifskVvLhD+AU5pQPTAWWoD+SH
	 fi3efqpss8VuQhhHpDuIQgbkxGew1Jq9p0rBVfRZvHnEVkVU29DUmBvAg8xM8b/FIMsrm
	 UcusI+mkli9RFlakiv7aOCKoTRwLhahjqdyH5rXM3veqtjceTI1YRZvoERdcmkQ1zy0ia
	 LJHR/gfWnf9L/BB8UaIUStMrEogECBXCRQoAIG/WrK4/Y8MzxJq+iBOXR6Fg1V+N/0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uNI1Z34g;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF56606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uNI1Z34g
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so500621cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792525951; x=1793130751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UIlLpTslQoJi/WhjaJsyed+o5SEcLwojJ1nZYarv590=;
        b=uNI1Z34gD8pS88g49jQxXOZaBvAGB0cBTDIgRmV6x9KW0twHtFcBQlmx6HA/N2Fjon
         p0wEvG0VhrjjGEBCWw+b+VEbzx5e5Pvvi1KlFE7YPYuvGBL3xC2gz690oFUYpsLhSbRR
         TB4tO5JFjx3mSwEqQOaRU65X1milSpXqeeJc+F+JN2FeC294yraLg6MzCTMvAcWr0geA
         oQJLuE25SLr3CzajQWwEr/RoHxDGs1XFnpzumziYtG5TMi3GQdF/nURm9jfNB3YUrVGM
         zB3oFo6091mIAa54aZ/WZkZ6oCmPLQgWbgqbGQV8mc44P1oPJ+q75ShSFIiVtr9yvNts
         gFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525951; x=1793130751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIlLpTslQoJi/WhjaJsyed+o5SEcLwojJ1nZYarv590=;
        b=D8KdKCREPpvg5B+Ded5Cqi0nlj7qWAsPWHUhbe3N83aGDQUTsSOROQBqpN6I6s8Pv8
         iMPzJgXmodZpMFBie9bSs7eipxZPrDOZdlnIsZ5kwUkaBF7kkNn6UKuM9+H/QwJFl3An
         FNU3TkBfyS4JAivHU2wCZJEWGuLig2U/6d1V/s9NJKh/kEbz0rc2Pk2NCXeof1adBDqx
         3D0XtliANPQ4emLeMfMzopDo+NRhRNb9nFJf3/ihkntENtXZT1h2YfrwCuQWc5/eOV8v
         hWq+IX7/vC+S5KzjdvU1m3+Ak2ReP2GJaihPNMPKfh0fQdsRjHnZobqdFFh3hWYuufZh
         nZvQ==
X-Forwarded-Encrypted: i=1; AKwUvByhndCHVMMR5az3er9ZVSO6fNjUeM1O1L5QzfthgaByVLi0fm6H4KjIFcdjsqKWSfRNVd+GUWYDzmB7GIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh+4beYhssKivv8RVwb0Xrzk+NMlDXxCdRb4dy1shR6yhLb4PA
	YmJCw0fZwb94HdJTKdTR0/nmo6JsM9nzrSiKnrvdjvVp5mu6j3Ivoqk9gtJxLc+iuQ==
X-Gm-Gg: AYBFou2brnl522uFT77edcXT1spE59qN5a8goyhmhvSHfLjEind4z2Eustxi58vhsHl
	oYqTtg+14YQrG+mCT6nKtX8Q4LlugbePThzU+/X3sOaGrHPBVMhYD3UbCYY9cm/1vZmpC0avyP/
	B/w+0hBguS06HCOmsf7DfF2E3BNJ/Oc8xwpCn4YJc/VKcIPPFG4s2lo2TVHi6ZCbBXZRiPMkAWy
	J9qnDvSLhd4VFyt11ULqpNDluGXdtReAnSdO0mCCuNTHq5NxPuaEgbJFjO1hPiDAlUHMqu1fikb
	XVtPe1Q5Dct2Fqh7aHn8Kepw88+huore4pISXhHcJUyVwOJTutwCXj9SKTYXEzsozfNEEdRGYYP
	76gD9uirBKWBnV6AeRB/VxKR52ItFoG5gc/zcRwwje9okcWFc3LzKO2swRDo59hcpqY8i3IxxQA
	v8WspGUDm9KgqOmpqemdlfbfclG+dNUYGYbr8plJsQjJEoDD9iPn86s49zUitEHWlNjdNyQXQIm
	Q==
X-Received: by 2002:a05:622a:229d:b0:535:855e:6e25 with SMTP id d75a77b69052e-5364604517bmr169421111cf.47.1792525951439;
        Tue, 20 Oct 2026 12:52:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae6077sm3873891cf.6.2026.10.20.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:52:30 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
Message-ID: <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>

On Tue, Oct 20, 2026 at 05:05:39PM +0200, Konrad Dybcio wrote:
> A PCI HCD can be surprise-removed after suspend_common() disables it
> and before resume_common() re-enables it. Avoid a second call to
> pci_disable_device() in the remove path when no enable reference
> remains.

Does the double disable actually cause any problems?

Alan Stern

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/usb/core/hcd-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index cd223475917ef199511311eda5c6aaef073b0ad4..34c4d352b40c40c54cf17c30fc264833ba05bcd6 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -348,7 +348,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>  	usb_put_hcd(hcd);
>  	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
>  		pci_free_irq_vectors(dev);
> -	pci_disable_device(dev);
> +
> +	if (pci_is_enabled(dev))
> +		pci_disable_device(dev);
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
>  
> 
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20261020-topic-hub_pci-903b8c18d17b
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 
