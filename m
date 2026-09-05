Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0B32C94A;
	Sat,  5 Sep 2026 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788627960; cv=none; b=KzIOyeUOCFN++6pGdHTNRax2jrNmeMTI3Mnw1rw3dpeqEdz50HdCrTuq3FKnNJs6TxZa/qJPRIqPkJ3D8MGetTsfql6rgFkhCTIKyk00x/wsrcHrUMwBROS44cATCnvQ1tQDD1VlAyh7WB76HBF6/0kBtNAWKNIbxFrYT6S/RIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788627960; c=relaxed/simple;
	bh=V/8l6A7IENiBuA2YSU5T8wCuo75hID5HgkQ9V+zeckc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IA9LAopd2774sgIOIxdWOdCj9rtOGUG8FsUgjyuDQMOsbGcP/8CBN00JyMm/B+2klIoSBxcrds7m3coPSMP53MGPCeU+j+LNe3jMkCkGsibwmXBfMLNHbBLIdIqzd45U0+LO8Fog7OzVnxNWXug6fQ38mv4JfLbon/vv1xyw0RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UqOBzCi7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UqOBzCi7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qmZH9q9kufEUy1jTaca6RNUrYRmozYH3C1knchUK8sU=; b=UqOBzCi76YsTh2S/nxaaVb+KLS
	sUKTfk3LqZ27dFEqoZRsxfscJmKiPZwLsP+6NcDUyhh1HspikuG2CsRnfza3q8TmFTbI0A0YevBmw
	FoFhKPqQgAZ97J+1HHT435RH4+pL3ILMaDSp6//G0yeLxHg4JngkKf2BJxK20Bit9kz2pNyBfspiC
	LXr+Z+wToHm1cfH0nyYC6fa1rgRVEUxd7CK+yK+e2CBTHcewbW2FbvPUGfAY2b9JqStX7ksjLJsk0
	VsYOlrL6rLkOyKikOrMWxAAFe4M8XfznUFUhzcE4/YjwdXG2VXnnFavuHhzjwyRZ3DJhGBCSOAQfc
	I6VkIn/A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tpx-00000004HKr-0Wb2;
	Sat, 05 Sep 2026 17:05:55 +0000
Message-ID: <a6cbbbd7-1633-48ce-a68d-c960544695cd@infradead.org>
Date: Sat, 5 Sep 2026 10:05:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: reset: Use fwnode_reset_simple_xlate() in
 the kernel-doc directive
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260905085211.40286-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905085211.40286-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 1:52 AM, Karl Mehltretter wrote:
> reset.rst asks drivers/reset/core.c for of_reset_simple_xlate(). Commit
> 9035073d0ef1 ("reset: convert reset core to using firmware nodes")
> replaced it with fwnode_reset_simple_xlate(). Since then the directive
> finds nothing for it and the default translation helper is missing from
> the rendered controller API section.
> 
> Use the current name.
> 
> Fixes: 9035073d0ef1 ("reset: convert reset core to using firmware nodes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.
 
> ---
>  Documentation/driver-api/reset.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
> index 7a6571849664..932699c57d1e 100644
> --- a/Documentation/driver-api/reset.rst
> +++ b/Documentation/driver-api/reset.rst
> @@ -213,7 +213,7 @@ devm_reset_controller_register().
>     :internal:
>  
>  .. kernel-doc:: drivers/reset/core.c
> -   :functions: of_reset_simple_xlate
> +   :functions: fwnode_reset_simple_xlate
>                 reset_controller_register
>                 reset_controller_unregister
>                 devm_reset_controller_register

-- 
~Randy
