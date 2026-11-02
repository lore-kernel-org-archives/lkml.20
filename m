Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641445;
	b=jG/jbzUarbk7QVe3lAtOIY/GDsnuR9h+3g8BVUxGBlrc0zBhS+9vWtqignWgcuPYW9gm
	 WbQaHrT48MNKLFK/lULqukiXy7rkaQ3HwURgDpOF3pIeZMybIrxq4+01c1VDRWJkoV3uE
	 wcJHQ7fp9a23aQu/f2EJ0DU1Zn6X3Ve7AGI/Me1K94p7ChJNL3a+ZbxJmxFiEVWZrQY/3
	 TtioYmmxKt/A8DHHWV5TelaiCLBVc50vKko66Rx526ow1nTrj9KzALDAr1godsvHIRK7j
	 vz2XQEgo0Ts9IvGKHlBecW4VLAKP96Crm9ioysdw5GJZEa0fQ7yM0YA/ICdjAgfrbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DU6n5xddllI3TFFpGzdMLCmW2JMizz1ppgKr4JRiny0=;
	b=bjqP/CW7B7x5sdvywseuZVatIzfAojH02vOaGmoex2Nv5VMXX7MXv2mJA2n4juV5i5dE
	 TdllZPo5+08FsCFA5JIV18Z9es3bGHRJx5QYMFD9vP51+uPvn/cbrM2by+KQC/9QrNJAy
	 cEI1yZviqXA4cIqDKtVmwaeELAB4Dm045+96E/u/lrPDdkNLgDq+RTlCXSvkt7nlkQszG
	 xgtY9rmPTPTlu/PI8KpI8CmPuYezo1JLFFtNb9FJa8XpKwb+yUSG3N5xc2nzCcIpVW8TB
	 FB9Jxhc8rao7fa766widquw+BkmHdfBb8AW/m47CkochUhx9JbvWsBmk0WuNYSFMjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ELreSK/6";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0F606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C0F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ELreSK/6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so31921765e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641443; x=1794246243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DU6n5xddllI3TFFpGzdMLCmW2JMizz1ppgKr4JRiny0=;
        b=ELreSK/6sFM2LAmhADhCQ+Je840uXhfuSmlxBE2nyYecZDxpNCEdvZIZP5MgGlerwN
         2bgPw5WGEZEfZ033KjYNcUP1+lOJmHbbChgRRqJhSpFcHXg8sUokgDDste67WVukBG5/
         nrW7Ho0LPvfbLnj8L6PkQKwAJCu1zz8d5ZXRcvFFZ69B4/OljG32iAn922CXQzvSfwmj
         JN27kOXyV1+LqkbrgJMW9xjKS/cWpKaVhcnSOJ0eD85iyBrsnHmXO6bXN2K+jP59ZoJh
         GnnrE26mDV7Svi4EToXq8/JYskzjJru9AgygJJvB35aBgSwpDO7ZGARzxTPAHHtdWvxy
         t46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641443; x=1794246243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DU6n5xddllI3TFFpGzdMLCmW2JMizz1ppgKr4JRiny0=;
        b=jya18YBbIyrGdeFaGOaShSrgGV5d9JRHVVrTzrjTx5VscgtnHge5qWc6ZWbrRNKJ4x
         XqGHJDv2TblYshkHNDL/Uu8HskWBL/Ic0M0I6i+bbfqPkb9vTQThPdLeN2hfhq0uY30b
         Q8HTfHD0vEh5sCvymWw+EMVsHYvoMuC43s5Z8KN7mP9K1U0ByWFvkvWL/Y6ez3jIj7bq
         dExNEOGVGGKmUlQ4fGZOGXovCAkr7cY0Hnscg0JYzbQNuqxBJ2TXmSKoMCFE89s8zLtN
         BXn4qJfeasXiTUMyuQYLBq2YPGAnLefF6RBBwULmnroM3qxjt+d2Ehlddgu+dwdF2GCm
         YWcw==
X-Forwarded-Encrypted: i=1; AKwUvByDIK2QD7iRQfUKtDrE1zJ9PrirsjuTfO3tAHgmDFbq7sNpSDCkUc+O2qbbBKX2qaBcLCeRMzzqUdq4lSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3ToZ3FdZBumbwTNuHsd6KnVLkYW2rUM7vIZ3GMuTZ4FTHl+iq
	OGEi+u0yLXzo+7l2O+hwh79rbM+1Z+LfjnpOleXMSqBuHJ3hSe7IIF4O
