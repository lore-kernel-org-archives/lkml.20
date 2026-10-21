Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792620073;
	b=x1gzqsh4+AIp2s6bv5Gg/s/CZGN0NbKbx2keHFKFu8IoWkywzI4ZiWcIMmWiYybejAYX
	 gJUW/hIIvl/o11AjPG6iawxYoTNGCg3W1z6D/R+a6SfbdP1Alcd6dEObSGuOlefHrueVk
	 NgcxUlYh8OdjogeIREqTReyU+Ji89FVcfkkwkB/5fNnYPIrYN252jctzE5f6rxg0O5HHa
	 1KQNhqhsSuvQimoe4KY66ZTRgayTMycSSR22a7346S7V1cTpxhxYCOMyIXUZOjBUcMdVI
	 PbziEAFX1+tK+yh5by993h1wOhI6qYOjOTijnvxytQpRgdqd3hjnNdT7fz+QTtzxfmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=ekANNG852YX/Rv0SYRliAvOikAthVPOfNHHk1KWJgg4=;
	b=KT6W1rOuT9H3cAqAVHjC9hKKFFHW/aanrr6FQcdxWbap0avgWkgVDqhpYX5A4eqEvwuB
	 RAP6s97P0q0ArX1+FRc03DvKMF5EPKaTh3BfyQkgjiey8ExZWdpFz6kJqbkq6XpCTXAn4
	 5EXbX7raV9w2Dt7BruzkHnLU4FLRNxGkxHjfia6P4sK4SIA2O6M+XErfBmEiVQ9/qiDK8
	 G/jAkJ6w6sNITJeMAq37PAibfSbKzRXkxV0vDMBhEDAbsuyT1ByeAc7lIi81vLbBMaQ80
	 zKq8UJFwlkrKNMJdULBpR+DhiBBMnZ9VXm34R3EmiFMccn+pBtCDSbYdTWclN9WGP+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezRxCH+X;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FB0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FB0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ezRxCH+X
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a07ba994aaso416059b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792620072; x=1793224872; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekANNG852YX/Rv0SYRliAvOikAthVPOfNHHk1KWJgg4=;
        b=ezRxCH+XFN6kqXAzUkHG2tuyt8LY9Se12NNEu6NCx7Zv8JzLColYWlPyghLRXld6hm
         xZDWfFEMmj6UzTmaikg6Y8318LeQ5mTF0RtV9FAJAfzSh5gQS/qFqIyjFEUI5x3l9lNr
         R/yIsuaAtmNPhm/1e6maqY5TwrtWTXBVM9Gn8GuxITZD0CQ3PsV7i6dVAcCSByahXTGR
         5fvL3Kj4C8GY9JjpuLmhrLTQKJ0PcLhfeSPhwwIB0tnkzDXjQKPFH+gAQwG7KxXESkdu
         musrbh9L5xzU8OLHo+AoJ0AWoSAI5mdC8PO1sWksCBobfztW6ACBhalN0Z6F0mCiXkdd
         wpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792620072; x=1793224872;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekANNG852YX/Rv0SYRliAvOikAthVPOfNHHk1KWJgg4=;
        b=j06vGl71KkezZbMB5d4dDNfspUwRTg7h52jCwYynyJd/mFKG/2UD5jxHuEBs/wt1Q/
         lsf3btDDastMmcVG98FnEA/XDPPJxt8iy3G4jdWcwlgo+8GjYwMei80NAfdyxeJ8VtsN
         1ntvLrwKWoXfDJbB3fV9cJJvgmRr2+xU5rAK/MzBUZXJGrpeu7hmqd4WwFcLgl0TaYq/
         LgXb5LZgbSW906Kp1enkaREVQLaxbLVWCksQIMTCYZrfp+y2j0wnFtGEFdXZO9irILAi
         brpUgk0BTRuO9RrWQ67iPJptzSqrbp9Y7zH1G4qKGhyK2f+aMqvyMGOEnQB8xR5NqKpj
         EiFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyP8xoIYZapnfEf22DqLVL7HqvP4NIcK9y5BvN2nbDBPam5yvx9NxCJAxL6NPB8XCo70eCfUBoVl8k/AY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKFWnB8CpcQ+AjHuOn4DCxpFIKjYFYuu7zAPfOAL2haykYUVrv
	2TzowYeIvnek4KWNH8w+3P6vteeKzNzAJYL5UYhedCABgatr4QwyyMoT
X-Gm-Gg: AYBFou3TRAeaFW5bAmfzHlXW8u8qxcHDXzadNxq9hqwUVYTFuuI31VCim5RED++qbLr
	eBA1Vp/3GszRnuojhw07a0JJmJD6XyAk+Y84Swm5grnkTyt+mKhaHyhssMwd4fkHbfq9oY50lxG
	XF6scXDOiQbrtkrPG+zozZZc/1KdPM32qRuLWUJT5U2zHDscDtcVYigVBw7YYBEV426LdkB5QbA
	Y+yRcEBdhmvZzkY0rWia+JmpCskOHrtHsYHBnaqgl5VFGABhuRuNUt3nSccI0N8563lvXKj8T+j
	bgAOkm6Wq6qcZk4ap2nwuDXZ0AyxdXdzkH4FPBeXsGkDhju9u20UhuHmRGScf1jZ0pbVD94AyOZ
	tbmCeBg6Bz2R6J7FnzFXxMSbGOIjpNItzhBGIWidBEWhlo44yo70U74P1mN42rVpMbGG5FemPaE
	k0LQJgIK8FN0Een+mfShUtast3b7+zlHJi2d1WtXErnwfTyJMz/DCIGnsxKsRFBYegZqgjlPZNp
	BH3K2EwEfuQyxJiuu0xof66akZXtrtZ/HKN5nTX1Ok7AQauzZPQ7pzsQNsPqXmfZfLrx/SyeFl4
	Qd6ii7on+RBawfpMMKspslmXYOu+AJukoGDRdePjtAi3p/6OJQEFhUbJYXZx
X-Received: by 2002:a05:6a00:e86:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-8a089d79060mr2663523b3a.48.1792620071973;
        Wed, 21 Oct 2026 15:01:11 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c05f4sm1334306b3a.28.2026.10.21.15.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 15:01:11 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 22:01:10 +0000
Message-Id: <DMAUS3F32198.M27YWDF2F3UV@gmail.com>
Subject: Re: [PATCH v4 0/2] tracing: fgraph: fix the quadratic shadow stack
 walk
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>
Cc: <mark.rutland@arm.com>, <mathieu.desnoyers@efficios.com>,
 <andrii@kernel.org>, <peterz@infradead.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <kernel-team@meta.com>
In-Reply-To: <20261021174406.2891598-1-vineet.gupta@linux.dev>
References: <20261021174406.2891598-1-vineet.gupta@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 10:44 AM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> On a 60-core Sapphire Rapids machine with 400000 idle threads it took
> 227 s, inside a single bpf() syscall for the kprobe_multi case.

Acked-by: Alexei Starovoitov <ast@kernel.org>
