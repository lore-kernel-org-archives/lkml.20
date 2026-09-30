Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E263A3816
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755848; cv=none; b=f+Io/EsTKkLfEj54L+dGV2cQH7E3YbkRb8llkhMMf9wDHw4KV8RXw3rysPP5ynmoy3/wm0tcA0dD/mve778dAEMeFwR1Jmjj2l85vruuSp0XajK6oSo7a+j/tgiwhWXwTVmO+6Z0L6ebxddTqjYsZM8e48liRXDytTt3eon+CPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755848; c=relaxed/simple;
	bh=Ls8FPKqhlupuVhz7MmlskkKfm0UweWwni3wkuj+jfvg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PybIrXWS+LMn2QlzLYXxokHozHY9jiPp9jVc1/j0R21mK+WwWbG8n/h3sCu8lejRGm1rDzfjEKCmzHQSLUYpOz1orjWzxvoDxNGqUSQYiucij4eTJCsHLFhMXv30HsXlNkObsH82nCYvQKFoNj8+e24bJ5Vn4l2vE/oQqtQG/3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1yWPbUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1yWPbUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188AC1F000FF;
	Wed, 30 Sep 2026 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790755846;
	bh=jZbp4O7AEq6zBMXrMUVa/0pgZAfHinTr8WzmDWALHlQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=T1yWPbUG3iO+OpaM28OQMX2lrKF/J6y5LfEooBGVEWjLX94L2dNBxIUt+j/kzt42C
	 f5QBxfG2pzJpNlFUN3vJOEAuiXwKtABqLfnhf1BBd6/SGfYqtpOFaoj174QHSqKYnG
	 DJMhGOCbLuB1eUyE2RaaRM5JiNGPSAUwdYpzJ6rDn63D+o/hQS7q+uLqDESWquL6Yu
	 MXcCHBvQkfR9UF/X91InZnFTV55nLQD5K27gFDoufjl6DW2hlmG2S/IbpmMXHO7bDh
	 nwjfdsWjqktoh8dugmG+sy5IBLJzizE8PmHDU9wArhaIBsDWm14pWh6xZGkLix6vIr
	 rrhpeEwY11Z3g==
Message-ID: <989ede44-7d64-48b1-af9b-a0a45f824ab3@kernel.org>
Date: Wed, 30 Sep 2026 16:10:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, daehojeong@google.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: reject device aliasing without a multi-device
 configuration
To: Seongjae Jeong <jsjlee1020@gmail.com>, jaegeuk@kernel.org
References: <20260918133922.8163-1-jsjlee1020@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260918133922.8163-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 21:39, Seongjae Jeong wrote:
> A malformed F2FS image can enable F2FS_FEATURE_DEVICE_ALIAS without
> providing a multi-device configuration. For a regular single-device
> filesystem, f2fs_scan_devices() returns without allocating sbi->devs.
> 
> In this state, f2fs_dev_is_alloc_blocked() passes the device alias
> feature check and dereferences FDEV(0), resulting in a NULL pointer
> dereference during segment allocation.
> 
> Device aliasing requires at least one secondary device. Reject
> superblocks that enable device aliasing without entries for both the
> main and secondary devices in sanity_check_raw_super().
> 
> Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
> Reported-by: syzbot+ae5b8eb92ed40411ce16@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ae5b8eb92ed40411ce16
> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
