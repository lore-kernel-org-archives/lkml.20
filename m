Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69464531626
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922401; cv=none; b=Rt1KAZ3HFsAP3fvkdnpTxaVc4Ico0zW4FXLU/0XrD6Pi9izG8DCjO2KeJbU3hGkWTfvMTe4imq2Egjcx4CBKK8kb5iW1AUfoxvOtKzVFLpUdGEZH+YtaIjIZDd3sZv405sRjsqXFB/YfnWzKG9fXTZBQnd7PEv9IQqoOILPsIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922401; c=relaxed/simple;
	bh=jhbx9laNPy92AqwKrICB3iCZDPZ5wNo0jYJGltxXPiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOUzj3W/9C1XTk0B24ZwUmlgqpZv6F26oXJjx+4kaLGKBcOeIIZGC3q1ULwtYYYcbDuYtiBmxcHbTNKUN4PuDU8N5QgTafkzdKFyLp3tgONbBmHPxYws2jHHiVAsyfPKD6r88k13+1jx0dLGHD9GlRtju7TE6IoTafJLdjBOMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld3gp7MK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld3gp7MK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so3542875e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922397; x=1792527197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2hIuYUY9dxFL1uM5B7+C8H4OaVqNBpDv98EiuOQjRo=;
        b=ld3gp7MK5FcPklAwnoAExZfcQ0nj4/hfGddimZr3xS6GP0gYcjwgPTZDcP12Ee/g5o
         YO474N/HuWU8J+zgOHBgDO5fU/OXrLAv0wx1SNXyUayt3524LMDm01VvpeRDkkPTjwKb
         1BnUO6jONh/m02aBdswYTy46X8oyBXHiuLr6Ol6RI/rDWMfS2hfXlHNixSwsRvYg3sa2
         ZVvgJNEOZA3rpauEkqTIFOaeJscyA8JJj8/MQ2Ll9WFGWmuvc14ROSKKPNBOJ5iHjl/a
         6RlolqFpDWJX6FnIqK5R4k//PNcMKCrWFuMyRoqajPFt5NiFTscqn5N8zWmWhCk1LBA2
         50HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922397; x=1792527197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2hIuYUY9dxFL1uM5B7+C8H4OaVqNBpDv98EiuOQjRo=;
        b=LWPipFCpP7w1Tv3YiNEUL7B4dJxWzD3YCcBf+hgs5x47+juDKUoj4bp6Ks/5KjQnSD
         jqa1RLPtn/hsaauVnRizgK6OoIlNockDs0gTe7QrhB62sbgbzLlD6TqtsZwJjV6W8m7/
         TUK32M1mAfhBtDy15T7E//c1iKovwLwQHbOYgYhL74+8Woji18w359oQ7/xV+VlKOtKy
         /XDTNyoppzG7Uv0I81toD+ayRaNhRUQxc9VhbtBwGh+01AY7+XpD9loDzx/o5kGSTroL
         24yoGWVDvmKjtsyqw/IC3zgCZMJcB/DYQTHue0WpUqiZnWgP87AdIoIXgq42RqXxKQTV
         WtFQ==
X-Gm-Message-State: AFq9FYJSmzuW2R+RfH7PNGbB0RRdKzqODPg4FW+RBOlTW7edUNycOsNL
	44pduMgO4xyrOjfpjKC7VQEDJvPbOgWdgoR7FNXghzEoUPpkEwpKWw5r
X-Gm-Gg: AYBFou2Zjym2iqb41wj9JUZCblbfaO7+Vs+LqQvdvF28wO4ipl4VJ8nZdoba4H3lEjH
	o4QFkQSP0ZcXTHDNie9W+ZWZUkuQCICpuqKzNjqMe2RDLP7OwuyAqznKzkER2kCz4UrIBFhwdfS
	JwOnL8uyQ4f5tJN0sDXRWO2rfE56VYKjfb0flq+crnklaXuLnt+G+nhVu0ZFxeGib3QakshAk8x
	q7sw6dPKc+sS9XeyhkGe3hiKM0Mvf9hfOeYByWZ9s6fWPs0+5i/9T26F+VS++DS1Rm16CQahbM1
	ONCI0HfbjqaQMj9ZgYmyZzbtXQPKHMMoMvIyhSKy6d2SAdseylMtlLNt5YF80RfVUZ0bIO5XZVm
	3BVyajqKsYzSAhMbBq/vsJrVNL6gxP/w5QpZSLSKNShEcK/TuCMTXZ+ZLcWQiABAyWNPs790/U3
	g6eJttMlV8xgx2h3liu0jONMkuF4Qx67bzE7ddUySueRYuOqQbPZRdotIicZ7jBcKFycs2esvKl
	xrCzqMkbQxGkBJwAiEAwKELVPrQTczMw7U3kOmwPiehDUhf3u46S83el+6iHbolwkfmZRDRVap8
	V+av2NmJGWAfQUJOs+2L6SAqwzhTjZQd1Amn2GWtghaMlOiu
X-Received: by 2002:a05:600c:4f42:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a18e3ecfc8mr324117205e9.0.1791922397398;
        Tue, 13 Oct 2026 13:13:17 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm608335675e9.8.2026.10.13.13.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:13:16 -0700 (PDT)
Message-ID: <736950e0-c890-441e-bfa0-ef5d2b7b7d4a@gmail.com>
Date: Tue, 13 Oct 2026 21:13:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/13] block: add dma-buf support for raw bdev
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <CGME20261007014324epcas5p2a7f3b03f118c9a1d1c633fe839ed1e46@epcas5p2.samsung.com>
 <af2b48a490186edf38f1d4a5dfd9513574f7a350.1791336930.git.asml.silence@gmail.com>
 <bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 13:27, Anuj Gupta/Anuj Gupta wrote:
> On 10/7/2026 7:12 AM, Pavel Begunkov wrote:
>> +static int blkdev_init_dma_buf_io_ctx(struct file *file,
>> +				      struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct block_device *bdev = file_bdev(file);
>> +	struct gendisk *disk = bdev->bd_disk;
>> +
>> +	if (!(file->f_flags & O_DIRECT))
>> +		return -EINVAL;
>> +	if (!disk->fops->init_dma_buf_io_ctx)
>> +		return -EOPNOTSUPP;
> 
> dma-buf doesn't work with PI: bi_dmabuf_map aliases bi_io_vec, and
> blk_integrity_iterate() walks it as bvecs to generate/verify the
> checksum. rw-dmabuf liburing test hangs on a PI enabled NVMe. Something
> like below is needed:

Thanks, I already took it into v10! There is some some confusion
with the branches, but will get incorporated in either case.

-- 
Pavel Begunkov

