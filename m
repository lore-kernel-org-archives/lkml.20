Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B72390223
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488445; cv=none; b=DP7/VbT6jCm0zSN6QSsSRJ/a6M5ralRW/zufRWCqOtjUMK9Ki6r72qlc/5ASOzwaXwEDgLgyeib3gFFgC6ErcAa6E3zWIVZzcqCAGp3401BYVYHSlpBvoo9diB8IsLxa3HCcsTG9TXHxKTQXIsDgIU2skHZ83rR0xrXfo2Bz2Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488445; c=relaxed/simple;
	bh=LmRRpTIaAy4Uf2YTxZDa0k6KX8V7/0/zMz3IGoMNbOk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lOsBUaLcawOY5C9nCc4nXBsJ+tZBg6Pnzj0vtgIqoIBvwagWjBVxd73o+y/TKMGP+MA/ZPfV1XcmaIOinopeZc4VhehwBmhiQXmmm6x72ISOATC2Bo4ER2oNStVqTIIws5iqPvUmq+1Pi5h5uZbbtx1bP5gwQalXU1OUF9LJuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYJnDsqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYJnDsqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B82F1F000E9;
	Fri,  4 Sep 2026 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788488443;
	bh=IwGKthmt4E7m/+iMAbRiXr2czfrqG8wwf4OU88unG0Y=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OYJnDsqN+TjSFFxCZlGrNoRHpa7/s0E5f+9hSaXcA/cvHS/1KT0V2zkKQNslI4xmW
	 vC1mBLg5roIKpMa7YMj0s9a3Ml2HyhQRDgXFFb/pV4BuSiIhB6etObzl8pVWUNMSJB
	 S1cEdwxhDYKPSuX0W5EJIyv/I81Ln85rwpxNuTUl+jwZZQBXma1KNr1swDeOejkIzv
	 5R9pZp3W8tGK/HZaLL1Bf0WX3hywfwL6qJebpBOLiuU/zWO+WOcIfAKjIaRIpZIh2m
	 YOMKvw3uRx5Tr339CzRrFyRD/cz8WN8zBaw6Z32siuL9KAwrGRf+PtlJ90bXoTpbq+
	 yaFPrcDUqUrlA==
Message-ID: <08d8d137-9e97-4c7c-ac2f-757539f921e1@kernel.org>
Date: Fri, 4 Sep 2026 10:20:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 11/11] f2fs: parameterize block size and mask macros
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <a8360fd9da798b19b33ef577b7af0ba594db3eae.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <a8360fd9da798b19b33ef577b7af0ba594db3eae.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> Block size constants, shift counts, masks, and page-to-block ratios were
> globally defined assuming a fixed 4KB block size.
> 
> Parameterize F2FS_BLKSIZE, F2FS_BLKSIZE_BITS, F2FS_BLKSIZE_MASK,
> F2FS_BLKS_PER_PAGE, and CP_CHKSUM_OFFSET with struct f2fs_sb_info *sbi
> to reference sbi->blocksize, sbi->log_blocksize, and runtime masks.
> 
> Update call sites across metadata operations, data I/O, file operations,
> garbage collection, inline data, and sysfs information.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
