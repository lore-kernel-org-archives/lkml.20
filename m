Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533480;
	b=4Cj1YUTGVdUR0rV8eieqDuVx17eN3Eb7h/RvqoIPWMXwFvzCJ4kG6O+vCFml271QQ/L6
	 lW5Lt13E7PR92abahP/7l713gwl5oMx+qd8ljR1+KDa9K4LHC5vyxagkGVr5vLYUHbvuo
	 6MRj8IV6Mw8dVwV5S7lyfzqIORFqXXYNd2ZSjquWM9KJgiX/MNwcj49bgg7claZWslLSu
	 15eGxQRTTTVUw9AsKOifhwNZodirercLxdaHMwLwg7eOCZxkmyuu7wwg2OeVkzCxRy9cm
	 k6BKINypNaOyWXmZ5iIAabAy9OOKxqPG/Mf3ca926/R05iBqmrSTI8Dc4xWsL4edSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hYnXTzJewxVnTsYQsR0lTJu5zv/qnETwI2MNTZueBaE=;
	b=Xg8VtVqgiR3t8FKpUCF5bkHDsjARM1+85g1mn7ntqHovMlfxSO3n2YxGQ8OYjTWzj6UW
	 sWuvJ+s++FSu9pUICl11Gxe47CBWCKsghs5WGITlrKEdcGH8SepMyJcWn1xDntoZt+/Ka
	 Xx6wrPYfg6fvegRv1upcYNMFNSMJun6ktSuyBph+WSJUzsE3nwoDahPFyvQM0jOCfJ8M1
	 UTwPFLJDA9Nbsmr9gwA3xaspMIiGI/LjMk50pKES+kGGp4CnBpsgHj8KW1uYF+nu7nFkt
	 zqWAzK9Fp1CMBtfhdFm51JHrBJi8kRvy5K5USmDwJlBjDikcafMMzNRPAcOx4efxNrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+M8k3LW;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29492606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29492606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J+M8k3LW
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so5369eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792533479; x=1793138279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hYnXTzJewxVnTsYQsR0lTJu5zv/qnETwI2MNTZueBaE=;
        b=J+M8k3LW1y1p2rAPNOoanZEOm8pIOU1+hFBlot9nZuGIe4j/NEAa3FoXR4K0fIC/Ww
         nMySMKfpE2Akc8lwd9+qGjYpg65pMLQArQFxr4tam3HsNsKTXdlfbPjO2xBVcl2cHAk5
         5zHbTyv+gliwodCFR7WwgWQY720cCKozaMjhp6H0kmml3W2bYWCO0bmj2aC2HDVJlTv4
         qR0UCKjB/bpPAJupIljMfGC8oih7hHdEW9uM09884Y/2Qa0kNX/x6LnMQp+92vf8im2B
         qGwF2UGwdNw88cc+T6dT47t7P8G/p9wcCyLXIZf8fox/xEFre6sXoE5mS4Iui8gmh8xT
         z51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533479; x=1793138279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYnXTzJewxVnTsYQsR0lTJu5zv/qnETwI2MNTZueBaE=;
        b=JsygJW5MTXiTm23LWxYIqzlrCA/YBQ3F8NhYnqstQNDqdFTtqThKlMgGWkPPu/a77x
         BdGVCCFgYChW3AXYlcFx3wmO0YYzpjYK+pEMT2CVKU0rtgRR7BP8IMX3FmyPmy1dRCvU
         SudUIP45SUeT0gNL+pESciihDzHhFoW8ErDIYojqcpRVbDyDFzY3OOMzNTT6rVkwnF+r
         uCwzSKYfu/3I8ShGA8DCFUUGPGyAwP9A/7T2U4cPwqsWZCnWOoiKWGlwA+6DBhjtiN6o
         JpIVaTkmXgCE2iaBtkk9Y1wdJFr02S8I3JpYLi85aDtCjgkfiMMEuKdmohD/A7QgC+xm
         iZDA==
X-Forwarded-Encrypted: i=1; AKwUvBzwEhjcbvom9aZFA0SHENx3NcEPLHp/jZdkmy4oHMVvPysQVroqUd2SU2xtze0GBPMd/hUWmNl3aZw0HZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVXSTgPmWg4Wb6x/skG5aOi5rTfTWlD+Lya66L5MNxUt3myAec
	dTq8xmLRnjNsXjFKrCm0dr5jZWVwNcud/bZ6yJjLc3Qe2zpNHecD0BKP
X-Gm-Gg: AYBFou176LGRR5IajIyqXmwk18enaQS4rhRs8XDbfL7jCONJYC3Ui0q4ma5MJRVB8OX
	JPgpAGvzdPFg4FNTQ37pMlwDrF5/KcSKVL5Y0dIt6ZMzY7b6XDNUNflbH6Ps69w70r2AJeNqD7E
	n21odIL9RktGjnRilF8GBNI9JvkfmKwnrJ++2El2rabVgRoJcfW1BZxYLVfZwZHgMdYxnxEa+cr
	IxVjYBo1YOmi83zUkqKhuO7jab/S+UewKX3XeY0xppiL96ieV0a8uwu2ZBccf1KRrSE/d5GIKyX
	2o/kOsH2y91/AuFy0VH1RnhMpsTw3cNt4vteihFq94lW2qV5wFgZh1K9/WSxoQ1NDb6xH4MkaLK
	JPS1GsFlVNTxHaM+R5gI5uNSrycBLRwL6ujp/PCzy3+ws5EjYNo9LaBl+1Ag9ETvDPg8TaU0RFG
	byhPvfv+8NYT03rTSOsGqVxMzEgwN1Ww0lKWRNFJoViLsNFGf6fJtOqHs24WM5E+7jX/+j99mSa
	aWG9daD8pG4OSVpeyhQAdP85zUCCcCOxQpimmF4aTXpjrn4hA==
X-Received: by 2002:a05:7022:7e84:b0:143:4450:e1e6 with SMTP id a92af1059eb24-190a7660d75mr193063c88.35.1792533478955;
        Tue, 20 Oct 2026 14:57:58 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm1857639c88.12.2026.10.20.14.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:57:58 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:57:33 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [PATCH net] net/mlx5e: Stop asserting for RTNL when closing
 channels
Message-ID: <atfjx6iJJiqAq3Io@devvm16445.scu0.facebook.com>
References: <20261020153659.3440902-1-tariqt@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020153659.3440902-1-tariqt@nvidia.com>

On 10/20, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
> 
> mlx5e_close_channels() has an ASSERT_RTNL() from the time when RTNL was
> required for closing channels.
> But the driver has been switched to using the netdev lock a while back,
> and this fired from a flow which was forgotten during the conversion:
> 
> mlx5e_tx_timeout_work()
>   -> mlx5e_reporter_tx_timeout()
>   -> mlx5e_health_report()
>   -> mlx5e_tx_reporter_timeout_recover()
>   -> mlx5e_safe_reopen_channels()
>   -> mlx5e_safe_switch_params()
>   -> mlx5e_close_channels()
> 
> The RTNL is not acquired here, but the netdev lock is, and it is enough.
> 
> Rather than switching to netdev_assert_locked(), simply drop the assert.
> Upper layers (networking core, ethtool core) provide locking and lower
> layers (NAPI helpers) assert that the netdev lock is held.
> 
> Fixes: 8f7b00307bf1 ("net/mlx5e: Convert mlx5 netdevs to instance locking")
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
