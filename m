Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E6378D64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488142; cv=none; b=NdUVFb08GR8SIUA/G6bMyo33i0HxtdebiTins+iHP9bgZJxIZMmIg7Sa+hwAfwb/EMNkmhSzbOJvfjNQVcvIAoWVaNzc4KyxgxmRSDcQPhCgmLxw3ZASNShQQPFEUmApgXr66Aovz3h7qoyUZp7mEUR2wB7JtcHbeEBZ+Pre9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488142; c=relaxed/simple;
	bh=CTI2aySC6w7ORoG8p9FckRgqf0o2tToxr2DE6MFMntY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MNJJgK/tjaUdilLbeaL56pHcydrBfHVdXs2WC0TA77qW8af46l/OQ/5MuVbdrVgLIPJ/78bsWTlMikmjRyX/tSWTaoySF5vs8dutR/ef1nwDzbno1IEAbgxw9tHoj8MmbuQx05HVdw4ZOa11f/zdwQ6/4DHi6RDlM1Ea1SJqmko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdM8SVsL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdM8SVsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871211F000E9;
	Fri,  4 Sep 2026 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788488140;
	bh=TGpc85ZmL7Rumy/c7HrWsK71idv1/TYxsvl542ShOPI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=NdM8SVsLClnOeDdnodVRrwGf6ah7Ov9ggd1UmD0mT+nf9MpN7kCLf57pQ+d3T7TY9
	 w0q9itrzPREtsm34ThHC+NKakuKLFRbMPrNYyqmaw7ldYzVIwnGHiGiigW2SAc2X22
	 ofGNCLGOX8lxIWQt5UA2jXrmBSIByHGb7MwEaagppYd1PPc1UEeqmUHwXQZg1tkGs5
	 JQU2xF2tnvpQb52a+I6ZWObA8uvpd7k5FevLhwZD8ZvG/ZJpy0aDs6xjebAu+cGBhX
	 089jf/KFIR3kVes5/J38UGcq8DZx4eOaccNOIsId6zFweCWtBTmD3NzxcekTwYBlRH
	 wJuitvkBUcCpw==
Message-ID: <e179d20c-4ba7-46dd-8835-29ba00247998@kernel.org>
Date: Fri, 4 Sep 2026 10:15:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 07/11] f2fs: describe xattr block layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <c7005ebefcad46d6a0bf3b0653fbd3692b86a360.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <c7005ebefcad46d6a0bf3b0653fbd3692b86a360.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> The usable capacity of dedicated on-disk extended attribute blocks and
> inline xattr regions scales with the filesystem block size.
> 
> Parameterize VALID_XATTR_BLOCK_SIZE and MAX_INLINE_XATTR_SIZE to
> calculate usable xattr limits dynamically from sbi->blocksize rather than
> hardcoding PAGE_SIZE or DEF_ADDRS_PER_INODE.
> 
> Update mount option consistency validation for inline_xattr_size to
> evaluate allowed boundaries dynamically against the runtime block size.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
