Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B83806AF
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204802; cv=none; b=o8vUaU1yu7J7r9FSkjPbl7KkVncq2ck7TYqLYvZC5JDaR3gZWrEum9/3Z0jgA2Ek2uWsTdtcs+w0uj3jBrqRDVGjlaU/53llR7bF6OfLaR+vKZUZem6Mq5SY9+6IfW2uZJoKsGSJZCPI/dlidELeFPnRjkYwBFKxVNBxF0PSOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204802; c=relaxed/simple;
	bh=6n2c6h4Hymm7Jn+sRJG1iAeOOVXTKyFCMG6SxCx6KGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/RbeTCqp3wPFttVycHVnsgXZDF6iMrRatRsjiEeIl2aOj0ENHEw+iPxYJ/SHbcLV16rbg0lIJgk63QCoKnznBpoT3SZoheymXeadYwD2/7CCXH3cuwvRxvscgloYVPFscJo/3CQQpr30D/RkxQ/vLAWGXzt3Lg28Kuz9GUA+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvK8o9Cn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvK8o9Cn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4858303de5dso1750562f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789204799; x=1789809599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdb87G5D2V+5j6YZ5rMK+AXQbXwNqx6jG61RGWA1bkQ=;
        b=PvK8o9CnL5afDXeP3McmHz+25Wvpm7fhnZ6TFDuGJC4vmJR/0XYw2e4FGQJziNz/p7
         r4oepKH2f9erCppN/zL5OARR5gbNEqpJJSV1pscikt2gv6VHiKF5GT2t9oXNuc5gaAur
         zBLxfMmbfYHrc+3JTSPWxVNP8kO7n/MFywZfLyfr4W6g9cPsW7LElXeghTB7z7wP7MNO
         lKZGOebSbOthhvgsDHOUTUti+O4v3vfSWp5Ps7FmKsWqBt8yqAxWD6Qi15Dxpei9GMRp
         P+jBtaLwYqQnWygjVQJWOGJm0/zIiHArzeKx0cHSS3mLj2ihlEJtKg1rFGSqnZPvagfq
         FX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789204799; x=1789809599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdb87G5D2V+5j6YZ5rMK+AXQbXwNqx6jG61RGWA1bkQ=;
        b=ZMiba9rn8dx0XI3r+Kc9GjyNy89sK91aiQBfa8thoSAwgFpoCfpAsr/Mwc0osJyyln
         XdDMSVq+06bLo5i6H6fSrXxOBN6bhktRalNJ+Jt1f/eJOBnFa/u76cqr6N70jrV0ThZX
         N0N7m/EPUAuzc3tvp9KU2evwsEvwypG3P4KIjegIeEQ1aFizyA+uD7cTF/9RBrs6MDL7
         zhw3mAY77DhxJDtS6r2jIHIlMqioC4GEHqXii9851A7R7YnJAC9iDxK8WWC+cMYkume8
         hsuSvk2jEZR8bDpN85irZ3NBHoP6AdtSLhUXEVeiSlALgNwebIVlBoCPanHzJfKcYg1i
         2eUg==
X-Forwarded-Encrypted: i=1; AKwUvByptPz+76cfyya9xC1rEhPqCNpL+NllwGPSgWVke0B+RwQukp1Qouh9bPcWjc+RHosnlqM63wzzOC7tU+E=@vger.kernel.org
X-Gm-Message-State: AFuF++nas3LhbgvMldXsl1YstYzdL6oA2t7IOGJ/Zt2xbZ+Ox12LQwCY
	h/7okyMdx+8LM869zcPKWkACZnEycx7Ff++Gn4FUO4MJcL3/DGyrB6Ss
X-Gm-Gg: AYBFou3hDeG+K4IeIIUOu/+7LvOqWYZPR6NA2NEU6dzkMxDklXGSlyjrcUufJzIpRWa
	hayqC69ZEx/Ep/WQUBv1kLNJBxUnjpVZmZFxWhPMf8EZbdFUbkq7lSpWDFMN4nczWCTXZWrjLB4
	3oeoGfRHMvmRxhf7wVwEb8LctBQNF0ko4258BGLzF0DN1foETpszh1MkPmHrSuJVyvmBUKHzgUN
	P+qZbcp+uiTjJqUBeoad8FE1bZ/3TtiHrzv6i4Fl4ucBX9XwSoreIKTHi+TpzjHCE6z5FiQrofr
	xOd7p17zDa8rnf5C+r6xewSNZQVEYyOfSU0a9E6iYjVAhrx5cBSKK9p1eUdKLX8Clap4VNFGyns
	4/7hISro8EWTSxgFz67eByIm34lwKNqiy5Tv0safrHyRbQ6kVOWDyqVOpiaDXUe1XSo3D9QjlCF
	HVp0ncz1ZmuEr/It8gGAmVvO5bozbQbROtviogzInqjsYJ096pp0fr2coy9o1rz+4athWMhsu5v
	W+25MYsT38gQQD915buVs40z/o6Idp3+Yueetl1veT/Amr5vVUS6YCYLrNNzJopA9b9qJvlFvRm
	0BZ3GJvdgJx1Mz0hnGFEXOZ+bY4vuow6wIjAq3jfna7qAd37pYeIcjcCwYwxCJDpo8+XSDJNA2s
	=
X-Received: by 2002:a05:6000:186f:b0:482:e451:6810 with SMTP id ffacd0b85a97d-486eb2e2901mr9420469f8f.1.1789204798879;
        Sat, 12 Sep 2026 02:19:58 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm10716573f8f.36.2026.09.12.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:19:58 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:19:57 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] memregion: fix cache invalidation warning message
Message-ID: <aqUY5Zho3sKFP_84@gmail.com>
References: <20260808121943.72939-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808121943.72939-1-kmehltretter@gmail.com>

On Sat, Aug 08, 2026 at 02:19:43PM +0100, Karl Mehltretter wrote:
> WARN_ON_ONCE() takes a condition, not a message. The string literal is
> always true, so the warning still triggers but the message is never
> printed.
> 
> Use WARN_ONCE(1, ...) instead to print the message and keep the
> once-only behavior.
> 
> Found with a Coccinelle script. Clang's -Wstring-conversion also flags
> such calls but is not enabled in kernel builds.
> 
> Fixes: 1156b4418db0 ("memregion: Add cpu_cache_invalidate_memregion() interface")
> Assisted-by: Claude:claude-fable-5 coccinelle
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this patch.

Updating Jonathan's Cc address to jic23@kernel.org, as the original
submission bounced at his old Huawei address.

Thanks,
Karl
