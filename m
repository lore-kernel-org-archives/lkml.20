Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962165;
	b=XUee+/pZS6ssv9SIsUKtq3O0yefPNG7bKTB5TuckmJfKDzyjRS0BNrZTREEDEMa6gpHy
	 Iog9z3gTzFT/cekUjPan55e5gJPUyBWHzSZLYPH4uozq+TyGPCKMYQTTnBGTsz2Oo1joN
	 8ZZEbOTp8Z7MRCI1cyq5K5T+9CvIw4rGTLcaEO2l1eD2Stc2z0mGfbmts+iK/SrKqeLmT
	 r7g9DnIIxoKxfpAq2IFKp95z5lm0AesFZJXIVBVjjDZiphVweyeECW3YCc6xx6U6c0IL4
	 x46RtXLiW100YDPazm60MylpblAJN7Gj9fUB7NRuE+W353Vxi30NfpA22/WL4124m+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=n21l4rAHkH6encd8aStoBcV6YaH3+037KdgWxZqVYd4=;
	b=1PVZgJx8edZS98u0rQg7He5lws8VmHiJjyQHU+e54Kr6OWfC5fr1D7WdJyJ4j0lyaGCs
	 V6LdJJRUTKKbFUrpf0CCZmj2hV6uqdkYy2lvnne+4aVK3AuPf7eNabk5ZQt2zXJFD+Pjd
	 kWc/8cJtutn8wtPLtz/cW7qk7jc4XtPzra3l2R7n6itpvaZYB1J0ikdz2h7wng2vYbJ6X
	 kizbhtZQap1x2qX5r5lSWBPay/cDjTvVSJnGqveR/iwJw9RzBn34Aut0pcJKKDtL9uHIp
	 j8PJwtItjUGo+UwX0l0KpCqjjF3I/6fGBaqnAV/YyxpB05ONQLSEyOG0lJrpkaaO6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ded1J5dR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B712606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B712606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ded1J5dR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4574625e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962164; x=1794566964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n21l4rAHkH6encd8aStoBcV6YaH3+037KdgWxZqVYd4=;
        b=Ded1J5dRchaGyXOPHjr+bKs3LDOkr61JRsl5YDUrTVhPzdz/5ZyDaKlolLtwYYLht2
         chex9UJ9izr7kbUu79ISH4XuRGhbGHxeTFGFM2psCbepMLVlmF1GbgxkRgKg4qD97e9l
         36K+GNkwSmwF9gDnrwgbg+OgKKzc9J0shHdK16BlAKa27PlREjKcGcJOZoFFEsXxhMNa
         NsDXtJMvEfHO/v7z1sbb/i6Q/nO9iu6taPsXOpSihe3gZ0BF1P50h3IAw228ez+ZTbOo
         OGF0kzPwRP17ytsZwMpYJzxf1crDJ7hsRyTIqrV6SPqV8fDd38rmeRwGtVnlDfBrfSrs
         xalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962164; x=1794566964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n21l4rAHkH6encd8aStoBcV6YaH3+037KdgWxZqVYd4=;
        b=qZjJEsjc0j/eLuxCoNL01QiQc4JDIn/0kbkLGRYaCsMjJFx3hAxRH+svTZzapM5BXU
         pK/sRgsyY14olstQr6sIqoltB+j4c5m2JtO6OwAvcZzbFZT4SvUxLX4jp4puJPAp/Osa
         jJRisjW+0VDGIsUFHDdst+LWbvWG0fklkjm/XSsY2PlJSkXGEXeieZUo5JBPAMCwMLVi
         RW6hQkROOfhXHVk8pDAlDtFOnJ7qQJPstwN6TZ4UDaJ2NZy3p1YfkZyCW1j3BnOlYL3T
         2PQ9W95rj+HW42o/tgl9iMweh7B0bng/sNG57Fd1vzNEBY4VMM2KJGpCiqxG+2LZS/GM
         qMuQ==
