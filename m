Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5F48CD7E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912728; cv=none; b=BFsDPnnT263lGky0AskR3j9ZLpzH2DqRQMoOySGQ/ZNWbQ4RHXaorb09Pu02mK+QeRZvESg6ECTMEl1fc/c2ScI2XsP5zAMEdZEHjnNytO+ckw8dZjOmfW88n8HtNwj6YaNLMjo+lT9nKyiw2gDtE2OAJhPY8KHOyqoqRojoFTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912728; c=relaxed/simple;
	bh=0WkhDjuOG6g0G+Pa/vJ8JsjNy04kahj1JZSpUEVr6zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/7f6ckpDIUuXGVEIosuvBKyejt+N68+VkdQ5+kKkz6vh6XfQjjA7MX58fi8P+kLVVGdD4lxWfX5AjIxq+79C6+7cQv5iq1MxSyxXpB22IogK+odoRfR2BvmXjlsgA281/pufKYAfTjTttMx0SmEAN2e6Wc0fyOGsJxJk5/s6Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=gTt1GC4k; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2IcP8vuI; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="gTt1GC4k";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2IcP8vuI"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DGY6xF4003910
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=bBjc
	kCrRQo6e16uasOscqOcaE/otX5YkEqtpLgsFwik=; b=gTt1GC4ku8itkjVgDFxt
	Y0DMbK9m62npOG7Ur2EDUKTmU7D/Pnd75QmUmCCN2tHWtFKa9Q+jI/9USkxkFopY
	oxstTLN4jYpDa6YbPmFI30NLrEt0L1Ad+u/KXaimoZXZUEm6HifNflnnhvM/B1Mx
	FiZFBEK4xy91SwKBtZSVGOa17kXtSY4JUXT0DPf4G9a8EnOHKd1n6rVNmo7C3RVP
	iIUzZdgahVAmfcPvzZGt+zHv2ejgM7GdjvrfaliYmP5ZydrR12Kuowcspcuu5u7J
	9llo3VdfIDIEi8zAJNCF1J4zKbJSdSxqL5ZvVel3IRDgWOyowBnU33Xfm7Exh5WP
	+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h9qt897as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:32:03 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so646510785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791912723; x=1792517523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBjckCrRQo6e16uasOscqOcaE/otX5YkEqtpLgsFwik=;
        b=2IcP8vuIXqSI3vQbFdfCejUB20ZbkB6xpquxlm1sTE/oeISk4YUCwiCv3Mpj3I0VSp
         dVCKdAbuDdj0+gjHWugWijK6oxTJX5pFdvIOgAA+9GmZLBAMqBgqoGVQTxh8qrp43gPM
         urJaLexLXgnjHvxYdFNu+8/+1pUpS/fkWsanb0iRviS24sp08ndrAV24Rk+T5gRyP8bO
         dk3w5AbQEqIpa3yh7TB8az4uetuSkWsuzveLs4VKhZ0EwBh9mzr4ej7psqOWARdUE+Kw
         OZziEJyxEaZR605wQm6Qo50Egd1KHcl42tqPCL0Yr9ytS/8IsNOTPELwHJx0vMCIlsNI
         Jxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912723; x=1792517523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBjckCrRQo6e16uasOscqOcaE/otX5YkEqtpLgsFwik=;
        b=SfZVn38PTYOQ3Rs92RZj+YlPlMiXsGtaR2hUYyO6n8G7pN+smfJtrWU55dKf89+WVD
         3P6r6XM3WiNrg3hpd5muFI5T0vTVJQz1G+9+vogZrRfvq7qrrsKrpFFqRdHupHdrsROG
         cAPtTKN4MABozh1nlqfaJMS/5wM+EhHcKHIg8dXdBbOSEufiYUV909FYp8HFR538FZCr
         RqnxHivR992ueh8/Q/24TD+EHYtalVoAohgBVjZNnktK3x6UzO3262beNWQYIcIR/dAi
         pYL7ht08zWUukfmi0YeKf8N+3oteOTr1G0idSd0ZDV7K+BvbqCzWASa65xI3r10x6hwT
         Zyww==
