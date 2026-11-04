Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785141;
	b=BSFvfj7JMpgZSv/BeH2nWpp0PgaUkYymQ6h1JzsY3hGSkDsZRuegqosyChbpHR+Exgqx
	 pIc2VhyPnyQfZJ6FyZXX54nIvx+pJhh6wyKCYFfJtWy3an9J0Dxzf1ogt7kkIS1Nxas8s
	 ZEGIXmmqe7zhyPVgtIMm1zZTeDJuAXYUAFNAoN++hh9/C3ManWt9DQiWgTYZqvymglzpI
	 Sk3pjM3tY3rFNSbXtCi90DhywUuZP9gRJwe4qFJrsPz+zQxF32QrLTwrKBPvWikaVpoBt
	 e/U/6ZF5KX62r2T178x0XBGrHcMTc6M5OGRajFN2xKqUU5yjh8CT7il75sP0lFUIy0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
	b=gj1zqEigzfa8wBRcukwbZ1DOE8pxQJk2SqzZ/tZhqIrLRuptg6faWVZ5QtnMLB1THRjg
	 kNALeQjTM6EURC5gBWY1I4GyNXe1AqsKNweicQYVMX6UdsFiPe75fJtOEOAT3tTd723yc
	 gUIROsseKOFRPZHgwmAfir9WD9OmL/ZXRznuazkPE/rquXYWapvgPozGzAILBNOrLH/ti
	 0RgwoK54Shl6Y1MvVzLtb4TW0XJUX0hSrwE9+prq9CkCvAZMmO182HwGCg/ke5JKVmEpP
	 mNAM9l9xtAwjbz/skk1wsXkQzOlYWtfdva5MTf62aiR/Z0pNkB8nafXzsJKGX4SDMZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWcuwFVU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05908606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05908606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWcuwFVU
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-55e0090c580so189790b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793785140; cv=none;
        d=google.com; s=arc-20260327;
        b=LUYm5SOZgQYEQFPN/ptLU2G0O0WH46VkhJSud1OJBKLznPwtcf4tJjYxbPyDzNP2S0
         j67mTQUiTCbi9NT/2QyTbdAEYl/x2iBXQTDmfXYK+rxaXsptdyx+TOUx2W7OQjv5PgnT
         CwJ+fiRHz84tbGoGxmwl9a3zaF7hcjrN+joxIM7rKf3qYxQTX23WpUcRWjQtPEQgcdkm
         7PhJQJQuSbY7Askyn0d/9RB+wikLtGK2Xd46HXfH/BZhfd9EmRsL00GxwLHpxf3rYVv0
         4O2fEHfC0xYUU3KFqgSzLOvwOXctY98MPyWX+whGCr3fj1di8SOzigKa0kR2I9dAjQrc
         RiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
        fh=kSS7qlnjVv5I9wgm8WWdXE6NIjiibAwZ5vl40a4rf9g=;
        b=A6cIbi0xLgfW6PmN+CJXO+ti6p8R9fA4QgesErlnmxydidrus6hlhTkUaeTZGj+Vdo
         wLODzyCqf9ey+xkxajlq2EOUz8kl5OzxP7/bu0cbiK2bAgxTmWW77hD+rQUMkoogX4NN
         FPTk7DFU7WOW85rKn+5WiMPUinUpZ5cD9i8F6+F4k5qxvfr3N2o+X/OBJNy8e9CEaDmO
         X+6bie7rvFOrgwFRitGs9zwv/N4ER84FzXtNJKSSJEJkcl6EDRod+B17wIoeU0gH5YZF
         YiAN8nhzoh1rqIIVRj4yPDawAdBkxJ/V+Z4McxF6PzZKOaPWvHftnXxjczuXtZ/bemgx
         KOfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785140; x=1794389940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
        b=MWcuwFVU34g06UlUcqUa5sYEJmikRLRjgphlE29xhKOD4TvHCz42xKRoY64u6NKHes
         xjt2Kmn/+YdToNLJkWPcGxIGbaaJ0wY1ZJbTTTZQD3IF/wRS+fSSROUlI3wyd+yxnKYc
         GQPSHj1gm3g/8wCHIXZ3oe5us6mBgP1dC2jQP5aBVk8OhZCVs1sZkIcMVJMecAjJXasI
         Og2OaHXi7Q0Zb2oFPTlydcj73h3lDupKulNOH88sy8HBskjJam3fsiYqJeYOxJqCxyVJ
         TnTTf5Y7SydEjaXW/BvIYuv/FteX8czVREzaVxsDiMkx0vrx0ASemIuFyUYLSKPjT3Bg
         Bkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785140; x=1794389940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyMFhiKAtvEArgIfEIeRhVp7bZV2wi7+c/PirP/xKIQ=;
        b=mIue2zjnDHGfded+ZTHjYDlEDyJ5KvjVT4okQuEHqiT28Jo+F5zMabFD5JDicavVBb
         qz+X8j1vmfbCqhgTmBbgq6+VbmDoXWav67tVG53xbsm/qv+0EAN/LBowH5qDJL5X2/Mh
         hGZfBs4Y2Fs0JYj1cwc2upRxPu5RsuL1SQLIWzX1Qjbh9l905Uc4MxQwmqBI+Hskiyrn
         2Mcq5+jCreZhtJ6ZxgAllDF9sOFjjkEZR0Ta2knt9ESphoU5WTu5obYqYt1+4LL6Sr63
         oRn9I3nVrr/UBJXmDyIKI4OO/yw136M9rhrrQyMo1a7V4CnyntDm5IAguQRBlDde0rPE
         Ua/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCZ3D/qhNS4oq6H0B7Pbmwc9NnDK9LAedwk0CL+6KG0PVILpSAiOZrX31RqbcCxk962bEwoNKGEZwynQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z96fX80UsoCn1o3iYfG0oi4LaoSYj5Xc+4CI3oP0G9FhWOm5CyG
	etjhfmSCdvn9SQqf1e7jIFw8KW15uHSZHV3Nh34IOzA5un3TM0YTsIUfrdFtNfg0K21O+5gkyJR
	5/p/S2cn/KTRmmDTu1kh1oMYrTAtv9vU=
