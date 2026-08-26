Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D6247D93A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781513; cv=none; b=KA1AV0X+fHxQlmLIY7rfif44PaK2A3qOWq25q1nnvmC1jIxv+vaovveea6U27XzAFyLStw5bhobyvl4YO4fuRpGQMrrTTkkJ1metyV8PqQ9rAsLn1OTRzh62C4U5S3BdsHWlNaI7ZKtNSwIIuleY1bIb5kEuXfYXk7G+v//Wmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781513; c=relaxed/simple;
	bh=s7vJsB8p4ex7LHEOlDRqznCRHidLUdiJOoJPTz/qS6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjKXhjVx8vigkACpNewWcgyGEQf7e/2+77IAkCcoxVKeBA9jw4Sq4YEKDo7pQ6JrTU8Y2J2QesXxSCvLdFMukNO0RTDSM1Qri6umJceo7VylMNZim4Pa6NUDLA8UCoYYK9Zdms0krm7VIkpD3ZPo1Q7DptwKiX1CnEx6ZQXagNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fVcTXNW2; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fVcTXNW2"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-934944f2d22so84104085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787781510; x=1788386310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jG2VK8J2UsrKsgRFCrwZAYzLNxJ4QRVgAReN+n24iAs=;
        b=fVcTXNW2I1m++poFekaMNjcBSgR2I/chpJR7DHNZmW1c8tFr4bEDY2mB282zjVet/8
         Pnc/7nSfouQcFiG4rNPa6DLPhMPiSL5SFPbfj6EbtLsB9ixu6Uo3iP2z1EYHZDyML8V6
         nE4dlIj9JpIQEt+/oPQfivBEXn8vud6fQAVAriovZdugRs9YYpbl07buu/U6qByxHEGQ
         DRRt63tZeRwQqO403a+xCQWB31Bu9lHhbkKU1+nOQ+Nh3ahNWoQlbLDknm8/Oyb5cKaP
         A2S5PjEy9aJzYoaCh+w8ycLrFnSdpLlDM3nFk0rU2ua7GFB7+6A3g/AcKsBIvAM8vD5Q
         f4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781510; x=1788386310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jG2VK8J2UsrKsgRFCrwZAYzLNxJ4QRVgAReN+n24iAs=;
        b=RhaRuKw+OAaSS4xLcC9cxCDoRCye/5TUxG1Sfk5ArKp+Ix8tuITDp3JXzJjSaghJJJ
         QBdUERAh4b2EmtkaCjfHeGTGDTsOjjNPdaxYvIeoKhb1Hlwe0GWM4UaCQX8asNQGbCZl
         opqfxpeDg//Vb4wEt/1p1PLb1r6F+n+mVr3fWKpDtG7ONrOfQylfBZH3OSsJevCbn8zT
         x2jvw7oSDWIRRu3toS6JhFHpUYDwHoKDPVdo2Z7CNQBgWXu7iuDczCG9P5neSR3B7W9k
         DN2PIVqZ+SgTl7HICKAwJ82rxnb38moQ/oJS5+qmZvMUavnoFqlwDus5GaPmZEcS6crL
         9Jlw==
X-Forwarded-Encrypted: i=1; AHgh+RpWOGR1RqobhQkbQQ1hWjR8MLqLNSCipcoje9hOh2CCjdXeEiETyF0+xzSuCO+U+2yJTiEx+63aWY42v94=@vger.kernel.org
X-Gm-Message-State: AFuF++kDNAlS1vi0teRiiQ2LoG1gKjaAE+cB5vE1G+yH1bZduHHlJxKC
	wC+o3QIkR+/xqwuU4tVHzFDokuhQ6rtgqNQkwWFge/g0yR8Ln295MeuznoHA3kM8nwc=
