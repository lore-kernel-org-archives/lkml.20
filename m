Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996410;
	b=0UUoLbV4qep56HbbeiHdIPu5Vjhb/23Em6/pTTXa3/XrWuRKDk8iu82kQcm6812bFKPd
	 9PWjvh8CVU4WL2JmSH5djs/IhnzpypEZdZ38i6x3ZRNvS+xc058GN2ijIExI3kNKr7ZD/
	 GfCIg6m8alKQcw9T819XKkBTxvNGjLqSlKecohgU/dpamKdpMBxhCl+9qXqmfIufdRJxv
	 X8YmA101Cci6nC5fOMBnPz1ZIArw3pfbyQ8FC/JvVbBUpB1rqa+wsgUjjRt6Y4DjQM7MN
	 79kked49XO3mrmIggtjLGH5PVL2xNxsxOSS+GYvQd1PvXiwHsDnI32YGHg6VzvDz5fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2YbFKs9nRA6MfgMEJuRTCHwLHgaje7B0LRpZLEgpNVg=;
	b=d5HfBfVpMgTZFpYQhXAmolBd90zFteJo+nPNEP717sNjt1VJbKHoSd/Rgr6WtS+pvOKe
	 Lwv8z85Q7Qg+oJmY9ymsVBV2Tq7j2ClWgCJRm/mLHgyBO0oPwzHF2gUHN+8tzTwek97OR
	 7Njtq6LdL36GFL+1D5vRcTBVNZPCz6lrreJBbcCGXEWboi3xtgG43D7GudRsy1k3lURWF
	 cq/7L/8UT9Gwn+LwyPdPCAp/eIdpwM3+mYRIBeFojoORQP+DEVmdd6O2TYaYo43xWSfeY
	 hm0vWR6GqzCpkWpLzI2UjXbQ8B5Eh5FnsVu4pNi88S3ZsWTx8cPpgpaA9+rDXiI8gHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQqnp485;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B07606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B07606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQqnp485
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so1058282b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793996409; x=1794601209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YbFKs9nRA6MfgMEJuRTCHwLHgaje7B0LRpZLEgpNVg=;
        b=oQqnp48505ul8fce1kiykiCLp2RBCB0id+7wMmH30erQLzA8JQmunrOmBs4cSNdOnp
         2iNKZqJWYUFQZ47unpZxxxX0f/iH/7ULrKTrrYMEEjQsDlWVORyHPyVBhvS8rCmZ/fhN
         o7jT9adJGO14Qrl6r6L2xIM8t5Xg5yR/AaxTHGoKVbTTau2on1yr7YC6/P2TG8xvPXoC
         FEMJZeADDOVyBg6XKdFgSjHTGG3FBAt4N4dQGuCI2/yuf2umK2hUZCoKNeGRw0pPFTnS
         bcVkwTCIxGxdl78z4+gT0PSaYM3vIYomHZeF4LisCxXaNA4K5aqLiA0ut714gukBKsye
         MUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996409; x=1794601209;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YbFKs9nRA6MfgMEJuRTCHwLHgaje7B0LRpZLEgpNVg=;
        b=MQW2GKpRYMk1hvZ75glfX7jVzRMpIuopx0i1fD2r0zCJimzBwQ6OBEkqzObITS1YpB
         NifNZ+oHomK0x/3hFOL5p7EVn0VJ3Yc0Zu31rYYG5TFpYkFHmOV9pqjNf/2pTq9CBb0L
         /kr0Rco+Xob3DHDdw2lXokRcbZA6LRsB1VkynfpATdlV3kdnf/RTp/1mAIVmzFZVqFAf
         msWsb1hzU8czOxbgRMBCJWB5+jOxgdajzEq6L+WKvrBy7QZvj3VU3tt1so//F/qxguv1
         nBUPxsaNiyDMc7DoLxk34bmpvIaGD6tvkjaJR04AmEGDecREFpcA2mS74qff27adIWtW
         3bMA==
X-Forwarded-Encrypted: i=1; AKwUvBzG+fQ6lKLBgvhHJPcWdS/khzlicAaUBoszry0h4Z+n1NNO3YDAA9nXYb1hBQz2Zjb6fzaYsUiJ33pYQPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WbcfpWvhAWC+11TuodC8uLH89Kp+/fY4R+uexBRVPZ8qn8mIO
	xJ0HlsdQ3paCGf8QRRCV86oJyeF8MoY8A+S69U6Dju7Nol8c34akcGy8ThLKPoKMBHvUrXx+laY
	ZQJQtp2VDzwNE7qsmlw==
