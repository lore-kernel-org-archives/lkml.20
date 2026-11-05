Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837362;
	b=w+YtFcD9nQHMRy5VYvnYOeKKJ/LjkXPIzIZh0XKbUP/DPf8gw/yq6XYwk0a8PHoo7t+s
	 SsiIaamCUZGZQAM+JlPE7GdBzv30BohMgz9Dxv7Vr8fz3IFBKaA2swR//BPXfUFTSrwWT
	 JpyHopliHklmUe4DLqYVo4ktmGkqjNp9j1KmrB04rU6/X2w31oAlk/0pZmv6cN6r8lKtc
	 CMSwuHiDe9RXYtTClJb2l5po0N57B+4mlhEdywjomMCHHb/QDwBdoIs4BX/pf3fI2ux1X
	 S1c8f6dwSQzb8ugUubRI8CJp9+bWQlpOgxKTTCnDT0tAp0Ah0u6Rou7yGp0HwiZan/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
	b=MUo21dcGB/mD7ORGCtZYj/B3YExZ7Scl2uAuR4wtLubCoFnXQaMZkBjIdCTp+pOxWa2c
	 w1amvbgatPbwkXyrDzs1mMpRyJEyR33Nztp28dX0rJNAj5hsQDRxOVl64d74zgPbs1kKz
	 6Bo7YJQbIlD1p0kT3N7HYBR5fr7KxRp1OATLmxvV1u+jZxnyv7atLkkzjG7BOuskqKr/W
	 kcL4UJ3vS7HVU4xnZpflOUBygl8oCi8uOHEw6Shk144+KXXWLhDgqiCkfgcfmaCJogx2d
	 QLDl1QUAAaRvO7HQBefFEUKkMAvQSRlzUJIK2RlRw75TZ0HtJzIB8WqoKkieku9SzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNLgfPbH;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC35606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC35606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNLgfPbH
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0afe09854so183371a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837362; x=1794442162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
        b=ZNLgfPbH7vUmYfIeS9V0roTfzAAefwyXv0a+VKA/+NezG3VMXCTqt/w41TWm2V7ye2
         v6JhDIsU5BB+OD9P4libjsoLfnr85WDlefj9L2sBhcdXrNPZUWiWIDjWC/HcBYLjdBum
         sIOW+6+eZaq6bPwydSTBRK40gesxjKFo3fcBjIQCRmBPutlP/EftFTdPspj6OzXG6Cx8
         w/MoRgtDoV6JppMpu/WqrXJcg599Xuf19Ip1da7/cLHXvX6Gr6i8ti5xH62iveYJHzGC
         WSbAZeTIIEFYMSMyLHx3JAb9RONTjCR+vHXfVrLQXyz+8pQowrKLDmn8Mv6n0J3ldINb
         rXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837362; x=1794442162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
        b=ueOvy1Rr9ZAush+u6EWTYY2jeTliNAcbWDutMfrrLPnZCJMf7GsQnLTSUCDL58qd1J
         +Vw6iTLzymjcH1hBOTBQhx6kzASYQ7cAS7sKglGMaI8x3oKHlUJWivbddNipnwBpTffM
         2o4+tLA1E41CG3fDGTC+sFfQthS21wXpcngI7f0XifSmMCPuyZB8Z0ZiSMPn9E8H+2D5
         q3TCcWYb4ICzd1XSLzgs9uP+PO27U4XvRqhTrYKXEHBosQgTOhN+IRGD8brl8TRLe/qT
         dxbpRvOY/GWY6v9cnd9rv3HwEq843RZ12KRR+3joJd0DbNQy/UaWJkUth6sLD71j/lmH
         nl5A==
X-Forwarded-Encrypted: i=1; AKwUvByB8l/qGmjXyUpfBAY1SexK4iXxulfKZAE7DAoi1rfaDOQLIeCzArea7auKHI3uB1YAdewnz2zomAFSBcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CbTuxkozPOaSuYHufeAwSEbmvuirsYfJFCtSXG8XX7I9Dd8Jw
	ivFtE8BmgzqRwDrlDJ6F3sfUrEaLL/5s+n2S9Djt+Zr6NRdHFoKNSaXb
