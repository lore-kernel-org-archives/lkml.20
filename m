Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082003;
	b=PyF5N8+bak/CcYrVTLUuXXJE9t/dYQDn20485x1nYCawy21dc4o7vxUrgil7xlk3JPw+
	 0uEEwYCQdSjSdZE4XYUX3HHt4Y6JrVGR9ltylTJtkWMhkRLovRvbOWfNMaHeL++ixsnYf
	 zM0Hi7parxMCKXQ2KjAzF6vjU7oEpF2LsVYKwXynY8wur8KbdIjux2OcsMajh09P7ryt/
	 JjV4mPzyvTMPN76ApVipiWhpAnJiDHDvJDel6jBmyKTZ85jz2UBvoatqGfcJrrW8VebYB
	 U03jUhOAfdQWbJQPhQ3ccCNvzp3bjn5WdvttpA7W6dhbIJTtVhrqbKlxuhXIqRNJViQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082003;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=NsW9lqP6rABMoATa428JGCgkGiH4+5hriuKAYji82aA=;
	b=IU/MYosYRJiEspjeHV6+shZnea6w/PWB3NP7sAEE9Dem3EMLptEM6D+gyMAJXoVheIH8
	 AvMs6DlwDUUKsH2yXRGL7AJwxUeforeAwnN9grqEN+4FhhP+GwI1qh1NLwgOoQYqhpiZT
	 mrfZ5raxLDgeQtjMg6X1D6tkVx/RdvG36mWpiXVn9YTx1Iak80hwNAlQaUI1Wo7bWcLB5
	 2tZxiKYRtC0/ivsX9x/wSJEYhKGKB/c805hdz+FZ1mVKbNPLxOmjuYNxkdcdWvz1UBYGn
	 MwWYDXeF/9k12oIFZ4E2OyPgbEfBskrOKdN6n4GBcmzBM/wWFHF25uLBPr+j2xUWlGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DigoBkXs;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C1606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F21C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DigoBkXs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=NsW9lqP6rABMoATa428JGCgkGiH4+5hriuKAYji82aA=;
	b=DigoBkXsNqAKLX3yBrfwVo+oigu/g0PhI7nZ7zmgzj8H4D+ovzSbBX07WLfqrU
	ubmyJygVIdn9IEVtoINC5snWE3oNMEM4+R93F5dvXKr2KRQ4lC4syhSL3Ty1zAZO
	GGPsdVZEcq4HhC1LhtK8DGSu2OsjaMJk2K2KpPN7r+CdI=
Message-ID: <02ba24ee-7428-4729-83ee-357e05c84233@163.com>
Date: Tue, 27 Oct 2026 14:19:38 +0800
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
Subject: Re: [PATCH v4 06/31] ntfs: report required system file and volume
 metadata errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-7-liubaolin12138@163.com>
 <auA7imuJoZKDGzpa@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA7imuJoZKDGzpa@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f4l7QuBqJbJeDQ--.37379S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFy5Jry5ury3WF4kJr18Zrb_yoWfWFc_Zw
	1j93Z7Kay8WrWUZ3ZxXF9IyrsrA3Z7Ar1rGr4vya9IkryktwsrCFs7Jwn3XFZ3WasFgF1j
	yFnFvr1ava15ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj0Jm5UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RuBTGrgQns6pAAA3S



在 2026/10/27 13:50, Hyunchul Lee 写道:
>> @@ -1685,23 +1718,29 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
>>   	size_t i;
>>   	int err;
>>   
>> -	base_ino = ntfs_iget(sb, FILE_BadClus);
>> +	base_ino = ntfs_system_iget(vol, FILE_BadClus);
>>   	if (IS_ERR(base_ino))
>>   		return PTR_ERR(base_ino);
>>   	if (!S_ISREG(base_ino->i_mode)) {
>> -		err = -EIO;
>> +		err = -EFSCORRUPTED;
>> +		ntfs_report_metadata_error(vol, -EFSCORRUPTED);
> 
> ntfs_report_*_metadata_error() calls seem to be repeated across serveral
> functions. Would it be possible to move and call them right before
> returing from the fucntion? Also, could you apply the same change to the
> other patches as well?

Hi Hyunchul,
    Agreed. In v5, I'll consolidate repeated reporting at common error 
exits where appropriate, including in the other patches.

Thanks,
Baolin.

> 
>>   		goto iput_base;
>>   	}

