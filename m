Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2232942FCA9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183041; cv=none; b=ClYwVpJD5aLxIuZxSA1Ue8NV9CwKadOW2KQYXLcRsPXvAnUfpgqPqrwEQdc9HCSUntTb9GLqNMB1cMHMh7s2MdKOIP7HJeFRv9114R+iOfqt3YjGXN4bBl6/muZh5L9VucSytNnxTkOQEa3YWo515Vz/RPUpx0aHaiFtVTC11eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183041; c=relaxed/simple;
	bh=eAs5v0X4DQXO5Yp0nfjTElZLxyJMKOOQvrmCKjejTMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zp4uLDXIkqAWrmAF8viP8/vORCiYZYbbOcumeHpCaoVGNPxWaj6fYLdmdLr69oLHPub+Pk0qjmBuk8Y66fSeKAvjTsCUZ1luSFLFfkH3Cg0w7t/JjtV531fFYSCI9eYnP9/izhzm7yir71QoKVWx0o73EXEgISYdoQlR6Km2en0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QoJwjGk1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QoJwjGk1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1677c91969so330763766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788183038; x=1788787838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bclo5dNXV+6Jy1wwsMfxD1j5QCeC9PLq5D/ZXM1ZV+o=;
        b=QoJwjGk1lJkZUVbaTJ12PYABKBy7QxMBcy39riN/BPMnm9TwZ3W7fhwvSIiUqMUTjQ
         F3ul1vDx99QAH0E1c7niSi9sf4Axf4kLy1EyeRVq6ynJwD+XzbA4tFWCXXp42SrtxMPG
         cnkF5+ftKmIKEsPdz0jaqkj28HTVMTPsYTQTPsKb/ZjoG8I684rCN9Z4YlLdIUX6MhbA
         5c9xE6j0XgI0nph/mpRxPBGbrZLtnFyIVmKdqMrKi1xM5sCxvWXE7H3H1b1Z+Pa7FvCj
         2Roh0gkWAWMlXcWyzC9BzGVYtefXxYbDDZPkplTe9Vmg2RPyaUe31hPtcTTRYd5rQQWe
         Eh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183038; x=1788787838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bclo5dNXV+6Jy1wwsMfxD1j5QCeC9PLq5D/ZXM1ZV+o=;
        b=R49tuFGctxy+UidNcDnpaEOH4/x8JlxUMx8py4qWq8keiXi6EAuDv+6NXPfFxXvvBF
         SJbPA4s8QG9wFpOtu1/Z14naDzZgRX8zf1ZPOuvmwKrjMMGwNoDZsQwfMAZ45sgdDDoO
         M4NjhKtWPhSpWbNuoaKYxgaLiu580ncTGLwdpQe7gIbHI5+t5pP4MAhSsTn3Sa+sPngR
         yWZGrUiQ3LMSXilr0QLAIeh9EOBstRyKxlB+vYhJ3jgQoS+tw9YpFF/PSQzhyBtj8Qoa
         ZFLsLkTFiIUKnFh98+SDZWCN63Iq3Iv8e8DynE6t+3Oqz88u1+avMMVWTdUcD4GKLNC7
         E5Qw==
X-Forwarded-Encrypted: i=1; AHgh+RpXwMoQEi669XfW2kzWWRhLAuvn0zW2kbDNYoYViPt8pMt7/Te2Bf4mscD4yRGbgpfPq0c/DRg9pWFPZ3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lO2jKQsuFwKf4ofaOTEooEu0qZmIvlvbKyKE+1L0LHiD2yKqSF
	QpXa1vVMQ5QCAYRAK10KX6PHjMaw8+sZVaLBzNCikRoP+kF3eETGWueYpxHGXjMrVro=
