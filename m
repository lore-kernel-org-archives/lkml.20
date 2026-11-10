Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314735;
	b=0djp5FTPpiMPGrDhSsnCxDKCY3t8E2mzVOdMqIXmUxt7J7fLdMlbDNgoedgW8q+oOfhx
	 fPikwSyHf0QM5ARkHFgd9ivnD6tMzXNLvtnE82KdWc4RpBInLNYh+HQz7msIAGlHynKNf
	 cMwvbh51sPhbJgU1szw2hVSnQjoGKacPpAKPnr+zjN08Yz7n9IYF2F3xeqGNDu3zjqV6u
	 VqjvwF74fscTbnv/DcFD/Irhd2+b42S3XpoX3SOgcBu8/JTFMbZIc8rUP+YX06TS8Gj/i
	 3Sjt8u9QShFuqzWyA4bfghPXWw0AEF6roFyZWOwaarYIiGMrqcTR++dJvf3qk6aempA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BfINIDbdnp5YQZaOFA3yDq3s0AajpyTCWSTrx1kczfw=;
	b=lcKqXEaaQc5X+SHyodpfROLU3xahKYVVh/9mUO1MGwAcF2uUNvceoVYyqwZivFMowzWt
	 OnYF3AZw2b67CQhJSPiFEYETpg1S3/feeIMA4cF/I5/6QstCbgt6MrWPPLz02F8PBnaPa
	 1uS/nE0DL+pUunv2isY1UTttUD7t9hAI58R6kMbi0zc0Nxzjexdp4Z3g4ivKs9x2KMYPY
	 5syIwpAOIumqGBNwDsuqTtyllTm2euzAlTr+n4c1uCV8shI9xmDi2RZR2Ssy9Iy44dEDM
	 XeP9CbehM0dXjXRtUX8eCdu+wXk1mYwIU9BUCApsCNnh/3ypRg+UK/9Rt1qA9OouWIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dEcZUNmu;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E290606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E290606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dEcZUNmu
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11393745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794314733; x=1794919533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfINIDbdnp5YQZaOFA3yDq3s0AajpyTCWSTrx1kczfw=;
        b=dEcZUNmuEyvW10CwwvMzlj73emtXK/fpU4H7CvDEry6gD8AmS9pMZBCHmGO+rTr/6s
         a1jZcXSIrGxQ4/dzRn/1Oi5yj6+AZa7H3S8HLfDHBQdEeXVaLy5gTLgTxKfPDzwEq+Lo
         MV0NN62fzU+Phg8hUPH89UJplWl6wCql6scAU2ZeKnhmTEcoeGIQNq3BJIwCn/qvG40M
         kL8idh1jg7BqKcTWM+XNKEweNrzQKtqQKHke4sOPAlA84d3EDAAjBHFIUI1vnWn6dAzH
         PHmcCoK9PmgLWAIOXwtUyNVQpLn61o3FhsjUXL50KIAUjEKUaF0BJ/zsdWY5WeJSu+Pi
         wJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314733; x=1794919533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfINIDbdnp5YQZaOFA3yDq3s0AajpyTCWSTrx1kczfw=;
        b=quunhDzohH66KB7tJ++ji66NPSI6ByBqnvFanqWK4DeSEwB5P2hc/jVKuWXn0SJVU8
         uXJaos4HGhaey/P/iwGV1vD0FlqV8GoJALpj0auhJn57koumiYSlNo/XSasRS4bPU4NS
         0SUs3FfVpWtLgilHfZbcR0HaubRt85nYrGkiOfPj5348TLReKaiUyCbyyO8wQ9cI9cD2
         1oMglqA3urBMZVZth3kPzwMTif6oeGW6xjEwZERMq+J18Dw9vpy+6VuGrw7UM1SGS2n2
         JJUzpUKZtmUfyXdw5RBHFL9+l53a/FTb4cC1+7FKe75i2hMoNOMHIXOxVFA3jPVyUFFe
         HafA==
X-Forwarded-Encrypted: i=1; AL+hErHY4hDlkmKJ10N3kl3N17JjGITAGdF4X5IowFteYMiwc39YbgIdQIY1QIY/pkW8YynGLa7ZLqVJPxuR82I=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ki8wuLnTA+JFJ7CJeZDRTAxw3liQvEf41t7m4V68tY8pXxTd
	ZRgNffKk7Idf94CRXTeYVb5XsX2W0l8kMmAvudu5uHNPo/QJYK/wZ7Uwm+nrATUR+DE=
