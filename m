Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487583;
	b=S+P6fII9iX7b0svVl5l8ZQW0RoU8GlYFH/wiA42sNTgolV5vYFSOhfcyi/Ia2OVo7/O3
	 BRCm59NDOsxbvvdcwnZYUpLPfDTwKQ3+mhq+MgmaNe8aZ13qkyNysMaaVCsv6IVYBFI6Q
	 rvN0Ilh+1nWCeTUT1bkwORqLWIqDRAZUEIK1hT5/haRyrmDLkCf5rFvde8d9gRc+Ov8/q
	 8TVefPh84cyfMoYum39QckhQtRIeBeOVsuytxcj7fC04oXN72joM2g6fdsfiA7l3eiOCd
	 cO14KbWTqGnfvQNOWU5Kegh9H+Cra1lTgEYSI+vSLl4b6pf+6piT4QtTJDv51zfmXLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487583;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mHbpHAKt1bZWR/t1RmAyLv7KC7I2S9cmqXACwiTOa6I=;
	b=wzEoz14bh1cixVXkC3tEyyh1Cuv5XixWbG9RmPXwSaK/fK3Mn2zcUSB8fXGDmKN6K1Gt
	 s7UEJwPsUZssboToRVcnEBeaSQWDf7FbFUCZJ/Ujc5S2as4XLKxSU0iKoa7emeTcl7lfc
	 yXPu25IYNjxT47jSj1QcBI7EWYxmmg9djx7ITdHHS69WeyUvV2r/i+5zrSH4tbHoIGM9U
	 PZwnCFEzXupX5Wi79IAveWgALE3njQsXFLGJ7D/mArOQk9jJKkOYhwZGA85G9FFXg1Ix8
	 X6EE0e/8Y5cSBA2+tkG1XYVgdfa+ULbyNtW/AG/KEDlOQkeR5KObJ4Uq6kM8koUCmTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXTrvqhP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F7606A335
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXTrvqhP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011AD1F000C6;
	Tue, 20 Oct 2026 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487583;
	bh=mHbpHAKt1bZWR/t1RmAyLv7KC7I2S9cmqXACwiTOa6I=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=YXTrvqhPYIGrkktbxH6stMxHn3CmHz0Ccs0a8ahDfDcHRKVqEdYK7PlwH3hxM9rsd
	 CoDjghFDOsdb5CnEpJl89uqgVEmVrGbYhMDMRRohluijFAITzsAD9u8SyLYrc+M9rA
	 FX92CSn7fb5/h9Gj4mv6HYt2vyk6cfqJ5ugSZbwXTuoHYG9wcm58H9L+ICHb+csH90
	 BUI5HQ3RBuZJWGyEMm5xUhRb7uGrwV9HvUnF23mbWiLeJHSeafHsLnRSv0bYi2nNGG
	 IC2kdBv+KCjKSgup8aU++A4x405E/GRCMGFxs/V1jIrYyAiYM2FdcSFp5iOsnmWGuu
	 +2++nzBI3TNww==
Message-ID: <18402f96-1c9f-46b2-8ce0-b28e1947e2af@kernel.org>
Date: Tue, 20 Oct 2026 17:13:00 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use BIT_ULL for mount option
 bitmasks
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260911143549.909867-1-daeho43@gmail.com>
 <06bbc322-f0f4-41fa-b645-e5291803506e@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <06bbc322-f0f4-41fa-b645-e5291803506e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

FYI, in dev, it missed to add my rvb.

On 9/14/26 10:53, Chao Yu wrote:
> On 9/11/26 22:35, Daeho Jeong wrote:
>> From: Daeho Jeong <daehojeong@google.com>
>>
>> Although f2fs_mount_info.opt and f2fs_fs_context.opt_mask are declared as
>> unsigned long long (64 bits), the option bit manipulation macros
>> (clear_opt, set_opt, test_opt) and context helpers (ctx_set_opt,
>> ctx_clear_opt, ctx_test_opt) use BIT(), which expands to (UL(1) << nr).
>>
>> On 32-bit architectures, sizeof(unsigned long) is 32 bits, causing shift
>> count overflow warnings and functional truncation if mount option indices
>> reach or exceed 32.
>>
>> Replace BIT() with BIT_ULL() for mount option bitmasks and helpers.
>> Additionally, introduce ctx_clear_opt_mask() and ctx_test_opt_mask()
>> helpers to avoid open-coded bitwise manipulations on ctx->opt_mask.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609111633.uyRbsEUB-lkp@intel.com/
>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,

