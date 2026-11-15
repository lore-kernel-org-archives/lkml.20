Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794735629;
	b=oURg/EIsmJVA5Fbg8qyEqxun7V7U0BfCMIkP79FdMMvp9AXhB9kq1J0UKb34s3eRm+uA
	 QDPPKmTZxSrTfv2pv0Z5zpUkZG3FjpgYy2YzY8jdxBUvrRndWUSl8NiTJJgfS30rg2lcu
	 yD3myTPhggeVh6kNBgVWyXxDUvP79eAr/1uniCC4udpnNLDBr5YrvYRxswkEf7pyRsXn2
	 4+G4HjcdpzqlkbpIAXNu8mYNRrvjR3aDDKoDJw8ZGqkez70Ns60w8uCfNQLYJcLnOWhV6
	 1jFMtnFxy8ujLU7f3yaECNik/k7PRJkMiz+t0ziUcKOTuOo3TGrL/1iZggD8RR1QNog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nK4+XntrB4g9UMluME3F97OBMFRl+N/3eQxGVOhuwxk=;
	b=epGoOsEVDxYXpEfC99mz9mZYDu9gqe/FMlS27GPEImYm8gGERg1hXZ4TJeFTEeLfhaBe
	 x8qmhjolpZUyTNPxJXJOUG01JWXrSmMWrRkaT/wwhlcsfYtYhBfv2BRv9V5zd9g3COjwt
	 NDndUJZZ1/YHa6bFPEssJ0IACDRbHz6cOHrw2hEOzzrSLV9hdVlPZ6mRQQN74N2SR9a3e
	 XUdy8G4/j5b8w3G8sdeM46ZCo01s//h1mVsvbkCAi4wTILJeEavWP08AE0XFThG8Cp446
	 GATjDBiL+HQUnDuTrIAHUkWc2uq0gFn85lELWmkQsxoSIS9Asfj+8sU+DIGFj61Oc4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5nDBfVG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E30606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5nDBfVG
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad4072943dso642118fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:40:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794735628; cv=none;
        d=google.com; s=arc-20260327;
        b=qn78EWxfbVfj4IdsihyD3Q0daHqrt54/kW9S3eJL+m3t7HC3HEjT6BYdxv4j1r17EP
         TMGqaARG2Bpz10D2jFEtovTKB3Uj/dfIY4s1jPSiD3UJiUMlVWijj5creArIZEfCbYHW
         4e7LWdX4arkV71mWtgUB39c1BjozNVXUtxdZPgWZ1AX1IZh+uBSVX63QbDP7gb+h0Qit
         1JptIsvRMofnvYjUEpD3QVYRFE2sq0BGYN5k7tOzOe0uYCHnGo9GvwXE8t5m9hCVA4SS
         i+P2fajTro1qu7XpdDtyx6h31bM4NorW93xeIsVJrSDsS4dsAK9tAF/WusYga9Jf4Dfs
         zgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nK4+XntrB4g9UMluME3F97OBMFRl+N/3eQxGVOhuwxk=;
        fh=u0KInjpjOwuw3Wn1vkDhsxi5leh00ajF0lrld6i8zxQ=;
        b=pHz7HZuGtvSwhdGkUMxAw2IOolkxqqIbkBWATxqD5M1rMV5e2BxuGofylIKoUc+/Ph
         QGqCtppzi854UFxSYc1VVIFGsbxPfK/ViranatE/hdzdV7lpWVewi1n7laMMfLubRt+z
         lEFM1aTOrRypGit72X77/YTqNS8oW1Lu3Fd5lf4vJoU6pAr3gyiI+iynnsDfXLd+vBMD
         CnA0i8uocz/cDJYeSvDTkwSfgZ+ibDoGLgvF/palVOP2xX1wd0u0iPneklXrNXrAGHCc
         nZcEMoCC5gT6j4opaOS5A07x2Xbgiev7D9FAfXiAO6ony/HSHsdHYmFZ4seXE7uTLlQJ
         Qjgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735628; x=1795340428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nK4+XntrB4g9UMluME3F97OBMFRl+N/3eQxGVOhuwxk=;
        b=z5nDBfVGkE/LDFntn+7Eq27TMw/rb6yuffGmNWVyuOAwSLOmt7bTre51083w9k0NEa
         dpJsC87HsLaCmM24kOEmubv6fgbidpJ1hTN0LTC2fX1nxbBDPHrLUfe7dSbYvQsCWW+7
         T46ihT9L9j0KHcYgeEM+N3mEsQpdw8LyxvJKQhjT3IvP4mMEZd49iLl/srj70vcRK1L+
         ME4F4I9K/Ykm7aQeHMnVaqoQ9N06JS/hf/+9dXUgoVsQjrqY34bwBzhtrnlEGTU9aPTf
         1y/3uwBz0brpSYIXIwD4BAZlCZ14x91HMHZhC/G9JDrRl143VRXcQGJ0jDpwUxaOsTId
         yHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735628; x=1795340428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK4+XntrB4g9UMluME3F97OBMFRl+N/3eQxGVOhuwxk=;
        b=r95p0rHYXHmZeK5XqBDV+cck2W962HE3qI2GAKtprMe+Ke/FT0tmS97mJgx52+/gnj
         T6YcaC/qPxhqfhi/c3S7N2ORwvQMa1C6F7rd24MR4QUUpABVZZ4dpZ+LrfiQxCBTpDId
         j4d9BscmBr6mG7BB2tJVzTwyPZP7U5KsLjzCD2hREJN1vk+zxcxWTlEvrXZAwQpvNjat
         9jJHibCvaCV7wJKVqLIESeyFHzy2kOS/a6HIHWptw+FFsTyyfvWhcrQVs6CIvKZOL69z
         Y97jO3r3Ih2rpmP/yRkmA6N6G6kH/uR4FxSTmCr99fUnI4enS1y1cpuZ9Rc+eLtjzPLy
         o2yg==
