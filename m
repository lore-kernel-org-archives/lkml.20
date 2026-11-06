Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974290;
	b=0fGx++fv5kM5ISc/HB28iKmJPjiqezKZTQMmaQ+KBkyZIvNrqJNjbm36shHcX3flULqk
	 yuCLyRNBWzexVDmE2iMMRPn/GgssIf9SYVCCN6CDSRek9Gw0AGwFgT8Z6PKhfDRWEnOY3
	 daLDvyOcHrP9bZlp0iZZMzp6m35cehvLIj56ZZi5DZGr9Ybb2shVUdkRyEcOPPZbRPr9k
	 xNcYdpE0XheJx50WGIMqFj75h9N3qq9aEvPWPqgcYHa44Rb0TEtKIKtK6vYhb3nPWBBES
	 QGE/viMBsTL2Bx+B3mtfBI51xAEBBAYCnPv7aTwNoaywe/HRdif6D1M+MedctSbTZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gFAtxYAEt7DoJRTbCotVhzld7oCE+yb42G19+8+4Oi0=;
	b=gTgIXue++RZBgGiSfCeRahW5fUmHO7Ie6gKdBDrWJkOoDIc44fO2J9MHSR+e6+hJ4gBp
	 P6m1x4Dj+XARs/nqwMEerYKomuMbxRYesO/HnIhcHKVlY9tYPvrcho2e69W1jsfyQnSoE
	 J2qU8SLrGXJGicjia/p0fG9xdkisfwiEtzq5ELl1Wr4qxtoIrFVKSY1nxYeHnIk4x1ckD
	 7JwIvWZRXlfrgv4wUohaQHb8oSdyBPRQ/f1ea5RacCqZSHHG/HeUixCb/F293pKgHFftT
	 bTL5P8tFMIzeoj0ELt9mF4GEezGnRnGL/DquuS2xWfqI7dsM9bs8LelDWWqGDKD5CBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="YM/xQAYf";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB3E606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBB3E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YM/xQAYf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso1835945e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793974287; x=1794579087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFAtxYAEt7DoJRTbCotVhzld7oCE+yb42G19+8+4Oi0=;
        b=YM/xQAYf6pw4kH7rbOA/PQZBYtxVeW8Et1wZbQa+fynER/C76JBS44l9VKD3K1sWES
         zIqbhiEphnB5/SAa3H7pRr/wNrjeVLUX3SQY5zRDkY3u+RIeQbHGpUIMRVgiV+5wanr5
         d2E9oEfJ1fxal3ounuSLSmGhRgP5PRVplU4xRSROqjKKmvG/crM9lLt5ONqYHxL79B/S
         oXJDPgPtvLGqGalnLN+7UkzzD2JBFHji13gbpULj4py8D6+G1IzK7FmWj1ojwtCu211w
         ZBvsaqr3j+Z/MTAtTX7A/N8y/6Tr9CA0O2QWKQnlnWz1FtHvyrbBdc+DKXo+knPR1Fv5
         I3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974287; x=1794579087;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFAtxYAEt7DoJRTbCotVhzld7oCE+yb42G19+8+4Oi0=;
        b=lwn9MSRgjsecJGcTkEaYtKmj2UGtJ943G0nA6QOynR7InXWkydfxc37RiA1hM8xagK
         De89zn4xWAZb6A8xqxdtQ9EMAGUhgN4IGFIP4L8zu0MP/2qNDT8gGY+f5EVKDC+NQuhi
         iqXZ83ULuSFRPnhBkl9ioWGXtLfZ66aOKAF0zvG11P/XmAR6IX7A6xVHJ7KtFbWRb4JT
         wXDE7N/Z6RCnDmhI9Z1wcUpucpDBG/eskQwJLJBEM9d1RXwyMWOC1x9rkDkcGbG1IcUg
         1FpqFm/bo8VY8/1g0uvucBEpt9eYcmj1OL+0MWw4LJZ78qcXqXLr6h5OrlLE79LE6kQf
         6tcA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ98ywky3kgvarbTdvPPjb9Pa5o51f0NpJrQ5g6qZa778SV2e6Q710oVuUUvoB8XmkQrZdCrzQuUJKIu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n/4JF60FB28exa9LVIerPvwz+N3iEGetOrFqxC1F7YJU++1qQ
	Yk7Ek2YS7Sx+hj2koaMFCSrN4y4NA/uOt7/61qdISUogVdR4e+90+dskEgDVaBOZahpYtaI5FQ4
	RLg5OXGo=
X-Gm-Gg: AYBFou2FshGlZ4E+PDOGlG5tOrTu5XPDQW5dBDCli3KZuuapKqXTuF68Qb1rGJt2Jro
	my2EKrLdRSDNcHmRbVTedjZ/PtQou4V3uKy05mIqtjX/EEj92tRXaUpZ26gcWalOKSlF0QNrVg1
	FcRFDlxWJi01HZdyIPs105du1HLjv424GMJiT9unprBNNobcVhg8M7VE8wHoCegBvGLMUvTi4zX
	TSURyK23XQSdCLqcM9C8Qr7bJuQ3rfcMqH9klHhotnrjZpGsR4VBFDCYjnLL3TfOWutrHzG988A
	LP1OYIGLWxaqZw7I/fgpoyhaddogFp36NHgPi/QgSe67yEhLJt/nAMsKnqyO0SufLsn5pXuUaUr
	KHIHOvyrO4fUs5QBM29rtK5Q0jw7CXKkaT2KpqAJ+AE4jQrLe4a+KpqO1wbuFi8bfTs/40SYDye
	UEAgkSc6QA5dwUDuHIHf1LAheuAgRj5P67tLu9TFGZCUvj2d9WZc9p9zVXAB2BEE3WFVVQG09QL
	W6wEE0r8RUVW5SDTRviU85djy7pCAFVDd64oBQVh4yZ75dQwTTqP79R4q97jxcOh/4rrzKtRrNl
	ARb/7qUmzDv/5H51x0B3Z4qIHwirofFUhg==
