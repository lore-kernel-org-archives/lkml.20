Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE4D243387
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731366; cv=none; b=lL+rfJODxL6mkd9+WCGvAMrJV+Ls3g4zY5xcAzdGxiUIIgzKYu8IUGRB7q++5OblR2hEhnRr0abOC2bC4QgfP2QIrwHa3BnNcJ98Fal6p8GASUImx/VFn2zYYKeDLklt0Qsu0jrV9P3ZmySuusc3988g/fGLzSv/rCz2jfZpuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731366; c=relaxed/simple;
	bh=z716eksRuK3oeufJKol0pznuZJZZ9ix1HIHWejay1qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLytTA6J4AGDhQnhzH+YMcAo3nIpXw+YE/hIoJhU28ACeezR+RoBZC9ZT9QM8YodquxarI/zygVXmgqNni77wC5bk3nI9mgtuVZU8dTEM0mmMIFcF0QJN9N8rhBKTut+DCMzkO7RCfIKIh0lQR/cw7zR8Db69hCg3gviR1nX6y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPZPngqN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPZPngqN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so14161705e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731363; x=1792336163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdn56d0EH+bT1nmTXkVjIqTfkofp+CToumTPS4Zj8QU=;
        b=BPZPngqNc3FAWBbJIfOvnLs7zQQ6Nf6u1h5i9CMOdIUJEc8idmnm2aU9kwRevMh7PJ
         eZOTIekyyQuGbXh76CB2pNWO5SACS9Z/Tk3zqIiOmx3Sd1AHYy2/md5BA+D0Rw697eFd
         UShlSfQuI3mIkmflxY0yq9MFD4bRWo74NBtifWWhwLgP6hJRiH9m9+DNr796BD55mvCB
         D0h+GMF8rkz2qMB+kcEh45Oi7Rwp9UBD//MNJlOLnZkIN+5CwdOdzYSE5o7UkFqccLNp
         mqjascwiJ6+cPusIWYnLjKcoQPKgOnVYryAE1v6UGEgEJGGIuWejGZaV9ZDAfylaKVcO
         G7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731363; x=1792336163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jdn56d0EH+bT1nmTXkVjIqTfkofp+CToumTPS4Zj8QU=;
        b=LUr9dtjX1qSngq6HaJ6/jWmOxHwMDpdQtEEYofzAY2UVFMPf0BJGoHEeZ9Tt7oRPJ5
         uCogVgdylPzyxQqrWOOcOE2mR4EqZDJ5RsRfWH0RQIz/jzBayPQkblSN2XXQ/W+Glp6M
         2OpSRBXzTh3mUEDf8Xi5Rxf1vHSxh9Y1pQ0vXt4TVFQrhiBdNqRRMi5NQ9/mSn63r1Ew
         Ebp4CFuR6S3NkkgQihB9SXqv9W2E/7xgCx44wRIkr+yjxM5ktUJMy58xNMDpNubbp+xh
         gU3IZXWcjBDHtPJR/WMwno8KRWgTY+GxETYvwJb5xqnuOEWVn/4S2lo62rCW2znI54PN
         Hk3w==
X-Forwarded-Encrypted: i=1; AKwUvBzuFK19qEQ4jfRLg5KWGr3PNXNHlOwjw+Ml9EO9gyxqBMMvyl9q0//yz7lwGqb1VTf+TD1Z5PxvvjqPKdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIluQlp2hNjn+MkptlMn11CsVqJdUZzMun7OkccizSHS0LkigqV
	+vghf4NsCnTnqu4hRacLmNyhGfbCGiT1Frf+/FL7rY1CtfjL3cs7RV0aCwDZQiX0lL61gg==
X-Gm-Gg: AYBFou2AuYdS2uf5ky4QP/mvSEfB/+bF5Xz9lqRLhe8nBAzGVISXCD6gfQbstKN70I2
	s7RbzJ00m7m4IuN4SqNQI1M/5YwOtZ9nZS+jParSBed6Ir+6nlT4lYS7dRCbFUl1GjOva2lr3s3
	DRKu3NyO+kSFSaIOIm6bODqaz2oHjBQWb3+z4XhDTIkcx4xoAToqrrJhnbU0DgGrt31mc3/SLFf
	68GsrW8XDOPWxBSxwSUquWKFGJPqodqOS+8WaT3Ypg4TN9CdyvajqzlYZHPTNqH5ZEOE1Aq9gFF
	qET71UPp8u2kyOoDQLCw6Fhy+CnJ/63TdxpFFAqb0WGZ02KqjZTjguZndlN0cW2HnyNiBHBf5gl
	4lubeABJBZM7ggdccaGLLUyPCz2x4ZoD6IGm1m2c34bVb/X2npos2d8fwpYIctsjyqAIjxGIMPm
	QucWhVXiXcygmF30GiDuAWsNnUuXZ0H3ROmMA/63sGwlrZD8rTZuXPbyFLKKrXFSzRVZdsrDn5e
	AjIDq0cQiMw+1SimcZvc+fQJDUKBhg=
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id 5b1f17b1804b1-4a18e4d68aamr108650155e9.24.1791731363080;
        Sun, 11 Oct 2026 08:09:23 -0700 (PDT)
Received: from [10.0.10.92] ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm235673485e9.11.2026.10.11.08.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 08:09:22 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e868eae8-7fd4-4a13-bdac-92aa2198b84c@gmail.com>
Date: Sun, 11 Oct 2026 16:09:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: fix dangling check_top after an unexpected
 recursive dependency
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164528.3685545-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164528.3685545-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 17:45, Leizhen Zhang wrote:
> If the last symbol of a recursive dependency is a choice value,
> sym_check_print_recursive() pushes the on-stack cv_stack onto the
> dependency stack. If the choice is then not found on the stack, the
> function prints "unexpected recursive dependency error" and returns
> without removing cv_stack again. check_top is left pointing into the
> stack frame of the returned function, and the next dep_stack_remove()
> dereferences it:
> 
>   AddressSanitizer: stack-use-after-return ... in dep_stack_remove
> 
> This can be triggered by an (invalid) Kconfig file in which a symbol is
> a choice value of two choices and the second choice depends on it:
> 
>   choice
>   	prompt "c1"
>   config A
>   	bool "a"
>   endchoice
> 
>   choice
>   	prompt "c2"
>   	depends on A
>   config A
>   	bool "a"
>   endchoice
> 
> Jump to the existing cleanup at the end of the function instead of
> returning directly.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: d595cea62403 ("kconfig: print more info when we see a recursive dependency")
> Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

Reviewed-by: Julian Braha <julianbraha@gmail.com>
