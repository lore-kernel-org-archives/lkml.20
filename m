Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8247550E59B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678511; cv=none; b=WkLJFam9V18beIO2fPTIeJuE5qrVJwM3rBLkw/owb0rAS2s+OfHTBhqMmg+KQm5WUWBnLPMVluiZXcmzOxu3qLQd6PLeuAFmnvZchOK0qIVFv4U4o3fdjggcSBO1VEFhpN+zvKO4dwifEaoGBZtnqBH6As5u/f3gon6XfKVqYBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678511; c=relaxed/simple;
	bh=+IPWKLg+DJLSOksMfcN8eXj+aaoCqFvsn2axTVePn/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLXRJGwUMe3Ry4eAV7xlJIHQHBFjUonCo7dgaGc1mUzjozHQAWMMh9/la5B31Pus1n9GIR2bxwd/zjXqcznnism7+jNZ6ZqFyAFndNR9w2xyXaaECwrdlDolPfD62YxBK+QWaup1vZYmnh9ikUQoD7vjPTx0YAnitReJLXBU5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cF4tLbvD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cF4tLbvD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so30272775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790678504; x=1791283304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXF1aROcj7kDiFrujHzYLBeqkfAI0zVzapB6FlF6M/I=;
        b=cF4tLbvDnE6audnG/rLesYG+YZuW/MmOzmkv5HVGeI2/tsvRR0nyhyQpZipGbHyowP
         vWEVA7CsW3h/diXdMVgn2taXFdeLkOBrZrL5vaPsdusilkVR+x9BMWhJMyX3n4vTUidZ
         oByF9Clir7CU8q0D+4QidWi80ZizNvQpw4BRE7bFx4q0jT6Z3jpBkLl0mNmujmktqgeH
         3FxWFgjvCrQN9eV/RPiwvb9xMt1cgyMZr7N06OAOm0D+A/+D0pYCXBO2UqXJH1VjtSHu
         gvv2QSOGMLa8kk9x5t71n9ubID5FT6yE6cLu8EH0Q8q5TN8COZ/4dznTkpmGTpjnJSXD
         HTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790678504; x=1791283304;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXF1aROcj7kDiFrujHzYLBeqkfAI0zVzapB6FlF6M/I=;
        b=gx9AyYrkBD0FbCoZvDREFUFVrmpw5AGFa2ZdVzGFVzMo3C+7TZrbl3T2T+r5T5BylA
         2APnf0yFgKOHkTkX5kxXTkEkJqZYgU+QzkD0chiVU9a00+DfpVQXehWJgh7HQyg9p4AV
         B20sGVg5qBmG20yeDOPR3xB9EioYRralDokgDPepHn5evSb82eHUGDifgoS1YDiGanHi
         9URTPSuk8T6cXFb1S6nO8KUJgrUKpcPONAeLCm89iHBGQPOMCb1EqtdoSZbNPtMTEOBJ
         Ktsj5rxPcUUH4ZQsyLv28dFu2QltfQxOSZk3189t6+QHOAEgZmXB/KOdN9MyWOMsgo4j
         wzUw==
X-Forwarded-Encrypted: i=1; AKwUvBzwZfgUzmO7HSXxtRZw82lzCsaBcgNfodTp+rP+oS7w22nNkivSVD/fbyY3nS86WWR6DrdAyMZom8QT21Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l5BV8cuFs/pBM2lQVspoOv+uHGeO8y5DW6r1j72wVbyG/szuf2
	iyLyl8JeUeyIXZ1iJvLFbMNijUxcerPOgMO8JHhhl9lr+PhLSRMkctJpe7XnSGqrD0VkZWobEQ3
	xEyo1SwTJBA==
