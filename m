Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7883B6BEB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537133; cv=pass; b=GSiGtr1BMZiv3SPUtnMogFgZkwlqI5BoZhOdPCzRG/zxz0eX74jOmVk6RBIF08WaD39VUVPeGou94uyyfO+eJX+qD/ermeLIfDvhyXbShLsid0j2omqIVCOn7mxM6kRFdFkQFvWcQ5/6zWfBYcTWKx6V0YvegyYINyUjOOppfVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537133; c=relaxed/simple;
	bh=59ndOyH4z/sSk1rSLAndqXf3RJK8MIxY6EKOkpUvDfs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LmA6ZABdFqjv6zT+xrCT+t+754xB5FMRWtoGwpmzGq+tnn+ub4omp1xuezZhW5azEdSSGvsnoNBm5FxnYQ+slUF8YIDTHHoNHdR0x8hrVy6LKPaZuwPMshODlVDvyLUEtdnlQxr3P1KueSd+6obQ1uvEvAGzOC3ETdVjh7wmw/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JubMXmWi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MePSqvoT; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JubMXmWi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MePSqvoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788537129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=tKAjYH1xjFUupMtkLJCi1kXW7hIRSbapIvWoWHzmu+I=;
	b=JubMXmWiN2s13g6lJnpyFKStaDVxEMWShn/OEgOa9/MayBfn33tvDHOvAJTArAql3XKYk1
	NgBdQ4hFgx4xaZvehk7MTuXUGkx3ncYd+u0PQC0Mw/aUgxRXdTq0AV0283LnhxjQYt9yVm
	/knCZXy8biwzLfIGcoCuZEuSx33gwTg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-5_VV4MmYPBW87qW5HCSMrw-1; Fri, 04 Sep 2026 11:52:08 -0400
