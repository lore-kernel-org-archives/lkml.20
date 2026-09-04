Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463C322C73
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488338; cv=none; b=NLhRtPrafF5dq8gEUbkWrP2jERZSixEhWY/bHWvp/jYV9SvzcKw+wDTCYCd39Ei9/spVTbkA7JpK9yCDRn/AEwtL/uPKQyFQVk9kTBH/xOcVgthIwOO9aBjD+gCJT2WagOVdx0QAAAZzd4ZVvS+z4oeNBBqhWaLreTMbTw6VuL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488338; c=relaxed/simple;
	bh=Ej3TBWRmTR/2msl8GtzzCQ+OWJYboNiD2IMuxp4Wkss=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uc80sxTmXFYJa5jShoYA1LQxi8OiSIkTvhLb7H9spw8wnj1kmDJ4zjCDDGgZXmKRRBh/vUwaDCD1CEaXxJ8/Wr2alNY2ugNOsC/Mzu4Tzmi73m0MfljDcty4LYAf0eSkrhEhdZ1INGrjXnmbBiTJbiEh4hCyjQNKU3ZJQtoaTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4ZRnbu7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4ZRnbu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5782B1F000E9;
	Fri,  4 Sep 2026 02:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788488336;
	bh=zKKWz3YBAzRZ48fG4niTMaQ+b+q86yK1j5H17drXCQ0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=F4ZRnbu7gsjzTFY1903nrBKYxOWm3OaqozwOX8npEqxvtsSH8GZf42YpDe760hGTh
	 7JIY2pryIjSAaAAlGalY0g3IroJasFNUpDYs8ra/I2oByB89HQC/UdiF+sruCK52rX
	 X2itS3fSCP/B71m2xIR7XGxmA6Ij4UDuIqPuqkz7+czhleyHsOjzHHl8hFjDU8UtVj
	 BtExl1rUqkLq3HI7OSvDn8lVNE3JjBDHk7sbM8uO5RMCxWSq80hYymR/vQJkynggeH
	 nEarE9VhvsiNpKzt5jFe2TQsiO3xdSvA+HNQ5y5YevXv7JtFCkI+UUSHlVm3ZOciJu
	 g+NYFhPe9QFNw==
Message-ID: <b9851d18-b0d3-4b47-a889-e345d78a79e4@kernel.org>
Date: Fri, 4 Sep 2026 10:18:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/11] f2fs: describe node tree geometry dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <04bf8eb2c833d8fbb767558c49b53c715f6698b8.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <04bf8eb2c833d8fbb767558c49b53c715f6698b8.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> The file indexing tree boundaries separating direct, indirect, and
> double-indirect node blocks depend on the number of data block addresses
> and node IDs contained in each node block.
> 
> Parameterize index boundary macros (NODE_DIR1_BLOCK,
> NODE_DIR2_BLOCK, NODE_IND1_BLOCK, NODE_IND2_BLOCK, and NODE_DIND_BLOCK) and
> address capacity helpers (DEF_ADDRS_PER_BLOCK, NIDS_PER_BLOCK,
> cur_addrs_per_inode, addrs_per_page, and addrs_per_folio) with
> struct f2fs_sb_info *sbi.
> 
> Update file mapping, block allocation, truncate, garbage collection,
> and recovery paths to compute indexing tree offsets from the runtime
> geometry.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
