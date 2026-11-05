Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880979;
	b=hpHOEZdSotNt0HNcXx3XjFs3i0Nh3HQuPwr3+z85lA8IpSUSJTsFgd5mmTERmdMFSWPD
	 vkMJO8N6jNjs5/sMQd/QRGvv+wZF7ULpcV2pjH59LLfCkl1tdvJO7v0T0mZpHAEA4PPNH
	 9X+pQzdkrBVYTgwNe+cxStHWhl9MKWbIjH5ZViX3kJJRvzy+uwfhCqALPho4zz3nsaU/N
	 P1fT7wKBPF8vqzA+203rZJM+BXM3igSua2tZCblJRgD9lFIjhQIF9UHG1euJ3OeQKIOaq
	 4ZfU3v4aT1g5vkWoN/DlX5xhM6GENfkgZ513NWp0TAVX+mw99Vyeg6onW8tJ1gH1f3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880979;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ATKenzrH4aHLGg+Gz/30nbgsHYXLMAm97uKz3BQEpq8=;
	b=i5sJaau1wB7MYY0qIrIsP9ZIo38xxxmrxk1lO+B1KKxYDR3YmzihEU4RpoPoZWHzBMKb
	 UrMDcFzFI3XbS06iymI1z8BsaJHa5O32Tmdjezd+ghy0JIrv56zL8Cv3dlkYK+6i4Cwi3
	 kmjnKEi0RoigiqaZTTgL7GuTtZ5eEILwwY9AYdVTjW5QnPiCew3EthPtxsaW4sfA71yFx
	 E6sqvTzqdJaNfm3SrdkpHAsu1dnrtmMbNcHaCzHbtsPC555WeGRRyxYig8f/+6r4jjwF7
	 8R6a9kUT2cfgYMKgl6Z7VkUOBkm6v1olW0Bq/C5ccHP48phNdGKgeitcR9lMI6yubjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxcQTFTe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D4606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxcQTFTe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA011F00919;
	Thu,  5 Nov 2026 12:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880978;
	bh=ATKenzrH4aHLGg+Gz/30nbgsHYXLMAm97uKz3BQEpq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dxcQTFTemS9uQTJPXISYTQtN/OxyWxw4ps5fPRhMNikorWbVIxo2+rpVvdR6AChVC
	 o9C/iwEuoZyk6h9rwuSksrwUB7Q8jf/F1M+nagBpzPYd7fnlc6V/B6j44Yj12TNuLK
	 x7IZCKvFZh3uR8vegTGzs8VqPCwryEPpDR4yLRJuoabluTNCWuOtFL6ZeKvdFL199+
	 RaedfrdzvQAQwvozFg/bwy3iO6nwJjnbP6QGGp2bgRJTqOYH6kd82pOcttb2Vvffzb
	 uVLZn62KJkJFQIklzDpZMx7PuM8bFBgBgFNSFvyeEJmt+UkVgdGQQkXNmVeUPKNjQ/
	 SAaWlSE9bHDAQ==
Date: Thu, 5 Nov 2026 17:46:13 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Shukai Ni <shukai.ni@kuleuven.be>, Sumit Garg <sumit.garg@kernel.org>,
	Jens Wiklander <jenswi@kernel.org>,
	Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] tee: fix page count in register_shm_helper() error
 path
Message-ID: <auxzjSfifbLjPasI@sumit-xelite>
References: <20260831105824.3141687-1-shukai.ni@kuleuven.be>
 <20260831105824.3141687-2-shukai.ni@kuleuven.be>
 <CAGgiveUQ9_uZLL=KgGtV0PNiBRbHhRVMqKxWwE3jww2asW98VA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGgiveUQ9_uZLL=KgGtV0PNiBRbHhRVMqKxWwE3jww2asW98VA@mail.gmail.com>

On Tue, 03 Nov 2026 at 19:11:06 +0100, Jens Wiklander wrote:
>Hi,
>
>On Mon, Aug 31, 2026 at 12:58 PM Shukai Ni <shukai.ni@kuleuven.be> wrote:
>>
>> iov_iter_extract_pages() returns the number of bytes extracted and sets off
>> to the offset into the first page. For the iterator, the number of pages
>> pinned is therefore DIV_ROUND_UP(len + off, PAGE_SIZE).
>>
>> The partial-extraction error path instead records len / PAGE_SIZE. For an
>> unaligned buffer this can undercount by one, causing unpin_user_pages() to
>> leave a page pinned.
>>
>> Fixes: d5cf5b37064b ("tee: fix register_shm_helper()")
>> Cc: stable@vger.kernel.org
>> Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
>> Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
>> Signed-off-by: Shukai Ni <shukai.ni@kuleuven.be>
>> ---
>>  drivers/tee/tee_shm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
>> index 6742b35..fa446e4 100644
>> --- a/drivers/tee/tee_shm.c
>> +++ b/drivers/tee/tee_shm.c
>> @@ -454,7 +454,7 @@ register_shm_helper(struct tee_context *ctx, struct iov_iter *iter, u32 flags,
>>                  * If we only got a few pages, update to release the
>>                  * correct amount below.
>>                  */
>> -               shm->num_pages = len / PAGE_SIZE;
>> +               shm->num_pages = DIV_ROUND_UP(len + off, PAGE_SIZE);
>>                 ret = ERR_PTR(-ENOMEM);
>>                 goto err_put_shm_pages;
>>         }
>> --
>> 2.55.0
>>
>
>Looks good. Sumit, do you agree?

Sounds like a reasonable fix to me, feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit
