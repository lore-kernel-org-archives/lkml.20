Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793850648;
	b=H6zVnvRVqMqCyfkdUNWF8n9j+B7NKwewFnG8szZSLyfgiRhwK/CjTwDbuvh15jy9YwLA
	 sdAqpgymORnqnT4GxAy4p839FBY/JfgGt7I4o+BX7cL+NmEE8FHIb3SfUm/lyexSHR45q
	 REM6+TA75TDVBRQB3YjoKUppGLghJuC8J49sJ3rEy7VDLqhvtX7gg0izdolrA+yMzoy2V
	 v3S05sFNhdvl0kca9HmNp3je/IaGNMarYH5BUy45RMIpZIz469JbyCUqL2+XQTKdqGTbD
	 +cfUvj7o6jNUTR+i4icCMRlxMAzpKSIIH2QxfFZstD7b11vzN0WxLWdBk5JOxF2p2Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
	b=4XmJnKbioY8RaMfWy5lFDhwDtnQXudUs1yHQl+NeMDH5dZb0VwLWJyXYOyAKJYnBuiQS
	 Yszzkn2ibKcOfM16ayMLmHUGTeTvmBZnaS+JjUV/Iceuy/FIE5JO1adyIbPU0kpziuOp7
	 ibkn/ejVtkbDzdqSn95zBYKY02TZ0+JYTJSBTxCXEwwwAssE9K5WILghZot6aaUYjUDKa
	 uQRS3S2lZMzpFSn4D0SYlZBE2+mbkghZMPESOL/mdF2SzGB/1GFyVfiDH8w7YrjbolZMT
	 dH/ZUZ/E5L2i3y64bczqSVmH0YgkDu6lSazDbCK2v3TDCk6M2hdCSUi6MYtN19NK1vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QdW1eo1t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D2C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D2C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QdW1eo1t
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso2299604a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793850646; cv=none;
        d=google.com; s=arc-20260327;
        b=WSoXEMl+1QLwec1pyRH3hmmAZNachdbbp6TdfBTJTFYWBUUPxLg7aq/RTZcLS1Hei7
         1Xw58EPd08ds93Is06EcbdcJmJOP2NR9cNjVJkry6EJxkYcSvv2Lfuuu/rZsXBi5TXq6
         ZzbNrWlCFzJ1xpiy+59CBjQKHM4RYkovcpwKLCw/YOrt/PdVup3FtCJQnGob9mmVs6X3
         JpBZ6fZ9fGGDwY3O0HgWKwuGVSIXixTMUKJlUbyZtqjabQAjx/S0/jZnbLsfEwN1hvqk
         PrqCXew5BY8Ce7EuwYVmLDNjVdxkFGRPGAH/0XjOXTfHMBYItc0oOJhaW8v9yhFb1nzM
         vOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
        fh=rrb1YNn+r2493045NyfTNiaxiCXN+AsT0EI1bwkLtaE=;
        b=AzOvOL8Jnp5uItm04mSuG1IFxLLcRqpeUSJnoJem53+G8VDvjzwqFNeZNikKJSKaed
         uPuFna/YOBV8lqgwhubhIsqJbSKtHK/yEyIPCjvRDL4wl5jTGu4e76rdOgUo/JQLvqP8
         0e+T9bQT8ovIRtj2DeT1EO0cXhUDuCrwHWtx1SFUv7mD7RmC+q5O2HoOznFJOAcumKs5
         5MBKRyB6XLkNZNaHrnhDwXD8ROI+c51OfbyM60yu4cmFj+xTzYR+A0xmri7xQQ22OYMQ
         44jOcuWVwzaiihXMoOwXlY+/oWUNSsuKBUr8sRGeqg5jXTtDhaOXrUzdfM3ysArtUhGp
         QNuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793850646; x=1794455446; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
        b=QdW1eo1t44q2D+H1UtllY/T+xOZ/SMf0lrMl6Htdsy6XWiKCZOCsQRL8YSDA50RGiG
         9MFM439sZ70XDnSFH5SBXYroux3lJJLOGHSeUvqpbfOaQ8NVgzydhNEY8CT+vBcjS1ks
         g6W2vfqCQPVLA+nhlgLBY3/wzmXO8odrJMXl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850646; x=1794455446;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sM7dfig1i2Wo8yfxI0EkWeP7nZ/u088DEvbNtpb57pM=;
        b=SPFfUNwb1ZdsDRgYe0hRPODSS1eQDvKGObfCVZ8KD8E99ydGUgmXwtozbc17G/vZzB
         TQidcsgDmbJUZ7RzjN/yzRslWzBZHHf8rCCfE+nDLhibecKvuTaATRJEgeIzYFPBkSHF
         f3A1tK5i4OtTYljf/DQ4k4e2D3xOt6Qvg9iDfU0iMTNFRwMvobQ/p+R8rH9ci8H1gG+n
         UDNL+OuSeLvW+RyqyTTrBuGBNL1/bAWikYW65IufwwoVmPOj0UC7edPyqy+XZs+Thp/W
         BLRKQnOtKxSevvyG7EBfWty0Cu23I8DMpHiWK1eSygJgz5fJ0kEqMq26A1ps6DImkiqp
         7+ew==
