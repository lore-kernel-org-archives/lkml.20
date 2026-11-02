Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619602;
	b=lXmE1tg1BFHm6YdKChmSIzsbWkyeIQWrTVuJe52AtI//fVrZhxwmpgLn8FZ/fYLzBHBL
	 fllxcyF+d3HAiGeRg5fxdNIiqFfZG+rXY4gkbEW1lhfhXMw1AwrO++B4PhFlFFjxi5KZT
	 NB6h3lYbAHxq+FVU7l+Ypm3gbONsSG2GI6kuuwDWt7wusLyfKFg4xN4arf46JqBH3ssFI
	 tWilWh3jQwc1+Bhx1+DQcM0MWJ7qVYO6jxVwtvdNg++7zITWRYUg2rx53FRAJ7nFq629d
	 eMp+Cchi7/+sewbnZtEDbCs+4YbwvCt5DTW7mxZ6Iisikltula6+YF2aIz+IQK8P3wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619602;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BVuyCsNuPDKfGswdTC+QFH5JQ3zW3jmol69S0GRJXKg=;
	b=KLjQ2SQ8/0BYXtLjv5TdPLW6GvKvBGblKUhKrZY06lQLHSxG7J7YFGFuZt5zycIce3by
	 s94v6UxzBusTuNiRvYuMdZg3XHLYpxTCUXIlmz8du4X1fJ7wKfHTEHfTgaWrtDVNey8YU
	 oKkbVJWzd4QhPvbYNBJcS1JZ1WJaqfSRN9PpnrVGwlKjNkFcrsfirTBaDRtzTMfRKMCd+
	 FxCN/zstuRbV0fKhFK+jrVkr6mtLRh6pYWHwJMDRq0V/7dUdPaoOwZVqq4SjoqOHCYxcp
	 r9KA6QSTkDKvLmOYgB+Jk2uqgPbL8z9ChPZy0m99jaSMHXN/r2ctgjeqUaTLangV/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nf4RMy73;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nEN0JHII;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BEB606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BEB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nf4RMy73;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nEN0JHII
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793619601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVuyCsNuPDKfGswdTC+QFH5JQ3zW3jmol69S0GRJXKg=;
	b=Nf4RMy73R9SduGIInOB6GjJkwav8nRyEZZFfvlA6LX3d2Js6s2FeuF5UiFhYPQj1TOFhxu
	+pepCmj/KD5gNBuxyAfUWxjOkQB9h1DXmmYcIT8BLd29oNqvT+S9nOWIzS/VNbsaUwBPTj
	BYMiXfWpMHHM/rPbuYvPQ8KEJCJEzR8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-ARsV7OMeMyq0ulpEn7Orgw-1; Mon, 02 Nov 2026 06:39:57 -0500
X-MC-Unique: ARsV7OMeMyq0ulpEn7Orgw-1
X-Mimecast-MFC-AGG-ID: ARsV7OMeMyq0ulpEn7Orgw_1793619597
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so27360065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793619597; x=1794224397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVuyCsNuPDKfGswdTC+QFH5JQ3zW3jmol69S0GRJXKg=;
        b=nEN0JHII4mPkqlER0y17oAezn9JUpYdUYZ0YQjlajHgjn13MgT2ny9hkkqSxMuNG1s
         PO7NsMYDsALDmvjGXZSUcag+Ene9nQwektWd8DzBtjxk8UeUrBr98wRcUSO/LCJmzydO
         oBHWefuu3VxGgsW3Ictk57IKTzJf30ZU9L4W6pbc7xo7fEvem5mHNJjod3RdipTWtdwW
         Qx1y7OaVUHCT+FT9f4/ts/CcDi6aF8Eb9OZZ2duPXp5Vg61hfnftpfJ/Be57Ca+5uP+S
         lxbPls6yb7i5ymBcyQI8HWq1eh2GCrk4uSA/1TX6QcKBzVatvBAKt8e07p9efKMpq8uC
         WVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619597; x=1794224397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVuyCsNuPDKfGswdTC+QFH5JQ3zW3jmol69S0GRJXKg=;
        b=C05ZgMgt3AxlzeFGTGjkMjVQq1nOzRHCMDuOyjoFumL/pViO/TDjP0L8Mr8JNe1R3M
         g5+pSgb2ldxVkWNYVEQt5SmpKTFY9p2hnedcV4Mvj9keNFq85h974y5F5CIqCkU9nTxJ
         rq9KFCs0FqXSk4EV3CaQreslAfXNbOpx3BvhF16SA+Pux3iA21uG2jDtkoC1raJF3z2p
         CdoiSYXuwZp+P9ThNkSD2HGYtEtPcy5mN0iAz0ief/vxxu+wfOHaCq7s1ZAIiUGGjyWd
         oJC/+jpFRto7ygZXl3u46EJISi8iCI9FkMB118PNpHQuFtrIe0EmIVNim+LOPolUWc3m
         vaNg==
