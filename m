Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB569477E2E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200703; cv=none; b=X5eH4u9EMF5zv0KxfxxTrusYfyos+8dUp5Oq6RVaMsmtRqTQ3FBtSgHfCXdGxhIlmH2Y2JIGicNVn5Ctg9xbAF6/2FjRKCvJE8EgNWQbDmo4emgWv2F7K/KidfkvTzBdqpOgq0B418575tqlbe6cEKE4f35R9i650MBi+adHTwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200703; c=relaxed/simple;
	bh=AgYzF9zCDCjhvarDhGELV8SCCxmRmAduCDS+Ac4RoTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMkV9rGcpmT3l1staWLIe/PXRA8ya0MksDJvvlTLCT90yDHQz1iziI0X1TxaxTsZW7fmWnOO1RXNDKbuxyF8Ko63euz5b23CG/Mn4AbKzkAHuy6OTTxxaPSoagBpR5BA9JxU8AcCzPKEFPx/czSSFgWvt8kyLiJbIZaHRIlcc2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPgdYdX3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPgdYdX3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso915607f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200699; x=1791805499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTSRnK/72f03OAFyRZNcD9D1Hs2QM4XwAkI8vZWB3T4=;
        b=dPgdYdX3mXchRgU1mWLReepLwb6EYksD9oVqP61wtHE1mACXWLZ5ufSTynlOmDVbtI
         NTh/irS5FDLmy/lXohPIsU1I71+iJUNM4Sto/wO5hReO5gkWpujUw7sH/f5zn4o2ycWr
         Tkfm5sZitIcSLTK08Pljy9lcVHc5tEH+Ozpk5Vm3CDpQuoq2+arY2DVHdXfRnwH86vaW
         Ffpbe9a9MNbEJXpWsFnz3F5Bh2uZnkkc2Vwug15VXNAl2hOOERzJ3o0mIH4E+roy+6Y1
         qSueKyN42cVluThyRvgOJ0gYC0gTcdbm3WhEMryVYcVmEDSNiLaOdVmNZA418wadbe1g
         BdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200699; x=1791805499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTSRnK/72f03OAFyRZNcD9D1Hs2QM4XwAkI8vZWB3T4=;
        b=uUla2IzO8eVO9wKXylS4ixai1d0lJyQ4w7G47qSaEpku3DRa3b8FOt/A9B738uEAre
         TDfPJikURRt56qN6C+8YAM5lvOibM7PrKmqDLH698L2QkYeMkn6sZSdj+VecIdCmwFMS
         ezV80UltzRGsIHZ0EVybgp5iRyJMlCpj37Hd8tfKhxU/Ttwv0lRV29/ZmMMSMZVLRok9
         TETGGD4YkkDPeRnuoQLSvnXdITXaizCy76lGelOLiHiUD8BbxbWmBfj9lv3NxWqErXoR
         wnMHByBcEWkkQfn6ngDtn6hf//FVfUdbe0rSkgu3FPUhxDbf8jYc7SJdwYiTh4g/PsHG
         GS6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXYJJyD46WhTWyqwUArG4dlWbEW1reoIJBzjYS+hcmpjL5M2XWhKEemxUWjy9Y7VNTkOrXb/8gpBGOVvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO/2KwjhGPWpp7jSt7++mSGBQNm+ETD+xqPc/c6apQ6d6bpRY1
	qK0nWS1sSLkGXrW4fXzNeGh9mh97RzUs/7ABl8zZv99GV+h1/ZuIirXc
X-Gm-Gg: AYBFou1JHlSmgaoS8Fh7K90M75aE3LWQe5RTSoyZ0UaMZhMX2BGBgsZ/ThT1Z9ojDkr
	n7dz1ihRl1UPosx7YQJDSMnRB8uzR6XdVKyOrTcpJqFUSbNLMyt3kGEMiRHosyklut+ETqZ3R5U
	/ICb8gyAe6ZGipJhMqYBxwnb1W32LivgmnAVI6q5nC9myd2ebeRaDNqU9YroRHP4cmru14HO73d
	3iqMDAcU3keRvFpIJ9gMO2UEaxFsASviV6et+1Yz4FBqwmi2YLYK0y7nJOn60KDXMfULIs0gIZj
	oBO/5WYXJ3Mfw04HSFnCLi5RIGEDDr5K4z5dhdDPZ0T4AUDiLsylF7sub4R/i85g6ttCiwf3HAy
	uFuqkv6ueL++Gi38nVx57dkMktHGfcqgMlaCosu5O12y24esJBByRbsuz7gCm5z9V5ywcC7vUEq
	qThOi1At9Q8+zsy7Td8DA1L10EkAiDMfftsmK3+vuzfy9KbSNvXwbYfLp/cg8FctTkuW6dXTIhY
	E4nBw3TwKRwcwx5gUo94AuTBX9V1T3wxTYq2HVgKMldiAl/rrS75jKTIhkoohbBo6X/ivynNXI=
X-Received: by 2002:a05:6000:186a:b0:48b:6bd:1af6 with SMTP id ffacd0b85a97d-48c48000099mr10478688f8f.40.1791200699411;
        Mon, 05 Oct 2026 04:44:59 -0700 (PDT)
Received: from [10.41.30.1] ([161.12.45.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270751sm3087877f8f.13.2026.10.05.04.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 04:44:58 -0700 (PDT)
Message-ID: <fb0ec34e-deca-4365-8802-23d5688612e6@gmail.com>
Date: Mon, 5 Oct 2026 12:44:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/13] iov_iter: add iterator type for dmabuf maps
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
References: <cover.1790602223.git.asml.silence@gmail.com>
 <74a9d65f5c4f9acce5f57ad5921a9fadc6eda712.1790602223.git.asml.silence@gmail.com>
 <20261005091008.GA10727@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261005091008.GA10727@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 10:10, Christoph Hellwig wrote:
> On Mon, Sep 28, 2026 at 02:32:18PM +0100, Pavel Begunkov wrote:
>> Introduce a new iterator type for dmabuf maps. The map in an opaque
>> object with internals and format specific to the subsystem / driver, and
>> only it can use that subsystem / driver for issuing IO. The task of the
>> middle layers is to pass the map / iterator further down, maybe doing
>> basic splitting and length checking. The iterator can only be used by
>> operations of the file the associated map was created for.
>>
>> Suggested-by: Keith Busch <kbusch@kernel.org>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> 
> FYI, I think the Sashiko complaint about iterate_and_advance2
> is correct here.  We don't really hit that in the series, but leaving
> iov_iter methods partially implemented and fall through to others
> seems dangerous.  At minimum that needs a WARN_ON to catch that case.

v7 already covers iterate_and_advance2(). It complains about
iterate_and_advance_kernel() but there are many types this one
doesn't support.

-- 
Pavel Begunkov

