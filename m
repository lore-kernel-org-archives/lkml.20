Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52EE40EB89
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373493; cv=pass; b=McdS+6xt9ec/V8WxCOFjqm9AaC0RLKy3I9FTVUYihFfiAiXphcdR+BTbed87moYAUy6SMWy0tUXR10VIkX/I0sZdY98zjkIbBFlP9eUhjWQIjipY0jC0FMbUXSfJaQ6E9z51qeU34FwVxIsML/MS0xLY39H6VrqTy3//T4P1bMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373493; c=relaxed/simple;
	bh=4fU76HLxftGrNPMS5uU28BAwEDbagipkEqeN7ldBrzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Parh0d0T3BbLLkazvNgnINviRqjGevfy/882pp1PU+x1rD0Mmfc2RqW+pRXyU+H/xAudFhvvMKAk/1JZ+yTk8ZVE6Zz81DHNvSIwzHV19vq30cwPS+FZwfxrPRP5ppDf9nkq4Z7Jrq+jwegYasrF3HRtLVluQeSEftjoGmZW5BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1DLu1EF; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1DLu1EF"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20e873c7so186701d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373491; cv=none;
        d=google.com; s=arc-20260327;
        b=sV/XwMFWsSSGbdVb6m1mta6Od5C1p9H7qf7EQgGc+vyLUaztcijBfWv4FyV20L97/s
         rQIOgtEs1zEhL1gUR1148vsV8rasSmmqEUl16GO7hyCrZn+WJJOpnREyiQ4CNTLsbGv5
         nr+wqFdBNm/ZsxRz8WmeZjLOpyJeb4dl4S+HvZjEeZOpds9y2xQw8c4u0q62uroWVzVL
         3iH8YQWS4z27DTMvVej8YG0XTqfItNjfgxxzyTiB9UsG4eJ1Zj4WuIiVqHte/k2+1MoX
         VSWHcb/NTdnlkAwxMr9fjox/BKl2hM3bu4yGIm9DCEYjb+J01Crl9e/FuYsPFxS8lNyD
         I9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        fh=IqK4MybiKJGyuzQzJjlQZDEBDUv4LZ3xQs95dFMPh0Q=;
        b=LNo9gvnBrRSsn7k6+iYxaOgD7ZB4eNYYQ6SXdTQKkIbCx5vkHZU1O2WZDKjINSdtYw
         cMpzp4vmCz21aaYeTYeG5GfNy0DbhQlLZZfyRIsUdI2Gj0Rm1qB72ty72/bq8ZqblFfA
         b7NEepqmmWN+gBdDjJmkMljX0FhgTzjz0b/tvF6BxXXotKcB9Z2hirViWazTYtM3Pvvy
         /IW0a10hCGqGRI2SrAOrWltDT5v2cC0DAxtUWkhxPorZO56kKk2KPXvTAfs6kjiMRMFi
         Rd7UYH4xPOrzINUWV+PxxeoutKDi6wY0GYx7mDfC8A4OKidJFnfJ233v0rvcw0XmCiYO
         dttA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373491; x=1789978291; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        b=V1DLu1EFfj/zUmMPvXQrX3r17ej6zyA3h4MhAKhMBlNcha4kBR2+ThweqMgTxDzU+9
         +1e0hNGUCX0Zi+IZgJqqqSkiGuUxQlnwcYng9bQlRc1Lc2iKQNzycB5q7NMyh1jD2OdQ
         eXg4Bl8K0ZPKk/vlrByxi+oaMFO/oH+cwLObMn4BWrkrTkYWbQQt92T5qd6eMSDRr3sy
         5HCqtYGY8wgexMPLfFkPwXSm/nsfU+3Xdi7XukYI178nwMVTllGdZNTdKZIXelGt8mTN
         uGiAskhtITkhXqhMIknsYBPtnzbR7HRwFFLhq8tMeaqYvFi+1VNBhBMdJB1rWPl/NBOW
         9rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373491; x=1789978291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        b=KYXRuAlyQHBVKSsRMkBqWcLvG8nFlKXa7waz8+/jgwLhytKR/LeNnJPMmk21oEwuXH
         70yqEZ3SHYE2jmOxm1IIAQcFXymApI9Po6vjB71HgHVRChSHy2SDr9VlXYeKH0+i1Sh9
         6yUZzYAMtXZMkCQc5FDaf/p7u9FoDrN10g5zaz0TJsQGfSjPCMOwAikoM9yyQBQijS0q
         ixwJL2uC/up3tSR+Z/5xEi0WJ2GEgVqeOMDWnBGx0+/k0kUC7dadMtUxDmSyIr8UDl8q
         D08z87+KHCwn+EyUDn9a98Q7UwVAkFBcDEl41jBYXc7i6QXDb8an/RGwlaBi3YicFhTG
         e/GA==
X-Forwarded-Encrypted: i=1; AKwUvBy2sg2EF9c9qS9VOtDqYWP7bJFQbUGr9tWuhy+/PWaIiw2IigDG8y18up1xLURDa+J44pDgVC6L3qqnLpU=@vger.kernel.org
X-Gm-Message-State: AFuF++mM6YjGZ9rKpXx6gYUyAfeCng8CmqmBn9aZItKVleFzi3J7z5Nc
	h1yghErvd3ewzHR6B8O7uwZgmCshpSVnOuVxnRVP7Vv2hM0DvNP+trLkd9KD2W2We/bsiejxiaT
	FQHJkQooh18bCa4J9MvRstvnUqKBRD9s=
