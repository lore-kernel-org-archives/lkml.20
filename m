Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FA53AB47E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871923; cv=pass; b=YytY0rFLrBWu58TUxN25oxMtM2HTf1K+qTPZ6jFU29LdUO4Q68gDaW+xCIDzbaEGOS3JCo4D6zePp3AdU6y4iJcGiK+g1cE4GsjfIEbGTyScwgoAJV3S3tKEBUSDgbcH+7qknetNYPLlkk1ueKuvj2sTdXeoA/XYKEngEaXUdmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871923; c=relaxed/simple;
	bh=T0RUxs5iUVohqOFWo7bsso96RXmZbMN1bhLYXJJYlQs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=iv5zXwUsVtJ5m71KAsPcl9uVgWgyvEOPLRgINXjswwKlDkLxaxo4imFdGPW4tH2Gy/gDzHGni++75rti92T88c50fE0cUbBvzbJS75vBp0QNfx3jqfwHdTodEe50UXfVH4Bn9Q025toIvNiI7dtevWQpEtLb2dsn3+knNkwLWCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=XZoGQapS; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="XZoGQapS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1247781a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787871921; cv=none;
        d=google.com; s=arc-20260327;
        b=JqwTcz+qtx+Ir0+uFUms93ZDObH4USUNORbELMWJu9VueR9DBjfYmFumWhDegC9Qr2
         90AX0i0fIFUxUBT3QQeaFMFRNtHXFAkL/oTAAb3Ou1ZoQLWFopCJ/aSUBvLlNj572r/U
         qoJ1dVd2eIlxmPr3a2Y/QYVyFWVqmIsB5O9jmtRAefWhZjskjO1hvC6R9+VwWxRQgR/Q
         aZnAMb2SHxbTYmZwM1tNDqYvVlPkOJ7ndQDAuyVNBP/mdxtfuLYrlBFQdAjrb1GHX8as
         MN+JDitwOiWaEfWk8jgOqjsJq90AOx74EEjw24LoHb7MCODpGRTqCOXAKtdVeSdgWHk+
         oR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=X25WdoWGkB4WSbQ6LwAsBNMpG4cFx/LTnS4pR+o5vbU=;
        fh=DnKRhIXoycjAy35WJu0oX4KwYMDwDlLT55xm4yYirdg=;
        b=B5hzLjJSR5Ao9XJXbiVyAHHJbjIT4FV9vjBNtKm93iE4uKp24+YbletYb/IkYS8IeG
         LUuJGCgwxelUBCBsoVz0vfgPOwx5EMauvDeHB6hZ1zS56bp3ytN1QKt4TyVNWzlg4lTv
         AfJCnC4ZFi2Mw2SAr07JP6LQYR/fq2dh8adxvh+7bg6W7aBXGlwSlOQOB8VLKoZp8Dfw
         Y12UXjPmKXDPEvM6nHiSAp+jl+5CTh7jFPDAIdBq9/P5f1LGU4hoF4AeBuITqHLKa9I+
         X9/pqbCCqQTtkqYYMgrPhfzXJx0fsZLFEt3Cclou802LPNqRG9i83QG7qt0hk+cPQZoX
         bT6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787871921; x=1788476721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X25WdoWGkB4WSbQ6LwAsBNMpG4cFx/LTnS4pR+o5vbU=;
        b=XZoGQapSLBxHrhD0a/wydlgQffNSzJMSpdSnfCqMvcBXPzX9rTgnFgbbeyrSFtY3lq
         PoFX8uV2P+CEhCnwAO1CruJQUnusq4hPWDzrNwHJ/TPG9JsCO6CWFrsJAzl/0QHoh8yf
         GMO6CYnsVjI9we+y+nc+1BRQ9IEKL90RWB/A1feR60vmfrheJZWBM2OdpMQBCA1hjlxy
         oDLUwXqAm74/zYdCSpA0Ox5tV+PZpqntrHPenqZitCdUF6T1BEu3jV5j8pUBYO6/vpO2
         fQpjYopPNeRSp87cZZExPXxloTNRtWfihKabw6gwZSGIqZingCGwfT3hI2Vk8EwfOyRf
         8dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787871921; x=1788476721;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X25WdoWGkB4WSbQ6LwAsBNMpG4cFx/LTnS4pR+o5vbU=;
        b=gVBfyYA49QIm3SNDlhxJe+700fKxsimgWkLAnwAxoyqEQItlIrEQr7fGaD4pNG1emP
         NG1v8cgtvvx9E4WrCkA5yqLKi9GMkQK67LuKnrtqPGg5/fquwn1PdHzIjl0fQMv7zpmy
         Rwy8rARXVj/HHrZt5EH1zVj2jX2BLMm7eP1boNpgaD1O3zwLwBNr/ZCp+TtCfpdLhCii
         vQaX+VO5Wybyo9/Ik+eQYYpytyIoEG997HfSN8szi334rgAlMwUG+O9DpoZ575D87oUy
         L/lPTTBub50Rh4KAqpFUGsvs7YyTPOjHt3WrBRDrqB3NesH4XGQgQFjqkpC+cIISt4du
         Vj5g==
