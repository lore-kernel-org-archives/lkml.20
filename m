Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D0331EDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298518; cv=none; b=Df4EUcH9HhK1Yt7ZM977t1IJcfgx7CdJlJVQj7UyE5KuU29cWfi8q37lBhRSX5gZpwIcJl4ti06v7fGi8UZ22I/jOM+KbMYz0aHBKAXnhVBC/a2VMhgdY9BVjsgSWLkPpSAgSgjJeraEw6cOXeGMZE9zyNt4tjgkGDdIkvY/x8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298518; c=relaxed/simple;
	bh=iSLp1IrSeiNNeBsrOLPLaCfMKFD7rzEjvmdP6CIih2A=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=doHRoAmErBkzx57yc9hQvYvhl+lrCNwYIrhuEjcV5lYw/JWhDwDLktGtbXRwYxzyTFq9Rypjt58yTJBS8FxMGUM1ZsI5wWwsIIKgQkPXnh3zl5xfkDnAcJK7kgQK31s1AJXtzeLT5XjrhTs4Ek6nmRYmdeuwaK5Q71V69XdEPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SXjBgpHk; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SXjBgpHk"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-530187593e0so3610721cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788298515; x=1788903315; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IE2LqMY6NUtGXuk1qbc18CY6EeLLZzRewObQtxCrnzU=;
        b=SXjBgpHk0N2+jZwhGyhH/DweP9fsFDBsGihousgoKG1dxDF/JDAHCfvh4HbB45OO4W
         +i3XMQlrNdNf49sCwmrwtPFP9G+blHuYebX6EPLXAdHUtk0HBsm6ldQkr8bZPPUE6Jpw
         qvku+97mbMMYv0pc6nSIdoDJBOLmkkq1vb/108mpf91FscvJXvYNghUvf9gSZ1Y0YWvy
         4vwH5RHoUBE5wmnOit6ydDNP5RdZvHcuKdzdJdAxBs5xAmijmA1xYvlGHCPJ5UgSVp19
         qcRj1bTEdrkf/aTZ0T3odBKBVR8URnGSXnIrXU4XyLaB0MQncp1jgKfi3MWimZHx4OTo
         E0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298515; x=1788903315;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IE2LqMY6NUtGXuk1qbc18CY6EeLLZzRewObQtxCrnzU=;
        b=HuSnJYJLD+UFQ8rpbFSBLyP1zPcl7cDb0tiqmtlC0icPIYV8ISRaaIhY2zJjEmWHrr
         Zzxo4CrIL06ID/9a28JjCcqTNsAWyls+WLB8GHLQh6tz/Qror4o3bmsAYzDbCbSFWekg
         p7dynrMxjbaqYP8ThQTqWvYaVMAJ35i35Zki/7X9E6bQtFqQcgwnAFgEDs4K9zS0vuC4
         Vo4aDlEkOiwtlgoWxzyc7Fd3IaELEdaKaLubkpuhTrOFYGXGLcMQ8UoyziPB5mBcg9Kv
         HYoYKUouwZ/5vBvWEZFQ0SJ/HOSc1xfG7udPyBKbNwsQhvvIRdThV6SedIrspskwZ2y2
         3XMw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5VL9PSC1GiFR9PHbDpNCgwDI1B/5dKSo2JjhwKVq/D+ipDrXISdiASN1L/AVcpIBKjHuiZD5WjA2H60s=@vger.kernel.org
X-Gm-Message-State: AFuF++llnt76pAxPwwTvajixVaLLWp08FK26u3iF7tpLowliJEzGtz8y
	jdNWwtmq1NPJ49qstc/Cy+m2p5FwnnU7DQcsfHn8ZbHTmwHfDmPMvb1BxU5Krany2g==
X-Gm-Gg: AR+sD1091LwDeLcrUH59dAoXqTJwX/bc72AKKEbhq+cuRjc8TkTHJAA4i7ZtLK0FYHS
	ud3SArDTWXbLLLqwDnUkI8G/u0by12LONV+TpNqHh33dI1lAk7jWjPtjMvBXKk7aaJ3WUMP3bFm
	U4XfHviLNsG5MCOic4Q7kizA1Q9eK3ZmpQH9LMRU2MBWcBABiu+bASYOSk5c8WDzh6IWX5K8WUh
	WH3Dt6a4H8KPAkGX4sMF8PKeEh3HqS2U5bm39omNsyYCOvLYAzLXI1sDuM9ZiZK/E4fMmTsY8X0
	U6SFSsyJyQolHXfWa7YdkFv+UcR7bcLyOjnnixE+fqJUPQ+jWI3yfU1gBSenp2R9WY1WS3qP5/2
	K75XZK+NT5zWgvIVvoGv/ILJsc1n/AJPuF2tqg5qX2QogBAfMT/cK3jukLiywKuacsEi3MBxq2H
	o8f5iKGHbrqGw+E9lIbdjQ4aPfdBhO5JZb8AcDiX44PSIizJmFb0zGMEF0w3dYoS3v241ANRhsc
	yG0NwxDFYJNt8Bp3LuWeYjwdrWPAA/04NGKOFuVEI7v
X-Received: by 2002:a05:622a:2305:b0:517:c65c:4987 with SMTP id d75a77b69052e-5302543895emr138218971cf.22.1788298514613;
        Tue, 01 Sep 2026 14:35:14 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm5772091cf.2.2026.09.01.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:35:13 -0700 (PDT)
Date: Tue, 01 Sep 2026 17:35:12 -0400
Message-ID: <580b5af8293cea8dc0a13e044b52280c@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260901_1121/pstg-lib:20260901_1604/pstg-pwork:20260901_1121
From: Paul Moore <paul@paul-moore.com>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>, Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/audit: Add syscall overhead benchmark
References: <20260806-audit-v1-1-ddd0d94ff0b6@gmail.com>
In-Reply-To: <20260806-audit-v1-1-ddd0d94ff0b6@gmail.com>

On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> Add a microbenchmark which repeatedly invokes getpid(2) and reports the
> per-operation latency across multiple repetitions. The workload avoids
> filesystem and other syscall-specific work so the fixed audit syscall
> overhead remains visible.
> 
> The benchmark deliberately leaves audit policy management to the caller.
> This permits comparisons with increasing numbers of unrelated exit rules
> and with automatically removed watch or tree rules without modifying an
> existing policy unexpectedly.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  MAINTAINERS                                 |   1 +
>  tools/testing/selftests/Makefile            |   1 +
>  tools/testing/selftests/audit/.gitignore    |   2 +
>  tools/testing/selftests/audit/Makefile      |   9 ++
>  tools/testing/selftests/audit/README        |  30 ++++
>  tools/testing/selftests/audit/audit_bench.c | 227 ++++++++++++++++++++++++++++
>  6 files changed, 270 insertions(+)

Thanks for this Stanislav, but I'm not certain that we want to merge this
into the kernel and have this become the defacto standard for audit
performance.  It's a simple, easy to understand test, but I worry that it
might be too simplistic to properly characterize audit performance.

... and no, I'm sorry, but I don't have a better suggestion off the top
of my head :)

However, audit_bench might be useful as part of the manual_tests in the
audit-testsuite?

 https://github.com/linux-audit/audit-testsuite

--
paul-moore.com
