Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F7346FC8;
	Sat,  5 Sep 2026 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788631933; cv=none; b=lnS+HFrLUnQFwvghTjgQMvO7eJaH2iVPdhScHLFKS1mH94q9+OfDHTpFjnxdMUXOkHy9M3fyalr42N6TpawW6UL/DN0belB9XL7cajhWbIWHqQwvBA9dtrON8OSlfdkEdMxK/+mZph6hOaJksw+ZdHjJrF974Or3KtokSNs3Pko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788631933; c=relaxed/simple;
	bh=iefH9q1pd+GkuoEsU3tLz95fk9C3OrS1dc9ZkCKgPPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkJK+tFZgEZs9K1KqgPTMv4B3P6W6tArr3SW+lHyTUJwzgHiKFPn/TPM6nnBqzW+NG0NOGUV96wPaks6WM14DT9xFVfNGiKQWPBkDPQPQoGp/xUpIcmeubH9YG4hSUycZwrNlRL2/jcRhzU7ZPjRj7zCcYsgndIDg3ENgm3VJe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tf3U/0DT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tf3U/0DT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8kU9Nsdqv1tJdrZJ6JkKE1a1K198TJT1vXd1rFmY79I=; b=Tf3U/0DTmuH6mdNBX+YbMCfYBq
	InhDpYkgrTTzzcFNNy6K1OX/iMVV1ji7fV6s921/byN/6erdjySTZ1yq+5OQv+OM614Es+yIdM81s
	O2xPFKrIfNOtJ/hu16mier01ZSvbeFVsMVpPojPg9ZkZlDYVAbH/Hv41jcWelocwwTPvQ/hzav+7H
	lUFB0BicdJvlDfq5Jqie+xIhZCwkBS7DDzEJs0cdiLiWDyWSOh94+JpCDUZ0WwN4kfZRGkRf0ZLEV
	+90JouAOJxAs7z875U2LwEEqOTv2gYRhGqNg/g1excLtwd/PxU5lIRMINil36vnkqmWKoN/TCqIl2
	97gMtSvg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2us3-00000004JMv-1lpM;
	Sat, 05 Sep 2026 18:12:07 +0000
Message-ID: <96b5a050-cc45-4b33-acad-13b473690a0e@infradead.org>
Date: Sat, 5 Sep 2026 11:12:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: misc-devices/spear-pcie-gadget.txt: Fix bracket and
 whitespace
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905074641.811164-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905074641.811164-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 12:46 AM, Manuel Ebner wrote:
> Add missing ')' and remove needless whitespace.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Whitespace patches usually fall into my (personal) category of
not worth the hassle or time. Anyway:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Oh, there are 3 places where "MSI vector" should be "MSI vectors".

> ---
>  Documentation/misc-devices/spear-pcie-gadget.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/misc-devices/spear-pcie-gadget.rst b/Documentation/misc-devices/spear-pcie-gadget.rst
> index 09b9d6c7a..13333a209 100644
> --- a/Documentation/misc-devices/spear-pcie-gadget.rst
> +++ b/Documentation/misc-devices/spear-pcie-gadget.rst
> @@ -37,9 +37,9 @@ read behavior of nodes:
>  -----------------------
>  
>  =============== ==============================================================
> -link 		gives ltssm status.
> -int_type 	type of supported interrupt
> -no_of_msi 	zero if MSI is not enabled by host. A positive value is the
> +link		gives ltssm status.
> +int_type	type of supported interrupt
> +no_of_msi	zero if MSI is not enabled by host. A positive value is the
>  		number of MSI vector granted.
>  vendor_id	returns programmed vendor id (hex)
>  device_id	returns programmed device id(hex)
> @@ -53,7 +53,7 @@ write behavior of nodes:
>  ------------------------
>  
>  =============== ================================================================
> -link 		write UP to enable ltsmm DOWN to disable
> +link		write UP to enable ltsmm DOWN to disable
>  int_type	write interrupt type to be configured and (int_type could be
>  		INTA, MSI or NO_INT). Select MSI only when you have programmed
>  		no_of_msi node.
> @@ -65,7 +65,7 @@ device_id	write device id(hex) to be programmed.
>  bar0_size	write size of bar0 in hex. default bar0 size is 1000 (hex)
>  		bytes.
>  bar0_address	write	address of bar0 mapped area in hex. (default mapping of
> -		bar0 is SYSRAM1(E0800000). Always program bar size before bar
> +		bar0 is SYSRAM1(E0800000)). Always program bar size before bar
>  		address. Kernel might modify bar size and address for alignment,
>  		so read back bar size and address after writing to cross check.
>  bar0_rw_offset	write offset of bar0 for which	bar0_data will write value.

thanks.
-- 
~Randy
