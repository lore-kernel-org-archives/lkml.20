Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501B545DA4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921772; cv=none; b=RDxmk/MuZypBsh2H/KiEuJwFwlTePTTh+t2ZgDl2XEJEy/bBJPVgDjCLZZbPDgQ/X8tZlifFD1Nq02tIIcxcnKB8yrYbVApSzd5Nko4Kepfs8yBMnFvEeBRR4QrRVSCHZTM7+2PNwuyIJVPJwnblODSXAOheRGTmCAv3tvl1dKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921772; c=relaxed/simple;
	bh=5OmzUIP8dmoGXLqtWjV2SDzvrm+zBkTDLpjN5AcCB6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNiCtkvEPJvDLOCttCZbfWnVuwlY6G2miCKLr6HE2EeiY8ShaNZLEIsllMlQPmIn679K9yRUovMunrHwx1NYu6fm+/CtQ7KmvGr80g8mB1OJ4Y8K5Ss8LaZKFGRaYk30lOMEZJl3ipYqc+r1EtGqnzEYfsI00Lg4PQM9hz0QKZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJf3PxDN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJf3PxDN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso18650055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791921768; x=1792526568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht3KL+dVHT63kyImKLUa9SErnOvImt82gs/Vf44c6SY=;
        b=hJf3PxDN4i6ZpsKL2RdjcwzOTsxpJNzzmvONtwiGent2HSuMTbvCA/ErZzO6rsrI4o
         fDJFZhbpOZehvFgsi6t+o1TCN3mTCJLCRM/gI/fd0Rep5AhyMflANAxrT89Vtn4NYrR2
         GZok6c3wcIMdliMvyGLNyJbo9XAcsFwmJMPruDMBB9q1uRaozVCLvb+722hn4fGUQ/xJ
         lhivSigzIf16XS8SAFInn5e2TgMYXDgEFWNjS5PXDqsxiqbyKl0FYl6WPvD9rL1zBvUY
         pIfJVNz7f4RkYuT0Et8lCvOsX2ZIx5S4s2VJWHrWadTEo2JcTjFz0Ko2MR3X7/OWcS7S
         h/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921768; x=1792526568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht3KL+dVHT63kyImKLUa9SErnOvImt82gs/Vf44c6SY=;
        b=1bgqER21vfugAewi2HOl55OYFfdnF7Mqj7z0hmVO8JFfZtDrAiUKsEdEXWWZCYnCbR
         j0tX+0sBY8t96vjL5Iqu8aYtd+IoZgpuA8HW+XLpnXQJLXXqlP/SdILaptzDQE/RVi46
         VDyXu7avgnP9UmPuEkbUDkbIpmvVDEOz/z0kajGYhJcrh5SUudGXeBNvu0BiD6R3+S0s
         XiQnTLWktws2ZNQ/DD9BXNY4uubqQgcM6NJgcappf7p8TYRE0IOki8zeSkAPoUD8oFr4
         XWD6YyeamLWxf4ZUlLksX1WPpB5l7sJWQQLtYVecRA3eIVZNLHTebBIpY3i8R/HFLkNq
         r7AQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Amgqn4XhEMUsMfsyMCQ6ttYzfVhhVLhwDqR817xWDYwHtyUNRm1Rt0UK8mxVlC/vuQ4NscVakRocVCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiJQp82fbzOI7A8NbUSPdPKiA3c4wGVDpEMv+2rSFEmOBN/YdE
	dTrKEuAIXYEdbL1ZHxXt/O28N1KDbPqxjjaYWI8eOj5r5pjLuIlNkXeS
