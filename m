Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469248FF93
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398078; cv=none; b=Ii611GwdW3BaVKsoLO+z37K+H7ThcDoUkVtxwz/5Win5uvX7Ja13HIYCoIPlKsfArza0ViaSRUUCgB7yWSeQ9cUtdCeOkGm9ADCtSiAep+k5PSXIEKrnx4P5159xdA3jqmcPPyfDIZfIvPxQ7pB0TkB6kCC2jRq7R/uKwPGtVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398078; c=relaxed/simple;
	bh=EalQDU4IYycXB8IzvH7mx5DaPfn6lSTeFNCMbg9uHYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqpiqMbAJNWiS/p1s36ZsDqedMG1oOEZJmrJkLVxXF5ztYlDdVWH3V0TVvDfHaVXHSVKDI0z1SHR1UTBjG5Gib9hJ3FWenJrMjZsrLO37vdUomEVzvprnz+jrmZmbfT63i0Rj6kgJFABffDKu+6h5INT6m83x4sxsKrW0fTovoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLq4iiCl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLq4iiCl"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c411e139259so168654966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398075; x=1793002875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqARml2eRxc6et7vGQaWdyqklu54c3RuOpXb7dukqxo=;
        b=JLq4iiClFxw5QZJVJzY2rMdCVHqNJo2T7MOp70cXN4+OENfT3UD3JCATXwARujZYZP
         1DcvSkXVNKVhvEvw8WrGyGqxPpXeRk0TIZM1Ff+Nk5A9u8wJWPIGfmD5Z0ve0CkMxR5M
         359ukSLBWExlFxLtNPhvyegoSwF6rwFCyco9J9Gv1HK6yjl0o2gfiX0A2ThYLvNGDFvi
         ugOEtYpBL3bQpTEbQ3r10LVU98oF3/Xuc9DQLbRF1M2/okqqvlXbF7fmz2jqmEdjdV2O
         0SnnZ3rOEbc8qutOm0LqbcKC1A9WVJ5XKYarnldMqT+prWzUvDOpXaNqE4g1kvwP2bNX
         qFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398075; x=1793002875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqARml2eRxc6et7vGQaWdyqklu54c3RuOpXb7dukqxo=;
        b=r548ahDUQHEB0hMou6F3fpNYjacUcARCsevp/4ynaEQb+9/oEFSA+zQm84kLGpxX59
         61ooLdo1x5vVWFMPcOQCnALDffscSSWGVJ3R9uCXAoVeSJkKR1yjkbxGyMiBOeMljEaP
         0JrAeDyZW/Zvyrq8ShlbL/pgF3/+B1rlrCevZjQxmuKvnjOTO+VJ18OvY84cEmbBZ8TT
         oS/mAEXvb56KWOdolanOWfiYgDB+3Y6NdCOYJn3pxDmmfroVcJrH+YlOqPOqr46mdm9C
         83aWo5IFBuIDuINmEDN4e/r2mYg5xnwPfQIpnHNTyyry5Si2svi0AQfInXBdeADSamFI
         ZSXw==
X-Gm-Message-State: AFq9FYJNSMAYYopVon2KcAvXKo243NnL+Sa1S5Z52KN+gR5TNwuVWN/y
	kUFsTyLDeS0ndMGeOBjMzMybKemu4G1JaPATXfjRed4DsOs8MZXmSjZY
X-Gm-Gg: AYBFou2ASVq3YcArgLg/4K+UztkJVtRMoLakqbK9XSn1hy38/9Ok97EKCNCohbcf1yf
	km4uN0g0NujyX5qS9GemOjOkWQ0c7mz2DpVmT3phlEPK+TpoZlMe5cg+R/rgl+VBN73WEjE8l1/
	CX8Av5V9ospc/cv+wlerzCs179LuXEpV6fEodYYxbtdz93bOzmWg5Y1mXpTIKwa72BbgBVfke77
	IdYtkhWtZghh6wR50/Yz6pArp5UWl/g/tTFcS0tgYtEN79/7GG4vpeWFcqmJXb5gUSr42C06jYR
	P4nRv8totwOklgaoLq+b/udN7RqykST/tgeWCbHyCqPLvNRiRSOgibeuCs7LdulMUj0QbohNSvM
	jI198ORrqkzeGeh9rXOtQew5BMXSLViu/jguTVzZe2CnBnCqHDfzlunkGWbofrudkSGLIM5yY6Q
	VbfiDkB3dMZ0np1LRhXjvLxUXGQOcQ+mkdyu6VrK8T9GKWAw6Ut0GMIjv5KIhsJVk+Luwx3IuV/
	9ankWnLhCDa9v0bbKQOGBsErAGgISRDSl3CVbQMzWO4EmNFbv2izYDQPpDmMnCsTAGSKagW7hE7
	ZUTQInGKb/QoJdUzUpPfN6pF1HV7oGLJOHjoWeMD+/zBjmtOirmzmIAtnwfWUV7CJUvlCNvsY7G
	vgkJcYQMEgelgtiwyTPKi3KwIag6bIuPYqw==
