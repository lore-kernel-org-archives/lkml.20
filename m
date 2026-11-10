Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323966;
	b=g7ncFUB7/Cmhzm94zmKxeaytX14RJtyHLe5CuTT4Jc4PvmjLc+HrNNNcg5qfl4DbsTI2
	 wB7yKiJZRzMlOOXVu2Lad4HQSE2W2+CJNDizGInUfsSekgSbkgjnUza1yuSvzUfqwG5v0
	 m+0f39YIItjU0AP/X3JnPAaqqtzQuMkJH3wKPPFkYkFXdfePAnsXSaHOGUvG2J/21j+6t
	 Kg0NZwk152ZamWvVOMeivpdVDsUHg1SfJl8zU4VBUKTmOjCgQyttpaBCpAHNAMbbs2eF/
	 WPisYVeCHKiL4GXR7axUrO4oEfI4IvU7TRO25IV347VXWNWYgn504fywP/zLouy1CQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=76utIQtb/c4UmY3zEuM7/9SMI7MPnH174zMwNNzMA9k=;
	b=O3ANjXhE+0rFrQoLLsbMWIZKjC/cMvs7F03GYwJcNjTSq0t1gJb0rXKl6yFnsfsDWYLl
	 +tgjB/MWOUPgD6iq4kEhD/ODpGiG60hkt2lzAxO0BbIMZAjkJ3bsWhppSxXc5riGbJj4u
	 2adnizY6gHjhBKF0Yqq7/jU2k4GEn9zIyaPHwnL2l3HVMQmn9dCiP5EyxMh1v5WbaDSeu
	 v1OtEsXEAUmdNhLqEJqUgoHIeLaCzRyIgdZ4UGvUUK9QNsXYcrWpL4v5ymCJUZoMVvV3A
	 ik01cXepBRYPqw9SoByeOV1jFlDdVokP8jGFS0OfUpWxqnaQoxUFLX/+EMGS6y8MgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FdODN4Vo;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43EC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FdODN4Vo
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1456474f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323964; x=1794928764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76utIQtb/c4UmY3zEuM7/9SMI7MPnH174zMwNNzMA9k=;
        b=FdODN4VoySq3EV04yTB7q7lsbUQzCNEumNvZUsLMYxkJWamaUfad4G2e9UnXuG7Vjb
         W6ljQA+IGHLq0oCv7DrDBuzWO0fTiCf4/MeKFK1jXESPHoIJrScQ+noZFp6/Zl0zVk3N
         JvlXRUGRiL1VPA65MLGjLIT8F1bpi3eanffM8xHaBE2HOH7/gBg0H0f6AppVxFodKr6z
         LxZVhxi/zm1GY5dn65B1w1v0P4jjpCJZecz+gSLKLfb7urQVHG78QTnXLhJnXO2c/Wfj
         oKU5vH2wR0UInC0hxULi4JBetHjed8U0vuAsibmr9wbH0+AbSEyKVtUt8ThLn/Z1p9mL
         YaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323964; x=1794928764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76utIQtb/c4UmY3zEuM7/9SMI7MPnH174zMwNNzMA9k=;
        b=PI/BCJkZmn2XKJKfTRxQ2xflgX3k6Q4PJ7GUulojbz1ikWC6heJ94SOwrope+2yFxm
         iY8C4wArlJ+oSV7+niyB/tN6uvLs8TH+SoHe8B5igChAH/yWvd/dzZy7lxJVw8n8nNAy
         DOWckXS7ajtFtP98hcIPM5BM2pXohoUh40A3Q6L5nKrDrsW8a4Qu5OhEbsK6VDmASI3e
         EwOFCO35vkhmIekM7Eg5jlGOkYGi0pAMq42JAY0lGI5Makvhr5j/zj2X5bn6EFKeQoh0
         8I8ncENaRvODxW0l3v6NiZpUBDaBQLSJsxbz5DO7SljEu5euOWCSZ7dpTzSHIzKJw810
         PLbw==
X-Forwarded-Encrypted: i=1; AL+hErFRbBwW0+Km4byHckRkg8vHRNAnfA53ms1EY5jBEtDYTowSEEpq3rOwP3jCOBN1rtom8kALJtFfJLE5ZI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cFC1RFL4t2esEOYJpeTwcCZTcsxDzAwz6w2suJG3vGfrJ8YPb
	//XcrPsE2K+21m5+H/cU6cUdxKu5yXq8tHv6im/DNVSy0QepXFN5LcJA
