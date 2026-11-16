Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825423;
	b=est07EYpVM15vvcRQ9Pgl+nJLiv9wBS2r5tGyBwoEIicDtOefHjxFKSGjqI1W/Ve+378
	 QfkOMMmGhD+mOwG96j+uLBgdP7RlDWL3PZ4m9PqCppQB3pNO0cB48m8Jn6fLdeLNV5fOV
	 zCW+dZPDoOFDU/BIQIXvWNIm6WbnBzsroz+Lgget8ylq+aXtXjLTL/kK8Iluo7UCsoOBJ
	 rmHtRiK7bCZ0uyy0+Cqm5I9GkAiHRg8jNdAW29IuiH9/zCK2eJttkMoF5lHa0VBtrScfk
	 +X1k7M+BUBvnr2PzlHPbg5dkyMn5dA3raA+IHY5CF9bvZzAl4YaW7HwGUkNGcnBU3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=j7rA6Xl71xYXKV83hCBQM26oVzIZlY/G9Jtv6N99/NM=;
	b=XoVjA1V7eubXKrg+SHBn/v99FZ3zA20wdJXEMToI3EtEQaXY8TxkbEiRW2yLwFb49Lhd
	 M7nyYYKcAr5GQRG6o62aE0xzKYZYMCkFt06J1Q2XGN0+2jaagUdV93btcpm3tZe9aGSfF
	 gUClnFqRIRDrMqeiatWhenPCqUd9NujTrSUpo3gjUjlontdXw5WMdqByQrnQ3u19saaEb
	 WpVN3mJxb600iQj3DMAFwrxdAJ6jdRi5O7+AvSCoFR97LEM2QGvaY+yePxlu69+J/mEe8
	 V1v3C+0bWpBD8NcL0QrLtAl3lbTES8I5xW7RHICHglPstuS9boGk0bzuWZDWdvA3/rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CYjpqhem;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E479606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E479606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CYjpqhem
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso21513005e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825422; x=1795430222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7rA6Xl71xYXKV83hCBQM26oVzIZlY/G9Jtv6N99/NM=;
        b=CYjpqhemh3mP5y+Xnc7PPARwBfwvseC3AsgJ40oTnEQhLKs78Yays0/ohg4NCCoOQT
         3Z9FE5k0yXuYxk7qk5Oe64I2JRJNsqEEucSuvb8XZs1EYAdOZ/9JuhF/JoEQpoJvGjR7
         yq/IozEtyuNQJgmrP4IKMvOdj/LbgvZ0vGg0ioa3vqLooeuLwvP8rrmt9IYQxW39jRmX
         4hiaMbLFAoJj3c/s7Z/RH0pt1PtK7G2tPd1C+OA8xws5pAdhN4/ViuHS1k1hQ9T7jvqH
         b4aVaGHlc7HBDuWc+0lt7jCNEnXITSpRaJLXobpNAp/2SnPIjbZxWlh1yey2BWVgj+fp
         vOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825422; x=1795430222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7rA6Xl71xYXKV83hCBQM26oVzIZlY/G9Jtv6N99/NM=;
        b=atyr/gRQ3m/Zu6LIFRuGYHRA816h0mplEFqC4SJqKepseD3KomtYH1TNPceJ18tZJv
         3J9/zE9PYysNOOCun33Co+vGjUO17WlCX0Ncn8Za+FFt17dezx72bL69Nngbjlt+8J1P
         80KrM0lfoLFJGYZ4Uc8L7RWTqrSjmZNd4a6ysQ61WNusQZbMW2LcLiG+nAua36iKg91w
         ovbW6cb8UtzB9Bswv/3WN6Si9XGSZV1rM1YNFir5H+sI3wJ33TCCcJ+c4z7z9cqsTWtH
         mB+NcPT5xiTIA1xNbmI7YGs1Nbm2g84hBikCQWfD5CMrKzx7cEoRFE7YkC0b+9pruQUL
         hTjw==
X-Forwarded-Encrypted: i=1; AL+hErFxWeW2Z3u1+LXjdS1BIg3giFXwXpPY4u6Pzij7tTTm/8m9VsE/Gr57Unor9ANKlD5BeLP5oMEI94vpIEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GqwOxSAdWqQOfrxl/EjhIcVGvUxfqzCS5KqJMy4Q/Td8PUYSf
	FldMiNR8B/xo6th66iAUMbakwOUPJfsfpcIMzkhoSoTMFO8HBTJeBgij