X-Gm-Gg: AR+sD13GXAgxHMs3Dc1BGB64LOQBE8+X8s0HMmbpuwT9J2BJCaH1l4CtZwut9i5CsrH
	P7F7hDtZMoHfiSmqf5JfaXYtSOJi119kHOmYv8JKBLicFQohpYuOQenBUNw38VfEbr3r+ZLjSZc
	Af79GpoRqUZfbbw9CztvTVKzURYZEzVpFA7UWKzVOrJvVhkgXD6SraV0TYjPOFoZdU1PM62LiYK
	ZKaf9vM2MPOFmo/xrLaj8y3OinbqhfNKul/q14X5MVY/eCppLHwZLCjb52agU9YIj9AFj0ushqR
	DCdHBnCXmKK+vhY47P9FuNuwPuUj4mth5VPYvFNJN/fMCRMLa/Exd0lCcuiIbLwBX9QZH7a5AMD
	DXrx+J1y8IxUETkOlUVCH3hj2AmuGcvrc65ay8wbwQ/QtM/Bsp9V/85bKaSZckNMvuCC0sVCFec
	gxIuxeNc4FmDFGyIC8Vxm6Z7P5ZA8+Fis0Ftbl9Hks+IuIfES1QjImzktGJjdUj2zv9qAaEUaEw
	IWDJHJioSyQip78IhSRA6Cv1VAYPOmghPIJlkUF3FZa
X-Received: by 2002:a05:620a:142:b0:938:fd60:4f9 with SMTP id af79cd13be357-938fd600d20mr393765785a.27.1787781510374;
        Wed, 26 Aug 2026 14:58:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd73e3261sm701776d6.32.2026.08.26.14.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 14:58:30 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:58:28 -0400
From: Gregory Price <gourry@gourry.net>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Rama Krishna Katta <ramakrishna.katta@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Gregory Price <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/ptrace: Skip get_set_sud if SUD is
 unsupported
Message-ID: <ao9hHvfw1bGVYDAS@gourry-fedora-PF4VCD3F>
References: <cover.1786965107.git.christian.loehle@arm.com>
 <1f16bf30aebbbf44ffc598359e0d474887162e7e.1786965107.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f16bf30aebbbf44ffc598359e0d474887162e7e.1786965107.git.christian.loehle@arm.com>

On Mon, Aug 17, 2026 at 12:16:09PM +0100, Christian Loehle wrote:
> Syscall User Dispatch is unavailable on architectures without generic
> syscall entry. Such architectures return -EINVAL for otherwise valid SUD
> ptrace requests.
> 
> The test currently treats this as a failure even though the feature is
> not supported. Probe SUD with a valid disabled configuration before
> creating the tracee and skip the test when the kernel returns EINVAL.
> Other errors remain test failures, and kernels that support SUD continue
> to exercise the ptrace GET/SET requests.
> 
> Fixes: 8c8fa605f7b8 ("selftest, ptrace: Add selftest for syscall user dispatch config api")
> Reported-by: Rama Krishna Katta <ramakrishna.katta@arm.com>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  tools/testing/selftests/ptrace/get_set_sud.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/ptrace/get_set_sud.c b/tools/testing/selftests/ptrace/get_set_sud.c
> index 2e619c7599bb..395674f85964 100644
> --- a/tools/testing/selftests/ptrace/get_set_sud.c
> +++ b/tools/testing/selftests/ptrace/get_set_sud.c
> @@ -22,6 +22,14 @@ TEST(get_set_sud)
>  	int ret = 0;
>  	int status;
>  
> +	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_OFF,
> +		    0UL, 0UL, 0UL);
> +	if (ret == -1 && errno == EINVAL)
> +		SKIP(return, "Syscall User Dispatch is not supported");
> +	ASSERT_EQ(0, ret) {
> +		TH_LOG("PR_SET_SYSCALL_USER_DISPATCH: %m");
> +	}
> +
>  	child = fork();
>  	ASSERT_GE(child, 0);
>  	if (child == 0) {
> -- 
> 2.34.1
> 
