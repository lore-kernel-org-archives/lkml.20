Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD3E49E5C2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302637; cv=none; b=HIGtAJtaOcxfPPqot4Vb2zKrtndghPutX4joXEIOwNTCvD/f0EVYWaII9Gch99Atx3e0m+6SwGS5iE/7Ui0DXEolpnpfoYDy+ORSQxikHkHopiEh1xMGnNKPV5dOkgJaLGRsprSQfquw0t24B+3z2mLw5/gD413Xnsl6uQs9q58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302637; c=relaxed/simple;
	bh=ejBJ34A0WaeKhICYz9jB7191YUYJRJJt9TTi/tvbCNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhdJWvdkkpnCqECGLC8PhabCZ4mCH7XUABZNGLmoemFcFeiDeYkg/UyXQaf+kAE4/ZszX26BiLLWFO0X34GhLbRjq+zcNvXrc+ez77YpiCK5YuSm5fo3CEy0BfVDDPcEpPDj7Gvn3mb4cDzv1BKE+cn6XDjLouM+HuAUwMxlvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b=CTzVepHk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b="CTzVepHk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1797010f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1791302634; x=1791907434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vH6paKGTpK+wu4U0x6N7KJfQorX+loOh90vjv3Up694=;
        b=CTzVepHk5m7IuGxwkuvitKIRaCOgR7gY7sDdsCeljVlSCmEkQC/4mTytVlnlQ37QEy
         Na1Yull+BgUWc2zncwhbNMsWaBkg2zwJxtX/Ljj5iekhNx47ro+BJRcLl7dgIHiutuKo
         tn2sny8+MaQ/qaI4OqEeMNGdGsKwSbu1FcuYWaP6HdHvBYlgpZ6vlyzRJVJN88ljIWWe
         8DtalvX6MfMyIk7XZJ17k8Sn0adFTAy9+KVAYagqUn3V15jI+TbQssvforAQAO0KL03r
         4cYZdQ9QDAsvIp33LF36HtJQkpDA8yLtjU8j9YeAChiaHyMHwumMmcGQlVM8t9m9jWbb
         SfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302634; x=1791907434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vH6paKGTpK+wu4U0x6N7KJfQorX+loOh90vjv3Up694=;
        b=RnVe+6nKVvdDdlOKWxHBpHbKCuWSZLG+69gksVxo+QCf8FAiGml/+Glv3VTRq3Eft6
         i95L7PWoj5GHN5Y9X3UpbQlX6FGbADDKTrPbsjQlMzm6UzgKupahrhlRKTnzDIDnfkFO
         alxd06xG8W9YwLlwBQQGb8333I3yDK7FbS+M0k7VdC/fIHq0qApxpI8aQRx7pzzmsWsm
         OSlApz6zv6gbrMLvHeu9+5whMyptAqXztuT6odO/A/8sDBCVpeIfl4xO2KbWK2TjgTBs
         lCY7n+tcYxsUvIbpBxaqHjHCQyRS3NneLT5jlmfH44nzmc4H58VE84fBSHXnErMa3/GA
         Qppw==
X-Forwarded-Encrypted: i=1; AKwUvBxcgQytO84B+3xiH7d3PhSeGL9p9SWAACkeF/hK3bQ2RYqOL9NwjtUD26VKlD5+2Rsz/o6SpxMiQyFvDec=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMzwkULRfHFWLHDV5Ivo/qedFNgRYOigPruGaUG1SEIJqN7Tr9
	6BMxBbsXs/Xoyv4O/66ux4BMtjOK3D3gfJFEDYQUB22ktBOKHkLPg9KERVh6jp9KB00=
X-Gm-Gg: AYBFou1AgUVvcsYMAThF7LNYPWd0aPl1IRBdzkyC5b8G1J/nL+q4+pVToIs0sUXsJ13
	g2p8BS/YU7K9ZxiQyLIIB9IyDk9xG0hR94hJyA5bbOMXTKKHeC4JKHGz4154d4Q9ZUXLLXWYFnW
	pNdJ2WAENlB4748YZrkEoRlK7omfg6+2NMB2iiwF+n9B3xZ6H0bSmXMVybBlC1c1krsbGQRHubO
	n2+5d0/iH35VFhEvfiEBLRGj7P/MBrvo+O02QS5g29s+75d3HwlES7C/LMGwVAIk0mqFJ11HcF4
	1MEq+9ehDLcg3js9nG+9m2C8+bilvlzw37oCuBTzAkq9JylENtTTAj6zxuotL017Zqd19/rzGaK
	R6hEeTi2UcC/2+BewDkkWP0aPZ3eZ4gxqOLiKAaCFkIwnfGtY+8Q4oG9voG08+y/XWh+gyva3uW
	6gV3luGGga83zyPjESshBvrQ3GltZJIkj53TP9LZeB+OqD0fLqoiBvoC+tnQjR0E8msiQt7mNQt
	ZRMvrYRoqn7v7GWTO61h2KKOQ3NT6RGNEQpYpIVnCCZXV4ZqV73aiz8KtLe+e0x8Q==
X-Received: by 2002:a05:6000:4313:b0:48a:fbd2:c2b6 with SMTP id ffacd0b85a97d-48c4801c363mr19266196f8f.55.1791302632870;
        Tue, 06 Oct 2026 09:03:52 -0700 (PDT)
Received: from ?IPV6:2001:4bc9:b00f:d376:7c33:9a50:ef33:f391? ([2001:4bc9:b00f:d376:7c33:9a50:ef33:f391])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2e2e9sm364931f8f.46.2026.10.06.09.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:03:52 -0700 (PDT)
Message-ID: <0d3a8391-0de9-4b9f-b14a-9d4f33d2e7fd@linbit.com>
Date: Tue, 6 Oct 2026 18:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] drbd: add DAX/PMEM support for metadata access
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars@linbit.com>, drbd-dev@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev
References: <20261006154607.3936501-1-christoph.boehmwalder@linbit.com>
 <20261006154607.3936501-7-christoph.boehmwalder@linbit.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20261006154607.3936501-7-christoph.boehmwalder@linbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/6/26 17:45, Christoph Böhmwalder wrote:
> When DRBD's metadata device resides on persistent memory (PMEM/NVDIMM),
> accessing it by reading and writing full blocks is unnecessarily
> costly.
> Add a DAX-based metadata path that directly maps the metadata region,
> enabling byte-granular, IRQ-safe access without having to go through
> the block layer.
> 
> The PMEM path also introduces a more efficient activity log layout:
> instead of writing journal transactions, the in-memory LRU-cache hash
> table is stored directly in persistent memory and updated in-place.
> Similarly, the resync bitmap is accessed directly from PMEM rather than
> being loaded into and flushed from DRAM.
> 
> This is compiled in only when CONFIG_DEV_DAX_PMEM is enabled.
> 
> Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
> Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
> Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
> ---
>   drivers/block/drbd/Makefile        |   1 +
>   drivers/block/drbd/drbd_dax_pmem.c | 172 +++++++++++++++++++++++++++++
>   drivers/block/drbd/drbd_dax_pmem.h |  43 ++++++++
>   3 files changed, 216 insertions(+)
>   create mode 100644 drivers/block/drbd/drbd_dax_pmem.c
>   create mode 100644 drivers/block/drbd/drbd_dax_pmem.h

Sorry, the CCs for DAX got dropped, adding them now. Original link:
https://lore.kernel.org/linux-block/20261006154607.3936501-7-christoph.boehmwalder@linbit.com/
