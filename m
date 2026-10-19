Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3D45C706
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792384115; cv=none; b=sJeAq8oJRBl+oHgasjPl76aLyVKJPQPHCF4Xe+/ST81Kp+ys84RY57OVUh5EyYH4Jwao/6wVKjidRRE4t6Ja4MbUtfUgRFU10nG/LFqKNLYqWuWK9Jd1FeSqgCsf1m5zLGAwIvNjzXzCm3bk7cCPux+NBfzMl3MkWPuMWVJ8hG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792384115; c=relaxed/simple;
	bh=nFRq5O2deBLCzLOM35tdkBF3irBTwZmIV/qWpwGNN0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbCw/g/B7Lt1MBVuW5hZ4AxcTGRRGOYQ9IkvzhFwJmLWZFRddXrcMxC/q7XmHnUolAjIF/EdUUG5q5fG1AxWCCrGyS5VVzHTPnkc4A1asuk3iJxZQwHmk5wLW3Dnm3Hwa2Xb2JH0+N9Ip3YQ5mqolPiW0V1C4Z4b+4njtmBK6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIasCYfw; arc=none smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIasCYfw"
Received: by mail-yx2-f1.google.com with SMTP id 956f58d0204a3-679f050b6feso39494d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792384104; x=1792988904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPEnziyqohgCiyllOGpLsBcdgNJdfasBLYSYKWDG7f0=;
        b=mIasCYfwfoRd5gN1fRI9ZgS/fymG5O9kuH358sdui+gRHJnJOCpNXkATD6gDb9Rl4l
         DacRr1Rdof7xQi9SsPmsutXWed8I5FgjtIGZvEjEzBFNzZA15Kx2H4gVU+w3c+WOHvMS
         ftZQjTdQ2MkFVSN48gpu5HrsdpeRdQ+gwR4U0lYuxHZrb/szcnS2Ro3KSdF9Zs8poLHa
         dGWm6jsqLbY1soYExAt/2NyGo4uY16lDyo+jN6s43A1k0maCVel5CzDQQClCtscgR/mH
         tjvcaLJJSAwJ/Qr1/LFl7DUuupKM0ndZF3XMlK0xkliM2Qm0bLhfhMnArDfIna0nHJbF
         Vhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792384104; x=1792988904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPEnziyqohgCiyllOGpLsBcdgNJdfasBLYSYKWDG7f0=;
        b=kYUoQleUlT/pwIDgsOqytjSja2MhIj8fXZ5f+1yYi2Gmfscozt1jaHRGQe3Nio9Re9
         PFkHQEIAYmstwfkv97PXtfb+bPrdJiuz9pyR+tNnonEDyFlGVldIwoDYyy9ui5rAV3ag
         ONjD4yjhDAkHyqn0lCHLaiRqtNQ+bAdEDTsOf+r7jRJgQXbJdxybyEnE1w0844/5O58R
         tqV4l5nIRQxMWt+BoLkc7957ezq0+GNrBDN/gz9y4L54lWr2SH85H4W3Z+X0BSeIfrVu
         lRjwdn+5Q8/IBoWXJi5+X2Xp+RsM33gosv2wGM9Bn2ucPjD0LQqoxNODapGhd4jPQJAJ
         jeCA==
X-Forwarded-Encrypted: i=1; AKwUvBx/mzsS/YXRKgcnnYTNAmhvyfvM9g/B1uwIcqbbIatGl5rbTIxq635Fci6n7WMS162213zJsW/yIIAAxNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEcEspF8ujZdmE/hgJf4KvMdrr04TfcDR8YUvJtUp0xorQqxcV
	vDXjp1t0emI8MyBV3z1/3IoQ1uEZy8GYaAf1IJZBbacxZzIwKCwIPe0=
