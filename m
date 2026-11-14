Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686197;
	b=f6nZl771HqzA8ElsU827eOv0iaoVOPMlene1D73s+tyzGimhYG9dJDLuMcsvyXQSWRm9
	 /LGmghh5r9ohSGY7w5Ldu6dbA6RWCoYABH2Yn0ecHGavXWg9zhRciOMQ9rIbU7JaMTHS7
	 tWuD1CioFaPolzspO99YXFqsq67hdNX6+KRIlcc6CTvkWJUHWHSDDCC283XwEhpeY3m6K
	 TUz7k7HOQ8jgo2hRhEPMNl1v3wVJOFdd3Li632sOi2hgXR25IOnY/d27jn+W2Te0nPi4t
	 z6KJQseLTZLtYOGOEBi2P8mtZcwBW+FS6cLSnRMA6EGSJpOG4TCW5csbjTwuFuUZ0hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=M5xf74SF1IJB+GwjvbT5WVTIN9Qc9W/2f2algOzAsJI=;
	b=FjjrWcNsv0ydb6CZpYyaoZiqNPJ5i4KuspuuzwMf2Su05QWuLfE9KXpmRaatquyBzxpC
	 WQuaUA90cb4k/g4pqlWomt04boYq+tPr0Yy5B7x+EESYiM2LCi7JoUsZaktmZMatyE7NH
	 0vUrqLxl61eRFk4QqMn9r+PdSvt2jMAIE6Jbr0BLts4pKbOPHni9VPuEZcDgEIZ598h7m
	 haRctrYU1w3+qthaEsiYYvdeQmWDC/pv/sjqN22AadecSFjtVeW7BF502WFg2CzVOldvY
	 dQM2iARMPAsG9a+pMAH/rXtVsVxCEEv65vByKenXT7n6eJBmimo52ePDjYBdCu1v/Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=frR51aIF;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5F6606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5F6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=frR51aIF
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b0d11b85f0so1386112a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686196; x=1795290996; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M5xf74SF1IJB+GwjvbT5WVTIN9Qc9W/2f2algOzAsJI=;
        b=frR51aIFf5WRfgU3th6pOYCYM8cPJl+KR4SweyAH1sd2oMQtEvVXeAyd+ik6wWZZbM
         18I62ot4lGvwOuXsbafyedHV4rvfyJBzrm0Yichbk1qGZ77ZtF8h+i9uX5pUWNblKneP
         esVU6y26zfavI874j8xW7a93My6Xj+L45Zcj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686196; x=1795290996;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5xf74SF1IJB+GwjvbT5WVTIN9Qc9W/2f2algOzAsJI=;
        b=rTRlEjIa0mfjMzGJIEueJLgv5OStW4jNIjH7QTJ2GuDLOokR1mPzozaRjIGvDyRl1c
         gHekbRycMVlRKRfkgWeHB3r7XMT28Qa7PxYfWbGLo6AamZ7V5gc+MXNOIchsOsrvFPeW
         fNaB/WgG9ui043YdjRNJrV60YyTNQLXHdYhFliCEOZBaafXLfJRNDWKpvbwVfUMq1v4G
         lmZXZJqnh6ea1MQnaInc6niHlFXA5/HF5d/GlvCpqEwq/kfDZVnTlAHnWKVZNkOylo6a
         KE86aaP/lPEHi6kz+GVJwcez0J+1FuXSZ5J2XPuYLqaaXPYPvRprKWR1RVBoY2DCR3LR
         MFVA==
X-Forwarded-Encrypted: i=1; AL+hErEz7k7ZGgnJI73wKwAyV/oC2cHMu59AF5JxOPg7HCYLwAx+XYmqJOrXsAnu7b9qXNh3okmjPfS9d4xTc8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wWJ+ewxs8H2RlZRa/97TtWmQdGEMxLlUXXGfu9A3c2v2t/O5N
	o7pHU36jGqIxwrpphNgpi0cLZZmZ4ietVtpFrac4cxXmI9hArSWHiO1GAPY9EW/cWdw=
X-Gm-Gg: AYBFou22W2vcFqL8S4WNwpsuqkoCU0N20cOqbhYecnnvnq+NLhq9h99ObEX5mpf563K
	xs/xiorOE/6zyWb1Wk4BEDIjq0KpNpHHw9Y/S3f0Xne/HdBNEZw4M2dIpXEjzlRjFLE/cWkIDsn
	a37Rjv1rK9/2s3vsmPE2N6V68uProHW7rO5Rgg/IEb550QE9nG95PltOqRpaAuPdxCNsYo1PQ0I
	yX1mQ1+7jVX9+k0ZMLRKyNt3p5CI8rIycRa6vtIhypMW8vw5Wv+U38uubZt38jYVYHOWaMFUqqs
	A7hkGjXVvK+dUW1pA0BZOZx4w/EQ31JhYiacL/YdrZHM4vbKb/J7teGLiN4qliPnWmcSS1towGX
	K/3DiE7S0Uc+y0XdL+AG5VDXolwdNA37y7I2kXHiBTho0sxAdPfdbpng2EVFd3Cld3edPHuSazc
	NRBkZlsLprGLS43X9TszPw0wtGSnIhYDCiNiVi4PEZ4C9KicF60zFKS0sUqAvxvuoxR4LnxQE7e
	ErQJ4tsCPvHb6y/SIdeDEvpCtbfDX0Pnf1E9xpIftHuVEaOs6V3wHlIxZ88SYH33mpsiDnWzMB0
	gEF1mP3Ysy80YF3zUI5cPNEalUfREbZ54JW9vooua/iY8uPmNvvu8EA6zx2QJzJiI5WfWQX7hIv
	tWutRWgEXgwGKFdHpF6Dxcn2nFd0hdKeMwwFUfffD9xtXvW5qDS34J4ymmu4D7Vc2+xayhAzWW4
	EvvI5RHAgR2xeSwYgjRWlVtnrmv6Ahawe6QgHUp+fBp/HJVlbCXzqpPYaZ86Sjx7JSNRAB4cT6J
	Zeaew==
X-Received: by 2002:a17:90a:b494:b0:3b1:bdc8:c32b with SMTP id 98e67ed59e1d1-3b1bdc8c4bemr3620403a91.53.1794686195875;
        Sat, 14 Nov 2026 11:56:35 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm14940403a91.16.2026.11.14.11.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:35 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:30 -0800
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
Subject: Re: [PATCH v2 01/13] mm/mmap: free gathered pages before MMF_OOM_SKIP
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-1-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-1-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115630.0b75d0b49869d4fa@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this with memcg OOMs where one kill is enough to get
back under the limit, and with it the second kill is gone.

It's probably worth knowing that for a memcg OOM this also needs my
css_task_iter fix [1], which is in mm-hotfixes-unstable. Without it the
memcg task scan stops seeing the victim once its last thread starts to
exit, so oom_evaluate_task() never gets as far as checking MMF_OOM_SKIP
for it.

The test I used for this has a 48M memcg with a 30M task and a 1M task
in it, and then a third task in there faults in 26M, so one kill should
be enough. Out of 300 rounds of that, I got a second kill in 299 with
neither patch, 277 with only this one, 147 with only that one, and none
with both.

[1] https://lore.kernel.org/r/avA1wXhTMs9eY2NF@chrisdown.name

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
