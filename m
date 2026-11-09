Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231255;
	b=weNmef3zyvudqJ/d5g7uO4XJ+D8dEuwqrC5juSakxRAprJ+BcvCzpnKTXEkigLF45Dpc
	 Y1XWSMvl7kW8NskOwQKiLVjntCXgxCydj5dlIvK6oSbhnQ1YUUmbK8kHCioP2n3LPnEKH
	 GyKc+ZB1XVWUjoPoU6rkcVb9AvvegvNsnjkj3Psw6eYbn0gBiB1yQzJZNkSwkuN7x4dEB
	 GOjMDiT7C5qKj/oUWwr3A/HNhojr6nNRVOifqFKK1YHWb3qkRSmEkMFG0+XHRUQ0L4ytV
	 +E3WAcWe9oDG6/YEhSDe97YyAT1ZY0MH+vWoldig8pB1p3Gf5e1DdC12ulXMyBpBGVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O/zXdtBfMr7yE0U9APEwE8s+KVBal7Su8WTATDna9Ng=;
	b=xhL2G6Y3wKjc3y+a3abRCuVssRuS6kbQ8gvAwFluHynzT4RtIYdOb6S/onUNWZthIybT
	 4OENbhZ0IdbTdZNEpJXaVcLNnXgLxpMjwbdcI0FA1Q5E9XZUfe7q603+kz+pw9CHbWtgJ
	 kme65ZilLjM9f8j/GfQq0K1p4GlUF7GO0ABHfbZohDoZs+JWiH+8ADjISXmaBRn9+8Zga
	 ObZHN4EI4KhtlA08y/qPO9zhhXj+z6YEWq20F9XMG+HbS2BRGfViK3diOMejTynGIhOs6
	 fzkiJzZq8f9xR6mB+UeqLv/4cU85v+xMAxaDnmYytfCTVrPGApqlHeL43Rk1A1r9fiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6WN2+mE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BEF606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BEF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6WN2+mE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f563d1c6so288897f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231253; x=1794836053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/zXdtBfMr7yE0U9APEwE8s+KVBal7Su8WTATDna9Ng=;
        b=t6WN2+mE9iQM4YnBdje3Ui5tG4kcd7+vF1GCKhcKKS+jODZ9yiCDlIOBXOXG0kq4cB
         PzdFGYUKQ4k4L+90G2rnighEFZqpX78LhMdzuj1UXh+zG9nSZB3Rml3K1+KW1d2Adt8r
         t7I4BBpU+X8qovz9enet/RDJidp26NSFkRTsw5vrcG1IrIsqG93SIJJZl5SQusybotXh
         CceBgspQ/Bxt2yZ9R90xLj4i69rFkyMqHsU8hecMk5QgBX/iXv3iuBejQZFnwn70mxQp
         pE2DSaDMJXmAqjUJG2/s1HSO5UIv6r6PEqKI7D637XAieA7X/9ivuyvsMiNqicEMznJa
         mzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231253; x=1794836053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/zXdtBfMr7yE0U9APEwE8s+KVBal7Su8WTATDna9Ng=;
        b=N1GevtgO3zuOg5MmfpoMOU2bssDZa4VqJSyzWr7tQl/QohScIVKp2vg69l4PCAZiC1
         zwyBZc3Cl97Thva9LSXj7Dpxm8LqqOoi4pln9LfPD9P2FIg295qjq2zhWNrGuc5eBNNc
         mRFQTaNnO1A04NAxQH+Ov2cRMrZIhA2o9GJjXgZ5v8runFY41c30EBnH3NcfNRPVaSP9
         vSyL60gaA6ic9+yo8L6222oHYYeV9kFFMcxeeVnOjEl6D50fsBsDAbfYgsKwRhtKktwx
         cJNiIauCkEzvbvmUnLddGpoyRT0N/9t6K4sN+pGfRDD2y3ND5d73G7Qd/dkpGkPEiB8u
         dPqQ==
X-Forwarded-Encrypted: i=1; AL+hErFPOlCO3cwVU3fD2bDCPGBgGyCPZPZw/LqtgDYNHRCuudVVs2r4Yda4/Khm/q7bRnQ3t4FrQtlchCT/1ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3J80D3ytxuUIYW57RUjb2eQaezvM0WKPUXCQr5SW1FHBqrf/3
	9EGMGhsJNBspXuEIfP7huvHqN6ktFz1y3MUEcexwj4FbYd/2QAcuvOtJ
