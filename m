Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426245;
	b=w/clqTTP+tYLnLKgtdoLw+0QybSSQ1wMrUxsF9qFxFnqS9SDuXo9ghgE5LdjPX3UoSdy
	 cHK5tZoHvSGZ0HLtZkpquqDfacMFeNwRUoi6MDiiQyrzc1zxDKtjBzuEk1IyagPWUMg25
	 AxQGJXc4F+98iuEQc5Kh+I9EURetYF3WCSu/UnZfIWSDTSzvkw0sIs1U14W2JSOZDXvuM
	 7jsda/35c5Y7AJ/J/UoWXvKkOBzakYI+X0Ar1MO9vpyBeB627wdjfZc6EzSohsiSlz/2s
	 YoZDwqY79WoaGZMUnXAIcF7+c9UV/lUDbeTDMRlV7ZrPR8aSrouBBqoJJkeasgbNRpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
	b=thel0/EpihC3w7YhiPu8RicQAJp1q0qmB1IHn9R5KhKx8mMSpTvMVj+ogIXNS1PdsQ9O
	 z8VeCtwOaLPG4QbYW7rlblg7mn15dHwRqHW/02O6Mcco4V3KMf6RMIYSXK2+m38amj2NC
	 VWpvBxS7M709G265KeTPFZFUYfbcINSEsmJcWPvTzkw03dLI2BIh59vzKIku27pnpS3GO
	 bo03uK+zeysSyN0WQ3BUtf04lw6JbU54iRzK8vHSzZsG7flPD1LuptHjWcpccG2PqhGpN
	 /f5ZA1/JB2T4EZN68j/JdyzKJzp7cftLXYx03RtYs1F3xkNDbT1wfEkSn2LLz2n4fmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Szh2okIx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E919606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E919606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Szh2okIx
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea19c28a50so498655ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426244; cv=none;
        d=google.com; s=arc-20260327;
        b=kewnP6k+SyuE1VPwC+cnbc5zMBo505TASweX6lEV+3o8IRA0/H67vOpCVktGLZmlLV
         fZXz3Azq5CR5WUF5DO4E52o5UW/U1f4v2P7Y1TIYKM7YKbzAXzLiP6Afj9TzjweXI7pu
         BZXkvZ8sarsdBxZI6W2AL5QbszE34p+OYg/0x/ZhqoyKN4cyIKeHUJtYLY96D29tk8er
         dIEG1RP1lbp6NA5ci6+T5HNQkSkKk1iZX1qceGFTwjSa6wf/m/eE7lWk5keaZ/qwuM8p
         qolMZlKodpyFgqKTtcjAIL4nKp90R6cqVAKMjSRasgMSQZ3i00+99tj4TdBA5EdVAYHu
         ddeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
        fh=EphO6nT9J2/UmcCxRq/WLuHMqLDyByYWli5ckqignsQ=;
        b=inI3rxJs+bAugXTwgeCzTQ5KVWrtuo7Oz+aM/qsCa6dWeGXSpaaQHOEYx2u8j3ceeY
         QDUxTvYAQhOm1xYpsMEdSfCJqEmUDxX73r0LtXf2EPdgjoM9vxwcy5+ZtYLmMfnXVVu2
         pQ4bRNJ+KGtB2TPSCatz3+/0jHsKPxvGfXaBSzIDsI2SV6BkMwPswoTNQajCZ8bXcsOD
         S8iNpMrnenghX3mqjdLyseHW7y61lq/c3C7C4zGneTYNKrxmw66DdUFuoT7e7E+9Sqzi
         lPRBttKaMZZ/JeD1xff7pPLpadmnzqmpAyj8UjffMhwDlRyjCt3Fx0j9splmgZFMAYz/
         3Utw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794426244; x=1795031044; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
        b=Szh2okIxPn42DAW4rJdqCEHxXRlzlWdQUlKv14FIT8XWsBz5vjlzjCzgn0FaVZJDaq
         39Vm/RZA8ElBOh5u7Mzw/+Py5wvddWw8SdG8KrjG/yyy8Ut6dOT2nB7Vyod/G7kRfDo3
         NEPXrzu6FpqalSZZElj1FedVp1EH7SsGuZAuWq/Fc+rmSEGHijFtFUjVehCGYQrVNDMH
         KupkNOerYb4ew7Ip/cWcDzIG7fjaaPi3kqNlFlLTFMK4PJIiWmJFryJmJWgX6dVYAq0t
         Beud0aSkg1ydIKiT7aLPx46cS4KidcnGADP8iFP6WwLwMu64NJpW1IQiHuhhjYL0ooA7
         u78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426244; x=1795031044;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0c78mVQK74LynOaPiL/mQdianq/QQ399Mugm9IGaPmE=;
        b=FvJG4YAbKGi03vnRK+pOWfgTRtDPgoIIvIOVDNDeXVpaKlpl4Z7Cz+zHA+nGgk6Xk4
         oU4PcM7v/TwuaPfpiRycMm6cTAM0oM3NkrblNfFtpg6Hu07jSL0/X1yCKFPBISLPUU/k
         /njr/JoFqQg4YCKrrFUpeTX0OtDAjTX479YaRGsya/GjAxAvqSIs2Xv62QSwn4bXWYG6
         BHUw3MBBiydaFCGLvllGJ6yxK8YwL7z5Y8qmIwnbRSSs1OlE2bShoYPJ9oEdiW2bg/01
         po7M6Rsrg0Wf16QKryvvIQzHc87TJlMWHvEcRduuLUvICkRx9YTe8qKZ3A5hMPcI+IvT
         yCbQ==