X-Gm-Gg: AYBFou34h6hgv3TCWNCvWlBZWfFhBWrNSDkXzfhx+7gV/ZOhUXPuDED3Q8I3CGCqYsk
	Yy6yFailclMHjVgd7y7NNlOtyM8Mog/4Mj2VA+JqTxvFkmvyXH+6lim0SSJ3YHOHPyYUtCYB5nO
	1/m/U8JjOdAA6H/Yvy22FRDkWPqBnF4TGJN4le0emPWTwJ4Deed7J3IKtJsIC2bC6FR/2mgb05+
	G8odnOtWz3gpCCcoySDX/eZelV0Y9KVAXauCzDZj/QEih2FKGK2NiJiWszF58DjQ6HYgYGSteTx
	V+CASt9AvYZpAeaGrp+IL4feajrCPIl6IgbuETpHC3EdTakBlZrTD0CzbxB45o5B/9iFeB71/WE
	sV1fhRrtIKIcKEHN5duC5DGLWcUR2EfSdoKaAarZJ65PU79rnIUAMK2hCCgD6fVr1ztl+0kgo54
	q0IjLFAo6v+O/e03A1u1/AX82kBlPPrd/H637s/uIWNslX7dOwFSY5BaCFm9/lZzAJ0BmG6JnSG
	S8aGvqlYbJW/N+Zap3PonrAJjPtxZMGt/vl3OOghcoQcu9fU8mJwVlOV7jUnVdIVv/fscIJsQ9f
	wjGtaSuf6Q0GH+r94vPdLPJr++qfUQbkvHQyXXIo7c2foaw=
X-Received: by 2002:a05:600c:6087:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4ba0233cbbbmr40551245e9.3.1794314733553;
        Tue, 10 Nov 2026 04:45:33 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm70546095e9.1.2026.11.10.04.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:45:33 -0800 (PST)
Date: Tue, 10 Nov 2026 13:45:30 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] klp-build: Fix dependent patches, add selftests
Message-ID: <avMR6tKwddVBrkpk@pathway.suse.cz>
References: <20261028214534.1919398-1-song@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028214534.1919398-1-song@kernel.org>

On Wed 2026-10-28 14:45:22, Song Liu wrote:
> klp-build fails when a later patch in the series depends on an earlier
> one, because it fixes each patch against the original source on its
> own.  Patch 1 fixes this by combining the patches into a single patch
> before adding the #line directives.
> 
>  scripts/livepatch/Makefile                    |   3 +-
>  scripts/livepatch/klp-build                   | 137 +--------
>  scripts/livepatch/klp-prepare-patch           | 277 ++++++++++++++++++
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/livepatch/README      |  16 +
>  .../livepatch/test_klp_build/Makefile         |  26 ++
>  .../livepatch/test_klp_build/functions.sh     | 149 ++++++++++
>  .../livepatch/test_klp_build/run-tests.sh     |  68 +++++
>  .../livepatch/test_klp_build/test-basic.sh    |  93 ++++++
>  .../test_klp_build/test-cancelling-patches.sh | 102 +++++++
>  .../test-independent-patches.sh               | 124 ++++++++
>  .../test_klp_build/test-line-directives.sh    | 175 +++++++++++
>  .../test-new-and-deleted-files.sh             |  94 ++++++
>  .../test_klp_build/test-offset-and-fuzz.sh    | 120 ++++++++
>  .../test_klp_build/test-patch-not-applying.sh |  73 +++++
>  .../test_klp_build/test-unsupported-files.sh  |  30 ++
>  16 files changed, 1366 insertions(+), 122 deletions(-)
>  create mode 100755 scripts/livepatch/klp-prepare-patch
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/Makefile
>  create mode 100644 tools/testing/selftests/livepatch/test_klp_build/functions.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/run-tests.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-basic.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-cancelling-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-independent-patches.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-line-directives.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-new-and-deleted-files.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-offset-and-fuzz.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-patch-not-applying.sh
>  create mode 100755 tools/testing/selftests/livepatch/test_klp_build/test-unsupported-files.sh

I am sorry, I am overloaded and do not have time for a proper review.

I just see that it adds a lot of new files. And I wonder how much it
shares with the livepatch selftests. Would it make sense to put
it into a separate directory, e.g. tools/testing/selftests/klp-build ?

Best Regards,
Petr
