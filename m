Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605055;
	b=YcQURacS3i0tXP1XtzYa7Uq+ljDtpznkOWxwPV7y9tvHhsV3eV6DFXLPvDd2c68j/kly
	 G61IX8/eJDzzfkphLxDgYOEyplQeV2br0W9xebws360J7sDWVMqcKxUAa7JSnNXX38w+E
	 B0xDrOEDiiqTp4Mc8rG4cFiqu8w88eXKX1S3STWYgrlncNoGcj/nQS9WVoyXAC/Rx53H3
	 riYwWQTQd9W+SQjOp9MXxngIe1kk6g/vRJRPdaksQBBDtd7g1llCjzBvqkOybVEBAJeLM
	 p22xoMN40Pw7vkKXj+n81Yiy1IjvWX/eMAy15O3ezAVLS0TIuVDF8o2u+dJ4e2qojhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FhWFPAhlx3PkfOPSMdfzvg8lxyB1LM9Yi9ZslgJUh9M=;
	b=KTPJi79S1ZFMcwJMaorml7fo8I2Gav7l8bdZP+JCb1W28Z9352VZlhnkqRnhryKhdKAu
	 o+jvyO+J8yKFyhaG9aEK5qhi9/xOJpzggK5/JZbij0V2o0T0ZRwJrKHyvappDytx3djtk
	 02d4abmMyzitZNPfqcx3M3pPnN8E4GX78odxyA8PyPkQ3TNl3QCzCp6cNlCAMY4xLPx3I
	 t1KmWTKdsP1sLj4b/huUR/KwxTngLMqw4+4npufyEkETn6r8Ge2q5otku8N01S7jt8slY
	 BcIs5C2GfMrjXzYGCgFosoauL1i7e2kdCLLI14ueGf/VAdnZPgw+pGIUjaBvEHGilWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJy5rvJa;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DF606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6DF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJy5rvJa
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b30cbfa628so15009327b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605053; x=1795209853; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FhWFPAhlx3PkfOPSMdfzvg8lxyB1LM9Yi9ZslgJUh9M=;
        b=BJy5rvJafPobbIoLVUPKhs/edjpptbPAdPiHxbFipHFNLc6IWl5aVRky/uZQ5Qv7K1
         Yp3cN+17qsLDQQJ2pmqG+twcpw80Od1KARNILW8J/fvaIEnKwYAUSEsD3RMv3bSg73D1
         Tg/cxg3hQ2ZmfbzOMqqcKDHbBAIdBWnrlPuzatSmQEYfbZ3wAChPQYdE4puz9NFhpAvB
         OaSnUxFVw3Nfz8WiIbvTP4uclKOsiYneTmwX4LboB2sd3ZYI2ulaknNAlmMGa6GZQoEH
         d/S6Zxx4I55awJ/ilUwqjdkKoODHB6hHgw14Vz/orE4ynHp2iQEShG1WoT7baWTzpEGh
         NnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605053; x=1795209853;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhWFPAhlx3PkfOPSMdfzvg8lxyB1LM9Yi9ZslgJUh9M=;
        b=Ru2v8WheqqO6jSih0O7YorfjC4knkmKszCHqBK27vy/vSqCD2z9Tjh0HkQ2h1yCMDP
         Wc5VR3hD5INicbuUf7NpjdTzbl7URaWgriOKOMi2F9zXrmAxPpbr7ui5HB/+3hN0DNTK
         9u9Q7Xiejxofom8rjwUFMsDjVt85kfU6kNJARG2gj/MXAxXJSPhjw0jjBae07Xazv0Kn
         X4F5utBJJ3Yrixxg28KrGeNezSpiY2D+sslR+XAG0m2kl2yTmrwVrwUq/nTUr4wVYbv+
         XDSYJj2ljojfGUfdZMRBhIntVBAW/WEVC788WugkAroIqNcDXriZ3qRrzU2yQgfsNKvU
         jRhg==
X-Forwarded-Encrypted: i=1; AL+hErHsr9nnvNHG+o8MEauWoCDuN4pOuL3m0s7lpqvhWNAe0SWywIAs+pD/p+hEIq1XA/SzIyRZAFjiMBrmAxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J14OMBwkxURLwUjEmhWNgQVpNR+ODPuMwzynPmRRhARdGTWJN
	jT4jAfX6NLh/5b9xm6dogPbZ4VAyPje/eJBq3ZNYi7ESrd/kxzHhgQI1