X-Forwarded-Encrypted: i=1; AL+hErHqTfP2rvd17H2k8vGf6wT/c2/viS5ld/nN1+856JIrG2yarA4ZK/q1UjMRa1fMVSFa97n+j9vaSNt24J8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KAt0tYEDoJ8vsaC+QkcsfCAXoEu4nVCf+HVgtzSd8kWAQ1PcK
	nYY0LvY5ShQ/T7JpupA8hC8wtl4f5wuWW9NSKT5A8s8gq6bcrJMxDI6KRJwnguGeFSoY0NSICeS
	4Lz+bpToUHXhF6og9b+xbi0xzGEhcc8Jt884Nq82q4w==
X-Gm-Gg: AYBFou3bvc4hSmAuoae1PT6bzut/qojpZi8Y4Z9fDHiESJFwopab0APCdJIw0h/Jhbm
	GjAH8+vZ+Wm9SINyfwwis4WnQDM2406OfggX8ScmzMqDC1koVrfReTaP/i6waLrVW5iptOpmrrm
	cvxEIwxrQnfhqiDKsdwY46Cb+1zFeMGZtuGGLVLl32yqXnEC9w348S2s6ePJSTyFmz/qgIzHdfs
	ODbAtoDZOg3/RbgiK22e4Fo1TvKLeECUPzziGsJC/qXfMNDoerDspUlI9c3ZjFO9mh182mOA3JW
	ye0MaZBQXEjJiaeqjDYAq3M/w2sWtKS4a8AUcYtCjRw84o52cin/8Y7/uRCyE9dGP7UhoWcXf3q
	UKrQURSmVecw9n35F7GT4SL7NEMukTNE0ia3x5WmWTm2Qisuy924lLmU=
X-Received: by 2002:a17:90b:3d82:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3b182d37a0cmr4916155a91.0.1794426244317; Wed, 11 Nov 2026
 11:44:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-fb8eadbfebab@sentinelone.com>
In-Reply-To: <20261025-b4-bpf-trampoline-preempt-v1-0-fb8eadbfebab@sentinelone.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Wed, 11 Nov 2026 21:44:07 +0200
X-Gm-Features: AclHuK8saDkuU9yD83aEJP9vw27K78S0OdlGm4k94CqvQAsOXBX2ygr_2svCp3E
Message-ID: <CAPnbwjrf-X-p8JSkF2xcxz9weP9XxaLCiRqQLuCd=09pNQxtSQ@mail.gmail.com>
Subject: Re: [EXT.MSG] [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: mikeba@sentinelone.com
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	JP Kobryn <jp.kobryn@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi all,

v2 is out, following the discussion here. Instead of keeping the
programs non-preemptible, it checks recursion per task through the
bpf_ctx chain, and it now also covers raw_tp/tp_btf, sleepable programs,
BPF_PROG_TEST_RUN and syscall tracepoints:

https://lore.kernel.org/bpf/20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com/

Thanks,
Mike
