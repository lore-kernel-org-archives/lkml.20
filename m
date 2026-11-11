Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416064;
	b=m04tQxn6RkvboiGT9GrsJH0NWq8w4Ex8odAgheSc3QE4R/UixiRHG4V0yPWJ39SHokGR
	 kOErH7D+C1gIH7KUxKgl+9DKC8CAEwC+RvJe1IJpjEnJPPyiD5QxIvWmYo/LSm/3sGCva
	 NR2tDyqJ7gx/Mj1K7G63/gN+KwHe39FWjgilQv3sAu4k8YchZSKo6/9TQpN6SJpYABCj7
	 84qkDCvUIE51tHNQYRT0FW7Ha8GeRpc8N1MuTmkUW1V/SEDWL2mDIpFZNfTLGbSHFuq8H
	 wbGEK6cdYZe0G0Rtv5XCE7IX7pJpDqDFahjN7A7QMHxrhB5MH628Tft+xBXIr4V8FYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D0NO6skQHrEQV9uToLezs2xtI4SoBkJ0aZ39MACRQvg=;
	b=OzhaPRI1adPFT+h3Ylcmy/nvRPp7vh8PkP+AbsTUl+rQsNWLvb88mi9mP23rpu7FU6wT
	 iDrMMBd07YC9a0nH9RWqbERdtaMEQ7NIQChgQ5fILExMmyySSi/AkBlMoFk6C0iYSIgEf
	 L8pQMLtQyPKfdsdDQUZBIkvZHYSAb3N1BxKQWfYElApAtrviBo+aUS+xthpiY6C8h3LpQ
	 w5SuIua2T7HzCu6zIKKqTCOWMMs7sQWp9DlxoZiEk5G6zaeJ4hfx9lohpP0fjPuBm2yjc
	 z5w38PF+tsna5nPULzvepPMyTFgB+90PtBjzlsvOkzpUbh7EZ4IaEf5Mo6sYxyUvOOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlwWsSkI;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB44606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB44606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlwWsSkI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so28748175e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416062; x=1795020862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0NO6skQHrEQV9uToLezs2xtI4SoBkJ0aZ39MACRQvg=;
        b=QlwWsSkIZl0vvIKluy+DkcxLZO1k9lLS24jfUQ4+F+GlaIh+F7zrk/OWJ/DC40sj3y
         zzNNN90JFGfbPCzIWQj65GatwUhQ3yUQ+Ey4kahKYJjOtq5QJO4crkLKyaExwPSQxPqA
         LLmbCygnb0g86mLIVwvl/xW8AcBHTRfrtjLM/AO+Ovxay05N+efDnXtrZxIitt/iUeWj
         +qcsoWxW5lbE04XGPeHRx4mZH4pKyuqt2ydTnCeV6H0pGP54xgHkp3zn+IptBeINd0xM
         5GATYXWPNAew2Vv4Utv7t+dJEKudI0qS+IIRSJU3PjGmvdY5JBB4sYxwh8EoKAKWkhNI
         Ep9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416062; x=1795020862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0NO6skQHrEQV9uToLezs2xtI4SoBkJ0aZ39MACRQvg=;
        b=LnDnBmsuuRmnQ7hPSGapcpFt2ftJ4lKgcjj+pW6mbOiwku5mj4pxmPwoI0/7XF720C
         C/Q7aTvf1p5qR4ut4+x3NzrlRqwyw5mVlONqpjIABWD1ji07SWShZftNBgnHq7zglMUy
         PJAUQDOJoRBwG6bxR4TqjrFUc1AE9Q6hDhSaHhtZ1eLjsTjN9XWk3JVwLaE/4/DbHLAZ
         m4Z4IhVTuSraC+0Ic+7ZAtcuGZEH0g9XH/i5GYRwcwxrP3TjtkABFOM3w5WKuUyfi00h
         ZBu9mODSEIPOSeFPbRORqW2Vuod1bgBR2q5AeoA1cu2OL38NkD6OI91yYnMLS6Yzfrsn
         gT0w==
