Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509797;
	b=pFJ0UKV7jM6KeuWLlZq1UPksXyVhaiZalzL8M7+3kOwr492H5fTPKCSGWClbaOCtKBh1
	 sduy9B29BLP4zgQcKKKLkSdpybvZDHu7TSm/fyX4UewsPlvsB9l3YTZHpUzypwu3pTiPR
	 kaBFpTkSnjZF1fIiFCTjcKiUC25Jq46mDkgAeOzPHRkFc33NgKLi1hTl/Nqn5P95fLr8K
	 7pikeeOMX87IopztGNf+95vTxb2GUvi2M/cbQmu7X7fa7IguSwm3GDmCjKkgKO4vFVlwS
	 TKt/dQ7uG0OAZPtwaokJ87KVRK1YtTPRhid06H2/L9y+FosT1UeuU14BPy81JRRAxUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gRK1N06gC7y4lklCZOXSgRG5jNtEwJRUHirNfgb2kAs=;
	b=OwmztiUxF44tsY6hQU9e38qy6d9BKQMG+E96xclOA6UtbPSWGwIjkcX0WeQrJZdBdxi0
	 T7oZTlF7iz/Q+rm1vMIleYFt9bpwfv6gRUPggRiuFj16Lrcy7Smjz9yz8esNNkm+fpe1I
	 /ueUKqqYYMfogmwQyFgnvhQKiaB6vOhEwuzyHoqXx8Fz5kT+mpD5YhkA43u6Ia/RHUA5X
	 zlBJYR3CEzEW5fk9ieSau1q1hwRpf+cPsSLF4r9aCuoy2/qv1/W7PBmDNCc4S6l86+mGU
	 /goK894n0CVGVPklQx4Shg0g60MewXTe0EE9FhBK45AbyQOtSDnzCGtEHspH0FznAjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dkPslbGk;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C8606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dkPslbGk
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35f036b17easo1302644eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792509795; x=1793114595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRK1N06gC7y4lklCZOXSgRG5jNtEwJRUHirNfgb2kAs=;
        b=dkPslbGkC1nueqKNXl755MPhADryHbix1NVdewPX8G0v9UdD7ZfloAWtp9AAN7zC5/
         vaYuCEQu3zOAobsJcIgqUtf2wYzeZwthITqkeWWuj15jPJASH2wlHWmNoxpvWu6LHzWX
         pL4Cz7cFTpzkQ6kEDymUiK2vJpxXPX62Ob7r7tJb5oqf5bHEiNDpj+vDwbTRL6iD5CnZ
         +/vTZ6N4iowAvPU+hwW3vGLftpHfs7Z8U8fOkmCqAtbeN7lyo1IY8O4KrI1pJ4k4x21k
         tPgoO+JyoZSiG5fgtaAFynGDBmqqeXrNIOYbilx19pq1K07EMW5CyFNpGsVuNdmFuf8Y
         tGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509795; x=1793114595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRK1N06gC7y4lklCZOXSgRG5jNtEwJRUHirNfgb2kAs=;
        b=hKj/OYdSWkLmp62AxQQybv1a8zCQESsSOzWE/rYNCdXbhrVPmF2nNWr4QmEvatXQLI
         qw32oFdnG6XEq9k79GR8LsMMQ9LR5by8aLE/pPuTEVbs9WuoyF0nx8d4VI2FJojDxiNG
         KMgi951JZdC9s+erg8AmM3uE7f72KD1AfQkwpXzADfbW+6SxV+1EwBFtldrZrKmzTpdh
         4rjAEN5h9KwfPPms3wh8dczVcL0ORUhPUxPNQDWYYtvhW+iqoIgToQiLAlzZoRwxJU05
         PGZP4grXIoe2cJfw4yfOJHRd+Keyd/rd9C/4fQuIQ0EaJBSl8gCEPxm+4hSAJQntGywx
         MRsA==
