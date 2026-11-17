Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913788;
	b=W2zRzl+RJn2OY4UAZlFRqNwecyXehcklhDCqgFA1PgxnNuieACoRsWvPFlChTiBKwGre
	 H+2Du4tPqmhGHFa1ugi1wpaM8AbWmAUCWBSjc7tXweScdqxmwGGTfIDlfUeEDzvu1X8qJ
	 UBjXj8szH8O9BG2WBP/5MBjDyK0dYeZdIcR3MO/PgctRft2+S+5ZY4LGExDo7APzId378
	 BAHqaBosiLt2dsfo65JmSo7YSVCCyezuXSV7Uo3Vw3bqbf3PjrC+At9IhWEdGRuB6lycQ
	 MFKEJh5GKoUjqjsoNSFAV34D7l1I8SGDXQer1JBMLLWqJCtiZMLDsboMxgtHBX8TvYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913788;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Jjy8BGHOPaGtQ/OXipxmCbCq3eIN0qjXNTsf9LR2DNk=;
	b=o9RuZJzjNOOcnZmE5nTA4pRBUYmHI2lGeX0yP/xl5zm8mT8P6pp9Gsef97A5rEoX1XP9
	 i2tAa2Fkzd53VADMS3O3zZwsFdidG3FlCyLrxfj5SYYNdLUov3jHQCIyP2Amysrzq/jUl
	 T2mzAa9nDsPJjXPvolL9PTVOJ7+eOS+/ETlk3K/y8lEmhyd4QhalN6Z5cgi/nTLX/AnWE
	 1OewDgI8gbJ8uXvGhXKE9+7MwfWlE6PkcAr8bszVECnEn03TDzbslGn4wjIowqSM6KKk1
	 +uXPjf/t7w4GUlvQMYbV3QSAg6Nz715nspsIfs4TkbDODY1wfd3oWqTA6TCQQpiJndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=immzbok0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=immzbok0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1131F000C4;
	Tue, 17 Nov 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913788;
	bh=Jjy8BGHOPaGtQ/OXipxmCbCq3eIN0qjXNTsf9LR2DNk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=immzbok0sAivMG0BdoT2MWaBHG/7aSAjc+P9xQZWXZ6sFtrXwG5Pp1sTOiwWUDRN+
	 ANGMYRnmJ0tWBP/kG91VhITt2zB5euhTdakRs8RkOozylAk2aWrVT8nhd76MV3SarB
	 776QLG2The9xgmKYfn184SF8iOww6SozZ/TFUAaeN3c7dcMZGFcJfcKk8tj1g1IU8I
	 aJt3fhvP5ukv2fakv6U1gAck6H+0usPJZHcyBXzhHpPfQ2XnfM6drUj7NNEwVhIwml
	 Z9QUqEWjlS5A9GCJk1//Xd+MyJa8Ws0FSfbjmHj0rxDp8UyjDvFN5M5538jGbTTW5Z
	 sYnM/w+dia+1Q==
Message-ID: <5757fccb-83ef-4432-9e01-2dffd712bd9a@kernel.org>
Date: Tue, 17 Nov 2026 19:09:45 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 09/20] f2fs: support subpage blocks in
 pinned files
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-10-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-10-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Pinned files must not allocate blocks outside fallocate(). As write()
> does, return -EIO from page_mkwrite when the folio range up to EOF is
> not fully allocated, and remove the -EOPNOTSUPP checks.
> 
> page_mkwrite keeps failing a device aliasing file with -EIO, as it does
> when the block size equals PAGE_SIZE. Its block addresses are only in
> the extent cache, so f2fs_overwrite_io() does not catch it.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