X-Received: from pfhx2.prod.google.com ([2002:a05:6a00:1882:b0:89f:5522:3f42])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:139c:b0:8a6:58cb:eeaa with SMTP id d2e1a72fcca58-8b37bb5f095mr3365577b3a.36.1793996408786;
 Fri, 06 Nov 2026 12:20:08 -0800 (PST)
Date: Fri, 06 Nov 2026 20:19:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGM27moC/x2MQQrCMBAAv1L27MJmLQW9Cn2AV/FQ040uljRko
 xRK/27qcQZmVjDJKgbnZoUsXzWdYwV3aMC/hvgU1LEyMHHnHDFO9pYJreSPLzgnQzrSiVpufRg YapayBF3+yxtc+8vuHilglKXAfdt+OM0/UHMAAAA=
X-Change-Id: 20261102-lskel-struct-ops-03090424cfa2
X-Mailer: b4 0.14.3
Message-ID: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
Subject: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light skeletons
From: Siddharth Nayyar <sidnayyar@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, "=?utf-8?q?Thi=C3=A9baud_Weksteen?=" <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>, Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="utf-8"

BPF light skeletons (bpftool gen skeleton -L) compile BPF object loading
into a self-contained BPF_PROG_TYPE_SYSCALL loader program (gen_loader)
embedded in a C header, removing any runtime dependency on libbpf or
userspace BTF parsing. Currently, light skeletons do not support
BPF_MAP_TYPE_STRUCT_OPS maps or BPF_PROG_TYPE_STRUCT_OPS programs
because preparing a struct_ops map normally relies on libbpf parsing the
target vmlinux or kernel module BTF in userspace to resolve type IDs,
struct sizes, member byte offsets, and member indices.

This series adds BPF_MAP_TYPE_STRUCT_OPS support for link-based
(SEC(".struct_ops.link")) maps in light skeletons across both vmlinux
and kernel module BTF targets:

- Patch 1 adds a new bpf_btf_get_struct_member_info() helper for
  BPF_PROG_TYPE_SYSCALL programs to query a struct's byte size (when the
  member name is NULL) or a named member's byte offset and member index
  from vmlinux or module BTF at load time.
- Patches 2-5 wire up struct_ops initialization, map creation, program
  loading, and map update in libbpf's gen_loader. At runtime, the loader
  program resolves the kernel wrapper type bpf_struct_ops_<name> and
  target <name> struct BTF IDs (and module BTF FDs) via
  bpf_btf_find_by_name_kind(), queries struct sizes and member
  offsets/indices via bpf_btf_get_struct_member_info(), constructs the
  kernel vdata buffer in the loader data blob, passes the resolved BTF
  metadata to BPF_MAP_CREATE and BPF_PROG_LOAD, and populates the
  callback program FDs before issuing BPF_MAP_UPDATE_ELEM.
- Patch 6 teaches bpftool to generate per-map skel_link_create() attach
  functions and skel__attach() / skel__detach() plumbing for BPF_F_LINK
  struct_ops maps in light skeletons, skips gen_st_ops_shadow() so the
  light skeleton ctx layout is preserved, and rejects non-link
  struct_ops maps.
- Patch 7 adds light skeleton struct_ops selftests covering both vmlinux
  (tcp_congestion_ops) and bpf_testmod (bpf_testmod_ops, including a
  subset struct with reordered members, scalar fields, detach, and
  re-attachment).

Adding a new BPF helper and alternative kfunc approach
======================================================
I am aware that BPF helpers have been frozen for several years in favor
of kfuncs. I propose adding bpf_btf_get_struct_member_info() as a BPF
helper (restricted exclusively to BPF_PROG_TYPE_SYSCALL loader programs,
alongside bpf_btf_find_by_name_kind()) because, to my knowledge, there
is no better way to enable struct_ops support in light skeletons.

