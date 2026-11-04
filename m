Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.192
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817524;
	b=y1ZgYOFpJoqBlPUJvRqtWu47A11hSfmqwKem4fnmP0El7Q063pOpgqv3FpQYeJ/aRAb+
	 mkMHaZf43O3vTIliJKBj0RDQGJSGwihVvwdJ65LSBKypn6Skg9ur5NNcZx1Y3k4nY4+w9
	 yKcuiThd/3/2du/TZTdGgAuTI0DKtYkAIYlPPzfD2MX9GBq3yAdCwoz/BuHcfoceQzQ1F
	 8pw0bQsIxwGsgTjSAFkpxN9nbqNeDbGT5x/cO4gctQy5+DO1VCZbVGO1iU26s3xDFNdt9
	 WQHakgzTi+423D2htshbCsr1eCk/hiZY9h0pOLxGuY1dN4wbrSnsj+gwGTpQnOypHnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xi2CTq0sctSpk2rBheKo6Pp4BrAIpJ2VTsphU+x+0aE=;
	b=GxZXZxNlwXVf04ogq9aVW4ocnaYEuM9qU8ExdlvEsYpRM9D5fPkXMLSGduGsJ4JlwCrr
	 KHAJcSZstt/f+Y2lMXmpIc4kfAbBAn39rIWY6TJ6gLvADKZOQac0oFjCRnRwDbRdyzKyV
	 xVRrl+kL0KowzZNkpJOZ5v/+PFnAy0PfKOvoIAOsTYbxx8oM5X1HJKu14w5eK2vlwyzB8
	 /83pH2tp7hMgL8rPgox23HFwyuUuqQO5f7RAg4t3emUpk6NCI3zRpj/SVcEO85b0RwsqL
	 Mzte0sQUpHcQGI1M72CQsO8JmOh9Xn0+AkVXEg3LetITsZ2slZpihVodPisS0qn7ulQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml7tXF+s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.192
Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BAE606EE80
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BAE606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml7tXF+s
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-533fe730856so454492b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817523; cv=none;
        d=google.com; s=arc-20260327;
        b=Ed/JCBpmrgxTbA22W8C7czLHcf6pUnQYqEomA9Lolpcw4VbbzdGLtFy92bzktPhwiu
         l+oL0uJWnBpGuXdPRssbIBozTuyOuk24cnPvJIzss/lnn6cNP4By3WHL/ozJeZ02KSNt
         i+hAMYAN5OwiDj609AiIIQk6wNx5cXBOO2ZWSy4TGoBrE+IbmiNSPYD/vYXdbQI2qSmr
         0N+oBLpP9SbN50+fh2T6k1ByPRAD9PUfgmu1dDJNPpIep5NWieXxoLugRjNjQmfbccPc
         S3UdjcB81gXXPDhKuCsspQ0TASYVh5Ik5CN3iFcdXGjJzXxMe3oVgV7X8+ofVEr2cUyu
         QbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xi2CTq0sctSpk2rBheKo6Pp4BrAIpJ2VTsphU+x+0aE=;
        fh=my0r8/wldtSNNSrP/8qUSQ8SzUf4xG5U0ZBhOQiKd2I=;
        b=R56OjGtVA4s5Edn8EI+H3OnKI+VRIJH9sR/ERzP/DQinIUG9FG6YTZqDD0mKm6Aghx
         RNMzGqv8hpb/KAQi43VkL/gkzE4K51ZDZUwB9xXdVCfqyG/S6jIMa0/xpU1/SUdFSHTY
         ppO8RvyGH2Z7nBxsYMHFVC4sXUQCufjvifMa464wfIZBTKLMNKq1pkpDpFS73wR607ax
         q53ui8PL7h4ep2Dl7noFyalvjEIHtiiCvSaHIbxy8Io15lo7CDgUqENtInYBvAPqN4Sl
         SuZBrow7lvhxlbIJnmqjenb19xcUBYdzf5moyQ/dAYfOB4QPo38n37sfTVuOuVjpxeAe
         3EuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817523; x=1794422323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xi2CTq0sctSpk2rBheKo6Pp4BrAIpJ2VTsphU+x+0aE=;
        b=Ml7tXF+sVZvkpHkBr8/idNrFKfyY8PoYXpBJtAvho4ovbfG5zcGskW8/ivtnErEmZe
         NkBxWzblx8wNCyDPxt5bwvZNz0Ix0TeSzUiejal58hT/OCM0hTnBVHmyZjcRMYPmNmho
         zTL/Rv8Mh5U89IFQXczgPMALZMMUr6ldEXR2xtQqOAgydoaNpvagj3Qxr5s1pyPfYgNX
         DMrdh+xY5CDGQIkrgBb6bMsNunx3wZBuAobc7xPuzMDPob2V6QSE866W6c6l7PPx4YOM
         HCDDxzXAzWhgiwUXwpr6jeSVeyxGZohqp6bnZ7dLS/MHAq2jA92b6iDFM6DfoWjo0cOx
         MH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817523; x=1794422323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xi2CTq0sctSpk2rBheKo6Pp4BrAIpJ2VTsphU+x+0aE=;
        b=azBEfeDPlkSFLniNcHYZjQITXUv4/HJ7pVC6f2uDRFQodR6tAPXPy6dcEYoUruYhBQ
         BhAgcqZBVk9e5V9jaa3wYauCYy5QWAQnfoVAdDi6ErZEZ5eV55NVCzzYEW5iJUNW2GEc
         W7TQFuWJL0RbOqcWFdv4WnXjvF9PDYhl1J8MvuOAhQYN6tya57zr+YwgK/c9Y5vUFULu
         DFMEkjyTsdAuwiYZWxBOLz4clRc+pyxsfY6RPZ0Mr/gFLiMx8ujQSOOmIVC1JfGOaxqb
         XG+zFNRUeToaCMTiaGwW44ZL3ON6k7NIOUngGkFNOj1ysqnQkmVT0n+0kMaRGzS/yymR
         OGug==
