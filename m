Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB14E3762
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869127; cv=none; b=AIHNYSYu10yQIF/9kPZv4rR0P5DdmdXZJtAiwnlaRRRqT7m7BUvAMErfqtTosttqaBpQtBa/jqHhCyaCzseP4UX/qkgi9OQp/aGmPuOcTozQHpbP9lBKt2Xq/YZUVbFpS277OP4F4uL5owN8AssuFkzJa2t50jMaX/B1bFnFGCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869127; c=relaxed/simple;
	bh=DE3utOlU8enhMCeMv0x5ACam0SDsoyX2DVF3FJK632E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ks3yrF8vUZVDzv473K/8OSVjaFTC/tm4xv0IFZ6lKcstmFUGQkoxx4/JyJzWIt5xYHMcEe882kdnyyzH8hx8nA+0xTeD3jkuVEXWkTdNQzW1OGD2ckXnCAGx0Vs33QsK4bWtUEUX5CSlk9qqsVsC7ci9OLwNFsySCQPQxinmbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FxN0WXFC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FxN0WXFC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so45755915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788869121; x=1789473921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6gMrsDr3O2AhrIFNyV2FMFs0i+sTtOGoTHAK2qARBk=;
        b=FxN0WXFCprc50AAoJfy5Pxuriv7kLYeFFBdAkQ02Mq+hXkF+CSjuuwylieA5OEdB7x
         nDoL+FAn5lZs1eY4HVrDYtNxCsTReS9XzHMvJuL69HXfuomrkuXvByFrt9OrJ9HyGRIx
         mXFi/21mamLpAFYtov299YsxQ6Q0vAnD5UTpaYcUGiERaqjxksFSCi7SdaMvlLJk6D+0
         kl2Aka8Z8GgLSvpZauEwQXzOu47X+KKWfYQSxFq1l3BtTud6X54KWB+ufEhaMMKaNbul
         fIc4rhDbvNAvqWxN+dPHrBmldx0Ye2GHe6oPnMnbNuF9FN9fdMBJrbcabgRiLS8NCEe9
         AS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869121; x=1789473921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6gMrsDr3O2AhrIFNyV2FMFs0i+sTtOGoTHAK2qARBk=;
        b=phQJLGE3UsiMoKJzlbYb0hjwcpgQAGcnpkkIuh60DW3c6bU9BnCRjEXBTLUL5x9sV3
         rhQNeiTIcNuSoFnQu6jm0TRIwDVgZCtpeIGJ8lHk/iM3kYG0DvT2ZyGyx4ddY1z+Wq3u
         2TO/3OeVwI2UNltAARXrp1Kuap5hL5JbCEIMpFKXhW8qvPVVkxyFEhVjb7eO1jjsu4iF
         +W1IF5rEhgMlrB+gJ9si1wflrhYZe4esOkHI2KW1MReUDlQSySOA3SB6BOhQB/A5nQlB
         nNTlh7E6dpmFcueiK+8JqK2UsmGwVd5esL6OWbTAar+g4epQe/N8Tmw1n51982DhHFNK
         /svA==
X-Forwarded-Encrypted: i=1; AKwUvBw2IhVNkwnjI6TpZuClhOWGHIFpTWzbMYaJ+edVf+ZJ10GzipXSH2OcajOKLVb4ha3IvDK4Lz6cnAaPQqo=@vger.kernel.org
X-Gm-Message-State: AFuF++nqT3YyrnS5kyVBcFT33yKpwlWo4p9yjbOOXb45NLYKa4j8vd72
	+YfpkE111Xz86S6loc0Jkf8A4RjuDGVR73/xtdcsaUEVflLUKnctOMPFhi8PTiTDsm4=