X-Forwarded-Encrypted: i=1; AKwUvBz1qvAK6FisMhkQS/tQJQk7VOdzd/+1PyNXE96CqEJUDwDoy5fz5/CEx4t5SszFJCBdYd0u5uV5qNBEeD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIww4M6k0iNABVa+oY61Q4sOSNSC+hBDGI0hjFVNV2S2EJmmNOF
	LMeqfL7BE9bkPzOIrISKbL02oo+SQCljsqXGFx+qxRRAIv7wWcd1hXPtHsYSzCRYYVwudVc01B7
	B5z5J+9f2+LrDz3Nq+8ZFkzdWsxC2GngLqVpDF/d9KolzyaId3D/M5wC+PDw5TsCE5Um/7Q==
X-Gm-Gg: AYBFou2D9FR5YM2/gz0dMvUqgF5J+MBJxxTI90p/0Alho6Dgdqdn4WvClo2AdI+IR1J
	McMWGDi2tm12DtPVBBUP61y/6wHii4KEvFAn4W7Qs7IK/ubK0H8p3/7O33qXOtG4M4mib2uZwQs
	azVdj4nyMqUASnNOT3QRkxIfuiXseFnyDg7NE+kgP1wNqZrwl6p8uzpl0KDQrUskacwpMvFGXld
	S1/VlLkAdMxIldrjiOpDQvfuEVUjsZBMUECPtwLTWI9UXOzgH9QjxgnwXwRPt5bPwjZtmspEVWA
	zMKWIUynNKGDUiTFZOYBrjXsDr2HJZuAOJDoWciwg+2AA3WfL2PiFiYp0ovulxIXBi7ts1Q7jaw
	OvoBiXj0YdbfVkaF5lD5WxicmmCYgbGdkpDzN58jUAImzJw==
X-Received: by 2002:a05:620a:a0d5:20b0:93e:c12c:f135 with SMTP id af79cd13be357-93ec12d07admr1412874585a.80.1791912722881;
        Tue, 13 Oct 2026 10:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d5:20b0:93e:c12c:f135 with SMTP id af79cd13be357-93ec12d07admr1412868585a.80.1791912722195;
        Tue, 13 Oct 2026 10:32:02 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef505463esm285156785a.32.2026.10.13.10.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 10:32:01 -0700 (PDT)
Message-ID: <ef6d0df9-c71a-4b42-bde2-efc4477306ed@columbia.edu>
Date: Tue, 13 Oct 2026 13:32:00 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ext4: complete dropbehind writeback in task context
To: Jan Kara <jack@suse.cz>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>,
        Ojaswin Mujoo
 <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>,
        Taotao Chen <chentaotao@didiglobal.com>,
        Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>,
        "Matthew Wilcox (Oracle)"
 <willy@infradead.org>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-ext4-dontcache-complete-in-task-v1-1-6ac801557041@columbia.edu>
 <cwlno6baljswazb7izeue7yh4qjwbs6ktfj3jgnhdh5zyfp72c@xpar52ae3uej>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <cwlno6baljswazb7izeue7yh4qjwbs6ktfj3jgnhdh5zyfp72c@xpar52ae3uej>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2OSBTYWx0ZWRfX6vo43EAlRypj
 BnTIMi3oMbEW0TXB1Tpc8vz6KqezNuAJ38I1wGxfVJruZJIOti8DnhUOOHBbKomYWJ6bjN8HXRF
 zEGguVfPMV+IbEGeYSIKG6lHjbum/sUBN4TSk4KeTwepRatfJ8zHIkojB7GtPD4909MRA/+bF6x
 90TZTgqSRm2qVEACswPkiAfpGAT0xjFl9A+hwuVqf4RMMQvFFNmqo701ZML9IZF/ECQvbguoHhN
 qdgs1TjVN1th7VJzD+YxZg4vQopRlUzO0U9c1WQDdEqSu1xnWjQn6qDFrJJjITdqs4dyEUcLqVv
 7DCRzSDwG5x/icwnxBWvn6RcWziLVdd293iwnehu4Fz50eXsnTAohzZUD/m6GN2pe2hgEQz8QHc
 4dlEWTfHszC2YrO9Kg94YWoPPb5tTU5YjPyCWMll4V5eyuCy8NRtICAH2JH6G55ojjeP99yTizT
 NpdK53zC5sOkdC3Z3NA==
