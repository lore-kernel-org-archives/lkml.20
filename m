Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506187;
	b=A0vv4PSghbI0gHb7dLLQEkgyKb1sEGrhWeXQ/bep/rIaRL4/9uPDRyLLBnA36OE7djBz
	 TrM/2ry5+zUPOROo+MNAcuoLJZs8gj4i9ZTs4Q2l1sce3U6OkPy+MgdDDmOY14t/upX6o
	 M/L/hwn/dSjpEwBt8BG17YkKeQxFbY2F+SkZq/cbTl6YRFj4ynZGYoSvNnQ37XIJkrmwr
	 lHWtLCKARV8zlW0Q36Utz0fCYVntrxa6bi7n7vHCh9+6Ae2/2fesO8qFGa4eOc1eAIcYr
	 CsQHqv3FJhZ73PssN1mjKMS7adejAs2AoKeME03Q3RK326HZfO8kAPcrxpZ+Vba0Ckg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=oX1FfxSvKmY7PUz36O/ZliPw6+lwphICskypKstU3eM=;
	b=SkLwxcb/dM/9V1wxI/UbpAYk6e45XSMjqkVaO8tcT3qdqX1jlHVFmCWYAWMB27cku3wp
	 GOrn7aJfmTanLIhUUYPX4hilT6hb2xSkdw4SbuhDgmMeteHI5ac/Zf46DxaCYL+SyWa08
	 w2hXN8glrXE6bCdYlQExT69ODyCPYgtfh4Dfmm3e5QI9nAhv3PwuZwvKB0cr+/13APH/5
	 QsxWX4sP6Yl4EOPZarVE0oqqjaJYSF68SaocYEHCT6HeFxNWjl4uN4Rqkgc9n/KO/K08r
	 2zKvLsM2fSApn0zXPTkTwxFP192RpbYc3OgNZelSas6Mzesq147lQylYYDobM9gDccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EHevdXBn;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AF606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345AF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EHevdXBn
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ea0c05c92so668546d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794506186; x=1795110986; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oX1FfxSvKmY7PUz36O/ZliPw6+lwphICskypKstU3eM=;
        b=EHevdXBnV4anAfSLKj5v8q2Iozg9+kJRetotcX6QAbpiWWKdfn3IwKbW+VaI2GAaZx
         1qceClnVl1GgIdWydNamNGFCl6PY/+1OUnJMCW2CqU0QDuIPdyY9QU1jxAV89RBRTHa1
         2lDsok4KB59SozZzLSpNfWCAD3Y0iYPpXq7vW2m1lZn8Cq3AXVNVdH/2L6JA+JVoVdAu
         QcT9Fv3EfNxygDjKYfo3ZKS4vQHT0eITMDOGpHaFNElXyCqjANHZeWKD2J2h0dWNDT2v
         rG89HgkXOJhxDBWcCS6c7h7an2NxYuBSUXIJhH5YT8eEJRaMSDwGmCuuaRJUFI87lodq
         3phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506186; x=1795110986;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX1FfxSvKmY7PUz36O/ZliPw6+lwphICskypKstU3eM=;
        b=uxTcflTOUgEYER9sQPvmBEF3m/NmiiwiJzF2Zn9GMKbYc6jeqm6ceFV+J75JQ0WSH5
         xEYcRC3q/F37XCK2PWX24sq4HqnVHJLhNTiX1eT7HnoEYWq5db98vf2+bGCVOLZtAkDQ
         Sp97GdlKvCVMD5HTPIFbRPkaB5CSQpPKOe5k/L5nr94aLh/HwJ7sKb31/lwjb4LZB6cJ
         N2hEVf1d+Xin7S3uEQj4RukUe+bR0rbxr6U/K3DOfioWpAHGem3xGQT4Z+jNu1BkEKYR
         4GK8Oow2W2z+ZvR1RSIW2gqcrMIikxnesYhdc3z46MlU85DlHenqbuNZ4AL9iVWAKs5b
         E2mA==
