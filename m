Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816711;
	b=DJFU4wqm6fBmMICiL9KQ1yV+fKVQZFUgweybSg1+vs/ZZyjGkwRWVQEq0TlAeWYA6cmB
	 PDBltFe+BPpqdQi3OR6HJezPtGKZvnmCKBp4uC2PatBF28+8KeCJXIcbi7Qgi5H3p4ncj
	 +VhT5wvjS7DjX5jiPzSHtNTNcPdfq4GCCDIYFFsz3ZNrcIWPMgUNnhEhg7AU7I8hOHOnb
	 JsK5nQynRWZoB+hKQ0QtymOjAIsxJnAX4RT3jdyYYs1xiMDBB2aNDqSX7ioV6/t/EY+lL
	 XkCbj3MHqon/Cbb1MUbIm2GH68PyfYRBXVA7oXB+WRyN3JLleaQ3rr1PtN2OWG3FdBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816711;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YJ1NoOwTnGp9uv+1GPBLJ4q65rzDveNK7NonqGuiDRE=;
	b=ZncrFRtM/jGXTgVRKtZIhM4ob/izdICRCusGw1+pxgGef4aLGLbyA9/2Rb9HvtVE3kjk
	 VScAvak/tomet5FilVVBgOE9+2CqayBw//ptiXjbZrVERKHOh7AlsSImFdPZmZLgsA+Qx
	 4ZIvXCzuIUdSVfgv5qVcXtTsYI8gLXyy7Qk0QCjmpIqKKDx0pmX3R14O38Z5nDkg3rFCx
	 4lnK9p3AU4p7CgYiGwRYpdFgC6ckdjIXQu7Q1K7aX/TYSzHVzHG+ZmPdXM+5dJQGJm8+8
	 0xblm1vQTLpTxwBjKt3qxJgFDJp2SmEOrhhG7FbGjMX3oXKRyuvAryVCgiVRs9NgfBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="KZg9c7/a";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7552606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7552606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KZg9c7/a
ARC-Seal: i=1; a=rsa-sha256; t=1794816699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=af5UrpkllsfKo1dmxJ3IdVb0c04tk+zVCr+Nc3bSiY+k+97rwWBoUdksqy/tCL5H9otB7FrsOMQ1yBWuTLnpBkJYvC/DON/DaM9nDJdhNpnHebDh9UKWjXQ/+FefnXvtVRKUNOCsDO4pZwposQAk9/lWnuCz442O+kQsMukVBxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794816699; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YJ1NoOwTnGp9uv+1GPBLJ4q65rzDveNK7NonqGuiDRE=; 
	b=WlBILSxJhE/z69tli3az2obZsZdQfQDKT7uPCNj5agZooI/PRvSttSrWE0WMLfUrgDX6uCGBcOSMtbotVyvJj0r3QU9zYlteMO4Kl4cAO+r1PI9Pkw0w50fA1Lka9P08OoCC+mB2xXNwg7LsR3xiMKxuel5f0+dg/PmdQT+vEyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=KZg9c7/apzdDjni4w78hhAn9gW4BswROOCNL0mhvGg7Lqn+HcXl2VEnmiciiWbtHCC20o2arWvBmie8YMCZw7+2Fl7SlfUMSsr9cWkjV/a3XFmjcJ4IuaFaLTht1WoH/d/Dl77hei1rm8ntq5f/EXB0gcVBvthgkos1/iNNN67g=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=YJ1NoOwTnGp9uv+1GPBLJ4q65rzDveNK7NonqGuiDRE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794816698667477.9719472046512;
	Mon, 16 Nov 2026 00:11:38 -0800 (PST)
Message-ID: <1eaddafd-e243-47a2-b418-ec310071b61a@collabora.com>
Date: Mon, 16 Nov 2026 09:11:35 +0100
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
Subject: Re: [PATCH 2/2] iommu/vsi: Don't resume the IOMMU in its interrupt
 handler
To: aiyengar1990@gmail.com, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261113-vsi-iommu-pm-ref-v1-0-fd917eebdf18@gmail.com>
 <20261113-vsi-iommu-pm-ref-v1-2-fd917eebdf18@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20261113-vsi-iommu-pm-ref-v1-2-fd917eebdf18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 13/11/2026 à 21:04, Arun Iyengar via B4 Relay a écrit :
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The interrupt handler calls pm_runtime_resume_and_get(), which can
> sleep, in hard IRQ context. Handle the interrupt only if the IOMMU is
> active.
>
> Fixes: 917ace84b770 ("iommu: Add verisilicon IOMMU driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/iommu/vsi-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
> index 5d581be95333..3dec58224953 100644
> --- a/drivers/iommu/vsi-iommu.c
> +++ b/drivers/iommu/vsi-iommu.c
> @@ -196,7 +196,7 @@ static irqreturn_t vsi_iommu_irq(int irq, void *dev_id)
>   	dma_addr_t iova;
>   	u32 status;
>   
> -	if (pm_runtime_resume_and_get(iommu->dev) < 0)
> +	if (pm_runtime_get_if_active(iommu->dev) <= 0)
>   		return IRQ_NONE;
>   
>   	spin_lock_irqsave(&iommu->lock, flags);
>
