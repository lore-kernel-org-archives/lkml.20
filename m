Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7103612DB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643652; cv=none; b=YoySqLoowWTS9Z0asJQ9uNXKtmxjvK/rPkgm8g3ydjMTm92nkM9gD8FxMicZ5cLmPy6QZAaiYun5eWiQcbGyZmqPTW9oTrCq9ohtIf4xvOTklPM9qQ7kUkeDaGdLpZd1w0KWAQInNCllmSd2cbOjTWnYOq41MmN8JO2XUo+2Ftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643652; c=relaxed/simple;
	bh=FO3o5BCighQiCbxJ8+dfAr9/rQ5WaT6s012SjgK1LmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hX/lDux1+FvhDAy+fSUH8AxnXA4zwmWnLhQeZonypc2pcMKE9BrTuL3XSyYxiItbrQeafH4tAPIEIE7i2igikgUa/U4zFoTsMBF0jgErQmKGHYQXphUq/gjY5O+qzX4rypwTDIIVdPk6056yx6/2SGwcXJID2hwkSpV++Y/ubDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NJ6rj8Iy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NJ6rj8Iy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so27460795e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790643648; x=1791248448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DecC3y1le92eU3qXIyUFQY40lnmAEPCsh4lD8Wws2cg=;
        b=NJ6rj8IyhBm3F1rOiwW5OVcZdO0QER8Kk0J0JSHzAQd92hzi499FLQDqsdO3+MDtSZ
         G+4buNdzIbjCAGmAaNFJrAQe3n6uVDJy5cVmYzFU8WyMn/OXkCX3TILU8+Z/DcBcqfCG
         tDDie1sBfM+O/Ig1Ch3BatXhllncMBExTvjEpcZjl0WqbDoYR4Z+vjtv3UZ1/PL0plgP
         N/xXAZn8cAHA8ftrFMv5eAX677/dzWCXXS/78BAYrUH6fOg8p6tJ+29k4g1ArBN9ogO0
         MmNZlM53c/OPEQFiptM5FOVoWYOKzC6FFwvO8pBsvKakFGmQw9URjUXj6ksJGjEYPw8f
         0/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643648; x=1791248448;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DecC3y1le92eU3qXIyUFQY40lnmAEPCsh4lD8Wws2cg=;
        b=EINvq7WYLnxxMDVDF00toyHMhJQbnXB4Oqtx99JI5zn3XTdLHpmSdv3ycBIHuv6Yoa
         9InByutb/Rh8ccWFkOR7pRFtdW8JnbuSsf91ZWCU0LogxyOuUgqhvkk7Tx6RGqr0kOT0
         7/fc4dogtkwy0CoFN1TF/b/IS4YAAZmkTYJE8MlfWhtcqXahOxjZRaBtHs3jZY2BgEnY
         QjCEWS6pghKSMnq/9iX5zdm5fd4LMa76Ut3zW2nyIf2JceV8P93nWgk1lYnNX726Mtsi
         MrDq3QRoRgko6ICx7xr20gfBbBFazttsbBdMja79sFp2fHvk10A65uddQNksimOS3OjK
         +pTg==
X-Forwarded-Encrypted: i=1; AKwUvBznrZsDIVoBybEC/5GEEaGfHv3JHrBWKabY2j2OWKjvnFYdSaUaGGsOk370X/X+wmKrMtGCW0c3yskJOog=@vger.kernel.org
X-Gm-Message-State: AFuF++lspIOK3OFw36pZFRtj1jEzzdVbJZZ32rGeNCZUapc73BKDlLqc
	zt8L3/EVlDtzUl5cosKJSI0/wWlC3MEbuiuDIAmx5CnRqDG9Ve4gHESLoKEE5D/bL1I=
X-Gm-Gg: AYBFou3/9m1vYNRABo6kcvorf93H5MMBxTCcd1kyVnoCkVXHDvdylUoJZa/1PwMpL22
	o8lNLAHNnQu0jzQBZfyNMdEaIppH/BUPoKDJKbL54YkSI+8XbeP0WJeBXjQRQQT7qO1XGh+YgqO
	gSZyaM7E3lXBg8QuJaOkx0qCFDfmHUNGpQ+MqR2ZRdlFSmmq9VO6y725mxf8n7k+zyt5VWCHuWQ
	ofpmBLQlNOL+Osi8JQinFM/tOk4wa919CLAOWPMQsMfaWcOzv20tmHI7PpbL0UXxZEdqFFP7sFG
	sj3FCFY9Pg1BQp2uf4adtFe8gFh2tQKwxWQeVRjjA7BdSJtX/M1dKk+PKVvMApRbfsE4CEs11L6
	eMacpCbSPl6kb/qUi16FMDYZ1W+u3VwJC6+Nz2kHFgXoiJnrcxEaGKUNDjoi7vtCZp/kqiBm39Z
	ld1ato1RlyH8OsRVBEOTXjSPVLqGl/EoIedHZABaMkOh9AVIw2uCGRPDLEbA+ogcOfISvf5Qkys
	A==
X-Received: by 2002:a05:600c:c114:b0:49f:fe79:62f1 with SMTP id 5b1f17b1804b1-49ffe79648fmr109332965e9.27.1790643648611;
        Mon, 28 Sep 2026 18:00:48 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497e942eesm2562677a91.4.2026.09.28.18.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 18:00:47 -0700 (PDT)
Message-ID: <b42cf37d-0fca-4d69-888d-008a6b0c43fc@suse.com>
Date: Tue, 29 Sep 2026 10:30:37 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Write in do_split
To: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>,
 adilger.kernel@dilger.ca, boris@bur.io, dsterba@suse.com, dsterba@suse.cz,
 fdmanana@suse.com, jack@suse.cz, libaokun@linux.alibaba.com,
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 ojaswin@linux.ibm.com, ritesh.list@gmail.com,
 syzkaller-bugs@googlegroups.com, tytso@mit.edu, yi.zhang@huawei.com
References: <6abb0702.80e1c6cc.1e8e5f.0075.GAE@google.com>
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
In-Reply-To: <6abb0702.80e1c6cc.1e8e5f.0075.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/29 10:02, syzbot 写道:
> syzbot has bisected this issue to:
> 
> commit 3f757b56f1c4579fe32b810bce1d39f202964412
> Author: Filipe Manana <fdmanana@suse.com>
> Date:   Fri May 16 16:07:40 2025 +0000
> 
>      btrfs: unfold transaction aborts at btrfs_create_new_inode()

This bisection doesn't make any sense.

The console output is showing ext4_add_entry()->do_split() causing the 
KASAN.

Furthermore, there is no btrfs in the whole console output.

There must be some randomness in the reproducer.

> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16bbf315580000
> start commit:   72d3fcf802c4 Linux 7.3-rc5
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=15bbf315580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=11bbf315580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
> dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12379605580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127f6325580000
> 
> Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
> Fixes: 3f757b56f1c4 ("btrfs: unfold transaction aborts at btrfs_create_new_inode()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

