Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207925;
	b=YjjZ78XIOFuQjsLaIVl6SDHkEkBTGSZDLntkD3FqcBY+3Y/eXsWXB5ERBtx/HEaMYNcc
	 F90/HKXvsOoFKCDv8iVH/mLrnC/nW9jX5NJw28tJvblP5C9SNe66r/mlcHjIJG3mbz39M
	 rJMQ5vbQCNaQNojHSrkMXM/sl/0dszPGhL5OFfwd5qfwUTUur6s4NKQEi598v/hcY9KSo
	 DB0Yusp9of2TcMCcFciW0BdI+XZAw8hgaxqdM5ocw/PthhZHiAdrq7+ucQFK8XC2azpG4
	 Z2rjW/yUZ/jUjdk1D+e2jezai/F2UbNijndGza6QWvESKobdpZdo8mfdPMRzhhhppVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NoYlKaRohlGoyY2ftaJ8d8VSCoyYrhZ6iA0l6SH+0as=;
	b=IRMXVu5jG2OMUEIHNCC9lYYuKgamSak20WHkxc4BEFzI7p27ZgGe480xrHI6U1lNsrqn
	 UKv/hekCBqR/M8zvIT76RHNq12vU9iFctVfEuvn8rNn72ZCD+H9Ev+eS3NpoUWxBsPe4a
	 Yogjcqo8NI65gkdrp8Kx1mBuH0wySTnhFfCQciobs1qn/Md5ioq+WpCTYvzHVrT1hKc/l
	 Vm9TPguk/arHwwA4sAG1O86YF6Azy2zLRvtgiU73FkzK9umFrlrJdRK4BlhmSDzHfblHx
	 wVjtZAUwJEaMp4jLfImk6EY5gXBQDfD9OkLHCEU/gS+JbdSL7j4FwHSPbUbAlzKGtNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ImHzOy2D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ImHzOy2D
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so823614f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207923; cv=none;
        d=google.com; s=arc-20260327;
        b=UuG7hUsQ885s+HogWBnfMTBQvG3M9Wgjug8k0lZN+lb6Qbqhnty8qI2ZYGisCPEY7l
         Ad2EGdkzNpXTAgGNi4JXeT8joR/z8cW1gFAg/3Q1h/SxzgtzwDpK1ZM5VjPq7NssGSwq
         Cnpn8FKJgQ+jCzcczbjNttxcjMGMM2A52sbDBd+UewggZ/vnVCe4sKFv1a35rleoUWUN
         Wpbx6T9uZS0igPAZ0LrR/s2goiGJ+hEFmNzkxi44Kkx72FcDucD9UghiTNwJLOY1SvLf
         1cy38xV2uXCtIJxpwOWrc2YEl67aGSBAXI6kRYYnHaJb0Cxu9ew9z4p7xWnq+5ePkW94
         MUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NoYlKaRohlGoyY2ftaJ8d8VSCoyYrhZ6iA0l6SH+0as=;
        fh=bn04B2Rs76pXcTpn+3sTeMP2fcsHZg/ToIL+F9v6NuE=;
        b=H7/3XoZiPpMQA3N/zvbk4j5ynagzy8C9FHQMAdn3+qxVC/lxkuoL9O5G4aZg6UFAJk
         nopYm8+n+UuFp3PL/3wsCzxNeJ99AYjKAyH9YJZetS8OIyot4T/fvlza7n2D/9ftSrjb
         3ThO6SkphWczC2Pxr2rX9rdG47dhLzSn3W3LBpcvpT0Yh3iiabYlUkH3st/H0Sbj+/Y4
         CMkBGSiBJEbhhGUXboF4TJE0wvayPmMzz8oKu8ZLp9WyWRWFVx8b3sSRvWLu3VGgVcG5
         QfAfQFyez/FwU+0ot89VNzWgsG07bCQ/DrBNXI+LkSzDWvMf2dBaelQfVuFkgRgtKJBk
         O8TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793207923; x=1793812723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NoYlKaRohlGoyY2ftaJ8d8VSCoyYrhZ6iA0l6SH+0as=;
        b=ImHzOy2Dj5AGcP+h8wnEEzySN2gDvlCs2BcukVUrzW0SwKyL/hImGF0ZYqVujZ5WLL
         yLEnToKuOa7KMBQ5TUav+T+6mFo0RTItg1LW9Zbi0On/CIGcNVliHarLbCJwGXDdhLQg
         BQGXDjH/43zzQnXgCBxy7Ae3KOVhaJjXuJU43ME4dsw+kg5fqHUWopPxaa+QkK8wtOwf
         u5HgAvuTfCReFzeBLT1DLCrWPIwPkspZufQ6OncGmPyJhzORlw/8lw4Wad5m6nFgPPJD
         AF1q2GRsEDs9IBM6Nd5odqTCTRz8y1beO3hV8HWfGwoQjKMcyGIz0M7v0EmsNBYejaea
         6Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207923; x=1793812723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NoYlKaRohlGoyY2ftaJ8d8VSCoyYrhZ6iA0l6SH+0as=;
        b=OTaxFCqcb2V7ovBDloWB6whI+RbTi8QzGr0F4/aBVmsUB1A3ej6c8i6DavSCfVBZL8
         b9lSkSJgsvOM4cuOn5CQkyCdvQwAgvasOziJFU1KVfCx0B+laI4pxYCOgcw6y8AWoF/y
         eupvFhZK/PK+w+RvaEs+q/WRLr77C9YylQv+/gotfy9PMr5oj5LHofNAvoHPwCiLQO9A
         cKDVM9KtNUcwRPuHOwkVx++WtIUeqkTUhUfwGyLYodp1iohmCISeH0I4DVz3hrrqHA24
         rQf5T1Lo1GpuuB3GYj9WI4s58DUvAIpQyA1Zo43FF63KVJ9M0aVsdVuJKbmeIjHLHKtm
         Xq+w==
