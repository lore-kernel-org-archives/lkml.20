Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31737E2EB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021068; cv=none; b=M+M0/S8VxV+/7mhPT6bv4/1DUsl4/o3htIXL33+cI10aY4h05E6TOieAWzXLGzct9RK63ydZ/mB+EybYrvk764jCwoNphpW9T4NlkBX8bfSVop1k6A9rpuoQlBSU3vrjRyEuJN6H87S/LdfhCuwyVr0rab1E1aNiNxU0Y6IcelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021068; c=relaxed/simple;
	bh=2LbseY8Li50TR6rDmKPlbnzBHn4spOvnRLGc5EbwpoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0Z7aTto1b67rAwa/BfA/QzxpNMo/7zXVtGk5cmP0j3D5nvgvGIvzSATxLm9DV4NsEc0PCfoABfZ8fwgusjD4sS9MLs4FjHLKXjYdPwTyJ50rMOEcN9mn+Y0xOCiHEEyGkYS5MiMU+Rk/fSrD8/Qj3iL99Tyn4eUcTxtfwPvA3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAbgGjXt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAbgGjXt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48bbb06e746so108934f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021065; x=1791625865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rxF/3AxLSPoXIJFdNjU2f7u8Roc3pXcYGxMID4pJMyw=;
        b=pAbgGjXtYT9/PZNqw/lunpreIij23GmKcD5tfqC1NT77Cwrm1dZf98J03zT/1uifrO
         S30O9HJSN4aUISetucqueW1CQ5bhsnnHoUGuE5LWkNagCoLwpJmXzCeioHUj/KXRFPui
         poYzcXMJR1SwPyvdDeUKODdzIrBCRhxkE7THNmW4tsg7EKjzI9J3VGf5NrZNNBMaWmPw
         Dre6oi72Iol0pwipeB8kwZ41qtnmI6fTHCJhu3Tq98RSAUdF2uvBVvsRTsWbrf8NzeI8
         RX6ERo1n/7RRFv+ejrQ7zIiRkCAhLwz2JfvC2WcVhjR7MgCadBc+qNtcNJaSmCkumfyj
         EEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021065; x=1791625865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxF/3AxLSPoXIJFdNjU2f7u8Roc3pXcYGxMID4pJMyw=;
        b=ctxCca+lAWWmmEUA1GxrtOxIpPM5W/WqAzCoLErxJWWS+e03gLfyqa9Z+N6DmelnwM
         hoPW4D0ZIvZezvBBEXOjXAIkHDiO5mMBx1OHdACRLUQWdBcsuZTZPdgDAsyxDbgOs6YD
         uXSvx9WYoFXdW1VQGsh091wfdItCHl7DUr0BxsLJR64Kvyyr8MF3FD8kvQxMK59ZlU5T
         g2f1e6ZpGcJghXgfFNgjnrvvjMt6UJxtK7upzqlUf/diiCFdNlJlRhJSKQv+yKG9YyIk
         bUCAqMMXvb/M10JUpZtNRmVJX/+6fpsgrYI//fp8PME7+EynmdIeU/NJFdf31pFVgfwR
         7ebQ==
X-Forwarded-Encrypted: i=1; AKwUvBxueli/ZNZh7Dni58eu6GT1RMZz/MjoSY+DGKIQ1enN5Pu/Lac2RkwSL8BPSASJcKgTyayyYbXWKcAUdCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvcYifPYepOZH17/MMA1nYLrN9buCQkJuTxFqXRx59Qd1KZVtl
	e0QdMmp2oBMRwtE0UjyXzzpT3iGJxWE2F6WvPJjOVYXGPRf+QU9KAMbu
X-Gm-Gg: AYBFou1zWkO8t0Hz+aHb2k6u7uEi5MVJP0uq4WfN3bG5bsT53VX4967qwuiVVQU5uUN
	WRii19rsI8S+Ij0IJjoIw6gE3o0dM1Yk1DN/u2apoeAnIfe4Fi3bko/Sz0AznRyUFmRFAievboV
	CgW968aADhmI3TmSRS2YhztjhYWumIJVUDiqarOQKzI8q1zRKs71JgG/AedA0cCoEojSNdUWZ6S
	JcuANN1jakD2JCopZACz40/OKodbytsrpD4/19S1R3gYLIXRHrrgeSWOcadLjtpZjbi33ocmxyN
	YHFpvG6H/ZjmbWzbyvxCpYu+fJaSYjluMXBrLgR0Yam2hsG+HW04ScehR/nWX35lemzH394A31O
	qnkkQG9HA81m3lUVGMl/Szx+KrCm6huyNqCqEFsDzrf8yKuZ/uC2LiKs0Cia+l9HPFMOiGjjotV
	a/eJqu5lnf19O8Fhdl33GZhC0O6pYv841qMu773ui3b7HnOXDiz3EiXILRcHYTMl2lhgdoZSUZh
	zW/D0kQBnmxcsQtEmi9vDCG843q2A7nj0nQ8mFO7e0/wRe6V4K6N9XOpTslQlXK6PT4S+mrVDll
	RU2sanAQz9AxXnHSkBkllqemku/gm11bBWR48Ff61mzXiT5dztX7bGpwrNM5oZ1oIucp+da6k6F
	e6r5E+g==
X-Received: by 2002:a5d:6f01:0:b0:487:40d:af29 with SMTP id ffacd0b85a97d-48c47ff2919mr2908911f8f.36.1791021064393;
        Sat, 03 Oct 2026 02:51:04 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fada5sm10811991f8f.24.2026.10.03.02.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:51:04 -0700 (PDT)
Date: Sat, 3 Oct 2026 11:51:03 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sh: sh7785lcr: register the PCA9564 as I2C bus 0
Message-ID: <asDOl5bvtlbauh9x@gmail.com>
References: <20261003082833.21511-1-kmehltretter@gmail.com>
 <a4dcd9e615dc4e3c98c00e75cdd0c7fdeef02254.camel@physik.fu-berlin.de>
 <e3c88969f18c493859f7c382db7ed2afeb15b4fa.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c88969f18c493859f7c382db7ed2afeb15b4fa.camel@physik.fu-berlin.de>

On Sat, Oct 03, 2026 at 11:38:43AM +0100, John Paul Adrian Glaubitz wrote:
> > Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> I have to admit though I don't fully understand the description of this
> patch. Either I don't have enough coffee or it's not precise enough.
> 

Thanks for testing and reviewing! I agree the changelog doesn't explain
why -1 is wrong and 0 is right for this board very clearly. I'll give it
a day or so to step back and submit a v2 with your tags and a better
changelog.

Karl
