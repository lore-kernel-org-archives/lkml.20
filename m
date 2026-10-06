Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEAA38238D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266654; cv=none; b=JAawT5nFRmwIxZdl8JNJFYBSFL+OvTNQskm3M1Qu5BMFmiSrJ66fqe4n4pWcK+oLCwd73swKPd2Ec0J7g6e+wpVxfY8r7+ZTa2cznN77tK6oCWGllqu6qTPA3qATx7qUf5Rq0EBD0LaqR4pVEtN4QJbIkEjTzi6V2m3DfJfwLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266654; c=relaxed/simple;
	bh=BNgmcKSZXcGUVU8k7WxmELTXP/8N0YkOdPBXblP3Yeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6rsrVNB6vOSW90gh76O3+ecHefOkuZfhM0nuT4q6pnRWIVoEFUJ3GzhHjnljNyejdsO9HqT2UMHlOseet4zmbHIRjiMm/bCcwJJBkfqtBI/gz/Tgy5/qjfq2SbTlndiGJFE6nI2oZmBXUD1CKK0pg1rutjJCE4UpGhZMYGcx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9Av9cTm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9Av9cTm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a80e169311so350180a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266652; x=1791871452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UV1Wpg++CLTH0y2WXLJtTkZDyBO1kADLVwQMoaPRuB8=;
        b=S9Av9cTm2VA2DhCXUT+YMp8k/6on4HC+eUziH3wq7IwlTPvtI/ELiT96Med1Qzt+T1
         cQ6E8YFWRM4Tf9dlbSrQ8Id9YtkFOgFOyKOgcmA8J/GiiXdXY2eWxWfiMsd17Ch0CMcF
         BbtgGeIOjapLM9Xylx9DBxCJjIwEyWLfoJ4fZkxO4Xjo3Vpl8G5METqBUkb9DuGjxejd
         Xuy0zJckJu4qZLsBfEsj0aEumXlOT2J6U8sVA5ZRBMeTeFS4t0W95K0QY++I2jLm3KW5
         9aFv5ugwuOuGW1JIcctopFx6XY7Pa4RTil4taE3dosHXb0GOus30KcvXyQ4yoliNpM4K
         V6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266652; x=1791871452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV1Wpg++CLTH0y2WXLJtTkZDyBO1kADLVwQMoaPRuB8=;
        b=W5Ff7OB/9yVuFMrsc2llqD0YihMmuZQyTyuwM7LE1ex2gjTwkJSlz9e4ael6tPrTH0
         l142NoyEl1HY8gw/be1QOy/c3UxXe3Z+VxoUoJMKIGEXVJW74PoUvhzHnIdc0BJDQwkj
         7QW2U2A2bZ8fJLtb4N+RZFVfoKEEES6DPhZijkMUqGUTmNoyd6/ECpFpsrJ32helJxZU
         V+iWJhtipWkTVr4NC1Aaey79BwlrQgInIft88V3z0lb/LmRadJ12rGH5O2Pged+P/odQ
         VbupBk9sSckDKybOnDqlX+PFURfZNXHj6Lm8gF8KIcsjCussLo+5I/+nR3r5UvJVSf5g
         CMmw==
X-Forwarded-Encrypted: i=1; AKwUvBx4WnKIKaoTYgdnaz9XZ7eQQhna9RMtMm516TtGqHjpFLzjHAOHJdSAwN+gZdmm1g4eIjKd1fszA4mU7qo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxEcVXaO199P7Qo2OoEI0xL4UbVCH2l3cOES53yCHExiaApbP8
	HW6D6sSdQHTIT1/5jjMz5OCut1XuJT4MvG4VfO2yNiT5rXS80GcTs5m13Ga7ZA==
X-Gm-Gg: AYBFou0We2YZ6hH2hTgXbvND8/KJeshwHXRBeVV+gFDS6+DDHH9q8xDOV95fWRL7We0
	mOhd6LyH042KMHZryOMdf0TK0ChJ7cjk6hjITNRv/nM8v0f+s1UKXXgj+y6cZtObmnyWkTCWedk
	7l9lG2T+QE1vG9fJ3fpyeMVl6MMIC/Qu7QPURgOhFW/LuYhV2kiJRQb3WIc4RNQZmfeP7uMZlw0
	wLQEMeDI+ITtbYaE3svVVve/ChOvyiI5ZIZOTiiHPWBMRtCt9uClLI2A6BerTtoMR/dJUprg1EA
	WifkKvfSZvyJG0zYurDpFtX+x7hh78XIiP5uT3XaGBd/mP7xVXN88U6MEy2D+0ck6c6QcVYXfhu
	8qspWdZ29bJInN9MTT7ZdJN+geTjkqa9Fio+nRI+QEUS/tfJI4faZ0nQoK/cXgovMMEFVJ3zr8J
	x/pQ8izzPR/xMNm+D5UjX+JBBfhue3dO0HTY6Re54xIuwiHEjdiMTmEJSC+E0x
X-Received: by 2002:a17:90b:3cce:b0:3a7:ee74:e8d2 with SMTP id 98e67ed59e1d1-3a87354e80bmr139385a91.25.1791266652342;
        Mon, 05 Oct 2026 23:04:12 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm6954884a91.0.2026.10.05.23.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:04:11 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:04:08 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ntfs: fix two kmap_local bugs on 32-bit kernels
Message-ID: <asSPWFQM60is9C0-@hyunchul-PC02>
References: <20261006045136.5911-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261006045136.5911-1-kmehltretter@gmail.com>

On Tue, Oct 06, 2026 at 06:51:34AM +0200, Karl Mehltretter wrote:
> Two kmap_local bugs in the mount path of fs/ntfs. Both only show on
> 32-bit kernels with HIGHMEM, where kmap_local_folio() hands out fixmap
> slots from a per task stack of 16 entries. multi_v7_defconfig enables
> both NTFS_FS and HIGHMEM, so the stock 32-bit ARM configuration is
> affected.
> 
> Patch 1: check_mft_mirror() unmaps pointers that were advanced past the
> end of the page. On 32-bit ARM this clears the wrong fixmap entry and
> the mount dies with a BUG a few calls later. syzkaller found it on a
> multi_v7_defconfig kernel. A fresh mkntfs volume reproduces it on the
> first mount.
> 
> Patch 2: ntfs_check_logfile() maps the same page once per loop
> iteration and unmaps it once, so a mount leaves three entries on the
> stack of the mounting task. After one mount the CPU it ran on can no
> longer be taken offline. A process that mounts ntfs volumes five times
> hits the BUG_ON() in kmap_local_idx_push(). x86-32 also warns when
> mount(2) returns.
> 
> The two fixes are independent of each other. Patch 2 was tested on top
> of patch 1. Both were tested on 32-bit ARM and x86-32 in QEMU. Details
> are below the --- line of each patch.
> 
> Changes in v2:
> - v1 carried an older copy of patch 2 as a second 2/2 by mistake. The
>   patches are unchanged.
> 
> v1:
>   https://lore.kernel.org/r/20261006043810.5393-1-kmehltretter@gmail.com/
> 
> Karl Mehltretter (2):
>   ntfs: fix kunmap_local() of advanced pointers in check_mft_mirror()
>   ntfs: fix kmap_local leak in ntfs_check_logfile()

The whole series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> 
>  fs/ntfs/logfile.c | 11 ++++++-----
>  fs/ntfs/super.c   | 20 +++++++++++---------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> 
> base-commit: 551c722f40809618230001baccf219193e22fc5a
> -- 
> 2.53.0
> 

-- 
Thanks,
Hyunchul
