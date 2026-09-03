Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85EC4519B8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426400; cv=none; b=tfTkYnVb3azvTvXGsYCONp9zIezdxa1H5EZTgOvBbomR39npoyXI2Zct3wVC3EFNYDSWVqOJRDh//FrhwTgT8087TgdVwbekxcpdJP/Hut1xqki5BOMXcZxfk02f/Xr2QfPUEYVzMAiKHEi6PpdE1XOIUDTDG120aPCs0jE2Co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426400; c=relaxed/simple;
	bh=l8KBUmIXxPbS9c0iCMD1zbBiYJzxawY6rVQk2WWCIFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4Mo94hHGIeuqAhj9fpjbPBY6UhDNaJFIERxhichRkQMgHXc1Wcott4L2qtDqwfwvvzVklxaZfuKjQPxqzNZU8FgWUdBmkJ52isf2GdOjvvKUxaRYqnV+u6M/GOJU2p6Qi/jm482QOHvY/oFX1h2S8ReBQSSG81NqUtYlOpVPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NG/1tmdQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vrvhw0BT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NG/1tmdQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vrvhw0BT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788426396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOwX+me4lB9EKO0+pZdoRhc4re20aH+MSGIDsmBiCEA=;
	b=NG/1tmdQermYVyTRlCNEq1BohDJ1LtLuHid7Ru9aGhqQVL2pgWq/8XatFAOZlbozJPxMOw
	WKJMldIlXP2mDAHvweGXWifY4yBQiYA2zx+shx5J9SR4vJlgHP3GPMKoo5RjMurHngNR9e
	o4YvyeyxIaJoYJzykDK6OTgR0+eCGXI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-BqVSGaksM366YxDXUbeyfA-1; Thu, 03 Sep 2026 05:06:35 -0400
X-MC-Unique: BqVSGaksM366YxDXUbeyfA-1
X-Mimecast-MFC-AGG-ID: BqVSGaksM366YxDXUbeyfA_1788426394
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b0d7a07acso22775085e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788426394; x=1789031194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOwX+me4lB9EKO0+pZdoRhc4re20aH+MSGIDsmBiCEA=;
        b=Vrvhw0BTjAOlbuP8YDdOTJGpdbTwiSYWHLHqBEEeQcLhYdRjp1Lr0IwSjJ2B3xPxHF
         Z9IrUC5TarHInLwxHFJvtnPNhsu5Sxr/eAwle9fem9Vv1cD3Y/as3IvmHF0I8viQUCR2
         4WwL4vY9Oyjzvnf4x+/3xBoORemEDxaoNmykIuec8qZgVG30lj7z3X+zt4SAGig/z0U/
         tsSNSlBlGGm+VlNNGsvbsuiGKdf4xOVDV8HTjVFtA9BjuU+oE/zbjg9r2dPt+rOtvmpD
         kaH2k8FdD7l4BnXJ1EnyTX05/fjAWmZy1/4boQf/tupDc+stWUpsqELcxTfKkNcPH3Rd
         4Ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426394; x=1789031194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOwX+me4lB9EKO0+pZdoRhc4re20aH+MSGIDsmBiCEA=;
        b=e+5AdND7au8qsf5zTe9ZojVPsMRPMh2UqXgYHCUhn52Jqlg0R5Ot4ftmm4QSxPtahp
         Xse3BXcs4bs7vT/ABQ0rcH03+aCxkV0DgR0cgsVu2G+DSt0bS8AMipoLSDGg//GL4gZo
         BP35Xu8VSNlzOmtVlkQ1ZPztTKgS5KwgpgAh/neeo0wUEuMHb+V9LzfETECYGlY96V1A
         WnaIlUJi2rpXMFBQJ3gwBDcpc/UsPAxp5VgiFlbfHyVr8UxB5FpYvr8XAhZHZAKZs0pm
         NG58GfwNd8r6sHlcNX+MvHLxVywMhQGlAc0cU/7GwIiDQ0EijpJFItIymC7TFJC1JhPv
         QsJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA6snDXpNMDB+AVjRfRMfFJQrcvr/m/EwlpSsfnjxLVqWtG8SfoBEp9n3fsEzc+DdFdfJpQ9ThayBEcTg=@vger.kernel.org