X-Received: by 2002:a17:907:c819:b0:c33:923b:ad50 with SMTP id a640c23a62f3a-c419e03af5amr426962066b.19.1792398074683;
        Mon, 19 Oct 2026 01:21:14 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c6153sm332041566b.40.2026.10.19.01.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:21:14 -0700 (PDT)
Message-ID: <c820357a-a7cf-4f4b-ab23-91530a12218b@gmail.com>
Date: Mon, 19 Oct 2026 10:21:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fat: make rename recovery safe after metadata write
 errors
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
 <20260929090029.742579-1-krystianmkaniewski@gmail.com>
 <87ld8j4161.fsf@mail.parknet.co.jp>
 <1f18819d20c92960b8b2d6ccc8bc4506d346150e.1790779353.git.krystianmkaniewski@gmail.com>
 <87bj90m6dq.fsf@mail.parknet.co.jp>
 <20261014082315.190262-1-krystianmkaniewski@gmail.com>
 <87qzhqvloo.fsf@mail.parknet.co.jp>
 <55a1f016-a7a2-469f-b481-37223d695f29@gmail.com>
 <87cxt921rc.fsf@mail.parknet.co.jp>
 <f9b27432-4104-4323-8cd7-e2cda73db2f9@gmail.com>
 <875wz11xfg.fsf@mail.parknet.co.jp>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <875wz11xfg.fsf@mail.parknet.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 17:23, OGAWA Hirofumi wrote:
> Krystian Kaniewski <krystianmkaniewski@gmail.com> writes:
> 
>> On 10/16/26 15:50, OGAWA Hirofumi wrote:
>>> Krystian Kaniewski <krystianmkaniewski@gmail.com> writes:
>>>
>>>> On 10/15/26 20:54, OGAWA Hirofumi wrote:
>>>>
>>>>>> +	} else if (!rollback_err) {
>>>>>> +		/* Read the entry block again if a failed write invalidated it. */
>>>>>> +		rollback_err = bh_read(sinfo.bh, 0);
>>>>>
>>>>> Why do this read the bh from on disk?
>>>>>
>>>>
>>>> The bh_read(sinfo.bh, 0) is needed because a failed inode-position write clears BH_Uptodate. fat_remove_entries() modifies and dirties that retained buffer directly, which otherwise triggers the warning. Reading it first refreshes the whole block. If the read fails, the buffer is left untouched.
>>>>
>>>> The same reasoning applies to both the VFAT and MS-DOS paths.
>>>
>>> If sinfo.bh is required to read because of failure of I/O error, I guess
>>> the bh will fail to write again. I think we should give up to rollback
>>> in that case.
>>>
>>> Thanks.
>>
>> Thanks. I was trying to handle transient errors here. The old entry still exists at this point, so if the read and removal succeed, the rename can be fully rolled back.
>>
>> In my tests with a single injected write error, giving up left the new entry pointing at the root directory, and fsck.fat wanted to remove it. Retrying the cleanup left the filesystem clean. If either the read or the cleanup write fails, we stop and report corruption anyway.
>>
>> Do you still think we should give up here? If you prefer not to retry the new-entry block after its failed write, should we also avoid rereading and rewriting dotdot_bh after a failed .. update?
> 
> Basically that path is not the failure of sinfo.bh, true? If so, we will
> not need to re-read sinfo.bh here, just removing the added entries would
> be ok. 
> 
> If we have to read sinfo.bh, the sinfo.bh may be failed the write and
> cleared the uptodate. If so, I wonder why succeed by retry?
> 
> The above is my understand.
> 
> Thanks.
Thanks. error_inode can also be reached when a different metadata buffer fails. In that case, sinfo.bh is still uptodate and bh_read() returns 1 without doing any I/O, so the removal proceeds directly.

The test I mentioned did fail the write of sinfo.bh itself. The trace shows __sync_dirty_buffer() called from fat_sync_inode_metadata() failing on the new-entry block. The retry succeeded because fault injection was configured with times=1, so only that single write failed. bh_read() then reloaded the block and the cleanup write succeeded.

That is why I kept the read. It is a no-op when sinfo.bh is still uptodate, and it allows a complete rollback after a transient write error. Would you still prefer to give up when the failed write cleared BH_Uptodate?

-- 
Krystian Kaniewski