X-Gm-Gg: AYBFou3q6Xaxuv7NE3h/yn9/nGrwjzbYrZ9GcUD3hCGTjr0CIvSVlpIdJyhBZepggq8
	QlJVZnCSVpCbalCobeY5d5GK6DTLprYPxfWL6qqXlKdmhLQSpA6XPNuPvj69eEtqmIUhPM6C4Zb
	ZI5K6KFYXeYa2EBEqtIpWa1DfpsstIq38emkir5Bx3/v6koXhgcbl52IC/jBr28dALMxqvXlajz
	NIQ36B1ZsruAJYeoGf2+mkMr/8XwFnTi2QrlGjXW+pXaGjicsFtb/Q/qTpd/2ZOPs5hMLnncDLj
	/Ar3g0nJegIgaFWjHwscelGD1KQjpIAtP/5GTyL4SR5nufiesmV8bGTRWCOZNzeq6A8=
X-Received: by 2002:a05:690e:2023:b0:671:2f8d:eaf3 with SMTP id
 956f58d0204a3-6714e30e48fmr310610d50.4.1789373490617; Mon, 14 Sep 2026
 01:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com> <20260910190205.D0A311F000FF@smtp.kernel.org>
In-Reply-To: <20260910190205.D0A311F000FF@smtp.kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 11:11:19 +0300
X-Gm-Features: AcwNN1W3TsRmnijrk6GVHlCGzsYDkz9GLd8Q3xiW9vI-5rWBg_Mn-fVrRALFw3Q
Message-ID: <CAFpOueTWdO8JiU9Wyw+Om-dPhXgsZ5Z4n9iGxL9Y_a9JuSFtKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
To: sashiko-reviews@lists.linux.dev
Cc: pratyush@kernel.org, mwalle@kernel.org, richard@nod.at, 
	miquel.raynal@bootlin.com, takahiro.kuwano@infineon.com, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. All three points are marked pre-existing, and
that is the right call for all three: none of them is introduced by this
patch, and the last one is a genuine problem that this patch cannot
reach.

> [Severity: High]
> This is a pre-existing issue, but does spi_nor_prep_and_lock() leak resources
> if interrupted by a signal?
[...]
> The function returns this error immediately without calling spi_nor_unprep(),
> permanently leaking the acquired controller resources (such as clocks or
> power management runtime) and deadlocking the mutex.

Same answer as on 1/2, where this was raised as well: the asymmetry is
real but unreachable, because the two halves are mutually exclusive.

spi_nor_prep() does nothing unless nor->controller_ops->prepare exists,
and the wait_event_killable() is reached only when SNOR_F_RWW is set.
SNOR_F_RWW is set only when there are no controller_ops at all
(core.c:2981):

        if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
            !nor->controller_ops)
                nor->flags |= SNOR_F_RWW;

So a flash that can be interrupted in that wait never acquired anything
in spi_nor_prep(), and there are no clocks or runtime-PM references to
leak. The mutex is not taken on that branch either, so the error return
cannot deadlock it.

While checking this I did find a real bug next to it:
spi_nor_rww_start_exclusive() returns with nor->lock held on both paths,
because 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
helpers") removed its mutex_unlock() without adding the
guard(mutex)(&nor->lock) that the other nine helpers got. No caller
reaches it today, which is how it survived since v6.15, but this patch
is one of the two that would. It leads v2 as patch 1/3. Details are in
my reply to the review of 1/2.

> [Severity: Critical]
> This is a pre-existing issue, but does dropping the lock before unregistering
> the MTD device leave a race window where pending operations can wake up and
> execute?

Yes. This is the same residual that patch 1/2 documents in its commit
message for ->shutdown, and it has the same cause: the restore runs
while MTD is still accepting operations, so an operation that starts
after the lock is dropped will send four address bytes to a chip that is
now in 3-byte mode.

Serialising against the operations already in flight is what this patch
is for - it stops the restore itself being issued into a busy flash,
which is the case where the flash silently discards it and stays in
4-byte mode. Closing the remaining window needs MTD to stop accepting
operations before the driver is torn down, which is a layer above this
one and a separate discussion.

> [Severity: Critical]
> This is a pre-existing issue, but does unregistering the MTD device without
> waiting for existing users to close their file descriptors lead to a
> Use-After-Free of struct spi_nor?
[...]
> When spi_nor_remove() returns, devres will immediately free the struct spi_nor
> memory (which was allocated via devm_kzalloc), but the userspace process may
> still issue operations or close the file descriptor, dereferencing the freed
> memory.

This one has substance and I do not want to wave it away, but it is
independent of this patch: it is identical with the patch and without
it, since the patch only adds a lock around the restore and does not
touch the teardown order or any lifetime.

For what it is worth, the analysis looks right to me as far as it goes.
nor is devm_kzalloc()'d in spi_nor_probe() and nor->mtd is embedded in
it, so the allocation is owned by devres and is freed when the device is
unbound. The kref added by 19bfa9ebebb5 ("mtd: use refcount to prevent
corruption") governs when mtd_device_release() runs, not when that
backing memory goes away. __get_mtd_device() does try_module_get(), so
an open user pins the module, but a sysfs unbind is not a module unload
and is not blocked by it.

So the question is a real one, but it is an MTD-core and devres lifetime
question rather than a spi-nor locking one, and the answer cannot live
in spi_nor_remove(). Folding it into this series would mix two unrelated
changes. If it holds up under a closer look I will report it separately
with a reproducer rather than attach it here.

Thanks,
Itai
