Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139008;
	b=z7iJtjDMw8ZgUJ51x/X/I7Ub6tvwwE4tK7SuixUTd2T7tkrtbrCSunS/PG7zuYGK3h4O
	 Yv3lMEwu88qxU2NkBIPayc0x2PjcCWJz4/RQ9wbSwSdrZwyQjMPYHb59kp+gZoIS2T5jg
	 g1A0Ls55VhIRcqHZHnpjlDyAS/u21q8fSQxDVpTOodSeSw5DojIL9ptEDyRolt1xOsVfX
	 iL7kl4HZTYktbobwo9CBX5ZoDfWbBc/1hSmlCl4gE6mlh2UnRa2VGTqfu9uqTaxIXON+h
	 kIXvdg7l/e09e3Rz6IBo6ziA6iyhK/FTkisWDAhANxj7LiNu7CnthRXFcq1Z+3u+KbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fT+qwxtE+A6GcMts/RFwLqPXWbldRP/ojd/gLikqx/o=;
	b=SMCuKadZJRIBJMGnxgfGAQXgG5cDxHBEKH03DP1pX4nCJwyDVjAM1YkWk9r4ychTJbER
	 54ext6SlxIHEcVRY9t2kdHS0akTu3ccIh2iFKFwoPpvqdrpWNJWovX044LXmrnQI4vApY
	 qvYqisAGIKZgBxi47Wd7gCXLGdbKnCWndH6YYqJC08Es3+2gSDklLwCy9eNHu8EWJ1YO7
	 qh12MAapGWi5h5hKVo9KMmVgleFo6iT+ST+LOmVqV3lE0CRS0g8W5z3y3ojpqQaDYEspO
	 /M/p/cCg1+Iz4NGwVhpNRPf3vNVFFgP8JohzWHDm73anPamM3sldQQi4igzYrcrBynA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eK1fsW+2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643D4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eK1fsW+2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso3389225e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139007; x=1793743807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fT+qwxtE+A6GcMts/RFwLqPXWbldRP/ojd/gLikqx/o=;
        b=eK1fsW+2JB+u32dztweW6UknefzXls1ygcl5CLm71Z1p1xr/SQRcK5omOGQRHtcZJe
         AvVkVl/9LOOkxYmhd1abAw2Mm8vOOTgZ1UWGFMO1pLl/MMTaF3XSy260n4/HfsRGpiBy
         JIpLGwoHQExszH0S+epY/KMiGEzSp37mYCQBpt9wYUat2ouWFbcsd5vgCRBiXuhzzqBT
         biomUCwj+SKLC4EhQNWqweICVG5qf43GhQQux8yfd9xRoCGPP2Xr8toiG51npBY3etq+
         zio8FAXRXAeRCiTxpt8NE+qiM7HLaqPjKUhzzFd8rnjlQKjHX04C3xjFWXiBKXVIV8vN
         XQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139007; x=1793743807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fT+qwxtE+A6GcMts/RFwLqPXWbldRP/ojd/gLikqx/o=;
        b=ZY84sQaFSyEQeiWGvhn6zmCzazBvAdKmO64077sSIY5mPmbk1YX7SypVwxuDNY5pWV
         AAmrFpBU4DCIGb70Fr26O/KygwzdyTbOFJgj1s4lkRSglY1YpYIObnw3ad+uQS1gmXG+
         UWVKmkB+RPDbEBeAh1rxLYlzcYwQu4pVHsFQhkEgxTXvCVJGerUyet007BPN4koadTxh
         oy3SioIrHN5J6jvSG0m8VytygbDXIc0vJK7t4SmMTVbpAX4gVNAK3Q7qYArm/wHM0aH9
         d7zlrTK4hWVOCoyno/jmVbEcA+4ReQ9wv77CDxetH75CtBv5bJMZh6XdhPjvaJ3k4iKQ
         1lOw==
X-Gm-Message-State: AFq9FYJAU6VDHxypR538noCtdd1Eh8O6t4hQjh2mzPbDAk37JQgvQC1O
	UKstR3aeFoH3V7Nxj+tsXdWFS5gchBSY3L/QJ4zrBbw1xGvZF/7XuECN
X-Gm-Gg: AYBFou1TOe4Ja5HSpCWl2pBncV8EWgUkr4rfLE3IoU+0m/Qj/o+8GSeW9XxLbev4G+0
	GPWSreW/dcYJRPiylkts+RJYeQh8TzY0S+C9GNmXOY3W6HFGaIpZm53+J8pM0JQKoqSbJeOvNUd
	yGq6/E5d25NnyvkWyCS8H9Ae3V6Xg4NaIAp1MG0whdKagwmDdfnVERqiSwggUBNSvYfaFfwhJsQ
	sM9t7FKR0QjNp3c+6GcRlCPKqrYgkIWmbpZpJ+gmeLkqgO9qkoeF1BYqEyycnFTzw5qthYwp2Mo
	Hdi65d7rNQSESIsgvp/YgR6lQxxFrYYKvyl+fTv6rPQMAMkW0uqzslYqVc3WDHrbBmXFw2booXo
	/LvN5tktPk3/912Ywv4dEQe+LhgnpMF0O2BlZH3+NWPpdwGxvS8cDBltQ8XlVjksJc80P0eMldQ
	RxZd8VXGkZQo29xEkQswYmftDy0889qzYnknyNmqgsMGvuTknRGzA037NayWbH9BI+nt3JRuj31
	wi/P6fNXGceW+xtsaw7SOG/Y1jdkWHMciOqiGvecOo33ybAK0hf
X-Received: by 2002:a05:600c:8b05:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a967202925mr5734215e9.19.1793139006789;
        Tue, 27 Oct 2026 15:10:06 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm24526363f8f.42.2026.10.27.15.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 15:10:05 -0700 (PDT)
Message-ID: <968e7fce-a027-4c4e-8a3f-79ddf0b2ba9d@gmail.com>
Date: Tue, 27 Oct 2026 23:10:04 +0100
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
Subject: Re: [PATCH v2] fs/proc/task_mmu: fix missed VMAs when reading
 /proc/PID/maps and friends
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Suren Baghdasaryan <surenb@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, SJ Park <sj@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, stable@vger.kernel.org,
 "David Hildenbrand (Arm)" <david@kernel.org>
References: <20261027-fix-proc-pid-maps-missing-vmas-v2-1-2791cc9fc95f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261027-fix-proc-pid-maps-missing-vmas-v2-1-2791cc9fc95f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 3:08 PM, Lorenzo Stoakes (ARM) wrote:

[snip]

> +	if (from_addr < vma->vm_start &&
> +	    vma_rcu_iter_may_have_skipped(rvmi, from_addr, vma->vm_start - 1))
> +		goto fallback_unlock;

the helpers make this a lot easier to follow than v1 :)

I re-tested v2 on x86_64 in qemu with KASAN, as in v1. So, this LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
