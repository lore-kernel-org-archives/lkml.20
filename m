Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853359;
	b=ow/hd3XT/bN+jP90Cq83x5EsUB7p3dyboaD2UisDA9GUcdZy79rlBoIqG8avOGoDE18B
	 h9NK2Yho/PJ/qYukCbUlKUh8jy3hWg2ABFfxjVvnmf43RpbHqxDw3igQ6JliKrBDeQcvy
	 6/g3G7lPOFOjvqqzQ2kE2e2roSHIKAPBVRiXbTd7Ga1qQldqg8S0S/ho6AikKEPEhwzV4
	 fQif1oyChxX0QCsfGybAlY6LX+lVpdY1bDfc/F5qrt++vVOcPltlT0YtcPjfkqxZ2hy3t
	 0MeWZ2KFrliomK2UrduJAS0sh7BzKODs7MKKPeqFD+7WLn9g1TEzlW03Y+19pUMUpGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=MqhyZLQkkCy8/4ClTcekh7qpvqyyl6/PFl4tE1ESvso=;
	b=OCTaGL/lxBzUY5i24GdF10rSRVQOLyve9O1QmIh2omWXoEmZoae59l6CTs6U0ND/gTR3
	 F36L+s8SsPbOvctCVq1q+sd5/hksH0jmH4MzPJJFnqybFXJxihoaewylvCX+E8zRqJuJ9
	 uFLIXa/pIfnh1ukclpuj7aoqzoGVk/qjICxelxaXAt1IysEbEGvgoO4yLkn5p5sIUNgIC
	 wRAhmRSQxlcbmNxS+m3LjvB7yoFkyMBKXQUvcTkAsbxpqQBz4sujuX/6TJPRbS5FGJsED
	 /PQIMFKM5CTaPbyx9T0jKu+awsPoQcpyFQfb5SQrTtBBhqr7nzvY1MsN/sr435TcQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=I2P8n3HM;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AC3606A897
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AC3606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=I2P8n3HM
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f1e5d7450so462727885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794853358; x=1795458158; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqhyZLQkkCy8/4ClTcekh7qpvqyyl6/PFl4tE1ESvso=;
        b=I2P8n3HMzvp5OKzZYOywUkl/ozYHK/CE5fFhHOEnWVWSF5Hs9PV7EqrjZetfF/5b3n
         UNY0wMypHqtMSPepRPFkLZ5Q+5s94MSzWnT2fIz7EhrM8VBiiOjlUdMLUdBZRUghmRgx
         3BgqQOrjVqwxBoE88tyXgjoTG8xRjAdqhOkIhTUPThw3aPoo2K/nFb4v4lBsDH1Md6dN
         O32jBFBsWEmvw8yW8uDJQl6YzKgWF8vJrF5z456xn7mnX5GNbYB6QJQ9vOwT5nweIA2v
         BH6h4rocb+/H+baHciMu3epiiArYA7Khb8i8FT0J/LokU6MSt14VZp84+9pNlLLkBaNo
         /fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853358; x=1795458158;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqhyZLQkkCy8/4ClTcekh7qpvqyyl6/PFl4tE1ESvso=;
        b=a9OmbfWczdL/2qji+eH2Ye9B6u+MVL5TB9+9g08U1F0OfD13bBv56EZQDclesrKK4r
         e3pRYNNoI9o+ognLPu1SXfWxNA3FexNwjyxapiqaEzpP+rKeVbzo1pLQID7EUWTryaS7
         YGW9St3zuwOoMV7tqaStbe7Cf/5Pb2SBkNLQL9cg4Wt52HqgrbE4r1KGA7gydCxpk76m
         Qli1zZxt+rR4hQxXeUA/52EdID8kK2zj8of/ibzQZQlPZcEKViidr7F8H5Zm5XHwPpm1
         MED/1gxxuBQoAuYFCVLJz/Oasbr3CP5jZy281CNsqgBFA0gCegw656wrFEI6Mt0amdzK
         NPtg==
X-Forwarded-Encrypted: i=1; AL+hErG8vA1eo/ho3oCo1VolcghMrvGRnqmAEjShqBiyf3mAd3C0xHrPU+r5WnQcKdy5Bv6taHOTkXWf981VZFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+otizxyftPYCnBpXT7oRJuf3ilenxEyuFtZRU9fU4jQhcxgMAx
	izCQRPIhEJGNrxoZANR29M9T6CxQAvNJONWL0QBSj6mDrkGj42K8ofrkRmhOm4W7sa0=
