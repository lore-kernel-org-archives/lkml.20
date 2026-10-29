Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237533;
	b=Z3K+EioY4zn1LyATIPy2nR7FEYP15dkoHhkcuiRpZiYzAXSF/FwrjzULIdd5Wgof/dQw
	 vtcK4Y5T35+tnGdsfN1wG+JsuKajTJa3H2gYVIHBw75VskpclnmF5jLzVv+PgnEYYVkya
	 Hf9WgM5TBD+YirAqxgQKp93nxVzX4Xk3SNLDetDj/BYaZzHualNiaIKRGybiA7ECw/IJc
	 RgtH9S73j4cQDdsJonKPtC/7azT8v9EP7cUhIIwN4UEV2XicvQ1zUUe7XuHwjbf+J5rsl
	 9ZouKbHPQoS4lH/+mIMA9ywNeb4YbA2DfgbiXBQgfcd9euRHHmY3Q9Nna9AveHVFd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237533;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Qzwd3lqgQUpUIDalWsKHTl4VuC3aenZLyyYKkGDGCsI=;
	b=05jLBtm4BLCDJ9ws6nZ30d9R3FMTQi1r1DYeljsSCMGRbE8cCG0j6bp0sgXuE/qjXCL5
	 8wTBqzfpQTdNwtAdNQ8kOKbhcGKRM/Lof2wzOcM0kXHdHFj9v25HjoLxBdejx9+i83hbD
	 t+JnzIdELLFsRuaGlwqt8IZ5kycy0N4/zv7lHnFRUzUVTfTmroq4iAS6AXgM9f2gtCL1F
	 E8ePoYKZkYQT0FNzJjQmk7NSfIdqumEnfOLWpM5z9WsDeMpEYIzpb1JqwNxb3bfSkiHxq
	 2yWKngf0cSq5LWkshd2zJgDbqEFIXO9i1Jdb9VBGobWZhttzUgrhNqlACnl3+vTHiyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZjQMdYe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZjQMdYe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B90D1F01825;
	Thu, 29 Oct 2026 01:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237532;
	bh=Qzwd3lqgQUpUIDalWsKHTl4VuC3aenZLyyYKkGDGCsI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=oZjQMdYe65ES+Yk66Sw2N7Xx2doNjyd7QyNk/WT/NJT4NT5YtR+5OMU9aVu/LqTJx
	 IdRhxVcbpr/kQvWYnL1mcRt3XgahUUrMyn375kztnUI23LDfSMzU63AJOtZVx2ZOV7
	 n6XGIzvguTahSJmvAbdOPd3j58d4IEW5074n3qZ+H2koxhJbrZ/ZMTfKRL4Cm5q38f
	 0vCNVQaUsTWo7g4hzcuFNnnxkzpIk4JNby4cezD4KXS5hMvLzfIQkrwlawyrvLqbYA
	 Oe4ll5l4e3VM3cxHTFxpVRWWxilTEy9IVSFzdDULPpwXVTU5PZ+ftM5SKNc6Kdoojs
	 5Qm8AMntwXJFQ==
Message-ID: <95ca4016-84c9-4c4e-8e4a-2b0802f802c0@kernel.org>
Date: Thu, 29 Oct 2026 09:32:08 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 05/15] f2fs: support large folio writeback
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-6-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-6-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Large folio can contain multiple dirty ranges.
> Add a folio-based writeback path for large-folio mapping files
> and keep the legacy f2fs_write_cache_pages() path unchanged for
> non large-folio mapping files.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
