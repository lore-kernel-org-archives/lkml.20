Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D14311968
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486543; cv=none; b=mwPdxRfXe7AlkNUp9MfJJiMIGugzwdWVAuyow74IN7apnvHGlLBYmIh1tC1SQ1ef/AG4nyvdQUTH8gwCd1TiNe72+B5pLw2kuqvUCKyZP9YjtejlcJp9io0I7XSRr3p0YpazqA5RYILr4oVxWuQwzZ4qF93191dnTsRgkvBq9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486543; c=relaxed/simple;
	bh=KJ9BWyhIBouLzZYY6QunTILdA5ifd1aLZJm6BxaD0zg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MBf2iSqGqxt+/96Z6gzcwKWBT3DXwDjiBEgQpwr4Qg/BNQhKHxQDJ5B3TatfK1vJLVA8SsfqpEBO9yzQcMt0Yun+RIsiQSCAuJyyI/KEcSKN5yBLImdjF0os6T4Kz8R4Wi8v02hFIQPkiQI8WrbEmVMgVb1fevSekQ1nBSH3BSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eO8VG3/J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eO8VG3/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172421F000E9;
	Fri,  4 Sep 2026 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788486542;
	bh=rgJ9Mhwkc8zl6eBcQIIymxRLlyvZddHHSbz7YMxQhis=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=eO8VG3/Jhp/mQmGtP7LStTAh8ZxBluGkcF4cNzPipNOLYsABNoGxvb1S472ulTfFB
	 L960514KpiBam6MuBG783hPV6O90xBHsotMlzWcZ3lY79biFKdt3Y4ax1BcfczNs/i
	 ncIDdp2h/lzisH42fWXP5FsUa1XNYiUquIMnKsn0y5vYMY0hzrnJfzabNdFxKFNZGa
	 im4rJaQT99vH9WAXz2UxesepPR9VLfpOfB475Ugmv3Qan4n0meJ99HVhsQtlFWIA0h
	 I5VdOZWfLFaj7Bk8JD6fMIbo+WWzoO/iRvoJq9HGtzpVbQWJNlbtmsjGIw+tFIgmk0
	 BJAISplu4zMqQ==
Message-ID: <eae9790d-8a48-4421-94d6-1f24469e325e@kernel.org>
Date: Fri, 4 Sep 2026 09:48:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/11] f2fs: initialize sb_info early in
 f2fs_fill_super
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <41898b6a3cc76d464d6d1d8774daae6c185e88b3.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <41898b6a3cc76d464d6d1d8774daae6c185e88b3.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:54, Kelvin Zhang wrote:
> Previously, init_sb_info() was invoked late in f2fs_fill_super(), after
> processing superblock error tracking, mount options, and sb->s_maxbytes.
> 
> However, read_raw_super_block() reads the superblock folio directly
> from the block device mapping using folio page offsets. This makes the
> initial static sb_set_blocksize(sb, F2FS_BLKSIZE) call redundant.
> 
> Move init_sb_info() to execute immediately after sbi->raw_super is
> attached, allowing the block device block size to be set dynamically via
> sb_set_blocksize(sb, sbi->blocksize).
> 
> This early initialization also prepares for upcoming patches that add
> dynamically computed filesystem geometry fields, such as
> sbi->addrs_per_block and sbi->nids_per_block, to init_sb_info(). These
> fields are required by earlier initialization steps, including mount option
> consistency checks and sb->s_maxbytes computation.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
