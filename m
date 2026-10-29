Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237762;
	b=wHHYHguVhs/9V7kYkyrnMGu3dRuTGpPsAMMWkd6xUV7EBtQj8SWvZZ9XEfZ2YhCsa5UT
	 Azj4ldvJb9D2RgkAdeuzJoxJl3WML0Ticm5EQSKFgr64TbnQhsG6qSv/F5Hvy1IDaGlhx
	 iPQULTOoSnSlMLNKG1O5e0+IFWZLaoBPUBbStFjjj2WaAHk/OrQK3erD7tPEBqzpo5yOH
	 KOSKnDDbOx5piZJrJ8Uxgemzx8vyQ2Q56SNvBHpElfuTflEZiIZQMKEQA8nnuq5AZCyag
	 dLl0L7Lmk9QNQbAXwffsFlNTNDEinao6A25lbiB3aVYFHpj+DTih2rI7rJvufP9vGLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237762;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+EevfTZvxcUnKDhE5Yo/ljInYUzK3Fk6rhV6FfGCq+4=;
	b=fK3UKM1mVsDCyjYAsAj1JkuqJYsfN+AObl6o0p6V5XcyX8qeaknPPFXq1ao7ndFcGo+K
	 gHh/wiMyP/0yL72vKGfD6EkL1hyv8ehXq2YhXYpRUAVCvMH5Fi/bVrWipx9ZbbLm1BLQw
	 wlzYoMQ9PzIChOf/W1X+TW6jhd21rS5aK2Cj8GAft9wMexSlAhMYR384znzJq3aY9RQ5o
	 Aco6IZgKhORLIqYh4ny0o99rEBRADlL7sTp8AzSysR9Kc+ZuIiUMrFHNz/ELN+lBozLSD
	 lmLrCUKjUfbhEXQs5lj42iozmYtVrSV3RHuZtgvx8VItodYg8IwOMMTz7kMgA8XZr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yp3RcGkQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB40606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yp3RcGkQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1CF1F01825;
	Thu, 29 Oct 2026 01:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237762;
	bh=+EevfTZvxcUnKDhE5Yo/ljInYUzK3Fk6rhV6FfGCq+4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Yp3RcGkQW8rJgoxNRJ8WdByQwR5CLN68t4LRwM1pmIJr0gvy/3RXxqIP1LoXz3ByD
	 fFv3E75y25kSpq372yiTNdLQTknbCw4X2yT+eLSI+ED3kJkWJW/Jh13N7XH0Xj+kez
	 VO3LbeMpqTlTl8kg+JxrL7XvwanXxgFHp3i+NxJmxVMZnk8OGe8GBBs3NuUgTGfuns
	 ebBWWCONWzuI5TMkToP1H6ZWB8xJ6UesDRctNV/g+MYRpjFshCd03eEqQFmyBi3+7v
	 MWgqETE5wMOAkNChjdxVWH4lPm2gH0zRDng749EciZADXjaS94LbqsuUYDiL7peP1+
	 Wo2OZXiPyCGSQ==
Message-ID: <b0356de9-4a86-4716-bf06-13842377e0ef@kernel.org>
Date: Thu, 29 Oct 2026 09:35:57 +0800
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
Subject: Re: [PATCH v8 13/15] f2fs: handle block cloning within the same large
 folio
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-14-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-14-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> With large folios, the source and destination block in __clone_blkaddrs()
> can belong to the same folio during same-inode operations such as
> collapse range and insert range.
> 
> In that case, locking the source folio and then looking up the
> destination folio can try to lock the same folio again.  It also copies
> from and to offset 0, which is only correct for order-0 folios.
> 
> Detect the same-inode, same-folio case before looking up the destination
> folio.  Then in this case,we reserve the destination block explicitly.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
