Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630C58E2AD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173196; cv=pass; b=ZLRPghm2Pvqhn/JELrizaP3XdC8TZjdjOAjAcW09SVFFdUF9ca7efvCwQwOqeSkUzH6wkwFyJhp+l7I+/B5igYizCpPH7bh0SeLgUuCDT19iqsoOoTOxXgOnv53EODUSSTEEOYZEnmqHF91TbWaJCfcXH3bA+2GCanea2WUbXQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173196; c=relaxed/simple;
	bh=qxhgwpxti99f3N2pyvpz0N4HLMGri6OKfQ339YhtyzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSeSYB4Y7Ft/ozWp7CIpnTRkIlqvYCXsi8nTRg5VK9sTzo0nUXCmkq6++Kx92E9cGFuGMVu4weV1AB2V8Mi48ka6aZe6lFJA+0oaTXKvjVbCwMao6pREjPwFOH9MijRDzbS2D/HzhdPqb3KrehgmcHetWUPS3jE+D80aEMTkJ+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hnUYbNFw; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hnUYbNFw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso169535e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792173193; cv=none;
        d=google.com; s=arc-20260327;
        b=frLJ82UKGXFQJk/ZwRDQDg9YG8cW0FoKagE9wLugzGFx3CYJKRtVqKxowwvWfttX9E
         RI968Fs/CoI3UOQ+bwFPUFMbnrqzaKt3HS0awvohCXkqC6uvdwGpDoMoeNul5Co8ddVv
         Itb4KWmIeqluiIRNd3klezFF3MMqTprXvJ+eMYmYqc1musd59ysJQM7p/Y+Mqfxfm/5+
         cuo3eBz08MWus3hs/L9xTbBQ+0t+6q2BNLjcNEfGGQgzDcpXE6d1K/gMYx4JnvAge2yH
         +o79pYiPI69rlG1j2vSJS3RggV6K6nXJPhpprZfYW2wPyr6dnvtMNJl12BDq4BFIbss5
         QjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3tvB3Clz576g5yH+PklBQfBq0dVAjbbpBq8eyXb6xzQ=;
        fh=MJVuTvVXC/OPwI/yhwrgwIe5bD25R/d+fwwmwehFuf0=;
        b=oqf4f/8/FNEj3UT+PERSQTTXblwnRsLWJ8Z9XPsr2XjWjxjoCKLzLH5X9jRt8hGSm/
         glYOva1ZufSqFeO0W4VQA8pt4lnFlI9zts6ehlFD2YuONQPEkzdoJAS0ToAMJ6nmSbRN
         0Si64mjQj45m73nwPe0KGnbxB0Ir0M3lZ2fAX6x6kvrPSb4P36LmeYeuNUOnFfdUP5cD
         nzgmkwB6M9EnegNf2XzwwNVcjaQPBAJKpSHN1Yw6eU3gVJV/1StH2E9jkWB5Aj7s32+0
         i8psqLu7cDswtmTtFdBBebUOVBVd1eZ0aN9QXoewHhoWNBcEtlyquIRB6IlClupFjgid
         PVNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792173193; x=1792777993; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tvB3Clz576g5yH+PklBQfBq0dVAjbbpBq8eyXb6xzQ=;
        b=hnUYbNFw3Ga8mMPBBPrjI2JM5G70Henf3gMwkyurJnPXl1IZjOLZ6QzuVfZ9dlco+4
         D37AZv9f7aPG02FWgmKdk3gXc/pjX+BeNflM84Y2U8A70ergKVIeiPNC5sINRG/lvj4l
         NVmlaac5JHWkigcvnRcktDrelFwnHQocMv3MCS2hYT46mlcLMS59G3PPGMZ7Ojlpfp34
         pzGyvvmGlAqkV/227QnwjnFI9jVQADQr4sDykjnlxQOUh8LvvXuxpCdEYfWg1GPRtSq9
         qzQBedmp3ONN8OcO5D563Q9cDcOTh6eqv+XSwsJ771cgkIAjxWT2n5mkVNx2eJQ6Ilcj
         fHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173193; x=1792777993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tvB3Clz576g5yH+PklBQfBq0dVAjbbpBq8eyXb6xzQ=;
        b=aCAU6NfBLxNak6pGLlG3Y2z1TfORfilcPRxTLbSQXouZ9BforydGjDoMCuq0QrF1Gx
         LZM56y4JUE/eSbw6Q+VIjy0AdPpUo1GdgeHIlj/Q4P0bnp97ehdIXL0hQYXqI8IbICJ5
         NK0UK2LlRg5l6kZB1yxfr6ZS5c1eHZDvSn3kL3NdO3nBau8CtNogNII1OxRKJSNYJvMd
         cde+FuwUNaAF2YTr7155gNvL5Mp/xRqEmgWsnc42AMflKWTOqR+nmGniyDikVROeciD4
         85BBh5Faht7A65VjJoH02M6GzOkexw1KzWgHL0lII479cnldKzaPeh0R1Z0GNzQ3X3PI
         ymXw==
