Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308433;
	b=1+fgrRwmO9Lmppo5D1fiFrX1UUobncjNmLyESE1WPjOIoBF0vcm0qHFVqmI7zGtOfACt
	 ExaGevmrFz4W+td41mvKipLwPuEyncL9aF9Vig6ZTwyP59PbT1Hs/aDB3NeLScyS+zkVb
	 wMqbcfyOEKGT1lX66JyObSSuXV9c3GjXj+YsFjfhyg5PN0pGkdfR0Pbb2YIQEEhpWHKy8
	 cegglWzXG05a+W+kkUrfXR+V4LF+jwf2lap6mafRefTXyYHulWgDsolBjy8fTh7zdbm+s
	 h1HScdsD1VfeEvGqSZyCzzdMSMos7hm2ey1S2s96QUlUs5qRQVBW2DVIo1GX2fB0vbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308433;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PvjZgTETpTgpa2EwGhWe6LWOvKhagS++4LBHee0TILc=;
	b=cUqHauzs0iJNVuNewkEXMnGKK2Vo/V5X5xS1g44G8rjiRYrWzEC1s6l5UcbSQQJQYzOs
	 lCz7+eey2KILWyTMHARLMNPQ5pvIbL1SLwpeUxukFTHgyJy+8yxLE9BAi//EUH838fIqn
	 kUqtAVkectyuun/WvMrpEAsCo9ReIopbnw8AG3v4t4a2c0oDQ0nRb1yC/NgwqRhWECh7B
	 vl24RnxpJlLYvQKfvGh60CXFZF5i+HCS7fM1ZiMY7BbzQ7bAyL8MESE6HICqn+iJoCfrB
	 fdl/yyIRcLB7AHC1i0HGfLUai6J0HMe5CadVs77ThQlZGHFp6BYXsYrDRs8YLp6vHgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="MLPC/UP/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aGxW5UwB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DCE60A3806
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97DCE60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MLPC/UP/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aGxW5UwB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794308431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvjZgTETpTgpa2EwGhWe6LWOvKhagS++4LBHee0TILc=;
	b=MLPC/UP/2JXhpTh76/esdUa8qBw2aFGktrOEmLLv8YBQtNqMTbZUxeBaX+I/CGuccTp3d6
	8FG57ztkzxI5CMRPlHtaj0aFWwY6JNWlAaHUBdjvDdv9pdvTjo6f0+7rvvgt+gA5ch9OOO
	rDOG5E0SA56UBtVEHURxmphrgYylnww=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-1AVzrcPDOVqvgjNg84_lVw-1; Tue, 10 Nov 2026 06:00:24 -0500
X-MC-Unique: 1AVzrcPDOVqvgjNg84_lVw-1
X-Mimecast-MFC-AGG-ID: 1AVzrcPDOVqvgjNg84_lVw_1794308423
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a80bd45e1cso10602525e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794308423; x=1794913223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvjZgTETpTgpa2EwGhWe6LWOvKhagS++4LBHee0TILc=;
        b=aGxW5UwBL6Ch2N3+dvQ6/Gppqp/AubIefTtK1oM3wugrAIpPyZzt2Bc7oCP3J56nNS
         koFRcyDesiB0ooi2zC3h8Cy+VEP00ezo9CrpMDD/jL9ZM/mZX9b0m9mUJoK/uYrRDOJO
         lMZZ1XymsknXqIt4b2kfOBX4WB47oQRsZmxyljE6R6Am5ygN1EC7vFhNLmXHVeQRC75D
         4L2nHFIYw1AvJqg/MpE9bX2xP2cyojHTSk0tNth/8igEtkLQcoCStUHYWJrqJ13CS+nv
         1rm81pej5a8HH/DpRIFnvfM2YSdujniYSkP190FegldAVTnjJl++jp9k9Jxm+lMrXPK2
         FaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308423; x=1794913223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvjZgTETpTgpa2EwGhWe6LWOvKhagS++4LBHee0TILc=;
        b=t+BBTs2AGsE2qnlvmTnZAwW8Dlj3rkBgOgRc6NOGB4NdtST/nvgCBLXVsJK3jg9tbS
         8La9aOBSgxwoljDPnP9QZuUZ4finOr/DA0qjJbX9jN8ZjkN1kIYmiGQRkPqYjR2OM2nA
         q64FjVA8ghaFzNx9uk6R5TiGPkJIMGRHzAaFRAEUFM9Y+YM29SB9jWJFU2KBHYuDFivW
         vTAvYynNOf01Gh1rJqBaxvdlfwsCf8tFZkOC3xwn8/fGEBkDPrLzEDHe0unjltJeu6ow
         D5eWZPkCKVnNCJ4KJUNflQVxiUCuakwwhdr5XUcVoQTuwvy6VZ6epF2j1lG3RhB8NYz5
         pj1w==
