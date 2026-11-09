Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237940;
	b=kbTawJZqJvjxKrbGA8qHHCC7qHk/6BJy3GB9FnvfqLY4dULV/FmFbkCMMlmK30JMkXSY
	 rd/N4TSiylxf8qYmnSGNDEy5it0KfQ7B7886YSIBV3YOa+2ipzJRj+e3xwr5W003t496V
	 FLTqMPAGBeltd8Xz5l1omCnKC8odbHmhKpl2iYdMmzrVgbTyfboCdPN24YEssje2JPCMi
	 da10hx4yUdC9cO2qeAisc9V5cTlJdGDIWOH8MtbLOktu9Lg6IFK4/MOjmd9J59Lwvve4K
	 pCJK5KlAEIo3OdpLPqcZuuPk5R2fUc9Il77O77aZUVT7CQ48BuSK5V0CKWFI3skQTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:From:X-Google-Original-From:
	 To:Cc:Subject:Date:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+2eo50vndD4kHyto0T87+2tamN+YBpxl6Kj/Chr71eo=;
	b=hQYXWoXwSdpVOUADv6Gchxb1fwjcP0xEMTeB+qcqX1En/Rmn19uQNW30CUXQ3onSmwBj
	 t9ZqOr6iEUjUGfW+XR2PoadcJvwlnmQtHAhYskKIlmwPxtL4QIARI8B0Pxo23ju7XlQlh
	 M5278gQpoeCmp7HQBnckGQMfDhgwS3WgIkMtjJKuoWH3xSWuGTl4l4yVXUJyZETlGDYXD
	 HKPgMjuvbFgBJNTsPTMoJ01xxabtNRk1HfhG+URD6d0sA+vlSlekW3IZ50djk12esKC84
	 GsCtBeN2LqHMVJdqZEVod8gT3d65qJ+EAvsXppuUziSWdhibcUkh39uV2DBadMEwZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAH5Td1V;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00BB5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAH5Td1V
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso359205a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794237939; x=1794842739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:subject:cc
         :to:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2eo50vndD4kHyto0T87+2tamN+YBpxl6Kj/Chr71eo=;
        b=QAH5Td1VVsnMLp74yBsh4npC78p5NNQ1yeYU7wlnu0FWjl/bPOeUPjHSKfgSElKUaY
         sL7qtgp1plN4TJ3twIW+lQcQWqMV52IR3AswYPfeaf3pHMgWa1T0Vo5v0HVn30K5LzJO
         AjM6aNGBh0xyNGbzIh8womUFdwHXj0Yu8W20njfgXPOxLfw/5XXyh8shBACc/Ny3dsRc
         0KUiBokdaY41XjPAnqRokYNmrA63vPfK9OspssxFsn+CpDg8tOFDfl8sfZDIhJhTz+gh
         jJvN/MglHjaK1X8YBA3Z89RzXSYmdRKI9yxNToQxDj6BnYbU2Mej2WjBdVGkxHAGfRyq
         tWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237939; x=1794842739;
        h=content-transfer-encoding:content-type:mime-version:date:subject:cc
         :to:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+2eo50vndD4kHyto0T87+2tamN+YBpxl6Kj/Chr71eo=;
        b=QLXbEOh0uYG2vmsNC3fhxoftLTSqsg60w84gK619hA3j/yMcEx/3HSAYtx3eo5MN5y
         0S9cKtE6iMlfDjNHXEjkgE7tyeFrmgYQZVVET2tiGnE4IE1lmyKD1AZ7523qywfDYV8v
         W+3ocIfuz1fHhy6ko8nis08uJ03hCD9/sKXKAsf2V590lTaEN1GThh2udv7ds0V6rcJ6
         a4dW3tHRFsl0k3IFmnp1JxiC31oXnL+Y7+0TL6OeWIk4NG2xyLM8T1q2hpakA7oFk429
         G9tMiaMk+lSlgJslZj2jAVVpyxdAx2nQbB8Hj7fOXACY9y/0mrWD6n/lxj5Zjy36znyK
         z7Zg==
X-Forwarded-Encrypted: i=1; AL+hErGnDjaybmqSjVdZ7iRKxw8nBJIiBtEpgStmzUWvk2oNSW1iJMneBsyPExAHeyW5REVfjAxB0Kx6mc/Czs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iru6PH6ESJb+bhymdrmQF/wMs48qxH1RcVeyy9SnPJFS85XQC
	OvZVVfv4vy8R5DxqV6kgs3JfrB+OSMuPjM2JT+C5U7Qollfk/cGWiJIq
X-Gm-Gg: AYBFou12FasVBJqjRexmdQYzoFykEMnSzxv+yYnwJKbRujRQxp2c9Qa+mqv2oEaQLl6
	OjxhxXNz0SnH7heO5oOgrRP8jcjBjIrKteooZfoLBPuECzthk3jX5Fkvv/n+212iKUnah/+2X2k
	2/TMbyEhqOfNcW9VTqyHtqTueQibFikWWOxa34VsMP5VKPYf0jirCj8NQ4dMDWc2XfT9c7TDKh/
	aZwPj4EQZBLAk9o1XTpn9dg1c9PzjTLDCrS9HJgMoC3KYn3JMx7H5aeVBkeJLB2y66Qj3Ot6UvC
	JisSmOrfn1ZzV6BtbNpDhITCd83F20s6r/wP1sEH96u5nYBjnW6DSoAMEnXTS2fFiafB6TlZWO5
	JMqm8k2vsvjwl2ic2UmrfWuCnNkMhG3mUYbt96rJm4rVwB47XlnOU2wH7irK1jz0TwJ5g5qC+F4
	7AU0eUArqAQalQELWFckIj5GGqcdem0ePqUu5nH7Po0LBQsEdiZy7yuo12xNLrQ9ZUfbjEENnmQ
	8k2czDxfrOBYAbaFKRnDC4obLt5FGz8CJDMZnp+pZHR97T54/dNj5dbr864/iUd+J9dm7JD06uv
	VdJ6CsvF+kJBE1j+5Z1n+z/wJ+eRxBTNwLEJ+oqURkmRUTiJ62g=
