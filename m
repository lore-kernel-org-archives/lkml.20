Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004594;
	b=26wnemoJ1HcVQtTjReY7hFZUJ5LXuGNwL57fHZofGyTkRsl6dVYevYSiej/n59oKKXat
	 QUyQv6HIiEiAkRbiXo7eQMltXukBrAHyXHHFBxMaK7V1DzIEcQ0IXNRI/mLlFmscdluLI
	 KMMIElgbhXgd/fJB09D8RKkDnZiXp9SVy4IrTk4GmnuB35g5X/6iiHx5i3idykOJAHiJZ
	 DJogYfUSDKbXTf+twcoRPOIbwFM0bLh2PMBRi3r3/tE1C/Wd8lgR9bqe+Wy7W4p1f4J8E
	 5Q4bUEGX5g1FNBo4+U0o/oNGmaur12CjCelUjM6kSJ1KrQiAKdoEsyQagxvIMQwfGgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
	b=ptbkWmTIKm8MMjNLpn+0f6KNqcXLEuBsJEJa0rhZGC9Q2qvWACZ5bp4GOzUHc0rzqtxe
	 Sg+4jwOHY7+RrH9zj8j2/FBZSenuSLIFstqfrlQ8QKul6xV62Zk70x9t5jgmgVH5TzkQX
	 rxS6mNF/32vL0tM3Ny5UkgZFO8qdm0dGSSxOCgXfaYsK2bYEnE5CcWg1K0QVEVNUX3wfL
	 SouD3aOEGIyN/JloIXKJ1mA4afXRez2/sAgbzsvMkstThlM2/G/XyCvMx/oFax2bqfJJp
	 ltQELNY7McBXRbkSGSmyBy2pWVqt+C4yAYhTx04MncGQBed8f9QGyDc0X5C4Dl7hWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WN3jBsmL;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WN3jBsmL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so10968925e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004592; x=1793609392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=WN3jBsmL7FlQYVtU6AifMJhW6p22tkBHgzicNq/NXnuCQWWrgjl9qcZFAOqgxlWSXN
         1KJKdrNaLpjQWFD/RIBwiD9LOwCUpiZ1RpuIdYhD11if1nRGtUpqXK7dYQbWshfK6plY
         HBZ+M2aaFpx5s30SrsGv27oWpH66rvwE1GfQDDsvSXCSuZIjQ17y8HjMJlfD5i9xczKQ
         QSj4Of5FFmP78Ffu2dSRmU+9JRLHsKZ7PHkTmoE68RA2Y3urV341oqu/1j2fB/7Vr8wL
         ETjfyRKyj6mZCGgJEF2JVIn7FAljyVHjRcKFbe5Ps31z5oGODA6stcmlZXDyFEJFhV9L
         WDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004592; x=1793609392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=k4cFmk5ll8wW06CuCY6MHFUwj4QeU9RovfZ4mnHj8UHwE2tRi5NPKAyHLg9TDhX3Mt
         bw18sCb2s1qTwWvRI7CF5Zpb3ZgCOGFmqel2hvq6BtTkFbTdUYoJktGjzacFcm9wqvOT
         eBlckADOnycbh3Go1T3ircZYp9lqbtqPfNGdJMf4racO/2NjmZ7a/Qn9n/guALvXhfVm
         qzMxn19q3SDSIeZtQXmomgWvmTTPSw7MEtyD1tC2inZgEwoKnKJFzQfHzBtr0unt5aeE
         znBu7Z0CNhssbRWY1Gvu0b+Yy69fFN2gBkr5nesZjWASG1fNn21imE7MZqCM4XwQtf/b
         ev3g==
X-Forwarded-Encrypted: i=1; AKwUvBxWkH67e9um8XaBOSA9pZdAQ2spkmZqweTf5xOA1s8I9vMExdSo0hbqSuvDLf7dzqL0/fSdRXAMtG27KxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt6GWUEpoD2Z8t4ekh/0YyhEPfeXUF45ibuRuXx75NsVBLs8rf
	THWpQHE4e17inm7HPoBPlFZGMUsOZy7V0bMQt+Kg4K2dowNnexdHfjxQ
X-Gm-Gg: AYBFou36tULaBWot0rlhgRkOWrwpAvZc8z8qkZUQAa0SS0j74lJkTvxBxLbGORPtI20
	BUKxR91RaPlR2gw3L2aby66MzuL031sb+rwn89OPFnTA6Ceviv/EgMUgZuD6DzZmHqiVM14ZDjm
	5yp6wmwxI7WY2Hqg5Oh9LfVFVTYkDNGtL2cIth+o0atHTk0amc1VFm169+g+h9qk+EObh26qqkL
	mw1Wotcdhrj2z/ZS41FgtheZ2d4/G+iwjB2W9twtb1+xDLWP/rOwGYd2WHDRX8uBduPWkhbbXNg
	S6MKYEf6+32bgJU83NP9p9r9i32a5MCTMCSqnSU7GWSD2pMQ0tVFFnM267sne+KYIKs4HdhNtXk
	5NAORhfSscgIb/+zARBopn6hhSYMR01kflQf5RF5ixbjpi8MZrzrslUYwWrMuqNvAwSlJ+qrzzT
	p1lHFcqOntvThWzimXMJq8StnIe/OqAX6k+Q7Ylj+06sUij0fpVTKXyqRpKADP0oZbhKVW69QgT
	qSCiSBUjWq9VflR6uAkutm5yRohwMXF4EDMFvHzT1dz/sJ0jixO8UjVer36ftV3n804
X-Received: by 2002:a05:600c:1c06:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a35ac407fdmr149623005e9.2.1793004592159;
        Mon, 26 Oct 2026 01:49:52 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.244.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm179923445e9.2.2026.10.26.01.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:49:51 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/clk: don't ignore RAM clock programming errors in nvkm_pstate_prog
Date: Mon, 26 Oct 2026 09:49:49 +0100
Message-ID: <20261026084949.256678-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lyude,

Gentle ping on these two.  The v3 of the cursor series is in v7.3 now,
thanks for picking it up - but these two don't show up in mainline or in
drm-misc-next, so I suspect they got lost after your review.

Both still apply on current mainline (one line of offset).  On
drm-misc-next 2/2 needs the v3 series to be there first, since its
context comes from "drm/nouveau/clk: don't use the pstate cursor after
the loop" - so either after the next backmerge, or I can rebase and
resend, whichever is less work for you.

Thanks,
Francesco