X-Forwarded-Encrypted: i=1; AKwUvBwAyZ3lYHOGnz6vsfQwGXy10SpoM/bgR/ZDaHYiVoDbw78FWjy6SFJTS6+usk+j8NB97ZnSTl6zN0kjwj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU07TirN0Q4UliC6bBQfDdp1Jddj2lEs+B3DgnMU4maUy4cCPP
	7hb2DQeGjQefCugfwwLdqO7tM+mdebY2FmNP4aUbITGNP1FDRbOXaNquu1lEVZpEYng6FfB41jb
	gM80TljqyoDUUdmVK9ajTpIqiPF68kzxwXfhdRiY=
X-Gm-Gg: AYBFou2KGH4vCi8rSDqn2L+sNzINi62ElSLxW7U0sbCPIGUqv0xbmSBF4LYOLatZH6g
	OgP3sexFPbzv8T0B1pY3Uc6iA6uUAbfgb2CQXqupC1/+YT9/A4IBvx7bGDQ3SS/dZyb4jsRJYQz
	l6QV9MfJ748JdtooVcOfuKkEn/sEpmM69+HB7EW7HOJxqQlsqNyFRinOC907TJk4BH0VSE2+xkS
	rXGPxKjPG0mN/W0Woq+xEMsR9yrwjEQsbrY2E/m9LePk1G86M3fxhRgiPWCZLWvoDZaD0aLCAYm
	ls5vbrtJSE3eZNhv9fGSOTVrYzEWnRucN99AGPaPTGrqiOMQN9rtPGnftJ+HCiNGmQ0qtruKao9
	xBFeOM8ZpFn1HVYeRy73K8A8EXpbXTBrynoqDJz4AmyfcHMefnqzlSwsMSmmvCkH9EtqYFDHJf0
	OF5yTyM/W6zcvN25wDyGjKgjS88AU9wcQOsBdegpmvifiDkZ1WwvazhAGYGdBm3NlaiYglc0XSC
	zCM8RXn5GhASW9N3/9dQ0WMn3ljavfK4nSGXzBVKNj0/Y+zkHA0BA==
X-Received: by 2002:a05:600c:354a:b0:4a2:47:b79c with SMTP id
 5b1f17b1804b1-4a9678c3ca2mr66939815e9.32.1793207922737; Wed, 28 Oct 2026
 10:18:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028020512.10245-1-qyousef@layalina.io> <20261028020512.10245-2-qyousef@layalina.io>
In-Reply-To: <20261028020512.10245-2-qyousef@layalina.io>
From: John Stultz <jstultz@google.com>
Date: Wed, 28 Oct 2026 10:18:31 -0700
X-Gm-Features: AclHuK_zQEQE1KcuqmVrDOP1bNHJH5t9ggA7HMSxwy9k2nnrIBrMfoKMNFEUalY
Message-ID: <CANDhNCqe6qSfCFvXy5qT62uKO23cBPXt6yBbTQtBUDJE0RPBVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:05=E2=80=AFPM Qais Yousef <qyousef@layalina.io> w=
rote:
>
> Static keys are not guaranteed to be enabled atomically across CPUs.

Nit: Not only across CPUs, but also across jump_label callsites!  I
believe the enqueue/dequeue race Wei reported happened on the same
cpu.

thanks
-john