X-Forwarded-Encrypted: i=1; AL+hErH9O1JjbDTZzTT5nmDb5JcnlbWllYyX3g/OsGibwOdhXIHZ7paP8q6mAlJhpckCHkngDqJdFk/J+UAMCdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dNg985AIY69P5XSvezp3FqJWXV6selnLvn9J3nYEIMgbhCJFq
	hydrnUJ5w5nBBfdzbB5I5YMuv/JlUdvZ/s62K+Du8BKuPtTAHouBLR8RIaWgeftACxc=
X-Gm-Gg: AYBFou0BTh1P9Lol7EX2JfY6hUfV9cbBzkKaN9yRMoRrDYoSuoS7OMs2g2BW2dU+pdu
	cz77iDIlSnKhH5uRJQiGNcV/aAAaSGDOMt8ZpgmuMiR7HPMYwFEPlmGbKhy6UgGfPGrNN01R2pO
	7MN7ALlQKOIekoU0HlKUnfAitC0H1X8gIRRexF7lYn75SprW/3fwyFPe2I6kvPFnWx0405mOs3K
	5cbCewDnSWjcYVcORhRPY54nUJ+hsXFqt9hEhU7C729zc21G+IwC91Dt9wJMbjPWzEAZhcIEyn0
	9fIfaJqJGNSK7oGBCjmA+bPmarR7pbcQloLN1YRD77sqBPk3RBqZn46daPn/OvUXUPRz1T6hVHD
	LIxSR2hizFQsWPcWlyUKH5iOx3qytDTAywpyAn/d3HOFfIJ82OsKF5ocUVKfO6KCaoXqQBqDbxn
	7nJ1W5/hslnD8r04L8culbYRWn6ydBIWj8MuYoaFCQm0xqZoduMm7TS9oUTxWkFfItUIK0FRCNk
	HCKYVb41+a0uD3el4gJIL3PW6GghM7h0Ldgk8H2fcGB48912VS+pyAUwH3oba9IkuLuTP4BZOTF
	ItRcluCTSQzyzU2EBZmR8uspGx+wxHQFDStWFsfnTueGCKyREXpP+f24eelhV787dVI3kn1hEPW
	+vsHl9/U=
X-Received: by 2002:a05:6214:858d:20b0:91e:9b17:2be9 with SMTP id 6a1803df08f44-91f24203591mr468026d6.36.1794506186056;
        Thu, 12 Nov 2026 09:56:26 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm1212506d6.21.2026.11.12.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:25 -0800 (PST)
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
Subject: Re: [PATCH 06/13] mm/migrate_device: don't let go of the fault
 page
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-6-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-6-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 12:56:24 -0500
Message-Id: <179450618409.482102.8556965317179106876.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> When migrate_vma_split_folio() has split the folio of the fault page,
> the lock and the reference which the fault handler has taken are at the
> former head page.
> 
> It then moves them to the folio which now holds the fault page, by
> taking a reference on and locking that folio, then unlocking and putting
> the former head.
> 
> split_folio() has unlocked the new folio and has dropped its own
> reference on it, so until folio_get() nothing but the page table entry
> holds it.
> 
> Only the mmap lock is held for read, which does not prevent another thread
> from zapping the entry with MADV_DONTNEED.
> 
> If this happens the folio is freed which results in folio_get() taking a
> reference on a free device page, which the driver can hand out again at any
> time.
> 
> In addition, folio_lock() can sleep here with the lock of the head page
> held.
> 
> Utilise split_huge_page() which will leave the lock and reference at the
> fault page correctly.
> 
> Fixes: 022a12deda53 ("mm/migrate_device: handle partially mapped folios during collection")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ ljs: tweaked commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

I was able to reproduce/observe the ownership gap trivially.

With some effort i was able to generate folio_get()'s zero-ref BUG()

Can't say I understand the change well enough to give an R-by, but
the patch does resolve the issue.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

