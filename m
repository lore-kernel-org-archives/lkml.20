Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E68B3B6BFD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469987; cv=none; b=kbw8a4ipWiWTJ7Bly98w396DxWm2AEwkzkOAHhWIRnuxvPju0GS2RgxdkG6dXUmSgyIYW8MG87xptYN/Ljmstg1ByK4oSLwmnfDm3UI8KH8mbluaszYItKwvEMg3rAVaaIoA/8IMGFmZzm4xHc8nKOyN8YMSH1Wqweky+u2vii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469987; c=relaxed/simple;
	bh=/SXNaYAzOtG1exBAfYMsRpUkcMovgrlxcT5oK0UNJoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwNLVLYm14K+PevpXGz6R6OlKYYcEdD9teFMufKPwfFvKRa3JBWXnjDJa9w3M88W5RCnUm1BrtSoaXeaqMWm6UwykZk0rRHZMX5z6sh++sT+66MnreeluXaovvsPAAP9xo5alb1Y/Lwt5SN3MWblEm1KUO32GSC96EsNapFsTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H30SvNco; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H30SvNco"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84830c774a0so304677b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788469986; x=1789074786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/mj3IVRmoCFRi1EC9+dVyk39SNMUGyb4URbFkvdpey0=;
        b=H30SvNcoJr0RF6gresCkpTwoVVzuNC0pjaGGpreHTSKfprQVVizSNpBk7PIJPoyGBr
         y3ER69pQ4v1MFrHU3rL3JcMni/gf0wGTkGc8yQR9PlMvAWPg3voccltIbSSdrFBl0jqV
         +ocsF0mphFV2DpehV1Cnvx7lNUHHfFmntxNrTUbKtnbWuGeXq/sJR8QEGIHcovlLh9Gz
         GXMymmZo8C/RBUln+VbkpQszrTrTphj+5jD8gV2noZLFBymR1gu79WBMbiElzH1AuPTQ
         EtisAgESzDsz1Uhs9Ahu6A+6XoGR6rwALRphtoqzuhCaK81fQwR+WEVnUUkygDJlbIbF
         zSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469986; x=1789074786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mj3IVRmoCFRi1EC9+dVyk39SNMUGyb4URbFkvdpey0=;
        b=VbdLC2Sd+bZUHHENFmoMvaBOqvQ1pk7sxIpJRaFuBHHGLTMps4Xkdp1ecVZ9cXHnAK
         6JbF2vJMDXC64UXziQW7KEgtYOizqIWQZe0OoTOvcNOxYiugVhJl4wrLQpRdug/daeYe
         PS+ByBbHC9yxBz5EOewMy7OeltP9qOW79xDWQhhQS0+gN0yNo8wanR3z+crebjz0fP6S
         3lOzfi6Gx0RsTTZftYCW5PEtENYhHhS1PJnohIuHWqLgTmr8uQJ/wlS4GCgilLLQJK8E
         2GyRboOaz20Hc2spbNE4rya+ewuULP0YO+Cq7rBqigx6hH4PtT5DQTgMzNRft6PYB52X
         YV9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWIgtmDv1dYvbuTa4jXCtmng1RfUFmZRp5PSWP4tRyc0f1aGumdyu3L0wohYyRTvc0eS9yWoBYIuqdFDs=@vger.kernel.org
X-Gm-Message-State: AFuF++nvVIhehytzbq5SaXbyjN/+e1yNoq2I9VkDDqHPabhUNVf81LIc
	P2wBRfnIsC5TdmDV1lu5KXYAgWrhsRJmPCyt5S7YehLJbjrTmpzQtrkz
X-Gm-Gg: AYBFou2ZpZoTeX1yUhgqVFXFhTEANPB45KHqYb2z/NWlLyPLR2sn9CLbnZhhdcBm3sT
	jp/0fnweUoXTQWVwz9FXmNQi+HN+mfQOrXvPIxoGRGeJy3UkujxLa3elm7Xnj0MmciIuPL3l1Fx
	zb+fbATq3SVkRUOSMgbal6g96bWdUNg31wo9pzRcRvA+VFpPUDIvUUFfpHbWRCk7zERMr4GDGob
	7ZLqkLQkOIF11irPXtYVxweGEY9WoYFCCUgH51DWRo7PNLq2d/hnEknkoIPNyxF9F5rg0i1VJtz
	a31r8q/FQ4SbTHIzHDFSK/gWx+HtXJIZ+zTYkfDGkCJW2XCsXDTCmniuyAP5J4RIz4uYf2IIu+P
	pOmf3Ld3uQLOS4nHELjxQaONL5uBDFdNTXl95L2xoQRHTJhrb0GitOBJkZ7BgGgDXuTpaqMedhs
	FEKyjBW182ZmrL1sMgc8QTP5oOAdP+xb6jMCr1sKFH9QUCdYMRwB96iemNkQKjYXqZVxVKYCOZ7
	Sl7sIHfSRewSy2sMAiPCFaGJhMyuejfJN/GirS5Zid6xp22Dcg7Xk8=
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr1956509a91.25.1788469985477;
        Thu, 03 Sep 2026 14:13:05 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae633be61sm3479083a91.1.2026.09.03.14.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:13:04 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:13:02 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>,
	Frank Hofmann <hofmann@deshaw.com>,
	Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/audit: Add syscall overhead benchmark
Message-ID: <apni3p2JBQmc5IZQ@skinsburskii>
References: <20260806-audit-v1-1-ddd0d94ff0b6@gmail.com>
 <580b5af8293cea8dc0a13e044b52280c@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <580b5af8293cea8dc0a13e044b52280c@paul-moore.com>

On Tue, Sep 01, 2026 at 05:35:12PM -0400, Paul Moore wrote:
> On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > 
> > Add a microbenchmark which repeatedly invokes getpid(2) and reports the
> > per-operation latency across multiple repetitions. The workload avoids
> > filesystem and other syscall-specific work so the fixed audit syscall
> > overhead remains visible.
> > 
> > The benchmark deliberately leaves audit policy management to the caller.
> > This permits comparisons with increasing numbers of unrelated exit rules
> > and with automatically removed watch or tree rules without modifying an
> > existing policy unexpectedly.
> > 
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> >  MAINTAINERS                                 |   1 +
> >  tools/testing/selftests/Makefile            |   1 +
> >  tools/testing/selftests/audit/.gitignore    |   2 +
> >  tools/testing/selftests/audit/Makefile      |   9 ++
> >  tools/testing/selftests/audit/README        |  30 ++++
> >  tools/testing/selftests/audit/audit_bench.c | 227 ++++++++++++++++++++++++++++
> >  6 files changed, 270 insertions(+)
> 
> Thanks for this Stanislav, but I'm not certain that we want to merge this
> into the kernel and have this become the defacto standard for audit
> performance.  It's a simple, easy to understand test, but I worry that it
> might be too simplistic to properly characterize audit performance.
> 
> ... and no, I'm sorry, but I don't have a better suggestion off the top
> of my head :)
> 
> However, audit_bench might be useful as part of the manual_tests in the
> audit-testsuite?
> 
>  https://github.com/linux-audit/audit-testsuite
> 

Sure, here is a PR: https://github.com/linux-audit/audit-testsuite/pull/129

Thanks,
Stanislav

> --
> paul-moore.com
