Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971570;
	b=GPUkGo5l6OuAnrglr9pKR1CKqioomEnJebPIngKzuXZy7Ut+epqfk/AKURydIgUMfys4
	 bMzH/Dh0BJMBGVmz0osyspy7cNmYu2v0utGZj+gSpbJr2I4OkdbjmrBVXP3x5/XW+oT7y
	 glmcry1rim7tdUR44l3hasoAyZfGEKG/WJc6EykEN1oqiSMtY5Z5XZ+ZTQKOc74KA0QAa
	 WFPyqgf3igTYZw/++XH98N900ZtMLGRKMfna7KupQwmPqckv7OlwdOct9ZV3U/CvFoZPt
	 WkuNTpp20/6jpayKzDttzKru9s7/LWT6UmveMuTnCjnFCl40+Jb+0jiJiqp73Kh+JaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bo79EhOtJtgULvq7bZxVFopW/hSbKrx4G7ruhOSax3w=;
	b=2vUYKFsj+XPgM4G4r8N41dZisBac8KV4RT3OwVYNivUfM0yKAN6tXyBBnuWeyCONLxBF
	 k/TV/Qo7GmedzLyuwI6ErnqwVWQOB3tzRm9+PoNXNLDZBdVKefSZI6ymgR9jO7Q6d0jDX
	 r4yN+eEZ00SO60iSN+TtZd1Qy3KCoEkHn07xQLy8ArNAqZo0ifL+qToIyZawO8hUWQ+iW
	 2IUlwPUwbzTBrmBBuSHcw+dpnSlz5lDFbzbVBRj4rwFxhWgJNYyX5pyPWW1+VvUC8sZI/
	 s5FP172JX0QsFchwYL22XYju5FE1EW3JWj3zQ++5UrVcHTvj9ox0MR3fbi3pMLBLs6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZkitMJb;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C58B606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C58B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZkitMJb
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso284196a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971569; x=1794576369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bo79EhOtJtgULvq7bZxVFopW/hSbKrx4G7ruhOSax3w=;
        b=kZkitMJbzY4//vC0xized0QLHCwL2qNFvw61t7bdNhlN6b++UoSMQuDmWJoF2e+gSt
         HyjfNbWMx/v9/inkRrU09lHioO90rxxBKntYlPsye/KCrOl92WP4TM87yF5Kh3XBk+Fn
         g9jgViHqagjRZMhIetbX0wfJdyQWem6dIRlxMuq8SvBW9nvFTZEDUa01/6h4bjUOjjse
         l6Hjh5oARvP+d1qksORvEowbYXsiICixFlrSIWEDdt8AFhi1zamVJVtQtCUbHo+VmBYR
         06fYghkPpdA5FrwEssOxKN8ln7EKW1sxo/pES1uCSVzYZ5oQRzoq6jpa+yUDsxm1uQye
         yQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971569; x=1794576369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bo79EhOtJtgULvq7bZxVFopW/hSbKrx4G7ruhOSax3w=;
        b=euKcLMVSqZtetRa6YxWs510fL1SUfOvO8ueWcwUHpjjG1FKqJfJUy8R1k1860kIXqT
         HjlZR3Z9SrbgOmRgBcb2J2BG8LBR7xRZMOLFQ/Vn2s2e/6oQhngJhLO9c8nkgZ+0o4wv
         BLvgYs6/gWnwKdc7r37zXKUYKUKNAaj+fWknBW9rOs+LDU//ynoNl8H6f/8mx2zfTUgp
         f15t1mQi0gIws20dH1srw61OjLX38jgNeGZq/eVkzzCiCo22pE2ecFZzhGkS3FxVUTm9
         Fd+hdxsOCdCNbQLTdyzkoCSQX91aH41vzA8fDmY/aMdhSv8Pb1iyWwPGslMRav55d5iS
         sBkQ==
X-Forwarded-Encrypted: i=1; AL+hErHdJAEkbblfeB1SQIhGQfVByEn7kj4xnS3mDY+NNqmicE11dWDS81lFnHlzo/18BpkMv1izYq4JvyaVg50=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jIWlx0StvpUGwvYeRmHGhv4tAUYqGKPF+zXhDXfdkVY7euvPu
	d63lzCLccmAipBEhgY6nqUCjVEdXRVgAH6zIzh8pBu7q/ZMBsaPdj1xW
X-Gm-Gg: AYBFou11VYZgc0o09mGnUZgXUluucbZj1wFyeCRwxaoRZx3Q3/FDzmrVjD15k7dJV1h
	a6CyHp03f6ZfGOllCNW7Ujobf67QO0FpcCzHUdBDTtZraIGqU+LdLXOr66kA3sqma6VvjFMuG0X
	949hy1BPZ5Kn5GRASnTzAn4BsYK4rIzwccltFTu3sa1pjlnkq334BsfvjWSb5Dj7jVEAet8o0ec
	gk/P8RFL0kNeJLA3Ujd0ONFQ2o5aFn1QNQ8foCmwYFImO1WB4HXONgLVlN+z9/k+KpDAgtrW9vm
	HZfmqryet46gWsV8V41FTa6Jb5l1lb5+A4pSqoY35Y/VQfhp5QQ1M5/EYMdPny41w3v4k99a5NW
	DVeXxo72cYXb18lBrLbSmKB60uf+yVt0jaOpXzxuxjQsaftStJmM6Yf5oub37aUTY3DFu1tlVvr
	fhOToFpaRcE87X1NduXtUpJ08Hsaci45vk+31SmrjAhdFi8Iy65e6bF3j+K5yaOkXpDSwNPhrmb
	X0htWeMHbLpxuAkI5BFZWMn1Vg7W+UorEoVl5mctTqum1srNqfDRKZXccKK/VUTc32x6z4pCceQ
	vcbgFc+33PGrjlsZNMCsS1wsavx8nY4mGb066YvgKC0=
X-Received: by 2002:a17:90b:3811:b0:3b0:9976:c1c6 with SMTP id 98e67ed59e1d1-3b0db7019d5mr2378131a91.66.1793971569437;
        Fri, 06 Nov 2026 05:26:09 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm7888529a91.5.2026.11.06.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:26:09 -0800 (PST)
Date: Fri, 6 Nov 2026 21:26:01 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <798cd192-9ec2-4f37-9cba-44db275a269c@gmail.com>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <au3CUJO9zBMHLx-B@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au3CUJO9zBMHLx-B@gremlin>

On Fri, Nov 06, 2026 at 12:07:53PM +0000, Lorenzo Stoakes (ARM) wrote:
> On reflection, I think this would be better implemented as something like:
>
> static void collapse_scan_mm_slot(unsigned int progress_max, ...)
> {
> 	unsigned int long lock_start = jiffies;
> 	...
>   	for_each_vma(vmi, vma) {
> 		...
>                 if (time_after(jiffies, lock_start) && mmap_lock_is_contended(mm)) {
>                         mmap_read_unlock(mm);
>                         cond_resched();
>                         mmap_read_lock(mm);
>                         lock_start = jiffies;
>                         vma_iter_set(&vmi, mm_slot->address);
>                         continue;
>                 }
> 	}
> }
>
> Which avoids magic numbers, and means if we hold the lock for 1-10ms (depending
> on HZ), which is a long time in the kernel to hold a lock, AND the lock is
> contended, we drop/reacquire.

Looks good to me. Is the test result of this solution the same as the
current one?

--
Cheers,
Vernon
