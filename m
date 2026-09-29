Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC33AE6F5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790655195; cv=none; b=DOa0d66SLQZHtajU51L7rGNlJwB6XTJ+akU2Kig/ovHp1Vplw0gqK5FTRjWu8mF5ZhiSUIuodrM5NGZANCPrQwa5axxs9BdoEza6BrkZNTwCAScLBioCpIs65eoOmFR8yl4psKvG6BPDMpqDnZbpEGuYesyHHQHholFdX0jyblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790655195; c=relaxed/simple;
	bh=fBrobsZijgJQ4xKYnillWer0eyqBzsgm3Y6j4hnyzNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUYbO33iOj7X6yKmbqLuSxG8Db1Y8Usf7b99/bsqfz/XYP/kIh1wGxcLMAaSV0vPNDm7i3IXHGQ5obCFY6Oshrdgov9EQEE/CWOWzIXQVA/dg198K/ioYX2SHcff6nUoHvo6u6gPGAlNFQiY/hwLCqA0kIRrmPqPZesKXLc3rik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oAJLGmtk; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oAJLGmtk"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c4c92477so123355a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790655193; x=1791259993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYvHSlL6Doz9Yye4z6vhG/W2e5/5w65LNIuakmz8M/4=;
        b=oAJLGmtkOKcmq0tk1XuMpD/3LLAmDFvpT+s4I19I7ffql43u6tqMJU7Kj/eFCrbGqg
         TNW3Whs4LDaaQW/phrGs0coBAbmkIqBF8kOaahAlvlCrci/zhzElFmcEWtQ2zNQdmsqV
         n8+jf6hbwlw/FqKTpfXZcfntLQws/KTCKJn5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790655193; x=1791259993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYvHSlL6Doz9Yye4z6vhG/W2e5/5w65LNIuakmz8M/4=;
        b=H+mYrKE3hcvgiV5BNltvAkNqAFEpUSX9OudiK1jTb+j9kzajNOvupOOYXqgq9wkJjm
         eC/nZHYa+QwZl/VHP4k1jDrgeAPZs+uu2OXGo0NojLuGLPXRqrZQJDkpL46ALxH/0isq
         LWyfQFrzAZASD/ImGZWyKltqt+LYKIKZmfktORAkKeIDiXx1wF2nb7ku0HAOCK0JoO25
         U/DFTcGZOldNJ3140aJQhipkXsUkKMiPU3qDACnG+7gkuX8B9FqW9FkFrHvSoU2810Lz
         6D9mxIQ3JUsCYKJ9+LUlCVqx5tz8/qXVreY5atARHLerE5juHX9lp/9N8F8ylaPokqBB
         NQfA==
X-Forwarded-Encrypted: i=1; AKwUvBzhtq/R5d351dRNYirjhpNwjjIQHSYW3/cuLdxWQTPlladFMEYeurAPgjSTPX5XPwFSZlgTEofV44ydoxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4bMQYGy7VVZV4HT5Q8CsdM5SfcLm1DiKFiNNIFfRr2ZiMkUDk
	2St4FdbuhUQQbO10FlvwQcRLvt0pwk41ol5lXlR5XhDlWu8ZSC3fJeF5PhWoX5v4/w==
X-Gm-Gg: AYBFou2C5dG2h0H4MDceVPlRmonWsK70a0fJaH9AL5+yRLGGYh6xKp4Npubg4vi4DIl
	/DVivIseWujhg5YR4ljT7ZYbUPR0RhdX0k2cIUQjlTc+RDlR/thzQWkzkUc4/VFJFjNY8pxEK14
	RPtA21Pv5YggFReDsxPBVSd2Vq0l3nPSjL87t/OQcuPOAzXhv6EuHxzJsVrqvDpwTi7uuy+Kw8d
	MVc3MfJawC4bZdKInClzXDkuSC6WyXRN/syQKHgpMWQiZ2zGxU7v3EePPaJqHviuGHKzTPWGPIx
	dp+IKMHKkR2Bobbd6zcfgIizdcJeOLS0GyOurz4v7iADCDQ+CGNY8oeGGDXBhtEiXLA8TTLGN5P
	G0Lc3hv22i9qh/u1hZn5JeJ1Ha7HiZY1MRV4z0yJq464UB4yjInjOlh5FneifD7GRFO09a/dctj
	TGo7j9t0FrGZ2hse/K7Y49OLK6ZP13mpSc+U4p/K5RZEb2uOwM0MEf57AaNXEBoa1dXDr3Ffxtx
	ckwUnz7Ep7zyFZo1/Jooxs2QzBecF4DewOTuaF5lZPmlA64Qg==
X-Received: by 2002:a17:90b:4c42:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a098e5897amr14099148a91.61.1790655193279;
        Mon, 28 Sep 2026 21:13:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:5d05:485f:348c:a48b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498179081sm2814953a91.14.2026.09.28.21.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:13:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 13:13:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org
Subject: Re: zram: block_state returns premature EOF with short read buffers
Message-ID: <ars5x7UjjU10KOjE@google.com>
References: <CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com>


Sorry for the delay in response, your email somehow fell through
the cracks.

On (26/09/20 18:27), Pooyan Azadparvar wrote:
[..]
> However, reading the same file with a one-byte buffer returns zero
> bytes:
> 
>         # python3 - <<'PY'
>         import os
> 
>         path = "/sys/kernel/debug/zram/zram0/block_state"
>         fd = os.open(path, os.O_RDONLY)
> 
>         try:
>             for attempt in range(3):
>                 data = os.read(fd, 1)
>                 offset = os.lseek(fd, 0, os.SEEK_CUR)
>                 print(
>                     f"read {attempt}: bytes={len(data)}, "
>                     f"data={data!r}, offset={offset}"
>                 )
>         finally:
>             os.close(fd)
>         PY
> 
>         read 0: bytes=0, data=b'', offset=0
>         read 1: bytes=0, data=b'', offset=0
>         read 2: bytes=0, data=b'', offset=0
> 
> The file contains a valid record, but the short-buffer reads return zero
> bytes repeatedly and the file position remains unchanged.
> 
> This does not appear to be a memory-safety or security issue. The
> observed impact is that userspace readers using a short buffer receive
> zero bytes and cannot make progress through this debugfs file.
> 
> Could you please confirm whether this short-read behavior is expected
> for block_state?

I don't think I tend to see this as a problem.  Why would anyone do
a 1-byte (or any other tiny buffer) read in a loop?  block_state holds
a lot of data, just pass a huge buffer maybe?
