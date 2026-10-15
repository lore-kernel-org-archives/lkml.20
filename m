Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60BA522EF3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068630; cv=none; b=sUOeU2x/1ydl8+tOjbhtpTY53lX2eUZj0gu3+9EyLknCqh9YaTZHI0jeqwOUhpSzIvTghD2g9djGNEdfcn4rrXigHJX458wO/WMAt647/sQblkHLfWDXEivIt0Bdp+q45SxzrMi7htpPpxIsL4cTMhWolJs9fA4glyqhIUtpNNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068630; c=relaxed/simple;
	bh=nl4ec9AwXQACqVpdMsqZp6/fGYsuYifYLsECN9bSL7I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J6wd51btGTY5AO3RU/JOqoXowBOHcrm63WGfcW4r6SAG1blNE5UBEqEKRpt8BSNgs+dfYlUMOM5X59fbqFWy+ORXcuQS5mLjbkpHCGNtN/WFNx+Yp7J7QUcdLM0jp8BTNnDnPFJZT366I1bR+s3FdJLaHvI8FBFwj9lHkPY/kDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd0uPbH/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd0uPbH/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a17baef589so18547795e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792068627; x=1792673427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llwCI7aJY+9XjIfXW2VPE44y/chmdd1TNQ4D5TPH5Cg=;
        b=nd0uPbH/lqyU2N62W7XEH7ma9zPE1tKadNQwJQ1QH/V8b9vG3TuVjA+b7i799mJFTJ
         tPUGML7Shb4x0MCmxLgBWfWerw3HVXt/oKxLYxVVEqbdoGv2dwsXUtob4HUh6q7vji3l
         x8mkVoFdL2EhTUSJb4iyVA9E1uslSYd5HN6kchp3xSKxkNqELKd4uZephOTL1DVU79MW
         FzuInGHVbUa0NAMDSAQm3fzbQr4ObuFhLutndAYvtRnzZ7otVP1IoKgOKPcnW18Z7tIP
         B2N/kYWxzEluxEg5hF13ya0L0MEt9V6W9Fcn87MH5hN6giHFpegUz64MLwY2bXpCUY1D
         6QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068627; x=1792673427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llwCI7aJY+9XjIfXW2VPE44y/chmdd1TNQ4D5TPH5Cg=;
        b=UMXnvewGc8PTq2es5OO44dRIRNr8XDWw6lf2E+wcgn+2xAT9I9iLtwJb/q6Pi/r8PO
         pFo56J4vf4l8VPtUr2+RxM8/TgoF4weL36ZIYxWW4FVCxZewLIQBg8Un/O8YaEyYLVEN
         MRnN702mPyP38MMv2Km7InXTxin+0mrmgAzAVfLXlvKSB/5Md8jA1Ahf1gGnXDIER5Jf
         oqLoQsM9P26oSm1IiFdNIx75Q2i3i2BxkZ9ihVRH/yVPJz+eb/5jAJlChjVdSj5mi7xR
         WPWZl5Buf7mslnSRtFn/AIHKGqvr2lDbt4mODseZPE2ysepmzpoZMNQK+9sbsla07KMO
         hSqg==
X-Forwarded-Encrypted: i=1; AKwUvBzrbFWtmuKz4x96XIZd78ITNOPNgGVL34Kh9I97y3l9hH5aj+7HpoSufbInxeygJ3dW3klphKO3HcNXfYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5nA/9nrlGAewY6PjjqEi94i5JQVjScznOr1uzzKWK2zaP9Knu
	Mgpg+Hhua00awzDv3WzJBPC7vlY0QGiCljwOlY62SF1bVc9OWPdXa9XG
X-Gm-Gg: AYBFou1Z9PGjkhnRh53ucBD98ISW4xbZ1SufC8St7HWQCl7FyjWmi3e+nOIHUYuYhoN
	0ovDEVI+aLIm9hugWOgPbMgiqNCKS8jaIkRMPWl3hnzffRt9UDvoo3pp3z2bulVaBaqps1OdS6m
	zXbBwAU2QUlHOkO5T77wEDSkY16MnFDU9dvsWwkwUdOciJPB34E+YY9HlNPIHvrLgNCW6dvJVdI
	JPoQrmHO3DfWqvLMU/tV4LA9VffdSZSZDKJyS0ggy0eYvopg4nYZ0dqwfbXK+w+afqES314LkzW
	RWkvmrmmDfksh0Th+reaSxJLjMic3wt52XT9Ysv1vnAxs+rE4AVe3eeRDsPt9cT/824IW1TVF5/
	7CC4rXRnPLWwpo2//2xAXhlaoph3NWntj1CgVZ8k5NzQAIj/6rVKqu1aXyaYeQjzlbGiZRsyuY0
	Q3GlGELZiCXz7F5JeRfZn5g+6jNQc280TPOeXUUAqrvf6qQm9+qFfMsyZmmMjtVNb4arfINFydQ
	LoVIu4n8HUFPT+4oNo7eYJQEGYlqq1rZcB/Mm+1sydWImS1rmh6QdKP82bsyMIpmHtaOn0jH6yR
	FpiTDwbq3q3Zl9WUqXcA5iGnVW/qi+DBKCABwfOs1FX5PpX8dgNQ2RJiO0TawjJnYl8FZt8umYN
	SYv9/ciMZtNUGs45LkSLOAAhHUb7l9aLPMtpDSnLNNcPhC7XGfmfJitqSMYVCvECRP1LU0Sz+7w
	dT7tXI
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr405810205e9.25.1792068626716;
        Thu, 15 Oct 2026 05:50:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm19802173f8f.30.2026.10.15.05.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:50:26 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:50:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Nikhil Gautam <nikhilgtr@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org
Subject: Re: [PATCH v2] iio: ccs811: Deassert WAKE GPIO on error paths
Message-ID: <20261015145023.00007922@gmail.com>
In-Reply-To: <20261015123023.3417-1-nikhilgtr@gmail.com>
References: <20261015123023.3417-1-nikhilgtr@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Oct 2026 18:00:23 +0530
Nikhil Gautam <nikhilgtr@gmail.com> wrote:

> Ensure the WAKE GPIO is deasserted when status polling fails or
> the data-ready timeout expires. Early returns could leave WAKE asserted,
> preventing the sensor from returning to its low-power state and
> potentially disrupting subsequent I2C transactions.
> 
> Route error paths through a common cleanup label to ensure WAKE is
> deasserted before returning.
> 
> Fixes: c6644f7201f3 ("iio: chemical: Add support for external Reset and Wakeup in CCS811")
> Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>

Ideally your signed-off-by should be last in the tag block.
No need to resend though.

> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---

You were too fast! Wait at least 24 hours before submitting a new
patch, you might get more reviews.

-- 
Kind regards,
Joshua Crofts
