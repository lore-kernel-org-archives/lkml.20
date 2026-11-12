Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501613;
	b=aEE/WqZbd543KgtsprjJxu4e5KSv/awKXI7DmiyHl5epcdrZ8jAbdV5eKeLo7CE9H0U6
	 9hbNMFa8WDIF04cxJqCDlzt0eumfQ6VX+Bp7U/aC2GcsSC7bQfeqT2J6CBVAECqOtQBld
	 hABfyempx+H6yjkmoLzAKA4Uj3mCbHXFk4i9YcKmKK7sKplwz5xwDNNADRQCzQkyiL9w1
	 pvlcnHmFCQO75GW4W0mxTgKqJvWOVOp2pCdX6A3jcNoWG7disG1WdoqxfRnXWxm5MjE7N
	 oV56YG6ogelqK2Jimr1Vd1yZ5gUoSOj6rCHmk7umcySKNJyvkfMPt/2II0URXGK+vvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=gtnUQwywPg0HjDfSf6ZrnT5Doe5dkWtLl9mYnrnpV/w=;
	b=yie4U99zcBVtISHf/VrQ/af/JhrLoabKSPxAw+Nm/4uompbJDvn4tM+scuPjAa7B+xgv
	 8RJkhlO5gfphxW/goLOOyLbwg2tYfUTnD5z9d4PCn4UHjGOLMd5q3NT9qTVxy2ed/YdEX
	 xAkpQes5v4DYoWU4uhpObZykCFL6kjpcyjRVZ6mo7qcNQ0elkggbcwN86DGH7ki/98pSj
	 QMYsKWqXJ9AR8koG7IjAxsQWATCD2lDLjNbX5MKxpLLm1bjzGSF4fKLvnGLGWBPEltt8g
	 OsEaBYrzv63VAb8ZDCk5IXATgKQkT5S97MWtRorxlPuaDSbrCEM/bRRgCt7hXKYul2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=O+DAQ0p+;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327C60A2638
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6327C60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=O+DAQ0p+
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365d725440so40377151cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794501611; x=1795106411; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gtnUQwywPg0HjDfSf6ZrnT5Doe5dkWtLl9mYnrnpV/w=;
        b=O+DAQ0p+eIDSWQW3zo2Q/MrrLgcOKNX8FdCMKb49EJWHINNSHZaTfsadj2jmqQ1g12
         LnLu8a7JhBPx0qycHLmEdEwec6SWcTnhAUd2fCJBOA8M90SPmDF0wCrtCqPZXQyPHn6b
         a35PVEXvOhs1FFJfGl4HQvD8aaPL2YOPGzQ5y4c/+OnMnEFPKZzX6fbsaB5aHAlwql6w
         Jjhm6UEGtNlv88Hxte+DwArsoTMVDpUokmmhrD/VsRXL6lWI4d/IfGSLrv8eHbaQljAj
         EwFC71R6o2ws7Ex2IpmCb0VcIgIe68rZbENbCyZxtGtQzOArIzNbkHa+FizN6w6FoC1e
         0okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501611; x=1795106411;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtnUQwywPg0HjDfSf6ZrnT5Doe5dkWtLl9mYnrnpV/w=;
        b=nD5tay5HWU5JidrGgxOSZP/adktIP0LiDUMbr/JPXRPptDz6PEo4cBbmvt5HMfmUUH
         0OxCBW5yNh8/L4Gw4lRowCw8j6Mab0oMCoe6OpYo1pDolK6Xn3GZAdIOHGWiG5TAfZJV
         djykepXxjNXdD6JtGd8WwGfCD7WzNYKJjN8drX8kcXICM6veKnJ2KnLP9XCTK/kuJpby
         J2RlzK3IwRezAtVvBLxs/40SJfNVI+c4onnVIzlL/GDD+u20jHrkRQf/28Kzak7dvH7w
         IskiL9FXnpwPH2xjAWL459yxHRgI7qGn/Zri8jkc2d1pYW0REsGCdF1V9gL6khazWEhd
         n8/A==
X-Forwarded-Encrypted: i=1; AL+hErHBSwNinJ427q+cnm74m0fcU1nNw047Aq8qH3lar0fkpjxoyZIFK5As8+6paiaIrSyacNFHRDsXzpguTzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z91kA+xe/gK+Ufg5rNzXWYnqcJMF5eM1jrNaLTYSM8n4JMDPiD4
	urX36L6QgTpB6Udoa1XOffi1ua4/L3WH+pqctOyZ/FAjqD3RQTvvMvg9zJXxTO9B2RY=
X-Gm-Gg: AYBFou3EuzR7HoMJaVr/nItfO4aFM0fgcpiEdF/gLV0WngxBrswhg0qvZgEUAE+AkuY
	ufTF6WijfRFx7CjuRi3u7zzOaP7Xx91ofka3Fpb+15pyKP0ZOK+EuJy/k5T+Le/kdLlndeEciWz
	V3cbPjbjHpjn+hrRsqBfMLHDlMzZsgcmO6RKRq92j2N90qrWz4tDSYaRRhqg4pU3TJXcQGui8n1
	vo0nAObjnKFOH9BV1NZefWpO+trVcHPrAs/UeamiHIO3fBRQmJ7yKb2Ean8ktf436oiFKHT27Gj
	0RizyOYFp0QuvL2oZejC30bwAb6Kg/pqGez9zwe8bXAM2B5skrokm6RceskSZXamUDvE5V7J8fN
	Q3TmEhiFf+/cOF/ufAq2LmyfAOPyLCq4C0itn3vvcQQn9hErLpTP7Pyk3N1A04T6wM93bl7/vxF
	T1sInFeypx5ibmu5NTI/upRZh+uqm4ciQ7MAI9hwQbacuK2f5Ho4KEhqlyk+vB2E4IJt+UjK4xL
	d/UpYuJRN8RQPvoaevNAsAVEHnBPc+SqRgP3vVr97CMH5M7mtiAAojED6xo1QFKBMz8UG3a5Rzw
	ZwsEf5TGaLcwH6AaqInCPYL96E8+fHN7HRO9D9ReBxI1uwhtKJF1RiJc+lY5NVHK9BFG94kgo5p
	oT7kNW/x1
X-Received: by 2002:a05:620a:4626:b0:945:ad43:1d59 with SMTP id af79cd13be357-947b000d7a5mr1094709885a.75.1794501611290;
        Thu, 12 Nov 2026 08:40:11 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ffa11sm759904885a.43.2026.11.12.08.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:40:10 -0800 (PST)
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
Subject: Re: [PATCH 03/13] mm: cachestat: restart the walk after each entry
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 11:40:09 -0500
Message-Id: <179450160935.482102.15213700511149025586.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> cachestat() can leave cached pages out of its counts. This happens if
> the entry that the call has just counted is replaced by a larger folio
> that starts in the same XArray slot.
> 
> The issue is that filemap_cachestat() walks the page cache under the RCU
> read lock, so racing concurrent collapse/split is possible.
> 
> Thus, an entry can be replaced immediately after the walk has returned
> it. When that happens, the next xas_find() skips the sibling entries that
> point to the slot of that entry, since ordinarily they belong to that
> entry.
> 
> However a concurrent collapse_file() or __filemap_add_folio() (when
> replacing a shadow entry) can store a larger folio in the slot, in which
> case the sibling entries belong to the new folio and the walk still skips
> them.
> 
... snip ...
> 
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: squashed 2 commits, fixed up comment in code, and commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

