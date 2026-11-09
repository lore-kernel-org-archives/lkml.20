Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237447;
	b=1aenghchzfBd9nputlhR1ElcbwBieXCNEIt7WSIlndH9wF3YlaZwnB/H6ZoVnWdwM7Iw
	 Y9uu9gWWp7COytP9U3+YwkWLyvkG3/ZefZmy8tm4o3xbk0EPCg3C7wpAYyB+TNBW78ik8
	 XNsipBFfspWPJImemzoT0Fgx7l9R2bGTCJgBFfwasYoN1qQwBpMtb4x6yIe/S7u/sA546
	 lfh0AOZ6UH6ta4PfryBEKjsopmqbVYZHZyT8YSS1Wbd7jxbnBkx6RKK+U2peki+OLxeSA
	 RdjLGk/oDlOPfvuBfCMlhh/EME68n0lZeW1oklVGgn2JjihUivD2s1eEYlh2RpQggLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xdh9DR4pvP3bPWHM/PE++xfHsGb4NZkwyA7cH/UYfZM=;
	b=i41+Tvz3ctaGkS4x1nVsvt5nF+BVOIU2uvJ9MMiULAouTiDZf8MpvJDT4gMZPZoSjKSS
	 eKh+Sam5P2QYxj6sMmdF3CjxgaxjvOOBcFEt83lheCo+xbyjov3g1ksyx4VPSusROLgra
	 WUbgQvl0nAWaiBJ22OBlyh5+F7BBTIqPhR8bPOk+9X90B7S07ppRuttMtsGQv0Ee90Z0/
	 nFzQDmg5Lt3e4512hl41WtVErLItjXk7UaXJzr4TLuEh3mK47vlGSXlgv7ZsCvftTfZKG
	 opALkAWgNBsCeP9QvtHOQ0pStIcqM3gC1tNlrFwKqI5w/60ndZNsQ4ySPxeypPBU9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=smartx.com;
	spf=none smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nnkIAT9j;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02132606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02132606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nnkIAT9j
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37198ed3727so1350060eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1794237445; x=1794842245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xdh9DR4pvP3bPWHM/PE++xfHsGb4NZkwyA7cH/UYfZM=;
        b=nnkIAT9j6W5kjL2AukY6s9LACsUL/7/5/3oeWkfyGSy9CDbNWy7IJd/+qGnPI/Rvrs
         h8vprcezd8yI62kK0DZeROYl07EOnZQ7yPXw0f+CA9vbvyNqAqKFVhAgS59o2nVboAkK
         u/5VSHDv0mrWUEOv5AH8tFKnEmbw295JSMmHYA5dPR4YZJ7VDcfaMOOoZDQuvePTlnXo
         ra3a83LDvmY3qZT2nsnq7zgEm2qGS8ucdse3VXhSCb2kK//HknKd8m8gUmXB/VqYWGIF
         qk4xqOfqBOrhKKShpRCDXqVJJ1aTtYCR3FBuSuceszHHeKLBdgIKr8c0rb/PjzxS/YOc
         nrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237445; x=1794842245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xdh9DR4pvP3bPWHM/PE++xfHsGb4NZkwyA7cH/UYfZM=;
        b=VjDXe/JPuFXLbANiBGDWMzFHA9PWQ54oSHRueU0Fh0nbcTGj/5JKcYjkijLc3yalkN
         m3SpL25P2l+XJ3L50KJMSPw+/UJpWQTo+YBf5umttr1gOx4MVDpUmohCsahz2P1jmTYZ
         vCS+TKzGkv/5n65Y9vv0psBsKXI1JF5IcUwS/7ecgNiBkSis/sOslhHKkiKxn9qBdWTE
         MJQVqwmZjTyXTftRKpN7H128moZ2dx7rzGzUbg1mZiD7sDu8iD9k2SaRHIGc4WKWUgsB
         MB/P+UU29TVI0x4CLF+99YwWT0gPpfJ1IQTslymRzK4g9J854bgBYCjvF8gRhQc0qZP3
         8j/Q==
X-Forwarded-Encrypted: i=1; AL+hErGaOCWoIt2OIOdYJR0fy35XEETz/lL5UJiv2sDiY0DY5Ud3lJdBID85GgZ55BFi/DDUODRXP4dlmaOdk0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8252NM5SM2cLi6BmFBb7drcKfdXPaWTshAQ13LukfgTxQC2ERm
	41IQjC+ulyaoBscdafIgEemyxtdJqrGKESxkah5DV/tTi3g6ub5PaiRvvryNbPc9xe1rXd2YN0f
	UDgv9q15T6Ojy1UFk0U1ys1kadJWCd7xX1TpOALoLiXHbgEJRiBEPE6VFKYak2RUYXYQa8QX26p
	g2WHy/
