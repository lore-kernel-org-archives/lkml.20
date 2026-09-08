Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B9A4AEBED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909057; cv=none; b=EBMCqArVG+uPiaU77aNRg+xLfVYrL7ouTmwWEtyWJeUF0J7dT+8nQOkWaDKrdWfqZyP5x3cq+QxsJmOWiWjfj3QKNWNqtCo0Z48GaSnMPhvN1CCjrtOWevHyASSA0w8DE9gLlAS54ntDict/hJ1/vWpqnESjubcXltlm1HsiENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909057; c=relaxed/simple;
	bh=7kdKAv1UutyivaCl7H1vS0Jdc3NzhJZAlxtP4jKPHik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+xzVKu7KVkBjkG70sOHG4qG8ZWFTfsRzcCYpFIstYV86Hl3m8RY8yBN8sDL4nCaA945h+R1Ht5aKd5pI4U4gysgGJG03TTDwkhujqEOmoSMGJtImA3BrVRe+Ef0T08PBkKiCMEAWDdF+EnX3Zip2x/dcpVPu+XQD70dBaDMEeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IXY5hYjo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sRcFuDHT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IXY5hYjo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sRcFuDHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788909054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHZMGWGGrZxmd1plGNxBzFOjbHBtD/NVRGD+NRqVMTQ=;
	b=IXY5hYjojRID8l2SkJKAnMZW+VWto5iTCGH4Q1R0tNA+8a+xQt36qpSkdVOUYATf17tM+l
	3C6/mWC6cWMcc4f3h6XG0dsaCcDZrvvtTJECTjBSHYGc5/bTEwHt7wbuBdOrDC2n5RiNGd
	z7rxiNCFN487k89elzDKy5zsaTlGBk8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-pocWe-7OMQOAtABmwEat_w-1; Tue, 08 Sep 2026 19:10:50 -0400
X-MC-Unique: pocWe-7OMQOAtABmwEat_w-1
X-Mimecast-MFC-AGG-ID: pocWe-7OMQOAtABmwEat_w_1788909050
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939694871aaso829902585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788909050; x=1789513850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHZMGWGGrZxmd1plGNxBzFOjbHBtD/NVRGD+NRqVMTQ=;
        b=sRcFuDHTda0H7m8LHKiif11aGzflPoNGjZUaeQmWNhvyX+hj48LkigIJ7dXYGZwOeh
         X5n5jsN3yTf4AIKhwN5mzQrB9KCWY221mzMpze6j/gWmvrQKjBFRBok8W30JQd5uCwvj
         /LAVUDO1E0UqwfWZtrVnntU+j9p+ezvkXDary4qZdSwfgecv5/NjI8ZWPPRXrDQRldQv
         R6IwU/ufQHBJcRnqxy3sTco/N9N8aJ8GR9e8cBOGIfMWB3mKEu6+Xbr0PyBWTTRIaBod
         1yc1AgikbT9beOf1EOCs+oHc9vxpeXouuv96Zex8jBUD3a6S6oOwHmFdjgtJTmUoGzGU
         mUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909050; x=1789513850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHZMGWGGrZxmd1plGNxBzFOjbHBtD/NVRGD+NRqVMTQ=;
        b=GGVZGbgRsf6z3brBlcFz3w3xGz4aAPr4dGMSlJM/6hiD/xwbKSGgZibhVQiLkqFSeN
         FzIu7SuOpkXCvA8LuMXPRwp7PSHfEVQcA+h8SF1wa46E3WxqWSs0StKeUa8LtAANoEyR
         zfiON/Nf7EMUUdgqE4LFTxEKhz/SGCBgH+HXZFmJlPsFiLotx5OIxo+x8M2ZkgYjKmRg
         7TDVTK9/rFyGjhaYgwWsOEbTr+eVC4of/JTphikDPUI1rKbVJMOev00IUyCwqIdxy/mU
         aV920YDJFtGvoB5v/nMRcJ46oIrloJcMuSMHX9RZYXrj+QcebB0czqPU8H2Ph0yQclyO
         yMRA==
X-Forwarded-Encrypted: i=1; AKwUvBznnJ/pPiAw5WWCFN/csf6O9vfI+9w4yIEEZmvVZi1anXf+kbcKIk2jPl4PWKfmk0GfvGtK2OvkmcrmbYw=@vger.kernel.org
X-Gm-Message-State: AFuF++mqDyfBNO+ITIURXGCTh7naCdY7dJr77WkIW+ur/8FF2zggdLex
	VvWu3fuZkDgIG8/As7phXKidQxmXEYRHhzjA1Sdx3Q76HSQtdig08XOiFN3hYU91SaZlv2Izrxa
	LtOf/eTlYZ6zf54xTEJ0ru5wMq8Iylt1qKltd/YNZ3TL83Be6+P4vYg6LCfSu4JIRCw==
X-Gm-Gg: AYBFou1jySEP2ZLIiRhAvJLTchWJlUtQuMqNAV36DzTw6lst/4o8hDilvStVOCArdvB
	E93YOJJm1fTAEgWWmWKjXWedoPAABH0K/SlKYy/UoJoZ9X3Kf5czOU/geVH4vkbJPDpF1D5cOVN
	CcQhLz72dB/Feid3z0eEKZY8+rYT0wDghufMD91dD6vHnPz/IPW0M1pfPk0w+OP2rVlRlBJ1JJS
	5kPKKTQuXKndTLVVwTPoDYSELw9WJeDF0hcPul0/38qhHb02XMNuzEZP1w51OBojWjt7Y45MSBK
	L7VoFHsYCMj7AU19fc/2diX5K0FB8tuXJsRV1+mB+nQ6Xlv0B8nQrZDRfex+spqD1y+nQmVr1YB
	Be9GFHaGQyTwRjsx+z6klZKEcdn+VyyJgnuN6A3fb2g==
