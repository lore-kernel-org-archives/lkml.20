Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B437E5C8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610172; cv=none; b=hQpBpja42IEeHpYYpqa7KLvifje5oiReLt5pAsnFdb2UmWgT22mqjYI7Rzzeab1XmMTZBzZ1tPi7L+rVLvan63cq6DkveqkFAVdH+jHNiAnJqiNwCyyFzuR52z3kD+5ieFH+YI3damonyaMnNMYpUlTXy9hqr3jakpEk5wjJWfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610172; c=relaxed/simple;
	bh=JhlR2Z9hLGie4ycveHEZlcET4EHYzNNuAFgR0tLVmRY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=pTAOya8UY3qkLso2fH+MuwEjtH08q+LFj780jiV4ZRiFAbhvDjCbxY+r+/mo/FeVYIanOZ35/Z0L4cc3404ZfiELIih2sgU18AcnwnoGLhjKK02IeLzua99DRMY6+nLA5fx3vNzPQFKRVgGrI83WM+RoZLR35tCyWIFWR/PpwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsNk4cUx; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsNk4cUx"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so235734b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610171; x=1790214971; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=;
        b=CsNk4cUxoqozPRUcv9DHLNTMt7IX4BDeN09A6P1DxP6vnOCGTIE3WX8x3PZkh28oEM
         SFbw7CTt9CiXEfGfaJQpeKVM3KtpuIymEMI8pVK1MhhFmB6QSPoE19feBb8xKdAcxEXK
         XzY5P3aaGDYGfR2VEQ063K8SyvSqg470/peKrxlvspUK/dpgXNk3n4hgDXbJxCE1oy0d
         BWH6bO0C085xZqBm00GOXE8g64rI8WePtGp6uqu+qB/I7nvmtBl8Mit+q9CmJ2f7CuyY
         PDvAHCWMwj63oLHukFAXRMMBtNPv3KwMFjy/C85aLVpZ4p1eXXcjcT7pnbHkpWofKwQO
         pr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610171; x=1790214971;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6mHUY7GH1xqP69TULjoYeDvGxc3p4dOZNNxR4X6kDY=;
        b=tY2Q/Nd1w/RmI15NfVzxlnkO+CIOmHO0jY7PNKQxVTUGntBStfzNoB6WqAtgn9Y3K8
         W4i/y/ZQ+5aCdq9K/jojkuZThSdZB01+Tgx9n/7SidVw27Scc80RvlqlJUC5oUuXjun0
         HTJXGQ6U1xrAMN/rOHOrFTCpxnLbR4+WRyKjAnYFEhUTWUoU0QR1fhCwurODXqrzo1zE
         AaqiTh/7sxWc61UqWpPKPiE5T+Q+PInC9BStQg8CWvjsrM6jKHJ7moKYg1QxLixYb3Th
         v/iS/9FzC60HcsdaLl6m98PEA0rwlZNAoaVDHnosBcgxdnZqM2go8z8JFwhUBNF8vIL1
         nWEA==
X-Forwarded-Encrypted: i=1; AKwUvBwbyePbCm+Gr/CfyqNS+ZnZnt8eW4MO2eiYi2w8nOpNRYq5GAoZT+ZAoZQzgKmWTpTNvVnmcNsGBn4as9s=@vger.kernel.org
X-Gm-Message-State: AFuF++nUBs1pxO5EePbqpuLuMoUCApCH4yL80Y3WQJOQT42wcNxPcfUw
	taH/LYWZgHbzdBINutFcGn0vo+4+wFGUgj59KjOBI/HNQUoiTJtQbFJVfNh+Bg==
X-Gm-Gg: AYBFou1OXwWeWNZydZHQ9fyxnGphm4IsSC3tRGovnMBaajHRBpRflSHuxQnZ1xzMLGs
	lsvZKngoEhREJdNSh4DFj4qscMwxLwTX6PVzFzlkXGveCo8J+H4k38iAb9FikxSVq5RMkCxuYtw
	hlnyLclwC2IajelyKrVwAM7RvQseVkIc4z3rGpldhQkDHp9w4AuiFMUvgKTi8D72H4Ybq4PbWsw
	n85HDMOMHQkMsNQU+AV8ZWifw/YdJ0V83d9xyOnf5jw0sipnxYaqgBcMu4DjUgasA2QW5edP75X
	yrW5iL1cwtDJtxjsXkkj+m+CD6AJCXfBdES/Fcgbjz2jyReq0rAH4IAySOgnVKWYXn1PPQqO+ht
	CRObXLu6Hwat6iFZDEDvnqy5wZUcd3u2gJn3VCu7xfrZ0EWxLziu88m0o2C3wTeTrfoSieqLZ8m
	yagmUBbeoVcrO9Z4Y0TO5Xn1DFVzgblTGzOgTpJPrzCSZDOf9BEYxqK1jObV2nfXY8HukZJXM/t
	yHYPqiSYQQ6vF4osdbAfq1zDMu3+xr7peo6mIUExX1AUCTYMXiMjKdTw2GnPxyMlnc/LBxCLXxy
	H/Wt
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr12456976a91.23.1789610170800;
        Wed, 16 Sep 2026 18:56:10 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e390c2984sm387496a91.0.2026.09.16.18.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 18:56:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 01:56:09 +0000
Message-Id: <DLH7UY9PDSQP.2AXEGNH838JS0@gmail.com>
Cc: <yonghong.song@linux.dev>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <x86@kernel.org>, <dave.hansen@linux.intel.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <abuehaze@amazon.com>, <doebel@amazon.de>,
 <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 1/1] bpf: btf: add btf=off boot parameter to
 disable and free vmlinux BTF
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
In-Reply-To: <20260917000201.25581-2-wanjay@amazon.com>
References: <20260917000201.25581-1-wanjay@amazon.com> <20260917000201.25581-2-wanjay@amazon.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 12:02 AM Jay Wang <wanjay@amazon.com> wrote:
>
> Add a "btf=off" early boot parameter, similar to the existing "selinux=0"
> parameter, so users who do not want BTF can turn it off at boot; the
> section is then freed to save memory.

tbh I'm not excited about btf=off. BTF is not debug info anymore.
sched_ext, bpf-lsm (systemd uses it), hid-bpf, most of bcc/bpftrace
quietly stop working, and we'll be the ones triaging "libbpf: failed
to find valid kernel BTF" reports from people who copy-pasted a
"save 5MB" tuning guide.
This needs more thought.

>  .../admin-guide/kernel-parameters.txt         |  14 +++
>  arch/arm64/mm/mmu.c                           | 108 +++++++++++++++++-
>  arch/x86/mm/init_64.c                         |  30 +++++
>  arch/x86/mm/pat/set_memory.c                  |  28 ++++-
>  include/linux/btf.h                           |   9 ++
>  kernel/bpf/btf.c                              |  51 ++++++++-
>  kernel/bpf/sysfs_btf.c 
                       |   7 ++
>  kernel/bpf/verifier.c                         |   2 +-

This doesn't apply to bpf-next.
Consider using Alan's approach and support CONFIG_DEBUG_INFO_BTF=m

pw-bot: cr
