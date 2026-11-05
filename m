Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918601;
	b=zHt2Rxa9DL/LLocXV/MGeOPXjOmJgGPhlOPgBCwZ0fDTIqdVwZJk1ak5WBq63rI+AywO
	 omUsbg6WcrFjmFKE62OsyIV8zZHW5dDelMe1/ATeb77KU7QtgxtiFqNhOlW6pu1uh9lTA
	 IXlDD3VHjdXROy1PzRpIqYU7cEu4pOXsWzjp0ji+1jUqRadZmV8W0irWM5qVwS7/7FINm
	 5n6S2u6kKOw9QZ2tglkBPoCHUcXMYvCh+Oa3nERraCMwi1MYfYBSWUFGae4BBbF70KzMo
	 +DczSMbyxrlVlMq3V0idpyxpar9lu0jSqc+ceVp/A4nfidMT/eJSlOc8oZB3zuegqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JOpRBPshV3gRP/lPEEbp1JMlpxX4CyZP+32ZaHNPJd0=;
	b=kw2T1AO3GrRTuylo86BhVhGiLzJAIe9jCo7sFqyov/zCsL+BgMHxwpES7nbKKghUg2Bs
	 2JqjMiqVifUkCQy8coS05Pc380qvy3Gd/ZFd3qq+ebv6lY5HU8aEupv6YcJHgmCrC1KdF
	 lzOmIKkiH5JJkE6pVdgVQE1Jc3Eo9ps+LFwBBgnuLJPuB6KVIeD1Tto9SbPC4bhhpvX9l
	 yYQTc/4/cWT9IUewC/1bxFsUpMOBuY4SlkYoHvrfUQ0IMBtYJduOlG99H5iq7ahjLXzKT
	 iGlnEpyD8fbprDc2KwGX9OfvYArJC8kyawpjCpRM8I5Chyy1kTlU6V+dvKWva2JB/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TrD7Cxpu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA5606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFA5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TrD7Cxpu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso222255e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793918599; x=1794523399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOpRBPshV3gRP/lPEEbp1JMlpxX4CyZP+32ZaHNPJd0=;
        b=TrD7CxpucIFDuoAAY/Fvrj2jfILQmhNwzHdFdCRXPCKVoHUIEwuUgoot25W0qsUDDf
         jPvxuQEWGYrKZoZ1/7z+cwqm3lRJ0irRQMoAUDmFJKVlWsO5y7tL6Z6V0w0OdjVw7TCH
         WHY9G6871WNF6FJUKFYj/14I+0N4ZE2xTiuVYSDYLhzBm7O2V3X40HgC7eKL7qY2C7Tu
         igjHHtiqCol764W6FpsRczGLkJzOADgMTgTuIgG5oKVobZumKLixG2hDCUEqq92Joq3F
         TmeIpDNDkPB9ZmVaP5kZ6TLmE098EcltprL+IUs5KbTqxA8/ws84Q8cSmMRDgYCgUplC
         AHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918599; x=1794523399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOpRBPshV3gRP/lPEEbp1JMlpxX4CyZP+32ZaHNPJd0=;
        b=hEW78jR2mlpcdU0xDkumd3N2JxAfwO7C9S9AEQz27GXoWbFSLqY6JTSonl/tcBIAgz
         p0fLvN1tB4GtsX8yqCVpuICGQxn1m5wL/Ui96hh9rRnY+7lmfWVf+Z0FQDU9pnqaEi/f
         076JdL3EkOPlIO1jFBwKGLt9MwFECAP40tWH24OGVjPWqgFoDOhapqjXW+RsepuXy11L
         GqDp1wLCzsHO+Df25T6THJ6CCEU08UKsCVEJfGRvlpykZwL0VyCB4/cAAcPzzVVOLTtO
         YRcMbdv6My7jDZwcOC4XwzMrQQ/TETjivrIG/f1e2DgwEJh/5XOFgZlS3IF9GH4xldV0
         LsyQ==
