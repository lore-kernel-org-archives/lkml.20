Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A436A341
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160410; cv=none; b=d/iU9aVLv8bdBzWug3oMnK4RJ+qopTieCTdDyVN08YXAe1BCO7ok04C9sf3at6Qnyr6CvALT2E7evwsNw4AEX5PxKtDcOumJW8uTcopKbeqLEXcZHtdDUxHi5OKtVDTLdrb8KYVB+Bp0Z5xp8aKp9gEqYCkZfIVd+OUzrOjw8Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160410; c=relaxed/simple;
	bh=YwzXpAOIl2Vv15haH4xKrFCc0zZX28zmgV8E0lOwtSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWObRq/ajHpono8tgSE0M/TjgbpX6gJSk1xczCZ3EExAEti8DTsPDbvNFWaT5lZhZXaXE7KEnnhJPOZGt+0Uy7m3Z1ozbszba0vn3r/ZdYodR4KoDzV0lUN00Fbz3IPONoLz7Uqsorl/ETfHeYaXObul1SWXBw14DpKsN16THdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/Q08eGN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/Q08eGN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so106425e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792160407; x=1792765207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6uidg5CuGsKY6XwWY8ZHCyov81k9buURAeTyWzFMBtY=;
        b=B/Q08eGN9wnU3Sz5mqFoxOAC+QotyVNkZG2c1yU4adlK5ZOgzMotUat3PGgQDVKgaw
         8rbycccK/RMeyD0hKg3lulr/DepFBbSrKgXktRCJrAnat0yOBN8Iqifg35179W2c2Wl9
         6zlR3cpccThcEmLXvRv22thBTpepuOxqTGy+T8erm3gm0OwhDIzRdJCzhil6PGcRKxjj
         oP84QlawC+rZF0Xj63BSY44Bx0DYSZm6/WTD9Gsw6F8MBVDKMYuTiQNTLp6UeHezOp23
         GgbuB1JjbW5BsaSDJ8GDFAAAX+KC7u+2fkIRoK7OtdVmbX/C/IiqLJScFfvCTyyX202Y
         WsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160407; x=1792765207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uidg5CuGsKY6XwWY8ZHCyov81k9buURAeTyWzFMBtY=;
        b=0kqWZlGK0X8HKoueXVNSH7to9dT97DcArC+EwHrlscmCd+V3jShSnFgczUyR+MSLrB
         iSSEt8EVRwjImcAhib7yo3GHNhKqulkxzOm5MkzuJBNHnifNMowQGI5ONxFMV5+kECRX
         IsHv5NcQJJEuZpWqeyIMyAAeNnm5TKk/c/w+WrAxfWl7gA1T3p98bOnyR4g78UeaZr/y
         Bd8Tyn8q9m4UEOQeuxajQNlxSB8TzDJflZB9lKqoz2w3YJllM/zxPZi+0WTuCVQd/Q34
         Jl4IBk8fxIQGQnzAEUCpKoYwI+5L7pC3RJWis/gWIgOUUws0QBzl8C4Ad01/2zc3dbFc
         HCVQ==
X-Forwarded-Encrypted: i=1; AKwUvByXAQvBRhgZwq/9abXB7qSG1NCbnfoLc2+2w92U4tOzt2PFVRa/B8k+48ESsjji/yE1DcvpESMBJDJ5ltA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc7omEgR2HkXUkDJ4SaCwcqHbUFq7XQ2SGGl/BTGQZAo5M7Xwz
	KIQmteQCQRCZrJmOixOd9ehzO5LHyQUhYJQz/XOvU6F4wAxdaWdUQBVx
