Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492397;
	b=V2AfW8NpVXzAemkNJuSWwUZUqGhqoV5LQ94V8KhjIm12sRyhmIiGgTk58Liw12aRCocI
	 bPjP7E9MPplPn5Ev/qkbR90kDUz5Cuehg1XGxDjckkcKXS6RVMpZi7F0G4VTNEKCORXH2
	 n+YlhpkH6a6wAvbP05eDtLm0ozXHbKyur/Z0/3PRXE4Xxnb0dnXTzesIzVtx9c8Wq6x3S
	 AokcALNmxAgRrnf14PCl2zmCwIal7/k/sDP7+KWhcAe6DAF9TQq/+sdWMeeFXbgwZv+z0
	 iQmZVHE4n9NzpLjQAHBKpHvxBL3QDTAOejxzTsCLkeqSBehxTpndd/8aPV0EfyQp6Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LXIm36iFMZ8kOBujPBh4eH/qjfWvYnVfBxH0cH6iwsM=;
	b=PrGRj8Z0oxy40wYOBi5wuqIBv69Ghtr4EIS2ZGManQRDcXpMphejK414teB4Kg5/1KKR
	 9N0Goz9URpqYc5Apk0mdOb1x6UQRoHjKmz53wySUh0spQjTZXey/y3aDm8A/Vs8XEPA0V
	 6kz4oTiC264O5cd2aiCwKjEota7l19bcTkIJr8ipPZ+le+yJGP4Fr9rSgvZSHEQoFw8sw
	 tqojFlIJnx9PSH4GT+GXt8V3wAZ/aCy/CioeYuZnpLNJdWpgqbzXAsUCO4GXpeGBs0ZBQ
	 AA7qqSgVoA+rw2XXteh35aF07smB59vR8NKaZKtkHJN22R/p69CH8p4UT2ppX/EBOBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ0O8ptU;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF660A2627
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FF660A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ0O8ptU
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c506094fd93so411398666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492396; x=1795097196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXIm36iFMZ8kOBujPBh4eH/qjfWvYnVfBxH0cH6iwsM=;
        b=iJ0O8ptUFgqzUF0HS2nnVTaNoVhPcmUF74R8wDy41neP7vq8HMRXJc7K5zqFIyWN50
         OQ2Kui+CINP4jSWel6CZfma+s5yUJ+g0EH99NZ3Zvfld8OwRHv88d2jr1L/vA3RSM74J
         HPRGuwMFgZ4DHsxcYpPV1O/i31el9yT2KWGfyqtInfS9sidP7NwZ60CxiXUOCROqoaka
         Dbs35OKCAs+OEVnFzQb2wsESoXa2IW/ATT6rBkW+P+HhV76RoMgrIgmiMR5kdb1KUQN+
         fmR3iGk+RPAT7sBQAKFNlKkqseCiRLmBwx64KRd2OABz+/XaX/jJSLMVvxItD5VFNZyW
         6qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492396; x=1795097196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXIm36iFMZ8kOBujPBh4eH/qjfWvYnVfBxH0cH6iwsM=;
        b=fPpAjlaMBNvNPDWj6MUBmCr1KuTIadVT9LYDISE/BoCtSL5cnfM3SpPgVsTThud2Jm
         vtSMT9rh21heZjM05HjTa9Lp5H3i1hwFzD0unko6qylihjdqh/hU39X8d4CLVZfHwTEH
         FMQBCuveVA8Bznp02cARTTQu7RhAiq9AgWC4Cn2TxlSXl+ifnK4X32txcD9TlS2ssvSY
         UAPkBrhO8Rlswom/h1A1l9npcbzBP/uo3iRNrsAApaUJCVx6SuXRnzdmVEfOTtnQuj3v
         MsbJK+bzR+x9l2VVQw94lz51yW8U460PCI3IqiOVAkHOpRbkSQ8WU/dUYGTNdmSYblUA
         a+7g==
X-Forwarded-Encrypted: i=1; AL+hErE6iYOE66fBsPhp/7EPT3zwAulUUo4XkPMHqIl712A66e29Bzci6r9AbAwgMVP0yBbOQOwKiguGtotrnN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+11pPinpViy3YkLDD/SrYe/uzBcGT7ldZ+cWHwmOlYIrMHZTyQ
	F6wfK7xaJnI3GJ3h/VLiEv38XoYSuBCiqUZQRqyJr1nxcmOZssKbeEdh
