Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793741313;
	b=bKOzI+uvz3Z6bW1DYj/QzHEC6fpOZPp6AWAZ9L7uGNN6RC8B4HTBiz72arr+5jD7noQG
	 /1vIp+4bDkubkNEtMLCy+i1a1jFEoblIWMTXX0mJWYnKPmNMHo8h8qlUtN+l5yxRcK01F
	 RZJTNCf4jb/2ZF0Mh6L/bOnbKIPi5QLSNk32PTTjQHjFLFRGVqOBs4Si9COWPlhsnhNgx
	 pFkXFkYVQbIFyWAe3vAJw9eh5UafwjIbB3jb/eEvKSRYnA+Y/wq9aOiODmgBxGFS1gtiN
	 IA7wvVi8H8EsSQ2conZJAkkK7QpPadzB/hQ6fe5WaZfroz0GoKfVWNb+l7asXRd10bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
	b=MQ87n+nvhlGgPOS8O+4U49FdLwCzr/qtEIHAAcgFReMJoWNK26ZszHa1qDvWssn2A0t3
	 NNdd7he2Yv/+iSBkVywAWauL5TyI6Xg03fLLo4AjY8Z6R/OlPujEtmqweoGRhjQhtph0j
	 f7x55gb3VCe4VMhFiHJK/yi52Fk/zLdH+5U9C6Lsg+Z8o614kcOiOJI5zWEjSVXkiMN/X
	 4YDfuOhy7Ar8R/E5iks1id+9MHaVf/AQZ+OKI7ra6HSIwgsSe1Ti9OxL9PnCdYDcmzbei
	 n3V12hWKEGNi4+KQvdJROQ3THwHzZohdAt2SPhamsg7BL1RnSysZv+BtMieODofKg3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=RDzHdzJM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F83E606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F83E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=RDzHdzJM
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd63b18598dso1326a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793741312; cv=none;
        d=google.com; s=arc-20260327;
        b=EPHhEvaISOVyaOJLZIfmyuy7wyYYbIPn3fuj4uAftQkkbQhFGNsSP6oE7YS/kAt+SV
         JM/ahgzslZ4Ge2dfrFK+8fhnhmZxwg0QYqJlQhPqcShEEG7//5QRMlkw//I4qI8+5KrM
         5fiUNzadZra89xJoNu4JQ4uRdn0vQyLLzS7uex+QjztxHqnl23QRIRE0CVCx8rMqiqWn
         7QY6wXLIBDbAYfd62tpr+P/1R5DpPbjeJT9P9B7cIiqWwydPyHsUQBDejju8j5ba5uR2
         jJubns1JoO73BC+aBk1IX/OsQrH42/xnpExD/KwQ5NDgWWQwg0rq/KcsKzt9KIgHpK74
         IuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
        fh=1G/6bAhT/ZuS2Ih9R0Hwx+/Igfl9Fn8CL7+PoyKB5Ss=;
        b=CkLmf3GC+5EoUPN6YuwRBzGm2HBJ5i8GMOX+1MVfTQPFIrXPawgcHyRXMgjL3p8mb6
         TuFBFOXIcdtTTGcE/KC50kUW5HzvlsyeAst3DIoYwZyR8oBK8tmMTLlaq+XPoYDOkBBJ
         TRnsRDrBGhFCygwn/KzHoZyNfwUhZRGJ5ZdwhIWe2y3YZjjaLAIeLeRrOJxO+uS5FVWV
         sXfl3NX+fZD2Pe7JmIue4/7Td+jRmfBEzKS9G+FabEe1ijfLr35jb5Gz3S0aIHSTzt6/
         5Cz4UGEotK/kq7lwve6jx1Lqng0iwmqmRZYfPxJNVY63g/K50ccsG6CVWQE4HWSyp5Oe
         FPJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793741312; x=1794346112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
        b=RDzHdzJMeUfiUq9G/7lFmj/hNY8UMX6ikh9NfglyTlaT4ewEuBKX4XrY3AvxwgX9zO
         iUmqR+LBXrg8omLshdjCH+2hnkExL+Dl7U5QlSCKcN+DJOyfyKHkMGLOIS9AEWM/DNfn
         jck57X8KgP61dTHGpxXglashRzCrboGRhKywwO1xQn3xbVDLf3cqF1JCAL4VFjOkr6hJ
         STlWyl3PH6WF9liLzVJVT0VpCF1Q0FjzLZ64fBNcUV9Le2G94K7Dz1F/mpeQWcC2ZQL9
         Y4WEN4MfiIOvX89YDWCDxeOiRPuaUnD1TUTRspdmv8tJ0gX+CxJv8P7OUr+URmWZ8z47
         kbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793741312; x=1794346112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zmm8poGbAfilcXs4zw9T7e9Y7uCQf8mtPuDLoGEvUrM=;
        b=EEliycvlnJTr+v8JpZz/XOyoPOUWsgc0iO0UBNFsGlmn+qZ9rbDmp51AmbF0fL1wEJ
         apChl/mKqiCdsZ2Ml4c0nI5o25fBtVVbUn4zmbiWNSk0ivryJ7QC6xMp9iZwb35M5YmV
         wxpUExqSsfxx/U+18gmUM5BmqP3/NmqhToMkVunZehtLnEU7cllatTXtCF9KQGvy8QY/
         hhRyjvPIdFRIJ0Lae+Uy15N3VkTFMQ6jQCocrG7F3TxKJALDnZGDI8bJgjxZjJ930YCv
         HersIdk3U61F52H+aMOs2rh1DKpQ8uxHMITtNQf2aH5nt+CFUfvv/pcV2HwAfxPB3MJl
         Kc3A==