X-Forwarded-Encrypted: i=1; AKwUvByF7qHRodU0dYsSEoUl5n3ZT7De0ZkaZW8mbAb69pzR2ouqM3a8QzCnHvDDd20ICbajmyBUV6gJarMLgfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y83UKCb2E32qHNb7y3GWy6JIlmOFXJdUyIXgVBWm1ume/gEen
	wjXzZP71iQXFObim/oPDmrYj3fW8qtVu/UTMgIZHTDUrffCFVoFAt35cuW9xhHKOPro=
X-Gm-Gg: AYBFou12yhrwT+FCfPxmXt2sjPuQiExB9x6NmKddJWi1SDt1HNYnpOlu56hSQ/j5IPS
	gbeKvxwI6HUn9dy6qRwvguMUfVoupOD1mcWddqiZPzS5dLjjdqxprmeEyJmdW3S5ymyagUmCS0D
	j+yOWE4PlRUxFBYn2fw4u5tQ8bVOauR0IRMVAiaJ7ETGiOSoiUm2Lev4m6KM2pDmcKQ9GaVpqkT
	5EPFVpn2wevo+DiC0QuiJMzgymHAs1k/eV7azN2gkK+soI60QeOyGbFxiNlLoa5pX7hWj4MIGLn
	liAsullkJb1DWsimaJUCvj6uw1QzdCqynDqOx0eXl+KZs0JzR3dbGVJY/JUNaHqNlQJXdBTpPKG
	tDtinOtuiZcX6vgSaRuPJFNRlki284uVQ4BYWYX2Ek++qNxVsLmNNs0IIvT01T9IBtKmnsVVkLR
	TbvD585j5KCVvIRTH7hWsM2tFTdwJHtAxh+J5dZuO6aUxGJh8M+iI/9plzMl+8qAyX9cBwwETcM
	vu7LgxapZLY+jDtv482KqL/F/qTXDnMjBXJ/C/EZ6bd+4oADVwnAoH++nLegUx4Inymg+m9iNmB
	eDLG1l7bleKuO47hGjF904U=
X-Received: by 2002:a05:600c:5295:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4b6de973c5fmr32952175e9.6.1793962163759;
        Fri, 06 Nov 2026 02:49:23 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e24012c3sm46488775e9.13.2026.11.06.02.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:49:22 -0800 (PST)
Message-ID: <1188802c-3661-441d-85a7-3ac68042e022@gmail.com>
Date: Fri, 6 Nov 2026 11:49:20 +0100
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
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <551892bd-d7ca-4c79-9c7b-9d3d08c913e4@gmail.com> <au2lAPUNPlRtaeFY@gremlin>
 <5c084ac1-930d-40c7-b6d0-b56673da9cf5@gmail.com> <au2sZrlidH_f39kL@gremlin>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <au2sZrlidH_f39kL@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 11:33 AM, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 06, 2026 at 11:29:00AM +0100, Jose A. Perez de Azpillaga wrote:
>>>> with pages_to_scan below 4 the batch is 0, so under constant contention
>>>> we keep dropping the lock at the cursor and never scan anything, don't we?
>>>
>>> This feels like repackaged AI review...
>>>
>>> The mmap lock won't be eternally contended and if it is, with pages_to_scan
>>> under 4, I think that's fine.
>>>
>>> Alternatively could make that >= an == and the post-++ a pre-++ and the 0 will
>>> never be hit in this case.
>>>
>>> Or could have a minimum cap.
>>
>> with >= a minimum cap needs to be 2, since the cursor can stop at hend
>> inside the VMA we just scanned and the walk lands on it again after the
>> drop. with == only batch - 1 VMAs get scanned per cycle, so a batch of 1
>> scans nothing, today's batch-0 loop at pages_to_scan 4..7, and a batch
>> of 2 hits the hend case. it's safe from 3 up.
> 
> Please don't copy/paste LLM responses. I'm sure it's in good faith, but it's not
> helpful. I will run any changes through AI myself.

it wasn't my intention. I am bad at writing reviews, so AI assists me to
reword it, so it's polished, and I still check all the output. now
onward, maybe my reviews get a bit clumsy, and not polished. I will stop
rewording them.

-- 
cheers,
jose a. p-a