X-Gm-Gg: AYBFou0NuOymsnuJXldlcdTyboDzFeuJYb/zJuokYIxMmJO0GcQK+4Q/xkm2b78Md3l
	hS2FGKuGABCXSHygpENuYSlE3C6lkFB0rRSIJ3yTpyUEELjUHyU5E8JzzFNuyyEqhBrumsHDEIP
	LbnFJiJcAE7sv6BBwDTcCvipFbQoiH+1lYdFePIYZQ4JmLRtnywGPn/ljaollntc34fLaHBONKC
	rV+v1gDQwKLj7tLLFGa0NOCjSzNmUC4+WpchECuDjxFXd7pGjI4tj3Q/OA806QiGYLyl3gJk5QT
	+bvTnj6chDHSBg1Yhu4xgiv6TSJOdmhXSQrL166OG9dt5Tv0+ndyV1A0RzAeZxbGuy/RsQOlUZZ
	1TgGC3oMtxgBLruflFP1sFgj/B10yVgnKN1e5OUJMf6njwIdVFbrShoHeziryNq8lf2tg+ODZft
	YS163vItkaJBAEzyI3H5MZHmJNqflRwJ2Q6BK4nzx6FxMNNbtfLBWLn+9M2Pyl+InBDl8OCjyxM
	fWYKk0r44gkmzOO9HkaJexW4H18dmRpwEVLEZZL+OYQJKiWEyoSSuX5qUjl4KwOiLkdu2myd19q
	8sa1rcoDH4p2h6eBVDRPhibCe/OduzZttZsXFsDBVYx4qEOq8cJFtvsOzKXNoHbi80I8H9PvPlg
	=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr252470685e9.26.1792160406983;
        Fri, 16 Oct 2026 07:20:06 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm63818405e9.2.2026.10.16.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:20:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:20:04 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
Message-ID: <atIw3EWamd4KN4VP@gmail.com>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
 <8733u8w6p4.fsf@trenco.lwn.net>
 <20261014233956.605e0960@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014233956.605e0960@foz.lan>

On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:
> On Wed, 14 Oct 2026 11:08:39 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
> > Which versions of Sphinx and docutils have you tested this with?  I
> > needs to work across the full range of supported versions...
> 
> The minimal docutils supported is 0.16, and the minimal Sphinx
> supported version is 3.4.4.
> 
> You can use /tools/docs/test_doc_build.py to double check if your change
> is compatible with the minimal supported Sphinx/docutils versions.
> 

I completed the A/B matrix using tools/docs/test_doc_build.py -f. The
full matrix shows the improvement without a regression. 

I also tested Sphinx 9.0.0, 9.0.4, and 9.1.0, plus the previously
discussed Sphinx 9.1.0 / Docutils 0.21.2 pair.

In total, this covered 32 combinations and 64 full htmldocs builds: A
unpatched and B patched.

Successful, with identical A/B output and normalized diagnostics (26):

  Docutils  Sphinx
  --------  --------------------------------------------------------
  0.16      3.4.3, 3.5.0, 4.0.0
  0.17      4.1.0, 4.3.0, 4.4.0
  0.17.1    4.5.0, 5.0.0, 5.1.0
  0.18      5.2.0
  0.18.1    5.3.0, 6.0.0, 6.1.0, 6.1.1, 6.2.0, 7.0.0, 7.1.0
  0.20      7.2.6, 7.3.0
  0.20.1    7.4.0, 7.4.7
  0.21      8.0.0
  0.21.1    8.1.0, 8.1.3
  0.21.2    8.2.0, 9.1.0

Successful, with only the intended A/B output change (2):

  Sphinx  Docutils  Normalized diagnostics  Changed output
  ------  --------  ----------------------  --------------------------
  8.2.3   0.21.2    62 -> 62, identical     networking/kapi.html,
                                             searchindex.js
  9.1.0   0.22.4    74 -> 60, removals only networking/kapi.html,
                                             searchindex.js

Identical pre-existing failure before and after the patch (4):

  Sphinx         Docutils  Status A/B  Normalized diagnostics A/B
  -------------  --------  ----------  --------------------------
  7.2.0, 7.2.1   0.19      2 / 2       191 / 191, identical
  9.0.0, 9.0.4   0.22      2 / 2        53 /  53, identical

No combination gained a diagnostic or changed its build result. The
only generated-output differences were the intended restored headings
and derived anchors. 

Karl