X-Gm-Gg: AYBFou3LZ1khTGI5OK76cX3UvskkSL6yEhC1YI6lWgWf1sG71tlEVFkGZjbPy+Zo6Xm
	u3SwsYhO6uEl0hBtS5Oi7U0I45LMWgf92lzZXW+I/5OYHUwj/HW81OWJMf6ts1oRjXNIuMcnqdW
	9mTMTbuz7DRot0bks3y5jsxt1oU6zqa4WSlVsd2bvm+hKdYYZO4ioBoVpT6WcBn+dw4m9fL37MN
	08wxah51omm3Kt/ZBUsBp/RmjqMNKTLm1vdzOSEYJtwV5MZdIk1pYil0ZE+pTv7ctA/6KcWgeGA
	+O67EtHmyRVEKdENr7PZ6z4HzTSiM0gS10aDS0L7Ai9p2JRoc02vPYkP73Q/R+1gelWpqvQ3938
	AO2NaBRBSBuIbGGds2gVu83kHNuyGBQhjUxz0Mep06kfG4tn4Wf3gADCPXSJnvj5TQ1+121Gi/M
	K+e66wNxnbF2d2sm2OBhz4X7IYqwvxUa/gFSN5L1DJj+MzgSfbNZ+SEM/Zyk60+uZX60CkhtFab
	a0thFqYxa37aEJAAEYw4NsJMkNA1Zx0omjSI+KUwzkGNq5z/RxOHr6BQu/3pkm1HdxYy6A/7QPS
	K2CWrFi6MqSSoeLNcg==
X-Received: by 2002:a05:690c:4346:b0:8a8:8f62:eb3 with SMTP id 00721157ae682-8b0f21d7fc0mr14428137b3.62.1792384103712;
        Sun, 18 Oct 2026 21:28:23 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:4577:1050:ec89:21db:40a3:896])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e591c51bsm35347307b3.34.2026.10.18.21.28.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 21:28:22 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: aethernet65535@gmail.com
Cc: ravis.opensrc@gmail.com,
	ajayjoshi@micron.com,
	akinobu.mita@gmail.com,
	akpm@linux-foundation.org,
	bijan311@gmail.com,
	corbet@lwn.net,
	damon@lists.linux.dev,
	gourry@gourry.net,
	honggyu.kim@sk.com,
	jic23@kernel.org,
	kunwu.chan@linux.dev,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rientjes@google.com,
	sj@kernel.org,
	weixugc@google.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH v4 0/9] mm/damon: hardware-sampled access reports
Date: Sun, 18 Oct 2026 21:28:19 -0700
Message-ID: <20261019042819.1937-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017211613.16456-2-aethernet65535@gmail.com>
References: <20261017211613.16456-2-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rui Yan,

On Sun, 18 Oct 2026 05:16:13 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> On Sat, 17 Oct 2026 15:11:18 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
[...]
> > Later, I noticed that about 10 minutes after starting DAMON, the 'seen'
> > stopped increasing:
[...]
> I found that if I enable the kernel NMI watchdog, this issue can be
> fixed.  So I think this is not issue of this patch.  What do you think?

Thanks for testing the series!

Agreed, this is an AMD IBS / x86 NMI quirk rather than an issue in this
patchset.

On AMD IBS, when a counter overflows it sets IbsOpVal in
MSR_AMD64_IBSOPCTL, stops counting, and sends a single edge-triggered
NMI.  If that NMI edge is lost (e.g., across C-state transitions),
IbsOpVal stays set and the counter remains frozen on that CPU until
perf_ibs_handle_irq() clears it and re-arms the MSR.  That also explains
why the sample count in your graph stepped down gradually over time
(100k -> 36k -> 18k -> 4k -> 0), as individual CPUs got stuck one by
one.  When the NMI watchdog is enabled, its periodic NMI walks all
NMI_LOCAL handlers (including perf_ibs_nmi_handler()), which spots the
pending IbsOpVal bit and re-arms IBS.

For ibs_op, a larger period such as sample_period=262144 (as used in the
cover letter) or setting config=0x80000 (cnt_ctl=1, dispatched micro-ops
instead of clock cycles) also helps reduce the NMI rate on the CPU.

Also, if it helps for testing, the damo branch in the cover letter [1]
already has sysfs read/write support for the perf_event prep attributes
(commit 1178ccb) and tools/damon_tier_gen.py for generating IBS/PEBS
configs.  Your probe_hits_wsum support in 'damo report access' on your
branch is a nice addition as well.

[1] https://github.com/ravis-opensrc/damo/tree/damo/auto-tier-bw-2026-10-04

Thanks,
Ravi