X-Gm-Gg: AYBFou3saJCr68b2Y68+vhhezRSoCRhlrTVgipBDFRo4mlleaWAEgpVenfRPZl7/7xL
	EJhanvQjh+G+kRiK1T9dzzlT/Pv3FxvOQYGX2GOo0u6INw4QdDDuESfwPG/RN2Ws3GxVoQgZeC4
	njJvLh0y2kpdT1PtjB0TB8Cqq2YzS/2JPTHOe2Eoqakex5KVoB5qXruAyZ7LlHuudgaTVi2ZzGc
	0eWhX7n7RWA7qIo6XY39KPB2DDjEEqCqloOcWBGd0uP9vf92+1ZimRnzWs2njw2Bd3iNiIR8Yg+
	mPd6FomVoKT5reFoEt0P8yTpEvY8uRpuJ1Q1t/84TDl4+BoF4Ko3Y0y6IGYpopn+PYBy8r94BiB
	FvmEFaURXiLPawPDlFkrAnmKNNgvFRrS5tj8TpqQ4E43eLt8j9G8zzeZ6e5zVdDI/bl5SZytae6
	Zn1Vf8DJu6Zf/2X4Qh23YFzEKvNMx8Pp4L48qEwmBmIDMUHyiZyTK4U7Xc+DGdS5hSK5A5g6biO
	1ba4te/PKbvnmoIRTf03KQtYKKtdIeMVFIs7cLVciHruZvn5oKbW4rCnBFe928yCGSqq8cO0t/q
	xGcJ4XK0NOpZGiBtq3ryV2nOuBOYYv/eCiZMzDVs9mjfcZD6Kiq/AfQ272U=
X-Received: by 2002:a05:600c:46cc:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18e4b583fmr268480065e9.22.1791921767928;
        Tue, 13 Oct 2026 13:02:47 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm384426465e9.13.2026.10.13.13.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:02:47 -0700 (PDT)
Message-ID: <63fa3e64-44a8-4539-960c-946cebc8fce5@gmail.com>
Date: Tue, 13 Oct 2026 21:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/13] dma-buf: introduce initial file I/O
 infrastructure
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <b44df9fed6e346110c504ee312bb0083c7e75574.1791336930.git.asml.silence@gmail.com>
 <aszbv7TgDOPHBEem@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aszbv7TgDOPHBEem@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 14:08, Matthew Brost wrote:
> On Wed, Oct 07, 2026 at 02:42:44AM +0100, Pavel Begunkov wrote:
>> The goal is to be able to natively use dma-buf in the read-write / IO
>> path. This patch adds basic building blocks serving as a glue and API
>> between drivers and upper layer subsystems providing the uAPI. Later
>> patches implement it for NVMe raw block devices and expose it to the
>> user space via io_uring.
>>
>> There are two main objects. struct dma_buf_io_ctx and struct
>> dma_buf_io_map. The ctx is used during initial registration and serves
>> as an interface between the upper layer user like io_uring and to the
>> importer subsystem / driver. The map represents the actual dma map
>> established for the target device[s] with dma_buf_map_attachment() and
>> stored in a device specific format. The context is created via a new
>> file operation ->init_dma_buf_io_ctx.
>>
>> The ctx-map separation exists to facilitate map invalidation (see
>> dma_buf_io_invalidate_mappings()). A ctx can create
>> multiple maps during its lifetime, but there can only be no more than
>> one (active) map attached to it. Invalidation drops the active map
>> if present, and any new I/O request will try to create a new one.
>>
>> The primary task of dma_buf_io_map is to count requests using it
>> and wait for their completion when we want to destroy the DMA map.
>>
>> [un]mapping and any work with dma addresses is delegated to the
>> importer driver via an ops table stored in the ctx, see struct
>> dma_buf_io_ops. Only the target driver / subsystem knows about devices
>> it wants to use the dma-buf with, especially in case of multi-device
>> filesystems or stacking in the future.
>>
> 
> Full disclosure Pavel incorporated some of my ideas wrt to locking
> cleanup which I shared off the list.
> 
> So I can't in fairness give an RB but:
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> 
> For the series - I can give this and I have pulled to code + have Xe
> nvme + IGT setup showing this working:
> 
> Tested-by: Matthew Brost <matthew.brost@intel.com>

Thanks for the suggestions and testing!

-- 
Pavel Begunkov

