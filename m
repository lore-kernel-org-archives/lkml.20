Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291416;
	b=fzWoYrmJvVKfH3dXHyh0KsWScrteppyEkP+Zg47Ex5ygtH5o0NUDlnyBliyde34Zzj1N
	 U1d+W+6q80h3a6jErykC72rUOrBiv/UiRXz6WoegHkxcN3FNWwZ8ks/LbOJkWsG4cpJhe
	 h8lk5BTbDq0Lfgt+a3aAF2zZ9kMyIs3v2pN9v10x+Af7+85kjNI2Wc9KG3GcMIwxTk/kE
	 FF99+dcWZNIc7s4k51GVkA2KUdsaqxUjh7eawf7WysWIJ48WzElP/UAMltIt+lfFprXxb
	 T3eAMOReNiEQ71lmI//Ev4rkmmR5IPRmg9CZ4DCEP5PP4rmd9bLlrjnTpuGtJ248dDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291416;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=UIZDNCKJFBnLliUxyVc+tzcUJWCa2maP27Vh8koY6Tk=;
	b=5cNjlgvebuY7TKx+z17gc01MvHPDN4jOsx7+1GlfoTKO0uO5quHAQx9+GxhJ6h8YoY+m
	 jxIEhhPrJm5SWXq7DncinA7HHcHZn4fIe5JZLFw78K46Fvz8Ozy2dlBD+9HohAzrO/U/v
	 D7HrMZDLcWqiljzUOWsPUxTYTufJjIA44zXhf7WwmEchn3i63xtDkYsEML7y+efyxYjRr
	 gK/Iq04GKMzfMkY5NDz5RgUP5yOmc/IDaFU5VEW7jBdfeuIa85dOo8Mm68cQydzrfhy9c
	 Usnx4VPeBmKNbICmpTef7K0eP20g43OCElItiyHPT39ysn8DAfutEZ6Zta1oOxYH6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ih0l8f7E;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD8606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCD8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ih0l8f7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=UIZDNCKJFBnLliUxyVc+tzcUJWCa2maP27Vh8koY6Tk=;
	b=ih0l8f7ETd3bK43WgqUhi8TkM+nI6KOrPVF77BO7VXg2k2WkVOWES/b70WU6wb
	tfH0QIH8VKqQ5J3hj3uir5cz43Y3Nnkchwm7QAyAk7SzZmRup1VugdgsUUzh59NC
	yK/P5XD7Hn85nh5AGM8OYkJpdrlFFOp6Cdz5vt856QIwk=
Received: from [IPV6:2409:8900:21e7:a7e6:58ae:f310:d857:2255] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3H72ntvJqZdtqGA--.63897S2;
	Tue, 10 Nov 2026 14:16:09 +0800 (CST)
Message-ID: <c89e2306-dbf6-4e7b-ad37-3d493215c2fd@163.com>
Date: Tue, 10 Nov 2026 14:16:07 +0800
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
Subject: Re: [PATCH v5 11/31] ntfs: handle source record removal failure
 during attribute moves
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
 <20261102073532.98873-12-wangxuewen_ky@163.com>
 <avEwnT6CAgeCj2oo@hyunchul-PC02>
 <5f5302d9-729b-4008-b19e-f7012232e755@163.com>
 <CAKYAXd_qho6vncFoY=x4XVriXn8b-F7hgg=xbTTfJXH8nns5yQ@mail.gmail.com>
From: Xuewen Wang <wangxuewen_ky@163.com>
In-Reply-To: <CAKYAXd_qho6vncFoY=x4XVriXn8b-F7hgg=xbTTfJXH8nns5yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H72ntvJqZdtqGA--.63897S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWkWFyDGw48ur1DZFy7Wrg_yoW8Cw48pa
	s8Jas5Kws8try7A3Z29r4ay3W0v34xGF45Xrn8Kr129wn0qF1Iqr40qrWUuF98urn5Kw42
	qw48W39xWF4DZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j35r7UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wkvGGrytqlyBAAA3g



在 2026/11/10 12:11, Namjae Jeon 写道:
> On Tue, Nov 10, 2026 at 12:13 PM Xuewen Wang <wangxuewen_ky@163.com> wrote:
>>
>>
>>
>> 在 2026/11/9 10:31, Hyunchul Lee 写道:
>>> On Mon, Nov 02, 2026 at 03:35:12PM +0800, Xuewen Wang wrote:
>>>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>>>
>>>> ntfs_attr_record_move_to() ignores failure to remove the source attribute
>>>> after copying it. It can update the attribute-list reference and report
>>>> success with both copies present.
>>>>
>>>> Check removal before changing the list entry. On failure, attempt to
>>>> remove the destination copy, mark its record dirty and unmap it, leaving
>>>> the list pointing to the source. Report destination cleanup failure
>>>> separately.
>>>>
>>>> Shrinking a record to zero needs no extra space, so failure indicates
>>>> inconsistent record accounting. Return and report EFSCORRUPTED even if
>>>> cleanup also fails.
>>>>
>>>> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
>>>
>>> This patch has the Fixes tag, but it calls
>>> ntfs_report_file_metadata_error(), which is introduced in patch 3.
>>> If this patch is backported to a stable tree with patch 3, it could fail
>>> to build.
>>>
>> Hi Hyunchul,
>>
>> Thank you for your review. You are right about the dependency.
>>
>> Would it make sense to reorganize the series so that the bug-fix patches
>> come first and use the existing error-handling mechanisms, without
>> depending on the new reporting helpers?
> Yes. So I would like to apply error handling patches first and check
> new report helpers later.
>>
>> I would then add calls to the new helpers at those sites in a separate
>> patch at the end of the series.
> Okay.
>>
>> Would this approach work for you?
> Yes, Please do that.
> Thanks.
Hi Namjae,
Thanks for your reply. Baolin, Dandan and I will proceed with the 
changes following this plan and send out v6 as soon as possible.

Thanks,
Xuewen

