Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648514;
	b=eMG9EqFxbTr8kfiKowygQO8V1RALi/HqQq6R/zjYBAVVuz7OBDuQlgXACcJv/m7gTM+d
	 m/2g0C0lLIWqOGp8r2UXGvJ/uUhJRLGAicW5PwFlyX/jfSLA1gJywnMxAxU6xy0I/x2k0
	 QrnyvQr7kzyLEshDPMjWLt/Nwu7ESVd5Zbuwv4wdNpdtb3Dzc0JZp7ngfifz5xGt6rSqP
	 UIp8TzuVKk1UJbjGKCA+RA4xP/LfebmiLW15O2ILjjdyPvMURFBi0fLz49hvZ+IsVzwcs
	 jt3wQU+frW9kYAZykBkOM7AUv6khFckIk2bw1BbiijgkUig6lsY1PfkgWr7snJh9O0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0/kW4wsUT2zMWwDMXId0KVLRkh79sc/p2tB0g0CvyX8=;
	b=0Pv35YFz3/4byP+DbCp9Y3NFL9H2/r+NMcgaYABvVqKnBqQs67Kylm5dcpQqf6JOpAdG
	 QbyUY0PIWJDln0Brmkuwtj8+AH0Yw76SEzc449/r/ikKG9bIE5qMKx6P0KnuoXLLb5e/u
	 jCzEC5SHGiQszRluDXSgsPXUMeVSyg8rWAOizOlTXCE0I18FfvrCOwPBE9CDlpu2DBLwd
	 JqPnMG4pxMWiL3JD0iBotwrakEAFT8GTblOeXCQ3pWtB03FRWv2/rx4grqniDalzdbD4m
	 oSl45J7kDzByvVZAa9LNbPT0WljlN136MdtCuFKXE9Ox1djk88CExGl72AtIJUFjTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vXbEA/cV";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A6606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3A6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXbEA/cV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso34347795e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648512; x=1794253312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/kW4wsUT2zMWwDMXId0KVLRkh79sc/p2tB0g0CvyX8=;
        b=vXbEA/cVsgpLBA+azcRZA2ASVEOzgTJFnveq6eWQPDhU+O4DlvObQyts7dGL4+k0oE
         re30MZKqEueDei6hgL507XH2Nr/t8nmRrEk9Aea/PnAbhpi2PSB37ty8j+2sakxAi0Ab
         psp/ltjIQk9IIz5ENhhVwYaV6m902wOnmdLa9rKQ9g6sQAFY6CMklvLWeUlSV8D6HPBL
         NZCFZz+ih4sJ+RPt907nVU1SqJ39hJLRQ64q/bY9IbjJogUpurPdYFjt+/jJ1cODBTs7
         JQUsThwY6xDTDljsaj7oKiNSR59jO7AaYwjplL7NQ4QAZUDDXS4W7e+hK3xDAHlyxDRl
         3OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648512; x=1794253312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/kW4wsUT2zMWwDMXId0KVLRkh79sc/p2tB0g0CvyX8=;
        b=DTJUbhPRInAb50cLBW2HotX8gium35micnFNOrhnv3PTegc8D0B5C7+Wi31fABhuKs
         SoSd67hvhYMfrlp2iGFEOCaGKn72Xkzqr7c884O/BP8HLFhazfIgCTw+Lrf8EVSEAIfy
         PBuO4ALkp7Z0gFDGYUu3iIlsfMgz53WdMNr+6Sn9H1VenboO2327rakWTrSStVWhFHmw
         YrMm/wiFZs7vPhiTyvEcO8zSCjcMmhznGjBx9nfp0NsdX4/Bnt6Ezx4Gzo7R5SGeFuEk
         JUOp6R2mGQrOs8hVxeReYoM8+I/rRCFnrWdP69/rwtDB63g0Kv5laAxm5m1HOZSA76ut
         S1HA==
X-Forwarded-Encrypted: i=1; AKwUvBx1e/60QB4S/He8haouHToB1LYU9ae14WxvOKTe2yRgttgduh012QOLbZItv9yz01bERqfFjQrrgEuUb8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYk9kt6sZjlFMrodO9EzhsrhtysLYcpRx355/ZYz1o71A1kwy/
	etZCJOxOZhyH/w6sdk8UY1pb09mIvkYiL4OTazG90P1o/2BrnG2DU9b6
X-Gm-Gg: AYBFou1fZ13uWEmlKqx4YfpOPP9G9Cl2GdN94a1ApUmU8cbbY0RpRQ7fnIkTd60vNBc
	fG3/fmv6jkEy3RSsWT+qx7B6Avw5xSMnyybkNF6jJ+VRgnttJCUpeEY7lxjMqbQ62nnxu55qhWB
	sGrUB5T6SMZuoZ3hC+RsBjI92H5wlnJWab1QjGiQ/ph+uXjgfDlSNF+YEbRFH60yKi8JkbmMgPV
	CA+4oRwbG3bjSQ+d3a1yBQ71DArICVX5JhJVehuCtXaDoy3D14dSRm3+xBUl1531J3EORIcEVBA
	KgYnHGVnV6NkTsmNWPkcVmrGQ8dZZ+4bUTZ5qYc9VdySyYqD8PbFK5iuuc4zwgjPbErQkgINrGq
	mm8zM3oihEbeW9wWBfZWYHuXdbHekUlnqbUI9BCnEX2l/4A7XjS8IYxroMhpYS9tEQG7jzEGt2d
	0bjEu3o2ugEYOHdulqDsFPyvcl4+i4nnJp2Wb4nDMa9WkRURVWAZ5s9Mmlua0HgKdJWlIogxxtN
	f47Xobw3Ud6UYQtXMT2MgzQEZ+8WsDhzVtCyNrBnFb64v1c9BPnK/RpF0J2XOdZGqRfFoYzPAEP
	NM8C5NZoIwsPPFYSPTm5a6inzNj4p2Xne8VmK9uySKxHgZnkjM4qSCVfpUdx03MbbcygycS8CSk
	5
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr251986635e9.18.1793648512393;
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm231386345e9.4.2026.11.02.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
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
Subject: [PATCH bpf-next v2 0/5] libbpf: Support gen loader attach
Date: Mon,  2 Nov 2026 19:41:39 +0000
Message-ID: <20261102194145.620210-1-mahe.tardy@gmail.com>
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

v2 updates:
- rebased to includes changes from the 'libbpf: BPF program manual
  loading'[^2] patch series that conflicts with that series.

[^1]: https://lpc.events/event/20/contributions/2437/
[^2]: https://lore.kernel.org/bpf/20261029223348.3730738-1-andrey.grodzovsky@crowdstrike.com/

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
 tools/lib/bpf/libbpf.c                        |  55 ++++-
 tools/lib/bpf/libbpf.h                        |   3 +-
 tools/lib/bpf/skel_internal.h                 |   4 +
 .../bpf/prog_tests/gen_loader_attach.c        | 229 ++++++++++++++++++
 .../selftests/bpf/progs/gen_loader_attach.c   |  48 ++++
 10 files changed, 435 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/gen_loader_attach.c

--
2.43.0

