Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C21440642
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038501; cv=none; b=Jm21VDa0N/VO69VHTxw1ZQAd5fCjmWsXd8BxSpxLydMht0mdLMWOtU4rKm0/OSfhaSl3pdkjLYISW5JvBTpQbWEg2FDenQvVmgqLdV16aPwq/rEPDTjcEJ16heDOtlJ64UAnW+XnlavqS04/NVycJ3sYALP6OgdUU7yLNdukPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038501; c=relaxed/simple;
	bh=A81B61BRd2x1sSFxHm+OOFOqfMYEtzRTvPX8AsEKQ68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y78tCHDV3/C1kYwnRvFfcEBUMBQDR/dE957D21DJoHIlueOFefyABJbhyj2R2fAGlaJJpZdmyMRSEF56KB3g6L/omilpfZ82oe1GVg8lF6RvqPovrtUgwGCbcpLcMVZOqaZdYS8nfdYnQ9OjUUKAj9QQ8KHQf9nB5Ah8z6eUD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hS4PsL9G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tj9stkns; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hS4PsL9G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tj9stkns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789038497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8CFytEdCGSTDyDlAvIjNaZjMoqpFkxgcAOASoLn7Aw=;
	b=hS4PsL9Gcz1Iv6m99GXjVLYSsnwASWI1BRAjWZvy+TRVjZSWCPzqphGVurUrUHMRxQJFf5
	5zpt+F3p16CUuntXu/3jtnpoIjLQR37l7jNjloAKz2jREadILXHoSdBM+ouYCekLxbVVSS
	2kRoNUZOdzD/cjXwaQP6f4lOdYXuQA4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-FG43aPbcOVavErn9XA-hmA-1; Thu, 10 Sep 2026 07:08:15 -0400
X-MC-Unique: FG43aPbcOVavErn9XA-hmA-1
X-Mimecast-MFC-AGG-ID: FG43aPbcOVavErn9XA-hmA_1789038495
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so50018145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789038494; x=1789643294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8CFytEdCGSTDyDlAvIjNaZjMoqpFkxgcAOASoLn7Aw=;
        b=Tj9stknsmFyLalVHTz5fsL97nKqzThx/BaJqmTTbj/KBmvVG+40t2aj+eSlPmrcT5a
         zY9Ifr0XDyhby2a3z8eiewXGSEx8k8XsQCSz6Dtx8IOq6TJvNDfuZa3t5sUXI1n9f2+q
         x+w+YkWLD6ei1/hs4FhgryyNazsqt+S2MUs+dEoIRyQrgdlzN2q11zk8KtOhrgq99MSp
         COJiRTzLxvN0AycQs2BS+izAB3OECARKMEgfKMIJYS2Q+V2BxP0kQqwpfv9lrH9LXeUe
         G/kI5/sNhcqKOmTUbL0nSOT0bocQRHWmFdlujDkTL/z735+GZJ5v91QDaMa+MDRNENqt
         aCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038494; x=1789643294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8CFytEdCGSTDyDlAvIjNaZjMoqpFkxgcAOASoLn7Aw=;
        b=MxNOZRetdmszqJpzAThnf2fE2BLz6Pd2kk+5q4etIW6AtUA8e49OOc5Zu96v2eh++c
         xb0QH256ZH4eFLPKFEAE2O3qG5gp1WGf+OOXBpgf4ic63i6hq5P069yf4sLhMDOqpU1G
         m646otLG/zQvV45L6WPdzLnDTqHkWz1HGJewOdH5Ao7r8CpC0fOOGASqHrchbn2ZMcgI
         uVntoVpDJnw3YbQmkhNd0S2flD5PdRSwscUBjgQBCXPBHt9BbeF2loBXGRg78bHLktXC
         mSTu0XlOSG9tb4jGjLVhnu6IUqXfJL6JL+SUf8PdjWExJWdBdTU1zrZHny+o+uY8hx5u
         tTPw==
X-Forwarded-Encrypted: i=1; AKwUvBxp3RAhdIePM1q53lF1jgjFyuFgiikCUlXduJttaF1WLkaBoY0JslHtt3XqsBEuJ3CYgSi+3QpIgXEaD9c=@vger.kernel.org
X-Gm-Message-State: AFuF++n6710GPNxI+UCpo7fsnN4D0zvuO9qvKhbvD6308E7+JsgoZvtx
	2gX5ywz4eqtpy3P9h/2THC5VDvGUNL11hIimDIAwYkWdNSe7aKKZHfhfdqTcgdVr7hvrjz0HcpU
	TUAeVKt2d++O31UwKXzlWaXBBr/AzGC4+mld8rOHL7P7oLhSDVK12LnsMME5xz2UsXg==
X-Gm-Gg: AYBFou12purmCKY/1jauzN0hZG819X7r1Timqyh5VwypThAGcDwdP64Vg76sRs+twA3
	0IseyO4Xw1C1dmXmB9W50+JWeo0xT6KnOdse4OBp3Fry8iSga8GaxLOnBswGQz3cd4u/DWyKxd4
	MKPnoAtmtU4FF9XQ9efaZFxhZgaKYgA2skEJUA9wuSqAjUrQ/rOjaigT+jcEDUZwF2mxG8JHSlo
	u7VoS/sWGSAgMxNcihepxMOT/wLq4OthX2+osyVUwupi/Xh+438Ecn3DMgN9KGetxzEZ8cc/zFg
	CWKoVx2bZmm6RFNpi0aKIDSa0375vXdNgC3q0wk9HCepnrEfQU5qeS092Oa7W1HhgqaecvtczSs
	gA41j35pk6G9xHkI5DaINW4hfn+M2afHXAJ96niB0eeW97mtnTCvenaobHA3VpdmV/cZZ8R8eNw
	==
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr317132035e9.10.1789038494579;
        Thu, 10 Sep 2026 04:08:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr317131425e9.10.1789038494197;
        Thu, 10 Sep 2026 04:08:14 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm50339161f8f.1.2026.09.10.04.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 04:08:13 -0700 (PDT)
Message-ID: <54c3768c-ba5b-40f8-9fd9-d2e628c0c592@redhat.com>
Date: Thu, 10 Sep 2026 13:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2 1/4] net/mlx5: SD, serialize SD LAG init/cleanup
 against LAG mode changes
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Akiva Goldberger <agoldberger@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Kees Cook <kees@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maher Sanalla <msanalla@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Patrisious Haddad <phaddad@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Shay Drori <shayd@nvidia.com>, Simon Horman <horms@kernel.org>
References: <20260906071332.3759199-1-tariqt@nvidia.com>
 <20260906071332.3759199-2-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260906071332.3759199-2-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/26 9:13 AM, Tariq Toukan wrote:
>  void mlx5_lag_enable_change(struct mlx5_core_dev *dev)
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c
> index 4cdc50cd6f03..99cf455a61e1 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/sd.c
> @@ -345,7 +345,14 @@ static void sd_lag_init(struct mlx5_core_dev *dev)
>  		return;
>  	}
>  
> +recheck:
>  	mutex_lock(&ldev->lock);
> +	if (ldev->mode_changes_in_progress) {
> +		mutex_unlock(&ldev->lock);
> +		msleep(100);
> +		goto recheck;

My reading of the clashiko report is that the above introduces a
deadlock.

While I agree that the fairness issue raised by sashiko.dev
could be deferred to net-next, I think we must avoid introducing
the mentioned deadlock.

/P