X-Forwarded-Encrypted: i=1; AHgh+RplGbryBx4aOIAMSmqWAFu9uEMyOOtCatj3BdbZBEsGHvaYn6MUZNPJHcvn61wfY+YNhPBTvBoDw3NyUY8=@vger.kernel.org
X-Gm-Message-State: AFuF++ndZKojxOYgJQMhJjlJ6jkf1eZFTYVZWT9lvuDtkZHtq10MWhGq
	yo+oe/osrJKsx9RwyK26L+41oRoLN6XosIaLMIFYwf/upi4OlcxPFbkezVIAI31UQagA4rBgYOT
	l9icqqxRRwWUjAH7HfqtVr5/nIpm98+GqFDluSiQn
X-Gm-Gg: AR+sD10EV0A9QXppI/mVTApFCFofDMEBh6ML9NYAeSaQsLINYI/cvEpurB7zGVCAp6s
	tlqjA6QJpc+VDyQXiPgs4+koEc1JPiEiYumEh1SG9Fg/38hGpaPqKZ2MOhGqbpf/yBzjEHt6sxR
	ZpsdE0CfChjsFdSWd/W2qjYTg6BS9EJOmR3zycmqy3JVajakEr8NMTU1XoQL2E82mSkS07a65qR
	+sZnySrqwiSubP/dArzVHx9jAS3IbIUEGuUNiz34Nhore0YAPiPVnq7K+t+sAjp9CTAIa9BEgfu
	TUIDwpxBfh1rVSb/ANX0WTwsuFmlCyeiP/o9su2RG1bZF9leXszpNyfSTnhoyg1Wyp0QKE0RLgl
	IxlG6iD2gffjZwL36sIGB2A60MgK3E+8F
X-Received: by 2002:a17:90b:2c88:b0:390:84db:888e with SMTP id
 98e67ed59e1d1-396d0f2181amr2746723a91.7.1787871920400; Thu, 27 Aug 2026
 16:05:20 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:05:19 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:05:19 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:05:19 +0000
X-Gm-Features: AcwNN1U2yz4g3RBqqD2LAORwB7-8ngn-g7PZ_O0yjvAvyo7vWBiPT0oNGxQNvm0
Message-ID: <CA+0ovCjerKZJLwXScM9bF2ga2rLi4_XOpUfK41NDbENpeu98jA@mail.gmail.com>
Subject: [BUG] tracing: use-after-free in t_start() when a trace instance is removed
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: falemi@asu.edu, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Steven Rostedt, Masami Hiramatsu,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/116-tracing-uaf-t_start-instance-rmdir/

  ==================================================================
  BUG: KASAN: slab-use-after-free in t_next
kernel/trace/trace_events.c:1568 [inline]
  BUG: KASAN: slab-use-after-free in t_start+0xcc/0x210
kernel/trace/trace_events.c:1592
  Read of size 8 at addr ffff888022f7a960 by task syz.4.116/12466
  CPU: 0 UID: 0 PID: 12466 Comm: syz.4.116 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Call Trace:
  <TASK>
  dump_stack_lvl+0x94/0xd0 lib/dump_stack.c:120

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
