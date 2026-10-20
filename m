Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487790;
	b=g2QFfaoBq2R1Ph3yn7r2fsLj8gHYQStvHOw7IksZuxefSKfO2qxlB4mwk6uxQ8UyIuKg
	 T/82LyM5cPYyn9RFiUkhGa/ZAM77dsH5gLroht8DEXnp2OcVWX5olVyxtNj3GQzRhYwfM
	 Lp3srTZvhU7beRBmCzXPdtV56/ktMLDhGwy+54699E2OvKewaLq2uB3uv2qIjpRHKB+lJ
	 pQ9hlPrIusOPir6wqPyx+HS2Wo5w/UUS9iGoy2upv2YNLtOA4Who96XBkJBQWOLjuf9Cw
	 /yjiGuRZrM3jwC83WfCb2/CCdYbEid5tgnu6K6CkU//M7SVppSwEatbtzGxUqB8KbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487790;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fgVCjXg66MfmXK1DhMhAdx0UFOlMxpw0/DgjoCbhR4g=;
	b=XV5InFX+GGU2bGl7o93bk7m3hzHM3xJogadatR+v20zpUmsXIdJgnyscFANgHYkr01Pp
	 ZHVlSTy59hxYqqTebt3X15OJZc32MECuQ8hLpwKyIWKK3v400kcPV/EO+8cXuB1iAa4/r
	 2XLAW7TW6Fgow40jS/bnj/+/h5Td2IZr9y/I/ZIMf5RsGGJ/mWPmmS8FHAQuQ2UTSrwkS
	 GV8I19Dn4wK8gLJk3cNU1l/I30Ns+gN8x+BXLpkuZYjHsYB87WjBlIOz9FUkEc8/fbTTM
	 UyFNuPM9QsZccTjtQxNkEnPb6Y8goDPP/4I0YB54HKAmOFQGLJ7qYhf7Xy0P78fj89g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VXWXviUg;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2F0606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F2F0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VXWXviUg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9eP3qjgVUbFfqUcF5YGr57onnQc45ct6s0INEa2Ebw8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792487786; v=1; x=1793092586;
 b=VXWXviUgLFBknZK+dXQMJD2opDdEMVE/cZ/3qSzssNRpsItYDpeGBg7DYwuILh0VryDri6KL
 oG1btPXLvLKGSJNsy4M1Hh1+41q+UVyMjWpK1vApTOqPMdpAMLmlKwQ4+RqbNC4cyZApJtfS7Nd
 7ExI8i53YCSA+BxNDFWxvjQs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8edb85ba72c7628e;
	Tue, 20 Oct 2026 09:16:26 +0000
X-Mizu-Trace-ID: 8edb85ba72c7628e
X-Migadu-Flow: FLOW_OUT
Message-ID: <6e7d6232-d422-47f3-bc85-a52508cb172f@linux.dev>
Date: Tue, 20 Oct 2026 17:16:20 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, axboe@kernel.dk, josef@toxicpanda.com, yukuai@fygo.io,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] blk-iocost: fix hweight cache publication and
 donation fail-safe
To: Kunhai Dai <daikunhai@didiglobal.com>, tj@kernel.org
References: <20261019125412.3123895-1-daikunhai@didiglobal.com>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20261019125412.3123895-1-daikunhai@didiglobal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kunhai,

在 2026/10/19 20:54, Kunhai Dai 写道:
> This series fixes the blk-iocost hweight cache publication race and adds a
> fail-safe for invalid donation weights.
> 
> Previous version:
>   https://lists.openwall.net/linux-kernel/2026/10/15/1954
> Replies:
>   https://lists.openwall.net/linux-kernel/2026/10/16/1431
>   https://lists.openwall.net/linux-kernel/2026/10/16/2798

I re-ran the injection tests on my side (linux-next 20261019):
two runs with a 30ms kprobe
hold on every refresh of current_hweight() and one with the hold on every
50th refresh, same rt/s1..C topology and 1 <-> 10000 weight alternation
load as before. No WARN or oops, and the tracepoint hweight fields decoded
within [1, 65536] in every run.

For the series:

Tested-by: Tao Cui <cuitao@kylinos.cn>
Reviewed-by: Tao Cui <cuitao@kylinos.cn>

Thanks,
Tao