X-Gm-Gg: AYBFou1+MYHAxU8SXM43sNplfxgi/JcozLJqx05biTqFs1MFVgFVvVDVKEHLVknDFoz
	7Ir6yX0yzh23GWBdGdkCTMLxuY+MqQWxocYHyG6GpKTz94xwrrJAf08EArYk0N4QombYFfRk1Q6
	3hLapFSDrC2GO+/xwlikXTqboOtSynAr4cAJB2qAJXtOtftuh+3ak8VPTsEMq/UbfER4EmVjJER
	7vxtAaMke2yUsfqyIb63BNz23V8oyxif5tv874qiLcr2zgAxHO510Vf5qFhDQmeyDpHYAL162dt
	QkBf06R0H3K1+eA0U7ef+u5hqzccEvPU3TlDfdkMXygmVTcCyNK4I3sKxH00qLeh54WaYyQmktp
	fJ1ZQRg9daeJcf6di0UxDVfGE8WCVsBxYF+zodODs2MabcrqhedMMRLeSD+vBUqdwlPXeGLl3Yv
	Lvx9dgVWUOIXyG7keNnkPvP5pFH1VDrc/+7y9DKuQ20yS8OiVfVAc=
X-Received: by 2002:a05:600d:4444:20b0:49c:fc6c:be0a with SMTP id 5b1f17b1804b1-49cfc6cc001mr188498935e9.33.1788869120745;
        Tue, 08 Sep 2026 05:05:20 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm390140355e9.0.2026.09.08.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:05:19 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:05:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>, jpoimboe@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com
Cc: jikos@kernel.org, live-patching@vger.kernel.org, shuah@kernel.org,
	song@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] livepatch: Fail object initialization on duplicate
 patched function
Message-ID: <ap_5_Qh3h_6YN8PE@pathway>
References: <20260908120149.299352-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908120149.299352-1-pmladek@suse.com>

Hi there,

please, ignore this mail. I am re-sending the series with v4 in the
subject. I am sorry for rumor.

Best Regards,
Petr

On Tue 2026-09-08 14:01:44, Petr Mladek wrote:
> This is v4 of the patch failing object initialization when it patches
> the same underlying function twice through two aliased symbols
> (functions sharing one address) in the same object.
> 
> Changes against [v3]:
> 
>   + Add selftest for livepatching aliased symbols [Song, Harry]
> 
>   + Only partially revert relocations when failing inside
>     klp_apply_object_relocs() [Sashiko]
> 
>   + Cleanup changes made by klp_init_object_loaded() for failing
>     patch on another failures in klp_module_coming() [Sashiko]
> 
> Changes against [v2]:
> 
>   + Clarify comments and the commit message [Miroslav]
> 
>   + Cleanup when klp_init_object_loaded() fails [Sashiko]
> 
> 
> [v2] https://lore.kernel.org/r/20260823060734.58443-1-x90613@gmail.com
> [v3] https://lore.kernel.org/r/20260830173343.52759-1-x90613@gmail.com
> 
> 
> Harry Hsu (2):
>   livepatch: Fail object initialization on duplicate patched function
>   selftests/livepatch: Test rejection of aliased symbols in one object
> 
> Petr Mladek (3):
>   livepatch: Move code for updating livepatch object relocations
>   livepatch: Clear relocations when klp_apply_object_relocs() fails
>   livepatch: Clean up klp_init_object_loaded() when fails
> 
>  kernel/livepatch/core.c                       | 137 ++++++++++++------
>  tools/testing/selftests/livepatch/Makefile    |   3 +-
>  .../testing/selftests/livepatch/test-alias.sh |  81 +++++++++++
>  .../selftests/livepatch/test_modules/Makefile |   4 +-
>  .../test_modules/test_klp_alias_patch.c       |  62 ++++++++
>  .../test_modules/test_klp_alias_target.c      |  48 ++++++
>  6 files changed, 285 insertions(+), 50 deletions(-)
>  create mode 100755 tools/testing/selftests/livepatch/test-alias.sh
>  create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_alias_patch.c
>  create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_alias_target.c
> 
> -- 
> 2.55.0
