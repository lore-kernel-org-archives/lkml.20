Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540980;
	b=T9krsT7rsaFZiuxivSpF1fQPjIMg7bDtSIp/YZCrplDL0/mcEu66OK/9cVG/kYXXQVLW
	 qez01nyF23zNfM6BHLZgYVkO42MYzUkSrTqrGMsSetXbpNvgBU25xnZHJuVBSBbo/sP3w
	 vIMTuJY7xKkvh3+2NAfD8n+D0qg3TO6AgLl/oNfS0hjAQ+zqan46NCiWpDExO6X1ldAE2
	 21FHpbUzU1cqgebq1kN9xwhF9pIlA7KdvtbWYmlrdb54YUnboMWB5nBsTbOGEtIDoalTe
	 4Jzwz+94rEi5bo9OmK8WdrTM+kLOdIMXtOi/zv8Hj7g0GWnqd7YE0cdL/QchueXP9CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=E6DQo/iSAc/GRocxDOVFdU5x0X1nUJZ/jw8Dj2FTgzg=;
	b=nEriaA0XIAk0Y2Y9MdE5b4EBhim+jGC7Hy4mgzsA5uzfwZaIMOnoU2Hy8vShuwnHcSKm
	 NQE4/wU8/VX5sH9mLesK/kPZ3+DIFgDqBjwwzHSvVPxYwS8upk98NRoCIe2b+VKvvwuCG
	 DoavAALJR6Oc6/c4w9Fc+pfLH8j0p0Z+tREW4UqS2kl7eKG0jllLM3lR81tiPbst36ZQa
	 bhqxWu9setXjklaFC2dX4ph7bqBCq33nDg1bcKoXHu6jHqsschNg5oNi/DS+K8zsWemm8
	 LuLNVDxZVA8VGgsisbWxNYIusa74DxNnKc0H4lhLTWgyYlRA/3RB1TQ1PoS4waClDpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RgAF5g69;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BEF606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74BEF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RgAF5g69
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so173530a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540980; x=1793145780; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E6DQo/iSAc/GRocxDOVFdU5x0X1nUJZ/jw8Dj2FTgzg=;
        b=RgAF5g69icJGlvHbD3mcZZXrpzRYBuNDgAgE1YGBHzfV8HVTIcmBfgDNOnAOI/KKxa
         mqpwhFNZk9+nkR6JGkbVD1hQfLVZMGztuaEDZewo8nUn1TCTnZFUyvOpcce1BUXQVG2c
         ETjK62f7ofcKqKqpE+Q6/hC/nvpbGr1DwjF7ftwk16v5eUC1QD4WWPh58qQinI90jhjt
         VEepNPAu3BOAjH6zRApL5EqkMw0Elk/yqJF9sOkuut4R0Gwp3bEqLNiivkEiVjNF4PIz
         YjJRzpab/n0QR8qKFnMxKDWaBTdLTO0Sme/D1KkNRIla+1291rl+s0Kemw5Dpiy+STgV
         SY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540980; x=1793145780;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6DQo/iSAc/GRocxDOVFdU5x0X1nUJZ/jw8Dj2FTgzg=;
        b=TrgNKvJY5qLt2k5ENPR73Bddrnd1bmndyBBPXP1jqkP50H7cr/d5a+PaIjp/GFN1DF
         kuyuAthpR+p2CrJoVekrEwHRVBG5MXqHsgwj8j9GBKjzVOcWJTs+MIcybdPWi7rA8js/
         KLQrIdhnWXmMyLr4gMXNYHPmGDW70p32KntRIxP9xU2p6axCNXoztzJJnaVI/P4IhOpE
         9D13gUVl/bFbjgaOUgMbTOFae7Kxnx8e8fpBCrFOTNfPUUuyHqV8J3+JzK8iX0tz6xu8
         a9h2pPmyHJ3nTKkXvRB/H5kIM4S0y3492AQVvfm7wG1T3u4fnRcZtU993fAL1chN3jC8
         DLNg==
