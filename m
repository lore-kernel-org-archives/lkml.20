Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEE2F8E98
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321272; cv=none; b=HpZAKyR0t86efgP92E93cAnS3yrui+infXIu7RnkWI3vI4+8+CS2/qflklmZemKgIxWwUMUgq8hujVdUNDU2OH5pNOvct3Pp3K9VY+gZ1fQyA9AMDRpXsaPDcJ9t6eEFgWmBS93a0oJYIkY2HCNcj/OBh9XvrTnwc2bfp9BUUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321272; c=relaxed/simple;
	bh=ww2B+WA7TV01+U+VaY667gb9B0QSkWPf0yPtPcX2028=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfkXjkBN17IAtufY/L9Jl6KRyFGMj8UCDibePxaEuNz58eCVMeFSHNycGjNZIkL8IdHc34gzG8dVitfsuzO2Mf/8/iOfyae2+GBeg5WwcOz6xtumHCjaYM3okfOTN+H5mc/i0Qhn8tEIFWF8Km7eTH5X8SoFpkH9eGIEkZ7zVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XDFfg/5a; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XDFfg/5a"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so163373766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789321268; x=1789926068; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H2Y871zvJ9dINBDYYDJG2gsh1yKXtKEQWd9l/ilLgM=;
        b=XDFfg/5a1gWVWz8NdYNFW541OI0yC13di1B3QKRZL5kLatF6Hk2DvWgpLPcDXJWXov
         vfjXvMq/d0o8HOVvWSsPgEJTrW45LkehdQSxF0fP7GSsE/qRvKNfKwu7fzu2DYBOckd7
         ipHTDpVRLa5c24tY7UJtm/nRReqJmZtEdsFJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789321268; x=1789926068;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9H2Y871zvJ9dINBDYYDJG2gsh1yKXtKEQWd9l/ilLgM=;
        b=jgEoRsc7OE9LMAXMl/Q1td0qsFoxLJWDrfxOZeUaqxfnXIGd/oYBdiDxVnG1IPpRml
         XuWsioe89sAlpmm3ZwyUwsiGFTqxkWGibbtdQZweuzWIRv8y0hz7GwHECBAzbuCp36/i
         bFTTlePGKRhbLbt/t+DGouNTyb0Byu5icnKcl3zjE6AKnSRkIBfJIQPWkU9CAEtF2urT
         5Qn8+8bBacUwLSIxkjgrPRCgNnbzPDkNtjjNy35idBeQyFU/Ws2C/VomLEsrPB7kBG5t
         +xPhL0nOkFhkVtPr2hKbGUWUhFQnp92MTOeSajTLCwQ1TV1d6YJ2HNdAH/6+AMwBEXq9
         4iRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoEzz+fJkWFNkuFAzmud2xt5011izjJmZT6Cu66/jLFFHk4NkvCB0SgzXyW6bq/sYq/k3sxaVwfrI1Gyg=@vger.kernel.org
X-Gm-Message-State: AFuF++k/9S/xP5wGPa+kOiJD8LuxSUopUz4wqxOZwK2cmWDPT6yTUNeQ
	YekveM5Sc6VhzKzqiLeYECfZCVeyIqlZjR5T9sjtOWpNkf69sCKpioJIk1RG008rsA01hcoMsbQ
	HqwgelqM=
X-Gm-Gg: AYBFou0yllky81gyTr9e4ZDseJ9Ii3AdPTfsgHFc4kX3/Ha9XxYSMFNWAdPqr492q5t
	ymI1XG7lJjPYLpqOTq/w8u5s+cv9vRfsyAtKZk8qKXATvSFlRwpqnsMo6xj1lxxRf4aj+UIxL4T
	YxeoQjFVEHXlm4ZIy7tzXfNWLx80QCAfk9HTBP3XC8Xbij/A/qqJOlJx8mf/2O+fsv6XlCiFQ9y
	FH/Tngm2aneazYv917u22+w7fG3EN3F74519X+luuWHv9/i7Bx8FElCEH9Z0vIPo/4mTVMFEzuO
	P+bzkpScBXZjFVVllHgdceJDhg6eWOWW4x1mOeYq5Mo99pq+z2pQrmJEt9AsBoWXX/pf0aMFdjA
	ts1mpeVCPld9LmSFNwxmuzv5sqPgg4t5uELpeB738QTbtCPeek1CcXeIty8WEps4bjKjIx4pYed
	drZFoFsXqnXE2O2zUqQ80vbxO/fNecP7BCP1jk9ty00rzm33CvZWv+I2/SEuKv8K0nYdGnZZWSJ
	4gcnYKTMNoGooLyvV3N5wQUi4Yz5UogRPMTGcZr5Lb9hUT33A==
X-Received: by 2002:a17:907:a28a:b0:c26:3190:296b with SMTP id a640c23a62f3a-c298591870emr370057366b.48.1789321268169;
        Sun, 13 Sep 2026 10:41:08 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm3184865a12.24.2026.09.13.10.41.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:41:07 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so163372966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:41:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxuIuHZo5U62zc0wf2XLzvNFve+W0ZaQ9ny71Ptdb4SKdNVSnQfIYR+DnJsjCGljIrvGw3lYgZxT4F0G8=@vger.kernel.org
X-Received: by 2002:a17:907:3f8e:b0:c25:9102:ee with SMTP id
 a640c23a62f3a-c29856feba1mr427254966b.3.1789321267492; Sun, 13 Sep 2026
 10:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
In-Reply-To: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 10:40:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com>
X-Gm-Features: AcwNN1XLn2ExfvHCXGShVUJeV_gCvDuPfG1koc4Na-S68MppeIKQ_fCxKbGSmlY
Message-ID: <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com>
Subject: Re: Quick regression status pre 7.3-rc3
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 07:32, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi Linus! Here is a quick report about a few unresolved regressions from
> the current or the previous cycle that I found worth mentioning for one
> reason or another; fixes are available for all of them:

I applied three patches for these issues and merged them. That
hopefully takes care of at least the IPU bridge and the mt76 issues.

The rest appear to at least be in linux-next, and I left those alone.

Please do double-check that what I did matches what you expected...

             Linus
