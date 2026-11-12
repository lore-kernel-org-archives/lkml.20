Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508418;
	b=nNUrvNFN7QDOYR/dsc48IMG2jLWnd9uI49aeAqQIGRjFX+f5GVnNgME9PhIQ5YdpweDX
	 5lvGGPyysbVNhquGDFghS2XT27NlGalbO9kZZVRwusdWT6kIaK9eylQGuQt/Uj+5/FYWG
	 8TDfYPAlCPW4eM6zjmKp8I9KW7c9RNJorYfOR2r3yJ3iWUWr7MFt9gtRnjhjILStWXFaj
	 Dpvd0PE2f4pGhIQVzWBjDzYZ6N8HFwLveu0TLqVjsg7WzYV5oz2ExPu38qEWaut2d654N
	 GOLi2yg6PUUX9lhpaZJ5xuYSvBNrNlmGSzqd6yMvULVP/WDvoBuzzN4Gkknou4K/SVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=E0X/oBNSd837oq8qemdGMRW3gOZl3XdynAbQm9FPXsA=;
	b=yDvedYcAZiYjuXyjHFC2VgYwh0bWqGQbbGl1TNGp6ZuMJZn6yre4zeYtElQLFt+updBC
	 SJG8IQhftwzKCj3mHXdQ6jcDeBEIZjsV2jbEa2zR0DQPC91DgdbFNQxIw477QGKgSSFiQ
	 J3s09rfnf50+6pYtredJDxVl5rRgp9J01xm0f76XN4XDXxMnLR20R+8b2may4o3YRKcjv
	 TIcKCum7o3d0Z5d8wC+J0pbA+ZGLt4Yic5C1eZ01U0INrsMwAnOoHs7xCoJMHx6vUwzwQ
	 IiHkZhVcfGNf0tGEq2Vi36rBFNrorWbnupgfDqdU0XPYNJdCEc4jTaOpU3qg1OwTP1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vOr2VvyR;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB628606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB628606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vOr2VvyR
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f30660e69so4749585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794508417; x=1795113217; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E0X/oBNSd837oq8qemdGMRW3gOZl3XdynAbQm9FPXsA=;
        b=vOr2VvyRtP+KBt6PNgpsroLYuZ2WDXRyTOc5i95zgwooIsYRcxqQzqiTLUmi/IXsxY
         hHwNRJhCrscdVv/HsHUP4QAcTt1cJdndeVKPMDxbJ861WXUxNdUDlH6/AnX5mNWc7Ok7
         gz1LKAJ7k9EX0GE3xjhFTEeo+pTWtrYXtUOm92dteko0p+d/6NHk9jVtPuT8NDgnPWvg
         XtxTBeTZ4wwWnSR7wfGblG7vb8M3uTKovXED6EyA5tN4BZTkv+jChVYvxAiFXwAYGK8k
         e0QYgsMMPmx9nO2Garn9QvjiEbljM9VzEiJMpYxfNqtFGezq9HjbZijLAU2AbIeA4Mjf
         wCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508417; x=1795113217;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0X/oBNSd837oq8qemdGMRW3gOZl3XdynAbQm9FPXsA=;
        b=UbtC3ErtKnOlaWKMnO4pzIpcDyV7HySZF5B9nczbhk2ON0jvdd0hMAe8LpcK/GEesU
         pXApry3G8B2Gmz1WXtGfqZ4tKIDeXV63TS0pPn5AJE2ZyJknfkKcE2CXa9MwRhQLMUPt
         C+EIBC2T/e4ur937VNfXZeWFZlM2LKgLB1XAUGfgJc69Ynr/MGSIr5uQGEt4cBTKGhj9
         ffYNvTtMBfqiwL4jr5zK82Vjl9HbqwWtn9kcmU16k5GvKkuzMnSZj5wxE/RdeQFCSaYE
         /sUCbBzUxwpUW05mBwD/t9YAB4eYhRVwxe/Q/6MOeJqWUCxY84/NA74xWN1zEf1Y5dV2
         Nc3A==
