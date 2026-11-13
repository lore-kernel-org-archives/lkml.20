Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559050;
	b=s2KFdUXTeC3HSGiO4rnpoIUHgtggeIt2CsEPWzajp3PqQf23Um/qJndr4DYoTcfXfsE3
	 mrVkaqHD7b7iVbYEaL+DuLh533KCUuyOTslHZT2hBw4Au+QMSmUotTx0LrVeLAivni45f
	 TvH5IWZCqjlfawHKU78o0rye33CyzfmH7B5dXzYrW/Xw31QzRXDV2zrJJw3FP/Un6VItn
	 x3NDw532Qr3U+0609/EjVtg83Jg/NbWzCwe8P3pC3NlfeakPmdSqF1nN50nX76dbhHpLs
	 +3nHERiPcJFNLDh78ZoVZIpIqDC6gsU/+hL/Qi1FK4dGCwiPdKHhCniaQxHKuEct9lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
	b=b+HPrZZoYrRSfQCBAsgcuwpMnTPBBIn+iLJuUipJjfiW0h2YjVh2+oyLMxzoqaDX+u9n
	 KHMJgnbY006JikHrrnFULpIPmy6PjdG8oezKuTM0/XgtDugX6kGxBYpMBCV91CN8VBhrQ
	 u85v8fPNp/VQOvr6uOsQ7t4Dw0Pg7VXKtChAxXhAiSUCVsbKXQCklimDb7oONfl53Y8sa
	 Ga/FTkyvrnpYhKTXQRYm2Y7FdhPOY5UeFWbmRRGdSpqTlg1lxDcSWz73P92ltDHa4M+UJ
	 ZReUdK1EteSfCDKjUoktfwTqL7/eHv+ALoDcZukX6LpmARXomTz2ByiPzYkmEo/YDSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aD32PBvu;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A79606B1E2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A79606B1E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aD32PBvu
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso258607a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559049; x=1795163849; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=aD32PBvu9kNTQaV89p9UhhluQuDwjsxlOpcz0WYynBd7c2sZ8ptEabdXMyKoV5ZWs4
         W5QpazPGqxBK43Muc0B7nDBDrnl/Bg3eJ0yyGZxgubUBEw6Xxguc7FsXpeg+SB5iigkR
         6FbOU7bGojIdNULaDsdddlkd5MmBq63kSuhHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559049; x=1795163849;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=1Cm+us/CJcRwbrIPfm7wq8z+pRiImcYNjDVAB1XyZ7a75n6vs6+lTlSffEU8OPznT3
         4xcBodPHX1loR/WWHqJwVKT5zl8uqq5aNKTR51RlR8dVOP/oPRblfNoGUlSY1sNmGCit
         HSh7J6nMh0sSixdEYMamDiHKPF7/Q8lgtBK59mjsbVPpkEan0U9/Y1RMXKuqMmwOPBZE
         b8YWr7K7Uz2GqjNyYUFrzgM8XghlP1s0IxbkeHDX9l+Tn3gM5gMhjnBmiCGcWMyBpm20
         MmXYUUPi0G0VJj3r8aAy8Bv5sJQXTFXa0rY0E0kmx1cmLVNrAX2o2JGM6nu6gi/b2bCK
         wSQA==
X-Forwarded-Encrypted: i=1; AL+hErFXVK1c0SvQzBg27ownmrnsLOQxAC4x5De52yvtoygOOGdBQsHkb4btBiPWwXWcdJ2qnBieMGJj89fBRGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8O4ucCqyAUpUtaFisKE6xqtHgo7BVdd7ORc+lQUAAVRGr4BY6
	YfzkRR9YFhwdEG3X2wSz3X7fSeAmLwRMTchFYmOEzuNxcsHMxbvR1jLjc5HCxP1SBQs=
X-Gm-Gg: AYBFou3VAUA6NAbACPk7VNKV99JFeIkXWzJq3sw5EPHEghlk7Gik/PsGA6ZhERKnoTU
	nDYPIQNbR2yrZVceODs8rCfY5lC/caWGEYFgVGrWGgs7rDg7Qv6U6dOVJEhX5vUJg0UwM4PBWr5
	/RUGjBffGjSKfVe+xVkZxfPGXT9zfBM5hdptq5aFGUcNkYifMvUWojM7/j1BZVbY0I+uRHfvnkR
	l+AW3kUe21aqHs8LREDyLZ26Vj/Uochsro1QZu1Xh+EYLXqXgKGhXtYIrBiY/yYnIA4l77BJXuk
	afs4WVov+mbplS1yeO1AOy4p4u4pQO5oHEmoUTWvsnZ+1LOInSh1xcxu4z00l0Jyest8vh7/UI1
	t57UrfHpEFph/RZePptZ50OgpeZNvisz2cs2AhyRiC/xKB1Ef2MUcsTmrIp+XVBff+goIAeZ9za
	6FqxQoho31u0pW6QhmKuSVQQjtQESKxDvX59kLeoGh7Ezq5qShzrtc8gq/KAO8JArJ+MLZFi1Uj
	Lohr+Y5erN/Hd2OVIgSZdwU6NRZP5dbKvQoQnBQ7E71uuxq8muA+hI5qBIgKzVRcPxdpqZlUscB
	XUhVcvLrXYKrx2dB2Hv+g5s3pCiVl1CswgNCw7qAK7GaQx74rWiojk8rwogCyTD0nvnXBm6hFot
	HCNBI8OhJSHeLYZFazzkzHQ1Iz+haMp1FO8mOdzhG5ltcNOpZfO+SxttmoFL/3ojqM/CGkKMEWF
	jRk1RorH2jrxCr/j+BGyca/FuP4nkXRAAxdef+TDx6dnqfTEZOKepjhUp3ElOa9KHfRXTz0NECM
	5fMjPVJ
X-Received: by 2002:a17:90b:4c0e:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b1b07ef0bemr1782230a91.8.1794559049401;
        Fri, 13 Nov 2026 00:37:29 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm3384750a91.6.2026.11.13.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:28 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:26 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is disabled
In-Reply-To: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name> <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
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
Message-ID: <20261113003726.68aef052ac869097@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Peter,

Peter Zijlstra writes:
>How about you push that scs_is_enabled() into task_scs_end_corrupted(),
>this makes less noise here, and also keeps the next patch saner, no?

Yep, that's nicer. I've done that for v2.

Thanks!

Chris
