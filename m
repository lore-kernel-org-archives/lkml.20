Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31CF1C69D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791772832; cv=none; b=rXFZShVutNpRTe1min0nqYCn+pbvUBJG167akeLVe+AcWALyPwmP7VO0YbfGSoynO5gph2ZMpcOJ1Dx3VEEV/yt2a3mov17O7EnwlURV7/brvtrQ0Auc7gKT0do4SEJwwTtiu6ga3S0HFevM6iTPUM9HE+BDrEVFi+Mms+Ku0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791772832; c=relaxed/simple;
	bh=Rg7Ti2nrCcjndaSwC/tc8Lpj9MG69++gVxXMtW61Alc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huLH9TEr47a7Qwj5KZWUi3HnBZ07slkzSk91GnMd7/oab+iQwxWRNae7RNCn6KwF3/7Y4SMGJxd1KQYsnDGMQxWzPsLzwdl5zTVUdJR4e/3H/ACsLYyk5gyyOOCdTlkdnxWy/Apc3C5YIW84+mA0vDaNkjvrjIOw6qa49bv2B/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ESP+wt37; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ESP+wt37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791772829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mptis6qqMpkv7ium90UiEIS1Bva/bRNNiMhKtY2RI7I=;
	b=ESP+wt378y2jySy+w+ZOWz/6ffx3Bmeapmfd6Gtn/pKnkfIwxmCESiTSetewPBPLs1EsPj
	VAZq9hUHd1eZjMCk43/rrXyhccXQo+57UedmpQkqS2lllCLSvZA74jq25RtHPipoMJnns3
	aKYX5FeMAIq8l9sXMyfeGOtza3/4jq4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-8R_MMj77OJmOTMcV1s8jmA-1; Mon, 12 Oct 2026 02:40:28 +0000
X-MC-Unique: 8R_MMj77OJmOTMcV1s8jmA-1
X-Mimecast-MFC-AGG-ID: 8R_MMj77OJmOTMcV1s8jmA_1791772828
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53514fbd4a3so34656091cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791772828; x=1792377628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mptis6qqMpkv7ium90UiEIS1Bva/bRNNiMhKtY2RI7I=;
        b=Kwg4lREAUsZ+Hf9VFuEdw3G/fz9Nq5uxrebzA1eoYWKlrXpk2Gwv9CtannyyE6jkLa
         f5v7sHioGewMHkk9NhZLdouBPp55pt3IRa4UIC1II/OP6RMOytm0lEpzL9NsYK3OiIvg
         eCyWSYnO1321BY49nnXSg450C2eUfoZQZUzkt4wIDdcAYGRNHMtsQrZF6wlMZfRJ/3kR
         iQjS+POThyvfcj1jFNxZjWwboIPslOK3cpICbIkxWr+hq4IjVLiHUaSaHJlCIHetETzv
         NwYzr4vX33A0XyvVHieoBTqasVJqhjDj66DgU7iTBvOuiJLrXOXxfy+p5GEjCpXN2Ot1
         OnkQ==
X-Forwarded-Encrypted: i=1; AKwUvByI5Dxm8UYM1CrW8GTpHX42MunWd7aJkbghikQgyKfvQH8GygDkOJED3N6Ajnby7QP+ky+BG6HU7SPXFIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+r9TLRPjVfq36RvMw+mOmFPMU8SslMhRMwUi4iPTVhDLlxiRM
	FafjLYAKokCm8jP7m2Ch52TAbRTk/BWqRtM1C3Y26tnvGg00G8GI+sTa6XlJuveOKjXjhJSNWMT
	RHGquTMcmTK35iyB4ScYc+AzpyHLcAuSoHHS9mTJCRlJLoMdKbyMfXJA6/iJswph/XQ==
X-Gm-Gg: AYBFou3RgSThb6mKfS+/y24ytxHa7bOLuzs9tEA9mclWeTKlNGvcXqGj1rBrwX396FN
	ztcgCnZIaBm03gKQHDd5SoVZX+YysjQd68dU3kR1nBmVpFVwfJg+lrJPBj6iVX5Dwup/ybtTY3r
	DnOilpGELigoN9NLCgJRznm+25bMmeMXh595ZhvRPYMSwoVQiX06JLWWkhmYtNBSnYcRV61xntV
	0F4sZi+bqX7gjP9+TSvRkfc7rDY0MZ8hXxDq4AECBbXZ1+btZNBJ0FOYM+1xbSjHcMR65ZCPOs/
	QwflFqVo4hD4uAnxl6yjl/k8Xp9k1qtva8ulu1S0cUI5bCeaf49azhhxLufoqykSj+p9wD9IzeQ
	NjqA=
