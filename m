Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F8345DF63
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796938; cv=none; b=VRESuYPAIwyLl2DsJg4zcmzQ7wUUSe13Ot1evX9SKnfhRONHgs06HHq72/jvpRiGfVSZ9u0ovk8Fj2D1mdf93VByqSVaF5dzEh6KW4oX6kpQWCA2aSfCTSfqlSwrzpGA3rTzq0nB2LSWWbeCla4e7RYOetXz5BUc/I2fVp4yv6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796938; c=relaxed/simple;
	bh=qZdH4O7AYhrATR5UPQCOt1R0Dm2794679njvxbHtNZs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=diR/68FcBiWRp4XEZ2Pt8uYPYvU7bNWXXLhBP2hKMsgQfivkf7gN4YAHDIHHLIDrjEe1R2O8LJeP5leUZm/NcU1yapkd7acP8PEsYMm9/zLPOOyeEYS7hKPQUcnXynknas8uHLQ0y+WpjDl/IC4J8UZuIZkcGU473run0Z+3ec0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M9FE6G7p; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M9FE6G7p"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b13fb91795so1849051a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791796935; x=1792401735; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pr1oOrP9lLyuo1XWNgakeB/AtMIvjuEaKOp04OdVG9s=;
        b=M9FE6G7pm8+JQd7clGgJSMQMsHxG4FcsTzhC7xf8q/wAea2vSXvhl3dQ6rmF7y9t3F
         Svbsbadms2mVaXgv7cURU42AiwopSy2H7beGohRfrPZKw9qfYpgXQIK+jbzEtsKXb/G3
         zYTXqrrL2GlXQXL3jx7d9d8TTwYkv+awzRYxjdAiwIkKiffSsFyjzzHs0Yt+v/Dmaftr
         pakbLAcECSxNWlPtK7/cu7mFhMMcxyc24Qhkz1q4esMDKLcu34y3KUDrf4aLaKcYT249
         gwA/irJQwwkEdHLxkR8yh/Wn6Gqlw6Ix/CBZg7dpE96m9vRF4d734BpQM9qnXnJ5NVYD
         gGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796935; x=1792401735;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr1oOrP9lLyuo1XWNgakeB/AtMIvjuEaKOp04OdVG9s=;
        b=LqjoTm9ModXmUCSr62rcEEdRcYnJ6P0k9Ng0LfikLMIxCPU3f8MHxLQ7fytebqhUe1
         VWC+9YAomckI9OS3AoTRnVhULJKEUGHQgq5jIq0LcIyzp+VIXueSep8C1mCb+mP9Dooz
         Cdoac4/iTRhfGIFc9pQUn5RN7C6S7HYtudqEylLNWk7J9rO+iFQSQ/RFB7Memr7LrVPh
         GtcP+XwkLDW0g62yO4JHVmG1qmEwpHIPzh9GjGBv4VAAl3vSBUioJ7YjFSk8da/egi+B
         3cg+zm80afvr6ib2+/V11JGMVtfbb6PoafWRh27c4AYEwWd+BASN88VuxH4dfxSXkZml
         3+Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwzoMLh7Z7PPid7N+zGuE0UNKDfG3tjngISeJWFXlkMBkKod0Eysk/HlmsG5CEvRUUWEXQ7Ek8zyVAdCyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiMQ0RYZdVPK5lZKm7lG5PpKbfsSuvjSy4ZJwixZXNwEOBjv5b
	ns7qTmlDwnbBn9LPRSF/Ggn90PpiWf+BpXUbqQRDu2LC7xxeJ/Er9D4rWOomUNO7lroSEUcL6B8
	Ri25qrO5Jn7Xlj17E5g==
