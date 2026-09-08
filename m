Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB95293FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885386; cv=none; b=cOxOrnXx/NBQWPkoBATMm/E7Pr3JSTjdZkHmEn8N2qrKmSzCX58rIcwo7+A6NG5Pv4z3HeAGrAM5TxL1dY7zQLqLUt60GXT4wPt2iOBiXV18gzAbY1OwtZv0S0FX6uk+M2dXFV4HDQtPDCxR5V+2aX7BnNBwQkTevXTv0F2LXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885386; c=relaxed/simple;
	bh=lecO3ttVgRT8QyyaiDOzI3/QgRH4/dihpQ/rnO1jfaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BO55Ubn7d2DS/mR37/hSDUBSElHDgxgBWOc69Z42p4Zf4y258JShkmhHfJJGn7RyoGZFTyRz/5C+cdYsgrT7kj/7ZcitpXZh+zGwfu1G75gxn+EAhqVaWDb0gxK7oX2AKwCCK4lAJ+RZLG0+fuHPQYDONpH4BPloGBUJtCqlZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er2Ntb9a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er2Ntb9a"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso71949345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885382; x=1789490182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/EansYsnai8F81StzziY3cP4ZOtzfOu0U6ChvK15jxw=;
        b=er2Ntb9ae8iLiMg72UuUEzUCtuyD9MIuaADma091ODZogrHLUXlgLgtb7BSbQ3sXvW
         K2KoYI5KIIhH0npatxPYgbSPcUyWPogBl4Yg8+EP/35Rqg6X+IiGq8WXYLnCL7ecHvM3
         onz8sPk176BTD6LEMTKZ1YuQofmxeyv5oZMhsjqYhsNUOGs1gyxl/Yp9vcwupLKWWeU/
         4v1KAoYDQapvbhkiFBJlPuk/sXquAzPs40yUJkQl12PLHBbpUzeAjhbjk/D4Jru2FX4E
         yjs7E6MH+CWVpRaSdnVnhb5vcUu8odkMPBqKq5GE9Q9mdzyacRtS2hrRJv4yeSh/HB+/
         6UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885382; x=1789490182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EansYsnai8F81StzziY3cP4ZOtzfOu0U6ChvK15jxw=;
        b=oOvKIusnX20mjj7bs+40p+BPVATHFbAOtlB0LyV7EUgJFlnR84PEQWIN8x6W0pMgOx
         kVzkF01+wa7YEA+VtNYSIJmzMg/66j7LXNm2CviFJQN10GNl3Gpx5ULg8vHTdAYxyCKl
         fCwb1BINjhC7ATOxJNXSDar5jn0XbiX9XJBvU0cbLuZAui4Qq6aF9VNMqWr2f/sGKYMc
         9xX/10vLN+aTOzbDxZ6mDEMLk0A9MiA0ziir6X2DdaPEgOa2ab7dd0Y8TZBIB48ZRVDO
         hkRZlanPELGwE7IV1D9eDHagnaMY5hPEzrho0ktPAv5dUKiEqKDU1+lnM5/xSAfhYpfr
         FgWA==
X-Forwarded-Encrypted: i=1; AKwUvBwT1EuL2ex5qWB3b4qWRtUWHn7qTynOFuom4D5CSpTvmvlFD9CWBHMehYdFBL/xxdrCH2rSXmAbR/bROJw=@vger.kernel.org
X-Gm-Message-State: AFuF++kYWCFaHG2EA0SsO1ZgKweFhs1CFrJYSL/PfATdB7i6jIua1Gby
	O4sHM/2IfGcEZ9XwO6O1Ku0pJaoWFTpbN0WEv9Wpol2fopgqoT7iqjg=
X-Gm-Gg: AYBFou3fug3h0ah3ka4YVkq2dIek0ZtN0+/4kI/QAJd0XyyPdPgSbwv9S/xafmjiBrd
	Dc0386NkqueEhIzIicHtw09klGez9kvgVR8bZvyj53GoCfcRxpKbFxtMyXNpiPq3RlNxBVoxUFz
	4TZDEaH2xY0GUAmkr0ivKLKMFM073bR0Qfodv7/RL5P6rwlt5/C+UOw6wNqYbgq2u0kwB4StH4n
	StECwz6y8OIsBhq6h3CGVMWOEYlrETQA8cEutLUg6O5Xfy6n8ip7Dhxh/3ifcYk9w0cSzxL3df5
	TVRrV+y77TlDDR3sCEeFqAzzC1VFqJAPjFXol+W5tMFPvNGjZokZKUjL7dMHTjOJgHGyRRi0BbU
	t9mo9XsqQxcA5T5dGV8pootHEQD19MFukp5QivstZJCvNuw6PkpM6PgSd2kGLy0qvpeLQGaDw43
	5nOhWYHuYATTuznNg05su1d0SB2Wgb9Ng0+Z5jPspr4ohpvaTC
X-Received: by 2002:a05:600c:3f06:b0:49d:1cc3:fa9a with SMTP id 5b1f17b1804b1-49d1cc3fde0mr39898535e9.14.1788885381519;
        Tue, 08 Sep 2026 09:36:21 -0700 (PDT)
Received: from p183 ([178.172.147.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm545494045e9.5.2026.09.08.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:36:20 -0700 (PDT)
Date: Tue, 8 Sep 2026 19:40:27 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Paul Dolan <paul.dolan.dev@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] selftests/proc: avoid exit() from SIGALRM handler
Message-ID: <a07fc37b-11e3-48a4-a89c-4b59e867e961@p183>
References: <20260904123752.157562-1-paul.dolan.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904123752.157562-1-paul.dolan.dev@gmail.com>

On Fri, Sep 04, 2026 at 01:37:52PM +0100, Paul Dolan wrote:
> proc-tid0 uses SIGALRM to stop the test after one second, but the
> signal handler calls exit(), which is not async-signal-safe.
> 
> Set a sig_atomic_t flag from the handler instead and let the main loop
> terminate normally. This also preserves the existing atexit cleanup
> that kills the worker child.
> 
> Fixes: 0658a0961b0a ("procfs: do not list TID 0 in /proc/<pid>/task")
> Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>

Yeah, yeah.

Reviewed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

>  static void sigalrm(int _)
>  {
> -	exit(0);
> +	alarmed = 1;
>  }
