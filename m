Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686201;
	b=YIkUJrU47Wj544Gr6QrLF4E96VeaK/0ohoY1h8RjX38kmw5xkgzXB8RPC+GbgcM34z71
	 0TD0u53j9IO/TFFruIsNs2ARiRde7HeRmFb2NUPp3mVT+5+ldAAcakPbuhAouamf3CkPr
	 6jsLE2+iO9+u+6zqEANLP1uXetjkHDRieg1jSLn2PRaJPySKJa3sww03ksOJ5I3RIN6Go
	 AtYL2MhEtqGdALckg6Aiw8nIvqxTuCA/ex88fK1VUOjQzKgeBdGvobfkc4QZB9PbTRP6w
	 E3LL4Ya98TGAEDdHh9x4mlnGbOzl8u2qlInRfnLLqc89PXfqIkDwRFnxuw9LKVD9RFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=hrbRKPtAWBgGhGonvqRjGeinfUOoIFn0EQDX8I3HUjg=;
	b=iKQYEzDv3Pp5p1VHICd/cVwqKCbKLcN7/DaTvIbyaIUXp93hP+xto1Ke96JcTBa0Y4KN
	 qvSbphjli1AZpw+2eYPGof6uOOFjNSsZQwX8j6wjluAW5gs5OqnS6HKvLOz46Ggq6mIKc
	 oygdnUCcpyjGOjJy2c/vs8hfFl8BJ/Mw398z1CSueYDMDvGiUl5XV3DG5ijQinKtt0ghU
	 oJ9II+9dYeOvUHCz1sb/XOCaFBHN5UHHbUtUyOB18vNWUc+7okJszAaSbRDLTLzSfnzml
	 HZ6IJmC2JH6JBapT0uOOfTpgnxE37CbMkLrV+n9ablLuVMcJ/xYG19J/ugIT20qyUJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lpcmlxvR;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB1606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFB1606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lpcmlxvR
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed0e2015aaso10620025ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686201; x=1795291001; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hrbRKPtAWBgGhGonvqRjGeinfUOoIFn0EQDX8I3HUjg=;
        b=lpcmlxvRCJv6hmodqT+/LEBuEuDWpXdlNC697E3qnM/e+bB7/yFvvagB8D+XlVUznC
         H9Gh+uMyZk6vMTFr9lj5LxMxT7Iqjk1a3TTjFBBxd7fRKm77L5p6ygoG6us+ZOCCcBDF
         xSpNSOo52o3wKLo3xPx0W/LZNB7yUHiEy3S2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686201; x=1795291001;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrbRKPtAWBgGhGonvqRjGeinfUOoIFn0EQDX8I3HUjg=;
        b=RGPU4xoW+EnofAfQrsrck2gPPuSFbIce4s80Rz/PAEGralp63n4LU0NqHOZmdHf2Yl
         n8o4JeG5bU4U4iLQB7VDHLBOeJnCrvJ1fRfYm0X5A54HLrPUpHmnNi1lACGlkFhDDxAw
         025txBqDPdR1j0Ie6DP3bbeD0PndvIbAY6+W+7nlVEGb94fvclQ4OwnEzYVWvU7kxDnQ
         vyJgqeShSgodGEONyBRSzI626NdGPBu7es+vzZu8kOHG2QPTp080BuaXOXDIq1OPlTRU
         hdyzOIkh2pJwoIvrfvKSJxPkPWMQMpqmGc+mZdm9f2Srylg1YD/xRsuqcgMbYGnMZ3tV
         AkhA==
X-Forwarded-Encrypted: i=1; AL+hErE4h0xuySuQoQSRrVN3ZeHOpnzfs3jLiML/clgun8MHE+qlKnb4P1xy0nWwLvVrcjjITsPXEczUDbrL/lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eujMSFTCRSajWqbwUq1yY/UcTaYOukzjgRo9UCqKA9JD3InfY
	SPUaiDxCa6FF5KJedrXZdqrUVeko2QtWqK7VE1eiSmaxJMigkyZoOHcQt1GN0iQ7Vqc=
X-Gm-Gg: AYBFou0IvxzC7AHUSp+w+6FtJ0Yws41qMbsMaG1AcSZnjJ6rhSqEdrqzW5Dgdhj/T90
	rz+Sr8/bRv2YNSUKiPK94V6ZKSIDCoD/iLbgiGrvSkmfvJMUgIhSksZriqZLmxj2zwpkV4jGjj1
	QRJQpBI2FR6SvwBJxdQq+vSP9nCH2eGFsXm4uXPVFcNLc5IqKqsXyVo1nGzX+L9m4smoCusIDz2
	JM/mcFOVNmYE7IHehi59If8MV4w4BXZd4y7DQefoBoF1ugOhlQiwMub4WWB8L24U+IgLc4Yz50N
	uftVfkL6U/bmbtpIu1oXRrPzfc/K10O2/e5wxoHSXjaXfLl2nrkXdcJU3983gSGUyKsKfrl+Zt9
	a0X4uL/rJz0WamaHbX53MkvyhGWSsSxxs/jjPqufjjoFWktBnApW8uBxdz3M5dGMcN0dBDI2dgd
	k5Ogtx3TBgUK6H7hyvY2Esafn6bUdaa5g5aSGoLZ4tHTtrnB/HGPm0NeGqGW5a0SywUINmW7EYF
	Ae6fLl+DYXOmHTPtHPtiCXiWKk6j9kYkV9X9ZtLFWL+9newntzNJDJhqUuyxAa9P3Na06H3HDal
	MZFrNFIbl4BZ+gzU9gsYpZyw+kdd8md6ix86IbbFnj4Zkl7lL7gNNnrZm3YFZ4zklQTS9DACMcS
	59NpXllurm94SvZWdNERIlaieZjyCv5rEqJDScDQbaSZ8XMhbSY9KyCZGRHT+JWwT0oab+zhxmd
	t2sog8196mtQE7+SmgkzRokKBXO9G5t/BCSXcbmiTFLUwRvPxZA0lLnNEU
X-Received: by 2002:a17:90b:2e06:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b1b07e1cd4mr5830748a91.6.1794686200819;
        Sat, 14 Nov 2026 11:56:40 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm10008894a91.12.2026.11.14.11.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:56:38 -0800 (PST)
Date: Sat, 14 Nov 2026 11:56:35 -0800
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
Subject: Re: [PATCH v2 02/13] mm: cachestat: count each page only once
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-2-50a2ed382b61@kernel.org>
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
	<20261113-mason-migrate-et-al-fixes-v2-2-50a2ed382b61@kernel.org>
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
Message-ID: <20261114115635.8346206195d50372@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Lorenzo,

Thanks! I've tested this with cachestat() racing against splits and
collapses of a tmpfs file, and the counts no longer come out too high.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
