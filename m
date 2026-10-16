Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E624ED181
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166745; cv=none; b=bsYmXzQqj2PeO3z03HkNWr1XSRp4DiBBExr0OHK7O+N+iW0OmpB6cNrTSrUBegAHArKtv9/OEKgWh+Q57bRMSMRSN5vBNViUk96CBIa2ZL4RWf4/g5Cn2iS65hb5FmDJPTFHkq2b9zsBfjj1cDhL78HW9YVyJWQHeGpFpl5xHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166745; c=relaxed/simple;
	bh=5ug6v5uuguLMr0+ls7SFxJsomUB55a7qx3oFLi85A2w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=jU9uBUuqvRbp7Y16LKJhETre6FTdhHtK+u9jjJl0ffgaEFDQKaH3Wr0s//zL9OlzhjjmsE2Qpd7l0Iz5eCup0woQboMQPH78gUk3NvsH2z53QOvYL86DltIY4dzbFB9DoRuWCLareGnr/btxH+ZrhbxNjURfO7zNB2CrgpwKYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcRyK0k5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcRyK0k5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e87c66e556so6358125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166740; x=1792771540; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ug6v5uuguLMr0+ls7SFxJsomUB55a7qx3oFLi85A2w=;
        b=GcRyK0k5WHg4tEAQXetii8VT3FpuvJBNc9gVD1wQD3kMRzitP/JkjsmADGHjlxL+PU
         dHscCPnQ9ROWEDOE/OjpTTPkkW+9u9PUeqKT/kqYjGW34i6hvQfGoCLsdJNK4tcG130J
         zc7JXjUlQJmAqNygBZXjncIIBCIFwbkCsq7S8Cn/f93qWLqegi8o5YtuUgWAjFROKG9E
         GtHeMrAIMwmSJGz0RjZi+ebFBUcibNF84F20L7+YmfBkQ46KI7ZMFQkvRTMbd5DDuHnd
         JElEwXE2PSDo863dbeijudiL6Vi32+qgW+Eopbhf2Tf1pjDO9UrsJOdPkzdat8qiGLTd
         ueLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166740; x=1792771540;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ug6v5uuguLMr0+ls7SFxJsomUB55a7qx3oFLi85A2w=;
        b=LC19S7ntbaHzOhxRtKdv1lkOCX7yg0UtnMitzBWwiKaPGzDM9GpsG6U+d3MAzJ6GI9
         6KRPYkZQOEaEkktJDcartT7YTGGi+LbfWszW/eEELKzgQJSMnd/rd3FA/v+5Sst624hK
         t6QpURpjm7ibqFgupgwOJ9ZhiXmQEqvmhzouNs+oFdVh6o3VbonypqWFRL+yPe7Y4iA9
         xKxesqddeeTKegJ7lYWURnFlz0AozyFn/I0B6HKufDNpxPDr7TuMJiaKcw2hS9cBRBFu
         yVTkA23QyGzhPIHdrrRAiBhSiWk8OAfXhV/we2BccWhLDEWIJ1s9HSpMeXeP7NOXwZdN
         7hVg==
X-Forwarded-Encrypted: i=1; AKwUvByw71Lh2kl2baQcZHDbLZMqkZCq6LdHqN/EPPSp0vUnlM7Jx8H+DdYOoeNCYN0t0mpm3cMnA+PcQiAiDxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIjE507BEWD9aWfUsnVlZvJgmVMBHmaOD5P5jwYCfQ9jbGnrcT
	vFXXAhuDr/OCejSyJi4mwzFmNyyJ5c8DZZmUf6FG2NfZe+Xb266dZDP7
X-Gm-Gg: AYBFou2XtaXz7FfwqmE5ei9NPkRKffxxSHPvACIj9KAAb7Mjk5RBdrtVdsV80CO37ma
	r7UAxxV976lhe5wtAVEwG2YaUYP05KExsrgB9Oz5MB8k338nc4fEkoQnAGaYuDRytbkciqS2Oi0
	RAqW4qJBwW7N5gUCQXIyls3ehOSjSLiz5bAvwbWumddIRoyxX1bLk1u16ERFupB4XylUDJNMI4h
	PauOvnftJ8nX16E2OOwqrc9dVXMGTcUqj5lbbLwH6s2yHq3Jf3UpcOnY5kGzLQ+QURV/M5CG/A9
	5tdJMMJjcM8RM7LWTLzDtE1kLMvh2LCqnTEplFjNHkK/JHKT5/v4096badaETNpK5E3wj9vz6yW
	MyWbd4Buiy6xwVRmTGxwrxq7o/kZYD0ihGR5U4QXgcP+Ou47/Y2n2D4WxCovNcrdze3W6+G5on5
	KgliyU2/cF8T3ByoCaT7rBEAL/FM6iao3EwbnhcE8b/KJz7yx8RaokiDEq6lzue4J2hF9OLeId5
	ikkY7WYW1TcPIeu9MU+t7TylgodnTA2Ls96ah/JMCOIdUR3w9osW+xoPxxdxb6OiUnP1dIW+1ii
	ixM=
X-Received: by 2002:a17:902:cecb:b0:2e9:569a:214d with SMTP id d9443c01a7336-2e9a6e555c9mr2838805ad.43.1792166739835;
        Fri, 16 Oct 2026 09:05:39 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834f32sm12220085ad.41.2026.10.16.09.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:05:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 16:05:38 +0000
Message-Id: <DM6E35SUH95A.2B7HJ5XOTFJHS@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Run tc_edt serially
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
References: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 09:50 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> The measured time includes the time the sender and the receiver take to
> run. When test_progs runs other tests in parallel, the sender and the
> receiver compete with those for the CPUs, the transfer takes longer,
> and the measured rate falls outside of the 2% margin.

The test is flaky without -j too.
It's in DENYLIST.s390x in CI since Dec 2025:
https://github.com/kernel-patches/vmtest/pull/418
and it fails on x86 with ASAN:
https://github.com/kernel-patches/vmtest/issues/503
Both jobs run test_progs without -j. serial_ won't help there.

pw-bot: cr
