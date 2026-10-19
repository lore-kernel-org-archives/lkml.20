Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430178;
	b=ghFS0uiwfv7hAldk9JxyMv6jBJuryq+/4AV5nEvcy6NyogXHTv465nn+nUcwxMdCNlb+
	 LY5N2d0Rr5iY1hhzQrXjXj45wdFbg9U0YIfECFxZLeiJYypdR83S1ydMxj4fNoqJftXYq
	 HNpBcisUA5RyWJUnlsdj4ykgoR8LEbyKWyXqZVa1Sp2BYVrDCBcKUNebgj2P5YT/BxXZQ
	 wqzCJk/pLpXh2zsBiGIAPEy9zAzr/YaDBWz7eWnGsaSwQn42tbPZ+cpwAYoPQ5dXm/xLC
	 RWd94ZO82JnuYRPbX9zpuG1eEeHXU1x3TqSYFUS+P6opIPKViXerjxP5KUN0s9iOedQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430178;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qNx6DHkaVsiPl/g7Htua0EzSABv4CXVzJo807UeBYIU=;
	b=sErOw8xNAlEpt8+DAMloBnuB1jQnK8+Qd4ioqjlCvwLew+QOyalhG3P91Z5NFW2S/IaR
	 2ftSeYdwHiN0NrJEExzlP1yDiDxsRpmZffZ5J7ur6LUvqpaAJEmxKYS5BCUJNCQXMmHFS
	 8bOCVJfFLKuFku+PYoZVqcqpe99WxkHK2linKv1GztsxlLoEzyaVPw/P24pRMHk1hFuC4
	 IjrrxwhDEUaFsUtnikd/FTKpB+QEr6fkSTMz1+WX6PaCUM0sN0vrbvxB3Jdjm+Zfqa/Xm
	 VKbzIbjT42ofZEvtY6FR57DEuJEmFQg/5DQaAaAwTiISllQwstWE3+2ZaCuzDt1CVQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A1oEpCFf;
	arc=none smtp.remote-ip=91.218.175.18
Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A436606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A436606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A1oEpCFf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ht0YeVNr87GBjD/XD3J4ka9N9ZFBQ94E02FEAUKrXMQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792430171; v=1; x=1793034971;
 b=A1oEpCFfgn7hY8SlFJYdcXt93AMGLNPWFV8GWG+ZlKxM7ik9DPXqhPKqZVZcHyy62OPoWRJS
 3Bzu7/+WNZSXmcOG1e0/5m+jZ6/1/FbsFujaduXfb0RTbYmXaDsBDmoMRLMuiWJ7va3EPg8IDdx
 3kbwcTeZC2SYBAaqOkRofq4k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6fce2d4bfa616019;
	Mon, 19 Oct 2026 17:16:10 +0000
X-Mizu-Trace-ID: 6fce2d4bfa616019
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 19:16:06 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Convert IMSIC vsfile_lock to a raw
 spinlock
Message-ID: <atZPqGKEip_sW3fr@orel>
References: <20261019134709.2610129-1-andrew.jones@linux.dev>
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
In-Reply-To: <20261019134709.2610129-1-andrew.jones@linux.dev>

On Mon, Oct 19, 2026 at 03:47:09PM +0200, Andrew Jones wrote:
> kvm_riscv_vcpu_aia_imsic_put() runs from the scheduler preemption
> notifier with the raw runqueue lock held, so it must not take
> vsfile_lock, an rwlock_t, which sleeps on PREEMPT_RT. All vsfile_lock
> critical sections are short, so a raw spinlock is fine.
> 
> Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
> v2:
>  - Convert vsfile_lock to raw_spinlock_t instead of adding a separate
>    hgei_lock [Anup]

Hi Anup,

Sashiko found an ABBA deadlock with this v2[1]. Making vsfile_lock
exclusive serializes kvm_riscv_vcpu_aia_imsic_put(), which runs under
rq->__lock, against the SW-file inject paths, which kick the vCPU
(pi_lock/rq->__lock) while holding vsfile_lock. Lockdep confirms it with
an EMUL mode guest, and the host then hangs (I should have tested with
EMUL before...). v1 doesn't have the problem, since its hgei_lock never
has anything that wakes tasks nested under it. I tested v1 in both EMUL
mode and hwaccel mode [again] with lockdep and it's good.

Should we take v1 instead?

[1] https://sashiko.dev/#/patchset/20261019134709.2610129-1-andrew.jones@linux.dev?part=1

Thanks,
drew