X-Forwarded-Encrypted: i=1; AKwUvBwMuy2oyVBE1CkdIPLr6z7BBnu64uW3wi7zZQsHvN/WdqzCEr8lPU5bFTApIYhp1PAHrUcgCs38DK3o6Ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KW7WbWDOBkoRfT9ZRvk4eK1iyfpd8kR+ryZO8dABbKjo5kmCg
	WOHJCucNCEnDBfZGLMbtLAbetJNrJcNpV2+zK+A2zcHCCHXODXV4g3Y1KdECfvNX2/1+FzOSIPo
	YA6HMGqU5BgV/Q0uRFa588ydlbyRZJnTmXY20PriY2g==
X-Gm-Gg: AYBFou1VBy5V4zlgm823GoL0JazEBCdILStFuY64FziX6hDY3WikFo2SESMamjLi0AD
	V5k2l3I9oSOycCm3dOBBJMIat44ZaIbcRtZH0LfFaRW0OD2j5bcdbG44f6u2BOGJZK6h7U9uFAf
	TdnVawY/iMVwabKWzy2hVDKh2gYMKJOApcBFZf0l6lfap6VaIkHuReEUohbSsYUPSAxWX4MOcVI
	f+rJyQKUzOIHuYX8fGn2+BgQ7HZ7v+ipqYM8N2s0jV7C61N+UZrAXwlTf6H9wz5MAsEFiGjQyux
	UeU9k2GtMbo/+IpCPmWYs9Fc05dwW6lozPxsek0yOiFWnt5ylqm6hUqvJT5+ipOfAIqrlo1xZzt
	vfiBKTRlbA05/ZnZp707zQPSNIyVSYFt08A==
X-Received: by 2002:a05:6a00:6403:b0:8b0:4ee8:10b7 with SMTP id
 d2e1a72fcca58-8b04ee82e42mr1269223b3a.1.1793741311690; Tue, 03 Nov 2026
 13:28:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
 <DML75890DWIX.EYB690LPBM1O@gmail.com>
In-Reply-To: <DML75890DWIX.EYB690LPBM1O@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 3 Nov 2026 23:28:35 +0200
X-Gm-Features: AclHuK-9dIJ91oRBVvYH-QEQPVhpa7EQfrKjcAYWov7WHRhtMGb06DwMyyDhFHk
Message-ID: <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 01:49 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> No. I don't think we can switch to per-task that easily.
> For your use case try fsession. It was added specifically to match entry/exit.

Thanks! fsession does keep entry and exit consistent. It doesn't recover
the skipped runs though. I ran the selftest scenario with an fsession
prog on __set_task_comm (7.0 kernel, lazy preemption, 20 rounds): Task
B's entry and exit runs were both skipped in every round (entry_b=0,
exit_b=0, recursion_misses=40), since each run still goes through
prog->active while Task A is preempted mid-program.

What is the main obstacle to per-task tracking?
And if per-task is not an option, do you have another approach
in mind so that runs of unrelated tasks are not skipped?