X-Gm-Gg: AYBFou1zMSFRs7i2LplhtGZhYJMZtv95aVjCpkscxqWib+rnMjfVoo3q/4ddrvdugXg
	XSilF5tPD14FBCi5h4XnJfHEgxjEN3iJS2Vvb1rSYoofD40UkHU9qbHmfgZUymENdQ1Ca4pRdDS
	1yY3Wm7YDwTATSy6JJ2TDTIqbyCtMTTTqtltd4eLxkNCrJZ+CQtmQsaaffkf3T+z6HBc1xOR4y5
	yzrVbEkV/o0rTcc6m0s5dSCpbaAxMdowBYleVKA9d5Pmd5rozxw4NHmxNf7gPCb53aBlucM7TTa
	Le280uCSuPoMRYzAZNeImneVX1g+42NiDclcS4dR02oSxyXhiVmmC3tytSJAbxQvpvpDbS1QXo2
	aFGDUzRYQWQnLqBsOQivTGffHg3yk67LWLk1dQS0GOkHWavw+KWFJ2DffROcgRF83RCF5Z0GR9l
	7MwMRInNqvjjLNs90QGnGsWA+QkdAez0KSYVqcKtkyBVGePkIxbeqPK6X4cdGd7SCzJ5LG57dXS
	oxT/uGykyRQZ/QX1bKkb1kiAY4BVeHStSlN/sckdOGtSTtY9pD4GgrhukocOmngVB2a3/VoqwFg
	3LYcaWPTcdqRdQC5JW5XsZbxvBD+AQX4GpFiwwV0ZOup/0HMN/Dvys05qA==
X-Received: by 2002:a05:6000:26c8:b0:494:f239:aefa with SMTP id ffacd0b85a97d-49584d47551mr8921475f8f.34.1794231253290;
        Mon, 09 Nov 2026 05:34:13 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm10075884f8f.11.2026.11.09.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:34:12 -0800 (PST)
Date: Mon, 9 Nov 2026 13:45:46 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, almagui@kernel.org,
	john.fastabend@gmail.com, qmo@kernel.org, brauner@kernel.org,
	kpsingh@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, sashal@kernel.org,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v1 bpf-next 17/18] selftests/bpf: Enable bpf_scan_ir in
 the config
Message-ID: <avHOikbXvM5poRr5@mail.gmail.com>
References: <20261106210314.1767267-17-a.s.protopopov@gmail.com>
 <23cbf06b46fa6d1cdfa3a9bbcd247deec22de8efbe5d1b2fff4cb89177171d56@mail.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23cbf06b46fa6d1cdfa3a9bbcd247deec22de8efbe5d1b2fff4cb89177171d56@mail.kernel.org>

On 26/11/06 09:35PM, bot+bpf-ci@kernel.org wrote:
> > selftests/bpf: Enable bpf_scan_ir in the config
> 
> TL;DR: Commit message only: the list of cases where Kconfig ignores the plugin
> options looks incomplete (other arches, missing matching llvm-config), so "CI
> builds and tests it" may not hold and fmodret_retval may silently skip.
> 
> >     selftests/bpf: Enable bpf_scan_ir in the config
> >
> >     The bpf_scan_ir plugin is off by default. Without it bpf_testmod has no
> >     fixtures for the plugin and fmodret_retval skips. Enable the plugin in
> >     the selftests config, so CI builds and tests it. Kconfig ignores the
> >     options with GCC and with clang older than 19.
> >     Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> Is the list of conditions in the last sentence complete?  The commit message
> says Kconfig ignores the options "with GCC and with clang older than 19", and
> that CI "builds and tests it".
> 
> scripts/llvm-plugins/Kconfig has more conditions.  LLVM_PLUGINS needs
> CC_IS_CLANG, a working $(LLVM_CONFIG), an llvm-config with the same major
> version as $(CC), and a $(HOSTCXX) that accepts the LLVM headers.
> CLANG_PLUGIN_BPF_SCAN_IR needs X86_64 || ARM64, DEBUG_INFO_BTF, !LTO_CLANG and
> CLANG_VERSION >= 190000.
> 
> So config.s390x, config.ppc64el and config.riscv64 never get the plugin, and a
> clang >= 19 host without a matching llvm-dev drops both options silently.  In
> those cases the build succeeds, bpf_testmod is built without the
> bpf_testmod_retval*.o objects, and fmodret_retval reports SKIP.
> 
> Could the message list the full set of conditions, or say that "CI builds and
> tests it" only holds when a matching llvm-config is available?

Yes, thanks, will rephrase it.

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/42294987431

