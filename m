Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF8F2110E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056980; cv=none; b=aSXsNTh6qMqlmgB1I6tQBbzWOSsxcfFulJ/sVcgyUhMDA13quWK/Y3ohIB3ML7PRwBSNxRUwRHhwqcuah+K6c5T4+EpUwHsJmvhOrBTrr6sKURvpMjJgsjA0hs8Cacz1mlrB05iOjSWs/dK7R5MYkOyxkV8z783PshalrNMZwf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056980; c=relaxed/simple;
	bh=jx5594RU8DdFf/2v8JNAJPTO/7koTsW9e90r745CEi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOkjnVASX6EHI3hRgkNzlGHBfXXrOQ6eDfNtTEs9a1KJx0yQMj36Nvt56eq2oYbW+9/+rhsiRLlGVjefsZ55/iO6TLDDymOsBA8CTDX1faeEa2GjOH6lAnXXoMcqLCswGiUPyqDlFkw8NquxZbCgL+UJRjVdglwbyY8H6bSNP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nDA/g1JX; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nDA/g1JX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=466KslwKlfjekfOm2hS1Z/axn9i8d3Pi0sKWLtyduoM=;
	b=nDA/g1JXQ6LLUsYfOwAZIGo3KTxo5bi7gHGgEX9imfMn5Y+sgtjJ2N2moCKAHE
	ixGCABEJRm4BazsHW/yx2eQuaKCUDMUXyFTStm0du5CdE6ThvPqWupBL/WzC+ssA
	gVt3waomJ+REKi1qFRdHU/uMTTG8BSWniSVQ7gpvVNv40=
Received: from [IPV6:2409:8900:1ee3:222c:420f:a5a2:eb51:8645] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD33+jrGbJqT3E6AA--.19026S2;
	Tue, 22 Sep 2026 14:02:22 +0800 (CST)
Message-ID: <b4cc0b52-23b8-4a6a-865a-a419ebecc6d0@163.com>
Date: Tue, 22 Sep 2026 14:02:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] ntfs: persist immutable in the $LXFLAGS EA
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, chenxiaosong@chenxiaosong.com,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260920083131.1880061-1-liubaolin12138@163.com>
 <20260920083131.1880061-9-liubaolin12138@163.com>
 <CANFS6bajYthoK3asS3PmfU+9aocdsHS9ZFaUhmiKV5BfbaygeQ@mail.gmail.com>
 <250dd5e5-4a4e-4547-b205-f0b52bae4775@163.com>
 <CANFS6bbM-OpYLoRvQNAhmo-FNBd9V0K7wEt6iYTc-6cPf+2uEw@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CANFS6bbM-OpYLoRvQNAhmo-FNBd9V0K7wEt6iYTc-6cPf+2uEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33+jrGbJqT3E6AA--.19026S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy8GF13WF4UCF4xJryDAwb_yoW8XFy7pr
	95Ca1jyw4ktr1UJFs2gF40yay0y3yxCa4jqFn8Gr1qkFn0g3W7trW0yr1Fkw1kKr1xtF4U
	XayIqF1xta17uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6Q7Ik2qyGe7DEgAA3C



在 2026/9/22 13:25, Hyunchul Lee 写道:
> 2026년 9월 22일 (화) 오후 12:27, liubaolin <liubaolin12138@163.com>님이 작성:
>>
>>
>>
>> 在 2026/9/22 09:21, Hyunchul Lee 写道:
>>> Hi Baolin,
>>>
>>> 2026년 9월 20일 (일) 오후 5:32, Baolin Liu <liubaolin12138@163.com>님이 작성:
>>>>
>>>> From: Baolin Liu <liubaolin@kylinos.cn>
>>>>
>>>> Add a fileattr setter for immutable and store its state in bit 0 of a
>>>> little-endian u32 in the private $LXFLAGS EA. Reuse the standard NTFS EA
>>>> attributes and restore the flag when loading an inode, so eviction and
>>>> unmount do not discard the setting.
>>>
>>>
>>> I think that the name $LXFLAGS is not appropriate. the prefix $LX
>>> seems to be a WSL-owned namespace. The name could cause
>>> confusion or a future semantics collision with Windows WSL.
>>>
>>> Thanks,
>>> Hyunchul
>>
>> Hi Hyunchul,
>>
>>     Thanks for pointing this out. I agree that we should avoid the $LX
>> prefix to prevent confusion or a future semantics collision with WSL.
>>
>>     Would $LINUXFLAGS be an acceptable name for this private EA?
>>
>>     If you agree, I'll update the code and documentation, rerun the
>> relevant tests, including the Windows NTFS and CHKDSK compatibility
>> tests with the new name, and submit the revised patches as v4.
> 
> I agree. And others look good to me.
> Feel free to add my review tag for this patch set.
> 
> Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

Hi Hyunchul,
   Thanks for your reply. I'll add your Reviewed-by tag to the v4 series.

Thanks,
Baolin.

> 
>>
>>     I look forward to your feedback.
>>
>> Thanks,
>> Baolin.
>>
> 
> 

