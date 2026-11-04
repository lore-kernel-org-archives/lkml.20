Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784820;
	b=jkc6ueIigIU05OUZIQnPlvZ82r8Tyi7EnTzlEKqxoDxcE0yXU6DDAmEkL/8MND6kX0jc
	 Ve5+44+G2Jt8IUcDFhLqdTEzFIdFK2rsSyPl91yVC+bFQGsNmSnwc+iCgsxA/245nkV1P
	 ahNlM7/mI24Xc5aowZRYxsmDURx70l8IcsUh+d1h+ct0qjPiJXIhBRkwTMDsu9s4JxFBJ
	 xjE3M9nhe3ftINigsW3dEsk0qG1AEIUCYdTQcwF0HpeuwgmkFFYzxb35QAWXIYoSE6AmV
	 9Sf0fC2pJmVsJ7bylqa9NIRAyAipbE1DLtNzd0aBTo2FGykQcXMpCV7JQSp2unOKAeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784820;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=+9cDYXx0ggftXxc5g0vmsXvGR5C4OLG8lrN8nFMbIqw=;
	b=dy4GXJXsXWoJZkhbN/Q57l2z5Ddjo1Mv2SdkF/K2COXDolpAZie6r5bCYPc1YGbz4wR0
	 JO1fHhYS5VX1cy72o6HTZYS3/voLy77nqP8od0Qa0LfOYWIvJr+GtyTLd1WxnskXzZnL1
	 gz5ejOGUSFcKxEz8N6NsqlpAMeSgf8lvG7HimBw3brJFfhCWOizaKgy4jqXQTxd6hmWbY
	 jKyq+9GJU322+JtCaibVEkixPTfPK9rxWWXcKARgePa8OBJ560M56ouKPR5EzciTK+gC4
	 lywAphrCIL8LAqbiRdHtkmtNYkVSMClG3MP9GsA8vdL/h016p8jcN2Ybdf5G5HPoNJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ClQ9gyWl;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC21606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC21606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ClQ9gyWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=+9cDYXx0ggftXxc5g0vmsXvGR5C4OLG8lrN8nFMbIqw=;
	b=ClQ9gyWl1twOpBCN2mY580tl+JXv5jEoBuhP8uKZlT+i4lH91i4OyEqtZlitmT
	Z2pTFhPOOo5G+u/dfr1yWdHWdaiOze0nk3a2HTgOdY4O5uUtbqM51lxZJrfi70yT
	5pBo57yBFOw5jT3KOkhnHpsEoSqk7N/WprjEwoThU4xTg=
Received: from [IPV6:2409:8900:1ec1:a6a9:a9ca:f9ce:1857:1c64] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3_MvJ++pqogRYEw--.3057S2;
	Wed, 04 Nov 2026 17:32:59 +0800 (CST)
Message-ID: <df161e1a-7d41-4b53-875e-5c47b7b51193@163.com>
Date: Wed, 4 Nov 2026 17:32:56 +0800
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
Subject: Re: [PATCH v2 4/5] ntfs: write unlinked file attributes before
 dropping their cache
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261031052857.1542936-1-liubaolin12138@163.com>
 <20261031052857.1542936-5-liubaolin12138@163.com>
 <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd-ec8ve6HD5eBJik-LF4PUhZjV7y0c52E2xpALLFA=j2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3_MvJ++pqogRYEw--.3057S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWkuFWUJw1xKF4rJF4fXwb_yoW8JFWxpa
	yrC3srKr4DtrWIga92va15Ww1F9FWxGrW5XrykJrsrA3s5XFnrtFy3t340y3Z3tr95u3yU
	XF409347AFZ0vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U24iUUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QuGUWrq+8ueAAAA3b



在 2026/11/4 17:06, Namjae Jeon 写道:
>> @@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>>
>>          WARN_ON(!NInoAttr(ni));
>>
>> +       /*
>> +        * Attribute inodes of an unlinked file have no links either and are
>> +        * evicted at the final iput(). Do not leave their data in dirty pages
>> +        * that eviction would discard while the base file is still open.
>> +        */
>> +       if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
>> +               sync = true;
> This misses data dirtied by ntfs_attr_make_non_resident(). For
> example, with 1 KiB MFT records, create an O_TMPFILE, nearly fill
> its MFT record with a resident EA, then write 4 KiB to the file.
> Growing $DATA can force ntfs_resident_attr_resize() to convert
> SECURITY_DESCRIPTOR to nonresident form to make room. the conversion
> only dirties the folio. With patch 5, the subsequent
> iput(tvi) can evict the zero-link attribute inode and discard the SD
> contents before writeback. If the file is later linked with linkat(),
> it can retain invalid SD data after close. Please also ensure that the
> converted data is written back before dropping the last
> attribute-inode reference.
> 
> Thanks!

Hi Namjae,
    Thank you for the review. I will fix this issue and send v3 soon.

Thanks,
Baolin.