X-Forwarded-Encrypted: i=1; AL+hErFRsBUC8u+5sMLDHDFfdu7Kv/XJw1HDP+r+4809TfnLxwnYtAHsMAAHV7KbNlTt2jW3lN3SPc8Rvnyg/O4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CLV74USBURp/XMxR3Hn4Z1xLymgj8nD5t2ivmfybIoR/m6LPw
	tZ8rVHZTGVfcQzrjkq9bH2Y53QssBW38zBXR0DbGpXBjeCaVWmrZpGi1uvzItKKws+g=
X-Gm-Gg: AYBFou0Bew/JOyNF5/vNuDDp7ej66CC6qVOb9ZIalRU+i/dKnYCqKnpenLGdSxYScmP
	2lqLCbHdN5vhpHemvM2wlIFCA9pTsBhLilneKD/VBSEVFMhrKbxKGzxtQ76Bet+yzuKvEgsKyuz
	epBLVySWXa6uHeHJMAZ7B7RnMyNmh+M4UkHUS5/B/LQU0qmU5qtMKWjJPDEB4m1k0RElLjAC9Mo
	mfzGFP3ELKT8GJQkFFh+c3ZN0b2CDyVwnbiPgQCd/WCvVq+iJKv1d6DlzrptkyBRszDGX89IX7U
	cgd3v0Yrw+DRLdcdESV4IiRepWYldXYGGGU2u+ZYyecglZpV24bTwn4aTZLFymPkOsk5n1T69yH
	DPp1x49ecQKmmz6YiHI2GiFH0yyVZvciMw7BIZmhciL0VoAYDuV7jfX1bmUEfS3xM/CXD2OzL7r
	gRSXCvVXCxlE24E5Kil9StfiTS9at7Cu48y/TNXORSGCYEW3ILhe5jMJgx70145BDwQU2iQ/Z+E
	u0PufBJopFhqW0/oyHH0z3Q3tH8r0y3cJF3uCXE/Qh52WR4zd1zy4F704CUmi0cLySKPD3NHzkz
	N9Pd0M/UpUDdwyx103aljiAr2sDVoivZVaXeI4GGePw+WjyeI8parG+ZT4XfoyzalU7GJkUxrd3
	uX4/Wzzg=
X-Received: by 2002:a05:620a:27d0:b0:945:ad43:1d59 with SMTP id af79cd13be357-9494bbef3b9mr40481685a.75.1794508416926;
        Thu, 12 Nov 2026 10:33:36 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d456b2sm2035036d6.12.2026.11.12.10.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:33:36 -0800 (PST)
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
Subject: Re: [PATCH 12/13] percpu: search the whole reserved chunk
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, 
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-12-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-12-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 13:33:35 -0500
Message-Id: <179450841509.482102.2272758511939089806.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> Loading a module with static percpu data can fail with -ENOMEM even
> though the reserved chunk has a free area that fits the data.
> 
> pcpu_find_block_fit() does not scan the allocation bitmap, rather it
> tests the request against hints, starting with the contig_hint of the
> chunk, which describes its largest free area. If that area is too small
> once aligned, the search gives up even if a smaller free area fits.
> 
> Consider:
> 
>     request:      256 bytes, aligned to 256 bytes
>     contig_hint:  260 bytes, starts 4 bytes after a 256-byte boundary,
>                   so 8 bytes remain after alignment
>     also free:    256 bytes, starts on a 256-byte boundary
> 
> Ordinarily this is fine as the allocator moves on to the next chunk or
> creates a new one, but the static percpu data of modules can only come
> from the reserved chunk.
> 
> Fix this by searching the allocation bitmap of the reserved chunk
> directly rather than using hints.
> 
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 13f966373f92 ("percpu: skip chunks if the alloc does not fit in the contig hint")
> Fixes: b4c2116cfae6 ("percpu: update pcpu_find_block_fit to use an iterator")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reproduced the exact issue.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