X-Forwarded-Encrypted: i=1; AKwUvBwisxf3IeoA2NQGlfBALqCGxaS9D8N+bqXJVnEDNd3XM57rb8RETguWEgYkLIv7doJ35mDaMKmnS9vRA+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ihey2utKfmTtsNh3IAM//qsqDyRjol+5p3wbKCVeCfF71H2a6
	5NRfk1cyrig0WETXBDhRzrctQxUJrXAULELkFz28dF78k2vIDyS3Zw29cWbxhqK1a5wXfl8wl8j
	3rI0W42XITQO0eZprzHwpmzD5JREJKLvE0By19dY6lgKxqK6zxdGU5PoN
X-Gm-Gg: AYBFou2oWXPghNha1oe2Px+i+zKxJ+dWABpMsJCPWH3m0xFjZjPIRL1WWlGfwATqbXg
	Xrrzdt6ZNNPEzRtX5CfwO1M2sYvJI4NwyiF9zTsCWTYtdZ0lehG13mxxaUWxSDmzYsGo2ECK/Q/
	qRylRt2JicIKUxjtdNeMlQqu9SKYYSqE08hrT/XmXUSspezjXAwAGkQY+V/KsgpLywI9DVIzZ30
	IRk0rs+FkDpz104nejJ+y9ffNLyE86jnuT9+CqvlW7jZ4cG5LyeaJJINTNn13orcsbPR8qYjyr8
	We4jaov3ioZBpXP7p4lSTgVqZR6GRXUK7GaKz2O5oi70UycdXvplom99EAmhHTpTQQwGC+YCjQn
	GBXgsWa25N+/Fz2zZ2g9TWKdi0IYw4tPIFAwO0VKKuZg4CxQmIZxL8pAvjmj/hkHTGb/luaY=
X-Received: by 2002:a05:6402:3226:b0:6b5:6cd3:fd8a with SMTP id
 4fb4d7f45d1cf-6b56cd3ffa8mr1897964a12.10.1793850646372; Wed, 04 Nov 2026
 19:50:46 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:50:45 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:50:05 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261103164206.129723-1-info@daylightlinux.ch>
References: <20261103164206.129723-1-info@daylightlinux.ch>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 19:50:45 -0800
X-Gm-Features: AclHuK_p7SrW3AO3gCyVQXkIb1oKsnBVS0cSjYV65SdJcUExgm3dRdAamPth3Og
Message-ID: <CAFLszTj7nbGtfviOgcJZtZShaTvSE=viAhBPziBwnMa_ZisBUQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: make_fit: propagate compressor failures
To: info@daylightlinux.ch
Cc: sjg@chromium.org, hamdy.aea@protonmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 2026-11-03T16:42:06, Hamdy Abou El Anein <info@daylightlinux.ch> wrote:
> scripts: make_fit: propagate compressor failures
>
> compress_data() ignores the compressor exit status and marks the
> operation successful even if the tool wrote only partial output.
> build_fit() can then place that truncated data into a FIT image.
>
> Use check_call() so compressor failures abort image generation.
> FileNotFoundError still allows trying the next supported executable.
>
> Tested a compressor that writes partial output and exits with status
> 23: compression raises CalledProcessError and the CLI creates no FIT.
> Also generated uncompressed and gzip FIT images with a real DTB and
> ramdisk, and verified their payloads through libfdt and gzip.
>
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.
>
> Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
> Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
>
>  scripts/make_fit.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