X-MC-Unique: 5_VV4MmYPBW87qW5HCSMrw-1
X-Mimecast-MFC-AGG-ID: 5_VV4MmYPBW87qW5HCSMrw_1788537127
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-39d9337b0d3so10822921fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788537126; cv=none;
        d=google.com; s=arc-20260327;
        b=LM89AjmnJp/hIhdI7+SFlFhy7Q6elt7upb/OD+QXnlS8nQeVrFydS6VLlZYsJ4b3Dr
         6VFnnxtlvTOkIVzB0mMQZT9hKrKSWaaf6+4IKPgkjYVr1vxQqF97Au7Hjqq/sOkTRRGm
         EleTGcHUsQWdrudAFVNG2wgeptymPL1y4qnHBkkGaK8O7g5UyatdLyuHLypReprBbcAQ
         6MkJJ1AFs1qKMU/ummuBS8QnWshq1T9i7yuJLp+JZyC4lhJ12JMy7YnWw9g3LSnjGJZD
         xJhwNPo5+4XtD0Oux3fOc4VZcw5DmPBM9L7r0AT/9lKJ3E8c55ohFY6aqZ2Lvz2dbg/k
         wyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tKAjYH1xjFUupMtkLJCi1kXW7hIRSbapIvWoWHzmu+I=;
        fh=p98rn6sAiNu/UG1ingwCb9qqnt4jVaKv4+wKsLZlYfk=;
        b=lCkbVAuX3V9PxVRJXsJ7HZnH6ZW520sYMSVPKZSg06J/vGwJ9zRRn32ad7HSpE2gDE
         2MB4aF17yBVWom7CZsgvTCq4UXHxvkq4OadZ3ot42ELT2nE7aQomYqJAsLlmlHHNMx76
         oLYrnKI+Jj1IHScBNVs8aS3Gt9qxzKVDA5yJ3RYyrizfUX4YTA+ov+6KXjC/A5EMEiQ1
         Rwp6Nb0R4Mb1npYAZ2I9Kkk5ac4TBny5crcNrFoA2nBr0i/L08y1GPPEgX0LXbKsu5x+
         vzxaK/vPp7cLsyz9XE4mJE+3DLzhueW27f+z7yP/Yv7/031IEbmaDU63/+tYRiP/V4eF
         lLKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788537126; x=1789141926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKAjYH1xjFUupMtkLJCi1kXW7hIRSbapIvWoWHzmu+I=;
        b=MePSqvoTcSHC8nd7LPh34D7dsWneIvVeKlukpXrCyhR4bB4BJDhcYWXV4E8OOLB0ut
         VZnaYgHxT6scmzQjpU+OK8JJ2GhgarlNtTtLbIf/acxAmGzunz0qckiAgcFkwwQFTpqe
         eAnRB+ZZf+UOnO3AWgxm/6trtFCQ4t9aXS82HMkXdH4R8S85AbsGlQqsGaHdJtKvOgsp
         HEzhGkSXgtsIYorOetzkxWiUnS3YFBN7DgmFeOBKmVFWrt3NYgom6MiEbCpT53s/L5XS
         rhMu7cdg10mt9oKYLP2sutFW8xXF/sqzW4Y89IgJ++bvD98pMILUJ4vGbpOOmOoXKySP
         Wnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537126; x=1789141926;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tKAjYH1xjFUupMtkLJCi1kXW7hIRSbapIvWoWHzmu+I=;
        b=gWCtQFfZmHHhw8PlzyRcqijSYMtWJirTzSsnwgUE0Q5CJecCIS+xQWC60NL4Sd579w
         A+CJdFARiNNPN0yAi/oenNMRWe3zCjLPjWxwBjbgeQUPqXE22P1ozwu9jZ/wZGqF5QjA
         t8qc3qM0Nn0YDI79KWXy9rhWa8jIRIhBnAWseoCBi7NzX3BW7BrGtY6CXOdfvVGCZY7j
         376mahqGxkDBlqQVLObPi56SZ4MHlIQ0RNPQU29I7ezBtTTIdwo99VoInKuuG1m8Frtf
         P9kVuiGOD6YO16WP/G1a3uRb/x0jMjDC6OywShGeGp9811wPDM58Y/Y3tMWARThkkSpl
         awKg==
X-Gm-Message-State: AFuF++kG88asaxm2zZo2kxGozdI66BBrxE2OOwZjEcBj14C9Qa5MBSUq
	Rn3A154jk4LMibT6rHyHqrseOdpTpvNqB/M3mhVWWzcFV2HIxm7RqoqYNppHKWUmF5S+EpQDOVK
	byiB9RE0znaImpBPLtNeeBf4URHswZ78WO8ZCVtJuMf/D7TZfumoGNwPR8sMWSrr1ut0yTLAMW6
	OOP+ZmVu+vqmoyLrsMvmQPKyTSdA4gtR60IVvI0DT1
X-Gm-Gg: AYBFou1z5KJ7cIFgFY1TZgPjTp7TY1rgf6ZIods7n+LcRcxAj02Abdi55vXLVxfDDXN
	NqQEPph1sniSa9Ed6nGGlX5J+GtLtgNb9RykPs5SbcpBSOrSTb7HGxc1EBah1IipjfnJmgIcskT
	qAJsF+0ejoLfOzYnplYX2jH5CnP9Gu7RFA4NDdXlXHdCzqm6ZeTjMuzaW0
X-Received: by 2002:a2e:bc89:0:b0:3a3:61ec:43c4 with SMTP id 38308e7fff4ca-3a361ec451dmr12858851fa.21.1788537126498;
        Fri, 04 Sep 2026 08:52:06 -0700 (PDT)
X-Received: by 2002:a2e:bc89:0:b0:3a3:61ec:43c4 with SMTP id
 38308e7fff4ca-3a361ec451dmr12858731fa.21.1788537126020; Fri, 04 Sep 2026
 08:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sandipan Roy <saroy@redhat.com>