X-Received: by 2002:a05:600c:e547:10b0:4b6:2242:d0d5 with SMTP id 5b1f17b1804b1-4b6d82b2be4mr28521225e9.0.1793974287161;
        Fri, 06 Nov 2026 06:11:27 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa30138fesm7420962eec.0.2026.11.06.06.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 06:11:26 -0800 (PST)
Message-ID: <da47a96d-3238-4907-a243-9f775e64710b@suse.com>
Date: Fri, 6 Nov 2026 22:11:20 +0800
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
Subject: Re: [RFC PATCH v5 2/4] ocfs2: switch DIO read path from buffer_head
 to iomap
To: Christoph Hellwig <hch@lst.de>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105071930.16399-1-heming.zhao@suse.com>
 <20261105071930.16399-3-heming.zhao@suse.com> <20261106104831.GB5746@lst.de>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20261106104831.GB5746@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 18:48, Christoph Hellwig wrote:
> On Thu, Nov 05, 2026 at 03:19:26PM +0800, Heming Zhao wrote:
>> Migrates the DIO read path from the legacy buffer_head infrastructure
>> to the modern and more efficient iomap framework.
>>
>> Under the current code, ocfs2 holds a cluster lock during DIO via
>> ocfs2_iocb_set_rw_locked(), and releases the cluster lock in
>> ocfs2_dio_end_io() via ocfs2_iocb_clear_rw_locked(). The lock level is
>> stashed in iocb->private.
>>
>> However, iomap DIO owns that field (it stores a bio there for polled I/O
>> and unconditionally clears it before calling ->end_io). Any side-channel
>> state packed into iocb->private is corrupted, which trips the end_io
>> lock-state check.
>>
>> Instead, encode the unlock level by passing distinct iomap_dio_ops methods
>> (ocfs2_iomap_dio_ops_pr for PRMODE or ocfs2_iomap_dio_ops_ex for EXMODE).
>> Additionally, the *_iter() functions use the split __iomap_dio_rw() +
>> iomap_dio_complete() API so they can determine unambiguously, from the
>> return value, whether the completion handler already dropped the lock
>> (real I/O, sync or -EIOCBQUEUED) or whether the caller must drop it
>> (no I/O issued, or buffered fallback).
>>
>> The new function ocfs2_iomap_begin() performs a similar role to
>> ocfs2_get_block(). While ocfs2_get_block() retrieves only one block per
>> call, ocfs2_iomap_begin() can handle multiple blocks at once. Limit the
>> map offset and length in ocfs2_iomap_begin() to OCFS2_MAX_LOGICAL_BLOCK
>> to avoid overflow issues.
>>
>> Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
>> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
>> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
>> ---
>>   fs/ocfs2/Kconfig    |   1 +
>>   fs/ocfs2/aops.c     | 111 ++++++++++++++++++++++++++++++++++++++++++++
>>   fs/ocfs2/aops.h     |   4 ++
>>   fs/ocfs2/file.c     |  62 +++++++++++++++++++++----
>>   fs/ocfs2/ocfs2_fs.h |   3 ++
>>   5 files changed, 172 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/ocfs2/Kconfig b/fs/ocfs2/Kconfig
>> index 2514d36cbe01..bf1678a5eb01 100644
>> --- a/fs/ocfs2/Kconfig
>> +++ b/fs/ocfs2/Kconfig
>> @@ -7,6 +7,7 @@ config OCFS2_FS
>>   	select CRC32
>>   	select QUOTA
>>   	select QUOTA_TREE
>> +	select FS_IOMAP
>>   	select FS_POSIX_ACL
>>   	select LEGACY_DIRECT_IO
>>   	help
>> diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
>> index 0f7502de9b8d..8e4d31cb85db 100644
>> --- a/fs/ocfs2/aops.c
>> +++ b/fs/ocfs2/aops.c
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   #include <linux/fs.h>
>> +#include <linux/iomap.h>
>>   #include <linux/slab.h>
>>   #include <linux/highmem.h>
>>   #include <linux/pagemap.h>
>> @@ -2534,6 +2535,116 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>>   				    ocfs2_dio_end_io, 0);
>>   }
>>   
>> +static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>> +		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
>> +{
>> +	int ret;
>> +	struct ocfs2_map_block map;
>> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>> +	u8 blkbits = inode->i_blkbits;
>> +
>> +	if ((offset >> blkbits) > OCFS2_MAX_LOGICAL_BLOCK)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Calculate the first and last logical blocks respectively.
>> +	 */
>> +	map.lblk = offset >> blkbits;
>> +	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
>> +			OCFS2_MAX_LOGICAL_BLOCK) - map.lblk + 1;
>> +	map.flags = 0;
>> +
>> +	if (flags & IOMAP_WRITE) {
>> +		return -EOPNOTSUPP;
>> +	} else {
> 
> No need for an else after a return..

OK.

> 
>> +	/*
>> +	 * Before returning to iomap, let's ensure the allocated mapping
>> +	 * covers the entire requested length for atomic writes.
>> +	 */
>> +	if (flags & IOMAP_ATOMIC) {
> 
> IOMAP_ATOMIC is never set for reads.
> 

Thanks for your review, I will remove it on next version.

Thanks,
Heming

