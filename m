Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476445;
	b=4xQoL1nahcfPzyZbt9iAN56SRic0DhQIdqPh3Ko8Tt+W1M4NzapwjhdwzJDuyz/eHsM4
	 A95D2hXzeWYG5xAq3352o3035IKTcPCoYgTgtfD8ToQFjc9K6vfRxHIIDzIEbjdqhPfRq
	 O6TLDDjZZTogRVk6fn5DaEsZvqXqEI33a0XrTusSqyxHU5N9vrYW1nLLopFxiRryEugD6
	 +WzUsnhjc1SvjOiivfqDG7P9rqNX1oW6wxwyICqLopCLFMwHvx3CeFcTGND8PCAXeAreV
	 M2VGU7FX+9BImZSOpp8wLPlPfigxL2iRrVSLE/PKiflZU1FOemivQLLbkQ1LYbTQYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hf+uCs+VHDQDVs3psYlyxaAnFaCOs7LnZX6+jXmv1vI=;
	b=OGYgRlwgS9hI1fyuVKRkKvv9nbUB8c2fmnBWQOENdkOX2/YjlPrv3eeXZmsaZ7HGg6gM
	 gxsG72aJ9+sU24NYjx11IzGSb6ZZsjU8oFhqTIWTgwulAE4qcI9+ldkYHvD8nThbfWU7f
	 JlTIoIkan7IrV1Ir03oh9VOfGPUtedtMKbUig625v1fOtQgwH2YkJ6cr+TxTKEIAEFOh3
	 k4XRNKEio+kajB3V/gOVsNVB/V9N4OBDn0fxh2xap9l3lZdFxsLxe61htCMMqey3WYFxJ
	 SB6VL+pftPxv+feqS/sLDFGcI3vTV8K5mC6KjTuYz74sDGr0QfD4vFBzC/GJSku4voA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJbOhjAb;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F56606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F56606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJbOhjAb
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so2449642f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794476443; x=1795081243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hf+uCs+VHDQDVs3psYlyxaAnFaCOs7LnZX6+jXmv1vI=;
        b=BJbOhjAbyHoUEoyh3KeGfUaafSU2O52r4CAsPQ5s6Ww0aw/Noeiloy3kxL391sJ2HK
         pfhm/Fj31A+egDJsjB/IAfjGbP5gP2mFt43WUaFWFKzTd9AkLEJtI87r6A9E3AfMnqn5
         vyHPwF5SKymu5mEe1AynP/P4Kg0o+o1y80vafiQZ1t1YmVbhrX2g/OlSvmVq75pgwN1G
         PWa3+wkFp5gEf1Ax3dkB4TIbS8FWE+ktQavOWD6JoekME2D5Ash1MAuMJJEyhim/k6Y3
         f8mlezsr030nsedCruWVxUiRrsDdFYg2MpHisD3EJ8qpl5UGlGgqC0+Xxv9nc9wYptod
         BBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476443; x=1795081243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hf+uCs+VHDQDVs3psYlyxaAnFaCOs7LnZX6+jXmv1vI=;
        b=sQJm21Cfx5yG20kb/0+itQtRI7jF250xaRp3+NOxebxNI3MZQXdVAP9l5pp3nBE3su
         sHxYxHFPEXMTZWCtW2pOz0CZXqrr+I1OXtylMEizYo4p++j0A9/VAlI4Qa1HDmaH1KhX
         OwwxrvpIOBnllbVF1ZGEee+TX/sPlanQU/aSwte/zCGUJXTubpiEhdkAkYxlFbUaBPfY
         ZICoipR2DpJoE35O+IlC9HwFzHbTmqwZgl/zuiR+lWPHE5VBHkntTDXy/c75DeSTqP9o
         R803C5jVxrdudvyZqhkqtg1U0nmfuVTmmoYaZYw6NwL5VvKJw1GdcYVoofm0wBf5Zmys
         P6Lw==
X-Forwarded-Encrypted: i=1; AL+hErFGsyvFIuqNi58mACk761X6LtHYqAnh5GNC8/5/XxB/dClkS1CTpM7nES7AiTtO4a5fhiUhBEf+sffPyF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VXf8I0aUcmPy9BvLhfWo182Ko8/G2H7s96d07FOc7LZKO2Ne0
	H5koZft+UROyfJEpGk9VhZvdlHaome43nBIQOIJwIXM8Fg2tXaWLD9m6