X-Gm-Gg: AYBFou3/K5PgDRrnob319dnw9clTQ27shBhrc97cqic0QLfKEDQVACt9wVXYCG24+lh
	PGmZv6Ma49zdgTOS7Ecwf2BOd3580QThNY9WLhMh6SGIpBLOe9DkzeIK4n2nSV3bml1JHBRIGUi
	cnuO2vQK/NlAnk4UdEhPZTLQEjmCjP32Jl9JX822ZdjPnEabN24AmsvNfpyGCcYsUrnmqHbR2AM
	V8Yl77Tg3mzpsdMjIsLpeOHMnqaDaA8HWSnesBpd7Ki0BXJi1BpoKD2xWmqGz4WSRSWJk3sKyPs
	J9XNGo2P0vJwYMYo8jjo+W4yGZT7+oF7uE/zCh0i5wsGK75muSVwo63xlogNzHQGkWlKXi96TnR
	G0TRH36rW2olQG16YntHJr4NlDBESu9mtyP3PfTPd8K2AEp4yZxxavL95O1mK5zrLeBRbgc103W
	0/OFoyBtvuJuiJbhqLOgTQU+Udp0z/4nrd6tygpNybYB4hGT+lLlw+Y7upnllY5MImqsdvAhycd
	X2LEkO600vYTgn8BgQE85k7AA4oGGEoxqS8YBXj+YaEMamHWIWoKAmrBf/peWL2lUIzDWrqt9e7
	IA3S+6pzGJ6nBSposUGAWr4KGvqWEqMf6p6CiZVajk1/kHhkq0ge/XJcM+u6nV3zvh+ZTrfuGRT
	x9B28uz7XBfBS/QqAZPsO883LvAZosiwgKOdaGjWiaXmJyz4=
X-Received: by 2002:a17:90b:2e07:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b09e2c9e85mr2639557a91.2.1793837361622;
        Wed, 04 Nov 2026 16:09:21 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:20 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v15 00/12] ALSA: virtio: staged capture recovery and PCM ACK handoff
Date: Thu,  5 Nov 2026 09:09:03 +0900
Message-ID: <20261105000915.15177-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi Takashi,

This twelve-patch series replaces v14 and is based on
a4311e9447bbb219044db38897f95be112f46a8a.

The follow-up closes a PCM ACK race after the core clears stop_operating and
before sync_stop finishes. If a substream is already stopped with a transfer
XRUN latched, playback and both capture ACK paths now return -EBADFD before
they can re-enter the XRUN path and re-arm stop_operating. A transfer XRUN on
an active stream keeps the existing -EPIPE behavior. A capture tail remains
available during DRAINING when no transfer XRUN is latched.

I reproduced the race in playback and capture. In each baseline run, the ACK
returned -EPIPE, changed the PCM state to XRUN, and re-armed stop_operating.
The candidate returned -EBADFD and kept the stream PREPARED with
stop_operating clear. The capture comparisons cover a synthetic stage-04
fixture and the real virtio-snd module at stage 12. A separate instrumented
stage-12 QEMU run placed playback ACK in the core sync_stop handoff window;
its production playback ACK functions match the candidate source byte for
byte. The tests also checked the clean DRAINING tail and the latched-XRUN
case.

All twelve cumulative stages built on 7.3.0-rc7-virtio-next-kasan. The six
ACK/XRUN race comparisons and three ops regression runs completed with exit
status zero. KASAN and lockdep reported no diagnostics. KCSAN was not enabled.
The stage-04 fixture logs include ignored notices for five module parameters;
these are recorded separately from kernel diagnostics. No physical-device
capture or suspend test was performed.

The harness leaves behavior_passed unset, so the reported behavior is derived
from the guest serial markers. The attached evidence records source, build,
image, module, fixture, and serial-log hashes.

Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