X-Gm-Gg: AYBFou3wu8FaAUxCZjb/54q6BXflS3E4waGjP2yJB21YKMUzfqqpHnG/xjgwA38tzWV
	mA2jTzzu67EBd3w8n+4IRW/vPXFzbagrS2v7lDC4RRYWxp0+IECglm94+5lpHglbwlXRMwf0H2L
	Z872jjqK2ottCSRJzohiW8ry6GqKHl/IE6HrY5wEvwbwH4Ohz5dh1ICkXX7AWr2K4mI1QOjiKOy
	rG3ipuY1dSCDYulgpvK+yBDNY42PdrpAVWwnUQtgWiZR5PGMD9NXi7k98EQYuL92wgDu5syxVxC
	dFmWZ7WOqY+b+gn72VFUP67wqoOZ0eD0fbhDJFn1UxBHbq0NeAtD2r69H7PumdkvIu6oRT54tmq
	gtibi3WEnILQOICEvtL+Gs63rNJkKqNLb3A01qLazg05rkAPh/Mk/1yrQ2IiQaOnLRX8GGLZtlQ
	BINt88TrkkLL5vAg7EBxQWSUmLM89E2gMHjIaoVql6DY4pgYoFqILLpsEsknFoLQ==
X-Received: by 2002:a05:600c:4f42:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fe66f5ddemr347877955e9.22.1790678504326;
        Tue, 29 Sep 2026 03:41:44 -0700 (PDT)
Received: from [10.86.128.19] ([149.22.87.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm4897223a91.13.2026.09.29.03.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:41:43 -0700 (PDT)
Message-ID: <f384b1f7-dd03-40f0-9238-95216b5fae41@suse.com>
Date: Tue, 29 Sep 2026 20:11:39 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] btrfs: degraded RAID6 preallocated writes return EIO from
 fdatasync
To: Bartosz Fenski <bartosz@fenski.pl>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Mason <mason@kernel.org>
References: <a72409af-45ef-45df-9970-2e38bcb22ea6@fenski.pl>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJqqw0NBQkUl/JeAAoJEMI9kfOh
 Jf6o/xYH/3AaWnGSq58XnY/T3/YYjr6g+TUZxa7MPyiYTELNpNlvmNlbtbAL0nW0LNvkeiqf
 SmYA+xkwY4RbxnZYQK0H5iv2w1eqa9qqFZb4bIBRmTapu26GEEkpad0W0ZhoSPMO8bV2Bwkf
 YdtPZQLaeUKvHZqNqBKnmtRLQj2Cgy3kuXX3bEGvWjzUOxPUSCj/S++JWBewMdMBPT62vZM0
 3156gfn5mHA94s2p+NFJoWkERY+JPTMu9NISkpD7yuGhXN88qd/aqD0RrlhxvKsrQogdPwn9
 vP18FGG3CRlHtOvOLVoY5NKSOWTDc+o+8t2XEETFTGbKYTcqeTzi4SxhvBLtTinOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <a72409af-45ef-45df-9970-2e38bcb22ea6@fenski.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/29 20:04, Bartosz Fenski 写道:
> Hello,
> 
> A fresh four-device Btrfs RAID6 filesystem returns EIO from fdatasync()
> when writing to a file preallocated by fio after one device is removed.
> 
> The filesystem is clean before the device is removed, one missing device
> is within RAID6 tolerance, and all surviving-device error counters remain
> zero.
> 
> I reproduced this twice on unmodified upstream Linux v7.3-rc5. Both
> runs failed after exactly the same number of writes and at the same
> fdatasync offset. Disabling fio's preallocation makes the same workload
> complete successfully.

I'll take a look.

[...]
> A guard similar to the following before accessing csum_buf may be needed:
> 
>    if (!test_bit(rbio_sector_index(rbio, stripe_nr, sector_nr),
>                  rbio->csum_bitmap))
>            return 0;

It's already there, check verify_bio_data_sectors().

Anyway I'll try to reproduce and debug it here.

Thanks for the report,
Qu

> 
> The relevant checksum verification was introduced by commit:
> 
>    7a3150723061 ("btrfs: raid56: do data csum verification during RMW 
> cycle")
> 
> Current Btrfs for-next still appears to lack the per-sector bitmap check.
> 
> I searched the linux-btrfs archive and did not find an existing report
> with this combination of a clean filesystem, one missing RAID6 member,
> preallocated extents, and sync-time EIO.
> 
> I can test a proposed patch on the same v7.3-rc5 VM.
> 
> Regards,
> Bartosz Fenski