X-Gm-Gg: AYBFou0l9e5lajJhT01CDjwLijenn1ziF4UCfAi4b0uByxjnSGaNNLMfa0yMN214CAj
	l8YzSQ1f/dQ8GxGq5EvkqvCn8mq3G6C9aAy7OaIMbMT3CXkXak+t+wvL7r48xGsqc8DROy58PLC
	vOJ0b+emLxPu/03gBvTkuMGF8vpxOGiqvJwzJdz5A+yhZuFCIVVVLVmDy/liHAr7ZbPB+fiMANI
	b81QiKOBuxXehh4nCebN6aioncyvD1wet+hS1l7qbRt3xw/CnH/zalPln5tvwDxCbSbr3Q7Nc/D
	vih5/MiP+rTbCib/ijS9NgWiP+bammpZpV+X/3rN4FckO3z96V33xVSHymy2E59Etb6e4zZqr98
	W6MiV5Ln+Uk4PEkfoUF98DJ/m2hUltX0gwFZrnaZRDJsngqQc8PLBshi2QJyJ2cS4tFDlD0UgsV
	9JJaRNlLiklbKjRFCOcgbFlR8958BUHZYKLGoWaoaQ7/icSfQIRy7jM4U0yDY2nqJptqC7735zk
	j7jW8t1ij7f45kWA8ltNNx8H/cljk6wE0Js0/lzcfWKErXmeuCNnl5nVuebzgkxHJl4OmawhcSm
	SzEXyJ66w/EzfqBHQnmFduqD4qwFbCJVcuaZvubIBXoxwhuNb/7ZHs2UHWY9UArEtbRN6ApGUWA
	RlA==
X-Received: by 2002:a05:600c:870f:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4ac185bcf74mr238434735e9.15.1793641443318;
        Mon, 02 Nov 2026 09:44:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm196311865e9.1.2026.11.02.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:02 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 0/5] libbpf: Support gen loader attach
Date: Mon,  2 Nov 2026 17:43:45 +0000
Message-ID: <20261102174350.472592-1-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hey,

I've been working on this in the context of Shirudo[^1]. The current
limitations we face is that gen_loader cannot attach the program it
loads so we still need a userspace component to be allowed to
BPF_LINK_CREATE and we'd like to gradually remove the allowed operations
done in userspace to solely rely on the signed program.

Note that there's no kernel modification in this series, it adds the
gen_attach options and code generation to libbpf and do the wiring from
bpftool. The kernel side was already allowed thanks to 'b1d18a7574d0
("bpf: Extend sys_bpf commands for bpf_syscall programs.")'.

Also note that I did some analyzis with Sashiko and it's been
complaining because I've followed the approach with the prog fds being
initialized to 0 (and not fixing the two fds to init to -1 sentinel
value), so maybe we should pre-patch this.

Lastly, I don't know much about bpftool so unsure if the way I've added
it is the most appropriate way for the lskel attach option.

[^1]: https://lpc.events/event/20/contributions/2437/

Mahe Tardy (5):
  libbpf: Count entry programs for bpf_gen__init()
  libbpf: Track generated loader link FDs
  libbpf: Emit BPF_LINK_CREATE calls in generated loaders
  bpftool: Add attach option for light skeleton generation
  selftests/bpf: Test gen loader attach

 .../bpf/bpftool/Documentation/bpftool-gen.rst |  11 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
 tools/bpf/bpftool/gen.c                       |  67 +++--
 tools/lib/bpf/bpf_gen_internal.h              |   7 +
 tools/lib/bpf/gen_loader.c                    |  41 +++-
 tools/lib/bpf/libbpf.c                        |  56 ++++-
 tools/lib/bpf/libbpf.h                        |   3 +-
 tools/lib/bpf/skel_internal.h                 |   4 +
 .../bpf/prog_tests/gen_loader_attach.c        | 229 ++++++++++++++++++
 .../selftests/bpf/progs/gen_loader_attach.c   |  48 ++++
 10 files changed, 436 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/gen_loader_attach.c

--
2.43.0

