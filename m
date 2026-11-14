Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686239;
	b=EovJrzziF6mMZXd5LL6hc7pIuHh/T3ZiNi7DYqmz+x2b6aGE3CM2zPS+wQkVwIy/HQj5
	 34SFg/lOwjXEbyQte4U8DU2NteJaUCl1udCmRMHE/nooXErwgO6PiykxbmkK1GQsIYt6S
	 dgCeyxp1dNHKMxHDBFBVczpWoKTLblRGy3BmFOJilqxKEgJMmcFJ4nfvdGf+EQDU7IAkq
	 A2XPHJCJlga6lcRb9wur2IU8Lt6G/M2g3z4vJ+8eckjpytNXxjCbzcxKY/wE/nkkzUhus
	 M8qeVqItHZDwNNaCCy3X+FKKhPESzjB4vWTHWrZpbWPrXHOKTVTsiAHWI1+kX52KAsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
	b=DuExB6AJeeO9A8O6s+ye8fdNjVOlt34Rxyj9jGgBYmdYXALxcB6a/8rMQF7LE8LBZA9F
	 5vTxBYkTzJXsgxhTyoag7+2hIcPyDnUU+AfR3a43xsLpaXQ1fbIkooCksEYZWWLnnIhyE
	 w7GXR12hc/FTeIFHfoR3c3VVKT7Bmh9v5kYCQKMyveJ0oYU+IrSLURVZEKHUzTp+xNFlf
	 mzTOtLJjHvkMVebjLu2n8KvTThrHeAZOxjazsb/VQ+PXvcnAFghtU0wpigYOgN9yT8U1q
	 LQJ/gOVi2SgrnSsqMAQqT7hgTTKWMft/st1RmS04OU45ygqNSaS0sqQhosG5WBaBy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IvPSjOzG;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA44606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA44606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IvPSjOzG
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b179528d56so999900a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686239; x=1795291039; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=IvPSjOzG0y3haCxrNaMvn66q5rF9E/Bw91sbLQXdLaKWqKJc7Sd2PP5Dm4+PqJ7A6W
         UpJ65HjvOIocRyPQMVZZDk9U1UUOoSobj9gm/OK4vM+I86boyFVThJ9Q30QOpUZ262cE
         0aRefoB+Q7ls8w4pYS0VwMyqJrdKOojp5krQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686239; x=1795291039;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+UcsNuMg4Yueaqy8xslzDAXYJR5HIy/+gngqmLcoZw=;
        b=L97pb1SO/E1OROTTmV9l6AUeaO46SQC1T6nPLq5FYBniIopRWY3/9PsrBuZtXjKdzz
         7T6dyQrZ9sdQ39HOufNHo1M4YXi3fSdbkSmIKH4IYY7H+0qYrlEGbQh32twzUEygjkp8
         e+4jXMgE0Bj2lHaKBlN0WAyRP09sac7UIbnKtIVqiX6l+iNYtlqAh7JN3O6lIvXt08bO
         p3NC8EigL1zPh2yGgKX5EEPCSXk0Kc6k0TN1QaslGUCniXWJt9XKMZlrkE0UxGe7OxDk
         4N7tV91XiynH6FaxyxcScCnDQMdWlNTpl+7JYDphjr0AEfo8wwUHYPGnt4OnJEJAjtAN
         DuiA==
X-Forwarded-Encrypted: i=1; AL+hErFgC+ZYuPrTCG2Jh4iZ4FDHKGiQ6/Ob8nlZiKH+gOtRZfyOFa3fc1kloVSo3yUMIR9yrBsmwhWEQkjQQvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LDsLYJ2VehiUXCztZQyj+04CGFYHLV0E8pUa/UUrCugG+kpKG
	JWdSMJqLvlfsJDt4Y1vrx6cWhTlE89xWk3tZ+8GHJTVWORsOiXtxjMbXHwjtADp1o1o=
X-Gm-Gg: AYBFou0sr+XUuPOL4dJBRjhQMc1wiVYcZ99hYW2pRrZdRH0BhZJz2bu8B3vvcUg5vcy
	AFOwsHVOtKXQZH0I72F9Y7Cnwl/LOwwjxpLC5ZdDbqSMyzfe5g1HzSCZmYRtTe43E/5XPhdCubZ
	tG+mwAkxIoO2LFCOuQ4xFBhWbvngARHpx/GaNb47qgvWjjxxYcdyfiJ3iqvl75CPMahgSQgQjCu
	jnHzFMSjE+RCj6aG91q7fbS30ymbPQhIWCnQMBt32+loKTjO1FvU8wB91c0oyXJxNyHFIax0Ld5
	dIKiZ4llL37JgZNBm8eD0C/OvSqorD4rwk89FhFNVsUtm8yjcg04r9ep68esj4hI7HEHTP4atP9
	MbiOVa3QciCjoZ3HjwHzk80QZ34OcGAq3cinT1yCGgMIBN3BRyNFnwf5E6a2pQvXFAkD+6nvBZz
	fT850qI8m3vDL/gw+I3JBe7k7zF2XMRc1rcZGLlh+smuuN5j2CSlt9Uk3cPDob7sPlSYJNeyjnU
	KAij6jTd8LOuO2VESES3FlS1yp9pUaN1Enkg5oD35iv/Ir9pdQnmjzNiW3Rcpuh2BYAluuO3kEH
	LfNxpiU1GcKHeqedMVo2oqQVUQe8tHlYKrBvjpua+xDhc4x+4YGyTxMRgeLtgrgbCB95IIoIHAT
	jVbL0YkZolWi3jxmUQLEDdzKvBRvovkDUwLhafD6+UeaIfKR3BNyYOTvDHhKduOpI8e0tKT/nqq
	0KLliddxWFFzYzFJuc5Kd1AO5c6Nh5QgMnnnW1dS4Mi3540VbyESpHug==
X-Received: by 2002:a17:90b:2e47:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b1b07e9b25mr4925477a91.1.1794686238731;
        Sat, 14 Nov 2026 11:57:18 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec3a903sm10737441a91.8.2026.11.14.11.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:57:17 -0800 (PST)
Date: Sat, 14 Nov 2026 11:57:14 -0800
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
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 13/13] percpu: queue the balance work on an unbound
	workqueue
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-13-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-13-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115714.04d384f992f7a635@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Reviewed-by: Chris Down <chris@chrisdown.name>
