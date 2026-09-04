Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A268381EA1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487722; cv=none; b=VGp1rhLgMuDpXJo8Bgg25NFHKbjy9NI8zeRlk03IBrJOLOyKOFPRr8pNBmg05N+hkaaQsy/F0AGaAyAzqs+GDIWDF+qMvK+c9pa+bY3hxVgyvt5Q3ymkF1ePqLhdFF8rk2o3RQiBvOkGRMOSdSZEpCH9BPm0EX90NmcjpQ6Ghg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487722; c=relaxed/simple;
	bh=YNGpHWRRmkMB+7aaSAJl1YwyvVDWDW2/rptsMc6gP/M=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qhfBwV9rrlij6Yn8I+BJ5Cl9labUqwDJ8Yf3aGQyQRMkWPjf+WlzKjTQEuTRWKtM3/JMDCIPgtySTSNGRQP1aTthXRWME5FyqEPOyJNWQTiR3JYTNsHjrHd2GSsSUyFVwOlAJm+aJ9JwhDEE9UfdCZLQ/IcWlm6GCqtzxemf2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WraHOTd0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WraHOTd0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE731F000E9;
	Fri,  4 Sep 2026 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788487720;
	bh=JpIiM9RS2dPe3RJ8h8GSK+A1sWoqyWBVYAWp6xcIy/g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=WraHOTd0ni5zX/RAWl3FqmsDt93nLAbQxA4Of+ciRMiFINODuH4Y31Y16Wqob618X
	 Fh2mCeRsehEgmbNVKXB5hc4LLhsXag/yfu0ACiDRuwEhZLnQuehFbNrxuGms3d8Lbr
	 Ng+T9RsRmXezL/dxF98u2lZmMgxyVDn74O+966bA/D2NDnLlA8gHMXO+rq0m7cajCg
	 bDpCTO263VkoH1VQdkDiUsas4F8CNTh/+JXNfVz42Sk27LGDoHofVOgJ5AL9cK+U5M
	 tW0C6JqP/Q1Ps8PPT1Z1nIhsRfsEbM8g8fQ9Jp5+G6PwepfyCVZy3PXM3d+78IlLy2
	 k+Gxd00wr+TMg==
Message-ID: <0b8576fb-684f-4540-974c-5bc36ceef6b5@kernel.org>
Date: Fri, 4 Sep 2026 10:08:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 06/11] f2fs: describe {i,d,id}node block layout
 dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <fa4246935a75c0c08d91dbf082464556bbb47d43.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <fa4246935a75c0c08d91dbf082464556bbb47d43.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> An inode block ends with five i_nid entries followed by a node footer.
> Data block address pointers (i_addr[]) precede them. Similarly, direct and
> indirect node blocks contain data addresses or node IDs followed by a node
> footer at the end of the block.
> 
> Describe struct f2fs_inode, struct direct_node, and
> struct indirect_node using flexible array members. Compute the locations
> of i_nid and node footers dynamically from the filesystem block size.
> Introduce F2FS_INODE_NIDS() and F2FS_NODE_FOOTER() helpers to access these
> tail fields.
> 
> Compute sbi->addrs_per_inode, sbi->addrs_per_block, and
> sbi->nids_per_block in init_sb_info(), and update node management, file
> mapping, and recovery paths accordingly.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

