Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5E531AFC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961429; cv=none; b=nrhcPcqn4A5oB3y872ZTxMtTWFmYdN9jyBl8Q+ZWQMtQ3qE7Zx0jYgWih20VQmu4Bl+13ea9w3La6JacWS8UORZSVeNc/1DMg/3wNnaCabO5hMcq0lSMRdNMbq5PxIkYMO9Iqf21u/Q3nJyUDQoPggLZmiRTppw4/jYYDcGlnP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961429; c=relaxed/simple;
	bh=eYD15s0EWkS/jZcl+DFfStqzfa0V2r3FbD3RA+t6jtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz55iXWVdYuxX1Mhnw2HzlRYY3ocL7d4Gs1q71HTzkW5RPivY3B6QSDobe9xRMj/5fWLa33Wzt65SnWDieq4ZshaCI60LwNyDJCKfgtPV9CzHJmK/zTQvlBVhrEJ3dfLKGHLcn25Z6/JzDSa0QsawTQAcU2bW3Dmt/KZD4qUKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=eFwHwSC6; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="eFwHwSC6"
Received: from [IPV6:2601:646:8081:8d71:5cb3:1591:3c4d:f1f4] ([IPv6:2601:646:8081:8d71:5cb3:1591:3c4d:f1f4])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 689Dh6ow3804694
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Sep 2026 06:43:06 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 689Dh6ow3804694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788961388;
	bh=ZL/gT4kHs9WamtcdUxmyF1tgVVpVFEeVqovXe+EpBQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFwHwSC6hjap02ACpRnHIRPw4THKCVy96V7SRclSv0/wvuYj94WdAndZ412lZjsIc
	 ib2dBilG8mtldf/d2E3Hya1jj6o9Zk0Q79lICDrC2lXPZycxmIDR6BMtmn+iMwxd13
	 oyUtUB6IFtwNA2gyH+XgJWNfSBRUAxY/EZqEkIfeO8dY5AHITqf3EmMcOvcElK+Vl9
	 v6VuBiudgQWGq2SHQLrm/vdw1poseknYCfQsThqM83O6PmKtmMho1BxZpAnnk0H5h6
	 yPMZgaU/BF4TkPQ/qZw8cSrbhtDNfIX36C6nbD5kwMiHoJfDBuxLmsWFqIT/oTT9+X
	 EecohgN80cYTA==
Message-ID: <8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
Date: Wed, 9 Sep 2026 06:43:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
To: David Laight <david.laight.linux@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich
 <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
 <e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
 <20260909093831.095b89cb@pumpkin>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260909093831.095b89cb@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-09-09 01:38, David Laight wrote:
>>
>> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
>>
<broken code removed>

>>
>> On 64 bits it compiles to:
>>
>> 0000000000000000 <memcmp>:
>>    0:   48 89 d1                mov    %rdx,%rcx
>>    3:   31 d2                   xor    %edx,%edx
>>    5:   31 c0                   xor    %eax,%eax
>>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
>>    9:   0f 97 c2                seta   %dl
>>    c:   0f 92 c0                setb   %al
>>    f:   29 d0                   sub    %edx,%eax
> 
> That isn't the object code from the source ...
> 
And that's the ultimate hint that a cut and paste error had happened.

This was the actual source code.

int memcmp(const void *s1, const void *s2, size_t len)
{
    int lt, gt;

    /*
     * Note: for the benefit of 64-bit code, xDI and xSI are reversed
     * compared with what CMPSB uses; hence SETA and SETB are also reversed.
     *
     * The XOR statements set ZF = 1, CF = 0, which is required to handle
     * the case len == 0 correctly.
     */
    asm volatile("xor %[lt],%[lt] ; "
                 "xor %[gt],%[gt] ; "
                 "repe cmpsb ; "
                 "seta %b[lt] ; "
                 "setb %b[gt]"
                 : "+D" (s1), "+S" (s2), "+c" (len),
                   [lt] "=&q" (lt), [gt] "=&q" (gt)
                 : : "cc", "memory");
    return gt - lt;
}