X-Gm-Gg: AYBFou0Bz35+qivUm1f3ME8QrP7/VcqlVoRToFs5iWNqWar8+vp+jZwld43asE0kUbj
	3FsoWPzdEcU2ulqoO7yFex7ps0fT19tk0P0VlpDIyeX8QJMmKmruF6QUSuHOVqdvhUZMA2lkKKj
	3ki/002qbHjA4XwhQI21p3rN9hMObdP7NLVC8FjhAMO45iM1b8qZ9VFEBQD59ke2U4YCxQ2gC9x
	sEGJW6XSQ0C86PJlKIooqMM/BtuoTrMNE/UVgpMU7KUHBjL3OvrNhAaP3wviMJNQjH3IYD/RbhM
	K4j0HVmvnv/cnQHY+iCrNno/WqoB3/n1ecQbIlolnftDoeYNV/9lYrfSf3QivTFtQb6QIrVma7G
	0jrZqhpbr0rXoC/NkTCZVNcFL2XCRSqBVR44t/onSmsmXi1wXftM51EfAKtFToep996S5dNFMPf
	0eoh69ZDK41jyJa0pmpLFlEMmY8hqpUWlym0/x
X-Received: by 2002:a05:6808:16a7:b0:4d6:92b3:5c85 with SMTP id
 5614622812f47-5640de991f8mr9890887b6e.66.1793785139973; Wed, 04 Nov 2026
 01:38:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103163928.641519-1-sashal@kernel.org>
In-Reply-To: <20261103163928.641519-1-sashal@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 4 Nov 2026 03:38:47 -0600
X-Gm-Features: AclHuK-ajlXUEOlDoBUIXIcZPeq0dPA_3c3hkn84_pIOTF1sCe9cDuF4iuz_gxU
Message-ID: <CACVXFVNJp-aWqLDR+Vy=VyNzHzPjGiTppYBYYGb=bGs5CvNRZQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: fix the build and file offsets on 32-bit
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:39=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> kublk puts pointers into 64-bit UAPI and SQE fields with a plain (__u64)
> cast. ublk builds with -Werror, so it fails to build on 32-bit
> architectures:
>
>   batch.c:379:42: error: cast from pointer to integer of different size [=
-Werror=3Dpointer-to-int-cast]
>
> Cast through uintptr_t. kublk also passes 64-bit user copy offsets,
> which start at UBLKSRV_IO_BUF_OFFSET (2 GB), to pread() and pwrite(),
> and with glibc those are truncated to a 32-bit off_t there. Build with
> -D_FILE_OFFSET_BITS=3D64 as well.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
>

 Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