Before settling on a BPF helper, I explored an alternative approach
using a kfunc, which hit a roadblock. Calling a kfunc directly from the
light skeleton loader program is not possible because kfunc calls
(BPF_PSEUDO_KFUNC_CALL) require the target kfunc's BTF ID in insn->imm
when the loader program itself is loaded, whereas light skeletons ship
pre-generated loader bytecode without userspace BTF resolution. Although
I was able to resolve a kfunc's BTF ID at runtime via
bpf_btf_find_by_name_kind() and patch and load a separate BPF program to
run the kfunc and gather struct_ops member info, running that program
from the light skeleton loader required re-enabling BPF_PROG_TEST_RUN in
bpf_sys_bpf(). Calling BPF_PROG_TEST_RUN from BPF programs was
explicitly disabled in commit 86f44fcec22c ("bpf: Disallow bpf programs
call prog_run command.") because the verifier cannot perform sufficient
validation of the bpf_attr->test.ctx_in pointer.

Non-link struct_ops support
===========================
I have not enabled non-link struct_ops programs/maps (SEC(".struct_ops")
without BPF_F_LINK) in this series, though I intend to enable them in
the future and can extend this series to support them if maintainers
deem it necessary.

I left non-link struct_ops out for now because in light skeletons,
BPF_MAP_UPDATE_ELEM runs inside the loader program during skel__load().
For non-link struct_ops maps, BPF_MAP_UPDATE_ELEM immediately registers
and activates the struct_ops callbacks in the kernel before
skel__attach() is called, prevents re-attaching after detach, and would
leak an active registration if a later step in the loader program fails
(since loader cleanup only closes FDs via bpf_sys_close() rather than
issuing BPF_MAP_DELETE_ELEM). Supporting non-link struct_ops will
require deferring BPF_MAP_UPDATE_ELEM to userspace skel__attach().

AI assistance and testing
=========================
This series (code, selftests, commit messages, and cover letter) was
developed interactively with an AI coding assistant (Google Gemini),
with me guiding the design step by step across each patch and reviewing
all changes.

The series was built with clang/LLVM and tested in a QEMU x86_64 VM
using test_progs (covering the new struct_ops_lskel selftests for both
vmlinux tcp_congestion_ops and bpf_testmod_ops, as well as existing
struct_ops and light skeleton tests), along with manual verification of
loading and inspecting a struct_ops light skeleton via bpftool.

Feedback on the overall approach and on introducing this
BPF_PROG_TYPE_SYSCALL helper is very welcome.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
Siddharth Nayyar (7):
      bpf: Add bpf_btf_get_struct_member_info() helper
      libbpf: Implement bpf_gen__init_kern_struct_ops() for light skeletons
      libbpf: Support BPF_MAP_TYPE_STRUCT_OPS in bpf_gen__map_create()
      libbpf: Support BPF_PROG_TYPE_STRUCT_OPS in bpf_gen__prog_load()
      libbpf: Implement bpf_gen__struct_ops_update_elem() for light skeletons
      bpftool: Generate attach and detach for struct_ops in light skeletons
      selftests/bpf: Add light skeleton struct_ops tests

 include/linux/bpf.h                                |   1 +
 include/uapi/linux/bpf.h                           |  13 +
 kernel/bpf/btf.c                                   |  73 +++++
 kernel/bpf/syscall.c                               |   2 +
 tools/bpf/bpftool/gen.c                            |  71 ++++-
 tools/include/uapi/linux/bpf.h                     |  13 +
 tools/lib/bpf/bpf_gen_internal.h                   |   7 +
 tools/lib/bpf/gen_loader.c                         | 297 ++++++++++++++++++++-
 tools/lib/bpf/libbpf.c                             |  59 ++--
 tools/lib/bpf/libbpf_internal.h                    |  26 ++
 tools/testing/selftests/bpf/Makefile.skel          |   3 +-
 .../selftests/bpf/prog_tests/struct_ops_lskel.c    | 122 +++++++++
 tools/testing/selftests/bpf/progs/struct_ops_mod.c |  51 ++++
 .../selftests/bpf/progs/struct_ops_vmlinux.c       |  42 +++
 14 files changed, 747 insertions(+), 33 deletions(-)
---
base-commit: 3e18218484126afb9da722080659c038cb2256ab
change-id: 20261102-lskel-struct-ops-03090424cfa2

Best regards,
-- 
Siddharth Nayyar <sidnayyar@google.com>

