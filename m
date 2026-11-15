Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744852;
	b=4iln0pSGmAHqweEBDKgMpWuvkEemGSyOPDLylftYRMp3IDVDMBA6E/UAUBYDHIjPLp9p
	 l0Trtj1Tf5nLMFIn8Jml9oEo3EnjDNsyJfce2/qfA4xFnHCA/e6WGV9puQmwr4QXOai1I
	 yZD/TPGa5o2DqZCAxJlA7PtUWobhGnsZA8lM/+tEYXJGkN/Q7YVI9HTFqUZEn28Ji21zY
	 mX2x+Xm2TxZs9lZqpiPg1AcEky6y/EU5KuD7kj0NRbyn5dhI7uo2nAFxPsbDphZIEVm4R
	 Vgloj5dGWE8LnXQNTtuke464f/lswY1lxtbvc92DsHE3z1vQd/coc+94+VJJqy/IM3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744852;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fF4vMbT8oS7M4S3QjZwuIpXLrNfNj1IdHtkDen7YahY=;
	b=kgraIGw4+i9eb14xSmKvnxMIyU/Wd2KnAeM+ybHiblddI7AGMZ6r9AL3eMtD873IIEKq
	 E56+qwopWp2e56H84LrjZF07+9hYg33oNtT1FE+sJbmAYasD+zEZhiSz7I2giX92KLV2q
	 kHA7dgns1RHfICH6cFaN+FlcwSJ6AA4HE6IlJ4lQDiUWdVjKVHoU3xNM9sbRVXmIM4BJa
	 K73kfXbUhuxIIHxKr8MooJ+ywz0i7DeBIBAjUsi8/c2KrJmprtbacG5eVTdySQdi2Gesf
	 sEW7LqIfMog/MB6dDvxEDSdn2fgQkqzjiLda0bmNpsnyD59bLGNYPcZ179Zj9Ez0MLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WSBaGyX4;
	arc=none smtp.remote-ip=95.215.58.232
Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97533606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97533606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WSBaGyX4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lFJCBfTe2hTUr2JCyVl1Sfunh2CgtlS2As9H7DRmryg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794744848; v=1; x=1795349648;
 b=WSBaGyX44RxPy6WFsVzJNBrSKfRAz4AO5jJO4bt/eXE6YCWq1Y6vmGXsEUfXBPQ24fo8sdsc
 V1maGVkqanYNtYxAsJzdeZUzBSa1PoQZt8RLO7YB3vxh2ZRxLaZP2jBYgo+VBOU1TlaCUIaSqgL
 Pmu6c6qdKL2UfqKat6ckUGFA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b87fd668dcc27078;
	Sun, 15 Nov 2026 12:14:07 +0000
X-Mizu-Trace-ID: b87fd668dcc27078
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 12:14:04 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Renzo Davoli <renzo@cs.unibo.it>, linux-kernel@vger.kernel.org
CC: Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Dmitry V . Levin" <ldv@strace.io>, Alexey Gladkov <legion@kernel.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, strace-devel@lists.strace.io,
 linux-api@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_ptrace=3A_reject_out_of_rang?=
 =?US-ASCII?Q?e_error_values_in_PTRACE=5FSET=5FSYSCALL=5FINFO?=
In-Reply-To: <20261115082540.385386-1-renzo@cs.unibo.it>
References: <2D2A202C-35F8-4200-9110-B0E636216FCF@linux.dev> <20261115082540.385386-1-renzo@cs.unibo.it>
Message-ID: <71963633-481A-4C74-AF99-043C0C694FB1@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 15 November 2026 08:25:39 GMT, Renzo Davoli <renzo@cs.unibo.it> wrote:
>With is_error set, PTRACE_SET_SYSCALL_INFO passes info.exit.rval to
>syscall_set_return_value() as an "int" error without checking it: a
>positive value, or on 64-bit one outside the "int" range, turns the
>error into a success or is truncated.
>
>Reject with -ERANGE any error value outside [-MAX_ERRNO, -1].
>
>Fixes: 26bb32768fe6 ("ptrace: introduce PTRACE_SET_SYSCALL_INFO request")

CC:stable?

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
>---
>v2: shorter commit message and comment, dropped Assisted-by (Bradley Morgan)
>v1: https://lore.kernel.org/lkml/20261114184842.373304-1-renzo@cs.unibo.it/
>
>Tested on x86_64: rval 0, 1, 3, -4096, INT_MIN and 0x100000000 with
>is_error set are now rejected with -ERANGE; -ESRCH and -4095 still work.

I don't know why ai does these kinds of sections tbf. I think testing is
like a basic requirement, like so basic that it wouldn't need to be added
as a section 

>
> kernel/ptrace.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/kernel/ptrace.c b/kernel/ptrace.c
>index 3f2fe68ccb14..1ffacfcef8d4 100644
>--- a/kernel/ptrace.c
>+++ b/kernel/ptrace.c
>@@ -1111,6 +1111,10 @@ ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
> 	if (rval != info->exit.rval)
> 		return -ERANGE;
> 
>+	/* An error must be a negative errno value. */
>+	if (info->exit.is_error && (rval < -MAX_ERRNO || rval >= 0))
>+		return -ERANGE;
>+

please consider Renzos comment and add a test case.

> 	if (info->exit.is_error)
> 		syscall_set_return_value(child, regs, rval, 0);
> 	else
>
>base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
>

--- Thanks!