X-Forwarded-Encrypted: i=1; AL+hErHYdNnl7WhoHAwLH6G4u2i+YjgxJmBlTZ+pLi4uqb2BNKW83rUDUXQwcMYSJN5ysttA2Zg/BcV7t7TrQxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WqTJ8ENDB5ROXqj7LMYEQKankd44EsfVEV3ZsvvZa1fyqDspx
	BIki3g4zLPE8fMH3YUoratjIkrhwg7ooYN5OPfQUVfHHiAQcNzfo6pvcYP0WVpZzzF7EcnU8OUu
	cnpOPRm8WjXkE31qqTr0e3bfdHam2zLH1kJw2ZJFOK9xu1CDaQgFscEhL+hwBS0IfqQ==
X-Gm-Gg: AYBFou35IRlWNBoGwyS49JaY9t4SbsKfcrrgjmI12V/6qJMyuFEkVcruo1Jg0xktQt5
	LJjHqaZ0pzyP2g4wxbFSe/Yx+t/jpGoCafbT5mi4QIoN2Tf4xvKpeuIgf27Kk6InLpawk6nPwnI
	X+nl/k2XpSF6m7lKs3doHqVLiTUkqhBffKEv/6hxdktuSrGHTxDZrNNUDbgpInnFdejJjVtqZgo
	1qzFFqQPsdJNK/rWGNmNZCB2b4Cv1i5+p1Rwu9ED+N7vgxlvKNQWITUXpMLhA0QWs9PaTyMmCYr
	mpHS1lkrtDjMYPriNdbZvs7N8JuQ4S08A3VdwPOHcEJLYjAW6AZhX0e58llxoj8d8yQBcQENXzg
	UnzfmxHbNmur6/pPJS/DSqHtlU1QbPcLQ2iwA7l72h1kH9kDlW2uTUE8VUrr/hGX8uQCIk8xRQF
	3xNSGdl5Mipd/qfsO3GDRm1v3qscRjXS1PwckbDOGPT7OA
X-Received: by 2002:a05:600c:6095:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4ba02336388mr36938225e9.5.1794308422292;
        Tue, 10 Nov 2026 03:00:22 -0800 (PST)
X-Received: by 2002:a05:600c:6095:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4ba02336388mr36936355e9.5.1794308420789;
        Tue, 10 Nov 2026 03:00:20 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm52154425e9.12.2026.11.10.03.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:00:18 -0800 (PST)
Message-ID: <e15d78be-1e80-469d-96e1-dd83cd90a929@redhat.com>
Date: Tue, 10 Nov 2026 12:00:16 +0100
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
Subject: Re: [PATCH net-next 05/15] net/mlx5: LAG, decouple iteration
 end-of-walk from MLX5_MAX_PORTS
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Akiva Goldberger <agoldberger@nvidia.com>,
 Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>,
 Patrisious Haddad <phaddad@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Shay Drory <shayd@nvidia.com>
References: <20261103171009.563034-1-tariqt@nvidia.com>
 <20261103171009.563034-6-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261103171009.563034-6-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

there are a couple of unanswered comments here...

On 11/3/26 18:09, Tariq Toukan wrote:
> @@ -2095,7 +2096,7 @@ static int mlx5_handle_changeupper_event(struct mlx5_lag *ldev,
>   				break;
>   			}
>   		}
> -		if (i < MLX5_MAX_PORTS) {
> +		if (i < ldev->ports) {

[medium]
Should this compare against ldev->max_funcs, like the other converted call
sites?
The iterator's end-of-walk value is now ldev->max_funcs. That holds both in
mlx5_get_next_lag_func() and in the mlx5_lag_for_each() condition.
Indices are never compacted and max_funcs never shrinks. So a PORT-marked
member can sit at an index in [ldev->ports, max_funcs) while the ldev still
has ldev->ports members. One way to get there: more PFs than num_lag_ports
join the ldev, and a lower-index one is removed later.
In that case the inner loop finds the matching pf and breaks with
i >= ldev->ports. idx has already been incremented, but this block is
skipped, so the bond_status |= (1 << idx) and has_inactive updates are
lost. The later check would then fail:
	is_in_lag = num_slaves == ldev->ports &&
		bond_status == GENMASK(ldev->ports - 1, 0);
Wouldn't that leave this bond silently not offloaded?
The old i < MLX5_MAX_PORTS check covered the whole index range that the old
xa_alloc() limit allowed. This code is unchanged at the end of the series.

This looks valid to me.

>   			if (netif_is_bond_master(upper)) {
>   				slave = bond_slave_get_rcu(ndev_tmp);
>   				if (slave)
> @@ -2360,13 +2361,16 @@ int mlx5_ldev_add_mdev(struct mlx5_lag *ldev,
>   	if (!pf)
>   		return -ENOMEM;
>   
> -	err = xa_alloc(&ldev->pfs, &idx, pf, XA_LIMIT(0, MLX5_MAX_PORTS - 1),
> +	err = xa_alloc(&ldev->pfs, &idx, pf, XA_LIMIT(0, U8_MAX - 1),
>   		       GFP_KERNEL);

[high]
Can this let member indices reach 8 or more while several arrays are still
sized MLX5_MAX_PORTS?

this is solved at the end of the series, so not really a problem.

Note that there are more unanswered comments on patch 15/15.

I think a v2 is need. For the future I suggest using smaller series:
15 non trivial patches will have increasingly hard time with AI
reviews.

/P

