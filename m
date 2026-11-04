Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829421;
	b=k5vKtahOYbWrwkqcGAm30IDOKs8sNYCn2xkDM6eYTwtv4ACikblCqOKytaTzNLIduMGY
	 GSgrrUC0BdNFr5YbwT6NX69DP/cQhwfYITxHPXHiveZamOUjoIhBtTuLFgXIQpRMmECFi
	 ZVD/rBYUAJyid+QWsukryNwqAtbk9+mdO2ZNyxJ9iFH8PXPAVBR23l7OZzrOkTXEPVTJa
	 AtB6pojKhmubD22mnn6M7q8Tj+rTKPICRnFyTluzvYyPOpg7xbt2DTpsbVBKc9dQ4xz0X
	 Vr9gTmMIMHJz8B+rwIelMMRjLfLNY+IipZngjjXuGqRgFlApTZrVzQYpNRd4EDYVH9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iieLdBkwQ6wRvtcuZtWp+Lo8dgU6lmnVCXawi7PwXUg=;
	b=C2usAnOnvRKlNwKjapf9PwRexE/LBDmRJSikYrO+TvGBv8y2ceb6SDoZXRoFiWNr6ls3
	 LEnFa8XuMmfj78VUd5nA4tmUbBFNMJk9eQQdDDjL0HFC1USS1uh2xd6X+ti7aCkmE/Ejn
	 iFeiUKAA0KtgCSZ03xz16Kp/6sprt9G7mjN2/TM/UbqS76I5y8Q6hQ8cv41FQ9WtvQbM/
	 vW+iRmh9CeloXp25NNT1ci2eMyO1PeN1PgNhN1B5SHFSRKc25l75bYzqJvYcEd/9EVknY
	 3cuaj5zZqX6dLfFWG5rF3/ovSJua4Aw/4ea2SyZrOnJLRtkmcCpc+Px2d76qzaTM6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8dHdlAh;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F460C0171
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1F460C0171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8dHdlAh
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8127985e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829419; x=1794434219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iieLdBkwQ6wRvtcuZtWp+Lo8dgU6lmnVCXawi7PwXUg=;
        b=y8dHdlAhDavt6E9eKoMy2qdLA/COIN+/P+IvKT15tKFgBYqBTpkiLvy68rAE4n8GLV
         m+xD4OLJD1AFZlG3cJV/EV+tobHb0mSIOTvvlhb9AO+bQNEqOSbpqPDMljIrIItOJaY6
         BzggoqGuyE27HXjxdRy1MiorsHC6CG5X6Mef99mKRqpzK1uF4d5J3AuxjNHdHq995A1p
         jL8XfVFp/MunGzi2ZEeTVe4BOfKdVWExu2qp/lBgX1MUZ4hcn6SAsQtJTLfGYkMTjDXi
         zUS6BhYLYx4nxSsgxb/wHeLzkyCDdqZuBmzX2rw7JSzmHJ6yG/EZkcHOKf4PFVAjhSEu
         1Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829419; x=1794434219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iieLdBkwQ6wRvtcuZtWp+Lo8dgU6lmnVCXawi7PwXUg=;
        b=nzK+gyrVbJ2NWBlWSTy5TPYtsGpwAfzyqmP/JHCLZn7BYm6zvylegVSeXBcImfGx0+
         hgiePoqSCUVFdlxPgtf/GCz771XlBj9wDoRCzgJIn3zRbTx3VnX7YJ5w+fuBhXAmaLUG
         nh304WDJKre7OykmFWkE5+YFkrQKGt0E/SohZQ9llE1CGyShMv8SeO8w3SzsOKyG/whV
         bxQWDZt2Kr5+WjBLdeuZeyOY4QUHpfZKAkpgE5nyMj1IERO2RdqyGMvvR38Asuyxejch
         GIs0Zt1+a025Ttk6N0H+zZiiniLJJ+UOYtycMR+5yQaRwCATiJEgShqpQrCWghMlALvW
         MZXA==
X-Forwarded-Encrypted: i=1; AKwUvBx/4KLjKkjD3IG1XXrTY6gnQCebvnZNy/rvaap8zGcAMDOkQPRxxH1UJOoPtkOuhxUROC+BIj5Yat82eyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CXy3dXFC8DS4fyboDesqySQyAdZwcPA9sBRuXpBlFVkvhNNUD
	JRxR680ZAwGlMmKpUAMI7Rt4CGE9qqCIQx0QMxzIx6V/2K8vlgPqVYne
X-Gm-Gg: AYBFou3MtKNphbZdKv5FG6iJlsPLfWRzPsLiEyQr/CKynS3KRuEQpAL+B/D6o9wVkK7
	vPISk9yU/b76tgRfWqZpjjK99DQ91NO4mRZF0gds5YGaVVRqlu8uvLdxgxuEx5AzPN+KA6q0U9k
	YHLzxwtQQjjf5FzVfKPxWhkBY/0bVK16Gl2InDYLL0Uaw7Quv7L6TFE0/RS7xHY+eUaiamM/OSU
	+6StCLvTWIm4iwFNKNyc28gMRR0PBmoJ1DNUZRTyC/3EZVc3roJ6JNi0e86EvS+cXP4RtnKSk1h
	ZvHr5DKlmzlAqmDkLEig7qrco3X0El8WZ3Ive6NGBq6ay+Icla33fWVbf9yRZa/kfCKB9ZDcLda
	vqNfjmTOnGQnsYpDJtmuxA1v6dVaV3HZdzevFUzE4FjTtF4v3uGhQSE/5DFTE41NBVJkKGGll7N
	I4g/Iw55kEmF/ixuVOlR403Er9PauK6YWOKAJP6vN6kQRkKPmL6H8Td3GKJ+OUWKKXjbcG+PRTD
	hk0CiD7cRi6hFNoQacrAzcmsf0yN0eBPnU3WWGVpR7CmppGduCIq/ZA+phQQq6TJJxWqVBvjrB6
	QvRcc268vG/hxKpfPAH/Tm8=
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr374011925e9.18.1793829419086;
        Wed, 04 Nov 2026 13:56:59 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm15184095e9.15.2026.11.04.13.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:56:57 -0800 (PST)
Message-ID: <75540cfc-0577-4d91-9369-d1c4fe9c3096@gmail.com>
Date: Wed, 4 Nov 2026 22:56:56 +0100
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
Subject: Re: [PATCH] mm, vmscan: make kswapd unreserve highatomic pageblocks
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, JP Kobryn
 <jp.kobryn@linux.dev>, Frank van der Linden <fvdl@google.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:38 PM, Vlastimil Babka (SUSE) wrote:
> Hook this highatomic unreserve to the moment we are increasing kswapd
> reclaim priority, as that is when kswapd is struggling to make progress
> and it should roughly match the case of direct reclaim failure.
> 

isn't raise_priority true after almost every pass at DEF_PRIORITY, stuck
or not?

[snip]

> +		if (raise_priority || !nr_reclaimed) {
> +			/*
> +			 * Similarly to when direct reclaim is retrying, try to
> +			 * unreserve highatomic pageblocks on the node. Convert
> +			 * them to movable ones as kswapd doesn't have a target
> +			 * migratetype, and passing unmovable should lead to
> +			 * least permanent fragmentation.
> +			 */
> +			for (int i = 0; i <= highest_zoneidx; i++) {
> +				struct zone *zone = pgdat->node_zones + i;
> +
> +				unreserve_highatomic_pageblock_zone(zone,
> +						MIGRATE_UNMOVABLE, false);
> +			}
s/movable/unmovable/ in the comment?

-- 
cheers,
jose a. p-a
