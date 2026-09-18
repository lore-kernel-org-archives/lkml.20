Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E9547056
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715718; cv=none; b=Y0AMUOfL8cwrOuiBbHGA97J0qMe+mNLqOnJn65NssZP3hgdt6HGgx5beubLRZV860VIw4twoj9q+YM3Pm/wcHI5452YOuBPla5xMfrDM/02JVT/aJz1t2iwYUWEqbBids9hP+3h4Il4d45D8ZkzT7o85adZHWBh7oK7dpnLBGUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715718; c=relaxed/simple;
	bh=3TnaohRSjA7u9kb0fvpr5atPg05ZZyGnSCboe6EyYNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZ57YDvghp0PLxiBTKIEYKB2KPRRMFHH2HIijOidzyrJWsHJTQz834bP1s0Tilouh2XDTc2/gfEo7NJZvEdgue6K+d4g7LS6E3ax9OParwGFY8iQbDG+yEjEgriRSvEoFBfYT6ippP3JNxfOHKdqGLNWRMK97n060UdC77sLd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTLKQ2IC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTLKQ2IC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso307968a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789715712; x=1790320512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Bkp/RFC9ZZAGi4GjN9yJHrX67uXW3aJJkkSzqSHpAE=;
        b=HTLKQ2IC1KMJpdMOAPV1TwnIIgH2e6utCS/VXMoNg/mhELjZIIuMrusdi0Wvz6h8ya
         8dKTd/jca5YY1LbGrIVxNrELE/sxIlxaOFD2uWaPqsbN3HklVDVhkoE01F9aBJhsCRXt
         EMeAJIPrZKSYu/ZDl8AR0SvSsWlArt9ZEHPHsozg4PfOnBG1Ca0sHBKNMg5SYtvd/XJw
         m34BOSLkBaXEDHOeLrLS4+UWNWv8KSwDF4tUBC7+kIJ3Onl5Le28IHRrugm6f+t4qXRp
         IF4Ky4pq/4FG/bH5107fHt51vEK4X1vskFUpE6ZNOiApyZuTH38pmhiJalCslf96RMG2
         tzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715712; x=1790320512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Bkp/RFC9ZZAGi4GjN9yJHrX67uXW3aJJkkSzqSHpAE=;
        b=0vb2joJwSP+Lae/SGTqiWTWMTW/RlwvO0C5gHSKEujFE4Qri7KdfqeUuBlhLZNgcTw
         5Kmqq9sT7asCFnoaiYZpOgfiBDMlV8pOVyudHp3Q7f25FgOWMex2m7/YXwB//rcxMqQF
         RMA7Y/SlNckpYhZiYCWdxBzZND1jM20UaZFljkpOUiV8khoraOc9Sxcq5YE4plA2owqq
         ObXkeC9dWfRVuvdaAHRoNyr0tS10awdfHJ7v/k0QR4uLF0W0nZJDHlURVOU8EpiQLBV0
         xxSK9AUzNbbbB2KVmdfxp+cHDhNcUXadpv7OpWWStrWcZAUx0PTVc4ZXedbTMmikcy9M
         Pl4g==
X-Forwarded-Encrypted: i=1; AKwUvByXnoDVIkUb0xrNtgTs3dNLZp3xfiWc0zXg458Dbm6BY2ryewbdFdSNBIJHyGgTTD8Hy8S1/mRfHDn8Qqk=@vger.kernel.org
X-Gm-Message-State: AFuF++n71wOzjtdUsGLbHAUIDzyaGTsiULMsz++QCvnaVXqrlv5g9Ctm
	5FCGv6Gs6jIt3GrAucBC0WLQ5wlwRYc7mB06zNgVEkan/pyC2zApq14=
X-Gm-Gg: AYBFou220EtItbVQCybsgeKTsuV97G+yfw3yn91lynfHnUxYZy8+BLPrawXffFzrp4W
	NElEYTBe9QvcR8aEemWsT7IWuexAiwxMGvaD3FuwRZyuu785f8cVu1vrBRhlw2WyZvtf8CFnQFy
	OghsDQNo7oVlE0QJfaTtb5Naxi63NywseV+3sAl+Qbj2F1scwcf5qCHc694rc2Zb6R2Pt6qwRZa
	118Alz2bihlxVyVhFB7kNxzJl6h2+jaQC4Q9rnEthckwsCjkYaRnVKrYoaS2Y8NfIWlhfm9yRpb
	RAJ+0ynZTaNY26/BkQSzDQhoGh2nuudgOHLTXJbYgMq5/RFQdyW9CSO4YHcgrR4iSHd41gPncCp
	tjpm1u3Ee1YuCH/rCs93NzcAXjmYPRhtq4r9wcbcaa8wA5x26zBgCZzI13jgfhPvuci7i7caJyj
	KV2nrAtyUSPtKTNRicxiVaGkge4WJOcGJmcPSjYZMUwxY8GTWRlB+sTN/FbBxNVtIIri5pL4c5u
	oRtEZVTo9Cp51qlttl1n8egSsQ=
