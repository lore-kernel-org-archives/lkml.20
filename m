Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794076436;
	b=KcGjoEq++ocsiVxiDDsUFeXCVl45aTiBcfyrfME7VaUa/sWswfeCIwUXw9pcvLlePeCb
	 LIVJ+q/P2H3CqSvsyMCYbWyU+J0FKPQdk5AvTcIIJSbEBB1B8z/4WuHwYcOWd1yR/n8+5
	 NY+el9M66OOVsI9LWkFP/0u6LApr0040XRpnCdUYGrhFy7DLg/9s6DcjfH0bDoHH2uAzN
	 MmEzIRkpqcDgOjB57sVykpLP6YJG437mmYBbv8jYfwTWJqzVMeykaa7LoJVP+BBWHo4a7
	 LgtPW6eBsgBah8EEECjNDZhIGiG1Be66T3eayCtBylVbGegoGVjbZ3aRQYy63vD3VZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076436;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T78s2oYTOoGvNbGQRgqQpsC5P/0/sF2nWq878VlhTmU=;
	b=W8A0RJoUSQk/gGl2pqAXHjCrmHRGlb8Igh+bvKd0Y8axy7As7LEbYWbFjkHqRLJVN4YH
	 wmdBGzDlvh+gBAsWt7jN5lEACUqvX4+K3P2hfwzT1jCGTqSDeilJAK6mYOn0s+gafRAJf
	 Nq0Y//XH+uqBK9q1EgwmtpvWVZgoLmz971Hnm6aBOXqPUNpKukFdGNIUS9SxiucW0T14z
	 WJShWXG09gtthpdiS7zZM7OJaVQaWUNIWu1N/mb6fMPWKN8wxOVtcbUpyigC8l67mKWJW
	 YFKVo2kGQAeMR0qln0AysMrWevq4ouzYzqIFTtQvMdQZc9HlYSxcRxemk4XKNVrb6OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpmoCVrj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F2606A326;
	Sat,  7 Nov 2026 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpmoCVrj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794076435;
	b=g/xIohJVnI++ZeSjIsipDqoyUjM0zM/l50BMJqWThZlhQnTgv4yO2ITDYAUMghxz3na2
	 88MvkHaVi0k9bc3Pu4PER0QWo5yWbR/uBBn19lt/cRflP2f9k7ltJSgm3ZAFckt1pnRRP
	 2WsCBP+fnrs/Xr6PZSi9iNldL5rMTLkUip2Ok/vM+nTwlnqgyQAxeBn8/2ljPJvUwVtM2
	 x9HnXu+wKXVYgOngm4ZHnNAR7nQeB2JQjxvq+bqVZJzNRjW5HEFZ6coVuQC8lqw6i9gu/
	 SsH4hoMxd7Vz4JdpWAlUEyQJpcByDocBF6zONI26kYlLiUP51wPXlw4UQsXZZH8ryxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794076435;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T78s2oYTOoGvNbGQRgqQpsC5P/0/sF2nWq878VlhTmU=;
	b=YHUJjNT4T+xzpG8QPDfsu1sa/zv+GklVDPIOY9Efxg7w5DQISDrf8BiN35atZ0IpbfSO
	 xXiqKoCMZ5fYYO75/TeHWUhWqJ/sq6UWlLMqDOjV94fSEAQ4Hlu1mQA3znEeXC/rZ5xPT
	 J/2KraI6vRQeKk3qo1EzV9ZFomnbL9diapVbwEkTh4OL6OgcAh5ovTT5b/Bh7fxF49MrQ
	 rfq+VS4kpTU9Irhlb9LGG0G98LK+aLOyt9EERTex7fCPNz2LuXP/RW0BexDGdsR6AI2uy
	 M2/RhVeEjVxzWz/la+BOl/v3OZjPIYOlRBhRffoDxeJw4yTxW/hBrzDXynra7gAgnPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C65BD1F0089F;
	Sat,  7 Nov 2026 18:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794076435;
	bh=T78s2oYTOoGvNbGQRgqQpsC5P/0/sF2nWq878VlhTmU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=VpmoCVrj/gdamlFGQ3sH4ey6G4jvFLPWa576tg9UJuj9ZI3xYdW268p8JtVfAWqd4
	 93Mv/WEFX2Fcv0Hi3QHCdfrJGgKhebt5JlBKex4jS8kHrXzx/Ty/FTHlKKX0r7mLNv
	 II4kBCTdOcgIBkj9lNQNYOCdU9SjLZy4L7yPE2g7UG+tNQQBdw9cPRPpP4UwKazVTx
	 GJRlDwBNhLfxSHLtzKhHLXQzd5VuiQISK7Hsv25OdPIigcQ+a1odWkCJxetlmJTqTv
	 f3QrrbkbOGmrTvYGHyMcxg4O7pm9ax1Iz29cvU1H+LTfjVdpHeGM09rQNm7qUDvF6j
	 fp4Jd1traS4VA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5418147CAF;
	Sat,  7 Nov 2026 18:33:54 +0000 (UTC)
