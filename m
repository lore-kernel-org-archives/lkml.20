Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61245331A65
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932283; cv=pass; b=M1r3zHMPPit+q11pIU8YViA6DcxlYZHVvkBpW8HCsigVDo1UA9YaJc06dxwP0JddH3kC0M1G6zvTkU0HC8LFWjy4kAdQpRn21Qu7s3m+/DWB7TacU9oiX2Vv8jq5MW5Gl/mn6TToEbQVFaNaBHuhGCoWnBmCdHJYOprFF+J4uNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932283; c=relaxed/simple;
	bh=jW5q6ZLsxds0VUrvn8NMSUMzUGvnhoS2GgnvUjYsdVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJivO0iY/eigXRka81tBLb1jUG76R3+ojjrGM6eE0Xxa6seb/CWHs9+ruDPafddUfS1WFfZRELq72xnvQX4WO8E/4gfL9aM71I0T3S+tIh2Rst3rGqTZZoRJCnB82d/GkoGaxgdzBszZuHhkURnDANk7TiparGftGdH9nAtHYSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EL1ZUpLR; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EL1ZUpLR"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e50a650a0so91834385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787932276; cv=none;
        d=google.com; s=arc-20260327;
        b=BZV0BAaY6IQj87WmFUctGZZl6SjnpMVDVUJQLGsId4hImQlQ1XA61fvKZZSL2XnGhx
         1vi1S4BiEkO95uLVuSikdoKUXp1tZbsTpNqbfa+lldkTA/YG7ufDbqWPUNGksDKA+qUk
         9z7U4H+FHWDhBDtt7NxIprWFA8mtRdi8Usw/h09bOjMxQm15Asdf7LJ0KbIQLnk8yXky
         h/4pKNUXsOeBba5pht6ModfIGnWdo9SBmne+I2Xjo94RcCmA+I6EPlT9BFlovQZ7dsEW
         /9jCUDUlmSFMslo4JfO94hQ79QhS2eK6BmydRAZdRmPbPmJbMR056PYKMa4YJY8TkFER
         jx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jW5q6ZLsxds0VUrvn8NMSUMzUGvnhoS2GgnvUjYsdVI=;
        fh=3M+ypAtbMfK9pz0+vZUN7GiFse30J39FqitSqzm0PL4=;
        b=hoauPf26DBroP6dYdk+D2yze9PuCKUxo52rSlekxX/W35K7+BS3OXKcs3qLwta7eyQ
         o5fLzc/Te6okXu1XS893kUesXVVTO16qu2oLsnN13YzISK78KNpcw65HVMBYmZIFtgyu
         GWMDZjSaEPKhoNBMcpaCrQJaH9mCKcrVsot3CWMzUoseg5Ev4oPNSByMRCDo5wv2pYLx
         s9mE0brqPDRyoWuj/B/2vOENwobv5H/p9NONqveon1Xz0fXiKk10Q95n+kIJy7teEDuj
         SOJM+RogXG6XXK8FumS2toowpkuXtneg76Ub75f5Ns7EKW2OD4YHmd4mLHkknVbqUCcM
         s89w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787932276; x=1788537076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jW5q6ZLsxds0VUrvn8NMSUMzUGvnhoS2GgnvUjYsdVI=;
        b=EL1ZUpLRjHqSmF/WEANNAsmQynxJHhboORF5W5zsoM2Kwgv71FSjcZVCJUVhkZW6Bf
         T4d0BjiYnRmEc4soprJ+mImb0fKZUX5EQUDoxIvxFcctiY5hKNRd31vXN2sgj8e9OKOz
         afdabFbaAKJtsNVlfx+BgUlmD1AzhQfd7biGoA+KAZZixbPVM4lR6x6c3R7vvFctijGn
         XDgrIjOsqRWr+EMI0OSYd/8BPok6+aCghm+Cts3OOaiL5OJaNK4fttx617LyJwfSTLOI
         /kQiBg5mnADJgmcCUyGsb6r99yDf9YlVe+bRNMWYMZcfq1H9plrCsSd0Q6UqCAcdbYK4
         BGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932276; x=1788537076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jW5q6ZLsxds0VUrvn8NMSUMzUGvnhoS2GgnvUjYsdVI=;
        b=WVCoXJEe5+UiEXVn6R7snJqpwTF/NipVMbAEWoUkzOamNTuT0g/a8nXgnaAkvcKl5K
         K9G9Sl1XwcvVIUhRS0TobndAP065J0AoZsouQ/q6S5S1egg9QI/nu+fmV2P4hXW0xebW
         EuM/yoJIc6Yhp5ikJ9x/HC+T2QbRzg4gakpy6tjrdgwqSOleHUzMQnnPTvMHAhPHkV+k
         oAl83i9MvqdNwZxTSXa1h+gm7J7hyLHcMrESDkr7pM1qcTYlXtucL3hiywBdx5GD+gw8
         4EXtg6UaBUELs2wAJ/TNpM5l9Wzur8vUNNVal3gBGX0erS6Wxqvk3bZ7Zmeggzf/sJXi
         2AjA==
