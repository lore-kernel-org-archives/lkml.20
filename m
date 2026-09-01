Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D1F313267
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224912; cv=none; b=GP4XdZqtNMJJbcfa62i/nrqCIn/DH1PGaWnyiY2jytpCjNqJxtKyLnyXxOQTWzXKzTZ9lDB/4jxromfTMAs2y+HrjylDRGvdBF1aK2CbncYlMd2wfIjjDAfNdP/1pnKJHO/DewGWo8MownpFSwqoLV16N5GMtMUYJN6qZ2GCK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224912; c=relaxed/simple;
	bh=MJNLhpQhJGkeIF1WwTDDw3hEE3CKHIwQNpVbb5x81kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVqoTlqAaWgLlIfcJpJoQgP2WMxZVO+1xQVsD6RJYtZYXqsb5vMIApGN1B0YOA6j8WWsJdQnHW1dq5lBWtLp+bJ4OHmHoyc47y2yYIUrH4P5iFTZ7J7fUluD0uIBp7Vnc49ivMbvhgsdgIuyiYwqY6f2vMSCzRnJEYLS5Zfq4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vVBKhSqu; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vVBKhSqu"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788224907; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=FakrPrqir8gfCjpOedoFPimPDGsbRAUjqSeFGI41yOA=;
	b=vVBKhSquVltgYYBCYttVHGhtwbZ+adIenF18O0s0sj8TnpkY6ShpO15obNNKA9axLg3swSGSGd58y+dDyxD0AAKJ772H6C3t7Ce2dU4eLrkKiUipd6OzxRGTGJFcCqo1Y9neuIgvIkcbNKY2OrdJKQ6+IH0FCLfsfbissJNP1oY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XA0Vqsa_1788224906;
Received: from 30.221.129.88(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XA0Vqsa_1788224906 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 09:08:26 +0800
Message-ID: <fdd373d2-0c70-4a64-b2da-50f2dac194b1@linux.alibaba.com>
Date: Tue, 1 Sep 2026 09:08:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ocfs2: restrict OCFS2_INVALID_SLOT suballoc slot to
 system inodes
To: Heming Zhao <heming.zhao@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
 <20260831062848.2743436-2-joseph.qi@linux.alibaba.com> <apWJLyCNwqfdiRQb@p15>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <apWJLyCNwqfdiRQb@p15>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/31/26 10:02 PM, Heming Zhao wrote:
> On Mon, Aug 31, 2026 at 02:28:45PM +0800, Joseph Qi wrote:
>> ocfs2_validate_inode_block() currently permits i_suballoc_slot to be
>> OCFS2_INVALID_SLOT for any dinode.  Only system inodes created by
>> mkfs.ocfs2 are allocated from the global allocator and thus
>> legitimately carry this value; regular inodes are always allocated
>> from a per-slot suballocator and hence must have a valid slot.
>>
>> If a corrupted regular inode with OCFS2_INVALID_SLOT is accepted,
>> ocfs2_remove_inode() will pass the slot to ocfs2_get_system_file_inode()
>> and get_local_system_inode() will hit BUG_ON(slot == OCFS2_INVALID_SLOT)
>> when the inode is deleted.  This can be triggered by an unprivileged
>> user unlinking such a corrupted file.
>>
>> Reject OCFS2_INVALID_SLOT for non-system dinodes during validation,
>> while still accepting it for system inodes.
>>
>> Fixes: fe7a283b3916 ("ocfs2: add suballoc slot check in ocfs2_validate_inode_block()")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> 
> LGTM.
> Reviewed-by: Heming Zhao <heming.zhao@suse.com>

Thanks, sashiko has some review comments, I'll fix them and send v2 later.

Joseph

>> ---
>>  fs/ocfs2/inode.c | 19 +++++++++++++++++--
>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
>> index 180107a11046..eda50f13ffb5 100644
>> --- a/fs/ocfs2/inode.c
>> +++ b/fs/ocfs2/inode.c
>> @@ -1520,8 +1520,23 @@ int ocfs2_validate_inode_block(struct super_block *sb,
>>  		goto bail;
>>  	}
>>  
>> -	if (le16_to_cpu(di->i_suballoc_slot) != (u16)OCFS2_INVALID_SLOT &&
>> -	    (u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
>> +	/*
>> +	 * Only system inodes created by mkfs.ocfs2 are allocated from the
>> +	 * global allocator and thus legitimately carry OCFS2_INVALID_SLOT.
>> +	 * Regular inodes are always allocated from a per-slot suballocator.
>> +	 * If a regular inode with OCFS2_INVALID_SLOT was accepted here,
>> +	 * deleting it would pass the slot to get_local_system_inode() via
>> +	 * ocfs2_remove_inode() and trigger BUG_ON(slot == OCFS2_INVALID_SLOT).
>> +	 */
>> +	if (le16_to_cpu(di->i_suballoc_slot) == (u16)OCFS2_INVALID_SLOT) {
>> +		if (!(le32_to_cpu(di->i_flags) & OCFS2_SYSTEM_FL)) {
>> +			rc = ocfs2_error(sb,
>> +					 "Invalid dinode %llu: suballoc slot %u for non-system inode\n",
>> +					 (unsigned long long)bh->b_blocknr,
>> +					 le16_to_cpu(di->i_suballoc_slot));
>> +			goto bail;
>> +		}
>> +	} else if ((u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
>>  		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc slot %u\n",
>>  				 (unsigned long long)bh->b_blocknr,
>>  				 le16_to_cpu(di->i_suballoc_slot));
>> -- 
>> 2.39.3
>>