Date: Fri, 4 Sep 2026 21:21:52 +0530
X-Gm-Features: AcwNN1U5rRcFkgPbxjw2S29gFANOJiBbLymQR6OK9li6GGmTBHjnzSJJhc7lWPM
Message-ID: <CAJ33NAVD16a2jUgCqPFEfMwCETg9ghp=zD-fbjoMRtOcGJ9D+A@mail.gmail.com>
Subject: [PATCH] bpf: fix dangling jump table entries for verified indirect
 jump targets
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ast@kernel.org, andrii@kernel.org, 
	eddyz87@gmail.com, song@kernel.org, jolsa@kernel.org, security@kernel.org
Content-Type: multipart/mixed; boundary="000000000000108f36065aaa40ee"

--000000000000108f36065aaa40ee
Content-Type: text/plain; charset="UTF-8"

Hi,

While reviewing the BPF subsystem's recently introduced indirect jump
support (BPF_MAP_TYPE_INSN_ARRAY / `gotox`), I found a verifier soundness
bug: a program that passes verification can, at run time, execute a jump
through a NULL (or stale) code pointer, causing a kernel oops/panic. I
believe this affects all kernels since the feature was added.

The core problem is the interaction between post-verification instruction
removal and the insn_array jump table:

- `bpf_opt_remove_nops()` removes instructions byte-equal to `JA +0` even
  when they are targets of a verified `gotox`, because it does not check
  `insn_aux_data[].indirect_target`.
- When such a target is removed, `bpf_insn_array_adjust_after_remove()`
  marks the map entries `INSN_DELETED`, the JIT skips them and leaves
  `ips[]` NULL (or stale), and `bpf_insn_array_ready()` skips validation
  of `INSN_DELETED` entries.

The result is that a verified `gotox rX` can execute `jmp *rX` with
`rX == NULL`. I reproduced this on the current mainline (v7.3-rc1,
commit bc35965f6940) with a minimal BPF program: the load succeeds and
running it produces "BUG: kernel NULL pointer dereference" with
"#PF: supervisor instruction fetch" at RIP 0x0. A map previously bound
to another program can instead leave a stale pointer into a freed JIT
image (latent use-after-free).

While validating the fix I also noticed a related lifecycle bug:
`bpf_insn_array_release()` is only invoked from verifier error paths, so
after a successful load the map remains permanently "used" (the map can
never be bound to another program, failing with -EBUSY) and `ips[]` keeps
pointing into the freed jitted image of the unloaded program.

The attached patch fixes all of these:

1. Never remove indirect jump targets in `bpf_opt_remove_nops()`, and
   hard-guarantee it in `verifier_remove_insns()` by rejecting any removal
   of an instruction flagged as an indirect jump target.
2. Turn the final safety gate in `bpf_insn_array_ready()` into a hard
   rejection of `INSN_DELETED` entries instead of silently skipping them.
3. Call `bpf_insn_array_release()` from `__bpf_free_used_maps()` when the
   bound program is freed, and clear the stale per-entry state
   (`xlated_off`, `ips[]`) there so a subsequent bind cannot inherit
   dangling pointers.


Thanks,
Sandipan Roy
Senior Product Security Engineer, Red Hat

--000000000000108f36065aaa40ee
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-bpf-fix-dangling-jump-table-entries-for-verified-indirect-jump-targets.patch"
Content-Disposition: attachment; 
	filename="0001-bpf-fix-dangling-jump-table-entries-for-verified-indirect-jump-targets.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtn4r53w0>
X-Attachment-Id: f_mtn4r53w0