X-Forwarded-Encrypted: i=1; AKwUvBz9P1m37dAXfWhoS8dIQ3rahIk+6iSDPIBamfIwXEFL5RS9YYEeLcdZF5PL59SLfYHFrm1jYsqdWEE8A/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMz84ZjtZLHdBdehjyStaFjlNRgj2Jxz9dukq1MG7blcMk2k5i
	IAEQj6/Vh62VfGPvE8n52dCzxYWe79uK+GCKHilTgeooZd3B9iCRaRO7LDBROF43m0GJKOXwwaI
	z1Xkl7cpW4k4FUTW4lVrO+9gbPOJSicxNguU+t6kE
X-Gm-Gg: AYBFou1yGymD562cQLTBU8wkAybbxKmv1m9yipzmvF6EaD3c5FrGxSU9RbnBimkQUqt
	NjJ9+f8VMXdhnc24DWuylFay2V9c2IboB/CqHJrLAe5d8C2LEqyWloEFzX0++mvNJviDOsCvZP0
	YPyO1Ucvw/KOa4TR5rPvGaDVUVEOwT3ulTns7EoJJq0705RxnxJ4cIPJ+gp6LJIyymnh4R3ho2N
	2Vsw5YHN+JwMf+W086hyHeplHdeXdmRjN75gBcAyjMyAd9xIIuFr2/6IfeS3pVq8C/c+heRnDnM
	kouqqDsntWHhs/rtT13KsTUUAk+vmqwY9k7pUI9M4xq58R1f6Jb3oJWIpoc+XeXpS3YzEq5g6UV
	qewtpuZhFa8SxS7cS16s0
X-Received: by 2002:a05:6512:124a:b0:5bc:d0fd:8c13 with SMTP id
 2adb3069b0e04-5be50a739fcmr81558e87.30.1792173192356; Fri, 16 Oct 2026
 10:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929160813.1599129-1-tadamsjr@google.com>
In-Reply-To: <20260929160813.1599129-1-tadamsjr@google.com>
From: TJ Adams <tadamsjr@google.com>
Date: Fri, 16 Oct 2026 10:52:51 -0700
X-Gm-Features: AclHuK_4Rv34tv-YMDX0Nx2GVH6URUQBwfhaVfCGCmFbgDv_SHA6doaKWlcSpYM
Message-ID: <CAL54Jgdt2QFZ1_p9nOXHviQsSHnXpOt=x55_Jm3srN5fqVsMoA@mail.gmail.com>
Subject: Re: [PATCH] block: advance iterator after copy-in for SG_DXFER_TO_FROM_DEV
To: Jens Axboe <axboe@kernel.dk>
Cc: "Christian A . Ehrhardt" <lk@c--e.de>, Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2026 at 9:08 AM TJ Adams <tadamsjr@google.com> wrote:
>
> When a passthrough request uses transfer direction SG_DXFER_TO_FROM_DEV,
> bio_copy_user_iov() sets up a temporary iterator iter2 with
...
>                 ret = bio_copy_from_iter(bio, &iter2);
>                 if (ret)
>                         goto cleanup;
> +               iov_iter_advance(iter, bio->bi_iter.bi_size);
>         } else {
>                 if (bmd->is_our_pages)
>                         zero_fill_bio(bio);
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog

Gentle ping on this fix. Please let me know if you have any questions or
feedback.

Thanks,
TJ Adams
