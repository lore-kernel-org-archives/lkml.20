Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB45493632
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141852; cv=none; b=ucrTsoS0DdBSChTVSZgKTO7d5gN1fIGpswWeNSB8ygEY3qPs5T/VF8HuOlRzEng3RAiF/A1I4zFEQDOBIq4Pg9wSD81gt1D4A8UXxr3iptYSUIPiew2weKyB/G3ehbSbJLyg9R1GGLP5DlLsTnCqm/WWzJiaxS4R8vRXz34nUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141852; c=relaxed/simple;
	bh=lFx27efnX9UzeSOWHfI7BNXGclv+O1lU7S+eE3R4UoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAsQm3Iz9R2gKUfFK1/tezlx9d0qC8PPZEThDk3xNyUW0gs5BrnEVxN0GxH+3z40cerpOK8xdL9t8NYGlj5E2MjvdmBIxu2vj7AO00+Yej4OirK6hNBw/Lu1uiGppk0g/VZ20O/QMIZRcU+YPKjMjYKcjTiOd/pa37P/7m0sJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=yqzZP/C6; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="yqzZP/C6"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4c3eeefdf2bso601082b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141848; x=1789746648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RXdz1vIBd9o1nlraikrE27tDySEqddQpbtBN4SlMmQ=;
        b=yqzZP/C6cRAKfE5s6hwlEYpICR1hHE4gmlyFODsckOT8j3SkCuof3+rh8JG/qq5Emc
         Ej8WCAdAhSF2uvnewDBvPtyoNgqdjxkonkgLreTzCisLecRWmW5Vmzk4rJuHxOKBY897
         h0XSbZii7izvMVOL8WZq1oZELy1gWqqRo3RN4BsOk5Zuoi+AFCYKCpN5cVjwd8TcPS8j
         7OEkB5t62L2CKV23j9J73lvxfPULnZumQSIL0NqXp0pYIgWpHj3Ueiy2iRjLgRDieAFY
         iIKkyIKhfXbf5WFddn5lYs6D3OmrD736JelIyZ1ofxgrCTzaf0sUSpMKkWN+tKzwJ2tZ
         PAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141848; x=1789746648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RXdz1vIBd9o1nlraikrE27tDySEqddQpbtBN4SlMmQ=;
        b=hBb45sIcIQpfWpskDfvV+MHIvHxZKchW2mRFdDvFti+KPXQwV88SY7/ciYw4J4MeMa
         44IbCWngOVJht84roGBPAZlbg7vfjzHt4+ZCzRcQVp9Bn4PF2LpYpUZMuWeqafJjT1p4
         nCytwp/mgych8ZV8NskXxMzlQzW6kmWM7Lnduw9Uh2ixFM4urSOUQh7kA4Nbdxgac9l4
         G0va1QH1NAkYRbfe2uvxzMij99T+mRkwwgZsB+znRjzIHnmuHBGzzEZxrib0PA56quEN
         lyFs9AQ/F9JUDce9+6Ugwv854DZ9rgglP5quwiOuyMg+7dViXDfPEdhLYdpOHcL0Ggvz
         n8kQ==
X-Forwarded-Encrypted: i=1; AKwUvByGa7+l70piqDf7EKDS7QN8rs78UOoRLrybpzavP/wKpRtvLqII79OzNoCRbtFnIB/TmfYJvoXwk5kXTYY=@vger.kernel.org
X-Gm-Message-State: AFuF++lKEoM3MpEU46FmTrzxxJIgB3EcZ2DgWIztfKxxaJ5A5arNUuVD
	dR+zsGkWQ/NcHTFw1YMBim0mPKdSC24icMWWWsd4Zxiv4SEFcZBl7ajS/Sk2xlnNLBE=
X-Gm-Gg: AYBFou3Gv4zJCZpGpJZpKrtcvzyV/12qmg7PrVjc0LMO+1V88W03+rR9Ts2wVL4LG0V
	iCbjloyd4PX2DZO1W1S4X+O83dvy8ZGlTIarEdnju+JbglNoiv3MMHOwfgPP/YGSkiCHH0zdP11
	Xk3sz75mnfO7g/eH0IBDo+7gwBRex7gOhvtYV1GitSKza98/rleuLbw8y8ELTF+23LiQ60cX/PY
	Dq+MK+wqrXYnSeOxWx+m+zE6OEsdd2B7yi25jvEyJzSJjNYGspg3qP/XQWrKbMCvnchEiI6EjF1
	R+sNK7WvwXcphlFlGFLW/p4wboUhzrKoss1PzOrH6Q0dMyce9XhN54BZygFuZK8emGfQxyRV1Me
	gt4ng3Zs6qTN/NTzbLak7/g3mW+ezsUTWVqqfvuiWU1gSgkElT05UAOXCQhS1hMetMsRClOIRvF
	GtdZsLJBGGztG9BGD1RWVqQXEIH9hH/QkodrWFDAxNvbAo+iePsc/ri1angJSwxo8d8Z/Ccs+QE
	k0dpfV3GMcQsNpTNH8ZHwd8lR2w54TBOjQUMi67Sg40jtXmiVF+6ok0
X-Received: by 2002:a05:6808:2e4f:b0:4ab:3210:b31a with SMTP id 5614622812f47-4c31d66761cmr3843900b6e.14.1789141848604;
        Fri, 11 Sep 2026 08:50:48 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c331bc937bsm2418504b6e.11.2026.09.11.08.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:50:47 -0700 (PDT)
Message-ID: <5a656a9a-afff-4309-9007-2fcb6d3ae1f8@kernel.dk>
Date: Fri, 11 Sep 2026 09:50:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array
 slot
To: Jann Horn <jannh@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
 <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAG48ez1dbEXQgvvAxchiiakym7KJntGFJ3f_obfnDwFouYZQnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 9:44 AM, Jann Horn wrote:
> On Fri, Sep 11, 2026 at 5:35?PM Jann Horn <jannh@google.com> wrote:
>> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
>> contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
>> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
>> the last CQ array slot with a dummy entry and make the tail wrap around.
>>
>> However, malicious userspace can directly set IORING_CQE_F_32 on the last
>> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
>> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
>> explicitly ignore the IORING_CQE_F_32 flag in this case.
>>
>> This is not a real bugfix, just tightening the code a bit, because:
>>
>> 1. the number of CQE slots is always a power of 2, see io_uring_fill_params
>> 2. the ring_region region consists of:
>>     - a 64-byte header
>>     - pow(2, N) CQE slots (each 0x10 bytes)
>>     - optionally, the SQ array
>> 3. the ring_region size must be page-aligned because it is shared memory
>>
>> Together, these properties imply that the last CQE slot can't be close
>> before the end of a page, so the "out-of-bounds" data is
> 
> Oops, sorry, somehow I forgot to complete that sentence, that was
> supposed to be:
> 
> Together, these properties imply that the last CQE slot can't be close
> before the end of a page, so the "out-of-bounds" data is in memory
> that is anyway accessible to userspace.

I did spot that as well, thanks for finishing it. Your fdinfo idea keeps
on giving, at least this one doesn't really matter :-)

-- 
Jens Axboe
