Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D347F3BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065805; cv=pass; b=dpr0WohudVP/KfwAKg0wFdQV0CfycOPN4itSmTmMLsG0HkjMJ4b26mCEGBZdufWCQO3FgA3yoZXvWkoXZ6tsMrLRxhWPDno5h5fkDxeVuK/AUccX66TERhLlt9lPYvyeV2qF53i7/jBO9iZcTafbGk+JDOVqqoXtnj1UjJJK2kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065805; c=relaxed/simple;
	bh=bk0KTXDILaFMtgyu9ZO/AO83ewyYbxEO8u97WNp+eHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILErJVfDHw42kD/Xxib9JOvK4XGOhaDGf/Ag6CTS/yUjbKXYg8VZizS1cACcUMvZvWD/Yq6jp3JTSypHLEddFyS7DCg4B10VtMbWllCVnv/qhobW34BCywWuatNclH5Pm6RyucsCOhygr6x7jLo4pknzyRl58w9nUVId/Eeeh28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=FyRKiJo/; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="FyRKiJo/"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533861a59b8so15009501cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065803; cv=none;
        d=google.com; s=arc-20260327;
        b=DKZcXiKWufRJiEajmN6tnqe21vl4v8VWXMFPatbUpTlWWqJ04krfKN8T4qoqfkrrvN
         rwpa20+DzMaXX/iILA7LcquUcdffRa77KCdVixgGiX8Lr/U6UjfSLv9yBDCC688ts1wL
         46zwHUmHRUygueh3CF30kEWXaorv9OQ+MagpGAftmqHKlFoCRhnwacGyfu7UyAD8CBtE
         2pbt1N6MYm+WHi6KFTY4U1ce273rqVrw/O1gyP8FzOa23NNSJRMIGx8EXEMspfy0cLP7
         6ddg6z23C0dobJK+e6SJMhQ/4fyjD18t7TV4i5WJrxlXl1EU/CEFV16gDKFtmaHq8cfZ
         4Qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        fh=nvCVtdC9OM4BxpyFHMzE+x5wwiwWGpdxseXqL1bEtCc=;
        b=hMR+ZiZP3xoLhZvulbIEvFrX33D6t6tP7moc3cPOYQxQ97kOx5XlLXodDqGG1BO1Oe
         tZ6InnOoPsPW2U7zXMiuLUWxbjfIJanBetY5bi21wCWzYol02MN7zjkAvWjsKojVrwhq
         LM8L6JmBmTcEwWfOK4crLm97ZL79gKK7ytow201MsLeNV83DII0P7BEVh/BkufKoV9/R
         rJBH0hAQsIOMLWDhOGrYlxTAl9UZA287m8AA969bXDVxl6QnXS7VbG06bXEFnLdDN1wX
         pxbAR6x6Ot+94mzhXj22vO1FBWifNTFsFzterKYaa/iiZJpoGuA2AfsWyhlDRRgIQlNp
         MyBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792065803; x=1792670603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        b=FyRKiJo/6HgY1WnXQHyxNYU34hvVe+93V/LEAI/d8WyfEOxVUWv+LBBNAtTIslQ3xT
         t/fKXJAS8L9f6xDB8hN8n5AK8Ha3XEGZ5VkoeSs/2tS+o06ehVscqg6oJUagI55j5PUv
         eEEilaE++zMctiG7nbCMq5S+mM86a7oeHIguI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065803; x=1792670603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        b=MAHRD6GRBbuQGSPjVrEbJqAFf4T1QCLqMp26lhzoUorBH2fvkTJ4/I/03znPAs3rNQ
         4rARDiI7Ph3yLq5/jowXGsAFF+7ndKtz0MQ9Cg9kcKVIY1//phNFAQ43o8rM4PZ4p9gi
         199CYHEoLVTIIV9kOKQSFmm0FrmZPotTqYgSXaJtIv0yBB834UP1TrGwIW8FzMI4k8mI
         PIV8a7pZ8Fmak7n2TVRAlDmCyaX+RUOW67fa8OjLlCMQh8iKKVdgVHhrbn/0WDp12dYV
         LyBcu8BmcFQQDejMgQPlOyJ4GLOPTk5wVEe3plK6Ljq8kgmq3zOUjqs9Z+h5eEuMMdSb
         uGIg==
X-Forwarded-Encrypted: i=1; AKwUvBy44GLcjnMU78FzDWP7rirjSNZpCpNuAw1EjSJmFqbeut/vdPYqMdERuVOFTb8STG0v6zYL+N/G8MHNhuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYItr5Hoy5ImtHil2wms3mlatubzIH0gm+ngmIafgTcr7gqx3w1X
	UbPo1NQ+V+dr4FNxnGB/YDEpDP30TmXzeuQVa/YMruYjpBXw4hcOE+e1kIlwBNIZ7NwkLY9Jl92
	KQ3dOzPZRziHsP08+bfv6KliqJHuUEJaAh9Zwwwp78w==
X-Gm-Gg: AYBFou1zWAaWonvPD+9I196QRLlVfngNKg7Bf/QXTQzgYSa97IWWpA5NqOnl8tnHR9c
	EFXEmFknIumpzvgDAC9VV5gTvvop0wQDmwGB8Lpqze/LiwttddHjptx9r7vt9YG/T4UGvjhzvtg
	RL4rc52DJnp7H2EDG8Ujo61YKPno0zMApyOBjTzVbo33hqrxspJhYi34Jq/b2bPEgMAc8KrhW5j
	e4ciSU8pb8/sxkrhXKPeuTZvR7OEUKx3mw4bN+FpKWK8zP3knJn8MSPa1qQJlP/yD3Rg/eo36/k
	BDNV7vd0tDDx9/6IFlfgeTnHg+nvqJfK+7agk4sc5XDg/tFBeSHgiZ2Wh/QRyggvRuRakG1U/yn
	N2LS1ETi2a9Tn//u3Zw==
X-Received: by 2002:a05:622a:48e:b0:535:a5fb:67fa with SMTP id
 d75a77b69052e-535a5fb84aamr281517071cf.70.1792065802884; Thu, 15 Oct 2026
 05:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001164916.15311-1-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 14:03:10 +0200
X-Gm-Features: AclHuK8MiHyjueHnKnwHtYPGKuj_TddwwVafZUys_JcMsu0_shaAG05CNojzKZI
Message-ID: <CAJfpegsFZ=K09Kzr9Eec0sQR9gzxVHi=PDyQJs_bOKvfwGiU6g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/8] fuse: caches documentation and testing
To: Luis Henriques <luis@igalia.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 18:48, Luis Henriques <luis@igalia.com> wrote:
>
> Hi!
>
> Following this email, I'm sending v5 of this patchset.  Here's what changed
> since v4 (mostly from Amir's review):
>
> - Included suggested changes to the document
> - Moved back 'struct fuse_common_ctx' into tests FIXTURE
> - Fixed a few typos in the tests comments
> - Added missing SPDX-License-Identifier tag to fuse_common.h
> - Added an initial stab on the dentries cache (hence not adding Amir's
>   'Reviewed-by' tag in the first patch)

Applied, thanks.

Miklos
