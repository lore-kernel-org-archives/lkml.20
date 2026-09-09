Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBA23FF1CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991131; cv=none; b=ESETI5Vj9C64Tc2MOd65LdRUGsj1o5M1SQckRcjTNr8HV03tDaPxfFY5d9Cnxn7z2xSfyRbU4vEGAgfJcDLNOfe3WySutD4/NbEDBdB3N9kZwmgVtjqjdJqM6HL2tETs3PJqH1PU+Xb0Yv2Nhw22bf0VxdEMraLR+LkaC28B6yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991131; c=relaxed/simple;
	bh=bN5H/bnfN/hXfaCvIn8laJn2SNDu6bOFgegh1/4kNpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1vTM2GowJvAHtafHiQyhqjhFi+BSGHUkIp4LKMGPJyM1EqENhCDza4AXv8+Qh5hVvUTva2/e62bSspEwVuP1iwWWI8jOix838+GyzYfgAQBYlsGDobDq9X70XtK1/KuDFGYZyhpjyN7zPVAX4gt605q9aONgzrKvfegfuKJQ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gtozWCOE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gtozWCOE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so63354595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788991126; x=1789595926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUcn5RpTdBwh932Fa2jQNlkfcd+2UozJ4+WuHdj3JMk=;
        b=gtozWCOE+y0ZEuU8qMf/QT6aonIFg+hxH0f2eXEHRhszgiJUZbFyhzHEghvg0panDZ
         sDLXOttdrXIpG66uAaL62meahzxJ7OdpzT6is5Ge3Fk4ZbaZaYs+VN9EdDR4cJ2rgHIA
         1WFillWUz9aYaFkDSQVoV6vUjOp96urIDTYEfzpBDsM+OhG3a5aYjLST3cc9XrMSze8T
         /477i4OHb8gqji3semwdrcSB0602HcSJrKnDvd1eDt6P5MqNSe4cFtyFNTaQxzka0DbY
         iOxfswiKHR4ZzzGC/E4T/j+VzR7NxPtCc/ILXe7xK2/Y1RCKhFcun3bpmq+lMLhgIOhN
         oenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991126; x=1789595926;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUcn5RpTdBwh932Fa2jQNlkfcd+2UozJ4+WuHdj3JMk=;
        b=sKIG3SNzK2RmF2bDCmV2TOjQ28AVXjeBFJ2nic9HJ1ADt8OqlaFoU+EtqDEGNsmgx1
         cZ2lAnx9zNUxFOfkKr6Ut4dKRj5iwAXd22PD2m38K6GEE62yANnMxi1KZQalApPDPM0w
         J2mXMKyppmmHGOAh8/0FHe0s0crmYm5a2/vBbTM4pSjGQ+cWHAsU9NWPEwg8pYSJLb7t
         YHo7IBuwn1obz9GapVy7fy3LgTBWOO6OcGhG2hiaE4VLQiW29olJxjCL7kD0Vm81E8L+
         A6f0VcPpHNyBCOd+kAc0tElbgn2i4cJmaW7myNpAI+Womu34xRiWtrb+9qOhxCs4V+Kg
         u0nA==
X-Gm-Message-State: AFuF++nYBkrZfnqVMAHA8doQ7mPIoU5vXi2ik9g+3cw7lW5yzQhxu9FP
	gVs6jqLRlx/RjEJtJhz/6RE+4iGzN318+oTAJS9hMUEaoSi+MoA6Xb0Mnux025xQdsQ=
X-Gm-Gg: AYBFou2ae37KYmZrHzTZWnS5FKAGayBuIrhoVyKw9WDtvFxzxkuREMEWZ2LqvRDCuNh
	nCRbxnMBpkw+JZK+1e3A5WR/l4MkzPvs+BiWDI3DF+HChv5mLUYe+y4llc9j/5Sw+z/VkzqZP1L
	7ZSps9G2OpnSvp5+qClSiZngxo3vpb/ojURXIbIdtIiH/cjpM/x+Izix3jvM7O6f8TDidqwlrTq
	/bS+f/ih/oM4t62jJdwWJn3+iDUpSd2BGJrjtLapt66khrRhoiCpBzR3dNWJ1QeP05MOqBX0ljE
	J+2STECarpLgZZRPXlSvKK465YOZYPsihf5mbjOVAvjkHMDlydB+f2LtpAtpYftNn+qx9mzzrnS
	kCCBEQq/E9ox0CkTEZuj6rASf6JXCxMWzYxrxBeusy74tdfvEp6QvFOJwB30fWcWYb7S6z6GDrt
	E+uQM1xL3WkoT7H+i1yiz9/coweT9Vyh5d3a4TLkznmQDoOox+TZry47056eIepbg=
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr389840825e9.15.1788991126279;
        Wed, 09 Sep 2026 14:58:46 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm40402118eec.11.2026.09.09.14.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:58:45 -0700 (PDT)
Message-ID: <9ca6e653-f89e-4ed2-8f97-783a5663f97c@suse.com>
Date: Thu, 10 Sep 2026 07:28:39 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: commit 108cc873398932af589c295f78c348513b8d70d9 breaks
 update-grub on btrfs root filesystem
To: Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>, dsterba@suse.cz,
 quwenruo.btrfs@gmx.com
Cc: linux-kernel@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>
References: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
 <20260909002506.GF9053@twin.jikos.cz>
 <7c331e23-d0ea-4611-9bed-d7099dcb41ab@gmail.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
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
In-Reply-To: <7c331e23-d0ea-4611-9bed-d7099dcb41ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/9 23:48, Hanabishi 写道:
> Hello.
> 
> May I ask why you guys keep ignoring me completely?

If you think we have time to reply every report, then just check how 
many syzbot reports are not addressed.

> This is clearly a regression for userspace (see my previous reports).

Unfortunately it's not.

The problem is there no matter if you have that patch.

There are a lot of ways to make btrfs to report a weird device path even 
before that commit.
> If your answer is "won't fix", state it explicitly please.

Won't fix.
