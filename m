Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B44AD7ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149816; cv=none; b=ZzD4GecgoRf82zBwlAmv0+2qGdNTM1E1JxZ9QQx3UfDtFKreVZETQqblPtP+iMuxI7OXgwk8N94bOgTsGdbAv4olaI2qdV4JY5i2da9Dk6w6pnvu+4tYe3B7pvnJD10h/T0jVFDE0GzD+fGAohSt5zS70BzhszJGNJfva69e0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149816; c=relaxed/simple;
	bh=+pWWSdWJ0nJQQHR+gl/5aLZbTfbYdj8rxwlw++4qvVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QdhudOz9rEY9xo6j2/gd9DLJgh1z1T6Ui51WwIUfdp10cmagPs/J0kj8/Ie65Rg+mb9SexDj1Do/5Nj125vOXO2mY0/eoQKN0i4VZv1tEuCTEP1FMbdjmpeMfcRxt3xI9+SHHkI/Ga/meOcsy4JYXofte6SQpff64MVBZdEBStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=C0+q3VNE; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="C0+q3VNE"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8016ab5f277so1175216a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789149813; x=1789754613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLwReMhnSuYHEa7fcY03FMJp5KAOlZLzt3XSIvlT+XU=;
        b=C0+q3VNEx50pvvSyHDK8VItP5JXMqOK1BurLCgwS/SFbvpkwLxJeuvf23dJZ+esI7/
         AEf+LWPnp8222v/4O23bNsulPbTxO91Fmu8r+99Nmhk+D0zR1unZm/2n9WoVDw7DglfR
         KU/bQ/BytgG3s3zDljdVsckIDIg80WbOEq6G1IZ7uYVJWPS3f0qb0/220ka0BN/+R0Ci
         5wrWu5ChVC8uC3BytED5xC4T20HUF5wYFZ2M3J60yr+raOWJ1S5KVsXQKKWlWEgjPGrz
         MwYJnVhSbbrbNCjZursqXQpT/ZfFlI3e7QcN+v7M5Plp7UW/br6bhFAS4KmJcLO7PlJY
         9F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149813; x=1789754613;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLwReMhnSuYHEa7fcY03FMJp5KAOlZLzt3XSIvlT+XU=;
        b=oRoE75mnhhoebSMWHidwsCQ7Cxn1LqLi/YmCA605RE8qFMya2+doUU6RwDfv0ebHuv
         8QYVkfl45Kmd3IndO8qlexNdJ4D7+TviK6AIqAEXDbZ5bU2ZRjf5yoneJYdHugzlZ6U2
         dWj0D6UEQfKMO9YjapOUx5SJ7S9RABkoJiQm6mlusxYVdxEJ6DyV/nFXbS5R5jafG8qk
         e+A/1JRzCTVjRVylEECr6ZlWq2f5/6xQFijFW6ShXABscPBKJh/hsHO+0Mxe548mGgRh
         P5P3/G0LoXGZTeyloAWD4PvX4JYNA2h/tT8FvjYHO5a6WC3/DzKvZfeALjuAKTEH5X4B
         O72g==
X-Forwarded-Encrypted: i=1; AKwUvBxnw5nNKGgDS1+LM92N18jBQ6mzsuiYh/4w8nAnAl6t2laEm0aUxx6VvJLm+LaOl6eoyKl/JL190UXwOSU=@vger.kernel.org
X-Gm-Message-State: AFuF++lzKynC+qDnBHxJEiSTu7y0HqgpNp0ABXIZY+7xdEbqGNkzuy+F
	YoL+mEGqDNPgXyari2NshEsoDb2D7Yzk7jYmQXgIMq2AiuHrIpRhiZbCX6CJg/6Hqnc=
X-Gm-Gg: AYBFou02YxO8Hf9XuTNAF6vcugwvk3b6KR/iN32zHTb6ieebzcIGZuf/B75X3yNitmh
	JNV2s+NBIAdUuZN496h0N4iyUcAUSAtRyjgl0MXeYyzOrfSdPwCGXD/zrQcOcU3ZiamKytksRaQ
	lgOMtvGwjMRJQuSQ3DmJc+sWkA+V06gEA5pGRJkfQge60V+DVMRT8YrPD3Q+AH8Y330EinZ1HdC
	mmuKpGNPXHPS/odNj2O2E8CZsKo/5pjcSAYi7bt2ci3BM7pwJ9T3M/F/kocY6bAgjjediwyuuwg
	SFtWYuA7xURQX0tqm4Kut0z5fAYrNhB9cLoPtcGC1Q4KA/aQ4ovhBdJn9R1YtSrllZmOib8HuAP
	NeFaXkPpbniCtDgQ/NQ3aKAudZGkW/Xogs8ePeNF83HGmKNZAdwfv6lPxKM9cISTnunA/ist8+Z
	EikuBzHUFz9jARyQ59XWjIi0zBqqpyih8GgcxYONHsnonSTGGCgWhybJ3Rp65+32yzYQVL6bOVg
	tiEKC3YZFHUZHQEZP5B8chGqQRkRvTHPMGizeS2BAJkWr60pfE=
X-Received: by 2002:a05:6830:348e:b0:7f6:6618:e506 with SMTP id 46e09a7af769-803fd562bb4mr5057886a34.14.1789149812732;
        Fri, 11 Sep 2026 11:03:32 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8051005d845sm1090677a34.24.2026.09.11.11.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:03:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jann Horn <jannh@google.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org, 
 Gabriel Krisman Bertazi <krisman@suse.de>
In-Reply-To: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
References: <20260911-uring-fdinfo-tighten-v2-1-fa24d517035e@google.com>
Subject: Re: [PATCH v2] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ
 array slot
Message-Id: <178914981183.662923.3814591941846027409.b4-ty@b4>
Date: Fri, 11 Sep 2026 12:03:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 11 Sep 2026 19:56:13 +0200, Jann Horn wrote:
> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
> contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
> the last CQ array slot with a dummy entry and make the tail wrap around.
> 
> However, malicious userspace can directly set IORING_CQE_F_32 on the last
> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> explicitly ignore the IORING_CQE_F_32 flag in this case.
> 
> [...]

Applied, thanks!

[1/1] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
      commit: ab394388d05977f369e8e8d1beceae47fc3c5e72

Best regards,
-- 
Jens Axboe