X-Received: by 2002:a17:90b:538d:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e54e3c190mr6935740a91.10.1789715712538;
        Fri, 18 Sep 2026 00:15:12 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:d047:17af:bfc7:1a9a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36170735sm8842180a91.8.2026.09.18.00.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:15:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v1] ring-buffer: Fix the sub-buffer array base in rb_meta_subbuf_idx()
Date: Fri, 18 Sep 2026 16:15:07 +0900
Message-ID: <20260918071507.1019251-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a persistent ring buffer, rb_meta_subbuf_idx() can return an index one
sub-buffer too high.  rb_setup_ids_meta_page() then fills subbuf_ids[]
shifted by one and leaves subbuf_ids[0] NULL, which __rb_map_vma()
dereferences when userspace maps trace_pipe_raw.  rb_update_meta_reader()
writes two such indices into meta->buffers[], which rb_cpu_meta_valid()
would reject on the next boot, discarding the previous boot's trace.

A CPU's sub-buffer array starts after its meta header and the nr_subbufs
integers that follow, aligned up to a sub-buffer.  rb_meta_subbuf_idx()
inverts that calculation but skips only the integers, not the header, so
its base is one sub-buffer low whenever the omitted header size crosses
the alignment boundary.

Invert the calculation with rb_subbufs_from_meta() rather than repeating
it.  rb_range_buffer() maps an index back to an address through the same
helper, so the two directions can no longer disagree.

Cc: <stable@vger.kernel.org>
Fixes: b14d032973d4 ("ring-buffer: Add ring_buffer_meta data")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
x86_64_defconfig plus KASAN, FTRACE, TRACING and TRACER_SNAPSHOT, on
5dd1818b15d9, booted with reserve_mem=<size>:0x1000:trace
trace_instance=boot_mapped@trace.  head_buffer is from
instances/boot_mapped/per_cpu/cpuN/buffer_meta, the map of that CPU's
trace_pipe_raw.

nr_cpus=1, 24 reserved sizes 4096 bytes apart:

  nr_subbufs      head_buffer  map      head_buffer  map
                  unpatched             patched
  997 .. 1004     1            ok       1            ok
  1005 .. 1012    2            oops     1            ok
  1013 .. 1019    1            ok       1            ok

nr_cpus=4, nr_subbufs 1017, one boot:

  cpu 0           1            ok       1            ok
  cpu 1, 2, 3     2            oops     1            ok

cpu 0's meta sits after the buffer-wide header and the scratch area and is not
sub-buffer aligned; every other cpu's is, so the affected nr_subbufs differ
between them.

Unpatched oops:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000007: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
  RIP: 0010:__rb_map_vma+0x418/0xa20

With no reserved range at all, both kernels map the global buffer.  On both
arms, tools/testing/selftests/ring-buffer passes 6/6 with no skips and
CONFIG_RING_BUFFER_STARTUP_TEST reports "Ring buffer PASSED!".  ftracetest
gives identical per-test verdicts on the two arms -- 153 pass, 6 fail, 6
unresolved, 10 unsupported, 2 xfail.  The six failures are the same on both
arms and their cause was not established; the unresolved and unsupported ones
need pahole, a hypervisor trace remote, or userspace this initramfs does not
have.

The discarded-trace path is not measured: a fresh QEMU boot gets fresh guest
memory, so this harness cannot carry a persistent buffer across a reboot.

 kernel/trace/ring_buffer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..fa2e2ce683aa 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -3627,10 +3627,8 @@ static void rb_inc_iter(struct ring_buffer_iter *iter)
 /* Return the index into the sub-buffers for a given sub-buffer */
 static int rb_meta_subbuf_idx(struct ring_buffer_cpu_meta *meta, void *subbuf)
 {
-	void *subbuf_array;
+	void *subbuf_array = rb_subbufs_from_meta(meta);
 
-	subbuf_array = (void *)meta + sizeof(int) * meta->nr_subbufs;
-	subbuf_array = (void *)ALIGN((unsigned long)subbuf_array, meta->subbuf_size);
 	return (subbuf - subbuf_array) / meta->subbuf_size;
 }
 

base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
-- 
2.53.0