X-Received: by 2002:ac8:5f4e:0:b0:533:97ab:dd45 with SMTP id d75a77b69052e-5359fb3dceemr148577501cf.36.1791772827793;
        Sun, 11 Oct 2026 19:40:27 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:533:97ab:dd45 with SMTP id d75a77b69052e-5359fb3dceemr148577221cf.36.1791772827331;
        Sun, 11 Oct 2026 19:40:27 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b812ba8c7sm15440366d6.38.2026.10.11.19.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 19:40:27 -0700 (PDT)
Message-ID: <aae9d468-2dd4-48fb-8e2d-d6997ac8e723@redhat.com>
Date: Sun, 11 Oct 2026 22:40:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/corruption-check: Remove the BIOS memory
 corruption check feature
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net, rppt@kernel.org, blum@kernel.org,
 david@kernel.org, linux-mm@kvack.org
References: <20261010153604.1885381-1-luizcap@redhat.com>
 <20261010194519.GAasqVz2brXiOLegQi@fat_crate.local>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20261010194519.GAasqVz2brXiOLegQi@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/10/26 3:45 PM, Borislav Petkov wrote:
> On Sat, Oct 10, 2026 at 11:36:04AM -0400, Luiz Capitulino wrote:
>> By default, the BIOS memory corruption check works by reserving the
>> first 64 KiB physical area from memblock, zeroing it and then scanning it
>> periodically.
>>
>> However, this functionality has been broken in its default configuration
>> since v5.13 by two commits:
>>
>> - Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations").
>>    Moved trim_low_memory_range() into early_reserve_memory(), which runs
>>    earlier in setup_arch(), causing the first 64 KiB to be reserved (when
>>    CONFIG_X86_RESERVE_LOW=64) before setup_bios_corruption_check() runs
>>
>> - Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM").
>>    Hardcodes the reservation of the first 64 KiB early in
>>    early_reserve_memory()
>>
>> It might be possible to get the default case to work by allowing
>> setup_bios_corruption_check() to run first, but it's just not worth it
>> given that the kernel will never access the first 64 KiB area anyway.
>>
>> Lastly, note that it's possible to get the corruption check to work with
>> a different region by passing memory_corruption_check_size=. However,
>> the main goal of the feature was to check the first 64 KiB. Besides,
>> the region picked will be almost random as setup_bios_corruption_check()
>> will pick a region by size.
> 
> And?
> 
> Do I want this or should it be fixed or the first 64K are not worth it to
> check or...?
> 
> That whole "rationale" is not really clear to me. Yes, it is broken,
> apparently. So let's remove it but we might get it work still... So which is
> it and why?

Right, the changelog got convoluted because I tried to document all the
options. Just to make it clear: I don't think it's worth fixing this, so
I'm proposing to remove it.

Here's a rewritten changelog, if you think this is good I'll send v4.

"""
x86/corruption-check: Remove the BIOS memory corruption check feature

By default, the BIOS memory corruption check works by reserving the
first 64 KiB physical area from memblock, zeroing it and then scanning it
periodically.

However, in its default configuration it has been broken since v5.13 by
two commits:

- Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations").
   Moved trim_low_memory_range() into early_reserve_memory(), which runs
   earlier in setup_arch(), causing the first 64 KiB to be reserved
   before setup_bios_corruption_check() runs

- Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM").
   Hardcodes the reservation of the first 64 KiB early in
   early_reserve_memory()

This has been broken for years and nobody reported it, which suggests the
feature might have no users.

It may be possible to fix this by running setup_bios_corruption_check()
earlier, but that's not worth doing: the feature was intended to detect
corruption in the first 64 KiB but the kernel will never access that
range anyway.

Note that one case still "works", which is passing
memory_corruption_check_size= to scan a larger region. But this is not
useful either: the parameter takes a size, not an address range, so what
gets scanned is whatever memblock happens to have free below that size.

Remove the feature.
"""