X-Gm-Message-State: AFuF++ljU4c5qPvpgNc7SaQdGBlApZlAoif8Pbw32C6+1sBjFsRLMfHv
	ptVOLKl/OMmRlb46M9mUTG+pyUt6UDOeylVYGTm4tsn4s7o6RltHgjzi2gJ/FrLQe09qQgVz7Q2
	c1WIU/+73r/4osDoTA+RJonu64gFOhXgzEUt4jMCUqWX8RjWYVBTfv4hL+rXx3246JQ==
X-Gm-Gg: AYBFou2CBe3toBAMwiuYgA7CQRK5usOxJ4GYbZs9uJfJT+99eCm7/AXPebAfzl09o3P
	2z88BHRz1hTxUKvkTv/HQhQjfMFY8Lq2CgiWtMvO9LLnWgHZamBoyoaTOqreP20FdWFQNH8eKMN
	eLB13b7VF+QqPpMaWWqqWJnhM/9iiwWX4qSIRScJQJQ3e9YykszuacZVrvUpnfG/u9PNe4K+k4S
	H5ZhEoRyYiCsVSIHsrKUrXV/xWeemAfDFvkP1gMBZvPDKx0AA0WFCSVmou8h7UI4k6HP01l1QYV
	weXTYFlvesOHyZhgvnVmphHA0QGCkAfFVqaZl51Z/o8TDBm2+rykUMbQR/B5tA/fgNxKU7gk2C4
	fl6uQ9loa5mvR8j9OscoJVvunJ4H6h8WeYyk7u/Jk5s9giNK++hHuxKUM72B3qoKvcUxz+eHeSw
	==
X-Received: by 2002:a05:600c:4688:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49ce5822b73mr182742825e9.14.1788426394177;
        Thu, 03 Sep 2026 02:06:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4688:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49ce5822b73mr182741785e9.14.1788426393658;
        Thu, 03 Sep 2026 02:06:33 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm12526639f8f.37.2026.09.03.02.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:06:32 -0700 (PDT)
Message-ID: <2ba43d6b-f521-415e-a4a1-64b313051c88@redhat.com>
Date: Thu, 3 Sep 2026 11:06:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] tls: fix the open record check in the max payload
 size setsockopt
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 linux-kernel@vger.kernel.org
References: <20260901072927.128688-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260901072927.128688-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 9:29 AM, Jiayuan Chen wrote:
> @@ -862,6 +876,7 @@ static int do_tls_setsockopt_tx_payload_len(struct sock *sk, sockptr_t optval,
>  static int do_tls_setsockopt(struct sock *sk, int optname, sockptr_t optval,
>  			     unsigned int optlen)
>  {
> +	struct tls_context *ctx;
>  	int rc = 0;
>  
>  	switch (optname) {
> @@ -881,9 +896,17 @@ static int do_tls_setsockopt(struct sock *sk, int optname, sockptr_t optval,
>  		rc = do_tls_setsockopt_no_pad(sk, optval, optlen);
>  		break;
>  	case TLS_TX_MAX_PAYLOAD_LEN:
> +		/* Take tx_lock like the sendmsg paths do, the socket lock is
> +		 * dropped while a sender waits for memory, with no record open.
> +		 */
> +		ctx = tls_get_ctx(sk);
> +		rc = mutex_lock_interruptible(&ctx->tx_lock);
> +		if (rc)

Why using the interruptible variant? the blocking lock just after will
still ignore signals, and this sockopt will now surprisingly fail if a
signal happens at the wrong time.

/P

