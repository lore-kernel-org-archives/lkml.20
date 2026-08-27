Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170112D5926
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793081; cv=none; b=VHEhBcgqaQTW0vw6ALdtRhYVpw0nTM5EkN5Zr2Wmgl/Jw5c17MT0a2ADb1JkBMyQF1mLUDxdFwvWKp2sd8N4ksfjJqLv6OY/e7qIBUDaeqiXQ6AXOp4GKa2B2lyP7GGHc+uJdYUlinsN0idqiqBcSf/BHwg42BkODyV7uaQGpNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793081; c=relaxed/simple;
	bh=sUxWWCdc3hnQ07IXXUyo/YEwJ0gSRVQ9FKxnOX19cD4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PNL1v1RfHkUTT/2UAeWa7GbZjPnaTHMHiMFIuwYyejknlNyvLLx5R+nuhlJVLgu1wJiZHhNtzqq+q8qIvfi9wfmkymf2xDAbT9486EEVDbna5Y7yxmhLL3cHQTKbNdw+2wH0rUmAIufLNR0rdgVRLPOR0zs35zwbbKWp9n7xbSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6ksFcHY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6ksFcHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A397A1F000E9;
	Thu, 27 Aug 2026 01:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787793079;
	bh=lQswqUI+tP5tEP71AnJT+zozOIMpYQqzkqDzCyPqMsc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=f6ksFcHYPUbZh1Tn9sUqGDmgITrLAh7zksSAf6NFfijFKWiusWXqMK8IYlwlvjSB7
	 w3Ddvm24Xxn08GrbnN4RdAWNT7S6SNT70VO2YVrpxKtVADOsbBIJhtX5S3BS9mYpgL
	 tEh2rFa9CQxIhmePlnNcsU6Mxxdj719HIcFAty6fVQGI8YNV3z7PaeMrBklRojKgcg
	 tIMoIf9jB4Yqmr+OwTP2/das7V4U2wTVp2sWTUFLlRc44+8BZB91bGzYkmrgiz2gNw
	 f/Nr3MQuC+iLXlqUQr7MIU+KKDJg5WRmOkwYfeyDumrWDxmJhBUE4CK06HiL4OfwnG
	 dpxKIYEUNGGqg==
Message-ID: <43d32505-41ff-4470-a75a-add402f14982@kernel.org>
Date: Thu, 27 Aug 2026 09:11:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support resizable tail section and
 unify pinned allocation
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260826153644.3726384-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826153644.3726384-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/26 23:36, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Currently, zoned block devices restrict pinned file allocations to
> conventional zones at the beginning of the storage (before
> first_seq_zone_segno), triggering range GC when conventional space is
> exhausted.
> 
> On regular block devices, when preparing for future online filesystem
> resizing (e.g. partition shrinking), pinned files must not be allocated
> in the tail area that will be truncated, as pinned files cannot be
> relocated by GC. Specifying the resizable tail area size (in sections)
> allows uniform mount configuration across devices of different storage
> capacities.
> 
> To support this, introduce a unified `pinned_area_max_secno` boundary
> abstraction in `f2fs_sb_info`:
> 1. Add `-o resizable_tail_secno=%u` mount option to specify the number
>    of sections at the tail of the filesystem reserved for resizing.
> 2. In `f2fs_fill_super()`, initialize `sbi->pinned_area_max_secno` as:
>    min(MAIN_SECS(sbi) - resizable_tail_sec, zoned_max_sec).
> 3. In `get_new_segment()`, restrict segment allocation for pinned files
>    (`pinning == true`) to `0 .. sbi->pinned_area_max_secno - 1`. If no
>    free section is available in the pinned area, return -EAGAIN.
> 4. In `f2fs_allocate_pinning_section()`, unify the range GC trigger to
>    run `f2fs_gc_range()` up to `sbi->pinned_area_max_secno` whenever
>    `sbi->pinned_area_max_secno < MAIN_SECS(sbi)` and allocation
>    returns -EAGAIN.
> 5. Expose `/sys/fs/f2fs/<dev>/pinned_area_max_secno` as a read-only
>    sysfs node.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

