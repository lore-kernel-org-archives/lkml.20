Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914718;
	b=QLSmF2fVDanzt1UGBG8bEJYE41+VvGUd2ToEX04XJ6jOqrhliDeaiOHISGEdA5QKmSBe
	 v/67jqQhCSNPeiJqBFAFhcNgSMRIxkAoUoH3wa9eCNGok3HPLEXGwAP+v9CTYBN3+OV3S
	 tK/ek7Hf4CTO4hm7pRpillx2TWVDxbN1/0Dh5u0gHYve/BGkux1xFVWirVrPu7NQY7bBa
	 4Ql4E8zG6zxv66Fjaa4GbAmHBw6ny/NAx4FOfdCmBkNWyFHD7JuaeX3EuuQ1yWrQjuwEW
	 raQAkaW8MTGNAu98Hrre63MCJtx7u9JNCSokV1FUewygam4t6MbwHxn0IDZdEG/uNUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914718;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yl5icuEXIda7IxOjFmHbe1+uqtm5Dj+XPSKgMl8VH9c=;
	b=U40Z9bNAEgDsg8Qd7+yhnKNoCkzGaSb9sVRBohfi9Yi4fSFPxsct4t6NwarbQ1bDskag
	 c301zzNYKs3qLwvYtMjh5tyrMuK6FYYpQ1Dn8fdpSndVt6/8SNd7U+/B+i7keHDjUZFI2
	 hlCG5/Cz6tyvcZpikW/RCNn0F1MgQEA2guhohcqqriH30FRJIKOsG2DRA4I6LiTSBIneR
	 gxrLtPF9XVSSt5WD4bm1rOi4S8yF0i3ACQgafJrP/q7rsie9PbjBvQY+xAapJJUQZ1paN
	 6y4PnqTQjYPIIZd++OY8g0BbEKiAYv8Rf6cb3sgmeCrsrQjKWDUoMcrEuDtMuvYfP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZ96EuAd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZ96EuAd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDD81F000C4;
	Tue, 17 Nov 2026 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914718;
	bh=yl5icuEXIda7IxOjFmHbe1+uqtm5Dj+XPSKgMl8VH9c=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=iZ96EuAdmCsE/PAZ7iW0KBrDhbSoCXQPCV4mWWIOrYU7LizxIKieHeOKfnNo6nyB4
	 S7JDi2Svx35NAfydILBEArJMOkonFq8hJGr+ppYAMZ6wF1iV6YbhHOf5njBBHQAvyH
	 lLJHDOSNcDt1yrdbMrdi1GvC+ggtAxRaaAVaWL1mwYn4ERRW31pXhuBgNSixlgBc9z
	 2/fOOcVm3Xmxg9uxKlgxRSWV6xi5tXbSCzzrmxk51X53JwdrrqnUxk0A9eUSdqliTG
	 pDihVFSADSE+pDuv8iaqKxFJea9bBLV3e8jPm+G+ezUy47Ze24zvi5SDUSF3k4EFu1
	 g2VfKxXIg2M8g==
Message-ID: <31d5625e-226d-4524-b4f5-67c2d11b3882@kernel.org>
Date: Tue, 17 Nov 2026 19:25:14 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 12/20] f2fs: support subpage blocks in
 defragmentation
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-13-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-13-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Mark only the target block, not its whole page, dirty when redirtying
> data for defragmentation. Remove the -EOPNOTSUPP check.
> 
> Read a multi-block folio once through ->read_folio() instead of each
> block synchronously, and redirty the folio that was read after locking
> it. This also applies to large folios when the block size equals
> PAGE_SIZE.
> 
> Read compressed files through ->read_folio() as well, with any block
> size. f2fs_get_lock_data_folio() reads the mapped block as it is, so a
> block of a compressed cluster that was not in the page cache was read
> without decompression, and defragmentation wrote the compressed data
> back as file data.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

