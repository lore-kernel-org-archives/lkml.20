Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9183921CD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199791; cv=none; b=iAm0wU1661aymgcqfrEI+dDfZH9CSk6ViYd/agd4rrbukaJyvkNjGYys6DLU+MHk/TKgIfkXXVFNfGYS8iB3NWkde+sxXTf/hcw6i/kC1nhtG+aoGy/iXf+99rHB9dwRWkNBNREH+zR8lE78MooK57/uyBJgViAWGQZK0ZrM0jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199791; c=relaxed/simple;
	bh=UJIjx7Nd6UnwIEMkfyx4MKf4iq09kir0HcuQtcBrn2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pN41Y4yQ4azaO7/91DVI0YUFIhqiPNB4rOMtMKcX75KXQckxfClBbV+GyvwvlWsG1rm8MBDuTRgtLneT3yXwO8/Yt9VtK7jkNoI1TxF8OdgsU19poiJuoDiQTx4212V1J9g3i8bULIMqqqUP2qHF/mF55hR9wIrckFCwvzWuYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=iVEvvpsU; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="iVEvvpsU"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso3394851a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1788199789; x=1788804589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC5kpux0BtJotabIv7/q6ESBCBij/ueWvvNCaE5KD0I=;
        b=iVEvvpsUvxnmcRK29ZjpZSEpPEm2vClhvxxeTzdnVeei7KCow9+0xf8/AZjeIDHqDr
         cLulgo2a4L0lBiTu7C0mdT7nnVVnnGI5Orp3ylhNsKQwwuHtfjEcfKaE1z91ACuS0V6P
         rJnCZwnmiVF4oMzr7w/hoAZ+OmaVWpvyfyRXI1bXINhuLhsySUWx4/s21KjMeqGYbgZ+
         I3OWQG+0HLe801ltuyrQAZr8dyJVrR/N2yU791z3NMzsFg69hfpIFFcs8NyQGxnDE0+Y
         V56ktEZuxcFtxkbqLFzJwWbBWE1bkrBxqpfagWnqQ6ueOKA/6flMppmw8aOBZr19DpGz
         tEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199789; x=1788804589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nC5kpux0BtJotabIv7/q6ESBCBij/ueWvvNCaE5KD0I=;
        b=M1pEZffzgct2LE3JiDTBkVcN4gPKd6q4wboBqVUuIpbsU53t7f6v14SXXk4ZAW9rT4
         bQY+RWEEKGsAitVkzIG1JyONxYTLvTs+0SobHvJekMAS9j0rmXviBxfb0XRGONoup69e
         i65PPc26QrFc2xujDd9fzahHzDhfTahkW71GKsQA79O5jhWtP1zab3IgbYFUd8i2afiP
         1AVV+M6EMp9cKG25413CJZxuc4VgPamEa7OcypJu5605oz7l2XEqjAd947qB+CjkcUE7
         SNZKiF/g7NDa8lG706u/zSQcluF0EHjPYXz7soo7s/CwCobImse5JnHA7i84xWZdf6NO
         5Qug==
X-Forwarded-Encrypted: i=1; AKwUvByLotevvvvIn5BzZk3YDi2m1/gl3uFysqdaMG6q/spDHOAJMVw8FoOcfQnCDW0qlX0d/CXo7rbJQfNOHjA=@vger.kernel.org
X-Gm-Message-State: AFuF++mhxYj3VFbJLq5H7SGwuPxhDf8JHKxfdAHmXQeLwtU3R+LKiOw1
	+WdYQMpQxxOeB9dvb4ut22n2/cFxytXo4iEIMz0FhUf3n/O7wkvAplnYpPpDIcFnmnc=
X-Gm-Gg: AYBFou3rc3jY50daApa6PYz3MLT3SL+WPE7742QLhoI5yVJ9VAKRk2HO108DAj5XVIG
	c9BGkFmpgxDgUJv2BglxATcGHI/wlz50TMkGbnAvAZH46PrCPfJuXGiQwj4+cn7NlA1DuLg9MPF
	zYHPlxw+085XZeJUmb7vFBBMOuMAWm4P4gqklc6GeoT2exUWanAKxIZmDaCkWI/tr6pqzdT28i9
	AbpeHrZZEnggkX8M4sGaqVpIip5DcdJJq6a4TTfUUTAatYS/HpDASu2/wYUVzR/qRewKvKKjsGB
	3VYDwcjMRYqe0IePXhUk/StFEVO2bPSi21yKcXGfrDqOrN0WlSD4azTNagk4ElH+Ju1Ifuq3z23
	wf/l7FN/ux3H8Bpt1Z3sqmpJEr1aXiYo6YLKCwZWGJda1QymDgOETZATRVHzjchLjTApP6NbxPG
	czPt5kWDyXWzkFjgO25oJzuVfxOHvDfq8QYV+r50k1OOKdtc5Ev32LY1ktKC9qjk4Y18XwEmMxu
	uhQAtjJn2qqO+6GObfpGmm6Pr0ddQuZKE7U4NiK5yl7if1UFs1dJ5YQtvaaNg==
X-Received: by 2002:a17:90b:2f4b:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39907b77747mr3516597a91.11.1788199789044;
        Mon, 31 Aug 2026 11:09:49 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::7:1753])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm30252869eec.23.2026.08.31.11.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:09:48 -0700 (PDT)
Message-ID: <25f25b5c-fbdc-4bd5-ba97-85248ea8d421@davidwei.uk>
Date: Mon, 31 Aug 2026 11:09:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/6] selftests: net: fix
 get_refill_ring_size() to use its local variable
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
 <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260831-iou-zcrx-v6-1-02d1d012f0fd@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-31 10:34, Juanlu Herrero wrote:
> In preparation for multi-threaded rss selftests, fix
> get_refill_ring_size() to use its local `size` variable instead of
> assigning to the file-global `ring_size`.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index f6a8fc5fac24..df6b62204343 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> @@ -132,10 +132,10 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
>   {
>   	size_t size;
>   
> -	ring_size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
> +	size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
>   	/* add space for the header (head/tail/etc.) */
> -	ring_size += page_size;
> -	return ALIGN_UP(ring_size, page_size);
> +	size += page_size;
> +	return ALIGN_UP(size, page_size);
>   }
>   
>   static void setup_zcrx(struct io_uring *ring)
> 

Reviewed-by: David Wei <dw@davidwei.uk>