From: Prateekshit Jaiswal via B4 Relay <devnull+prateekshitjaiswal73.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 00:03:53 +0530
Subject: [PATCH] docs: xforms_lists: handle
 __cacheline_group_{begin,end}_aligned()
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
Message-Id: <20261108-kdoc-cacheline-aligned-v1-1-a79fa228a6f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gYa8YdXERchjRqUKi2IIN7d4
 vItZh5IGk0TDMUDUS9LdoQMKguQlcOiaD4bKle1RK7DzR+CwrLqbkGRd1uCeuyamdg77oVqyPE
 Zdbb7H4/T+35In21PaAAAAA==
X-Change-ID: 20261107-kdoc-cacheline-aligned-75f1ad0a8c14
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794076433; l=6468;
 i=prateekshitjaiswal73@gmail.com; s=20261107; h=from:subject:message-id;
 bh=ROYKEloeeZcTp2FpiD1aadnaDyABF8WBF0CYdURa5n4=;
 b=pwZaypDYnIUNHZ0T8CnF7YvGVEr3v4aGJ1QCUyTkstOjqnLW+E5jyXh32zzayVSJxGZnjG+e7
 aQRecrjK2m4A2hUOhbMf+yI+AjuM5YkACo+hyKVi41N8JeG5VWrEVYN
X-Developer-Key: i=prateekshitjaiswal73@gmail.com; a=ed25519;
 pk=Z9QqjsqOUk3AvD5zQ8B+Kufufuvk9wEO7eT9m1nMJdo=
X-Endpoint-Received: by B4 Relay for
 prateekshitjaiswal73@gmail.com/20261107 with auth_id=1445
X-Original-From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
Reply-To: prateekshitjaiswal73@gmail.com
Content-Transfer-Encoding: 7bit

From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>

kernel-doc treats each __cacheline_group_{begin,end}_aligned() call as
an undescribed struct member:

  Warning: drivers/net/ethernet/intel/idpf/idpf_txrx.h:436 struct member '__cacheline_group_begin_aligned(read_mostly' not described in 'idpf_q_vector'

