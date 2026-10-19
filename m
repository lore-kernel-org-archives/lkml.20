Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424408;
	b=TeQdBsIFiz6uHKmN448RRtnKLZHjRrgFYDzkuB0T1SK8pJDtr0VmD2n4zXtOEf1ZPx7l
	 4xq3j8xuo81kt4hdf1dL81kKeim9G7Ucj920I8FVQhnfffc1QNgc56j2CEkm8EwBPZlGs
	 g62zNk6L/nadfLcgZkZfmoVEwMTe2N74ToSdeWRjsjg1fQTt55xMlZt9MxZbj6jfRd+fI
	 Lc/DH3xDuIUTX21pE8eBg0t90oCQQFyqgcOGaTBQPqxEgiBlEklUeALgwZniVxbu3rMIQ
	 ukQ2A888AwfKv8EKx5p0qrGQLHHQAutRjaw0DI6/QAbcklMuVsRcC4D2dxIxUcH6EXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424408;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=iZJHrYGA4vvk72TfCN2wk/iV+4PmycnQTPaBgYupmAA=;
	b=ctESB+PDyiwojilE57rZCpUyDKcQh0QNW8VROF8XaycqIA98Li9yKdIpyudvEEiPJfc3
	 1mK4ystNqClYjo+XLLOg45lxx4JG0pbkCVdNl1ZqLuJW/uxnuKk9+Pumx9G0WxTiVTiR+
	 Lh/L7jDTo3Q9dAZGmPoHeX6m85PJsDIg1RvGQfe7dF2e5b6QzuzF5MQUkfpnORgjFG+gE
	 evRUIYx/FAsF63mv6W+WQEArTn4Ogn6nbw6uoNCjpQfFKh7K6eg42csXBeMro56zYidDO
	 SuRaV/B1dY+BL5YR5ikRKNcMiuScnd/wh0faOoZNvwU/DJG5WeCuZmCexNpBELBJj7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adzmqr5S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72573607884B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adzmqr5S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0674D1F000C4;
	Mon, 19 Oct 2026 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424408;
	bh=iZJHrYGA4vvk72TfCN2wk/iV+4PmycnQTPaBgYupmAA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=adzmqr5SCl8jrlV8Gr5UMACGuhiZR2Burf8qeoQ1FN+Vh9ByqsAT/VS+cpnVB/D4z
	 xSziBi0lxrRZh3LC4loOFAl3X7G2yQPNIhQMYxQgHWgn2gcFNDr8U5SKkrREety1L7
	 Ajh/NRgyR0mPQ0zVYS7M0fFwJrPdzY4e9xX5C9Q8ijP/tF3rLIzHgP4x8/eN3isY/2
	 7j0U/tRt0PYA+U/IlBXdvfMtxGgcjeXOfPYEFEa+s9PBgVYoxj8KSUohxXuVr6Y35o
	 /2XlCuGNIUI+FM231su1k0shpe1xwhWACWk6aiUEJuR/RVT+OO38mxhyE/+TphMqcX
	 XpaIrSCVoKWYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15983811A71;
	Mon, 19 Oct 2026 15:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use BIT_ULL for mount option
 bitmasks
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242440678.2714099.1586605259418361333.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:06 +0000
References: <20260911143549.909867-1-daeho43@gmail.com>
In-Reply-To: <20260911143549.909867-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com, lkp@intel.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 11 Sep 2026 07:35:48 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Although f2fs_mount_info.opt and f2fs_fs_context.opt_mask are declared as
> unsigned long long (64 bits), the option bit manipulation macros
> (clear_opt, set_opt, test_opt) and context helpers (ctx_set_opt,
> ctx_clear_opt, ctx_test_opt) use BIT(), which expands to (UL(1) << nr).
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: use BIT_ULL for mount option bitmasks
    https://git.kernel.org/jaegeuk/f2fs/c/a5388dd98954
  - [f2fs-dev,v2,2/2] f2fs: introduce reserve_shrink mount option for filesystem shrinkage
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


