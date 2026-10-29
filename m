Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237808;
	b=ctd3Eprttc1F4uSyTB8ACqwe5B1sdi4GilMWTamxdtKV6HaOwoSA6txmxzXVqVbw4JLs
	 Ljl5siNMPBEn1GS/YzlimoOKF22HjY8DB9iTF6PS7UTxJ9rFuxgmaqrxlCDQmRYqpDXUx
	 A5VM0eNSQc6A3gjHFG8v6uyPi9ggCykHf+3WH7ze+nNOQN8+p2mR0o2VI4ujBj7lADYm1
	 jCRLOiYyAnlaqNHffr5+GxKQYVpYa94RebvtK/ANI2f0YtssLBi5ejR/RTx6/c3wgjlvR
	 GOjtgr9WPm2ACLzR208dHvX8Az4YmylGwyCVxV5FRrkNimbzMpIGBglqTJPtEgKqpug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237808;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pesJ8o4EooFTy8TeAVTnkyycbaj8b9KERG+ouz+svZo=;
	b=Xzq+mVBoQz7bwKrOD2b9WYrlUy4M5dMzmTGeYa9X4FKc/GikzC2ep9102jw705kqR8qv
	 GZEk8OH6A/yqmPdWAPmiOAtWQXZB8lTjdYHdViozBPvmaDlGDtRSFMZixNhjabnTV6ow9
	 ZwY8Lc8KRKNsdXVUSQ84pqe40GJCkwFOjN1yXJxWMy48vAV0wsy8CXOapd/HLlf4EDqRg
	 z0SISFv15qiE953/HCUEUfwO0s+aBJ06r+uk6VYUfgatBVRu1LiQdiLEb4pLrIpYjYtR3
	 pd+k8brXg/Zhr8Jf31YjFXHaxPC6s04RsVbIW4TrnFD2Q4QRlYSKQC3/0MGluj98pgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTY5nO+x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DF9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTY5nO+x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10601F01825;
	Thu, 29 Oct 2026 01:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237808;
	bh=pesJ8o4EooFTy8TeAVTnkyycbaj8b9KERG+ouz+svZo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=iTY5nO+xZq5FIpRm3PNEeKzZTaqT14fYvsy/M+3OA7e6px9NerDL/TKNYKtoqBdgW
	 elIeIiS+y8/QsRKGzjJIQefIkr+Nkgk1hIw9VkQG+nPFDGN66zpJU78UOH7SSLLwOY
	 XK61tt8466rNkiXKzYwCVj973jYJPozAdg4ECn6lab+37RcQ9euke709gqNkKCNvox
	 d8u342wfE21IwP9hmHsOBu1GGrk677ZqUEbojYZDxHecbX+9cfP3WDJhlubAJhEe3j
	 SvKugZILCcfB6sFgt1SVFTchczn58itNBrDrJiwEvXz45k7knUNa+JQXJyOYV0XXdH
	 eUHxjPP+bnwKg==
Message-ID: <09fa15f8-706f-436b-a333-dca402180fbc@kernel.org>
Date: Thu, 29 Oct 2026 09:36:44 +0800
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
Subject: Re: [PATCH v8 15/15] f2fs: make compressed files compatible with
 large folio
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-16-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-16-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> The compression flag is the hint indicates that the inode can be
> compressed, when the inode is using large folio, we expected it keeps
> using the large folio read/write paths and its data stays uncompressed
> on disk until the inode is evicted and re-read
> 
> Let f2fs_write_begin() skip the compression overwrite preparation for
> such inodes and remove the compressed-file gate in
> f2fs_read_data_large_folio() so the data is simply read/written as
> regular blocks.
> 
> For the same reason, reject F2FS_IOC_COMPRESS_FILE with -EOPNOTSUPP
> once the inode mapping is switched to large folios.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

