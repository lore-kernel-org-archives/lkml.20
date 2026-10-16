Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94592F7F01
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157437; cv=none; b=cr9XmwTPt24MzYtr6Rhs+u8xhGDbhe8WWC11HTMsPv4KMqpEGTpKo0T9rYWNriIoAmv8akuO0au1aSdk366hFkgmJvHwV0qi/wy1InZ8WvHPpcc9A1haSv3n+hhuO+tBbU2RomoYfUTK6u2yE1UFEikuYh1fyrQ5kJRrH8piVcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157437; c=relaxed/simple;
	bh=m7dsLq/wKmVRGvzLDRZvUS/FDv3R0+5Ku7yQvLAF4ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIVhhVElJ63ViMDcGmuH1VHrp3yu7N4DcL8l+6Li8BrGi/hsXpPACw7vwEcmVb6V2XbsmHvJWu89Beky1yI0t/uuoYYcP2ibl4WTxFQF0YUdvqiaFW7nY80XrpuL3ecEnxchNqhC2LDg/NKknNT9bzkGeWHJ+y/E4el4FexGHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cga1Juy2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cga1Juy2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2acc1e170cso1088802266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157427; x=1792762227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN27WiywL9AeUaxnGRN/QPN0W0/4s85ChSl9l6b2SN0=;
        b=cga1Juy2zILm3PIuRYhAbSy7oSn9ml0uEkKRzqMi/zTHOZsMSGdmTZv4IHqRZOH2IR
         xsodk5nTKsu4eqFo94ucZWxpUiQFJq+wwCVJn1GuwyRqu4ZRlSrNEuedx11lglgEJtdC
         4rQM/U3CmQqHHvvYNlWJ958z617tQq7BAuVCaq8UnxsyQiKuFNTxUysZZNSmETMR+RQh
         68Qlyw1J9DGDYLiUF3F/7N3SECRoHyeHgfsgCep7kRaWJ6cH2Q4Tq6hYj1WBoGz5Ps8P
         hQu2uirkSurFVwl4PC6dlJWd3InTb5zYo1l+r3geW9D74VRqthfZhYZGmEylmcMtq/7y
         IoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157427; x=1792762227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kN27WiywL9AeUaxnGRN/QPN0W0/4s85ChSl9l6b2SN0=;
        b=J3FXflZKVA8e+fZVj9NXnuWSvfy2WpnN5ZjkKCZlWqhIimMLYPstkSGW8jMQmQgTF3
         kZRa0UTSGEByfxilcgF/O2gkQIv2A/R17be3Tcm1aUb54T3hcHvK4EsFn99jfX2ysB49
         m/AZda71poEWyXDutcm8Z/5LKoTbEbJOOfl7odhJ/swlUFgsTYiTl6/67mkXYySDavIH
         mCJ262QJ33vm3EUzBTb3oKj+SbApnnv2+c+QFeq7BYmjlghAJRwik+ioWDjJPR4VLoS9
         EQgRDtrpmd09X88GyaY6VA187hdzsZjfRG3FHUkMlDE3y8a5WlJKZs6230xWi2rYao/8
         79dw==
X-Gm-Message-State: AFq9FYI2TYHiB1lh8FggQt3YRjmbV3FGPxd56OdAxFuBlrb0axfZ+TRe
	oQEhuZORhkq2NgXfcSPsqqjhSC8dsdGF9kDbnG68uHbg4+pUQSiBm2f0FH58u8hEDTQdKA==
X-Gm-Gg: AYBFou0jK3iNSpAJ90XtGwegMtpzqKZYDYVDpurxxKDlzD2lnvzfYIbLJdjrgScaUDq
	BzwBR8J97HQeql/uj5QRyMmTgShffiMryny9s7ICTaWEBjH//RI05YpYZHBqR0pFZarsieYr2S4
	piv1b0eUnr/8jv1/UctKBLKA90gZqnna3cCwnzv4zSbLNlqzCyrOol1jQBwJ1O1R+aGTMaXgrs6
	3dqAGKv3fYoaGC46BVsDZo/AOZqnVqD1Zu4PPNEdiD0wS+kE+J0dnmegXnHeSmmtgA2EyVhvqrs
	GOJWpCXpmuQCK3JELaVpoUiSWQxZqS+za8BLhGJWCRh9EMcpPyI1wB1RdjkuOWNN2+dA9nnVdSJ
	ymCfxhLM0iTk9l2ACxps8j7JCqj7cv+fpuWBNeBVV7gqi1EoSDRGYBHfNT+RZq7PlVENxq6oQJ0
	Ji01uHcvWnY8rEx6MpryES8TU73QH2QovbBplOH8++ecrUnNrHqX3gcbeluYhtqRNy0+9CC2oMJ
	aovAq2O05q3+/wxNIEIvGuWiMsZ9fqEFQ2tTBtwkM3Si//iRbMKscGI8JM9ZZZVh4p6y2FoRJN5
	bDIY/GCskWRnPojYUJEixWTfiguSd7KgQdfyGjbLqhu6UD9iCX5L+m0cIzm7MzzNliIAso+600z
	O8o2imf/9B9EWAHaGv4i9+Sz6hoZpZ8XiWlVwwCuvOqot
