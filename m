Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8623AB9D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487087; cv=none; b=UVT6QutMsZGKBrZ8x7GwAcTOrlYlr5wJKhe9mgjSfQqhY5guSX2/MmqKzpgJrI9GlcX8FSAEprbugqgLHrn8BVMF9tnTlYobFrEuQ9+tD/MtphD0Ykzr9QysLjNU5yOx6NBnBkt0GyO/h06HfdEA7yg07laBEHJ3hrH68qI4t2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487087; c=relaxed/simple;
	bh=xIJVjAWyShnmoO9l270Msz1cOTeW5GVgw51GpKn5j3g=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U3KoMG0+dJe3OqK3URGITOG1gAwe+3fkOFCELlZP6ndxBbGj/MdOjUhk0mhCXEh2yTZfBWiJFiG7Lfjh2SOpbFXxtL1mn61olpHMGGDKSr9abEXUb0p0WAQrkybPsgxyzvdKUI/BSqse1guoaIATlpkMJ7QywCvUNAon+ABDvyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHzZFcib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHzZFcib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388E51F000E9;
	Fri,  4 Sep 2026 01:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788487085;
	bh=5jRoPi4cTptirujGl8tv0MSWyBrX8XHDykK0aOfJU6s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=GHzZFcibisKvc3McRLctaer1hVGVRWmT9Gg5rW4UE5d+dHNsCPkRsSL02nz0FZGfS
	 q7fjUQRn02KHmiFBm6vqLi8XLjQQ06i2HRnhAdWqxAEeIuHBqlrntJJqXTVApFx9M5
	 oHoSBfQlrNIpbsP7dbje+/RtXhCvhRfaICoyLcjb8ghH8FAiZ02jj9J0erXYfSIoBl
	 8+me/L2HyES8KCLKuTKnOF2plowHOYYGOat4f/VVHAhZr2i1BgRKX1w5uSgLvN3SWD
	 67Z0ji2zhw60pehjW31wwjIC9FRtrJ1zAc93b927kiFm8ZXw3W86QQvRRkb6v81o/y
	 FWX+0lX/YnQNw==
Message-ID: <e491de3c-b377-4530-9ecf-f12796705779@kernel.org>
Date: Fri, 4 Sep 2026 09:58:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 05/11] f2fs: describe dentry block layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <3a430f1eaa7b07583d83828477adff5a90ede9e8.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <3a430f1eaa7b07583d83828477adff5a90ede9e8.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> An on-disk directory block contains a bitmap, reserved padding, an
> array of directory entries (struct f2fs_dir_entry), and matching filename
> slots. A fixed compile-time structure couples their offsets to 4KB blocks
> and relies on static reserved-space definitions.
> 
> Remove struct f2fs_dentry_block and compute region offsets (bitmap
> bytes, directory-entry count, and filename slots) dynamically from the
> filesystem block size. Access directory blocks through
> struct f2fs_dentry_ptr views initialized with the runtime geometry.
> 
> Update directory operations, inline dentry handling, and recovery paths
> to use the dynamic block layout. No functional change is introduced for
> 4KB blocks.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
