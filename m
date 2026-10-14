Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82972560AAD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996210; cv=none; b=ZdF6Nwx5k0XvPXzfLvYPHc0oWBMMOlIwdZfXLX/OIptF4yaR8OwO9FXdHdJg5d9sfdnd+Jlvws9PYF63JTsVY0nWJBVnMXSXvP9ppjDwPSOejK8MljL1Oa6X8JkTNvjzN6hfoIn9Zyw0hEdKTr3cQU4ica0Mr8bFcrGF+mfX4qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996210; c=relaxed/simple;
	bh=inWFXH/4gvwDDJShSxb1UbDeXwomoSCtPfVrGbG9V30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlmSTe3wnpB7tBwx5PKnd2ZTn2rYxix2Uiqrlr0a7ObCUKTot9bpnO7MYbJuhQepx671a1bbzcO4UxWKe3hrxApmZEq1J1O0LepOjXM/GEIEgAga9POwgmnWxb2KJyehK+rFBXunaJ7SmGpVkw/NdKikWf55WFA/K0reK0PEsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1NM3HAv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1NM3HAv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso57221915e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996207; x=1792601007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MprqRVTku8rnnoqrNidogE79Hh/sbjcVtJHMk6QO0CA=;
        b=E1NM3HAvhNi9WchZCxi00OWvzNXWTS2u9u46iCZ3ECQeHnpGaWCZkd2cly+63fqf9N
         vCRSfhbNX4pSk9hS9CdsqxtJ9Ct3kD9jrt77wBkSBXF+cbMZ9YyJCbxsApFjfxGwVHkQ
         9mI97SUREXrgYZjUWhNcorUK/AhUkfbW+kAiYYRCscCCfVyE99IvI5Lvc+isggf0hntX
         ILRq77IJjxILg2lW57G4jEGwEYrprjfZgboCuATbf849dHnvs/BT/5NTChKw9SrVwSYC
         ojaj/o0+U59n8OjEQVffo6tw80KC9ygURz8nKf7xjhnzzmTKJzZNJFGetkIgcLFaC/NG
         GqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996207; x=1792601007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MprqRVTku8rnnoqrNidogE79Hh/sbjcVtJHMk6QO0CA=;
        b=TXmchxKL2KIBbFTM5m7irOlcv1FIsQH5AxSLniHgZ+tXOwPxxfmGUVck7MXrt0OMvp
         9aFLOuU1wjsfOnv1kms/imsqOVNPS+PPsaEQHEMaGCePkYPms3F0IgeEq1s8FPx1CKay
         4g96w4I+iBabKizIU6rvCnv1CXO2dS46KR04pAzFGqhlTCzjwx84HEQTGwN5L+BdvU22
         l5s2tJhxCajVr/oEapSvBofP/0X7kh13vriik/xsmK7mY27fgmAewBBOU2IV5WdCrezu
         Rs9/nWSIwTXx27dB0uw41IAo2RUBJsuj+k9YB/7aU7ivza/j5lgFSMijI2KnxtTSooHh
         q6lw==
X-Forwarded-Encrypted: i=1; AKwUvBxmgHiNFF0x5Nh0psvc5DmD+pISp9oonebx4CDy2PGKsnfrDDxuF4RshuUvQppbhLM7Vz/AEbNtZ2nagl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVGSvKyHvdDSyvcCXqPzM9k5BZy8SlQ0ZhS+DlwvgvWqn5kHVM
	rHXxEhWkV2SPBU/1hbyCpWBr+13Syzc3Bzmn/AIhNBlThaFigQpjb3Jp
X-Gm-Gg: AYBFou26Acpve0pgqOgHhacCo2usAYVJ5PkTYGwRhUaLDToJVj5rMwoLsTz0yBA3ujJ
	gl1W9U8q1jNmky+OzXW2dSHOwbp7YNmFgbTUQv9HWwQo/7OKeNY6HfIIrjnAAxRYYaOn6ibUf+c
	rfrvgIpuEBbIAzaZ1JWR/vFPQUVqg1TPEM4ooKU8DduygfKnsPVPhdg1R5V6NVR8J52FjpxUN0c
	QffnKHPc28Tuo3040JTzdW+uyeueJn0lzp0YrjDJismqfA7hWJGZkbYRXvwVPLF6/WnqmqURmVI
	6/LTcjDDWNaX7k2jNuSXziusvQcdpstbTS6+6GoE0bGLXWwrMTsNRFtMGmXoadCLINdvFidfK3k
	V9B/IWptDxO2VGDK2dMS8tKJb5wTljRP61XyVQBGoJIVCxuqoK9++lDFz/vjj3vf1URzsqklqW3
	C36hjZ5TO18QxnFLGp4G3puGDANEMv+4UnQzbrvve4gY0O4ID4F1+sAa/CX2+8j1abqkeVx60zM
	whQgTghvNPrUY0bFex/B5mYTSK5lrZgkVQE62988D0bwAxQb2S53Tq/B1TzgDfS8DcbigkHBLJc
	QO6og+qZma19v2CYcGzOgF8YSb+Fdo03Gvy2DYw3hnQ1xjHh
X-Received: by 2002:a05:600c:83cf:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1ac666a65mr120408565e9.1.1791996206748;
        Wed, 14 Oct 2026 09:43:26 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd640be0sm4751135e9.1.2026.10.14.09.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:43:24 -0700 (PDT)
Message-ID: <7d3c3cc3-5c7b-4d28-82d8-2cdb5e010c29@gmail.com>
Date: Wed, 14 Oct 2026 17:43:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/13] block: introduce dma map backed bio type
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
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791975048.git.asml.silence@gmail.com>
 <39b964cf7510f42755188563da63d3d5acaf2aa9.1791975048.git.asml.silence@gmail.com>
 <20261014131554.GA16467@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261014131554.GA16467@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 14:15, Christoph Hellwig wrote:
> On Wed, Oct 14, 2026 at 12:02:02PM +0100, Pavel Begunkov wrote:
...>>   	case REQ_OP_DISCARD:
>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>> index e929f94b25c7..1b7f8cbbda8b 100644
>> --- a/block/blk-mq.c
>> +++ b/block/blk-mq.c
>> @@ -3150,6 +3150,12 @@ void blk_mq_submit_bio(struct bio *bio)
>>   		goto queue_exit;
>>   	}
>>   
>> +	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
>> +		bdev_has_integrity_csum(bio->bi_bdev))) {
>> +		bio_endio_status(bio, BLK_STS_NOTSUPP);
> 
> Wrong indentation, conditions are never indented the same level as
> the following code block, even with the weirdest preferences.
> 
> /me note the patch from Anuj on the list actually got this right..

I had to split Anuj's patch in two, should've butchered it
while hand applying. I'll follow up on that unless Jens
already applied the change.

> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

-- 
Pavel Begunkov