X-Gm-Gg: AYBFou0XvXd2cZ8vwOhNBCn9A87Tf1sQObGk1VbBuCoc9NpAl9OwOAoSIBQPvLc864c
	iKvekxkTCIYkG3LkTbtl79gZm3X8k1QZCPtwJdIaF+2yJncxr+YkxS1UJz+yXEdl7rRjG0nGqWb
	lortfvVicCpVRydBaHvMS+A9koek8z35WokxO8oftIM96VaFrE98QxzJKkMPxeNsSKZfOr8m8hd
	o+BH9KUVK1I7jh8OiM7cGZHz76UyFQLdTeGXYZXrGqIsWfbK7nv37269KzongSC5kgtldmBgl8G
	uEZbg+bCv5g8hO83ISrpwTFJomgXhBgMLq6QljIXvou+S+KklaExMbbOF36+LmKpa7lfWixv/HF
	ISMVtFusswA//4lmVl2A/0+SGJZRpMBVeK5oQvgg4BXkq8Jx0YcowSKk+NP9GFmyo7qtPFgOHbv
	JXPO6Yn34I085luf6rX5+xvFTeXuNw6TEbtIN/aQ/rxsvPieBHla2+0GZuNZybxrEn2VGzGIRd2
	yDowhpOkoAf0QZQyIO4rDm4udOo1mlEO6h2ONTD/bt775y2+IZp2wLk6XqoTW6dIncgIPdGsbXS
	1+xl01XWaEuQ++itOv/FxDMlNwzSZGr52LuVzINwgH6Z1gPTgOdDxUpt2uPwVBAhXPyW529KQvu
	2XOSKMZ7LIkwmDGpcah8Ss2ArPeD64tSWRe1lYtgXpeuFzFtQYiTy6xSUIvKqLAja5K19sO3vwA
	WwxI+N5zG9UhOS9f+KOQwBhi4e7ISCrAU5pVbvRfi95Myg/1/eNMSLQeaRr9n9OeGq/NLBWLTUs
	dVyqTPyeVdvhw==
X-Received: by 2002:a17:907:1b1d:b0:c4d:31c5:e30 with SMTP id a640c23a62f3a-c5066d3db13mr442488966b.49.1794492395421;
        Thu, 12 Nov 2026 06:06:35 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a593b5esm363017266b.34.2026.11.12.06.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:06:34 -0800 (PST)
Message-ID: <c1af6845-bfa6-480d-a240-7b918331234f@gmail.com>
Date: Thu, 12 Nov 2026 15:06:33 +0100
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
Subject: Re: [PATCH v2 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ian Kent <raven@themaw.net>,
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
 autofs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <cover.1793715774.git.krystianmkaniewski@gmail.com>
 <c943b8e768ef766b0f6563b6085e99fe@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <c943b8e768ef766b0f6563b6085e99fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 16:51, Tejun Heo wrote:
> Hello, Krystian.
> 
> On Tue, Nov 03, 2026 at 03:57:41PM +0100, Krystian Kaniewski wrote:
>> Patch 1 adds SYSFS_LOOKUP and kernfs_ops->may_lookup. Writable opens of a
>> marked file refuse both splice directions. Their of->mutex and seq_file lock
>> use separate classes. Read-only opens retain splice support.
> 
> Can we be explicit and name the flag after what it does, e.g.
> SYSFS_NO_SPLICE and kernfs_ops->no_splice?
> 

Yes, that is clearer. I renamed the flag to SYSFS_NO_SPLICE and the
kernfs_ops member to no_splice in v3.

>> The new property cannot be combined with mmap or preallocated buffers.
>> Kernfs rejects those combinations for direct callers, and sysfs rejects
>> SYSFS_LOOKUP together with SYSFS_PREALLOC before selecting operations.
>> Binary attributes do not support SYSFS_LOOKUP and reject it at creation.
> 
> Can we keep the rest minimal? With /sys/power/resume the only user, I don't
> think things like the mmap and prealloc combination checks or the binary
> attribute rejections are needed.
> 
> Thanks.
> 
> --
> tejun

Agreed. I dropped the mmap and prealloc combination checks and the binary
attribute rejections. /sys/power/resume remains the only user.

I'll send v3 shortly with these changes.

Thanks,
-- 
Krystian Kaniewski
