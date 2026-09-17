Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C549BD87
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679283; cv=none; b=e+o1D8EGqXitkOq86QBAz7Z+5GrJ0xq6wKyV8+wQeMc2lT/ZZQMhEKXPO4+4BgCQCLAFdXX7YZ0LyKRe63ctcXIZBgnsQSlkwjLboqA4jJiDqPOgb/PKU3gU+0ZCi/uzgmkqvv9suzCvFxnA+CvwjkNLx8CSTGAzn/ja2iRrCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679283; c=relaxed/simple;
	bh=YBHy4H5pEv93Axkd43WZrvXj62IMTH6uADxqp4QjJ0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JKkYww402o2rZF/OjmPv+rMsvgA5rlhi//4/gWke6pNncdxHXqz/lZUUp0egCYuGnoGnbLFeE+JqQxGXoU5MLLPyNKlExWnzYO8UIdykf1avSZySw/uwCEcpYuqUKDRS4yj8EuWvP82tCZSqtm0WcnbgL0jm6BlReAItsCx5VG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ynz22d6t; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ynz22d6t"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c293e9cd02fso4427766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789679280; x=1790284080; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZplDPDarrgfYfltWJB0WdogIU9Jf5wB1DpwTrdaw1c=;
        b=Ynz22d6tnRIHNp1ws8ZevSUR9PkEretu29eQk45WjHhehr+GNssDGp1Mv7GbEhgTKx
         f4u/9TAK0GUqrciYUGXIp8l6wjlmv5/QAmD76G0aRIh9Q1a+TMADmKGHsZf9wsiiOSXB
         XUTl1NdI3cT+zkiaaBD+47/oSc0SUbpaL39y23iX2BI6WL/RcVT4g8bD8lflLzvn3TVo
         MA3loYv7WFvFK9noWzF9Gv1q/Jot1pRQ0evFnaRWEOD5V+Xr6wN7qF//NC+tVRY6Ctrj
         rBPJabsBoSFAjNRHtWh868eUoBd66NkijOjZpqptidGGjTHnApRfjQJr/5S20Fz6etRC
         sCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679280; x=1790284080;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZplDPDarrgfYfltWJB0WdogIU9Jf5wB1DpwTrdaw1c=;
        b=WTIVqtNJzhI5E9rodUnMPlTHxGPRXloukMBSM5b98/5xDB5Ih71PfJCn4QPKlxFhx4
         gIHE6XwbIfdWJ7cDUy5cJXTiPweFQTbazQfJU111zbCJGUqJXsJrLzE4CpMCULHG7jjz
         NosRFnICd1TJRwlAq9wcHGl6A1rCS+odl0kEQhJCuDUtG39ZVIMLmiM08bgt+K7FFpD7
         9RdZr7hfkwte20macP7eFgiOgQOqqmOVb0LMgQGewQApZZIE4GWjD9P3MetxvFQBwkSr
         fz0guVTaco1prrMLY6ONjQKi63RkoZn81KLQWjvBFMrVgYsslEsmgOK8CasvfAjHGRe5
         2whQ==
X-Forwarded-Encrypted: i=1; AKwUvBxag3GnDdwetGwqAdsQctu90cd+xqcag0YlEM1ezr/b+TbV+juz7v6oP0/O6iflgtKK0l3JFZD/gGn96ds=@vger.kernel.org
X-Gm-Message-State: AFuF++nqmcflA7HZrUNpXHF7ViQHLZBXDhriUVBFufXa3TkPFKqpbQMx
	zJ/KBOCRUsxdwUm34waPpbN0hS5KeFg9GygqRTj2ZLNmWWWwLDD7mGEXHeI+/YOj1o+Enw5f426
	K6jjNUbDxsFgIjv4syw==
X-Received: from edbdc23.prod.google.com ([2002:a05:6402:3117:b0:6a3:65f2:cb6])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c111:b0:c26:1691:b368 with SMTP id a640c23a62f3a-c2a157fab8amr38402066b.33.1789679280144;
 Thu, 17 Sep 2026 14:08:00 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:07:59 +0000
In-Reply-To: <20260904171610.3342398-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904171610.3342398-1-tarunsahu@google.com>
Message-ID: <9huzse37io28.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 0/3] Convert manual kfree(dev) to put_device()
From: tarunsahu@google.com
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"


Hello, This is the gentle remind for picking up this series.

Please, let me know if it needs any improvements.

~Tarun

Tarun Sahu <tarunsahu@google.com> writes:

> Hello,
>
> As per the kernel-doc guidelines, Devices that are tried to register
> with device_register or to add using device_add, must use put_device
> on their failure path (not kfree). This series contains 3 patches
> for updating such instances. Same for kobject_init_and_add or
> kobject_add, call kobject_put instead of kfree in case of error.
>
> V4 <- V3
> 1. Added Fixes tags
> 2. update commit msg as per the suggestion on v3
>
> V3 <- V2
> 1. Updated the commit msg of each patch to mention about the kernel-doc
>    guidelines.
>
> V2 <- V1
> 1. Removed patch [1] as it is part of another series [2] already.
>
> [1]: https://lore.kernel.org/all/20260810162814.1398016-4-tarunsahu@google.com/
> [2]: https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/
>
> Tarun Sahu (3):
>   ARM: locomo: Fix device reference leak on registration failure
>   firmware: edd: Fix kobject reference leak on registration failure
>   powerpc/ps3: use put_device() on device_register() failure in
>     ps3_system_bus_device_register
>
>  arch/arm/common/locomo.c                 | 13 ++--
>  arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
>  arch/powerpc/platforms/ps3/system-bus.c  |  2 +
>  drivers/firmware/edd.c                   |  2 +-
>  4 files changed, 59 insertions(+), 41 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.979.g7e5102b832-goog
