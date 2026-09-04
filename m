Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9897353A85
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488252; cv=none; b=nG8M6M2vWFh2blVYPRFWIsSqtDJyzAoe+7Q+IEZEMsGl9wbJn7hn+1lhM1Ga1+w5jPSYXjIezRp5ER+HIOb1mdVzp/fASW9e8SZFeKAERmjKQ20ZkEaI1qtbJkmcL2J7aXj9RsSjn/v7Trq1gXFzoHPNit/9hk/06BA2l+q00LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488252; c=relaxed/simple;
	bh=lxlSqBIZwwdKBKgRRbCB3lCy1C2TZ2dycvT3/FrxU/k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZujXmWm57ej/gAoBAi3Vv24i70exi8V2GV9/Wtw42j81JPih6r8vhRVpkWH14Asvtgt2MUZ6knEoLsZ9x8HkXlwVrCED7DTC+e5NNemrUjsQW0eAUNAomfc4WcXepIRzGD+VqYUqRIZ7Lf+2DkD1uvhAa2k6OqOJT/x+2MmEN4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGXc8VC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGXc8VC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CFF1F000E9;
	Fri,  4 Sep 2026 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788488250;
	bh=zmzW9Jc2q4GsNO5akc/QprJ0qoZqw0IR6+xzuvi2p1k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=YGXc8VC1ReuOK/q0lW9iyKjjCoMjbiew7Ma/QcxW0w27SXa4GsfWh0HRP5iEP/uwH
	 X9eouJrP7jB6u4AKBJVuYKVsD3TTGu87hWp+c74hTMr+Pmq+7IMLSL+XbEqPSg7kah
	 P2E58OkoJaO3Di9Rhq8dircjkmRnuqj17lvk3JRYCUdtzLvaar70CbcXhKhk3vX+J4
	 2Czbs2sd9QK/iEHFIr7hvh+w+fLJyQQJZtuztADiQ2V7r4ZL56LNtLPDS90P60WxxT
	 abVsmOVYHK47hBrQhyjt7fgKSLBKf8NYJQZ96snFjny6XuHZ01NzlSLWcpxzwHXS0h
	 fT0dutAN1mARQ==
Message-ID: <601938ee-c5b1-4cac-889a-1b16e1615517@kernel.org>
Date: Fri, 4 Sep 2026 10:17:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/11] f2fs: parameterize byte and block conversion
 macros
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <7b563b3096652abe81f77edc886ab98c416f189f.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <7b563b3096652abe81f77edc886ab98c416f189f.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> Byte-to-block and block-to-byte conversion helpers previously relied on
> global PAGE_SIZE, PAGE_SHIFT, or F2FS_BLKSIZE_BITS.
> 
> Parameterize F2FS_BYTES_TO_BLK, F2FS_BLK_TO_BYTES, F2FS_BLK_END_BYTES,
> F2FS_BLK_ALIGN, and max_file_blocks with struct f2fs_sb_info *sbi using
> sbi->log_blocksize.
> 
> Update all call sites across data mapping, file operations, fiemap queries,
> fsverity checks, NAT bitmap allocations, and truncate paths.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
