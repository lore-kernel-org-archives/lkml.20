Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587295;
	b=0bQsndtDm/RALoQe2NgdMQrVGuPQQrd1vtBDhHdIGkpiPSmt3D/0ajdj8YR3G5RIojJ/
	 IAjRGPShfhaF7QTo9JaY9LP9G68brB1bXZdDA3nHZrc7Cdgb41GoJnfXRCi+HGc9iVfHZ
	 Q/vv7QDx4R/uw4RaIFtN3jM0QLsOesymBdF9zOLtdMfmfABVtaPIBh9JXT2P9iNmxfZj5
	 sHr60xMQX/FwUAbF3wn3kQHC1gcxnEn2ke2Kobad025ILC8Th1Pvvu4a7Uk3Qe0Bao9a4
	 y04nHm95i2NkIXR4omwFdl9Xg/CgSlxPG9r1gMqdplW2gmBNowLWjHKsRbXUACei3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587295;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=horsUIAVxPOqgImLFlZZE276m8/SkX8ZSP/898/qyM0=;
	b=b8t0G5JWT9kjvNxtHBu4ROsl+eXZ6SkRZeVGtoDz+bMHT1me3xgY+yswroCG12IcTZxu
	 +K2RLbLojk5OOwkrQ55+Wt9a7VMRkTYlvS3tFoV8nTYXPBH2RBEONom8PJm9S40+R+5eW
	 372p07naL5+rdT+2ERF2MMj939aoEhWZMujUC4P18ud5jml6C45GuaPAb/5Ldee2z7w+u
	 ztOJaD4Lm2ARjnoyAxKMevHncKenckIVV/0V6GG5L3MMvpRQYtn2gOVK9p5Em0t5Nmu5w
	 ttiv88IT7ck4X5LIXlS+Rs72zI6izQmR7BC5c2JSSNhfoVGaDzEJOvhM/mcbkuwdLMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qzuhl24/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD73606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qzuhl24/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20FE1F000C1;
	Mon,  2 Nov 2026 02:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793587294;
	bh=horsUIAVxPOqgImLFlZZE276m8/SkX8ZSP/898/qyM0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Qzuhl24/t7qV/YgmpdJHsVJd1MJUAbZ1jBipxP2Xlvr7xYkiogzmtvuf6ENAu2Ga5
	 +O8c4GXFAJqkFCZUNiop5W9z0fyJpMMW9Mm2TYKMjMPsjvNEIoj3S9YUqvrcjipM3n
	 n+5DdMjjAtL/gxDUDkWK2r1NvPDZiHs4FrmT0b58hYYR0n0/2cGfR31qRnKJgkWDVK
	 cKqoodFvJVnS+fUz8hAnoe07sya4NcHkdcnLwLJgkWv1fa4BSDTeUEnqq4zEYmd4bK
	 bQQuU2jGpkq6vgOA9BCNMhhNL72XpVqTHGl0W5AHbPKMM1EWbYHiUC3eG3G3GXgcPf
	 HtGhw9kKjGgMg==
Message-ID: <614279f1-4306-44ea-bdfb-30f62459bafb@kernel.org>
Date: Mon, 2 Nov 2026 10:41:31 +0800
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
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: update inode ctime on exchange rename
To: Hungyu Lin <dennylin0707@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261102004742.55105-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102004742.55105-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 08:47, Hungyu Lin wrote:
> When two regular files are exchanged with renameat2(RENAME_EXCHANGE),
> their ctimes remain unchanged. f2fs_cross_rename() applies its explicit
> ctime updates and dirty marking to old_dir and new_dir, which have
> already been updated by f2fs_set_link().
> 
> Update old_inode and new_inode instead, matching the ordinary rename
> path. Keep the existing parent link-count handling, which dirties the
> parents through f2fs_i_links_write().
> 

Cc: stable@vger.kernel.org

> Fixes: 32f9bc25cbda ("f2fs: support ->rename2()")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
