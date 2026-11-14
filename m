Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686226;
	b=G9Q+vbCC4UrsG1+TJZgf0GCUbnNYFp9pxCsZmS2UDcIptj+f1915XMyTmkeIdrZE1bab
	 VyvPvG3xhpW9sdFQYtjp82fQRZOPsqFfJfpnZKuHcP+JmYTVVpQK5RI8y6mVLAqwF6ahe
	 +uid/FoaHt+dZ0CvJp2kq8G/AqpjlyBBC18yrij5V49MCaxNxJNrHLvoSfRRvaaJf6dLl
	 ZsDpfMjJenohWbgyOF3KS3naecJ5Yde+KgXvmFgozcrnCsgJN9EF/xKMaoGsurENwm9Id
	 vu8g0wE8AIQOYt3s1yFMNV7t8XsiWN7Tjml6gLk2lrhLRbtIZX4g9QTd5WlpLvyypiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=OCVS5zlhrjN9ps/q5PiJQ1tTNBzYlAwbpXMt2B00TDw=;
	b=JhIkaEtZGsJKgm5rM7cfXhJGdvANrDjFtS9XUEWARenm1oXMKLw4R6nSkCTaIPKiQpM5
	 yqjWLAsjVaxXOomrMhzDQpPiJKMp2puIh4SbYnZYh9KlV2wn24dK/hjMVzfW03nect3pP
	 F0tyuQ34L/sYUzsZGz7NzRJhuerBOSXzSpevxaa+MTJIpzl6ILje5qLeGgNxVakMvFAOc
	 nH7pP9UsDjn9hYE7J21nnVP5RLda1OQB+Ckkssy9kXYSjSbIaONDd8s+grGZdaOPQBAE+
	 XxE2DB2CZabm5gja5cFx8+kW5n1WTEvxNTO+D+ocsFOKL+JhQbn8p+LYrWmIgp5Tc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tKE5crcb;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C8660A3833
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C8660A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tKE5crcb
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1174526a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686225; x=1795291025; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCVS5zlhrjN9ps/q5PiJQ1tTNBzYlAwbpXMt2B00TDw=;
        b=tKE5crcbDd+Y66qKVu1Vo3c+QvvnO/kxPzwoZf5v4mpLE2ZSeWaCIBA8P4Ywjwk8LE
         6eAKD0Ql/Z8wrCqplLWn+PPZALQxAhRRDPVpspMArDyx0yyERP6CerQs47nTp/4HbwZT
         CPItrLkJkt1N114ET2W8m0L40PB9j/iiLow4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686225; x=1795291025;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCVS5zlhrjN9ps/q5PiJQ1tTNBzYlAwbpXMt2B00TDw=;
        b=totZmZE9hAbJG9mM219qBL+BMBdJkVEBA9EEg0KQdyRaC8+XbXMADOe1pgaGL9TerL
         OiW/OocpZQKypXaenKKs01wyMfCB91fIJ8UqyGZV8dqukwbzRxJeEdJWrLCcBOiGHFF+
         dAhPytIKPz28PItiJV6UKT0l9CzNz6PFweyBiMNugJ3Wyex6IOpMuhRoe6szMHf3xTDA
         0ObSfVPkMUvhz5MQFHKaRg6Hy5/Fh432ZPij3o16MSKn5v8Wxh5fcMaSxg1EmISIlx1b
         sBbCpcfsdTAQN4fInWx9JlxTZfQ4hQTWH5EJ+wZkhy4T/nH3QT2cwsQpgAYKACe5npH5
         8ioA==
X-Forwarded-Encrypted: i=1; AL+hErFsv+86J9ZnZM5vqFHFABxsGlBANmIOD8M8Z7VZZyXk9QwKM1cCOUSLFQaiRxjan/U9QQDpu+c4TRtuLmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iAUMvWVeQzAt/xhXC7PX4sdLejNNOaiETpU3zcTEs/knTNtuR
	WCKseyVtmbwOFFHgOKq+0jC/IdskjEMe0cO7l9uuxnRhFgAhTAarQvm5WEZjGW2n7Ho=
X-Gm-Gg: AYBFou0Taeujd2D+J/vWETe/u3zMirmEcX2F8nNHXBDHY2/87MoE3dy8juUod2defVW
	M8UiBKWn9KSDNo27uVFweHludj3Uy0E3e180P+9l1vQ9g+Pd4u5xatq+D3h1JpWK5+p4QdyzcOA
	u6WVbNircoHZZ6/+EZEOG0Ov/mu7hIQ3ofXUQfTQN9cNgX/M+axvJNbjU4g/hvN2hT0rcz95sg7
	W9dDbWpOd3e6luJxyEKq88bJ53zlRGJ/HqQP+wFPb+bVrNf9UwLgqazNu+/W5VGmjjVfWt1d8xS
	TabbChs3JJeghLT0uwdyRwphTTxMTH3jEG9kO4jlBxh+S03w1eOpAWr/xWFpJSK8QpVqnkzL81Q
	8uALyui/FN+fNnjqyIJEG27+xYT3DBnX9VUA+8HegrH8Od9ymGwa68iRLh+KXqvwK+ggMvOUdBB
	TwdhuBwt6CSXGjHT3N2mwrXCSgoTlsKfbaAXNmmbL+HSwi+wAhYN+KWrIqRTiq4tcAM0LQ2bxcf
	31s5T9A8OB64XV/gyzgLlym6aqe5WwtQ0JPqgui/3dHS4ypVXawdQUldviLdT8WdkXXBE2XGlqA
	8dNc0tc/bl2VWrs20iJ0G3PXn494PjJZTFBJ7sDjmF+cFKQG5EWQ1Ns88oUdMFz/9qOLkZJcxID
	j10DkEKTwm5ydcx04YVrC66aOGR/SRFQwKyaWosmnmzUoFUHJn8x18qLXtWHJgxMcYxA4vhYQCl
	ASsmE22h+xAxqZz/iQHczY1wT0ZP5EsJI1gOkWeHy5lYc/mlN3ee5yFng=
X-Received: by 2002:a17:90b:4c8f:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3b1b0b983efmr6301490a91.46.1794686225426;
        Sat, 14 Nov 2026 11:57:05 -0800 (PST)
Received: from [172.22.0.2] ([4.16.0.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm9589262a91.10.2026.11.14.11.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:57:03 -0800 (PST)
Date: Sat, 14 Nov 2026 11:57:01 -0800
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
Subject: Re: [PATCH v2 09/13] mm/migrate_device: fix use-after-free of the
	anon rmap
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-9-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-9-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115701.3a5f64e24081d09f@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this with test_hmm evicting its device memory while
the pages are being unmapped, and with this applied KASAN is quiet
again.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
