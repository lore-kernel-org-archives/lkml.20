Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF03AAF42
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790415996; cv=none; b=AGCnExt5N0fwexvE+hvENWC4Qi1bdm5n6r646Vy75YT6ktOfWyY0tNdHUyyK+zGuunS8Icui2OdYok80DD9+rpUy1C77+u9GeFu1Ph8o77dPPnnAmJ1jHK+uttIum1YPEPoIRHo7nxf8BTsisa1xUIg091sn8QhnTpllxbfnyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790415996; c=relaxed/simple;
	bh=qbZBP1gJ57V18o8dvzm8EFgeMcRv49+isNR6P0elYRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iFeYpK3zBEDKKeSMwZfmLSnJK4kblk+5vOA8TD3gP24StC+yRhIPtlCiXRiGWITRuYFdVA2c7tCnWTJWZxgvFUKuaMMzccD8YLm8A+mvU46O0DWwy9lFLJjF3vPLc1V/21fwctzMdUY6AmZXONoXIl2+xZ/WyvtLEqHz65NdYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EGQN8+f1; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EGQN8+f1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Hgig6NJpn+NwgGkNkoZ8FbagxrPctBPtS8VTt+Pp1uA=;
	b=EGQN8+f1NnTPSglnZ8UVI7wpOdUbIbTdZNIG15YF+r+y2kHMTYno0wnM0Ruf8a
	H5w7BD4NdtIL+xRWDUqzODTR9CACBvm7GyDBGSsbN5ezrtn16+S7UKNx+7FYRvtx
	+tbKnaF3huEPhVbHj19Oc+ZUrberxjTC/IvpU2tffViSg=
Received: from [IPV6:2409:8a20:5636:5ef4:4cec:cc7e:6443:d467] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3X61ElLdqK5nwAw--.56086S2;
	Sat, 26 Sep 2026 17:45:40 +0800 (CST)
Message-ID: <88eb1124-8dc1-4f1f-8654-07e1535f346c@163.com>
Date: Sat, 26 Sep 2026 17:45:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk_ringbuffer: Avoid needless read of prb_desc
To: John Ogness <john.ogness@linutronix.de>, pmladek@suse.com,
 rostedt@goodmis.org, senozhatsky@chromium.org, linux-kernel@vger.kernel.org
References: <20260922062520.248439-1-wsw9603@163.com>
 <87mrt6u5cs.fsf@jogness.linutronix.de>
Content-Language: en-US
From: wangwensheng <wsw9603@163.com>
In-Reply-To: <87mrt6u5cs.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3X61ElLdqK5nwAw--.56086S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF45Wr1DWryxJry7JF1UKFg_yoW5WFy8pF
	s5KanFkF4DZ348Xr17uFyUZFnxuan7ArWrXryDX34Sv3WrtrsYgFnFqryFyF15GrWDAr17
	t3Z8Z39rAa1jvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2iiDUUUUU=
X-CM-SenderInfo: pzvzmliqt6il2tof0z/xtbC+gS+xmq3lERHjgAA3C


On 9/24/26 21:49, John Ogness wrote:
> On 2026-09-22, Wang Wensheng <wsw9603@163.com> wrote:
>> diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
>> index 85c0c854b3ce..607666d37455 100644
>> --- a/kernel/printk/printk_ringbuffer.c
>> +++ b/kernel/printk/printk_ringbuffer.c
>> @@ -443,8 +443,8 @@ static enum desc_state get_desc_state(unsigned long id,
>>    * descriptor is in an inconsistent state (miss or reserved), the caller can
>>    * only expect the descriptor's @state_var field to be valid.
>>    *
>> - * The sequence number and caller_id can be optionally retrieved. Like all
>> - * non-state_var data, they are only valid if the descriptor is in a
>> + * The sequence number, caller_id, and desc can be optionally retrieved. Like
>> + * all non-state_var data, they are only valid if the descriptor is in a
>>    * consistent state.
>>    */
> I realize you are trying to minimally update the documentation. But
> really the whole description needs to be appropriately updated. I
> suggest:
>
> /*
>   * Get the state of a specified descriptor.
>   *
>   * Optionally, a copy of the descriptor, sequence number and/or caller ID can
>   * be retrieved. However, (with the exception of @desc_out->state_var) all
>   * retrieved values are invalid if the descriptor is in an inconsistent state
>   * (miss or reserved).
>   */
>
>>   static enum desc_state desc_read(struct prb_desc_ring *desc_ring,
>> @@ -1335,7 +1335,6 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
>>   {
>>   	unsigned long prev_state_val;
>>   	enum desc_state d_state;
>> -	struct prb_desc desc;
>>   	struct prb_desc *d;
>>   	unsigned long id;
>>   	u32 cid;
>> @@ -1346,7 +1345,7 @@ static struct prb_desc *desc_reopen_last(struct prb_desc_ring *desc_ring,
>>   	 * To reduce unnecessarily reopening, first check if the descriptor
>>   	 * state and caller ID are correct.
>>   	 */
>> -	d_state = desc_read(desc_ring, id, &desc, NULL, &cid);
>> +	d_state = desc_read(desc_ring, id, NULL, NULL, &cid);
>>   	if (d_state != desc_committed || cid != caller_id)
>>   		return NULL;
>>   
>> @@ -2007,14 +2006,13 @@ u64 prb_first_seq(struct printk_ringbuffer *rb)
>>   {
>>   	struct prb_desc_ring *desc_ring = &rb->desc_ring;
>>   	enum desc_state d_state;
>> -	struct prb_desc desc;
>>   	unsigned long id;
>>   	u64 seq;
>>   
>>   	for (;;) {
>>   		id = atomic_long_read(&rb->desc_ring.tail_id); /* LMM(prb_first_seq:A) */
>>   
>> -		d_state = desc_read(desc_ring, id, &desc, &seq, NULL); /* LMM(prb_first_seq:B) */
>> +		d_state = desc_read(desc_ring, id, NULL, &seq, NULL); /* LMM(prb_first_seq:B) */
>>   
>>   		/*
>>   		 * This loop will not be infinite because the tail is
> Using my suggestion for the documentation:
>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>
Thanks for your comment. I have sent a new patch with your suggestion.