X-Gm-Gg: AYBFou058dth/s62rpipYzzoUP3Bg3Qk4T7JcZGx+N9Ws4Agb5XpuERugreUv9YLJMs
	CKDF1wFsRlxVL/p0Y6dQy7+tFFebhqma9zJvrJImeUkjkLl6OfzjrvgZNBGQWMcL6PtwUp2usCy
	pPRVYUNFMf0zut/hKrUg+AV363gSyru3RWwLfMXkTqRg9GPzPj1GfhbgqIHPLcG0Zh8fM6ZgwUH
	AengRwuu4CPhjgAOnCCO1Rh3/MKvQN/h5V0D1hXQ5WldBoigVLHxvFBs4J9b250m2hMwr6zZfXj
	atj3FBxSNlWFspjjG3Lb41vZ+0ajIf9kBvhEeXBn/NGeqke6UoAGfrrhmAOeb5sP6gdrz+f3iyM
	IJkzaDQTIK7s5WJ2hknMs5TMDSox715SzviSngzFGc7Ma41FpxLeyPknKl9CodcNQ0GfFVoe4m6
	YtsV5hFDe+WYlIdJSgHYJpjIKG1dZI+6kTvbJTiWFrbSZkD/6AvtygyWXbZB2evlVMp9/mTM8qL
	ygmC2nVNhSa1Gvwf1WCK8qaywS0LpAG5Q8731emeryS4M3BBIAOhHKvIgIwsaIUuys0joQpS4IG
	rLFAcvYEykVIliJLSjVRDTAE
X-Received: by 2002:a05:6000:25ec:b0:498:1d72:106c with SMTP id ffacd0b85a97d-499c764c9eemr7954310f8f.55.1794476443061;
        Thu, 12 Nov 2026 01:40:43 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm14867834f8f.3.2026.11.12.01.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:40:42 -0800 (PST)
Message-ID: <db9ed03f-0b85-4360-a2e9-f6719773c7eb@gmail.com>
Date: Thu, 12 Nov 2026 10:40:38 +0100
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
Subject: Re: [PATCH 11/12] mm/madvise: send UFFD_EVENT_REMOVE when installing
 guard regions
To: Tal Zussman <tz2294@columbia.edu>, Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Balbir Singh <balbirs@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?=
 <mirq-linux@rere.qmqm.pl>, Andrei Vagin <avagin@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Chris Down <chris@chrisdown.name>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20261111-uffd-state-fixes-v1-0-00713d368976@columbia.edu>
 <20261111-uffd-state-fixes-v1-11-00713d368976@columbia.edu>
 <avTA58zlxJZ69TB8@thinkstation>
 <e19f1fff-f1a7-4c2b-8908-2d3ee6a49069@columbia.edu>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <e19f1fff-f1a7-4c2b-8908-2d3ee6a49069@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 12:21 AM, Tal Zussman wrote:
> + Jose
> 
> On 11/11/26 2:25 PM, Kiryl Shutsemau wrote:
>> On Wed, Nov 11, 2026 at 12:55:19PM -0500, Tal Zussman wrote:
>>> On an anonymous VMA, the zap drops uffd-wp and RWP protection along with
>>> the pages. Writes and accesses to the range after the guard is removed
>>> are then not reported, and the manager cannot know that it has to
>>> protect the range again.
>>
>> For RWP this only holds if the range is registered without MISSING.
>>
>> The zap frees the pages, so with MISSING the first access after the
>> guard is removed is reported as a missing fault. And there is nothing to
>> protect again: RWP only covers present PTEs, and a page faulted back in
>> shows up as accessed in PAGEMAP_SCAN.
>>
> So this makes sense, but I think this gets at the documentation point
> raised in the other thread. It seems that to use sync RWP "properly" it
> needs to be combined with MINOR for shmem and hugetlb (and MISSING for
> holes) and with MISSING for anonymous memory. Is that accurate? If so,
> this should be stated much more explicitly in the documentation + man
> page. I see that co-registering with MISSING is mentioned, but not the
> rest of the points (reclaim, collapse, etc.) The example in
> userfaultfd.rst also registers a MAP_SHARED mapping only with RWP and
> MISSING, no MINOR, so that should be clarified too. Hopefully this will
> make it into Jose's documentation patch.

okay, if Kiryl is okay with that I will add it to my upcoming patch.

-- 
cheers,
jose a. p-a