X-Forwarded-Encrypted: i=1; AL+hErE4LDNUy9adeN/XzVDWk7G94Ia7eq4PP0XzeteD9n/M/4NO/LBbR8eTR1ssS3JU/9hBm3dP/l9lRZOjF1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EAVDjHSmBPPsxHKY5zmHf/9nc1kn5MrwI9e8r1yyDZwLoJcpJ
	SmpsLpzNo36oT/kCetQeeh4K+rhKgyvd16RLzz/kdTXj/bm3PE3SDzzEu1W6q/pdupC+rSXNgoc
	Y0IJOwysXwvT2XD60D0P45lEFdlKN4qWSAEL7
X-Gm-Gg: AYBFou022fai1ZDxRn3VphhrwFMHWNlGIABE1ugqf0wgfQx1SwilhEKq9nrjqoIDC75
	SscD+Vu5WxyiTsWfwKy2UKl+Oi/N11EVkmj/w2qQSkyRy6nDEUlpixQ1VzhM+bZILlVQUp60Iov
	cu8i5bEhzs4vPUWkZ0kyKpU4JLxx1TvHMPM1UWlxFXvp2f+ddB17Wee78Xieza4PRQBecDSvqdP
	dApJ4rR0LteY8DOMJA8e8dAXmmj2hRMDgeihkIHqsiC5nmZlKN0mpE3LFcyABFX8MtZL9xYRkvl
	5nuIF/gTgI1lSh1u9IFIZlAOxMwgbKQptvDo6J7wRA2j2wMm2j0a7awVX/woHdz/ZkvaIqh8rvD
	Cagk6eHH9hlke+yOJImYpqtRqlmbGkVY2jHKeMSSEdmNhigkxN8NTJjY5L/bJ/XUeJFfsmJVuu5
	jAoQsIRInCQyCDZ9PsyDlvaknPBCx3tDgcxsAt
X-Received: by 2002:a05:6870:2107:b0:4ad:9063:875c with SMTP id
 586e51a60fabf-4afdf088a40mr6658056fac.2.1794735628252; Sun, 15 Nov 2026
 01:40:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115003349683IFDCSTYhPzQtBozUiO8qN@zte.com.cn>
In-Reply-To: <20261115003349683IFDCSTYhPzQtBozUiO8qN@zte.com.cn>
From: Ming Lei <tom.leiming@gmail.com>
Date: Sun, 15 Nov 2026 03:40:17 -0600
X-Gm-Features: AclHuK9eC4Zpc1ALSmk_wwWzTYxdUwIRRE009JOi-jy2hde3HZ4BFkd_d0irHGY
Message-ID: <CACVXFVNCQ1KMiimy75WJs10GMV0cde9kfeAn0oNJfirNPaB1Kw@mail.gmail.com>
Subject: Re: [PATCH] ublk: validate all parameters for zoned devices
To: shao.mingyin@zte.com.cn
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:33=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> ublk_validate_params() returns as soon as zoned parameters are valid,
> skipping the subsequent DMA alignment, segment and integrity checks.
> SET_PARAMS therefore accepts combinations that it rejects for a
> non-zoned device, including integrity parameters without UBLK_F_INTEGRITY=
.
> Invalid parameters may reach disk creation or advertise an integrity
> format that the server cannot access.
>
> Continue checking the remaining parameter types after successful zoned
> validation. Preserve the zoned validator's errors and the requirement
> for zoned devices to supply zoned parameters.
>
> Fixes: e84025d2a9cb ("ublk: add DMA alignment limit")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