Those markers are defined in include/linux/cache.h. A former special
case in push_parameter() dropped any member whose name contained
"__cacheline_group", which covered both the plain and _aligned forms.
Commit 8b00d6fe9696 ("docs: kdoc: trim __cacheline_group_* with the
other annotations") replaced that with a transform that only matches
__cacheline_group_begin() and __cacheline_group_end().

The pattern kept that shape when it later moved to CMatch, which
requires a word boundary right after the name. Since "_aligned"
continues the identifier, the suffix still cannot match.

Make the suffix optional, keep the copy of the rule in test_cmatch.py
in sync, and add a kdoc-test.yaml case based on struct idpf_q_vector
that fails without this change. The expected definition still has the
lone ';' that each stripped marker leaves behind, as the unaligned
markers already do.

Running "kernel-doc -none -Wall" over every file with kernel-doc
comments on docs-next, this removes 34 distinct warnings, all in
idpf_txrx.h, and adds none.

The problem was found, and the fix and test drafted, with the help of
an AI coding assistant (Claude Code); I have reviewed and tested the
result.

Fixes: 8b00d6fe9696 ("docs: kdoc: trim __cacheline_group_* with the other annotations")
Signed-off-by: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
---
Testing:
- tools/unittests/run.py: all 125 tests pass; the new test fails when
  only the xforms_lists.py change is reverted.
- kernel-doc -none -Wall over all files with kernel-doc comments,
  before and after: 34 warnings removed, none added.

This is based on docs-next. In linux-next, the kspp tree adds
__require_explicit_initialization to struct_xforms three lines above
the changed one, so the context differs there; the patch still applies
with reduced context and the resolution is trivial.

The lone ';' left in the rendered definition (also seen today for the
plain markers, e.g. struct net_device) appeared with commit 7538df7a2d7d
("docs: xforms_lists: use CMatch for all identifiers"). It is left for
a separate change, which would then also update the new test.
---
 tools/lib/python/kdoc/xforms_lists.py |  2 +-
 tools/unittests/kdoc-test.yaml        | 72 +++++++++++++++++++++++++++++++++++
 tools/unittests/test_cmatch.py        |  2 +-
 3 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index db23fb650ea8..fa380055191c 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -38,7 +38,7 @@ class CTransforms:
         (CMatch("__rcu"), ""),
         (CMatch("____cacheline_aligned_in_smp"), ""),
         (CMatch("____cacheline_aligned"), ""),
-        (CMatch("__cacheline_group_(?:begin|end)"), ""),
+        (CMatch("__cacheline_group_(?:begin|end)(?:_aligned)?"), ""),
         (CMatch("__ETHTOOL_DECLARE_LINK_MODE_MASK"), r"DECLARE_BITMAP(\1, __ETHTOOL_LINK_MODE_MASK_NBITS)"),
         (CMatch("DECLARE_PHY_INTERFACE_MASK",),r"DECLARE_BITMAP(\1, PHY_INTERFACE_MODE_MAX)"),
         (CMatch("DECLARE_BITMAP"), r"unsigned long \1[BITS_TO_LONGS(\2)]"),
diff --git a/tools/unittests/kdoc-test.yaml b/tools/unittests/kdoc-test.yaml
index 14d36daa1bba..da396f975cb5 100644
--- a/tools/unittests/kdoc-test.yaml
+++ b/tools/unittests/kdoc-test.yaml
@@ -1696,3 +1696,75 @@ tests:
 
         ``spinlock_t *lock``
           the spinlock
+- name: struct_cacheline_group_aligned
+  description: "Strip __cacheline_group_{begin,end}_aligned() markers from a struct"
+  fname: drivers/net/ethernet/intel/idpf/idpf_txrx.h
+  source: |
+    /**
+     * struct idpf_q_vector
+     * @vport: Vport back pointer
+     * @num_rxq: Number of RX queues
+     * @napi: napi handler
+     * @v_idx: Vector index
+     */
+    struct idpf_q_vector {
+            __cacheline_group_begin_aligned(read_mostly);
+            struct idpf_vport *vport;
+
+            u16 num_rxq;
+            __cacheline_group_end_aligned(read_mostly);
+
+            __cacheline_group_begin_aligned(read_write);
+            struct napi_struct napi;
+            __cacheline_group_end_aligned(read_write);
+
+            __cacheline_group_begin_aligned(cold);
+            u16 v_idx;
+
+            __cacheline_group_end_aligned(cold);
+    };
+  expected:
+  - kdoc_item:
+      name: idpf_q_vector
+      type: struct
+      declaration_start_line: 1
+      sections: {}
+      sections_start_lines: {}
+      parameterlist:
+      - vport
+      - num_rxq
+      - napi
+      - v_idx
+      parameterdesc_start_lines:
+        vport: 2
+        num_rxq: 3
+        napi: 4
+        v_idx: 5
+      parameterdescs:
+        vport: |
+          Vport back pointer
+        num_rxq: |
+          Number of RX queues
+        napi: |
+          napi handler
+        v_idx: |
+          Vector index
+      parametertypes:
+        vport: struct idpf_vport *vport
+        num_rxq: u16 num_rxq
+        napi: struct napi_struct napi
+        v_idx: u16 v_idx
+      warnings: []
+      other_stuff:
+        definition: |
+          ;
+          struct idpf_vport *vport;
+          u16 num_rxq;
+          ;
+          ;
+          struct napi_struct napi;
+          ;
+          ;
+          u16 v_idx;
+          ;
+        purpose: ''
diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
index 109141cd2ab8..02d63a51c05e 100755
--- a/tools/unittests/test_cmatch.py
+++ b/tools/unittests/test_cmatch.py
@@ -324,7 +324,7 @@ class TestSubWithLocalXforms(TestCaseDiff):
         (CMatch('__guarded_by'), ' '),
         (CMatch('__pt_guarded_by'), ' '),
 
-        (CMatch('__cacheline_group_(begin|end)'), ''),
+        (CMatch('__cacheline_group_(begin|end)(_aligned)?'), ''),
 
         (CMatch('struct_group'), r'\2'),
         (CMatch('struct_group_attr'), r'\3'),

---
base-commit: 2649344d20dfb13e30b560f06138229d8e40350a
change-id: 20261107-kdoc-cacheline-aligned-75f1ad0a8c14

Best regards,
-- 
Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>


