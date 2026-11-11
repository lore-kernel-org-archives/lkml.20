Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380053;
	b=YZCtAY3CvMOaabXmd52xdn77KJrXfD05cRGg4YhsBjoiW55AdyJV2QxwCMc89jfM74oh
	 v9XYLiqwJCBYhROPN3qERcppiHB3Ir4dI17rLa5zGQiqcdn8qZ1yLXwnx8E4fSJC7183J
	 TnOs7lgKpTpxk3R+nWJ1GAzuIuWYH19qa9G5C81LAuMGL/N+6zo8NojDY06Bh74QDDtwH
	 /wS7Xb2St9Fzan6bQIIIwL/I2qy/mAkckXmnqexjQZ183/0MkrWSZbKdmFGZNf9cmQqg5
	 V+8M89qEUZvdrXAt3RIPsibHs8+VsKmjF7rAo+dsUhXHGYmrvw5lALgsDyxqiPvpc/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YpkwVa0e5p/3HxWr1XgWTgZwvj+qnPlEkzILctELff4=;
	b=x3a9SNTIPGpYstAqbtOjkL4/mLq/cLwBCaTh+nx1jZyTUPT6hzpCj/iryXzTpLwG8C1P
	 g1UvXRY0POa56STT+7JQAVFJV9gd9MEQIBuRUsaQd8xNKZZru7B2QaNT67dLe6EvmR2RY
	 uqS/UJnlD8S7e3BULQ37W+q/OOn74byj4EcaJjrMQZEjiDvMpKOd9FM/RlMyAPNfPXSsR
	 ySlLxjJMviKIeGTLR3ykgOUhMpvinHTi4bai/kTZQ5Nel8sRujEi8zResgYywjof/qSAW
	 h3D0zM9e5uTsWyX3fN7MwzQI9GMIYl21I7s8zRpNDk8jQzjBzggln3hk8Ra3DYThcgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FwJd/tP4";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B851E606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B851E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwJd/tP4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37000e7234bso657121eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380052; x=1794984852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpkwVa0e5p/3HxWr1XgWTgZwvj+qnPlEkzILctELff4=;
        b=FwJd/tP4RrafDENe0B717GJUY9vAgtkGGu8Bd+k5XNzYY2RVCU9JqWlqclrbOElg/X
         lI5/anXjEr2CKTJXixAkW3SgQm5vKbq8WaLEcDLEhG5cAB27Y3HW6uDa/BMDlwtac8Gu
         ScimaUZLfi4upcrx10w2YsPvAux3KgpuVzM00khjnqG33j9ofmhCWD9D6jncaufHgiR5
         Ff5dlC5ag9ugx+HfEbOTZRTTUK5w9idX9TS0kJGhYIpaDsJ1dNG0vjy0KNi2X49tJtDB
         mAkqne8U9m+AMgimImEM7sZmF3GRqMBe0Mi19OVQMPg8MnOJY76PxChD+Emq1wadmkLO
         XKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380052; x=1794984852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YpkwVa0e5p/3HxWr1XgWTgZwvj+qnPlEkzILctELff4=;
        b=veMdKoca2qaj6vCiCBLZBHhmirPHQE0qLxlIG4B8Te4C0RuSGsnpSUyDaq8TPs7cyQ
         6def7IEtLiP5sHuLVzHiNRNSVZHTm4VziYjuauehI/ShbZDK9RY0culY72tPor6yR4Q+
         8uxGqc0KU+mqRGaOkThOqLwz02+8csiHvpYJIEsxbWaAa21gaftKAqsgGC+C/GQbPp3b
         DlkOlisa2eZL5KZkTMijMZbECnQpnUuAvmDi6BM3slfnr2afGJRZ46lDMRo83AN7OBde
         0IdBBUbqNU1RtxbQ4sY5++77ONB68ey6zpJmQ0lfIoUjBLgZjJogH5f+kRq1+Pu3DPQG
         U9Kw==