X-Gm-Gg: AYBFou1ob/zIkfTxD6IefKCjKIGwJChBdD5AGQGhX/mtVTBaC59/j8ueKhHIjNAPjUx
	lnWlTy57IbVyGFmtaoDbQST04mSvXPkBQwqe8a+D6rAGxTGRc1Gs9paJNG7rw27sJEGRhrPt8KZ
	P8FzZvmlOMe8nsJbOo89zPY2WEGhx18TqgbqQdluDg5dcVlNLp1ghGa8VmKfura8hGobjbXL5Kh
	4+l36v5FSOnlr/bjl7B4m/zQqXZrj9ZHYvkPHskyTUGNnoq2BB8jy4uO2bddN8qj8kobyZNJHW3
	BLN6rhM4GGFAsee1iIbSy6Ln4Haj//eTjEuZNnsJSB43oFBil8ybBrx/5vGKtgqp3HacxF6CYtF
	P19Zx/fVjjDdJ7tLw+Nkb20sW1H88nla/AHFY4TlMQsEW7bbAKTNExolQLrrIzFgoP/dTTjAxAO
	wh2evpbnAIKXPhvTT1KXdHvFuasz0K4TSqyKw25qtVuV2wDIx4F3hn8LvgllZucvkpqeGS9AYmc
	1q7AgdhcFXtmU/1Wd09mJnAb7RPceP0tf6CpRcJ8yqadSkb1hYP3XZS2z1I3oe398fPjzJHMsGe
	J9N1I7tJzp79TMgCdUEMthZOfmXwVV1O7w==
X-Received: by 2002:a05:690c:289:b0:8b3:5969:f245 with SMTP id 00721157ae682-8b4aa0cf2a7mr23640207b3.4.1794605053410;
        Fri, 13 Nov 2026 13:24:13 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm29539357b3.43.2026.11.13.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:24:12 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Subject: [PATCH bpf-next 0/2] bpf, parisc: Add support for BPF_MOVSX in the
 JITs
Date: Fri, 13 Nov 2026 16:24:09 -0500
Message-Id: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWM2wqDMBBEf0X2uaHG0ov9FSkhl7WuYJRsKgHx3
 5v08jgzZ84GjIGQ4V5tEHAlptnnIA8V2EH7JwpyOUNTNxcp5UksOhBbZZZejRTVNK+c1G9thGn
 duXX17SqdhOxYAvaUPv4O8kd4TBEe34VfZkQbi76wRjMKE7S3Q6n+9HHSHDHAvr8BZCBbXa0AA
 AA=
X-Change-ID: 20261113-parisc_bpf_jit_movsx_20261112-b9d59d0871d1
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicholas Dudar <main.kalliope@gmail.com>
X-Mailer: b4 0.16.0

Both PA-RISC JITs compile BPF_MOV | BPF_X without looking at the
offset, so a sign-extending move (offset 8, 16 or 32) is emitted as a
plain move. This series adds the sign extension to the 64-bit and the
32-bit JIT, one patch each. It follows the signed DIV/MOD series [1];
the parisc32 gap was pointed out by Sashiko in review of that series
[2].

Tested under QEMU on a 32-bit and a 64-bit kernel, with test_progs
built as a static 32-bit binary with jit_insns only. jit_insns/movsx
fails without and passes with the patch for the respective JIT, and no
other jit_insns subtest changes. jit_insns/helper_calls is left out on
the 64-bit kernel, where it does not complete with or without the
series. Not tested on physical hardware. The commands and output are in
the patches.

Claude Mythos 5.2 assisted with this patch series.

[1] https://lore.kernel.org/bpf/20260915022905.1535566-1-main.kalliope@gmail.com/
[2] https://lore.kernel.org/r/20260717192714.25C241F000E9@smtp.kernel.org

---
Nicholas Dudar (2):
      bpf, parisc: Add support for BPF_MOVSX in the parisc64 JIT
      bpf, parisc: Add support for BPF_MOVSX in the parisc32 JIT

 arch/parisc/net/bpf_jit_comp32.c | 41 +++++++++++++++++++++++++++++++++++++++-
 arch/parisc/net/bpf_jit_comp64.c | 11 +++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)
---
base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
change-id: 20261113-parisc_bpf_jit_movsx_20261112-b9d59d0871d1

Best regards,
--  
Nicholas Dudar <main.kalliope@gmail.com>

