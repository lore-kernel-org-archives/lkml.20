Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544436;
	b=X4/99iLU9Z/L8XIKIWrnvSrANNES8HqAZ23EHjdC2SqfyJQhQrbZts+bz5V+CMCif+Ew
	 pGybnz7mhNR+J627301Menhew+foEJpLkjK6Km7b+aB3pCdA70Rp8l+hTBg5RVPgx2IeT
	 yzxB7pOzZofPt0TucwTXRV+7Samxh4gB7RM0LL6dzMWyhNWL6JOZvWGJDOHQhN0bT4KA8
	 o+YNiUUuICJ6qQRaKJq7vvnKAZghDtnAbNzHDFG7q8kP3yT2YBLxr7jdslI0hMfGKSYTt
	 W5FWrpV4IT9czwrjCTrUThv/vMKk4bFtUikkPOS5/6uGpdAbxtpyeDTlHv4zNS1mC0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=5H76beDR155/tKgd6bms2sqDirr/ypiJD3wLDnQnjso=;
	b=IFNWpHoSbg8LxwEUkfQKLslgJdi8VT+2eYYeYGz3dJiM6GIA53Q6jdrf4r+32G0/ZiLY
	 W4HHE1fL3drLodgVfSzu5vYI0o+P2hfSHEzLdVui1qJNnx57Ta1uShGyVX+fkSrLTPdHV
	 k/tAHTex48fb4e/T64AHbV5RSQArS6gV6F1rlUKLwOLeRDv+0En4IC2IVlYRZQOTECVja
	 QzzKwwVORYHexwXMeJJuAUeDvjvVreb8B7IVRHudLnCmiKvN4sZAT0fjgX4lGQJ9sXdy0
	 VEd+TMxgdmZHVHwbsHIleXhTgUd9tgaVkaH8a/RBERUcs38FY2k1Oq8cO0z1N1PXzWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UPGLfDoh;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F1606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051F1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UPGLfDoh
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e98798cbddso4427155ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794544435; x=1795149235; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5H76beDR155/tKgd6bms2sqDirr/ypiJD3wLDnQnjso=;
        b=UPGLfDohYxsHcaPM6Ppd29PM/jkGccRp8ufFFmnKG6phEyPGzWVMkgJDAtBHvcg1Xj
         rRAcTsoDb/GkTrXInudIFTl3rYHFHE99RfdDy8mPAGWvijXXF+w5YqCIX/c9LeAeI2v2
         +X6VykhsFWD3A3Wp7EpfkCdVpCYlmSF+Sm0tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544435; x=1795149235;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5H76beDR155/tKgd6bms2sqDirr/ypiJD3wLDnQnjso=;
        b=c5MfIndSMx1uptoGUcP5VXzGgBDrgARrOzJ9DgoLESPWyDIKQkCnVQMdO5YYkhibnB
         QGfiPrMbIgPdEXDcx2r1c40C8EhQWarU2e60BhaWWlIfzk9MrVsXfpRPuXIQsuokB1nC
         r+idgPMNuR4jKxbJu+ZuhaPjntKYmO/PpQBo0Tm4IV91/XgzxUU6mJVqNg+W+HoNchOB
         Q4ETqze/E5hcmkj908b0cIx2LUgCj+YD2iQodERoQCMwg79NaEcM2iV0V2ocdfGgWgH+
         nANW1H/TsuaSH4AcrneEIYZ0GVGWdY25zxX8CyQKaaA7eE2G3ioVJsfDaEbfeDorBTJv
         oi9g==
X-Forwarded-Encrypted: i=1; AL+hErH6p5/vUUjv2E94HyPscrjy6U741FMiHERHdDkgMSo/vC6TvcIUxE9jB1Wg2nEKJQzWuX2VOHT8NVg5UxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I3I15MTN1mFmzGn457Hv6qg4LGLZkHSJFwQOwv3DFfRamyxSb
	l4iHTWovc1YhyHAfIJaiE85jT8YLCBWerYn5QAKaqNgrzw4tyfVR3hZO3m+kXPDECHc=
