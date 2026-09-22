Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3416635FF58;
	Tue, 22 Sep 2026 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062400; cv=none; b=gm1aT8bL2ymb1KzC2iR+KoIlD+ZyGlpEdXmZgmlytWzDL44qDBHxYwWVfeRRNg0++9Daq8UKAqvw65YL4SuAB0GLRe22ebBdkIPtmHILwNYkmfq2cUgPyMa6qnsmzSwmxXHoEed5TocT+3nvS04MZMMyOOy68ZTEkX6eBQ+nLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062400; c=relaxed/simple;
	bh=61vq8H5wEUlSO2o9OUglIHM1SsU5H34QMbzCreHW/Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpohPwo81kKu36psEQpiRon8GRWx35Ltst3XyPsHdgu2fQLFKloxAJvGf3rm2qWhODNjcUvmXkpbBJG2r+ubsKPCFZaljbdE+HpEqykMpfhYY2fK0sPwBTOJ1mi9F7fPo/wPYJlkKb73EwCc2jCdiZFRs+PfvH2m98ANl/cHsdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=prQcRd5+; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="prQcRd5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=2s3ccr0Xt/4hsrGr/oXfiN6VUE4GGZqaw2d0V7IoXbc=;
	b=prQcRd5+ku50IN5ncoHGh/5LUFG3FaYnvhEDUar7+1fSSKa74VoVA/uUA7GDiW
	Xg5yzo4vUZ+dpRCOzqmpEf8VCQDKpM2fa57fzPHLhJEK9B6KoNNsyDgE+I5FcWx8
	9Oq2B6ZkHD+Buosaqg79PUaLSnYwUMPtMK3VRjj6ERc0c=
Message-ID: <e76a151b-4dde-4bdd-91ee-e025e9bcc994@163.com>
Date: Tue, 22 Sep 2026 15:32:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: messaging: fix leaked PM vote on tid allocation
 failure
To: Srinivas Kandagatla <srini@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20260827021409.24500-1-min_halo@163.com>
 <d885255a-c3f6-4c96-8ebb-f611ffa29418@kernel.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <d885255a-c3f6-4c96-8ebb-f611ffa29418@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H9IlL7Jqq1tMAA--.33768S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF18XFy7CryfWFy5ZF1kZrb_yoW8ur1rpF
	45X3W2yFsYqry2vFnF9rWvqFy3Za9a93yDGa18t3W3Zw15J3Z2qrW8KryYyFWqyr1xCw1q
	qFn8Wa40yFn8uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UciSLUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9AYcx2qyLyYe5wAA3B


在 2026/9/18 06:10, Srinivas Kandagatla 写道:
>
> On 8/27/26 3:14 AM, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> In slim_do_transfer(), when a transaction needs a tid and
>> slim_alloc_txn_tid() fails, the function returns directly instead of
>> jumping to slim_xfer_err. The runtime PM vote taken earlier with
>> pm_runtime_get_sync() is then never released, leaving the controller
>> permanently powered up.
>>
>> As txn->tid is still 0 at that point, jumping to slim_xfer_err drops
>> the vote exactly like it is done for other failed transactions.
>>
Hi Srinivas,
Thanks for the review.
> Patch itself looks fine, was this bug hit on real hardware or is this
> generated from some AI.
Found during code review while porting patches, not on real hardware.
The trigger requires an exhausted tid space, which is unlikely to occur
naturally.
>
> How are you testing this patch?
Tested in a VM with a stub controller that exhausts the tid space
(255 allocations, SLIM_MAX_TIDS is 256) and then issues a need_tid
transfer, so slim_alloc_txn_tid() fails with -ENOSPC inside
slim_do_transfer():
   unpatched: slim_do_transfer() returns -ENOSPC, usage_count stays 1,
              device never suspends
   patched:   same return value, usage_count 0, device autosuspends
>
>> Fixes: d3062a2109309 ("slimbus: messaging: add slim_alloc/free_txn_tid()")
> Missing CC stable
Will add in v2, thanks.
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>>   drivers/slimbus/messaging.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
>> index e2dbe4a..ee127ef 100644
>> --- a/drivers/slimbus/messaging.c
>> +++ b/drivers/slimbus/messaging.c
>> @@ -139,7 +139,7 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
>>   	if (need_tid) {
>>   		ret = slim_alloc_txn_tid(ctrl, txn);
>>   		if (ret)
>> -			return ret;
>> +			goto slim_xfer_err;
>>   
>>   		if (!txn->msg->comp)
>>   			txn->comp = &done;

