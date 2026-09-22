Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C054A6899
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068673; cv=none; b=NyZ/s72azEr7xzFuuDeMHRINA1N1ynarm6BdhW49L4mlWh4U1uShACN4GWfbDPu7UGd+lCBrRa75/ZxnW0PSwHdNrRo7NxChX5oZl6B1a+z46YelDg8MquWfTePary4wCImFPN6AsGcmKObMcwwsfxDf8jNpGe0NMxCvC9LnMiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068673; c=relaxed/simple;
	bh=Ia5xDGn1GAA3dcvEKplBlnzSHuaVMwkNOspFLaRIyQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gELLtpfkWAxUusaDfvbouKTzYsAcYRDepELK365wVZgfJrE8Vsx6m7VvLSoEqrpmNyXbbOEJvdiP/UUCVDIXgn8O9UHR/EhhIOVASWun8v6c6ZjtymP5oXsE9ubU9xAs1mVJgGpPeOBDN4k8yPkdQ9PQcBbJA7ta4yS+YjabogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 76e55c50b66611f19a56ed5b684f684d-20260922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:164e3783-61a7-432b-9d3e-f6e8f93b30e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:c7cd13947dba08b0df43fff87423ee55,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|52|99,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76e55c50b66611f19a56ed5b684f684d-20260922
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1998537118; Tue, 22 Sep 2026 17:17:42 +0800
Message-ID: <374a9258-48cd-489c-a652-251863eba680@kylinos.cn>
Date: Tue, 22 Sep 2026 17:17:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] comedi: dt2811: fix shift-out-of-bounds in IRQ check
To: Ian Abbott <abbotti@mev.co.uk>, hsweeten@visionengravers.com,
 linux-kernel@vger.kernel.org,
 syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com
References: <6ab21240.e548f532.1ca396.0018.GAE@google.com>
 <02c46315293a26169d2a3862a2047959a1651ef4.1790061387.git.xiaopei01@kylinos.cn>
 <82ccb90f-4d0f-44a9-ba3f-11c391cd4bca@mev.co.uk>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <82ccb90f-4d0f-44a9-ba3f-11c391cd4bca@mev.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/22 17:11, Ian Abbott 写道:
> On 2026-09-22 08:16, Pei Xiao wrote:
>> The IRQ number passed via comedi_devconfig->options[1] is a signed int
>> that comes from userspace.  The check `it->options[1] <= 7` does not
>> reject negative values, so a negative IRQ number reaches
>> `BIT(it->options[1])`, which is undefined behavior and triggers a UBSAN
>> shift-out-of-bounds warning:
>>
>>    UBSAN: shift-out-of-bounds in drivers/comedi/drivers/dt2811.c:570:31
>>    shift exponent -251 is negative
>>
>> Add an explicit lower bound check (`it->options[1] >= 0`) so that only
>> valid IRQ numbers 0..7 are accepted before the shift.
>>
>> Fixes: f2975a9b2ab9 ("staging: comedi: dt2811: add async command
>> support for AI subdevice")
>> Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/
>> all/6ab21240.e548f532.1ca396.0018.GAE@google.com/#R
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/comedi/drivers/dt2811.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/comedi/drivers/dt2811.c b/drivers/comedi/drivers/
>> dt2811.c
>> index 0438b8c90e44..53cb17993ae7 100644
>> --- a/drivers/comedi/drivers/dt2811.c
>> +++ b/drivers/comedi/drivers/dt2811.c
>> @@ -567,7 +567,7 @@ static int dt2811_attach(struct comedi_device
>> *dev, struct comedi_devconfig *it)
>>       dt2811_reset(dev);
>>         /* IRQ's 2,3,5,7 are valid for async command support */
>> -    if (it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
>> +    if (it->options[1] >= 0 && it->options[1] <= 7 && (BIT(it-
>> >options[1]) & 0xac)) {
>>           ret = request_irq(it->options[1], dt2811_interrupt, 0,
>>                     dev->board_name, dev);
>>           if (ret == 0)
> 
> Looks good, thanks!
> 
> Please could you resend and Cc: Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> ?  Thanks!
ok. Thanks!

Pei.>