X-Received: by 2002:a05:620a:691a:b0:936:cae5:8b38 with SMTP id af79cd13be357-939802fa452mr3511633385a.10.1788909050231;
        Tue, 08 Sep 2026 16:10:50 -0700 (PDT)
X-Received: by 2002:a05:620a:691a:b0:936:cae5:8b38 with SMTP id af79cd13be357-939802fa452mr3511625685a.10.1788909049657;
        Tue, 08 Sep 2026 16:10:49 -0700 (PDT)
Received: from [10.0.4.228] (97-127-68-83.mpls.qwest.net. [97.127.68.83])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb70fbdsm1246505785a.32.2026.09.08.16.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 16:10:48 -0700 (PDT)
Message-ID: <fb4bcf42-cb41-4a1e-b307-78dfdc914e00@redhat.com>
Date: Tue, 8 Sep 2026 18:10:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] fs: cache-align lock_class_keys in struct
 file_system_type
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 David Howells <dhowells@redhat.com>, lkp@intel.com, oe-lkp@lists.linux.dev,
 Alexander Viro <aviro@redhat.com>
References: <9fbb6bf2-70ae-4d49-9221-751d28dcfd1a@redhat.com>
 <o6cnjqy4ivjqaj4n5xphstfnk5jznufaygwmfkm2gyixqgfump@7fc6c6h6d5if>
 <28f144f8-431d-4c3a-a362-56083bb77541@redhat.com>
 <CAGudoHFJne0q+dnjYdXOyDKEfu_zZ71_z+kSiUPiHWG7jCBw-Q@mail.gmail.com>
Content-Language: en-US
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <CAGudoHFJne0q+dnjYdXOyDKEfu_zZ71_z+kSiUPiHWG7jCBw-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hohum, well I spent a bunch of tokens in claude/opus and basically got

¯\_(ツ)_/¯ 

I could be wrong but I'm not sure sashiko would do a deep dive across
all the involved code.

I was going to paste the summary of the AI analysis which I generally
dislike but tbh there's just nothing to go on :(

It did point out that s_lock_key seems dead/unused and thought removing
it might magically fix the problem as well.

-Eric

On 9/8/26 3:07 AM, Mateusz Guzik wrote:
> While I'm not convinced spending time on the resulting bug is
> worthwhile, with the arrival of sashiko I think you should rebase &
> resend -- it very well might just point out the problem with 0 human
> effort.
> 
> On Tue, Dec 30, 2025 at 11:45 PM Eric Sandeen <sandeen@redhat.com> wrote:
>>
>> On 12/30/25 4:04 PM, Mateusz Guzik wrote:
>>> On Tue, Dec 30, 2025 at 03:07:10PM -0600, Eric Sandeen wrote:
>>>> LKP reported that one of their tests was failing to even boot with my
>>>> "old mount API code" removal patch. The test was booting an i386 kernel
>>>> under QEMU, with lockdep enabled. Rather than a functional failure, it
>>>> seemed to have been slowed to a crawl and eventually timed out.
>>>>
>>>> I narrowed the problem down to the removal of the ->mount op from
>>>> file_system_type, which changed structure alignment and seems to have
>>>> caused cacheline issues with this structure. Annotating the alignment
>>>> fixes the problem for me.
>>>>
>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>> Closes: https://lore.kernel.org/oe-lkp/202512230315.1717476b-lkp@intel.com
>>>> Fixes: 51a146e05 ("fs: Remove internal old mount API code")
>>>> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
>>>> ---
>>>>
>>>> RFC because I honestly don't understand why this should be so critical,
>>>> especially the structure was not explicitly (or even very well) aligned
>>>> before. I would welcome insights from folks who are smarter than me!
>>>>
>>>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>>>> index 9949d253e5aa..b3d8cad15de1 100644
>>>> --- a/include/linux/fs.h
>>>> +++ b/include/linux/fs.h
>>>> @@ -2279,7 +2279,7 @@ struct file_system_type {
>>>>      struct file_system_type * next;
>>>>      struct hlist_head fs_supers;
>>>>
>>>> -    struct lock_class_key s_lock_key;
>>>> +    struct lock_class_key s_lock_key ____cacheline_aligned;
>>>>      struct lock_class_key s_umount_key;
>>>>      struct lock_class_key s_vfs_rename_key;
>>>>      struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
>>>>
>>>
>>> There is no way is about cacheline bouncing. According to the linked
>>> thread the test vm has only 2 vcpus:
>>>> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>>>
>>> Even if the vcpu count was in hundreds and the ping pong was a problem it
>>> still would not have prevented bootup.
>>
>> Fair enough, it really didn't make sense to me.
>>
>>> Instead something depends on the old layout for correctness.
>>
>> If I add ->mount back to the /end/ of the structure, it boots fine again,
>> so I guess nothing is expecting specific offsets within the structure
>> at least.
>>
>> (If I turn off lockdep in the kernel config, it boots fine again too,
>> FWIW.)
>>
>>> By any chance is this type-punned somewhere?
>>
>> I don't think so...
>>
>>> While I can't be bothered to investigate, I *suspect* the way to catch
>>> this would patch out all of the lock_class_key vars & uses and boot with
>>> KMSAN (or was it KASAN?). Or whatever mechanism which can tell the
>>> access is oob.
>>
>> Can't do KASAN or KMSAN on i386, AFAIK. :(
>>
>> I suppose I could try such things on x86_64 just in case something shows
>> up...
>>
>> Thanks!
>>
>> -Eric
>>
> 

