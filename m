Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833850EC01
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778267; cv=none; b=Yci01JmJpxBtgpj7dN6EQnP3eE3xUStGA2zRMsRquttjsGcN1CUxXigtgS/9+iEaigaeeuAJEqQiDNFlZ3/is0uK7ddgjq9sUGGjz4jb0n8mC+SIbMWwTlWL3gys3VR4KiKs2TWUVINUrwm4FeelXdE4VK3/RjuZiJ2zVnAXOJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778267; c=relaxed/simple;
	bh=IYJIMNtdJcCr4u6cOiHPBOmN0vaj7VFV7Qc18iDIhTc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sYMVpAdvdiYVe4wWsazBwT4n+LRorE/cS8kMuY6yeBCQrBmDqlK+2J+1BbRH8Qi4hRKZWu+FPnjtjGfogmqwiw1dR5xnidIrupgwu5eOUxMuKRYOtojxQ428sDBdbemu+S0DP1kURa6yn3Gr8yNhF2F2TWNUffbCr4a7OCC2X/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gctlW0aB; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gctlW0aB"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-6768036283dso654577d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790778253; x=1791383053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSBcqx9koa8CG47lz1u32c2OePWRmcPOrAz/9TDxhs4=;
        b=gctlW0aBm4DLTLgSxnEHcWgiUl429uuP6GkZ1zsXBUrorWGOk3IvMZLNoWLUCTmPe5
         EHoxCT7Gri9p/hMd2O2WXit4LgM3E+bUJ3JiYNvuuZFKqG7DK6FwGLDP7kYhfGt85E4k
         R7Fifqx9zWevLeyGv63jc6PR399/An8qleoVSrkdWAbaLwvsGjkiQaJG7i8V11GCzBED
         9+LYHmDQEa3gbrg7mOohtHu+GgvzP1h6flB/0DTxyi4lVT9Ya0EETjTac7XbE7wjf/QV
         zWds7vuSOafFahbeolJxAJMChIvxkMayHd8RJ2l6X7YyGY8p9WArV03uZy648Kr73aev
         jiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778253; x=1791383053;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSBcqx9koa8CG47lz1u32c2OePWRmcPOrAz/9TDxhs4=;
        b=KPjJjX6L35D8wNhzsuBYWPd0spPH8qsj2WF8wwjZcchRGMY56t8prMPeLWeHjDelpw
         t0Byshpav1bCSH2x/uoWeHT3x5xoMxzwVT3jJa6rCJlgVMlB6hDn/EIz71TiFalTn5/s
         5gRGfyzx2YFp1aNAeUGq0yxZO8z0KUr105Cz3BZPfx5NDvmhFce8dYd83f/NLRv5v7n/
         7I0G9i76NdP1MHXrdFICAwRQSVR1iedpUqMdSuJasNZQN41TkpGePHveGxYtgxHDXHxM
         x99kTG7zlwcax0i6cPv7Gy951oO9rUn9gkp6a/TltIVa8yfA1XWfy5dJtw3jnyrNTp2H
         cNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRChGx93XJ4AzUmpQRg5ijW/d1z3Yqaq1+cgyYzFdQPX3bLOJ+4VZWJz66J+8NLp+AH4Wc7x2nMD8YPJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXcmHIZTRY0HOuxfjey9SYAb+2DBbsnYnz964wIk79LdRqkDPW
	3+IuUq1ZQK2JydKSPkELaeE+zFDCZzYC5dHMiIjCCaFlCfCcZSMgGjSX
X-Gm-Gg: AYBFou0BEg1N9oqKB6Kh4N47a7QJc/IW6idD5lr/ma5MyeXLxHtcLKRlS+1KIrm1WbE
	vWXM9xH2I4tcnz16HMIXgLq1i7cIl8YZ1On+xcK2mZ180Kw7i3fOp2bqrOpjYvpdtRThCSC+LAG
	tI3Anqot/AiFGc+uPN4dCaPVbsHAGf32hvB5dIMTp0/NJRDy+e4q9Mv2GJg2ecUqbyC8jnfaR51
	yHdD1gaAh28Vbz2srAh2SPRa1VrkOCibmI9Xn6eUcdVLvXAbGVB+QwE36wmIVSfarCMRuk8L8jC
	eTCDEqAkdDYKZMyXVot5PIGHDSk5WvZn0LhvA+QHyCaH/lXFv9zBoNTvLLReg0oSe0M2vf0sPvS
	NQfCpOMFWaYtn2cDURE0JfCqH9tFQfJQO6iXLGHe0q/4JqhRrBOFY6vSb5bE7JZHqDhQ/QM/Tg7
	7um8g7yFwsDG/ZoAkHYQ46rnMR9Ikk9UmWcWeSVPUVhuS4Tq4e2zT+5v89aMLC4R/dyv4Ijnifj
	ZMSDeUdjHosFHgIfNmob9yW6FJ1fx0l9WlHQwLlRbjYT93VLcTn
X-Received: by 2002:a53:d014:0:b0:66f:c1bc:880c with SMTP id 956f58d0204a3-6768349e783mr477179d50.101.1790778253013;
        Wed, 30 Sep 2026 07:24:13 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6768152d0a8sm719338d50.14.2026.09.30.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:24:12 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:24:11 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: lollipopkit <a@lolli.tech>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 io-uring@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Message-ID: <willemdebruijn.kernel.276ffa719c8ac@gmail.com>
In-Reply-To: <20260929153426.90278d054c98-a@lolli.tech>
References: <20260929045433.59435-1-a@lolli.tech>
 <willemdebruijn.kernel.570e0a646f4@gmail.com>
 <20260929153426.90278d054c98-a@lolli.tech>
Subject: Re: [PATCH] io_uring/cmd_net: drop unextractable TX_TIMESTAMP skbs
 instead of requeueing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

lollipopkit wrote:
> On Tue, 29 Sep 2026 11:06:26 -0400, Willem de Bruijn wrote:
> > lollipopkit wrote:
> >> Assisted-by: Claude:claude-opus-5-5
> >> Signed-off-by: lollipopkit <a@lolli.tech>
> >
> > Is this a real name?
> >
> > https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> >
> > "a known identity (sorry, no anonymous contributions.)"
> 
> It is not my legal name. It is the handle I have used publicly for
> years, including on GitHub (https://github.com/lollipopkit), and it is
> the identity I sign all my kernel work with. My understanding is that
> this is what d4563201f33a ("Documentation: simplify and clarify DCO
> contribution example language") intended by "known identity".
> The earlier CQ-full fix (3a3d93070c5e) went in under the same name.
> 
> If that is not sufficient for this tree, let me know what you need.

The commit you mention did remove the explicit reference to pseudonyms.

I don't know whether a github handle counts as "something we could check
back with" or where exactly the line gets drawn.

If anything, this does seem an outlier compared to other sign offs.
