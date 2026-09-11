Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA64BA1CB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161835; cv=none; b=T0L/0VygudrfMEkcyF9rycEjl7glh1Ahm3DAmvHRJxQC7Y4f/SjYhKTPyRyFw1twitnWkUzKvmJimPBL3XDu3U8uIQ9aaJmVNyveinvzJiN/M3M/sjXcbNWfvp5GzEknQphl1xv3RXSDUz8FnSmdWDCc9RsdaDqvICVC5Qz2HJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161835; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6cQbX05tp15A47ADPybJrOuRwMKf9181CPdclEKhe7gBk4/5/1YHhNyf4pyHt57Sm1MhEzNU1Qi0SYYxLimedOCxtnscW3yx3ZRBI/uqEPnmYLe14FpxW8sb7CMdh0Fpwf9iJCJiwLrQn4KyXJKu8UFGnh9Z9M/nVKfQyv0zm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so979995e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161832; x=1789766632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=D5zQ0s3ebZfi1BuoYshQ6AMNhSlY7ehaHATmzUztT5HPM/GTwr2QrfZvdb+/4SOgET
         DIAjPh911myYLiEJeV1Rafnfn0jWViJsm1wtt4sb184KujBqZm0U1oW1GYSgmfjmJ2qB
         Mfdm6wlMJ6HidgWqLJHbJWiOjf70jHCIUKocksj+wzxZ+KgYe8y7Fxc+rtd9RXR9I5+p
         +7I+FZNgHSWmtiVtpVQQKYSdwDtO0pnlczIEeO47sfwzN4HDFi2SkmEUagCt4k5kiSlM
         LpT2FOesYgq92KBxhuesbptw2vyAvC5s20Gdr+XBZShj56SHt4E7TkGQM2xr/JTO0W33
         2TsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOF02QaJYdiiNIM68hKFEBghN+3Wzgvt1qOTRi94ynkNF1y6BM155/gDvsVlaI26GfGCMkzchCUuh7dvk=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqdh3+VIxhLg0HaxsVm/3MSwQh+jbvHgCEWF8sqUZd0Gk/YpQ
	x3HxS+cz93nicR1FoAWiyM5HIH1EviqJxDRipiXDy9WI5JXneEqKoOsH0BW8AyQb
X-Gm-Gg: AYBFou1jLr3YtVnKNrdZRh5MUhzOn8vm1g/7QKX/2wS1oyC6N6mm1dSUnT//9xPbOn5
	g7oKtcXVtc0n9Klox1Rxn3v0a6g8BZw0j0x9aOScAdLvxdhoTcEBnq7gdB/dlb6uxcXuMz7TzYa
	9k5SPHdo05MHQNrbLf/SxB2hi61uoE2FoxZNLXs0q4WRXuu5yn+jSTpuO7Y+00u1PDz5b33YKLx
	qXBHim2Hy8JmHVcdh+dhCs83Bn/VDp8GUexeqEDKGT1xAEKPxksZtRHX1Np+h0dVHz81pOj0Dy4
	9zq91F3JVSrTneM/f7AAKN822bqXQX4rtVjNZVcGbcaPOAVA4uZxiYB7efF1NmztItIeAgDUJfj
	Ev2CGgU7Cg12g8ugqFZbZaW2YvLz6Cqc7F/fxZmpS/gnA4rUyWWXtx2F1wIU7N6wkfbTFM0FTKL
	6DpjNESAHxGN3zKXEqXt0LqgLtl+w4WZVB0x7fcku4mrqu0E/XazmkgfktnpQPG3SIVhagsF9pd
	+PIUBF7AGcgNU2yJ67JSkkweQSoKdXR
X-Received: by 2002:a05:600c:4e0e:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49e619d4d30mr76427485e9.27.1789161831728;
        Fri, 11 Sep 2026 14:23:51 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35c071sm8699507f8f.33.2026.09.11.14.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 14:23:51 -0700 (PDT)
Message-ID: <3e38523d-9934-4b2b-915a-549647e78be2@grimberg.me>
Date: Sat, 12 Sep 2026 00:23:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] nvme-tcp: refactor I/O queue setup path
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
 Roy Shterman <roys@lightbitslabs.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260910202812.1642832-1-sgogte@purestorage.com>
 <20260910202812.1642832-3-sgogte@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260910202812.1642832-3-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