X-Received: from edgi18-n2.prod.google.com ([2002:a05:6402:a592:20b0:6b1:d06e:c41d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4007:b0:6b1:bc9f:8ff9 with SMTP id 4fb4d7f45d1cf-6b1bc9fbad6mr2241822a12.19.1791796934924;
 Mon, 12 Oct 2026 02:22:14 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:22:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALymzGoC/4WNTQ6CMBBGr0Jm7Zi2yp8r72FYSDuUJsCQVquG9
 O5WLuDyfcl73waBvKMAl2IDT9EFx0sGdShAj/fFEjqTGZRQlRRSol2fcUZP2YuEHMkPE7+w7Es
 lTF01TUuQ5dXT4N57+NZlHl14sP/sP1H+1r/JKFFiq4Xu1cnUZ9FeLbOd6Kh5hi6l9AWvxMlIv QAAAA==
X-Change-Id: 20261011-gpuvm-reserve-overflow-5b520d76889e
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qZdH4O7AYhrATR5UPQCOt1R0Dm2794679njvxbHtNZs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqzKbAZCxgbuvZpmzhGqCkC+sxMkw/LXH8lC89s
 sFjPoV/2hCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasymwAAKCRAEWL7uWMY5
 RgoGD/9etRZnhqzgz4+aTvIsG5m4qctxSa/0Jc0d4vNdp+pVJVCoB7mzqZKsEx4FcdqcBH1yibL
 xDx/r4o9rS2J5/fs1iRdK5hlHbmRwgSeSJQ7tjroVofepWKRvffMc8OPptts9JPZuARG/tHBOjO
 sLqoKfdhs0IfMZ24Vk+h22l9+K2vNrlL8GWKlbhj2morTQUohh2bjhY0VsWIqwTQ9jdNb5+/VsP
 RvP4sP0kbFmczBwp2iCue3WHMppqaPrzIep+8+xnINKJZd7vxhQEtdjQqdGmN3obDbEQNuYI8Up
 b2X0F6dLw9iHZ2Qq9Uxb0VlwNkgqIe/+gMVSxHHZwkBSo8Qe5oZBcsQ7qgy7zHO8qJqmBv2FDO5
 4XevzMinvfWp7xNV0SGOp2mkuJ3tNJV1FZBoos/YFUDfbF/0C68y5PMpWbKBfn6X3EYVAw6Een/
 k8+IFUvx92Ct1FubBoPL0rIW08/+I1tU+ku9At+BUoSdSPxAfU+syYvWu8HBC9e42RU0aOKfmy1
 5HUaakBQjOmFtDYzknjjEr8VVZzkoBIXacN1Z20Vrk20dqvVMAcahmWt/yYUPF3hiZhoOPhWwlt
 ew/BoLBNIXjMCx3/19vUL2Ov+C+cmQCwjd393SaECGXLfMd9paXYbRuRShn8+XztT7EcSmXYQOT BFfZxCBC1bPwdbw==
X-Mailer: b4 0.14.3
Message-ID: <20261012-gpuvm-reserve-overflow-v2-1-519ef15e2172@google.com>
Subject: [PATCH v2] drm/gpuvm: skip setting kernel_alloc_node range on overflow
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	Boris Brezillon <boris.brezillon@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When the reserved VA range overflows in drm_gpuvm_init(), insertion of
kernel_alloc_node is skipped, leaving its vm pointer NULL. However,
va.range is still set to a non-zero value, which causes drm_gpuvm_fini()
to dereference the NULL vm pointer when removing the node. Thus, only
initialize kernel_alloc_node's address and range when the overflow check
succeeds.

Note that this fixes unsoundness in the Rust GpuVm::new() abstraction:
passing a backwards reserve_range (start > end) when overflow checks are
disabled causes `end - start` to wrap around, triggering the overflow in
drm_gpuvm_init() and dereferencing NULL when the GpuVm is dropped.

Cc: stable@vger.kernel.org
Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Collapse the two if statements into one.
- Add Cc: stable.
- Link to v1: https://lore.kernel.org/r/20261011-gpuvm-reserve-overflow-v1-1-9c0cb23d7409@google.com
---
 drivers/gpu/drm/drm_gpuvm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d1c80ad3dead..8e74d171125b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1126,13 +1126,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->mm_range = range;
 
 	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
-	if (reserve_range) {
+	if (reserve_range &&
+	    likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
+						  reserve_range))) {
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
-
-		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
-							  reserve_range)))
-			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
+		__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261011-gpuvm-reserve-overflow-5b520d76889e

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