X-Forwarded-Encrypted: i=1; AL+hErEQgOlcdhMXqni1I1+eOITNOOgImXVB7ZulQJ2n4SPjRf/WDSAE51v1wlRFu6m1wVOnj6MOvnbAcJSNPPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/63/ozlMG5x4bJsp8yf0xXw7Yrtum1+XcBTU4oBb7yf1Ssbrkz
	fIOGxU4IFf3rOEo5PoNx7jEk2+b0j6IQmpaIzfFIMRO6txSWTP+AoCqr
X-Gm-Gg: AYBFou3qdTGSuB/pEq4ldOHXnw/zRA/+wFjL4JWRHMHn7RkI0idnQ465KNhhMWNpjrN
	hVguyOhw2m+cxekrLeBs1Y7SW/QC/DH2RNhNp6OKf5QnXkEgSmHhTrO4cqwkGQ7SnABiwG6htUL
	Wa2ujwU1OOSLxo8yHbFRHXkk3PpHvx+QPTvy5TXLxfdzorE/FxcO/9jipm+4EBvy9XZ1feBM2vE
	ZjqnACRJT3N1Xf2KQV3QvAf/i5gSLgclelDRPN01/BYoiFbFNDDsUMkKGYRuy3kuhBcwFNPtzEF
	28g7pB6KIttpvMxnCtcCXIuAMS9xY5Hm/q5lpyxFsSNmIOrRjs5BJGLVV1i2/3nUQtYoD3UzVOw
	UsTcxYum9ZLnhZYBgkOWa0831G0f1hqzfVWz+E5uVBMhLpspmGu/EnNffShea/F+g5IGv8Jjd4p
	/EVDQS4o0eA0LByLXeWJQrRonXh7VDUV8L8ZFT0JCaougLOiOh2GXfGsVcGmI5+7EHHq2Aeak77
	wf6yCw6eFzf497g8fvioFe0b0+MNQmDylY5pykYtmpY/NfVKFhlMZpZTzklP0zO9470QMTwpg+4
	Z/IEdbXFCpXPqwm7EkUmLyOTANMKvvcIWv3zjxTnjoE4XbO11k2bONLC3v/Ua3tAU/g3B+ofsFn
	jewHsCtmO
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b3c02f06bdmr1500507c88.9.1794380051342;
        Tue, 10 Nov 2026 22:54:11 -0800 (PST)
Received: from thinkpad.tail59a646.ts.net ([112.199.224.229])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm11879272eec.3.2026.11.10.22.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:54:10 -0800 (PST)
From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	tglx@kernel.org,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/x86/amd: Avoid double-decrementing n_pair on failed transactions
Date: Wed, 11 Nov 2026 14:54:03 +0800
Message-ID: <20261111065404.3428684-1-hang.zhengyang1010@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109111909.31712-1-zhaogongyi@bytedance.com>
References: <20261109111909.31712-1-zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon,  9 Nov 2026 19:19:09 +0800, Zhao Gongyi wrote:
> On a failed PERF_PMU_TXN_ADD commit, x86_schedule_events() releases
> constraints for newly added pair events. The AMD put callback decrements
> n_pair, and x86_pmu_cancel_txn() then subtracts n_txn_pair for the same
> events.

Reproduced in a KVM guest on a Zen 3 host (Ryzen 7 PRO 5850U), kernel
7.3-rc6, with a trace_printk() in x86_schedule_events() and
x86_pmu_cancel_txn().  With four pinned cycles events on CPU 0, each
failed attempt to add a pinned '{fp_ret_sse_avx_ops.all,cycles}' group
leaves n_pair one lower: -1, -2, -3, so gpmax goes 5, 6, 7 on 6
counters.  With this patch n_pair is back to 0 after each attempt and
gpmax stays 5.

Tested-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>

To reproduce:

  perf stat -C 0 -e '{cycles,cycles,cycles,cycles}:D' -- sleep 4 &
  # three times:
  perf stat -C 0 -e '{fp_ret_sse_avx_ops.all,cycles}:D' -- taskset -c 0 <workload>

(Analysis and testing done with an AI assistant; I reproduced the
n_pair drift.)
