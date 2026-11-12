Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445473;
	b=NbKVB3f3+wkRlIEZ/Bmzr7XT6mTFrweaGA42z8kdBvSFG+VqRN7KlyXtlvxy8U5Hqw3T
	 0AuLMH8gI2HeKG3fKkrVMhrZHURGrJpQEFmwzvtVHpPW29v3i9FAnBbMuP5bthkkPa/nm
	 zhWBbF25qRz/GBOOAsYx1tbCXOra9q0VA0oLOKgbFYY4L4xqB8uXcKOWVYLwPKtPOKlYC
	 c4BU3+6X6QvEguVwVAdc0zHvsYZ+uh8egO+n3UZr5s4/DwXfw0qhQQL6Vvbw7o7gg65Of
	 9YSKBJlC2/gQ39odhmdjSQo00e0qmMukGOPKCC+ao9gcRSV22xCql2vG00JejQnXpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=ImXBWGlfZVszV/Tkddt3FR7QWzPa65TkJvi8WUZhBmU=;
	b=OyCec336LuPcB4BoAkgX7kVATU+naT7e/Mh0GZBfvC3HOS/IFFgkilwptpzu/a4nC9XS
	 7hRCWUFBD9ZXr8mtjQMonG/GdvT3oA9k+j75xhHMj3lXl2MDsn98gWT5UV2++x5smxW6i
	 zaPYbu+z/5UhIa3UmbeQZ3GvzPQGUmGzzU+0VLkQJigJqfyNeSJzShaR3rkX7fPshcPFU
	 UP7xAMQLHoEHTHdC/rB7LNBvCmpxT5CMwbrqMBe+4VE/KvWHIjzsnbjc17ZNB8HA04STH
	 +jDFzh3TNcjy4V9JRXiIk2gvqBibJowtAGTgbq6iTHxBRojwpWyXuIetVAKfDVyfDMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AISAJ9bb;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA7B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA7B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AISAJ9bb
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1442677a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794445472; x=1795050272; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ImXBWGlfZVszV/Tkddt3FR7QWzPa65TkJvi8WUZhBmU=;
        b=AISAJ9bbeU8GfdfXc0hLt7sMbDWH+hMBgyUtmeidknJQeLdeCBSqQ++3Ab4McAJkWR
         cyjHGHKPWZzGDjet/7z2iDyQHRyGnIe0HOdif98bx4pz+lYySI0+lCGOf7CeW2pHWIzv
         tpEDH/VJX+VnjRJHCVZeNsYXOyzUXqAldn6kkUhTXMYZ+sWD0fa4Fc+tKpTZu0IWHlFt
         irjynHqGN/7GuyKtbmfM4Qje2w8qHPEyAIAcozxd1LS8veIrrThANyqqXGD3oVTjmZiB
         HOIJg46NX89zi+SYaRrcx29ZvLGnCEStm56k8tduYDPHOn//AwYmnhWpqU28Qgdby59I
         wSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445472; x=1795050272;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImXBWGlfZVszV/Tkddt3FR7QWzPa65TkJvi8WUZhBmU=;
        b=JSv2T7fqUrpzEkO7MJCOf6iurBJQ9eRqSWRl3vKTbYQwEq9NLGW2Dw0TRoBKc1I5Lp
         Auj6gM8qVJzhveYSJNzhZQ+ysw10FAC0NAlSd4ZvJcBgW1EYHVo2ENBTqIPFjVwvCfiJ
         Mz61q7+zuQQ93dUtbqx6Sn6OSWmPATnBC9dj1cg3QTfyFH5nfwsO8AUfe3dORzJO0UtF
         ogCwqIao2n03guI4+IiB4/zyj1JxuTMZ0gYkklTapE+sj6IAoRh9ymwilfv2iHRQp2+Y
         RE/+bAX/UopvFI+mgfTcBvUvOVzWZ564KDquBIzxfTP8/9R/I4WQCC/zTbpQeKvEBxSl
         B1Zw==