RnJvbSAyYzZhMzlhMzE3ZjYyODIyNGNkNmM2N2M4ZjJiNDkxMWMyOWNlMzFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTYW5kaXBhbiBSb3kgPHNhcm95QHJlZGhhdC5jb20+CkRhdGU6
IEZyaSwgNCBTZXAgMjAyNiAyMDozNToxNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGJwZjogZml4
IGRhbmdsaW5nIGp1bXAgdGFibGUgZW50cmllcyBmb3IgdmVyaWZpZWQgaW5kaXJlY3QKIGp1bXAg
dGFyZ2V0cwoKQlBGX01BUF9UWVBFX0lOU05fQVJSQVkgbGV0cyBhIHByb2dyYW0gcGVyZm9ybSBp
bmRpcmVjdCBqdW1wcyAoYGdvdG94CnJYYCwgQlBGX0pNUHxCUEZfSkF8QlBGX1gpLiAgRm9yIGV2
ZXJ5IG1hcCBpbmRleCByZWFjaGFibGUgYnkgclggdGhlCnZlcmlmaWVyIHZlcmlmaWVzIHRoZSB0
YXJnZXQgaW5zdHJ1Y3Rpb24sIGFuZCB0aGUgSklUIGxhdGVyIHJlY29yZHMgdGhlCmppdHRlZCB0
YXJnZXQgYWRkcmVzcyBpbiBpbnNuX2FycmF5LT5pcHNbXS4KCkFmdGVyIHZlcmlmaWNhdGlvbiB0
aGUgcHJpdmlsZWdlZCBwYXNzIGJwZl9vcHRfcmVtb3ZlX25vcHMoKSByZW1vdmVzCmluc3RydWN0
aW9ucyBieXRlLWVxdWFsIHRvIEpBICswIChOT1ApIHdpdGhvdXQgY2hlY2tpbmcgd2hldGhlciB0
aGV5IGFyZQp0YXJnZXRzIG9mIGEgdmVyaWZpZWQgaW5kaXJlY3QganVtcC4gIElmIHN1Y2ggYSB0
YXJnZXQgaXMgcmVtb3ZlZCwKYnBmX2luc25fYXJyYXlfYWRqdXN0X2FmdGVyX3JlbW92ZSgpIG1h
cmtzIHRoZSBjb3JyZXNwb25kaW5nIG1hcCBlbnRyaWVzCklOU05fREVMRVRFRCwgdGhlIEpJVCB0
aGVuIHNraXBzIHRoZW0gYW5kIGxlYXZlcyBpcHNbXSBOVUxMIChvciBzdGFsZQpmcm9tIGEgcHJl
dmlvdXNseSBib3VuZCBwcm9ncmFtKSwgd2hpbGUgYnBmX2luc25fYXJyYXlfcmVhZHkoKSBza2lw
cwp2YWxpZGF0aW9uIG9mIElOU05fREVMRVRFRCBlbnRyaWVzLiAgVGhlIHJlc3VsdCBpcyBhIHBy
b2dyYW0gdGhhdCBwYXNzZXMKdmVyaWZpY2F0aW9uIGFuZCwgYXQgcnVuIHRpbWUsIGV4ZWN1dGVz
IGBqbXAgKnJYYCB3aXRoIHJYID09IE5VTEwgb3IgYQpkYW5nbGluZyBwb2ludGVyLCBjYXVzaW5n
IGEga2VybmVsIG9vcHMgb3IgcGFuaWMuCgpGaXggaXQgYnk6Ci0gbmV2ZXIgcmVtb3ZpbmcgaW5z
dHJ1Y3Rpb25zIG1hcmtlZCBpbnNuX2F1eF9kYXRhW10uaW5kaXJlY3RfdGFyZ2V0IGluCiAgYnBm
X29wdF9yZW1vdmVfbm9wcygpOwotIHJlamVjdGluZywgaW4gdmVyaWZpZXJfcmVtb3ZlX2luc25z
KCksIGFueSByZW1vdmFsIG9mIGFuIGluc3RydWN0aW9uCiAgZmxhZ2dlZCBhcyBpbmRpcmVjdCBq
dW1wIHRhcmdldCBhcyBhIGhhcmQgZ3VhcmFudGVlIGZvciBhbGwgcmVtb3ZhbAogIHBhc3NlczsK
LSB0dXJuaW5nIHRoZSBmaW5hbCBzYWZldHkgZ2F0ZSBpbiBicGZfaW5zbl9hcnJheV9yZWFkeSgp
IGludG8gYSBoYXJkCiAgcmVqZWN0aW9uIG9mIElOU05fREVMRVRFRCBlbnRyaWVzIGluc3RlYWQg
b2Ygc2lsZW50bHkgc2tpcHBpbmcgdGhlbS4KCkFkZGl0aW9uYWxseSwgYnBmX2luc25fYXJyYXlf
cmVsZWFzZSgpIHdhcyBvbmx5IGludm9rZWQgZnJvbSB2ZXJpZmllcgplcnJvciBwYXRocywgc28g
dGhlIGluc25fYXJyYXkgbWFwIHN0YXllZCBib3VuZCBmb3JldmVyIGFmdGVyIGEKc3VjY2Vzc2Z1
bCBsb2FkOiB0aGUgbWFwJ3MgdXNlZCBmbGFnIHdhcyBuZXZlciBjbGVhcmVkLCBtYWtpbmcgdGhl
IG1hcAp1bnVzYWJsZSBmb3Igc3Vic2VxdWVudCBwcm9ncmFtcywgYW5kIGlwc1tdIGtlcHQgcG9p
bnRpbmcgaW50byB0aGUgZnJlZWQKaml0dGVkIGltYWdlIG9mIHRoZSB1bmxvYWRlZCBwcm9ncmFt
LiAgQ2FsbCBicGZfaW5zbl9hcnJheV9yZWxlYXNlKCkKZnJvbSBfX2JwZl9mcmVlX3VzZWRfbWFw
cygpIHdoZW4gdGhlIHByb2dyYW0gaXMgZnJlZWQsIGFuZCBjbGVhciB0aGUKc3RhbGUgcGVyLWVu
dHJ5IHN0YXRlICh4bGF0ZWRfb2ZmIGFuZCBpcHNbXSkgdGhlcmUuCgpGaXhlczogNDkzZDllMGQ2
MDgzICgiYnBmLCB4ODY6IGFkZCBzdXBwb3J0IGZvciBpbmRpcmVjdCBqdW1wcyIpClNpZ25lZC1v
ZmYtYnk6IHNlY3VyaXR5LXJlc2VhcmNoIDxzZWN1cml0eS1yZXNlYXJjaEBsb2NhbGhvc3Q+Ci0t
LQoga2VybmVsL2JwZi9icGZfaW5zbl9hcnJheS5jIHwgMjAgKysrKysrKysrKysrKysrKysrKy0K
IGtlcm5lbC9icGYvY29yZS5jICAgICAgICAgICB8ICA4ICsrKysrKysrCiBrZXJuZWwvYnBmL2Zp
eHVwcy5jICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystCiAzIGZpbGVzIGNo
YW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2Vy
bmVsL2JwZi9icGZfaW5zbl9hcnJheS5jIGIva2VybmVsL2JwZi9icGZfaW5zbl9hcnJheS5jCmlu
ZGV4IGEyZjg0YWZlNmY3Yy4uODQ5ODNkZWM2NDI2IDEwMDY0NAotLS0gYS9rZXJuZWwvYnBmL2Jw
Zl9pbnNuX2FycmF5LmMKKysrIGIva2VybmVsL2JwZi9icGZfaW5zbl9hcnJheS5jCkBAIC0yMTUs
OCArMjE1LDE1IEBAIGludCBicGZfaW5zbl9hcnJheV9yZWFkeShzdHJ1Y3QgYnBmX21hcCAqbWFw
KQogCWludCBpOwogCiAJZm9yIChpID0gMDsgaSA8IG1hcC0+bWF4X2VudHJpZXM7IGkrKykgewor
CQkvKgorCQkgKiBBIHRyYWNrZWQgaW5zdHJ1Y3Rpb24gdGhhdCB3YXMgZGVsZXRlZCBpcyBhIGJy
b2tlbiBqdW1wCisJCSAqIHRhYmxlIGVudHJ5OiB0aGUgSklUIG5ldmVyIGZpbGxzIGluc25fYXJy
YXktPmlwc1tpXSBmb3IgaXQsCisJCSAqIHNvIGEgdmVyaWZpZWQgYGdvdG94YCBjb3ZlcmluZyB0
aGlzIGluZGV4IHdvdWxkIGp1bXAgdGhyb3VnaAorCQkgKiBhIE5VTEwgb3Igc3RhbGUgY29kZSBw
b2ludGVyLiAgUmVqZWN0IHN1Y2ggcHJvZ3JhbXMgaW5zdGVhZAorCQkgKiBvZiBzaWxlbnRseSBz
a2lwcGluZyB0aGUgZW50cnkuCisJCSAqLwogCQlpZiAoaW5zbl9hcnJheS0+dmFsdWVzW2ldLnhs
YXRlZF9vZmYgPT0gSU5TTl9ERUxFVEVEKQotCQkJY29udGludWU7CisJCQlyZXR1cm4gLUVGQVVM
VDsKIAkJaWYgKCFpbnNuX2FycmF5LT5pcHNbaV0pCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAl9CkBA
IC0yMjcsOCArMjM0LDE5IEBAIGludCBicGZfaW5zbl9hcnJheV9yZWFkeShzdHJ1Y3QgYnBmX21h
cCAqbWFwKQogdm9pZCBicGZfaW5zbl9hcnJheV9yZWxlYXNlKHN0cnVjdCBicGZfbWFwICptYXAp
CiB7CiAJc3RydWN0IGJwZl9pbnNuX2FycmF5ICppbnNuX2FycmF5ID0gY2FzdF9pbnNuX2FycmF5
KG1hcCk7CisJaW50IGk7CiAKIAlhdG9taWNfc2V0KCZpbnNuX2FycmF5LT51c2VkLCAwKTsKKwor
CS8qCisJICogUmVzZXQgdGhlIHBlci1lbnRyeSBzdGF0ZSBzbyBhIHN1YnNlcXVlbnQgYmluZCBj
YW5ub3Qgb2JzZXJ2ZSBhCisJICogc3RhbGUgeGxhdGVkIG9mZnNldCBvciBpbmhlcml0IHBvaW50
ZXJzIGludG8gYSBmcmVlZCBqaXR0ZWQgaW1hZ2UKKwkgKiBvZiB0aGUgcHJldmlvdXNseSBib3Vu
ZCBwcm9ncmFtLgorCSAqLworCWZvciAoaSA9IDA7IGkgPCBtYXAtPm1heF9lbnRyaWVzOyBpKysp
IHsKKwkJaW5zbl9hcnJheS0+dmFsdWVzW2ldLnhsYXRlZF9vZmYgPSBpbnNuX2FycmF5LT52YWx1
ZXNbaV0ub3JpZ19vZmY7CisJCWluc25fYXJyYXktPmlwc1tpXSA9IDA7CisJfQogfQogCiB2b2lk
IGJwZl9pbnNuX2FycmF5X2FkanVzdChzdHJ1Y3QgYnBmX21hcCAqbWFwLCB1MzIgb2ZmLCB1MzIg
bGVuKQpkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9jb3JlLmMgYi9rZXJuZWwvYnBmL2NvcmUuYwpp
bmRleCBkNTVlNzM3ZWQ3NWEuLmM5MGZjZjJjOTU5MiAxMDA2NDQKLS0tIGEva2VybmVsL2JwZi9j
b3JlLmMKKysrIGIva2VybmVsL2JwZi9jb3JlLmMKQEAgLTMwMjgsNiArMzAyOCwxNCBAQCB2b2lk
IF9fYnBmX2ZyZWVfdXNlZF9tYXBzKHN0cnVjdCBicGZfcHJvZ19hdXggKmF1eCwKIAkJCW1hcC0+
b3BzLT5tYXBfcG9rZV91bnRyYWNrKG1hcCwgYXV4KTsKIAkJaWYgKHNsZWVwYWJsZSkKIAkJCWF0
b21pYzY0X2RlYygmbWFwLT5zbGVlcGFibGVfcmVmY250KTsKKwkJaWYgKG1hcC0+bWFwX3R5cGUg
PT0gQlBGX01BUF9UWVBFX0lOU05fQVJSQVkpCisJCQkvKgorCQkJICogRHJvcCB0aGUgYmluZCB0
byB0aGUgcHJvZ3JhbSBvbmNlIGl0IGlzIGdvbmUgc28gdGhlCisJCQkgKiBtYXAgY2FuIGJlIHJl
dXNlZCwgYW5kIGNsZWFyIHRoZSBzdGFsZSBqaXR0ZWQKKwkJCSAqIHBvaW50ZXJzIC8geGxhdGVk
IG9mZnNldHMgc28gdGhleSBkbyBub3Qgb3V0bGl2ZQorCQkJICogdGhlIGJvdW5kIHByb2dyYW0u
CisJCQkgKi8KKwkJCWJwZl9pbnNuX2FycmF5X3JlbGVhc2UobWFwKTsKIAkJYnBmX21hcF9wdXQo
bWFwKTsKIAl9CiB9CmRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL2ZpeHVwcy5jIGIva2VybmVsL2Jw
Zi9maXh1cHMuYwppbmRleCA2NWI0NDFlNGEzNTEuLmMwMWI5YzA4NGI1NyAxMDA2NDQKLS0tIGEv
a2VybmVsL2JwZi9maXh1cHMuYworKysgYi9rZXJuZWwvYnBmL2ZpeHVwcy5jCkBAIC01MTYsOCAr
NTE2LDI1IEBAIHN0YXRpYyBpbnQgdmVyaWZpZXJfcmVtb3ZlX2luc25zKHN0cnVjdCBicGZfdmVy
aWZpZXJfZW52ICplbnYsIHUzMiBvZmYsIHUzMiBjbnQpCiB7CiAJc3RydWN0IGJwZl9pbnNuX2F1
eF9kYXRhICphdXhfZGF0YSA9IGVudi0+aW5zbl9hdXhfZGF0YTsKIAl1bnNpZ25lZCBpbnQgb3Jp
Z19wcm9nX2xlbiA9IGVudi0+cHJvZy0+bGVuOworCXUzMiBpOwogCWludCBlcnI7CiAKKwkvKgor
CSAqIEluc3RydWN0aW9ucyB0aGF0IGFyZSB0YXJnZXRzIG9mIHZlcmlmaWVkIGluZGlyZWN0IGp1
bXBzCisJICogKGluc25fYXJyYXkgLyBnb3RveCkgbXVzdCBuZXZlciBiZSByZW1vdmVkOiB0aGUg
anVtcCB0YWJsZSBpcworCSAqIHZlcmlmaWVkIGFnYWluc3QgdGhlc2UgdmVyeSBpbnN0cnVjdGlv
bnMgYW5kIHRoZSBKSVQgZmlsbHMgdGhlCisJICogaml0dGVkIHBvaW50ZXJzIGludG8gdGhlIHRh
YmxlLiAgUmVtb3Zpbmcgc3VjaCBhbiBpbnN0cnVjdGlvbgorCSAqIHdvdWxkIGxlYXZlIHRoZSBj
b3JyZXNwb25kaW5nIHRhYmxlIGVudHJ5IGRhbmdsaW5nIGFuZCB0dXJuIGEKKwkgKiB2ZXJpZmll
ci1hcHByb3ZlZCBgZ290b3ggclhgIGludG8gYSBqdW1wIHRocm91Z2ggYSBOVUxMIG9yIHN0YWxl
CisJICogY29kZSBwb2ludGVyIGF0IHJ1biB0aW1lLgorCSAqLworCWZvciAoaSA9IG9mZjsgaSA8
IG9mZiArIGNudDsgaSsrKSB7CisJCWlmIChhdXhfZGF0YVtpXS5pbmRpcmVjdF90YXJnZXQpIHsK
KwkJCXZlcmJvc2UoZW52LCAiY2Fubm90IHJlbW92ZSBpbnN0cnVjdGlvbiAldTogaW5kaXJlY3Qg
anVtcCB0YXJnZXRcbiIsIGkpOworCQkJcmV0dXJuIC1FRkFVTFQ7CisJCX0KKwl9CisKIAlpZiAo
YnBmX3Byb2dfaXNfb2ZmbG9hZGVkKGVudi0+cHJvZy0+YXV4KSkKIAkJYnBmX3Byb2dfb2ZmbG9h
ZF9yZW1vdmVfaW5zbnMoZW52LCBvZmYsIGNudCk7CiAKQEAgLTYxMyw2ICs2MzAsNyBAQCBpbnQg
YnBmX29wdF9yZW1vdmVfZGVhZF9jb2RlKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYpCiAK
IGludCBicGZfb3B0X3JlbW92ZV9ub3BzKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYpCiB7
CisJc3RydWN0IGJwZl9pbnNuX2F1eF9kYXRhICphdXhfZGF0YSA9IGVudi0+aW5zbl9hdXhfZGF0
YTsKIAlzdHJ1Y3QgYnBmX2luc24gKmluc24gPSBlbnYtPnByb2ctPmluc25zaTsKIAlpbnQgaW5z
bl9jbnQgPSBlbnYtPnByb2ctPmxlbjsKIAlib29sIGlzX21heV9nb3RvXzAsIGlzX2phOwpAQCAt
NjIyLDcgKzY0MCwxMiBAQCBpbnQgYnBmX29wdF9yZW1vdmVfbm9wcyhzdHJ1Y3QgYnBmX3Zlcmlm
aWVyX2VudiAqZW52KQogCQlpc19tYXlfZ290b18wID0gIW1lbWNtcCgmaW5zbltpXSwgJk1BWV9H
T1RPXzAsIHNpemVvZihNQVlfR09UT18wKSk7CiAJCWlzX2phID0gIW1lbWNtcCgmaW5zbltpXSwg
Jk5PUCwgc2l6ZW9mKE5PUCkpOwogCi0JCWlmICghaXNfbWF5X2dvdG9fMCAmJiAhaXNfamEpCisJ
CS8qIERvIG5vdCByZW1vdmUgaW5kaXJlY3QganVtcCB0YXJnZXRzOiB0aGUganVtcCB0YWJsZSBl
bnRyaWVzCisJCSAqIGZvciB0aGVtIHdlcmUgdmVyaWZpZWQgYWdhaW5zdCB0aGVzZSBpbnN0cnVj
dGlvbnMsIGFuZCB0aGUKKwkJICogcmVtb3ZhbCB3b3VsZCBsZWF2ZSB0aGUgdGFibGUgZW50cmll
cyBkYW5nbGluZyAoc2VlCisJCSAqIHZlcmlmaWVyX3JlbW92ZV9pbnNucygpKS4KKwkJICovCisJ
CWlmICgoIWlzX21heV9nb3RvXzAgJiYgIWlzX2phKSB8fCBhdXhfZGF0YVtpXS5pbmRpcmVjdF90
YXJnZXQpCiAJCQljb250aW51ZTsKIAogCQllcnIgPSB2ZXJpZmllcl9yZW1vdmVfaW5zbnMoZW52
LCBpLCAxKTsKLS0gCjIuNTUuMAoK
--000000000000108f36065aaa40ee--