X-Received: by 2002:a17:90b:33ca:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b12d418819mr4176458a91.17.1794237938727;
        Mon, 09 Nov 2026 07:25:38 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864bffsm11462095a91.3.2026.11.09.07.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:25:38 -0800 (PST)
Message-ID: <6af1e5f2.a438010f.130489.ab94@mx.google.com>
X-Google-Original-Message-ID: <<179423792787.1832964.14629633117175086624@gmail.com>>
From: Zhijian Han <hanzhijian1991@gmail.com>
X-Google-Original-From: Zhijian Han <hanzhijian@zepp.com>
To: bpf@vger.kernel.org,
	sched-ext@lists.linux.dev
Cc: daniel@iogearbox.net,
	tj@kernel.org,
	ast@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	linux-kernel@vger.kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: sched_ext selftest enable_cmask fails to load on 7.4-rc2: verifier rejects arena pointer cast from scx_enable_args.cmask_arena_addr
Date: Mon,  9 Nov 2026 23:25:32 +0800
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zhijian Han <hanzhijian1991@gmail.com>

Hello,

The enable_cmask selftest (tools/testing/selftests/sched_ext/, added in
the recent merge window via d781d1b78acf "selftests/sched_ext: Check the
cmask cid-form ops.enable() receives") fails to load on v7.4-rc2 and
linux-next-20261105. The BPF program enable_cmask_enable is rejected by
the verifier at load time:

  libbpf: prog 'enable_cmask_enable': BPF program load failed: -EACCES
  94: (61) r1 = *(u32 *)(r8 +0)
  R8 invalid mem access 'scalar'
  Verification failed: Register Type Safety: Invalid dereference

The test follows the usage documented in kernel/sched/ext/internal.h:

  struct scx_enable_args {
          u64     cmask_arena_addr;
  };

  /*
   * ... The address is a plain value rather than a typed pointer ...
   * Cast it to struct scx_cmask __arena * before use.
   */

i.e. enable_cmask.bpf.c:101:

  struct scx_cmask __arena *m =
          (struct scx_cmask __arena *)args->cmask_arena_addr;

The C cast does not emit an addr_space_cast insn: in the generated
bytecode the member load (insn 1: r7 = *(u64 *)(r2 + 0)) produces
R7=scalar(), which stays scalar across the cast and the inlined
check_mask() prologue, so the first dereference m->base (insn 94) is
rejected.

The same selftest was verified by Tejun on the for-7.3-fixes branch
(per the v3 cover letter, 20260919002838.1960071-1-tj, 16-CPU VM, three
standalone runs plus the full suite); the verifier-side arena handling
that changed during the 7.4 merge window appears to no longer accept
this pattern. The struct_ops argument path (direct __arena args, e.g.
ops.set_cmask) still works — only the u64-carried address form is
affected.

Reproducer (deterministic, two consecutive runs identical):

  # kernel: defconfig + SCHED_CLASS_EXT, DEBUG_INFO_BTF, FUNCTION_TRACER
  make O=build -j$(nproc)
  cd tools/testing/selftests/sched_ext
  make LLVM=1 O=$PWD/../../../../../build OUTPUT=out/ TEST_GEN_MODS_DIR=

  # initrd with out/runner + out/build + libs + busybox + kernel .config
  # at /boot/config-$(uname -r); then:
  qemu-system-x86_64 -enable-kvm -smp 4 -m 2G -nographic \
    -kernel build/arch/x86/boot/bzImage -initrd initrd.cpio.gz \
    -append "console=ttyS0"

  /root # ./runner -t enable_cmask
  not ok 1 enable_cmask #

Tested on:
  v7.4-rc2 (7475ea8b5):          FAIL  (verifier rejects at load)
  next-20261105 (gddfe51b0a0f5): FAIL  (same rejection)
  v7.3:                          SKIP  (struct scx_enable_args not present)

Compiler versions tried: clang 18 and clang 19 — identical bytecode
around the failing insn, identical rejection, so this does not look
compiler-dependent.

The other 40 tests in the suite pass on both 7.4-rc2 and next (after
enabling CONFIG_FUNCTION_TRACER, without which the fentry-based tests
maximal/kick_immediate/reload_loop fail with -EBUSY — worth a note in
the selftest docs, but that part is config, not a bug).

Possible directions (not investigated in depth):
  - a kfunc or verifier-supported way to convert the u64 carried in
    scx_enable_args into a PTR_TO_ARENA,
  - or an __arena-typed member/alias in scx_enable_args once BTF can
    express arena pointer members (the internal.h comment already
    anticipates this),
  - or adjusting the test to obtain the cmask through a path the
    verifier accepts.

Full verifier log and QEMU boot log available on request.

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