X-Forwarded-Encrypted: i=1; AKwUvBzQjqdncglOylEbfOs07dUOO6L+GFii9coacQJSoV0QY7PU4ZtoZAnsPl5eDeGZiJv9zka9saTmvug8xTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSp4yyzYW6o1AEUyFHG3Xbr/3ADSM8HBpwStlzrnVuSDRtLJeG
	SZ47/zLi2YM7qfROllXyh3Efa8nCWZ9KqC3/c8yWkY2izQMsq0kyf3QHk1ao4EtCYkk=
X-Gm-Gg: AYBFou2WXl/3Fq7TV3V9Tqr/ukg6zUpF7Fr1DL44CCjRC86vm893AJVvF+l8BCItkmm
	7QHDT270fv/LH7DPSSLbvKeLu9ZkoXiihRLSqx+4aSnbViyJYyM6rv90JiNfdztG8VIbMHDW9Or
	pVj5O5ScCLSaiKNz6X3f7aqfDZQekM63r8RfB75V5sP1mQdM0gjboynWVi+03l9UyoYq49Zo/yg
	ZEc2NxzBlu8gQ81AlNnuChv7tzy3NKyV2YKwLtlsT7xrk03HEUxbem2FG8Hlp0tudsflFtxQ07J
	+OEB6tykWo3+q3Z0J38h5RxzibvFEhQsjvjuFV5Ud9qhApjZUXTzr6FT3nWfhsNNWi6DW47nVyI
	oQHRiiPEJoxOjbBohegKHqtjejncZdzc31GJ5qWvky7BQ+ZngQ+tUQxBqHnd25Og4fR4plOn4Jw
	qN6ASvl+cnSVl3NVJQjw9LlpDWE33s/4jsHulghtBUh2+IXkn+3O//zRa3OWBxVNuWN/QQ76pvw
	J7w9vn1OqYz5gJqLsktZ1HXKpf7tmQlhdX/mebWD0BGgj+kid5wBk5Q2xVplBXsDNvxUQU56W5x
	PPricVcLcZZVvAyc9UlgBP6R+9TrhaKMqF2zWVSkn6UwuLmcF1usIQZrq72cDPINEQ9TWjgkh86
	kANap
X-Received: by 2002:a05:693c:62c2:b0:35f:f0:8ed1 with SMTP id 5a478bee46e88-361a2a3f147mr13596612eec.36.1792509795251;
        Tue, 20 Oct 2026 08:23:15 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm39540410eec.9.2026.10.20.08.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:23:12 -0700 (PDT)
Message-ID: <694b548c-5f34-48f2-8ccc-5aa020c76939@kernel.dk>
Date: Tue, 20 Oct 2026 09:23:10 -0600
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
Subject: Re: [PATCH v3] blk-mq: dispatch kworker to housekeeping CPU when hctx
 cpumask is empty
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tom.leiming@gmail.com, hare@suse.de, dwagner@suse.de,
 frederic@kernel.org, tj@kernel.org, sean@ashe.io,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261016052203.489760-1-atomlin@atomlin.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261016052203.489760-1-atomlin@atomlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 11:22 PM, Aaron Tomlin wrote:
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 025a799f35b9..1a113679f15b 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2241,6 +2241,21 @@ static bool blk_mq_hctx_empty_cpumask(struct blk_mq_hw_ctx *hctx)
>          return hctx->next_cpu >= nr_cpu_ids;
>  }
>  
> +static inline int blk_mq_hctx_unbound_cpu(void)
> +{
> +	if (cpu_is_isolated(raw_smp_processor_id())) {
> +		int cpu;
> +
> +		guard(rcu)();
> +
> +		cpu = cpumask_any_and_distribute(housekeeping_cpumask(HK_TYPE_DOMAIN),
> +						 cpu_online_mask);
> +		if (cpu < nr_cpu_ids)
> +			return cpu;
> +	}
> +	return WORK_CPU_UNBOUND;
> +}

Not opposed to this, but let's please think about making the
common case the fast path. CPU isolation is not the common
path. That might mean annotating the hctx itself.

-- 
Jens Axboe

