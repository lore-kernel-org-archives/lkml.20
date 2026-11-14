Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686230;
	b=H0/m3EGZXfYk/QrZflHzypme9O0QnUg8DKFnWltgrNgihyKaux9tEaLLPxrGLlX16RgN
	 /NkCFqWGFr9iLyQ1GsQRMcS5t1vr5nnWAW91SUZOg3nWgXnON1iAmePqY2qv52rtSFTUJ
	 wJRHuo2V2wj8MIMiw45L8Qn1lxdN6J1o+kt2aysBpTZrT1NkB/kRJhSdDWw2wMuphe15u
	 7dBM4Xr0tib9EokuDrGdNZgvFVY+YxyZkjoY7xs6rw5UEMjzzs5kC5BhVVEMoeOusGv7S
	 X/3uk9PoxQcFWRGe0x+ABqyP64T1eOwceu9P+qpahcrChfpoEEcma8qz18bV1q6POcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=SRnG6/A5ygllyjm8bByOdOVHTnN+TptHyGCKvaCq0ZOWfPfMeejQLE7YpmPBnSwdmFvP
	 TNLanIvN5BLwSDq89QMbtBeGIkL/mOIAsBUp1C0KeGXx1nuJ27wl/SV6PMRDFyV9mJBnq
	 jL7sgg1upYw+kPJc99OkSIlz6M+hAlhFIEk02re1e9+h19qKk5QFvb5fy9UrFbTfv0SFQ
	 E9WpcLGOYWnZF72X7Ys3K6qfadVzesBGZNrLKYehRsSDH/oz3lX0nBQ5ZVpcApMTX1Ryf
	 NNN524s6U68e5p82JDbcIoxhzFVSXQr5V9retdS7QEcAM4BsZQUnbE+ord0lx05sR8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DBzXyPrK;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65460A383E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C65460A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DBzXyPrK
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed39646f04so7473575ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686229; x=1795291029; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=DBzXyPrKsDRPTbSaxgSes1jjg4+nqKN96POlblWZ7GlEA4M9Ge4VvxQutRKppkXm9/
         JtjE1SinjwOrcnYUgCDHg4MIs2Z60pDVRm/qt1jTjYTqlliRteCUH0E0AQOuFS9NjmNI
         8UIHSjTNwfrHv19avkLNL5JWrSHqkU2o/qOhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686229; x=1795291029;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=00SoNU/OR6dBf5R/LycDcQGInxC++sY2pm0rSYolDppIrKm3/aqy/L79wHJgcBYP+6
         z1gnIJojwwIlInhYEm8mtVP+EQt3sfxH/j4idyxzACEM7xf1tPNBlq5cCNn2oI2ynxY1
         DgkAm1ta8uRJuew89NektJ+woCHoexRHgveoyz3a3Zs8Q9eyVvcMpmAMN9qol8ow2wJF
         dpj+sn4sYvJYLlaPpxLTI7y+8Rc9NCoTtTpJTFKsY4y9B47toM+fbGGKu3XzyL0AV5EQ
         S9DkIXvblyWh71ZgZIclXVET9rgX1eiwMBSnC6SLM79WbDtQl/zYecwDR4a/8usnmPi4
         pG5Q==
X-Forwarded-Encrypted: i=1; AL+hErEUqWSIpfLlRM/q54uwGtc8qDOcQBHGNyA+7dVONWRwcT65vge6mV/sj8sYENhd9psGzxzhIDMy5BVY1i0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wRN/Gt+drzsai51O/msu1Tl6GNqKF+C7NcaTMmXkw+OxqCGSO
	dNGNXuJslJuboO+52BCOfUvmlaIhCrSyqHUYtcCDCiOeZHnXnuI68ExWPUgCwVZmyeQ=
X-Gm-Gg: AYBFou1MKKhlGVf3wve7le8TOaHhTENSHKm3CidXi12k0BUJoOBZEXJCbRVSMtOkCGU
	6bBUDcQix/Fs8aj27vLMZ02iZdUY895cd3hiFcRStMX60smu39MU6cvomhilGK1/dlG0BYcKbFq
	E98+QtPM8qSaJKcmXf7eV5qvtzoa+Pc6V0TyFM4bj3vptVj5kFjptBsUbpRxDyevpxLYuPxXcOK
	wy57sXxZ93AtdOj2mhcTwq4T7lHZQbvjgtVC2lvbCnIRjuXQVFTI1YON2IPgggFv8/OBy2eIyfQ
	lRdMFnq9O6XOhJddNt0B8BoBDsiRiCxSiWLV8/8IVjwDo1jxQnVsxDusy+GFp6l1hHPYdhKjas/
	MViMKEDUV/7yiahiDBQF27ZGoiaH31dv84olUGjfF0qZwVlkyDv3rqemTDcExt4zMy/fyY0dOIh
	zjoG3XY+ocMgnRGOlHCb8jVX4rqyuKl7qh7cQo155ltLrOUMUNB1g6PdDmW71nWH3jX/OqYIUGl
	TvcQtSKZZBXcrf2fa0C3/RnUCzaeDOUagEiUeuoURpdR0jv2aV2f2LyuNUa2MVb64SWg4BB6/gr
	aMH8eXtziBFTrQfEv3xyEbMZT8R6djWED5S914REixN83bceDmtlFDPUgSq4d/Xzi98/7lTWCJQ
	uNUfzwOT8fzfIpwTKDulE+8bZirl1CLsca8bp+hazG7/lCgMSKvV4lfBgWz0x21x9iXLAbHNKg9
	DltlnSs4RW1/WzJT64zSaCQg1/fDdbv6uFWuJ1ohKgLff56bhRxDP+fw==
X-Received: by 2002:a17:902:db04:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2ee0d9eb41fmr60393715ad.5.1794686228885;
        Sat, 14 Nov 2026 11:57:08 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7cf33asm22947505ad.27.2026.11.14.11.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:57:07 -0800 (PST)
Date: Sat, 14 Nov 2026 11:57:04 -0800
From: Chris Down <chris@chrisdown.name>
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
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
	=?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 10/13] mm/migrate_device: refuse to migrate shadow
	stacks
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-10-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-10-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115704.9bc8ba24d73b8bce@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