X-Forwarded-Encrypted: i=1; AL+hErHMfoVqnU16LssMofyPSWdBye0HVy1tzwJwcfClploS0Iiuu4CIJTygHQQ1VEkcG05OheN0CsGmjDE6Tw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gg/POuQoRcwhZ1dlEkMSmREwpaIreJhZvCPZJmVBNmqVK0yPT
	SADDbvDsV+91Xk+XzoQGRsvgFzIRsORv4tm5IatnuS1XcWRQ/YTjy7HE
X-Gm-Gg: AYBFou36tmpUBx4bU7xt9Js8+oYyms59QGnxJhjTVvWupyl31ko/zgl+/zTH354u9C3
	Snijlyhpy+N9k/+gPriTEgxbZ85qZCwXAVMyIE//i31L9z3HM+1OvuocluEqKHa6UAnS2uqotru
	jO9CnQgshWFUkO27mKzrXxJWB5rRGEBmGtktj8NOxebagh2xW0ZPJtS7jSzIr1REWLBx+XKufWC
	8MZUiy75IHx6DzsCbm2shiQc1E9d8qdmZfykxfR7o4GU15iC4O21ZJZZzbjmesC2aN6HOyW8sNO
	AsFSMs3GhftzIHAjrpc1hSWWmWIHEA8nFYR0HJKhl/L+j7E8R9ckC5jVXcZ1NIuLnvkJDJMPO3c
	FgY4qc5VVcu1sH9iKCi0vN0qdHpczzA1q5qxmmJ3mRJmS4L5XcqVI4AlDcpzxdji1Zbbp33lDLQ
	T/Dv79qP5Sds4tjXM8A6CNnblwwCCZRdjT53T0yDyszQSH2Qf70vBCEVgcg5DUacMA+otz67YTU
	FrhtwAsE0I6DFROz4tgedeoZOG/tYVmZrIH4S39ubZvAblnujeHycwf7kcrnWeywDxUu8R7sgi6
	BFU0MX8jTtWT0yAz9m31eRuHTXQXQOUITTLDgdTQodMNygVVw/dombs8sHvxaCI+IA+N
X-Received: by 2002:a05:600c:354a:b0:4ba:6d8:df8f with SMTP id 5b1f17b1804b1-4ba0936f447mr55057305e9.15.1794416062148;
        Wed, 11 Nov 2026 08:54:22 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm11708192f8f.36.2026.11.11.08.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:54:21 -0800 (PST)
Message-ID: <6a2c3f50-bce4-4214-8621-e0daa0637e91@gmail.com>
Date: Wed, 11 Nov 2026 17:54:19 +0100
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
Subject: Re: [PATCH 3/4] mm/huge_memory: don't warn when a page table blocks a
 huge pfn insert
To: Eliav Farber <farbere@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, William Kucharski <william.kucharski@linux.dev>,
 Vishal Moola <vishal.moola@gmail.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261111140655.34281-1-farbere@amazon.com>
 <20261111140655.34281-4-farbere@amazon.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111140655.34281-4-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 3:06 PM, Eliav Farber wrote:
> insert_pmd() and insert_pud() treat a non-empty entry at their own level
> as a leaf and compare its PFN against the one being inserted. A page
> table installed by a concurrent order-0 fault also makes the entry
> non-empty, and pmd_pfn()/pud_pfn() then report the PFN of that table,
> which never matches. insert_pmd() warns unless the entry is the huge
> zero PMD, and insert_pud() warns on any mismatch.
> 
> A VM_PFNMAP mapping with both ->fault and ->huge_fault can produce the
> mixed orders: an order-0 fault installs a page table over an address
> while a concurrent huge fault on the same address reaches insert_pmd().
> Changing an mm's THP policy while another thread faults the same PMD,
> for example with prctl(PR_SET_THP_DISABLE), is enough to do it.
> 
> Compare the PFN only for a leaf entry. A page table is not an error, so
> take the existing out_unlock path, which returns VM_FAULT_NOPAGE and
> lets the access refault onto the smaller entry.
> 
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Signed-off-by: Eliav Farber <farbere@amazon.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
