Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559054;
	b=nmjjYqIKVvRUHmpzzoBKixzLYxc2Oj1SUMawvtfiknxInohKhLY0CM64VBUzoKxZZGqx
	 d7XNHn8yXYJC6vW49yFD401OeK4nUr8si0lsNe+tyXPqSlShIMtNi4BCUM+ginlDV4yZq
	 oLX/4ZpljlUTxEnjAilfm2MXnP/qPh9YPqAF0vGHWVqFzzG1Obz1bqI+Dv03JHFEBetY2
	 ya5lUkbCeZYyusO4tlSqzp+Patayi8/4x7d/EHzUgD2XZSp9X4svBBuRG/yHat1NK+jov
	 Wx8dZAo8V4bZFOaSTUKAjpiR/XmgXlx6Mi7A3OSCfIg2AhncSexs1AhUxQJlLjLxh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
	b=uEs5lRwXsWJ3hmTGWL8eIKFGaT4gAZ05rG84GGEXHz8T+kY+xP709FLlF3r2/4HOogj6
	 4aAmxz6D2t1Svvd9rGYdQidcyzBI1aEGH1/Afbr2kBXNU7po9MNiyYG/BOOEOA1uJjj+C
	 +Zh60gCErze1aRB5QcZOCpdqjfRHC9yLaFWLkAGvlG5pXNu8aDz70IpV2ytV1xVUx7Oql
	 7njE8GpL6yTvvnC/aNeM1sbQE4e8iDjvpHkSYZd/cgkv2p+NX9DWpEzLOrR6bFT7e0rw6
	 ljBAA6Ebj2NxriqVsM6JidSV75GlcL2X2XG5bwaQI5DWKCqhUdg7c5y2uuZ015XJqgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mLALE3hD;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D7760A5BDA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D7760A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=mLALE3hD
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so3618965ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559053; x=1795163853; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=mLALE3hD0yOFh5RAN/jg1xLgT0bpSd2jsokmAxPWJwdtWtNzJUJKHU8ZSCDP+t0Son
         fWbCv113pOpx4EpYvH0tfNYXl0bSPzFTvxf4T+Cwn2jFeJ0Q6iQAPTRusHye8tA95AIw
         V3dDJFkUeKTBVoT9GYH9LXXDXMfZ+c6qqfyrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559053; x=1795163853;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=MyaGTbs0++zNsuK3grkaZWRLjU5AgZxef4uMlC74VUvH5iRnQmRc0Wz9fS2InrvhE9
         7vwpTX/5exaS8z3DW9e2tmKc7Csp2gVAdAerNS/1IPzg8bGaOYBdyN+4y1d7AZtVbAnK
         s6bSbyBcTuAGJdOKDKUc6tIcw9lDPLQwIJBfnk98FCRZXYPBqhAMfckz0bKtk/HD5GLr
         ApDisx9+CrQ9Ld9wuL32LflsqVlcg1z4SHN+Z+qGxzhikM4/f4+E/JaEjviSKjzzs/Hb
         cgAY2LrRx0l6Wl1e0fOGmOgwg8cap8SPjTxtlDAiNsePBapsFaqEi7gpEPYx66zly8zE
         z9Zw==
X-Forwarded-Encrypted: i=1; AL+hErHOOQ21jpmd0nulwyB0QQDC90EVW4uQDbLKlxuvIEIdwj4/8echcjEE6zzE16OdHj79N/FJhRxye+sRkyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XMyph+jGPo5C9D1LGxGkX7ECtcDgJzMF+B2epI3uHvXG5mr5G
	cBG/e4y5WS9fQLS36npWHqC8WJpUR6ILfwHPeGMmXC742NTVhFc+daoa43Sr3NfNnJc=
X-Gm-Gg: AYBFou0CXF2Miivcm8GPDretSJ27EfDg5gbfB5OCPUGClC1+oyKXhQIwt8U00fXUAH3
	b1kd/R5JInEyXdHh2+q6il6wyoLGbvOvZNhFwHHFCGzEcbZtIXzNlJAVjIkKeTsaElizV7hYwCW
	hKIOMSvMYPCaveQvuvxG6PodE0Wz/dVvzZ8W7+xZh8lTocFDL8W/6IhNTaGx7ctBH+G0HAX1nlM
	JFVLLN+MgiiuQXODnEdU5agMLEyplhiVOsnjvlhlkyDLB+Y+5hj/E/K7lpyZ+up3GHzJt9Lnc0b
	Mcc1L6gxWjVHViYpCjdwcZt52uuWx22cUF75MTfbH3eF9D1eDAZldu093Y9bS38A30NT926iLcX
	LKZXlMucWiLfpu8pRKX7Jpet5PzsalKChWjSt7F/7qTy8hvwFbXEP2iTnGnpG6aYzMWJUmiL1XD
	QTMz7B1ejn5tzGyILdNCPgG7d+kA/Lr9OcPK8QzQM0uZBJw6ikz2aRZsIl7rD1tiFKKed6eV947
	w6beud1PyLfmxYrI0yvCRdDzIZl+SgqzopZvSAXsYp3ZCk2uFphnpEkPWOFIOW0NW9Cmmydew53
	Qxhbs4avklrnt1xNVtbM1iAb2yii7z9EE5pjChpf7477/CDbKe1emL+o/eXYBoJ5mwmv2H8+C9A
	u6VO6b+mzM8A++HWPLnsB/odJgl5tvuG3GZGq6/yK5DC/hvzJ5VLJ54+togsL3ANyH/9EOzevUD
	w9TOnXopbZ+3M5M5cec0ZI+kSqHP3ayZU9bJCI3SFchgZxcFrNyW4Dy5kGNCo4pLaPQaRvhmgUj
	E7qbGiX
X-Received: by 2002:a17:903:3c6e:b0:2e9:8202:508a with SMTP id d9443c01a7336-2edf1ed6cdemr37400075ad.16.1794559053599;
        Fri, 13 Nov 2026 00:37:33 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75ebbcsm6475845ad.26.2026.11.13.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:32 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003731.5754ed6732d351dc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Randy,

Randy Dunlap writes:
>This error branch should return 1 since it handled the command
>line parameter -- it just didn't like the "value."
>
>Returning 0 causes the option string to be added to init's
>environment, which is not wanted in this case.

Good catch. I've fixed that for v2.

Thanks!

Chris
