Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBA3D0934
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762994; cv=none; b=YE2Ajmw33/6Tbcdub6/27KGYJhPQZdLeIGixXL38XBt7I5U9bguVKcASiOG1oQOYGJwLo1AOrRLAQ38G2EVdIhFy94GCW8tT4kBPOkPSQ67/ENPWwsaePv3gitu8diXRNQEue3NwnBdifS0TfwUe3S+KTdgmyDPg+7JC7fw2vyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762994; c=relaxed/simple;
	bh=hrw1dd3W52X2PRIBJ61p/Ixy3mLjm6opZZ+GWT4oBp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AG63S+WuWGHDKTRnWRnoS+J3MYP57ffquvHyz2Ui8INMy6B4CiSOQG1pKCJd3CUKowZnyzYy4/o2nnOLzPb+Y3gHV4CHFK1liXDuXzUoOfyYepz7YFhtG6Fty03pldv52kmHbKX5qz9UQA8UKEzq0/fKjyTjFmVQudUFAjaFz/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkzMs851; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkzMs851"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so4994406a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762987; x=1791367787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruocdeJmKgpaQFus+PucSGDLt7ZSCHmy/3XR1sTVzPs=;
        b=bkzMs851c9zZ8pLRd7lGGP1HQkdNCJPEQ9CuXY49B0eFdR7dpGB2Nur49+z/HeFkDt
         /SUCrNcWrt6mHvkiKtv5YoTO978/x0FED9JnCX0Almu9bcN+rWc6Vw9/YKgCZNEsUjMY
         eEPNYB/IE7flOrrYfumMz/Yx/kGJAuanFQkOz1UHN2Vd5QMBdgYAjUmprorWC5SOGetH
         DH3fbXlvIB1K4BuylVIKa8z6j3JzdSpqtjjxxZ/nhXwLOhcKvaNjXwDfodTHtvNH3Z2P
         mx/KKz9VOP4glr4+nStpRUBmLTXc6hFwIx1ennedbu8C9DVP9nCgNzuTcNnitLYDpsnu
         fOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762987; x=1791367787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruocdeJmKgpaQFus+PucSGDLt7ZSCHmy/3XR1sTVzPs=;
        b=Qf9YBZh0S7PotQAWFZ1CZO946bQwh7pdgn5JgbreZN3uHOy1/qEQ4O4dd0MGlwIQpY
         XgNOVUqfmOXXMDsiN5shviD6C7I5ZlQNV3dU/InjCz7eI06FxkO5aW5mcblNo6WxjhPN
         VmWydzlEQbDfrbmVDqIb0pWEp39BY/3CRGoqGkUCSDZed6iyq/DmYUflR8nWmAYOiPU2
         OL/mOFWlxNYkVrMfcYeNtxrBlITR05geF2CPAh5pdGAywGpgpYh7r+NvMqnXSsl9TAKj
         y0Zw+umCM0gYX3lC56BqDbD0FLbg3Vu12ectcyzmdocXyTiDa/TEQM2qYHgFanJUxGNv
         VbIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTpUnOwZe6Q9XbzlVuixIyBMHe/d3qGxTpkHRXb27RbHkPAodyOc2xoF0yRsk6Yu2SOmVLOr4g4vmA8nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhkH12pfVzAWmeS+lGr9vxPzYYHqjqIq+9zlELwRYeknbOLfVs
	VN5nIE3udOSqd4NtzcGbSmNYQuYC/bGWAmisp/bCGPrZIQtI6JouaPYU