X-Forwarded-Encrypted: i=1; AKwUvBw4VsYreKoqfXvSsE0N9VSFUDB8wF+koJaEd5VEwIyCRERLZ/HnCTlA8BuZfCX7g2Pci6cYA1gX7Zum4a8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAQQUYupH4dieVhqicM7fqIMpDrdtevl4WxPssrKjIIOVBRedZ
	tptzmJ+lnuIRnlpsXsFoDuWU2MuR3+7RE4zOs+hLGPReM0lIHvU8DiGPnEmE3qsHtTbYaiLTWKK
	smnFSQBKisUduxRn7U1QBuAOtYnE2PhBEd4QaGYpDo3XbfJlys+0luCBcgswkLPsuUw==
X-Gm-Gg: AYBFou2TiKgxXHqxpGYYcgLqlX/bFo3Y+DFEJ39EG5ZPF7NwbgUKz7cCAL+i4GkzeOU
	SFNEZdazvgTLMRur4a2UKf+v+VxLCR+BRdTENBSvMdgQiOyg5HaDcj9+k8GEXma354DyDNwdr6O
	bAB7OvqD7m4r6rUD9+fjTFsMzX0Dj8RqUhQblSVGW7FH0qt5IicXBFZZcC6AZYelhaLJBhe/v1k
	8vpKbs2uoMCtoTdDDf6gxwHLkBR35EyQ5mcREwnkjJvR17upUDrWpqjsSP/K6BG5pMohKdeF7bE
	lZ9P/9L/YjGgZeztXdBDWpo93P9CiAEjyLjecH+i73KC6r99J5kd1cifYM1UuulgHZUK8YN/Agl
	sUGZ+JZuQbFtLKtC3TkGy+NWb/k2iN6x07VABBxpj99m9YJ91Rc8HjZ+X+yWwRfeB5sgg+mrF39
	eC5yRRx+O4p/+kAFUHZ+IMQ+ZJ89UIMXRsywQMSvj5YV8=
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr228459935e9.4.1793619596754;
        Mon, 02 Nov 2026 03:39:56 -0800 (PST)
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr228459035e9.4.1793619596015;
        Mon, 02 Nov 2026 03:39:56 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm431693975e9.3.2026.11.02.03.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:39:55 -0800 (PST)
Message-ID: <c0021e03-2590-4aac-b4ee-9a8fdf26d520@redhat.com>
Date: Mon, 2 Nov 2026 12:39:54 +0100
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
Subject: Re: [PATCH net v2] net/mlx5: macsec: free struct mlx5_fs_id after an
 RCU grace period
To: Joas Antonio dos Santos <joasantonio108@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>
Cc: Cosmin Ratiu <cratiu@nvidia.com>, Boris Pismenny <borisp@nvidia.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <179313582625.87630.11382992904624255106@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179313582625.87630.11382992904624255106@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 22:17, Joas Antonio dos Santos wrote:
> macsec_fs_id_del() removes a struct mlx5_fs_id from its rhashtable with
> rhashtable_remove_fast() and then frees it with kfree() right away.
> 
> The TX (SCI) table is read locklessly from the transmit path:
> mlx5e_macsec_handle_tx_skb() and mlx5e_macsec_tx_build_eseg() call
> mlx5_macsec_fs_get_fs_id_from_hashtable(), which does
> rhashtable_lookup() under rcu_read_lock() and then reads
> mlx5_fs_id->id. A transmit that looked the entry up just before it was
> removed reads freed memory.
> 
> Before commit d4ece08f4b1d ("net/mlx5: Maintain fs_id xarray per MACsec
> device inside macsec steering") the SCI table held struct
> mlx5e_macsec_sa directly, and mlx5e_macsec_del_txsa() freed it with
> kfree_rcu_mightsleep(). That commit moved the table into macsec_fs.c
> with the new struct mlx5_fs_id, but frees it with a plain kfree().
> 
> Add an rcu_head to struct mlx5_fs_id and free it with kfree_rcu().
> 
> The same issue was flagged by the Sashiko AI review as a pre-existing
> problem while reviewing the HW-GRO for PSP series.
> 
> Fixes: d4ece08f4b1d ("net/mlx5: Maintain fs_id xarray per MACsec device inside macsec steering")
> Link: https://lore.kernel.org/all/20260909065542.4B80D1F00ACA@smtp.kernel.org/
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
Waiting for an explicit ack from Mellanox.

/P