X-Gm-Gg: AYBFou0VHx1mEsxqe7JEvMykE9JdjAhjxw9upiSYMTnBzBrY7XxAEd4MRqtlIMF2hyv
	JFTeSqc01wkwSINx+apts/NNcOZJ01h9DFC8yF54/nRN+qsRHWPsSSxhkcKB0dVi1ICPWwVyuTw
	kvOxFXKL4ItDSwce1KSuP+6OUlVVxkdyLDLrOMAaIGAWHJoxdlMQD137yGKkoXuodqqaBOG3VXK
	GeUnvxUr3SfjLNhq4+ISk578rOAg4gO9TBRXfMsJj3IUYCRo9mkT2H1gPcdSaMJePxiEfiIHjlk
	LJ0BiLjo9tHr/f0xfZp9co7HHd6HeH4jHaJ1qdSI9+w5tfEkW6JcvgH7g/cG8Skieqg7AGKTQNC
	EWPwb1PXKC4xqUQPdcK/k/M2qFWNTVlLgaMOcsX3rDrMdCfDlE8SvLgRPErFQN4q9RuFI6nnCTM
	yjRcJ6Tsf+EOY2sHAv5hhbp3p/oz1sRmwzug/DBaPJb4tbv3dV7rZGCDneIOjfwStbbDyoM+3Vi
	1llndCMNe9lvT5F9YrNy8GLIb5DxyfV112YQCpF7keHqwBX4VVjb3Lqy2fBUsQcD/60RQ8ocrh4
	1WU6v6jJKFDpfgSi0lCzStHOSlmBW0PwtjUHrishKZwx/JLe08PF0GVoVNd0l2CMRzjHuQeg2EV
	h8c5t7Hs+qm3PXL0suwLD62xDcjRM
X-Received: by 2002:a05:620a:4111:b0:93f:cbd:8e20 with SMTP id af79cd13be357-9494bbeb2cdmr1788283985a.73.1794853358208;
        Mon, 16 Nov 2026 10:22:38 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836f6dsm902791285a.22.2026.11.16.10.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:22:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] mm/huge_memory: only compare PFNs of huge entries
 on huge fault insert
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
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
 Michael Kelley <mhklinux@outlook.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Eliav Farber <farbere@amazon.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261115-huge-pfnmap-fault-races-v1-3-537605643f6f@kernel.org>
References: <20261115-huge-pfnmap-fault-races-v1-0-537605643f6f@kernel.org>
 <20261115-huge-pfnmap-fault-races-v1-3-537605643f6f@kernel.org>
Date: Mon, 16 Nov 2026 13:22:36 -0500
Message-Id: <179485335600.482102.464304486749600271.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-15 20:58 +0000, Lorenzo Stoakes (ARM) wrote:
> A driver that implements both ->fault and ->huge_fault must anticipate
> concurrent use of both.
> 
> This can happen, for example, if a user calls prctl(PR_SET_THP_DISABLE)
> concurrent with faulting, as that only holds the mmap write lock and thus
> does not exclude faulting threads stabilised by VMA lock.
> 
> insert_pmd() and insert_pud() have issues with this as they both assume
> that, if the page table entry being populated is not empty, it must a
> present huge entry.
> 
> This is problematic as if it is a write fault, it compares its PFN against
> the one being inserted, warning if they differ, on the assumption that the
> entry is a huge leaf.
> 
> Since the entry may be a page table, this is invalid and can result in
> spurious warnings.
> 
> Equally, the entry might be non-present. Nothing can install such an entry
> in the VMAs that reach this code today, but there is no reason to rely upon
> that.
> 
> Therefore only examine the PFN if the entry is both present and huge, and
> otherwise simply return VM_FAULT_NOPAGE so the fault is retried and handled
> at the appropriate level.
> 
> This is what already happens for a read fault, for which the existing entry
> is not examined at all.
> 
> Target the commit which introduced the first driver which both mixes fault
> orders and passes the write flag for the fix (since this commit, both
> drm_gem_shmem and panthor are prey to this issue).
> 
> Reported-by: Eliav Farber <farbere@amazon.com>
> Closes: https://lore.kernel.org/all/20261112051440.16140-4-farbere@amazon.com/
> Fixes: 7bfe3b8ea6e3 ("Drivers: hv: Introduce mshv_vtl driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


Tested with a similar test to patch 1, but used QEMU's virtio-gpu device
to generate the bad condition.

With just patch 1 applied we generate a bunch of warnings, while this
resolves those warnings.

Rethinking whether any of these should be squashed, and maybe not.
Really i guess patch 1 just mask's the bugs, and patches 2/3 fix them.

Either way, change looks straightforward to me.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

