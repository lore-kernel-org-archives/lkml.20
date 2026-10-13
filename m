Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633F1389452
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857020; cv=none; b=eYA4bVhU6igx88EHJVyR0biTv/8JvRKJd72pigTIEANfRuyMA0HPfBPuhQBJ1timFQR9inVF1tVjAA7EoYBX/OwOAsiVvlicYkZRlKh7DXKl1ae2yxGcQdBxKI+T/GcvhC2seWLAhKds+4QtfV3HNMN4UAAZ4LpEbgz7CvCs53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857020; c=relaxed/simple;
	bh=g8JbPIveG3Rg+/fUxVR6+4vqYAVAY5pwhdD34vyN/Z4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sSnumYklz5XMm1m9X/i7yxfqrCQgEHUz6RtZXaSUrOZB1OnkrTslNN09yM7tp5pf1rXb9RYpbTM06Y31+PXGyNAZfHpS8F9qtjlOe+HymByKkLBGWw1W6dhFVMmJn4J1LWZ7D6iQF+Gj0/BEYTcdi64zetsfhV7L+FnY7migmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPypO1sS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPypO1sS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90231F00893;
	Tue, 13 Oct 2026 02:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791857019;
	bh=wXnVIQ6CjXIwdz/GegtJq7WvjeBvK5ddziZzXuB3S7U=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=PPypO1sS+RubS0l15hO3Ei+aNAFqOGx9zgH8VIfU+1ssqJMjtOhX7bsR9GoDOA2hr
	 VN0MoCxMgB7whgg6BEY5y8byYZqm7JM5tib19HMlw4HspJYx9mI/CPXOMJY0G0DK07
	 DRIqReNorouUbllgmrnwB4ZB4niz4pOnGY70g8tZEJiScNHe+8GSePVCsoUrqquX42
	 zisBkRQ1fCW1X5DPCkGwFD9iQTuprq6NAfgoxEJw+DE3/n4iThli6A8aRR42KsSHO5
	 PZbBZZNE3DNt5tSLFydro/fcFjn3bu1oquoc7jsKyP+MoBjhUjtSHd8nk4Eei82IQ/
	 8rNlR3A/i2TPw==
Message-ID: <e653fa44-162a-47dc-b02e-719cc976b133@kernel.org>
Date: Tue, 13 Oct 2026 10:03:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: enable fix_on when CP_RESIZEFS_FLAG
 is set in auto-fix mode
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261001180758.2099491-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261001180758.2099491-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 02:07, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Commit 9a31cefa2966 ("fsck.f2fs: allow fsck to fix issues with online
> resize due to SPO") added logic in sanity_check_ckpt() to recalculate
> and fix user_block_count when CP_RESIZEFS_FLAG is set after a sudden
> power-off during online resize.
> 
> However, sanity_check_ckpt() calls f2fs_should_proceed() and checks
> c.fix_on before repairing user_block_count, while f2fs_should_proceed()
> did not check CP_RESIZEFS_FLAG when setting c.fix_on in auto_fix (-a) or
> preen (-p) mode. As a result, running 'fsck.f2fs -a' after an SPO during
> online shrink leaves c.fix_on unset and fails to repair the checkpoint.
> 
> Check CP_RESIZEFS_FLAG in f2fs_should_proceed() so that auto-fix and
> preen modes properly enable c.fix_on and recover the filesystem.
> 
> Fixes: 9a31cefa2966 ("fsck.f2fs: allow fsck to fix issues with online resize due to SPO")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
