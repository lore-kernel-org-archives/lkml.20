Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F74A5EC3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265231; cv=none; b=iGeItXhQFD9NRAm/Le5kWX3a+m1c38OFgQxYdwqFF1Z5pBKVJ/VcjlChk3iUHHWMYzyAm44q+YrtSOORDMIhMSI8/nbXQhV/zGoP9RYCOh40nwSkyvaEZKSMyDs3Zjc1F1lxLxdzP2JlP0snI15A49JchOgvyWSV3JPTrU2j278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265231; c=relaxed/simple;
	bh=wMUbxl5vt/9aakHALUb0wzH/L2TqRFPYLffnV8Cgl4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrNSTkRxtMWJ+bXUAw+Vl9hD15d60/smpNXlX3NCvkBfCBlIQhaxJlooX7I6kg5uGJ0y/y/WU/qgLR1KEA2sGVWhPh3QeYRdWuHFeLqWy9R7kVFY4S1rPxhLIjqkott/5kC7znv0NxGzq6iKTOwHinlpFZBpA/Rw70ZSfDft9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCGQz2eS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCGQz2eS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6aa13a28848so1600421a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265228; x=1790870028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNmm9vpoKogbEkGqMdf9XAhWMEnJbsDsb3NN6zmWdWA=;
        b=bCGQz2eSkcQYMSbQNfLYFZiq45HlXMpEwZjtjh5ha94/5vOF0qLHpu9X/lZmf/vZXK
         DeUHu394OYCJ6Lj32I9RPjdNdKveIfOpfEWorZhCfIEYywR+cRALMykbVEFtub5oDS2O
         MpV7RU+rbkuShz+jA3asVlrDJ23iFlQ4iSPCrgC2ETXrn5yuRl21vE7rVYDSB5jygVhZ
         dyoViXu0rSJrHzN+ecwAoQ1pkTwqCTYP8kzclXNL+9EdUyS7bNOcgcXqSJPkcGLBQzc8
         HLItADMdjRIEMYD5rCPdt6ykQwa731k1tcla8CM/ahBbW8iD8Wx9Jtw/dlD8gEdJRYNb
         Lqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265228; x=1790870028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNmm9vpoKogbEkGqMdf9XAhWMEnJbsDsb3NN6zmWdWA=;
        b=ZNHaXKr5RliaWCYgnJIbBh7+WWk8j/rndgdwDd/Lr7loTjaRcoV9rne7kLwMlFHEdy
         EUgWjzHeRulaXCFu4rdlxu5tEKycPAqOOAqJxztW9nYFQOLVlHjRwW6fbObJN154VyP7
         3FAD54NnitLVnrxz8A7fwbzNGb3F8sM9dNgj3VqGPEGJYWu+XY4tL/q+f/7S+uCCqLVi
         Z3GWNFa7gmeZdfgWDLglIo0u/HjTpkzK4FWUvGEDFU+yn5P36dUwzN+1gTlPoyy/CD7S
         cg0pTFxZz5ykehB94znCzS7I4fXi4Sv8C5GK1ehc7BkDGmx2i2lEzxAnz8wogkL6FQ1g
         LfXw==
X-Forwarded-Encrypted: i=1; AKwUvBzXDC7UnjouZe1HIN2Mqp+RnWIkIFKQ0QwFil4DUFOdz7bXWS803FaxW+L6+1DMUM0h779eKDTIcSl7Uq4=@vger.kernel.org
X-Gm-Message-State: AFuF++kJxVM5xIUmhpr6hFPiIYxQahDeItu5UF0rEVYevdNGv0PxKjD3
	lH9cQZ5a1bRbiKnmvpOQq5MJy3Y5LK9Qd/TZn4eaTaxSQ7GtC6m4NhuZ
X-Gm-Gg: AYBFou2f15E7YDcjFvLbsEEes2vRO+qXcMQJyme/3z0l8JwbxgbI4J1SJLYQOvYxofH
	2ZfTb7cyhf7Hw9OenvH27420UHDQv8KR9H7Yzau1NFlUmmH+9WuX191rXjqGXJCDgE3C1KTDfsl
	lzsJpa1pcdb9l7og0eEzIDiWRwu+RIaLgKRlwM0HbNP5AED4RJccO9i2obeimGXzPvKnpC/IUO3
	8blsb2lKxRgICMv7WHkEBLCAzK5NVpGI+DBv2T6xuptlIl+JHURx3WqJNSGISPLdN4wK/ImESyJ
	eGPxaXwSnmsfwS65xvBgu3AyxtUvPEpJK0N1yc5Mj+20QT/DI44/Fc0pfneL5VvAv8MId9Nu3Jp
	t1CWbpTS2oK8b3aOzWzSRtEw4kMaumlUl8Z/a5yYNWAwjPOhcppgjz8nM90pW8o+uTjWrG6nIIj
	hXQlkqnUGTqNRdu6jaxwZgoDgtrv6myEF+YksTApeTwcCo2yf/7lmqDT3KymzlQ6656zyZ4tOeA
	uNQfotzKEbzyICew4DtlRkeeaMgUpBP5jU0/8PwSo07F0IqgSx39FDDrKHUA3EcKADa0iwC6x2v
	ciq5lnlxHfCI8aGg1nwI2/+gBa3qP3DAYhul+kHf9j1TQZQw0Q==
X-Received: by 2002:aa7:d94b:0:b0:6a9:c9d8:b3b6 with SMTP id 4fb4d7f45d1cf-6aac8f0ae7emr1949690a12.6.1790265228473;
        Thu, 24 Sep 2026 08:53:48 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38b2fc5sm3815784a12.27.2026.09.24.08.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:53:45 -0700 (PDT)
Message-ID: <6d538f3d-dd83-4dfb-b091-9b84acf47c62@gmail.com>
Date: Thu, 24 Sep 2026 16:53:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] nvme-pci: implement dma-buf backed requests
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1789997898.git.asml.silence@gmail.com>
 <e80c3b1e0de004eaca6c51a2a86115ac9ed36381.1789997898.git.asml.silence@gmail.com>
 <20260922132016.GA30684@lst.de>
 <d39a6dd7-cb5a-43d6-8dcb-16eb9fc95b4d@gmail.com>
 <20260923045505.GB26231@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260923045505.GB26231@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 05:55, Christoph Hellwig wrote:
> On Tue, Sep 22, 2026 at 02:37:08PM +0100, Pavel Begunkov wrote:
>>> Sashiko had a few comments, which I think are correct - if we use
>>> dma_map_sg to map the data, we need to use the sync_sg APIs to
>>> transfer ownership.  That only matters on non-coherent architectures
>>> with MMU, but we need to get it right.
>>
>> I've seen that and fixed everything locally that should be fixed,
>> apart from the sync. I wonder what we can do about that? I can
>> somehow replace it with the sg variant for now, but sync'ing the
>> entire possibly multi-GB mapping for, let's say, a 512B I/O, sounds
>> not wise.
> 
> If we'd want to fix this for real we'd need to add an offset to the
> sync by sg methods.  Or move away from scatterlists in dma-buf, given
> that they are a horrible API.  All of these are bigger projects,
> though.  So for now I think you'd want to do the sync all, and have
> the people who run high-performance io_uring code on non-coherent
> platforms suffer.
> 
>> And I can think of another place that does mix sync_single
>> with sgs.
> 
> Which one?

All the recent networking zero-copy / dma-buf apis.

-- 
Pavel Begunkov