X-Gm-Gg: AYBFou03YwYQBteidxxrhIGMWohCJO3zbOhCS8wY/4JOG/SpVNzCkwAyoeXbLS4QLvv
	l5eG8ku1o4l04Y8MLltbU2wM2JPaQffDr184Qnq+iRAmB9B69rrivGJCkz6o+MO846/8TsU0QkO
	+Yp4EnRfPbHqs66ymG1l8wxJ7I0ZvMRUnvi5ZOCLJSfUsWhg6I57yWHIsX9LRwJpf73oBa4X0zL
	F9aZ0pbjq1KLVbKOKvHO3gkrbfRBfUzXbATSo22bxyn5N0c2p+F+pFzQ8TY19EcrKyRB9jC7wMI
	9+lp3XvJ/48xhmWd8JLvRBfTLz1zWbt7VHfXTatL7Jc+DGbF6AXQ7gU20gNe8Uzkh3He9XYacEa
	x5aOYRG6kfDiOUiedtPjDDyJ4BXzSrWZXfiL7VufE6wNpJ2Qdqi0EnP94apCFoMZRwPNqNF6SLQ
	kyYSVBTfROef9z14MG72XM7x4P7R3qYSHBY2nVceNN81aCd/gwejwLK8fK7JW/y86IGxnZkb8Za
	5RE/Kj8oqoc7u1U8VwdHQslDpBXuOtJ0xjiLHtqjVp9Bsp2izPjEnUVBHEUST4Vq89/ytbbxqnr
	v3wxaTxyL/jduOEl2IffPERKMIRRpQevJ8NNdqWo8AqoAr0sIEBcmDsfsjXRNV6q0jcyTljQl3P
	0cHt15QP15WqYHWKW/mgFwNBAdm6sVe/0iLkGJp5cu+CGIDT/WmX+cPUCeFR9Ki2CqQCFhL7hOR
	D83vsUjDg9725U84yK9pwHshWb9XWWqF4H2C6zesrR8OFxHmTQbQDXmer959k=
X-Received: by 2002:a17:90a:c105:b0:3b0:9976:c1c6 with SMTP id 98e67ed59e1d1-3b1b0b8752fmr1061273a91.66.1794544435107;
        Thu, 12 Nov 2026 20:33:55 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm7614323a91.0.2026.11.12.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:33:54 -0800 (PST)
Date: Thu, 12 Nov 2026 20:33:51 -0800
From: Chris Down <chris@chrisdown.name>
To: Matt Salsamendi <matthewsalsamendi@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fs/proc/task_mmu: fix stale walk_end after a completed scan
In-Reply-To: <CAMPWk9NE_epOdOCbs1PGh8OQP4wjTObvjU-1Wopmu7SSNAMXhw@mail.gmail.com>
References: <CAMPWk9NE_epOdOCbs1PGh8OQP4wjTObvjU-1Wopmu7SSNAMXhw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112203351.7d5bf7d0f78d652d@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Matt,

This patch doesn't apply as sent, because your mail client mangled it. It
wrapped long lines, including the hunk header and the Fixes tag, and took
the leading space off the blank context lines. git am rejects it as
corrupt.

Please send the next version with git send-email or b4 send rather than
through Gmail, or set your client up as
Documentation/process/email-clients.rst describes. It's worth sending it to
yourself first and checking that git am takes it.

Matt Salsamendi writes:
>+	/* A completed walk may follow an earlier full bounce buffer. */
>+	if (!ret || !p.arg.walk_end)
>+		p.arg.walk_end = p.arg.end;

While this fixes the refill case, ret being 0 doesn't always mean the walk
got to the end of the range. pagemap_scan_hugetlb_entry() can't
write-protect only part of a huge page. So with PM_SCAN_WP_MATCHING, when
only part of a written huge page fits in what's left of max_pages, it backs
that page out. It sets walk_end to the start of the page and returns 0 on
purpose.

Before this patch, the caller got walk_end pointing at that page. With it,
walk_end comes back as end, so the caller is told the whole range was
scanned. But the page was neither returned nor write-protected. From a
quick test with a single written 2M hugetlb page, PM_SCAN_WP_MATCHING and
max_pages = 1, the ioctl returns 0 with walk_end at the start of the page
before this patch, and at the end of the range with it.

Maybe it would be simpler to clear walk_end before each walk_page_range()
call, and keep the existing check after the loop as it is? Then that check
only sees what the last walk set. In the same quick test, that fixes the
refill case too, and the hugetlb case behaves as it did before. It would be
good for the selftest Andrew asked for to cover the hugetlb case as well.

Thanks!

Chris