X-Gm-Gg: AR+sD13JsbNMA4hzo5L7Iem4zBUHptJZS4k/Rgt6khj/dxTyb/88utau61zQheTyUy6
	J8qiC+VSGUzKsxVVnj13I7dHZ/qhEtbRCgTJhvDyWK7DY+dnkcNwXQZp2iN0hlCoDH+HRL0+NqA
	LeHf1LLh006UrsNvCBvdZDDEQzFK3eIXn29eeHZUM2a8sH1t9L3F4bIOUEodIaYIT6R5ruaLHNS
	xE1rsiGa9XKYuBRGAXROH92RlAiVCY+IRUXOKgNjSQ4JMQh2bJYFGzi5coWl3yD1koAfVi9F7Em
	QUc4/zM5liuoXG2m2mNRiCBm5066bQZHe8hDf4gDwYOnP/lN6JVFVxwfpGkITfgjL16qF1P2sxw
	h2o9u8/2ynWTIK3OcRnKLnJurF8xTokO4ZyKplG/jYI1TBs9xo936PxqHpz75Jf0u0/jvjw3rxy
	qRL1iHiPNN7wYG5udBQX0sya9epyo1id+KR+po2w0jUSe+1283XA8qZm3+etdDhoBg4lVuvGZfK
	7/a0rq2erswqnf64/1cjWqR
X-Received: by 2002:a17:907:3cc2:b0:c1c:5aa1:de57 with SMTP id a640c23a62f3a-c2557030696mr1575327866b.13.1788183038289;
        Mon, 31 Aug 2026 06:30:38 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b233sm435317266b.11.2026.08.31.06.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:30:37 -0700 (PDT)
Message-ID: <5e6231aa-10b9-4c41-b7ab-dee5e8f64bec@suse.com>
Date: Mon, 31 Aug 2026 15:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] arm64: Allocate .text and .init.text together
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20260822135323.795946-11-ardb+git@google.com>
 <524b5817-c097-47cb-b301-4a9c0f1d2947@suse.com>
 <cee89666-9de0-4012-b665-69da3846c5ef@app.fastmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <cee89666-9de0-4012-b665-69da3846c5ef@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 3:45 PM, Ard Biesheuvel wrote:
> On Fri, 28 Aug 2026, at 15:07, Petr Pavlu wrote:
>> On 8/22/26 3:53 PM, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> The arm64 module loader has to deal with a couple of corner cases that
>>> may occur when .init.text is placed out of direct branch range of .text:
>>>
>>> - ordinary direct branches from .init.text into .text may require the
>>>   use of a PLT entry (i.e., a trampoline aka veneer), which means not
>>>   only that additional PLT entries need to be allocated for
>>>   cross-section calls, but also that .init.text needs its own PLT
>>>   reservation, as the one in .text will be out of range as well;
>>>
>>> - dynamic patching of the ftrace handler into .init.text code needs its
>>>   own dedicated trampoline as the one in .text may be too far away.
>>>
>>> - recent compilers may omit BTI veneers for static functions that never
>>>   have their address taken, and so additional veneers will need to be
>>>   added to .text in case cross-section direct branches from .init.text 
>>>   require a PLT entry (and therefore a landing pad at the target end).
>>>
>>> This is unfortunate, because it is actually somewhat unusual for .text
>>> and .init.text to be so far away from each other: only when allocating
>>> either of them (but not both) exhausts the 'near' (PLT-less) module
>>> region, the other will be allocated from the spillover region, which is
>>> not in direct branching range, and therefore requires PLT entries for
>>> cross-section calls.
>>>
>>> This series addresses this wart by allocating both of them as a single
>>> chunk, and freeing the .init.text part along with the other init
>>> sections at the appropriate time. This ensures that the two regions will
>>> never require veneers for cross-section calls, allowing the arm64 module
>>> loader to be simplified.
>>
>> It looks like this should also be useful for ppc64, which currently
>> merges .init.text and .text because keeping them separate would require
>> stubs between the two, and consequently .init.text is never released in
>> modules on this architecture.
>>
> 
> Thanks for the data point - are those stubs needed when there is some
> distance between the placements of .text and .init.text?

Yes, my understanding is that these stubs are primarily needed because
the BL instruction on ppc64 can only reach a range of +-32 MB.

Another aspect on ppc64 is the use of the Table of Contents (TOC). In
theory, when splitting .text and .init.text, one would also want
separate TOCs, along with stubs to support switching between them.
However, I don't think this is particularly feasible. As far as I can
see, the ABI and GCC don't allow separate TOCs within a single
relocatable object file. In practice, it shouldn't be a large problem to
keep a single TOC, even if some data related only to .init.text remains
present after the module is loaded. Being able to free .init.text is the
important part. On newer Power10 with PCREL, the TOC is not used, so
this issue goes away.

-- 
Cheers,
Petr