X-Forwarded-Encrypted: i=1; AL+hErHgIIHUJNnD3SHX+Tlbibq+eBGENUFzRz5TNHDkq6p7y72cqSiJHl89o/DbHnVnrpxQ7b/jfZI+7FawrmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ThFYgjCBU7Fjmt8aRVvY9SNVoCKAxlgp/uY80fttY3MUb+WNB
	7mrjDZ3FUkW1NCeiTLW0/pKrjfHS1RGQc3Q8aJfy5kmANQLLBKk+vHI9
X-Gm-Gg: AYBFou3D6toPQyuXapwx5c9xZkBTn7DHNN4FQ9V1GrC5uvlNASu/9krDivBZRXDzS9Y
	xYyBn/bgvhvWicrpviEgRsiknwczLk9KzMnoAXiI9oxBfobAgLReE8mXMPAYi7WgIpSHVCn01S+
	vAZ7pKTNqZY9VHE2+IivYVTJUVhIL9ZugF5PLrmb8EETe57nSnFtrW+qAS4TjA2r+hVcZzsNR8Z
	9cBhqR5Hbt9EtVVyl0BpeKUGdxVgmfQ/ULeigexNDkf0H0CpsXimGnlPBD2LF7t449MlIT9XUkR
	0YbHuieaTYFoACtvrrJFevo95520+0sWFN8ttY9kd5ySfTqeLILuO+hSLDyjvutMBIIUfynYTEP
	/JweUuxKY+ZYG6qWH4/erhFSjwJnI01yFPX8I3O74nkwkd17qz/wtdLOg/bk//MbBtEy/tyamQo
	IdoeIV6tO7ZsnRkXTmZ+kcAQE3At2w39vlyrrTrfSJMQY7PCkcF+TJnqEhPxSOIR17OqdElrdgF
	CsFur+zQWkPC8FwV0Dj+tZs9wxTiuj6VQP/cOIdO4WcvZhuWU5SVkkUjMo+231H/R/dVqkuHMSN
	KtW9HFxUXte5KyQP2GkPc/x2Vp5Wa5FZ1ZGfyKlVc+qxsu3S5Qhcqd6O38gUknTkdk0LaHugyFP
	4TbqAx5XNq3ns7QvyQw+3LEBp7rAYyE40jw==
X-Received: by 2002:a17:90b:590c:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3b182f28bd7mr3487343a91.31.1794445472226;
        Wed, 11 Nov 2026 17:04:32 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7a26e5sm2247647a12.18.2026.11.11.17.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:04:31 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 01:04:30 +0000
Message-Id: <DMSTTWR4MAET.1VEV3R66S7ZFY@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "JP Kobryn" <jp.kobryn@linux.dev>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 2/5] bpf: Check program recursion per task
 via bpf_ctx
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <mikeba@sentinelone.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
In-Reply-To: <20261111-bpf-preempt-v2-r2-v2-2-9d8f6b952ad2@sentinelone.com>
References: <20261111-bpf-preempt-v2-r2-v2-0-9d8f6b952ad2@sentinelone.com> <20261111-bpf-preempt-v2-r2-v2-2-9d8f6b952ad2@sentinelone.com>
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

On Wed, Nov 11, 2026 at 11:39 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:
> As a result, the same program can now run in two tasks at once on one
> CPU. Programs that use a per-CPU map as scratch space across helper
> calls may see another run's data, where the run was dropped before.

The kernel has such scratch space too: bpf_raw_tp_regs.
bpf_get_stack(), bpf_get_stackid() and bpf_perf_event_output() of fentry,
raw_tp and tp_btf progs take a slot of it with get_bpf_raw_tp_regs().
It doesn't disable preemption. Three tasks on one cpu:

  task A              task B              task C
  level 1, regs[0]
  <preempted>
                      level 2, regs[1]
                      <preempted>
  put: level 1
                                          level 2, regs[1]
                      uses the regs of C

B sends a sample or a stack trace with the regs of C.
This is an existing bug. Today it takes two or more progs.
With this patch A, B and C can be in one prog.
Doesn't hold the series, but I had to mention.

> Fixes: ca06f55b9002 ("bpf: Add per-program recursion prevention mechanism")
> Fixes: a46023d5616e ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> Fixes: 439ebd5b5708 ("bpf: Add sleepable support for raw tracepoint programs")

I don't think we will be sending them to stable soon.
This is a big behavior change.
Backports only after next merge window.
