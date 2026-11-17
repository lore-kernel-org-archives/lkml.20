Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935109;
	b=4oAg6yq+6G7OgyaAFRH1sqsRR5MUHk740C6fJaZpl9iRGKn6dlv2qbF2zsuMkarVhFYZ
	 KK0Wk7P26/XLQ0PtZIacrbV5IkSeOw5p9xNuC0cRhU1wOZ9p6cNG5c/b7r0fUE/GF1xJ9
	 tKc3xK46gJHly+nxlm/FmF6DapzHrkRZaG3sXc+YdOOjYDZsD50jajT+v4LTHBUeZ3FCo
	 T+/iJigJhASkzGoX4dx+26OGCJs0pHa1V+F0hvtgKoXUNKth2/zP68XK9ho/ymzSW0NeT
	 HwyQwDz8QuyEKE8ZHkBsiOINQ+3NKB45ibgTepCodPPPOq284uc7R5qA/A3FZmtIiIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935109;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IgSfmjRvElYgS1v2If1iwOg2khkkKcERfOtMlkYFEvk=;
	b=ibq/iVEWTLKM+KhowShgIT3KYwkBIVc+J0ynK00GWFYeSaWi5X1lZAuK8/nu15R9F8ZF
	 OOOdtNhsCzJun0NtCWw2AVmRmLMF2LgB9Hyh0RtYaHkoG+3+fsr20wi6aBroSewRsl1JF
	 KKPWB37NcvGdfLQbUWhoa2KqzvjW6QCA6vKDT7LjjcK2YIp0TYMDIfwCegMk9wY6xskoI
	 cen9vzdC30ueKj+IbzMoth4bxOjtQ/Yfs6HLyMY4++U10vRM5UuPJtYxiAHdfl7urLv8J
	 dn5zua0hIXj0RPY9yY2J0zi0/JjC2a0N/7VfDBOwXqmuvozi07/cAQgEVqjdwLFZoPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0PPPCaf;
	arc=none smtp.remote-ip=91.218.175.231
Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF27606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0PPPCaf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z10DEt4AtN+H4S0e6QEnmvBaJMMsV6ob/aZjp4c4RUU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794935107; v=1; x=1795539907;
 b=a0PPPCaf1tU3iXqr65KX9RoDiL5BtxDzeQ7+uqJHu/PLs68xUyMssGvxrL1oVCSZaKq2a04O
 4wbaw5MwvBGOZq3m6rfzB31I3+txkCA3YpoE5kpcTfW5fT4Zps2S7ndzDm2ZnWJkS62z+JRmSXH
 0JhE/rkyuVLMcedUeCNp75gM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a5e8067aca7a2f81;
	Tue, 17 Nov 2026 17:05:06 +0000
X-Mizu-Trace-ID: a5e8067aca7a2f81
X-Migadu-Flow: FLOW_OUT
Message-ID: <41664890-337a-402e-895f-376c941d83f2@linux.dev>
Date: Tue, 17 Nov 2026 09:05:03 -0800
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
Subject: Re: [PATCH v3 0/3] lib: Add software mul/div helpers and use them
 from nios2
To: Dinh Nguyen <dinguyen@kernel.org>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
 <69073cae-ced9-407d-ba96-e55fc7635735@kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <69073cae-ced9-407d-ba96-e55fc7635735@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 5:19 AM, Dinh Nguyen wrote:
> On 11/10/26 09:58, Simon Schuster wrote:
>> Recently, there have been linking failures on nios2 regarding libgcc
>> symbols that we reexport to modules (in particular __mulsi3 [0], and
>> __divsi3_table [1]).
>>
>> In the resulting discussion, Arnd suggested [2] dropping the libgcc
>> dependency altogether, as -- while specific functions might be fine --
>> libgcc does not expect to run in a kernel-like freestanding environment.
>>
>> To this end, Dinh Nguyen was kind enough to locate and extract
>> GPLv2-compliant versions of the software mul/div/mod functions required
>> by nios2 gcc and integrate them into the kernel. As Arnd also suggested
>> [3] that these might be helpful to other smaller architectures (such as
>> arc or openrisc), I've further extracted them to lib/ with corresponding
>> CONFIG_GENERIC_LIB_* options that allow selectively enabling and
>> exporting these as required.
>>
>> The patch series compiles mostly^4 fine in a nios2 allyesconfig
>> without modpost errors; a quick boot test on a regular build also
>> completed successfully.
>>
>> Best regards,
>> Simon
>>
>> 0: https://lore.kernel.org/lkml/20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de/
>> 1: https://lore.kernel.org/lkml/20261026234452.1086974-1-sashal@kernel.org/
>> 2: https://lore.kernel.org/lkml/686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com/
>> 3: https://lore.kernel.org/lkml/426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com/
>> 4: There seems to be an unrelated issue in linux-next regarding
>>      CONFIG_PNFS_BLOCK. Furthermore -Wno-attribute-alias
>>      -Wno-missing-prototypes -Wno-missing-declarations and
>>      -Wno-unused-function were required due to unrelated Werror-related
>>      compilation issues; but as this series concerns compiler intrinsics
>>      that are never explicitly referenced in code and it links fine this
>>      seems acceptable to me.
>>
>> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
>> ---
>> Changes in v3:
>> - Switch __udivsi3 and __umodsi3 signature from s32 to u32 as requested
>>     by Vineet Gupta in <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
>> - Link to v2: https://lore.kernel.org/r/20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com
>>
>> Changes in v2:
>> - Reorganised to directly add to lib/* skipping arch/nios2/lib/math.c
>> - Dropped __gcc_bcmp as it is not actually needed
>> - Link to v1: https://lore.kernel.org/r/20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com
>>
>> ---
> If there are no further comments on this patchset, I can pull it in?
>
> Thanks,
> Dinh

Sorry got busy. I will test this for ARC tonight. Also can this go via 
Arnd's tree - I can post a followup for ARC which uses P1 so everything 
can go together. Or he can a stable tag or branch of yours, whatever works.

Thx,
-Vineet
