Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792602514;
	b=n+v5DvbpzfAg2Y3fDGWSw6IA7J3ru2+f+rsb/HZ+5ARXNT3xJRUwpsCwjKiRjJ4VIssy
	 4uKSiMr2VJeEFH4WYpEhhL/fcyOcvWwzQo8Rwn/MFBBNP4K0EK+aMe3De8/dGCwFyWNll
	 iGEGTGZwDweMI8B/62DqVtw9skRScaIX5yKa75gyAx21m/682hPIsDtgE+vY07yVb6d+y
	 39FaE5aQsAJERbdqeBkGGRrXlxTQu9nfRrEyFd3yqV5JRdD0DCdmhdq7T1N0+86gqoW3z
	 VXrf1j7wPZtQjVTooSZyHhUehREvwYX/ZRgn/0AyFcVWbqIad3M9V87yv5KvfHnIAkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fGCGePjfI8XXuGHsrc0ohceeeEG6k7P8lw+rhpyAdzM=;
	b=SD8hkkG3vibGYzjzlnaa85YJord0H9dghh5GQc3wDCzliVE8qtQ9XCqm3m/bDqSrqoyl
	 EtdWT7mh1i6rfmumcoJYsQVTPNleiZjAmZNecEtow8Kw2RY1eMnlRai1Yp/7uKjNGVZyo
	 JLEfmHPvwHfdPvIHaIJL18oppAd7rZ0GUq3T+UJeoO+cugCVKfXrV3UtP1nlJYzabCDcj
	 PUUGm8kx2enhvSqstHohwigI1Asgr4weYNTPLNenUq0r/DOV40ZFtfNQmGbKRr10XIKQS
	 KDrTzEuId55HKXbtnFqDpZXOlV/jHGx/WW9tsHe9scXSRJlW1oQ1AQCqI+q88uHmqvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zv9mNbCB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zv9mNbCB
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so10077691fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792602512; cv=none;
        d=google.com; s=arc-20260327;
        b=l6Bt8W7jqfVSSsYScLUNdmaZjTWGX48KtOTWTh0BKi5xQAgoCj+apsRLGjomLf4otd
         kJY7rBcOIB26b1ErhUIvkQeZoDNYvmgndQ4I3D3Yz2jmHyOisScfBg8u2JVEJnWr3x1g
         GsMXxmmm7imtAln1pVfcgj45ch1gDSRB8EA0V7FGR0ffmamJvkggAH6jLgWv7RTsBScD
         b4wG1rGPfytKfxRpIpEYQ2BgAIvQdzAQgDbAclZ4o7T02h90qRhWKnaetoGMUf1l1JNc
         L/x4Zt1nArxCm2Cglxmk1UY3NMDy9nB+X+le0bX3jhVF+/WnMjDWgcvD44YSZQJMZFqX
         fR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGCGePjfI8XXuGHsrc0ohceeeEG6k7P8lw+rhpyAdzM=;
        fh=qaNID5GRMHhPG5ibVCufCxPdiJm6UWwbXVSvYBiFdkA=;
        b=ETezGm8rbCgmzeCZG6Dt6xLEhaViAjEbR22TkeM3tFotzSyPI9EwY3QHJtbbC7Ojcf
         aUbrLgLEVjYlRw0MtSQaQJRMZhpfqyg+g+0VA1JJvQqvGq3iYLrIavbDyYfmEA2/Ric5
         R106WGLikaF/Cfhma2IztwqUp7Ca1nJ4D+gs6avC/tDlt5cFa0iXmbqQJilp/TehKTbn
         55Yd8VeePU93DYs1UoN6HVzYv0oyJpkZZz1ESNl8W7FkhZcr87IjBnNBkMOwNdNo8mOe
         sMTMSq7fyCLUK+iOCZ6felZ8EHP5uqoX+otlo60GfA0RyUwBpDr2iVZR+53xgYa23L/T
         kuLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602512; x=1793207312; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGCGePjfI8XXuGHsrc0ohceeeEG6k7P8lw+rhpyAdzM=;
        b=Zv9mNbCBqDhn0djUp1ft6TyzbbWXWgYiBxpOGnriI2ekUCE+VtPTgnJI0nj5538Qty
         nWC+VbfES4c9ruBxf+x1AAJnm+GxvBw3P8GPFCbMMXwFxnhPH0BEoTCYg4oBdw0t+AUw
         o23nnSkwr0OpaxOpHrO7q7+6ElPDKIjw46lzhiJYoh07wmir4/IiHMjcYHGAzePGOJG1
         kUCnH8QPnexeoB3qxfm1A3ucseoXQ3M8oOQYh7ol2nxONOg/ajPzMyk/btIpNdDhJXup
         u1++3vUUJAGiqv/qQX9siWJtQ0cBrLyo4f2PjhX0mcDbsVZJFOeiD/H+f8RzvJ66C2DS
         SGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602512; x=1793207312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fGCGePjfI8XXuGHsrc0ohceeeEG6k7P8lw+rhpyAdzM=;
        b=SiOpaWSOJW9lEv0pmf/DYtQ3Y1wBDMjQMNdQ1/KkjaClFzi3oEJPLoNVjgeaNGV9dv
         ySlJJjqk+7WK7gZ9gd+GH84ruvkC2ib+ZQ8rzAYnU5p/dyNtmy0u0CGU2Va/I2xyK1qw
         ftS8N2ai4yLqSeAeOyhgvb9hwuLee8VtahCUlpZ+yMdR5ouP2OmmgVo316JChTp9azLZ
         Rohdfo4j3OgQr49lp8oUxJPCwZ6AeAEkljCXjas7P2SRy/2fTqGFKfw2duU8FdPy09XZ
         wfT7mJjbij6C3kA8jY9qvuhSs7X7wOjhEqwSnkoAWG9DtRm3MPzjjQqOZ9XfuyzYnhCN
         9VwQ==
