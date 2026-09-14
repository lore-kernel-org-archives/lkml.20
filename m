Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38061E7660
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354427; cv=none; b=reNwqMmsZxFLNP5BekmiRfP8Lkgz4ElmE7CPGAaIMsdryvr/HdjYy2tj0mf1NtP57l3PWLPhVfEKUjtbY8ERZlVXG7iCvzwYEy8h0xTZXGCwsMNHt8r4Qm88lA9qqAAxHZQdkV17jOYxAv0vOM73wx/MKX/Q1IjDwrwsQTFPUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354427; c=relaxed/simple;
	bh=NxxdOBFkVAQK7z7izGWg5kLB/utpX+W1sFJSvT850X0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MKEyYop2GnQVYYhfC9Yl2KHqy/yiHCa1OnKixpurDM2CCKHG6IPBoqXxJLsWFpQfrcWnUjfPEX+CmFtFywGHQpwCIdYFyqt4c+YptyDPT6M4e8g18iBOHXKocYhmHuuyrT7AfWmA/9Gl5Ff8dVY5QTIeeVEj+Z/XYr/W+v5eveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfizOj0x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfizOj0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CCC1F000FF;
	Mon, 14 Sep 2026 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789354425;
	bh=aaCZBmqARtvSxxKFFrF8QV2cSdsvS3naQrJCFFIWv5g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=gfizOj0xnsiPzf+9AU+A+nf0RtPfN8ANTvdlOsND0U6tcy6ryZNUnW7jkEVimTja5
	 HeYkXs4jeo+DwKqJrEq4bgN69f1pybx988FTonwtZmc+hFODsafUqU6K7Zwc3FlrdA
	 5Rd5Ni/nBkL17ilD9Qu0TVy0J38rQNgdt5DTFwP7WM6zGXHwkxtsau+EsdEH39M2dT
	 6fieZllNddUxxqEphg2+v9rOqRrg58uCPBXeXrySVIcVaTarf4hL75xBaeXcvH9GV3
	 ffGJM0pvs4iFQEfYyEP9vs+oC7CJ0HeTnqoWavNaJGAL7ZyCmWWbSzv7ddYg4/Vt8D
	 sFkG2yGYaxF2w==
Message-ID: <06bbc322-f0f4-41fa-b645-e5291803506e@kernel.org>
Date: Mon, 14 Sep 2026 10:53:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use BIT_ULL for mount option
 bitmasks
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260911143549.909867-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260911143549.909867-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 22:35, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Although f2fs_mount_info.opt and f2fs_fs_context.opt_mask are declared as
> unsigned long long (64 bits), the option bit manipulation macros
> (clear_opt, set_opt, test_opt) and context helpers (ctx_set_opt,
> ctx_clear_opt, ctx_test_opt) use BIT(), which expands to (UL(1) << nr).
> 
> On 32-bit architectures, sizeof(unsigned long) is 32 bits, causing shift
> count overflow warnings and functional truncation if mount option indices
> reach or exceed 32.
> 
> Replace BIT() with BIT_ULL() for mount option bitmasks and helpers.
> Additionally, introduce ctx_clear_opt_mask() and ctx_test_opt_mask()
> helpers to avoid open-coded bitwise manipulations on ctx->opt_mask.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609111633.uyRbsEUB-lkp@intel.com/
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