X-Forwarded-Encrypted: i=1; AKwUvBwDNeX63r7hbRlbNs17JI4Wbb/yl4GnMJEj6/un7pZeu6AVmZdZ3XQyLaljXNarXcqVf5COYfl6T7xZMCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lEBtlyj+yze+e84Tl04XgTW/FPZgIrRDDfYwotEIjUU84ieaW
	2VkwZL1Mg+Hxxc671DaRejGojcZEp3MxH7xQ6/nnJGOpJBbfi0XfFBcjJpGdUaInwdKUnxZ1trg
	B1Ti2XEWYK6Ku/lrvXnjwTZjJiFHFSt4=
X-Gm-Gg: AYBFou1pzI5kEbeRz7VQCf8m0qUie246hsTaQAMPM8DPhJpApTN43RnEgr7OmFeWsjx
	liB4ZecQPZujpi4pYPZSwZthckwxleRZp6C+a5xlCZTVgEgsKjXm4LQnx4aZLP4Xs3aJQbbuoU3
	exllO6rjHvGV2ZZmPPLl0Fce6hWXl5U41U/n1tXr0ePg31XkYtEcB7Ml/K1wFu+EukRDCD6mORo
	iuqgOZNWrLigW4+cr3TgXY4QQtBpLlEqZj/95bujbJvA2aWCY0tbhK/PTSkB0gvC/xJwl3T0PnZ
	LoBzILsP465hMRlqJS/xj8JQ6MEFNewZb0l0SbpY5Ghw1Zy+Q7cd70kR/+V40A/HTOgD0jP0Sr+
	8xCa1NJrRWXdiF3wgqTkIc2wE4Bf3G5D5cpROZW7Ex451/UZZx51qjbbJk5/+d+JVFLc0945N7H
	wet4lBP68KCsSQmUdHS9KuJuWc0KxWLH+8Wjbcl+f4XY3pkO0DqLf0
X-Received: by 2002:a05:6808:1209:b0:4d5:295c:a82f with SMTP id
 5614622812f47-5640df1c57dmr11547296b6e.60.1793817523087; Wed, 04 Nov 2026
 10:38:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029013616.97194-1-dennylin0707@gmail.com> <jnqgrofg5eh4rvmpqr3wrhyimlux2cwtguj2o5d3tjzdaqq6nc@xsxxjpzmpomu>
In-Reply-To: <jnqgrofg5eh4rvmpqr3wrhyimlux2cwtguj2o5d3tjzdaqq6nc@xsxxjpzmpomu>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 4 Nov 2026 10:38:32 -0800
X-Gm-Features: AclHuK-r_3WJ0ntTj1FvPXP3r8tt_m6iclxJZOkDMnSvHN7BvKNtxEkMKUL6peE
Message-ID: <CAGEkeHeBgeDM5_+ncjKspqEOw0CnVBsb5GJYdbQ+rUJ-W3ht8g@mail.gmail.com>
Subject: Re: [PATCH] ext2: preserve IOMAP_F_DIRTY for extending direct writes
To: Jan Kara <jack@suse.cz>
Cc: jack@suse.com, ritesh.list@gmail.com, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2026 at 4:44 AM Jan Kara <jack@suse.cz> wrote:
> Thanks for the fix. I've just move the setting of the IOMAP_F_DIRTY bit
> instead of moving the initialization. Functionally this is equivalent and
> the iomap modification is better localized that way (the resulting patch is
> attached).

Thanks for the adjustment! That looks good to me.

Hungyu
