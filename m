Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686235;
	b=ijxmDQosMsr5Ie2b1Nsf70UoXj2j8GRcSewcCMWoAKpR23OxOyjKFRrZlCZBj2ZAs5oz
	 Vv+j3aFQE2k8G2JSJkQdiUNJs7ZeiwnhKw0t8C3LGPQN6pamR+bUtplANXtkE02Zmn5/W
	 jl8rC/gbfqg3cQ7iam/4p5t+T6YpM5o8SX3Tkx/i6hWAPnNIfy0OLXYMnEkdgjHjNTEl5
	 oFzAn1mdlal4JKLA40dx1BCxN6lIWnk3o6Vw2bOYLQWv0ntc0dR6K/P0Wtg0E02Ber0Mp
	 mLrKzEktd5w3RquENDsWdVFSMOi4Q0aAN6k/sCIqnitL7Y5UHFQ67N/rzvnidWEZfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=YS3OrJFnm/G05Gr46tUXVU8inZC+WpIpSbOsw+++2QtF7WBViHsROixgVFoRvUrPaNfK
	 rlVOx/w/qlsCkYhKGiVwJ8bpN9hUkmvd04+nKwax7VE+h9frtQZn1nZOdkgsSqB8OHFA+
	 zJK+xBzqMtesfZI6C7rkJCnfdthZ0Vth7N9HE0LDjCGtaTqk3yaSrTdhkcgCIWVWLRlB2
	 m4G40fJUIQyZDd+m2qAvPi071ON+LOfqGGOMvHqO49dfJsSoQdNafc0R9j88Sav/gYL8P
	 XHZlNOALLnznleXIJP6j9p7/eDDYDb0YG0gtyOy/Fl4/O19GE0aIqNFuq6UOQAAB7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="R5QF/Lzq";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD3D60A5BDC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD3D60A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=R5QF/Lzq
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2006396a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686235; x=1795291035; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=R5QF/LzqmNh8H6DW/Tp6D2khmH13F8jS02Au3NAC8yj4TjGWX4bwF6qk5IoNwQrE/3
         Xh1yK0KBPfJuPjRAwYHbzV6XosfNY0tKGMjje9vACiDnt1BKTLgjbIxr9zzZeHHSoySX
         0usB5I5Lay+SCNbYz0Ix38KonSjLyFaPrl1JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686235; x=1795291035;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=lhZlW/ca6WK5DKyCeBOxVT8F2J7FTji6bfKth6txmqxrTcpis8iTrxGFAVBTCzBoqv
         iUVXbYGdJpTncuhCb/M2EhbV1vZy9z5gG6DmneD3ntCkEcKirtifcKHCS9sAJlVdvPrp
         UYt8CTKCq541HSFjw5UrHEuwyupswqtvOP2sxuV52sDrGVM512KHmAySThlV1S5tRnuI
         Wuzw9x+Xtn7DWRaYWlrvGWXwCNFsxpvJvcYuI59G+ORYTS9g1kGT1qzlXH71ggSEypiC
         NT0qkyEpQBKimKe57ZfshdCIYe37bJj7z5oBkLijuSqakkSnQQonCOinBHOfxlNJxntq
         U4mg==
X-Forwarded-Encrypted: i=1; AL+hErHpjOQdYrjJBJG9MyD7hC83VsJAScDz1Olq/IghGIYiaeG8+AhSxHL/VmVUCzyvJ9zYNWjKfPKJ9HX/v3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WTBiCLk3sx23+7bdBJYaruovprKwaRizc+AeOqdqPbvwfAZuj
	mwgrCexrtylyvzfIP2xxhbVIQADi71aP/OnNFtbYGWX8l71c+IwqsxCsXkhY00KBb8w=
X-Gm-Gg: AYBFou1l/jP2WSFpSYsmuO7BBtDvyklEMfQ6/k6bMaADIIuVk8qCI/39SyGipQiSMrH
	7pDadfoa+r8H0LflrN1adNZroDlI4I8q4Ay8qt/hl3swx57SwFUpubaoqI90exPrJQhjnZQcjRy
	qTeXUS1e8rnOh/aN/QiP+u8dahr3E6m/skVNAsRPdXwo+Q9lzHma2bpjJ0ib/r+Bv5AbFmYxxuo
	Kk3R1xt4iOXEhtC+K/2Xs8jZUnnTCvMvplvEUMF9Cfk3ANcoPsacFWMLRr9YMXl+l+AYDM66GST
	dhm2Mk7np6MgpKQ6xDLmgL9fBaX735ML/bK/qX6+9WDQVdASNK7AsimLQx/twcLqLh9vP7eUtOT
	z637z9YNY1J+4/I9V+g6xI4zCLFeknLwGkIjsr9xBVLtKWWCWcYpEo4KdYYP14c2uFn+8gaby9Z
	i878QiJAOqrFeeNiBYA6SV922/vrG/zQmtCywLxJYYsA0Z6PrvSHf5A+1i6QGFHXMn82WIprTPS
	wkXtqSScaF0VwktBRkSCN1b0TVUL3fQGbiJtI4hSQuTzAJdWW4d8eXcBqcOU4kUxjCz8Onfd9WF
	65IYmgMHs2vG7ot9ZjvSvqdMcKbgWAOYmyniRr1KHfc29s3mPixbjc0wWgwfRBuTJx6gtGm9D7b
	JuakFG1hU/2MD9she8nxdssJBuYtVavQiLJygHHrA7eDgBWUTMbJO7FCx63XjvAD4XQswTTW3IL
	gmZP19YIBgwT3JIqFtbYT12nZTDRZyD8Q35H5Qfa3ehhlt0SAxUlFDjw==
X-Received: by 2002:a17:90b:586c:b0:3b0:ab34:afc8 with SMTP id 98e67ed59e1d1-3b1b0b67f13mr5551950a91.20.1794686234917;
        Sat, 14 Nov 2026 11:57:14 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35ac2sm15010379a91.17.2026.11.14.11.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:57:14 -0800 (PST)
Date: Sat, 14 Nov 2026 11:57:12 -0800
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
Subject: Re: [PATCH v2 12/13] percpu: search the whole reserved chunk
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-12-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-12-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115712.a6d31c964942e1db@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