X-Gm-Gg: AYBFou2PK90SDIcpaz4CmJ7ZiKkPJYFiSBt7+8N9qMG9msFCnpTOPdjiCGvg8vM2Ino
	PyorJ1cn1hzOC/q2vIhdFS7UMDrdFaGdZLet9N+SUo7NBOi9UlsBpJ6GYbn0QmpJeYer0LY89J1
	RMD+LKxVHO17UCVLp1upc7N35/3cSSbQaypO3neGK7Xo4a1RD+KmCI50ttDXOwHXUd2IDl50vyT
	VEgx0GP8v5wrCk6brmb2tVhvZFkWdPsQziJPX8n7YtaNhGXoZLumG/QvTQytQ7JzGy+uarEfWTc
	LTdjc1WbBORHhPfynvvy8gZrfkiwDacv50SyThdmgIyjamauQxI2P8x97UtKhZRaxqSiqzcAyBg
	Ubje/jeQI6CXLLd505xU1ZLK9O02z43bqxQB6R4YEs55e7jPfTPXB+iK4FdsJwhfLpyRzI6Om9u
	qOxKroQE92CHDFDmNPI9JRvqD1Dfzr2M4oTNEYEHOSNWGm0TkWTLyx8ogjeTryiYm2kUCQU5em4
	pnEEOd4gnkt9V5/4Mj7EpKhH8Gk6OTFAvY8M9mS5MIjQSVM7cRJ6jbTXJlmlwH3wNq6aM6O5g7q
	R1yGeb+0w7vTPw5nuHzG61dThKDt0h4KefV4T6IE3A==
X-Received: by 2002:a05:701b:458e:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b39fe2fcd9mr6125970c88.3.1794237444186;
        Mon, 09 Nov 2026 07:17:24 -0800 (PST)
Received: from localhost.localdomain ([174.136.204.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm15203046c88.2.2026.11.09.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:17:23 -0800 (PST)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Yingjie Wang <x-professor@outlook.com>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"kuniyu@google.com" <kuniyu@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3] net: preserve rps_default_mask on failed writes
Date: Mon,  9 Nov 2026 23:17:00 +0800
Message-ID: <20261109151700.3979272-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a235de028cc4160692127c6bf44ac567185b5449.1794143938.git.x-professor@outlook.com>
References: <a235de028cc4160692127c6bf44ac567185b5449.1794143938.git.x-professor@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 13:19:12 +0000 Yingjie Wang wrote:
Two nits, if you happen to respin:

> @@ -105,34 +105,36 @@ static int rps_default_mask_sysctl(const struct ctl_table *table, int write,
>  				   void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	struct net *net = (struct net *)table->data;
> +	struct cpumask *new_mask = NULL;
>  	struct cpumask *mask;
>  	int err = 0;
>  
> -	mutex_lock(&rps_default_mask_mutex);
> -	mask = net->core.rps_default_mask;
>  	if (write) {
> -		if (!mask) {
> -			mask = kzalloc(cpumask_size(), GFP_KERNEL);
> -			net->core.rps_default_mask = mask;
> -		}
> -		err = -ENOMEM;
> -		if (!mask)
> -			goto done;
> +		new_mask = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!new_mask)
> +			return -ENOMEM;
>  
> -		err = cpumask_parse(buffer, mask);
> +		err = cpumask_parse(buffer, new_mask);
>  		if (err)
> -			goto done;
> +			goto out;
>  
> -		err = rps_cpumask_housekeeping(mask);
> +		err = rps_cpumask_housekeeping(new_mask);
>  		if (err)
> -			goto done;
> +			goto out;
> +	}
> +
> +	mutex_lock(&rps_default_mask_mutex);
> +	mask = net->core.rps_default_mask;

nit: use net->core.rps_default_mask directly in the read path and drop
the variable; there are no other users.

> @@ -105,34 +105,36 @@ static int rps_default_mask_sysctl(const struct ctl_table *table, int write,
>  				   void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	struct net *net = (struct net *)table->data;
> +	struct cpumask *new_mask = NULL;
>  	struct cpumask *mask;
>  	int err = 0;
>  
> -	mutex_lock(&rps_default_mask_mutex);
> -	mask = net->core.rps_default_mask;
>  	if (write) {
> -		if (!mask) {
> -			mask = kzalloc(cpumask_size(), GFP_KERNEL);
> -			net->core.rps_default_mask = mask;
> -		}
> -		err = -ENOMEM;
> -		if (!mask)
> -			goto done;
> +		new_mask = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!new_mask)
> +			return -ENOMEM;
>  
> -		err = cpumask_parse(buffer, mask);
> +		err = cpumask_parse(buffer, new_mask);
>  		if (err)
> -			goto done;
> +			goto out;
>  
> -		err = rps_cpumask_housekeeping(mask);
> +		err = rps_cpumask_housekeeping(new_mask);
>  		if (err)
> -			goto done;
> +			goto out;
> +	}
> +
> +	mutex_lock(&rps_default_mask_mutex);
> +	mask = net->core.rps_default_mask;
> +	if (write) {
> +		swap(net->core.rps_default_mask, new_mask);
>  	} else {
>  		err = dump_cpumask(buffer, lenp, ppos,
>  				   mask ?: cpu_none_mask);
>  	}
>  
> -done:
>  	mutex_unlock(&rps_default_mask_mutex);

nit: move this up to the closing brace and add a blank line before out:, so
the unlock is visibly paired with the lock.

Thanks