X-Gm-Gg: AYBFou2cgYBe3zHHvMKot0wAPKMlVsGlblgNVyv53P3GShsgppJjoh9XRAA2il4XAPJ
	GrpORzuB/ofhJXxwpljMSXo2/9Y8lQpZnO03wZ1oOJKOP3xsiFokYql6boM9SqyfJbFZYzPKIga
	HJLqD4Asd4ZwRx9LqjC5SNYi46QjaK57TcE/zFdYJ07br5wZrXRcO54EfaFRUEaWTWDJSfSEZMp
	htW/sH8VbKw/NTh+LxXuzxm1jtV5anVbFU7bQZQ4hWLVOFV5vHFSruQaZM/7/XZI4kcm3WknNGg
	QngJ4gAR7zyBLqhuC++/PnDGOsLO3nQQ2IpH1D/V0AQIV+CCMjidmvJ3pM6sdvBMHshyWXTLIOZ
	8fuguTzyVk5VxnqD7WVbDZWxCVC049/+UOMXOitC8MFKOb1t25s5iWB6LPLGY4+JtZAl0VuMpVQ
	0cDsufxYGrZ8ZIJOcC6kFCaDUqLTsztqNE3Qq8bVL/T7RAIxBU16GYFexIE96JmdWDb4d1D7bRG
	q5hymKO56PvYjGVUwxOLVqk0+zDqQMF7MJMHdW6QOkSYdxxHiD9zKyt5aAh+YvUNr/EGXcOONEB
	mm97srcH5Z6+OIqk+nxHEVvhL9VfE4Kv30MsxZM4GOsosXYu
X-Received: by 2002:a05:6402:27d0:b0:6aa:ec02:7de1 with SMTP id 4fb4d7f45d1cf-6ae199152a4mr634773a12.24.1790762987076;
        Wed, 30 Sep 2026 03:09:47 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15690dbbsm551642a12.22.2026.09.30.03.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:09:46 -0700 (PDT)
Message-ID: <77db5aa5-f160-48fb-ab59-a754b100bc34@gmail.com>
Date: Wed, 30 Sep 2026 11:09:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] nvme-pci: implement dma-buf backed requests
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agk@redhat.com, akpm@linux-foundation.org, anuj20.g@samsung.com,
 axboe@kernel.dk, bmarzins@redhat.com, brauner@kernel.org,
 christian.koenig@amd.com, dm-devel@lists.linux.dev,
 dri-devel@lists.freedesktop.org, hch@lst.de, io-uring@vger.kernel.org,
 jack@suse.cz, joshi.k@samsung.com, kbusch@kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-nvme@lists.infradead.org,
 matthew.brost@intel.com, mpatocka@redhat.com, nj.shetty@samsung.com,
 phil.cayton@intel.com, sagi@grimberg.me, snitzer@kernel.org,
 sumit.semwal@linaro.org, tushar.gohad@intel.com, viro@zeniv.linux.org.uk,
 william.power@intel.com
References: <cover.1790602223.git.asml.silence@gmail.com>
 <e99dd5221c71cbf9aafb5737468d814cb83b9174.1790602223.git.asml.silence@gmail.com>
 <5a35ad21-c9d4-4dab-a4f0-97baee6e2301@wanadoo.fr>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <5a35ad21-c9d4-4dab-a4f0-97baee6e2301@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/26 16:45, Christophe JAILLET wrote:
...>> +    for_each_sgtable_dma_sg(sgt, sg, tmp) {
>> +        dma_addr_t dma_addr = sg_dma_address(sg);
>> +        unsigned long sg_len = sg_dma_len(sg);
>> +
>> +        if ((sg_len % NVME_CTRL_PAGE_SIZE) ||
>> +            (dma_addr % NVME_CTRL_PAGE_SIZE)) {
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>> +        while (sg_len) {
>> +            map->dma_list[i++] = dma_addr;
>> +            dma_addr += NVME_CTRL_PAGE_SIZE;
>> +            sg_len -= NVME_CTRL_PAGE_SIZE;
>> +        }
>> +    }
>> +
>> +    ret = dma_buf_io_init_map(ctx, &map->base, sgt);
>> +    if (ret)
>> +        goto err;
>> +    map->nr_entries = nr_entries;
>> +    map->sgt = sgt;
>> +    return &map->base;
>> +err:
>> +    if (sgt)
>> +        dma_buf_unmap_attachment(attach, sgt, ctx->dir);
>> +    kfree(map);
> 
> kvfree()?

Sashiko also flagged this one. I'm going to apply the nits from
both emails, thanks.

-- 
Pavel Begunkov