X-Forwarded-Encrypted: i=1; AKwUvByp4kC+v5uD8DsYTSQzz4IpfiyCP02U4qbK5yU+/AHqZrjuJjTsEa3pfXYZn6AJzcAL0w5+Dd32eKdYeBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUI3dFzXBb9BtiuK5x8DTN1OIU9Cv/Z0XdHvhMLpbT2PXdljOn
	yP3+o/ehaKCpOP3Jjqu319WIy5g8GpHUBGCt+89NHXI4bHt+V9E/Kml6AHf+/vqw+HhP69Rg9eE
	7EzpkU36axtmuiSLRLsPwt8Wy72OJOWs=
X-Gm-Gg: AYBFou2NcOOJMnbchnmNGrNgRHn1UrR/hOc6c8AWdtwWHKurVWwXomItbR5yATR8AXD
	DQF0/Xz1/ZjM1cs81zxIT/JaRLvCi8icV9xPHi82XzTRSGFys5m5xms3LDZ4xyau2LAob2Bubil
	08GamKPRyO65DWVcrPP1Dt/TCPqcwbGKjKhEcyfmZ2eOaOg4tejBqTsmRKFzBjtsKslmC3OgrNu
	n3cUVXvjNgwfO+yktqWWbDeOmI5tfpHBKA9u61nbN4sRIKKX9vpNDiE9zhZ8SvcosgxXzGI4a1G
	Vh0lLPpBqHOutZq5Pl+fF8TgZcqv+MqcIOw0bw0yFR+UKrqd5tGxkbAQ+odD0HN4jjsez/xM1tK
	X4HJWj5l++wjdFxKBOmgZ0Rm41QtcYWCdz2yG
X-Received: by 2002:a2e:b8c7:0:b0:3a9:d9db:61b0 with SMTP id
 38308e7fff4ca-3ac441b9da4mr7661721fa.24.1792602512104; Wed, 21 Oct 2026
 10:08:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012042851.389128-1-oss.patchbox@gmail.com> <20261021071853.GF851443@liuwe-devbox-debian-v2.local>
In-Reply-To: <20261021071853.GF851443@liuwe-devbox-debian-v2.local>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Wed, 21 Oct 2026 13:08:19 -0400
X-Gm-Features: AclHuK_5n4DvXcr46txfd26PyChDfZ8Vzl1LcIm1g1VksjW8svHx4dm9Csz8zzw
Message-ID: <CAGG=RgAxjGkcMC9NjxqrCQmbgordQeZ9vqAFayuRo5q1sY9ZxA@mail.gmail.com>
Subject: Re: [PATCH v1] mshv: Don't free overlay pages after a failed unmap
To: Wei Liu <wei.liu@kernel.org>
Cc: "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Jinank Jain <jinankjain@linux.microsoft.com>, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, 
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>, 
	Praveen K Paladugu <prapal@linux.microsoft.com>, Tianyu Lan <tiala@microsoft.com>, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 03:18, Wei Liu <wei.liu@kernel.org> wrote:
> I would like to get an error or a warning here, too. Can you send v2?

Thanks for the feedback.
I will add an error/warning log to hv_unmap_stats_page()
as well and submit v2 shortly.

Thanks,
Yuho