X-Forwarded-Encrypted: i=1; AHgh+RoTnZLZf4FykrWTeJ5fu3ID5e0CERU/vkH5uNSllZp1j+gLZh4Ot9dVSCJBNwsdcbNnt3Fe397Rv5mkcxE=@vger.kernel.org
X-Gm-Message-State: AFuF++mKqaXLI7NoZ29PPoGPOCSfiOB2vlYiKSFrwGVlr91npPN8Lzjm
	951Qe7jeecT+TNn7wdF1L7tOx/6Ltbw7878Z2SwA0KWZmVJ9UTazIzK7CbProN+kDUb0Kknth3y
	c0iR8cWgd6K5nX0HopvyKKduDSrI6y2kyNUKqYktw
X-Gm-Gg: AR+sD12JL4ln7W0eOSiKpzZIceXr01T2KiIbqSE1nLxGTPIVCJmV1xLMYDzGpwwOAW9
	ZRahaC3n4tZ2+44pK9OwBRnk5VNueZm0E1BphgxKPuYhQHNihasJiJuE2B9Z+ZJLkgkF7eZ5oDM
	q06W3LdNSUhxc/CGUPsUuoVZpc5WqybeoSm5o7TAZ95aq+5oh/SsUhQUQmRkoFKoqO6sa2MKFpT
	TPOe6Yj5ToqXrcO9F5z7nUtNczNkHtNNVAl40gcxgzLco1A51jLTHa9thTbxBaVJQDWos39MmCX
	rKGYSCppMeGNl4JiMu5N5cIz7GSM5LJuMUOwLngKbp1llyHoXbRUBar5tLS6zp57024RkCNR45Y
	94Mjjyf6WMJPkJdj6ChW79aebNZRv2XQqUW/xe91k3njv9uUjf8MSN8RfH1E=
X-Received: by 2002:a05:620a:4548:b0:936:e71a:db90 with SMTP id
 af79cd13be357-939138aaf3dmr785852285a.29.1787932274998; Fri, 28 Aug 2026
 08:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828154122.2643578-1-den@valinux.co.jp>
In-Reply-To: <20260828154122.2643578-1-den@valinux.co.jp>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 17:51:03 +0200
X-Gm-Features: AcwNN1UrJtJ6iduqn0ujw97pAkDqT2wuWCSxNAQwH8z3egHVmruiIVqnB7mRr-o
Message-ID: <CANn89iK1U8wzTTQAvGCP8Fff9r4StUB_JFiTdFJZctQUQHE9cg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ntb_netdev: Fix statistics races
To: Koichiro Den <den@valinux.co.jp>
Cc: Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, ntb@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:41=E2=80=AFPM Koichiro Den <den@valinux.co.jp> wr=
ote:
>
> ntb_netdev updates shared net_device stats from per-QP RX and TX
> callbacks. Once multiple queues are enabled, concurrent updates can be
> lost.
>
> Use per-CPU tstats for packet and byte counters and DEV_STATS_INC() for
> less frequent drop and error counters. Callbacks can run synchronously
> in the xmit path or asynchronously from a tasklet or the memcpy kthread.
> Pin TX updates against migration in the kthread path. Use the IRQ-safe
> u64_stats helpers because netpoll can invoke the synchronous path with
> IRQs disabled.
>
> Note that transport callbacks may still complete after
> unregister_netdev(), so tie the tstats lifetime to the client device.
>
> Fixes: 24d9e73c7e00 ("net: ntb_netdev: Support ethtool channels for multi=
-queue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Eric Dumazet <edumazet@google.com>
