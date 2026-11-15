Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744882;
	b=yV0YyOZZvJGCHF8mlbKIuk3z1pe0hiQBBUp5yidHc+OzpSf5mjtb6bpxgMJjv2J53HQz
	 1e24BQrd8SVfsSZY/w23v13WZA0kXOrtWuSDEz+BM/Ieg5NVKHF884K9A+lZbVc8a34Zp
	 FejSKnBbp7QCEE6HQCK2G98/CyYZj8MnfUxHej3fjnr54DeDS6C+kuSrUuKk4n+S3K6vB
	 GFL4iHZ9uRvNC0uMZLwPWQIUUjHGoWb1ZgzHR8sBXWQFgUYxnCwrnMfpqim/IjTXC6+6c
	 0BOFxh5DbYGVuuHYyamHmNkRNUgOkFIHfyEGAxz7ZqijAHiqBsTcXabA6GZcDDFVWyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744882;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=16uiMZGEYqtdM9NRhPkjaUuYRhIfbHL3nYIwwi6x9iQ=;
	b=HSJZHgInuvmCHkh1U9WIIqOpmgn+A/d3sUuQOqhczqZLlaC67q7eZMOPFSt4fExR8DGz
	 1uU6+VtxW0a081UL/OBBrpWdjrY/goqRCF+f20cq+Sc/DSuTFY+0ZrsmREqbFPbB1m5h+
	 SGLUZj3IiQ3x7d7xp1Hl7H012B7pcutENYuTFxCHKhFDnLbeEAAmX5DsAZVRnbQ680neO
	 YF/S60wmW+JsZKHat7xoDWlWDJv9JgdJ0mkRxqxiDQ1Ozo/W0U+49yL8ltK/Qe3R96fVX
	 Vd+NitqZup/7izaKVhMJAulnuCok67vXan1A8FJZ58lpYSnWubL+UwVkZenfR2NnLfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DAzDV2p4;
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99257606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99257606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DAzDV2p4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uFLWPmWqsT6B6WbJ8DCw2sV+WVJ8VdcEQ7C090NXB38=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794744879; v=1; x=1795349679;
 b=DAzDV2p4qpjAPWpnnHppLGPgLD/QNNusTJc1y++BaV+tUoomNY52RFFeZFfGTKXRMiJ3FMfi
 kA9+icxul7vgt2mLgyzrBhsOVq+znLrecv1OnsYiE8Ql/aDRYXJ7aP0uL6ZPyNbGBS6dpc1gHu/
 Y/by4BcQltXpqWlhQRGFEOD8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4054e74a4849b3c;
	Sun, 15 Nov 2026 12:14:39 +0000
X-Mizu-Trace-ID: f4054e74a4849b3c
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 12:14:35 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Renzo Davoli <renzo@cs.unibo.it>, linux-kernel@vger.kernel.org
CC: Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Dmitry V . Levin" <ldv@strace.io>, Alexey Gladkov <legion@kernel.org>,
 Eugene Syromyatnikov <evgsyr@gmail.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, strace-devel@lists.strace.io,
 linux-api@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_ptrace=3A_reject_out_of_rang?=
 =?US-ASCII?Q?e_error_values_in_PTRACE=5FSET=5FSYSCALL=5FINFO?=
In-Reply-To: <71963633-481A-4C74-AF99-043C0C694FB1@linux.dev>
References: <2D2A202C-35F8-4200-9110-B0E636216FCF@linux.dev> <20261115082540.385386-1-renzo@cs.unibo.it> <71963633-481A-4C74-AF99-043C0C694FB1@linux.dev>
Message-ID: <A2368AD5-68C7-4377-B1A9-5371053AC186@linux.dev>
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

On 15 November 2026 12:14:04 GMT, Bradley Morgan <bradley.morgan@linux.dev>
wrote:
>On 15 November 2026 08:25:39 GMT, Renzo Davoli <renzo@cs.unibo.it> wrote:
>>With is_error set, PTRACE_SET_SYSCALL_INFO passes info.exit.rval to
>>syscall_set_return_value() as an "int" error without checking it: a
>>positive value, or on 64-bit one outside the "int" range, turns the
>>error into a success or is truncated.
>>
>>Reject with -ERANGE any error value outside [-MAX_ERRNO, -1].
>>
>>Fixes: 26bb32768fe6 ("ptrace: introduce PTRACE_SET_SYSCALL_INFO request")
>
>CC:stable?
>
>Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>
>
>
>>Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
>>---
>>v2: shorter commit message and comment, dropped Assisted-by (Bradley
>Morgan)
>>v1:
>https://lore.kernel.org/lkml/20261114184842.373304-1-renzo@cs.unibo.it/
>>
>>Tested on x86_64: rval 0, 1, 3, -4096, INT_MIN and 0x100000000 with
>>is_error set are now rejected with -ERANGE; -ESRCH and -4095 still work.
>
>I don't know why ai does these kinds of sections tbf. I think testing is
>like a basic requirement, like so basic that it wouldn't need to be added
>as a section 
>
>>
>> kernel/ptrace.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>>diff --git a/kernel/ptrace.c b/kernel/ptrace.c
>>index 3f2fe68ccb14..1ffacfcef8d4 100644
>>--- a/kernel/ptrace.c
>>+++ b/kernel/ptrace.c
>>@@ -1111,6 +1111,10 @@ ptrace_set_syscall_info_exit(struct task_struct
>*child, struct pt_regs *regs,
>> 	if (rval != info->exit.rval)
>> 		return -ERANGE;
>> 
>>+	/* An error must be a negative errno value. */
>>+	if (info->exit.is_error && (rval < -MAX_ERRNO || rval >= 0))
>>+		return -ERANGE;
>>+
>
>please consider Renzos comment and add a test case.

oops Dmitry.. sorry, consider dmitrys comment

>
>> 	if (info->exit.is_error)
>> 		syscall_set_return_value(child, regs, rval, 0);
>> 	else
>>
>>base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
>>
>
>--- Thanks!

--- Thanks!
