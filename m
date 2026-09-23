Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69300576EB9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196737; cv=none; b=VI2sn8gC2bEWJtcclYjwewxZSjwcasQtDqIkMKoeVclYD3sbiXmKAkETtdV4F4lRPr0Fq86xQyG3eITesngoBz/o1uJGAHkWe3SEARanEgIP5qe1VkrdyjyhAvpdCQ6AIMbOurd67cjS3vS/Xdqiin7sYXM5XFAjWF6Fib9hJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196737; c=relaxed/simple;
	bh=S8r6GWQBvL9HsA6tVNQ/OWLYO4HKzv0H1/y4f9HSs8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOlraj/Kmy8UoapRLnw4PHBdN+58hji/aAP4Bg2gKlVm9T2Ck0qjNO/dHVnzlL/apQT1541K1dj9RhiqGI4z1Q1S1qVvhEeBdgc8F3gCwicIO77UGlnxDJRynfXX9bdWm8Rt1asaxm8nRhHV8DactfOwGjKU6Z64uSMtVQXOOa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SSR9L9MJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SSR9L9MJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db33db4de9so26625ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790196734; x=1790801534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxfGK2lH/aRIozOg/OO4CFJYSmW6uL//S1oXTitR380=;
        b=SSR9L9MJvzk3EIhum0BeOOALSuuGraNysK/htvIAPH9If6/gR2sh8nib+ZuaMmHW8b
         N1bon3CGUH+zlFhmCl0BRx5beq88uX7131Rn8YPZ+ILyEMARJV/RYPviwkHNF3dX47kf
         zul5wxtdIQap/SZhWRK2X+bA4/uSuRGt8emE71KhtNU/HuGKatfe923Wy86sWX7D/EZC
         dEoBLikFbJx+GmBmzi8A4VSQ/9vDREPl1uBSNK45UhcuahjdBrV8TH3ybSlEs5oJ56Vq
         KbGPX+5RiLFzH/c7D/Zx0Uv06O9CPFJsAJ2OYbJXE4SE5MEfZglpTziK3hQ5AuqzwWsa
         lgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196734; x=1790801534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxfGK2lH/aRIozOg/OO4CFJYSmW6uL//S1oXTitR380=;
        b=zHrDffVgA5jbQKQaHcnGOUVFa+DvYBVXYE0yVUa1s84QjUSFK/uJd6QGCLpCCA3XR/
         9sdDDpBpVjphuF3faNtokxtRrpJVCTlb+YSSAsfTpoEs+4W/H6lxNQgY2uVR0G7zzSlO
         okdtGxOUjd3Of+yWnIZb8KbOPDjrPvKXsZAAy+3KV8YGsEZqozMGKFv+ymkr2/jaErwG
         JKOhgVPneiNbE6Ymob77/OuV5xenSrR4sw/vsaazZ9GvxogfQWyaE5DGVt5la3AdEemi
         Y+mFVBg2JUyQACsEkZ2q+mlOLpJiHvhz/9ljV/ZB/fpa4cGMMfdThcMRVeubqRFs3V5k
         9h+w==
X-Forwarded-Encrypted: i=1; AKwUvBwm0czWwAfONujs4byNjrwuw+s4tg3mH9i5o+W/nCdaqcoe/9N7vRIgUO9EocYtyvrqVNlSkzulErCwRPI=@vger.kernel.org
X-Gm-Message-State: AFuF++lz0C76cMl+1rnQLdCSLQXPOQYwL00F/qNRYpO2GvDJ493qhTi7
	tDc0lbbtle8QyaTCv9lz2+Ivb6aC22Ayl7NvcgkwdxoD40vgJilJY+CLisLKM8H7YA==
X-Gm-Gg: AYBFou1GaGr3Q0cXTpcnnAXyJgyzJSAOT3FCQeE04S5XkOeSS4vr91nst2yZVKhnqeV
	uzonWtiQd2Uy3XOtYbIe//QP6vDJli7i9SL/mlsba6JPrS4I6DV19I0yIO1vjHstIXysqlbgn4w
	OSI/hty5EOXdwl3FUcxyUt9vJlYjVp+GWL+rWZOMvqvbE9wIs0LxGkN+L1AXkWIDESGIo1XZ6Yh
	mQ8M4zVuM6hdMxS1b0cPS6lOK3BgqJxGo+I0ebUMsyvn36PP/ab5GNzNHDqQEKa2fm9L+fOE8/D
	pMwaP+Upem7xrk0diz1unXUKBW90b3YutBq6acwvOfqjN0ZAvHgCCszSS+FVbIRaWpxiNp92IsT
	+MBZywYJj3q15hS4jSzBpQXkDxQUqQOCE1+Enu9vgIImfyxf/D3CPNsWcPSAIsT+eyZvrLuCQNX
	yZvXmKfo5g1rZXZI4CYSaNq26YzEhyP8nCzqZ3timd/F5mlMa5IZre5mRmfXe/dwcPp8HHx7J48
	N0gWfNSmm/Av9ESltJV6zul8fSglenrOLWvxhX/jIZJDxsGyxAgOFUcDLQDK5hDQHKaY66Wr2MS
	SCdbwD8xqXcZ5JWRH0DGQ6sx3Ud1tdODt30im6B8gvNG/+MU0XoL14h6qg==
X-Received: by 2002:a17:902:ce11:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2df7b013b36mr2346445ad.2.1790196734090;
        Wed, 23 Sep 2026 13:52:14 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm786142a91.14.2026.09.23.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:52:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 20:52:09 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: restrict BINDER_NLGRP_REPORT to CAP_NET_ADMIN
 and fix binderfs minor leak
Message-ID: <arQ7-dwljFEN-8Pq@google.com>
References: <20260919213654.3317464-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213654.3317464-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:54PM +0000, Hui Peng wrote:
> Fix three security and resource-accounting issues in `binder_netlink.c`
> and `binderfs.c`:
> 
> 1. In `drivers/android/binder_netlink.c`,
>    `binder_nl_mcgrps[BINDER_NLGRP_REPORT]` is declared without `.flags =
>    GENL_MCAST_CAP_NET_ADMIN`, allowing any unprivileged local user to
>    subscribe to the `BINDER_NLGRP_REPORT` Generic Netlink multicast
>    group and monitor system-wide binder transaction error reports
>    (including sender/target PIDs and transaction metadata).

Yeap, the whole point is for selinux approved processes to subscribe to
these reports.

> 2. In `drivers/android/binderfs.c`, `binderfs_binder_ctl_create()`
>    allocates an IDA minor via `ida_alloc_max(&binderfs_minors, ...)`,
>    and if `d_alloc_name(root, "binder-control")` fails, jumps to `out:`
>    (which calls `kfree(device)`) without freeing `minor` from
>    `binderfs_minors`.

This is already fixed by:
https://lore.kernel.org/all/tencent_8D7B76C623DA3A29EE73D38217ACB08AFB09@qq.com/

> 3. When the `binder-control` inode (`device->context.name == NULL`) is
>    evicted in `binderfs_evict_inode()`, `--info->device_count` is
>    decremented even though `binderfs_binder_ctl_create()` never
>    incremented `info->device_count`, underflowing `info->device_count`.
>    Only decrement `info->device_count` when `device->context.name` is
>    non-NULL.

I haven't looked closely at this one but it sounds like a real issue.
However, it would still need to be a separate patch, so please drop the
rest and please use the appropriate `Fixes:` tag.

Note this code has now been removed, but we may need to take the fix for
stable and downstream Android branches.

Thanks,
Carlos Llamas