X-Forwarded-Encrypted: i=1; AKwUvBy+SEsjz+i9k/Ze6vPtKh32yzUTwYMeQMZeQf3UPnr8NAFWUAAgaADSPr+diBJOAFniwtqndceFl+GT0q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoUOg0UOzQtr5ihADcPvAs00eITm3PIApOcYXW8hoGup2Nx0Ps
	Dx7fjYNMwe2Wu/j8agHmEL3899vssal8PRuJh+Y9mo1w0ixSxl7xeIfB
X-Gm-Gg: AYBFou0ObhI4953k1l3JzTc1QrSqZup4/IWnCFbfC2CfFfDAxucjZ2vsZ7sTDbHZRzu
	0DkS2S3htIzKuRUUXPAtX/sRRtFEBGTC9MVoU3QHOPZHx25H1E9VDTBxIJ0f/nOdfH/MSSMzFSk
	Lj2FKZUFJ+J/TJwar1RQuEqEkGLFIpcm57xCRoDVf/wcAIwNxT5YBz4lXaeW7zpsKkt/fUSn/04
	wVc7+E6aKd/68zNQAHYSOTB3kBjSlFduuFecUN7QKMNv0BF+l5iQ+dx9EvX4ebS+GlzAjeq7hcJ
	dLpefYdeHYVGyFqf8yM5YvdXndjWYKJO91k6EGnIb2s5XuonQFt3oO1HsMvk6hPADc/m0PUzyTl
	6o8ojlKllhoz5jHhkbKGrnWsZizsYATK251GweVBFUNMK4Obm6aKktCbOajfcST5EsGLeK8fRxa
	uGTUX5qKuWcYrC2XCUC41LIkcYkjSEJmGAv8DNMUStSjp2qSiRGeC0e17deBk/+bM0xNxNy5cY7
	nGWowjdeScJCJe9BkgJ1u7BRGbc7o67AAfb+7aDwwJ/d39Ag0EB3cnStX9Vp+wcS6NmijquUVnH
	Z2A=
X-Received: by 2002:a17:90b:4a90:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3ad86e5ae73mr384944a91.3.1792540979783;
        Tue, 20 Oct 2026 17:02:59 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80912f26sm1424756a91.1.2026.10.20.17.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:02:57 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:02:56 +0000
Message-Id: <DMA2QS9N1LRH.OIOET3SWXS1L@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Hou Tao" <houtao1@huawei.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Expect at least one kprobe miss
 in missed/perf_kprobe
In-Reply-To: <20261009-selftests-bpf-missed-perf-kprobe-v1-1-c9d0f75f6f99@gmail.com>
References: <20261009-selftests-bpf-missed-perf-kprobe-v1-1-c9d0f75f6f99@gmail.com>
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

On Thu, Oct 08, 2026 at 06:49 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:
> bpf_kfunc_common_test is a kfunc of bpf_testmod that other tests call
> as well. When one of them calls it from another kprobe while test2 is
> attached, the kprobe of test2 counts an extra miss, and the test reads
> 2 instead of 1.

Which test is that?
The only other test that calls bpf_kfunc_common_test() is wq.
wq_callback() runs from a workqueue, not from a kprobe,
and serial_test_wq() doesn't run in parallel with anything.
The extra miss comes from test1 in missed_kprobe.c.
It's a kprobe on bpf_fentry_test1() without pid filter.
fentry_test, fexit_test, kprobe_multi_test and many others are not serial.
Their bpf_prog_test_run() calls bpf_fentry_test1(). That runs test1,
it calls bpf_kfunc_common_test() and the kprobe of test2 counts a miss.
Pls fix the commit log and include the output of the failed run.

> -	ASSERT_EQ(info.perf_event.kprobe.missed, 1, "info.perf_event.kprobe.missed");
> +	ASSERT_GE(info.perf_event.kprobe.missed, 1, "info.perf_event.kprobe.missed");

Yesterday you sent the same change for tp_recursion in the same file:
https://lore.kernel.org/bpf/20261008-selftests-bpf-missed-tp-recursion-v1-1-0dd60471d655@gmail.com/
The cause is the same. test1 there is a kprobe on bpf_fentry_test1() too.
No other kprobe prog with bpf_printk() is involved.
test6 in test_missed_kprobe_recursion() is still ASSERT_EQ 1
and another test bumps it the same way.
Fix all three in one patch.

Also pls send selftest fixes as a series instead of 10 separate mails.

pw-bot: cr