X-Received: by 2002:a17:907:969e:b0:c3f:4d1:8cd7 with SMTP id a640c23a62f3a-c3f04e0e43fmr450871766b.25.1792157426634;
        Fri, 16 Oct 2026 06:30:26 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm70478466b.82.2026.10.16.06.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:30:26 -0700 (PDT)
Message-ID: <55a1f016-a7a2-469f-b481-37223d695f29@gmail.com>
Date: Fri, 16 Oct 2026 15:30:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fat: make rename recovery safe after metadata write
 errors
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
 <20260929090029.742579-1-krystianmkaniewski@gmail.com>
 <87ld8j4161.fsf@mail.parknet.co.jp>
 <1f18819d20c92960b8b2d6ccc8bc4506d346150e.1790779353.git.krystianmkaniewski@gmail.com>
 <87bj90m6dq.fsf@mail.parknet.co.jp>
 <20261014082315.190262-1-krystianmkaniewski@gmail.com>
 <87qzhqvloo.fsf@mail.parknet.co.jp>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <87qzhqvloo.fsf@mail.parknet.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 20:54, OGAWA Hirofumi wrote:

>> diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
>> index d46d1a3..0aab2b1 100644
>> --- a/fs/fat/namei_msdos.c
>> +++ b/fs/fat/namei_msdos.c
>> @@ -441,7 +441,7 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
>>  	struct fat_slot_info old_sinfo, sinfo;
>>  	struct timespec64 ts;
>>  	loff_t new_i_pos;
>> -	int err, old_attrs, is_dir, update_dotdot, corrupt = 0;
>> +	int err, old_attrs, is_dir, update_dotdot, rollback_err = 0;
>>  
>>  	old_sinfo.bh = sinfo.bh = dotdot_bh = NULL;
>>  	old_inode = d_inode(old_dentry);
>> @@ -533,7 +533,7 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
>>  		if (IS_DIRSYNC(new_dir)) {
>>  			err = sync_dirty_buffer(dotdot_bh);
>>  			if (err)
>> -				goto error_dotdot;
>> +				goto error_no_rollback;
>>  		}
>>  		drop_nlink(old_dir);
>>  		if (!new_inode)
>> @@ -543,7 +543,7 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
>>  	err = fat_remove_entries(old_dir, &old_sinfo);	/* and releases bh */
>>  	old_sinfo.bh = NULL;
>>  	if (err)
>> -		goto error_dotdot;
>> +		goto error_no_rollback;
> 
> What is wrong to try to revert dotdot_bh?
> 

Thanks, you are right about dotdot_bh. After a failed dotdot write, the source entry has not been removed yet. The buffer can be read again with bh_read() and, if that succeeds, the old dotdot value can be restored. A failure while removing the old entry is different because the on-disk state of that entry may already be uncertain. I can address this in v4 patch.

>>  	inode_inc_iversion(old_dir);
>>  	fat_truncate_time(old_dir, &ts, FAT_UPDATE_CMTIME);
>>  	mark_inode_dirty(old_dir);
>> @@ -561,37 +561,26 @@ out:
>>  	brelse(old_sinfo.bh);
>>  	return err;
>>  
>> -error_dotdot:
>> -	/* data cluster is shared, serious corruption */
>> -	corrupt = 1;
>> -
>> -	if (update_dotdot) {
>> -		fat_set_start(dotdot_de, MSDOS_I(old_dir)->i_logstart);
>> -		mmb_mark_buffer_dirty(dotdot_bh,
>> -				      &MSDOS_I(old_inode)->i_metadata_bhs);
>> -		corrupt |= sync_dirty_buffer(dotdot_bh);
>> -	}
>> +error_no_rollback:
>> +	/* Do not continue an on-disk rollback that cannot be completed. */
>> +	rollback_err = err;
>>  error_inode:
>>  	fat_detach(old_inode);
>>  	fat_attach(old_inode, old_sinfo.i_pos);
>>  	MSDOS_I(old_inode)->i_attrs = old_attrs;
>>  	if (new_inode) {
>>  		fat_attach(new_inode, new_i_pos);
>> -		if (corrupt) {
>> +		if (!rollback_err) {
>>  			mark_inode_dirty(new_inode);
>> -			corrupt |= sync_inode_metadata(new_inode, 1);
>> +			rollback_err = sync_inode_metadata(new_inode, 1);
>>  		}
>> -	} else {
>> -		/*
>> -		 * If new entry was not sharing the data cluster, it
>> -		 * shouldn't be serious corruption.
>> -		 */
>> -		int err2 = fat_remove_entries(new_dir, &sinfo);
>> -		if (corrupt)
>> -			corrupt |= err2;
>> -		sinfo.bh = NULL;
>> +	} else if (!rollback_err) {
>> +		/* Read the entry block again if a failed write invalidated it. */
>> +		rollback_err = bh_read(sinfo.bh, 0);
> 
> Why do this read the bh from on disk?
> 

The bh_read(sinfo.bh, 0) is needed because a failed inode-position write clears BH_Uptodate. fat_remove_entries() modifies and dirties that retained buffer directly, which otherwise triggers the warning. Reading it first refreshes the whole block. If the read fails, the buffer is left untouched.

The same reasoning applies to both the VFAT and MS-DOS paths.

-- 
Krystian Kaniewski
