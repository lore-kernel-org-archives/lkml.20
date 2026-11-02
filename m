Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650444;
	b=MXK/IpNtLnhJLBi4sLdWOu0susGj1BQJS5B3Gv1zK4OB71KKT71hXGSD9Zo3MmUtTDEz
	 Mk/7ijn+dTxivC4Hzv/kKCX8EkWHnr7h84BFolat6yDcwxQIAN85Kds2PcleKgFMbnUNH
	 RarAVxLojgRIdQAKY7aZ3wcW92JQQBYJXDjGRlGlp/sSmlM3ZiOm3UAAZ5ICgL4ADkK4Q
	 tEemrq7I8QLidyfERzZKSAlJ1ukVda6+vw3mdlAjXqwe+xBTcULDU3t4dbZwrLFD4/DP2
	 9C1h9kDIePlhQQnr5EMRvOXh5X+r0mnwZ/ekPX3IGUNtT8BIbXnM5xqK54H7uU/g1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tGanUMfayq3PdyLOv1Doxlx1VPFFMeHl/eaWWctPQ0U=;
	b=emUL0W6hBo3vlR/sQSkJedERB1O2i4NDxrS2Jdf5UYpLUtbgGfLYrpbqepkgjMfdGLFh
	 aXIrWldR9Acq9bre30aVddNgnHf6K1r+Ye+cGe5gYqpNGuIfwlRJkztKAFtdmHKxxMwZg
	 Vnj/7SbClwKszXkO/ZsTYVjEXi9AYHs6J+Jdv8wHRW9yZncHClZ+F2XknyZa9rNs545iv
	 nloYs21Vti0b4DIG+dxsp00Tk2Atp+AnEOQxarF/rU2S0SZ8jYKZCD3KU6VzmRewnwkd9
	 Nz9xZ/lQmktCxmxTipGPsEBriWzlJcg4Xn5BVWaKP6UEWwlHqHjmDHW46M+qZEPoUvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixO318e;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDD7606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DDD7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixO318e
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3537306f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650442; x=1794255242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGanUMfayq3PdyLOv1Doxlx1VPFFMeHl/eaWWctPQ0U=;
        b=zixO318eJYLfhb+XNiTcj4Wd8KTuj8oKOfOp7Fqp8NvJFc/1JZBHI6keegIn+u7btr
         CKKm0WeJ7v4EhvVDWDguBbTah0n7jssE4aJOXj/5z27tjK+6U5lClhma48jfdLpNYWJp
         Wi2T5jaYdn/ArobqwxviNhfr4U0CAmYzvuhyX+4yYNYUCwhmQ05bBgyI6F6aICXxcz75
         +4VHeU7duOBeddPuirmFB5z8bWKFF21FZEDwXEGu0ADxleF3gJboUmDE/aGw2unc33L4
         MvNohpwynI346AQ0mB/RMr0S98P5cuSOcOranZBcOrgxmz0XnaSWkLTNSoHMOvZosjWI
         g3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650442; x=1794255242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGanUMfayq3PdyLOv1Doxlx1VPFFMeHl/eaWWctPQ0U=;
        b=eunq4UmPKc87tJvOP17cBD6PzQkLWsPITLi8VU96IYt25lUWHz9wVm8ek0kmOgnpU+
         Af7mtG2F2U49AWN0a3buJ6xvB1LnKrkm4rXqTRNpWs1YZGsElEy4RS8LSw+3gtdfXHEE
         q3UcXLVLe+Ckf10IdgGKlk3iiMom81LOENEheEmJFzwhSC6aQnjXDMJYcEAZ8fZ7gkFB
         vlnM7OZ+9yEjhvcB9r+fG3R8uzjPuHx4ZqOmwahTElkj9FGv5TRYJeUoyLiNEXekMdfM
         /HXsfJkZu8xwtD62necTNdwUsM3LEleZ+eDzbrRDIYcP1pJkn3Fa4m8dY0/fY5/WgrND
         1eXg==
X-Forwarded-Encrypted: i=1; AKwUvBzQEUxV7icr92EXLxEQSPlBtyAJAJZtWH4YNZjjJIjAiQKjzWwmFWqtUYy/PqecblHV7PK6hSqIP5AoX+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqW9PgQ+KVU0C58j3NsTbNXLemb0GcG41l6CGircJbyvbDoHUf
	3RaVrfFtpig6YFJeF8EfVUjbXZ96CsbCSnXoGVfFbZnf90hYKpMWsHuL
X-Gm-Gg: AYBFou1t6z9axTZCkfCIythl6Bq+D6QSnd1wvwPFa5BtETRM7W/jDa6yPmbKYo6alIg
	Y6L8SYxEKSDWN63QDWzXnCaNKYA9ae2izX6rXmOriwAayic9cMKL1g5YJXmuVrLfDHiahIPbhbm
	9TnuZjqaAsT7lJB1wmYpL+QgGKprriY/1Jej6dqcQOXK7Uea6P/eVqJ3Y7z9ULl3wpeG3xHXyGy
	3OYPESt1fwWv9q5LHmIH3CW+Z5uSAxJbNiHJ4jp3sGC81ZB9RrOMF8ACMXG6Vayxty5uqepvkhp
	eOxPhCFgEQUjbq9jjSIJQ+WTVA/14KjyoZLm0O+i88lEv0rJ5CTaV0qyrq91VgCVCw/Nx4dsYCs
	std5oYWJp8uiExvrauQmK0pf+E9foRm4lOWyjPtZUEkygmAG1G+ESZfa9ZFZpw3VF7SaY0yD3l5
	hOt+mfAWO4Ny/vKrwSFI1xuB5M31o8pgkpmQh6FLSaZdFCW4X9H2Tz7erC3G+FrpETtOLHmMZms
	rvMBx7+/6lGZmmhaGK+YXA/WTbJG5hr0ApzZpqW9sx7dqePbb7CMfRgEhbm8oHoH9W1hH/A+T5h
	pEOQ/ek4gVzWaV2T/2eotE5ddcxQS6k30sDkdi9AGX/WdGp9ngy06XA69Kkk2czWDqUliGGg0rF
	i
X-Received: by 2002:a05:600c:34d1:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ac183d136dmr250002875e9.24.1793650442391;
        Mon, 02 Nov 2026 12:14:02 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm21471805f8f.43.2026.11.02.12.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:14:01 -0800 (PST)
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
Subject: [PATCH bpf-next v3 0/5] libbpf: Support gen loader attach
Date: Mon,  2 Nov 2026 20:13:51 +0000
Message-ID: <20261102201356.5798-1-mahe.tardy@gmail.com>
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

v3 updates:
- rebased again because I had a debug commit in between master and my
  patches that somehow surprisingly conflicted... sorry for the spam!

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