X-Forwarded-Encrypted: i=1; AKwUvBze1KI7oCJ6c2+XrMXqOXwUOzRl00hJVW5DyeWnRdnUBd23n/UrYR6quyJH5TYPU+xM8wnHqLdKviPakI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yCUW7F39DlzDRwow/LFN4G1HQPaytlgD/Py3E2zx7wxftwNM0
	5czBIVig2jJ/bydBrJTqfjWCbhewkgBHFJrbfaHccqMEENahcq71/g+1gsYY6OCF1A4=
X-Gm-Gg: AYBFou3NAN9siUl2nF760EbrjGIs6YMU68KzE4zI4CFYZSUjvr2f68ZKlpvvJBiWVz/
	eWht7bj++usQm4lqvHOF5vj+TFzCPPQBRC/sPJBcrMUROays4CMYhpopqLrIVh4zKNhu21Yw23C
	MIN8fEbAD+ldTQUZvcHR3juMMqWIQonT4TJoTQwhC5lpAJzAgjmK60OjQyepAvwKAOinuECgbtO
	eSAKNlONWA0LsoUSwYSj/VDOk/pPHXZK2ME4dTC+Juib+1vnKNqQ7FU8dK2VMaeZ0NIpD8fSABW
	4x0h2qYVMG/cj339UDVu/ZEMGF0vvUYPrSWSoB69KHf74UTj7iZ96H6rYOnbD9KDBNhNzwcKeUk
	7zhq1343uSnOXOcCWvzWCJXhIoHt7Sud1ryS5TjIQsIPQOWvpip1LJ/wIh2JkffvUmMSP2OSe0d
	9Y2V+iCnyk+/EHTxISFTr6PFCdB5RYnabnHgqxdludaN3zxoV97PovFfW1rVY08GDqjdv9paHlw
	uoDFHJNGswYyauuRRrmSsog2vNffzTtZ8kcVzsaNh3FhZEtJxokXewDGE6FtmME7AEExfHooh3M
	PgBYk1JlEH2MRq8fqeTv
X-Received: by 2002:a05:600c:3f12:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4b6d82b2c91mr9773435e9.0.1793918599570;
        Thu, 05 Nov 2026 14:43:19 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8a3d9sm1005430a91.10.2026.11.05.14.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:43:18 -0800 (PST)
Message-ID: <c6d8ece0-cbb8-4479-977a-6306b1c02ae7@suse.com>
Date: Fri, 6 Nov 2026 09:13:11 +1030
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
Subject: Re: [PATCH 1/2] btrfs: overwrite a leftover balance item instead of
 BUG_ON()
To: Siddharth Mishra <smish149@asu.edu>
Cc: dsterba@suse.com, mason@kernel.org, josef@toxicpanda.com,
 fdmanana@kernel.org, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+dc9291cf132691aeb478@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20261105214738.111967-1-smish149@asu.edu>
 <20261105214738.111967-2-smish149@asu.edu>
 <4c59541a-3f19-4ad3-bef3-59b9c42c2e90@suse.com>
 <20261105224022.254528-1-smish149@asu.edu>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261105224022.254528-1-smish149@asu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/6 09:10, Siddharth Mishra 写道:
> On Fri, Nov 06, 2026 at 08:39:01AM +1030, Qu Wenruo wrote:
>>>
>>> Both assumptions can be wrong:
>>>
>>> - insert_balance_item() inserts the item, then commits the transaction.
>>>     btrfs_commit_transaction() can fail without aborting the
>>>     transaction, for example when btrfs_start_dirty_block_groups() fails
>>>     to allocate a path.
>>
>> I think no call site can handle a btrfs_commit_transaction() failure
>> without transaction abort.
>>
>> This is a way bigger problem than what you're fixing.
> 
> Are you suggesting that the right fix is to make
> btrfs_commit_transaction() abort the transaction when
> btrfs_start_dirty_block_groups() fails?

At least one should check if all btrfs_commit_transaction() callers can 
handle such error correctly.
