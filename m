Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E65218BA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699365; cv=none; b=RyMbXhhq0Nf94TOb7o4DQ2vu3DDkmfwm/j3tXq/i+U9VzdneQ9EoleCu0i2pOhmHy04V7vHEMXYyImBbooBU750gAjGQfUPgKUmkyLyyloqaRck+HOBx3wxqpMKL7PcS2IqQfBAnAArpBXNgZUzlNdFmbbO7i1uQnjvZv+eYlho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699365; c=relaxed/simple;
	bh=NfII3LN3Gw72EP3w7593Da/fsSb/7y6Qp41qe4y8lCI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=vElgOJpMkZLkORuFCuPSes4PhOiZMIf92v5xlDawfMstix054WmHKQ3LSE32EIvQlVqFE2bPB1frdMOuiJOKBhGgQ8u39KkCeEMm2af4+hTg7CjWxp0TjVzuYQDn9L7xWW9M1t3kIon3awKJEMNIpevcT6hot2sxt2sTqjuN/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRT8M9Ek; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRT8M9Ek"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c9c2df74so217475a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699364; x=1791304164; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfII3LN3Gw72EP3w7593Da/fsSb/7y6Qp41qe4y8lCI=;
        b=bRT8M9EkklfBRftJTRny/k/9gFEGp2zhCJQIdqbRYMDPeCw37Vfn7/3JSV2rrs0EXQ
         imBqBiEkYPGlGeqt4ZtHma52a+8Wz1KYKq48hsgArkxuTMk9z4cXPvL1C713vwGDy/60
         zaAO7nYWgziU4RRAtbvfl9ddwwhTzWh7nLC8mfN+C6GVWa/cMbxgYA3B8bGlULofO+7s
         EA2nptm5SODA5WtiPm1OKe8aN8VXP4KzI0HeMngRezuOgOF1fKN5mmUwUHLZ163IH0Nf
         FI8r0USmdD30SoO4RCUlgDaFIBfN/mLht9w93jAEffddnzqL7n8tMn/io6GvtqpegrlL
         xjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699364; x=1791304164;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfII3LN3Gw72EP3w7593Da/fsSb/7y6Qp41qe4y8lCI=;
        b=cItcEHLaQPvK+Kolujf0FxhJAQW+vmulr3N8mvfRdgoeAdjWlyEiwIdWDRDLeIVfjz
         dfYFEfan1sQfvjk5N92AQoWKuZ63PAT7SMRYXNiINskb/GBz+Ln88pEZ65by/K0pWlfg
         B4pQPajrSGivbEJqQ1zqfpyZwuS7IO9oqGEs9auj63VA5tLrWlKwBxy/2kR8+iW2alpH
         qED5Mw2PPM0Q7rUJwHMeXeDo+6kd+zMMCdRNo3fvng8atTbmgh7wxF53UccCzsaHgIy6
         iUvACwkRwTCOgpzqOx15ItFH8TVFS7mTh7kznPOjg5cyquM3PAnk0ElOLjge2VDkE727
         gesw==
X-Forwarded-Encrypted: i=1; AKwUvBz9cbKsx+8wSXvWdCvpTGGfmmSy7GhDhLMHKf9cRbH7/VC5EmUvpt4moC8kmc4PsS9WnJgtc0INY9Q9vCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJixet5EgJldk6AUuRolgYHedQqEhVoFhz27S7dZphLz5rHtf2N
	i+E43Ofdlf+JsVG8hZ69k5MMMlPj3XOkn0T31Yf5XFCOVHpZpFAfFKuY
X-Gm-Gg: AYBFou3s/0wsouJkTMyX/kAs2/o00EaMdX3PWXLm4MdpAK7QaziOKqmX2PjD6lYMu/d
	2PMaT3hde49yoGLaK/+omJ6roWFj5pVz8FkfJ7rHSe66+C3HQ2jgbBw0K3s4fxmCCO60yrqLsJO
	ARQenG34heb4GYJPLl6bWcmVETLHRF+5awoVpfzpobdmgJEN3zrCe9CAwCRN3vR2VamSssrwNls
	9jOsMUlwjprEWFWGRnwCAilNgJNDu3TcHQj273Tw5EOhfldvZ2E6kC09r8BahorDV2/8sfXYt8F
	875cpjozW2S1Jy0Qbb48CvCYqzwaJ34XuRI79Atc3RSdXt7xPdQRQ1VTI46vYTm7XX6eBhs+bAi
	Wv6sq22ufgTaMONPTrw8tJc9pSCBtFJHKg3Bk1qiqGwkyKCRHUYZ4XVAkV7TwT6qxnz/Bk0P8bH
	Rn/52Q1zUM/hg3g7IUlV8g/0y/prxDojQCUGjaKKeQWDi7M76QZeRL7VYmqXIS11SpLfOxHcfpV
	h3uXpp/TUltp0rfs+Dzt2PoOe81uq3vmFPcrKpSsOggR0s0xCyWnZDwrRy15kknDeUwoF/MIVXu
	PQM=
X-Received: by 2002:a17:90b:1a8b:b0:39e:3d38:7ef1 with SMTP id 98e67ed59e1d1-3a49c11ae64mr1853108a91.10.1790699363711;
        Tue, 29 Sep 2026 09:29:23 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497e90180sm7148752a91.2.2026.09.29.09.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:22 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 16:29:22 +0000
Message-Id: <DLRXY2AQRPYP.1YQ75SL3XHQHN@gmail.com>
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: Use /tmp for temporary file
 in d_path
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Pu Lehui" <pulehui@huawei.com>
In-Reply-To: <20260929083924.1851840-4-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com> <20260929083924.1851840-4-pulehui@huaweicloud.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
> The failure occurs because the rootfs created by libbpf/ci [0] does not
> mount /dev/shm, causing temporary file creation under /dev/shm to fail.
>
> Let's switch to using /tmp instead to fix this issue.

This will break BPF CI.
The test was using /tmp up to v4 and was moved to /dev/shm in v5,
since /tmp is on 9p in BPF CI and 9p doesn't support fallocate. See
https://lore.kernel.org/all/20251206141210.3148-1-electronlsr@gmail.com/
vmtest's init mounts tmpfs at /dev/shm, /run and /mnt, but not at /tmp.
So fallocate() will return EOPNOTSUPP and d_path/check_mem_access
will fail on x86, arm64 and s390.

Mount tmpfs at /dev/shm in mkrootfs_tweak.sh like you did for /tmp in [1]
and drop this patch.

pw-bot: cr