X-Authority-Analysis: v=2.4 cv=Hs/jiETS c=1 sm=1 tr=0 ts=6ace6b13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=iox4zFpeAAAA:8 a=Z6J5lG1_I9FvLMjSkYoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: Gyv4rrSrvwvk_Lcfqs6D3E-IjEwsWAGV
X-Proofpoint-GUID: Gyv4rrSrvwvk_Lcfqs6D3E-IjEwsWAGV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2OSBTYWx0ZWRfXxumMdlrjuiyz
 AkOJNz7hh7zCBm+i7NzjgZBjG21STjj4KBk6LA4qoAfJP14w6hfPKkIxi4h7lAI/WXk3gLIPi4s
 nwkhcu8u3msBSUPy7Kd0De9mK386O2EXxhqemMDc3mXZHVdqFr+v
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=10 suspectscore=0 bulkscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130069

On 10/13/26 8:47 AM, Jan Kara wrote:
> On Mon 12-10-26 14:04:37, Tal Zussman wrote:
>> ext4_end_bio() ends writeback directly from bio completion, which
>> usually runs in interrupt context, unless the io_end has unwritten
>> extents to convert and is completed from ext4's workqueue.
>> folio_end_dropbehind() only invalidates the folios of an RWF_DONTCACHE
>> write when it runs in task context, and silently skips them otherwise.
>> So on ext4, dontcache writes that overwrite blocks that are already
>> written, or that allocate blocks without unwritten extents, leave their
>> folios in the page cache. Dropping them was best effort so far, as there
>> was no way to get task context from bio completion.
>> 
>> Use the task-context bio completion infrastructure instead: set
>> BIO_COMPLETE_IN_TASK on bios that carry dropbehind folios in
>> io_submit_add_bh(), so that bio_endio() runs their completion from a
>> worker. ext4's iomap buffered I/O path already gets this from iomap, so
>> only the buffer_head based writeback is affected. Skip the flag when the
>> io_end already has unwritten extents, as ext4 then defers the completion
>> itself. A later extent can still make the io_end unwritten after an
>> earlier bio was built. That bio's completion is then deferred twice,
>> which is not optimal, but harmless.
>> 
>> This changes behavior only for bios that carry dropbehind folios: their
>> completion now runs from a worker instead of in interrupt context.
>> 
>> On the unpatched kernel a dontcache overwrite of already-written blocks,
>> or a dontcache write into a new file on a dioread_lock mount, leaves
>> every folio in the page cache (16384/16384 for a 64M file). With the
>> patch, none remain in the page cache. A dontcache write into a new file
>> with unwritten extents already drops its folios on both kernels, as
>> expected, and a plain write keeps them.
>> 
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> 
> I guess this is OK as a short term fix but having two different offloading
> mechanisms for IO completion is just asking for trouble and we should use
> BIO_COMPLETE_IN_TASK when unwritten extent conversion is needed as well.
> But for this fix feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 

Thanks! Agreed on the above. I saw that there was a TODO added in
ext4_iomap_writeback_submit() from the new iomap conversion series to
"switch all defer handlers to the generic bio complete in task framework",
so I assumed that'll be taken care of as part of the ongoing conversion.

- Tal

> 								Honza
> 
>> ---
>>  fs/ext4/page-io.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
>> index 734d856a6d47..e556598ce9e1 100644
>> --- a/fs/ext4/page-io.c
>> +++ b/fs/ext4/page-io.c
>> @@ -458,6 +458,16 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
>>  		io_submit_init_bio(io, inode, folio, bh);
>>  	if (!bio_add_folio(io->io_bio, folio, bh->b_size, bh_offset(bh)))
>>  		goto submit_and_retry;
>> +
>> +	/*
>> +	 * Dropbehind folios can only be invalidated in task context. An
>> +	 * io_end with unwritten extents is completed from ext4's workqueue
>> +	 * anyway, so only ask the block layer to defer the others.
>> +	 */
>> +	if (folio_test_dropbehind(folio) &&
>> +	    !(io->io_end->flag & EXT4_IO_END_UNWRITTEN))
>> +		bio_set_flag(io->io_bio, BIO_COMPLETE_IN_TASK);
>> +
>>  	wbc_account_cgroup_owner(io->io_wbc, folio, bh->b_size);
>>  	io->io_next_block++;
>>  }
>> 
>> ---
>> base-commit: 35aefefd7aba0801bab635b11943f932626be3b2
>> change-id: 20260924-ext4-dontcache-complete-in-task-2340ed5f3114
>> 
>> Best regards,
>> --  
>> Tal Zussman <tz2294@columbia.edu>
>> 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
> 