X-Gm-Gg: AYBFou1GxpStOypSZmTUhQaCmw682VIt+OJkObFZsPq2LTcXa6nnQAuP3dK4j3EqOPS
	0ypue1agUbcjyQYbvAUh+Fgk+whdn/JHRuCRHpYp9q5vQkgs/IJi13WRbIk0ZtT6L+KNk7czqid
	2Ho9H/NFObYjiZBwuyh/Wpeqj1fEq5ipJ7kALOsHQEdXtqo1ii+Zfonzcrk0BnA6aD6lurmOMQJ
	qR+Q4qg5B/mPSSBG7gABQ5+eDAN4lmmwrf/zgj5IR3yjHcMNdG2BK41LdDqNnNA7x82BJhaw7iI
	1zF42uq6qoPDd6pBTnympjRsXQlntXzIiCpak49x+JK7W+VaqOVmW8lMYLF1oW+rMAXAksXac4E
	MhUVTdzoHPkuNqgNTeDN2Bq9RYuBqqYCyGsN2WMg4L2OJXzCnSiWkicujHYSnQRSXX4riHftVBv
	GHNJIsrgvTlmEoJGcr4mGmE+nozx/kQDp90TSs1+km9vPUF5lTEH5pEQM+UNxNklBGKiolKDd6n
	H1qeKvEY6vnaeDcRdGG4GVkkfdZuAe2g126+UDuRfR9bEYDvedx2K7expL8SAHwHvmotUNq7inY
	UgA0/0Ws6oevv6ZTrpQZ/OKkFEUQCG6LFFbAOw==
X-Received: by 2002:a05:6000:2689:b0:492:20e0:f666 with SMTP id ffacd0b85a97d-49828b4d6a4mr6282685f8f.0.1794323963892;
        Tue, 10 Nov 2026 07:19:23 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm5971615f8f.57.2026.11.10.07.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:19:23 -0800 (PST)
Date: Tue, 10 Nov 2026 15:30:53 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, almagui@kernel.org,
	john.fastabend@gmail.com, qmo@kernel.org, brauner@kernel.org,
	kpsingh@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, sashal@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v2 bpf-next 18/18] bpftool: List and show fmod_ret targets
Message-ID: <avM4rbE4M1NTiOn4@mail.gmail.com>
References: <20261109170550.141443-19-a.s.protopopov@gmail.com>
 <342114bded17116917aae775b31c3c68a484d0c3e49e1b27c74131a6ba236ca7@mail.kernel.org>
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
In-Reply-To: <342114bded17116917aae775b31c3c68a484d0c3e49e1b27c74131a6ba236ca7@mail.kernel.org>

On 26/11/09 05:42PM, bot+bpf-ci@kernel.org wrote:
> > bpftool: List and show fmod_ret targets
> 
> TL;DR: Nit only: bpftool.rst adds fmodret to the OBJECT list without a
> matching *FMODRET-COMMANDS* line like the other objects have; suggests adding
> one.
> 
> > diff --git a/tools/bpf/bpftool/Documentation/bpftool.rst b/tools/bpf/bpftool/Documentation/bpftool.rst
> > index f38ae5c40439..2c64c22a5026 100644
> > --- a/tools/bpf/bpftool/Documentation/bpftool.rst
> > +++ b/tools/bpf/bpftool/Documentation/bpftool.rst
> > @@ -21,7 +21,7 @@ SYNOPSIS
> >  **bpftool** **version**
> >  
> >  *OBJECT* := { **map** | **prog** | **link** | **cgroup** | **perf** | **net** | **feature** |
> > -**btf** | **gen** | **struct_ops** | **iter** }
> > +**btf** | **gen** | **struct_ops** | **iter** | **fmodret** }
> 
> This isn't a bug, but fmodret is added to the OBJECT list without a
> matching *FMODRET-COMMANDS* line.  Every other object in that list has
> one (*MAP-COMMANDS*, *PROG-COMMANDS*, ... *ITER-COMMANDS*), as set up by
> commit 6585abea98ae ("bpftool: man: Add missing top level docs").
> 
> Should a line like this be added after *ITER-COMMANDS*?
> 
>   *FMODRET-COMMANDS* := { **list** | **show** | **help** }
> 

Yes, thanks, will add

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/42662799554