X-Gm-Gg: AYBFou2Ar9BjzwxP9drNP9L6wKY71YrEuJqWFU63xIRXXvWuRPsu+s034SwJ4j3+Q9U
	0LoebIpSCOGw2g35NGOXS+s6bAxU/CudNPKAxNza75faIBZYrw9VZt01Aq6E8B8YkxON6N4xkEj
	5MtriDlu3pt3p3+G/TGWfa5TupMGATPRLbggnlefW7g0e93guhJLXYVYCyFHCM9wRSi87F4UP8D
	Q9GIY3b2EqoKqaCZ6z6HzXCw81rnDmUDmycSt8CKNjve9o2DPRCL5dz+g4vYLp3V0vyj8g14/+e
	bFgVQ0DSeAuTC4gSJA/KikCYNOLeZKwsHdseKKMXNJgNs6h9oOdzClVwTxfKdMnZN1pJnx/jKs1
	m2A3Ns9Oimb/ZvWFATKDc3l7so1pEAj0phj8J6mnB2jWs0BWt8YiFFinw0n0t9RqTla5TpGMniD
	kWYs1LuXTLr1zEG5bwsxF/PqgseQkbAKu5u9XEZKlDOAFXuGijTN3KogVI379tosiW2boW1UrFq
	p+ioUCxykYgenQpfE5T9NFfYuwWfiEGZNoSRSUrLbsvfAUacj1CX/a2Bi9J/0MG6JtAYtnimO7F
	jcmiWjYxeRXtH5jIS9A+6+qK
X-Received: by 2002:a05:600c:4e56:b0:4bb:7292:b871 with SMTP id 5b1f17b1804b1-4bb7292bf16mr53530855e9.14.1794825421700;
        Mon, 16 Nov 2026 02:37:01 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm294131895e9.15.2026.11.16.02.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:37:01 -0800 (PST)
Message-ID: <fea564eb-eafc-454a-a6ea-877d5285ef0d@gmail.com>
Date: Mon, 16 Nov 2026 11:36:59 +0100
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
Subject: Re: [PATCH 2/3] mm/memory: do not report OOM if insert_pfn() races a
 huge fault
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Naman Jain <namjain@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org
References: <20261115-huge-pfnmap-fault-races-v1-0-537605643f6f@kernel.org>
 <20261115-huge-pfnmap-fault-races-v1-2-537605643f6f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261115-huge-pfnmap-fault-races-v1-2-537605643f6f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 9:58 PM, Lorenzo Stoakes (ARM) wrote:
> From: Eliav Farber <farbere@amazon.com>
> 
> A driver that implements both ->fault and ->huge_fault must anticipate
> concurrent use of both.
> 
> This can happen, for example, if a user calls prctl(PR_SET_THP_DISABLE)
> concurrent with faulting, as that only holds the mmap write lock and thus
> does not exclude faulting threads stabilised by VMA lock.
> 
> This is not currently safely handled by insert_pfn(), however, which
> obtains its PTE entry via get_locked_pte(), and treats a NULL return value
> as an allocation failure, returning VM_FAULT_OOM.
> 
> The issue is that get_locked_pte() also returns NULL if the PMD entry is
> not a page table which can happen if a concurrent huge fault installs a
> huge PMD entry between __handle_mm_fault() observing the PMD entry to be
> empty and insert_pfn() being invoked.
> 
> This can result in VM_FAULT_OOM being reported incorrectly.
> 
> Address this by proactively checking whether a page table allocation
> actually failed, and returning VM_FAULT_NOPAGE if the NULL indicates that
> we were raced instead.
> 
> The same assumption is made in insert_page(), however only DAX implements
> ->huge_fault and can reach it, and it serialises faults of different orders
> with its own mapping entry lock, so it does not require a change.
> 
> Target the commit introducing the first driver able to do this.
> 
> Link: https://lore.kernel.org/all/20261112051440.16140-3-farbere@amazon.com/
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> [ ljs: rewrote commit message, trimmed comment ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
