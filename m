Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826674;
	b=ufZyRmZkoshiYfReGE3sM/va40wOLeFVyAUViEbgMs8DPZkapqqnl6MHNXAEZ0scnhMN
	 /QgILT0Q5WFD0w27mcKXUfKR1V3bEhHFYgIo/HKXCrWav7K9g2tBN7c5Gm6VFgv4CN52K
	 s4RdPs2wcfjHXEBq4ZBrKnbUJnGSm0NcmYkp6hNsb9e1RjN0Ga8Nbtt/pWyUU3AeElNtZ
	 0JXwqBcYtvDVnvhoDEThlv2/FRmwfWUZbzpDVXgypWcEz4Gir/suHp3gkpUiCO5r7cCkg
	 l0MjuCvToz6j3w58lcWU6FsHHN4/8jxGVaXyuzDaJ+be4WSFxYR6Gx4x0kaySn+CZmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826674;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=PAQXCyHNiBvMqb9gYcyS+GzmiyRSx/3cfzOaMWQGrk8=;
	b=BdeiEAtQMYBncpNxJfw1kvVp21bBnHu5DHNUCcMs9EA/MEmFWOPF0vGzWoYtmGTUqR4s
	 heNHCKlRC3Gw6X7azjBAAwI5UcAq6yCK9vr6U9D73mrBJbkgKJczQA1XiK0o6MEztYFTc
	 C20Y/EIq4xs4rPUvxDiL7KxyWhxyGni55BiZM3OiNA8cR0OMS9fAGCLAms8HDFqWoSta/
	 HzpQwlMMoz6E3kbGWbb4qggGq2FcApuAj4FRvHPHAf+0CHyrFykmJYmdP9gXNLqHGtVRU
	 a6nU3dMn72K98xhHZSvdtAWkwj3TNImjkgLgxjU2eShnvQGTe3WEfhclYHEYn7+vpuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vIRqBKVN;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DE606A32A;
	Mon, 16 Nov 2026 10:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8DE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=vIRqBKVN
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jSlFT52RRzMlMf;
	Mon, 16 Nov 2026 11:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794826669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAQXCyHNiBvMqb9gYcyS+GzmiyRSx/3cfzOaMWQGrk8=;
	b=vIRqBKVN9Wte3haTTNwDJIlXH9l6wUwYKa7kPbBC3GCvm0pxH6qaVzlwFsN2yYgC8EpskU
	Bssn12SApuEUC2gaDnreDfdJVDMGmsMzI4UihS7qs8e98a3IDe4PLzwhgWGxb+DiinGDaI
	S4pd0UbxH6uCxfG0LBYzEP9Nyqg8YwUaIxPxh5ZhK6zXyLKQqyuz8H20B2Yn261fzQVMv/
	C87jTL8tA0VKstg9I7UY/turFPGDqBR32m5lBRoUXqFijLXbSRG/WfnywEzl1fK+Ea4tkz
	BsDNouFFOETGURUv88R4m9I1eKQ0Hfib6VPcpMO61CE5x31t/1Wj9fkPmEenVw==
Message-ID: <49f749ff-8d34-4806-bca7-403005600c0d@mailbox.org>
Date: Mon, 16 Nov 2026 11:57:47 +0100
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
Subject: Re: [PATCH] ALSA: doc: cs35l56: Point to kernel.org firmware
 repository
To: Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
 <fd865483-1485-4042-b938-2012eaa65043@mailbox.org>
 <3b620222-ba1c-4c6c-a06b-2dd5fb391fb6@opensource.cirrus.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3b620222-ba1c-4c6c-a06b-2dd5fb391fb6@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6d7dbd08e19eb222a41
X-MBO-RS-META: 4d6c3yhsbnbdbmaq4eut5ju19wdmwcf5

On 11/16/26 11:14 AM, Richard Fitzgerald wrote:
> On 16/11/2026 9:22 am, Marek Vasut wrote:
>> On 9/14/26 5:12 AM, Marek Vasut wrote:
>>> Use the primary mirror of linux-firmware at kernel.org.
>>> No functional change.
>>>
>>> Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about 
>>> Cirrus Logic CS35L54/56/57")
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: David Rhodes <david.rhodes@cirrus.com>
>>> Cc: Jaroslav Kysela <perex@perex.cz>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>>> Cc: Takashi Iwai <tiwai@suse.com>
> ...
> 
> 
>> Is there anything left over to do with this change ?
> You should send patches To: a maintainter if you want them to merge it.
> They are not guaranteed to see it if you only CC them.

Who is the maintainer in this case ?

I used the get_maintainer.pl script which should have done the right thing.
