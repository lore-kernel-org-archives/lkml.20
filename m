Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794757418;
	b=IALFFTWj2XCyS+C0YYB6nIKYwJc6U0xQSUE5UD8gWfMHCiz3tO0KTwfZs/yKQUcJCf1r
	 UBcVKY8qB8MfL6WcwHkiNR5Rz3UsKLEGmtGwZmQBewG9WZW+8dTHTiJIWiKitZNHEPykE
	 ZHexQVW7V/sxTIPQZXaAdGs3sLnZ4vk8+m6znX21xxA3PbSUsrkonHlYdaXkRRIBDObDJ
	 73IqaMZD1MDEWYc/03KOJsBcRf0P2j3HmIhnfD90CMPBLoOMl6F4fxfF04wQUHW+SkMji
	 wFwWtaqYt3DmbgFDxkng9gM16C1LSvuXe5uid6Z7urD0fUNL7E2QESihV/RI+u6PXxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757418;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l4NLEemGUOy+YBlXDlbjz7M3tyL0nsq1r6J6SOYrX9E=;
	b=5eZseBoD3CxTGSN9XpfH88F02u4jIrZI1OfAY/an4Jn8KNTob1lec4OYFuSG0xS4nMgr
	 36nKlNb670SJMDerJpjN49WP+/ZagB5w261uFBhy0GDo3gCuL/nMg9xx4CNvEZm77cRDm
	 +qCGnJeOOI88ndmhx4YuP7cBPvy527QPzYEruMQfv2ewZKSO7N+GLX79+I+QcKdNBRU0u
	 yFrEstexq3cEnl5YgaVAC9AphoUrcmyet9X4H4LMBrCO+hLTpmZ6qMICLFsZ/L65XAKKc
	 EeeqgPtsOOnxVz5xXxd23mRlJcHOd/3657kkoZpdaIBsnzWZWQapNRbi249b4rcgFhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5RObEtl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAFA606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5RObEtl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794757418;
	b=EH74RwYHmBjT1enx8Ve38Pj/r9ZDdk8aGdJw7eGm55q1hURZemxnR15ZlnItt038xkeL
	 P1cgCODrCNIkDhWiUWWKzal3bh7aYYHet0/osKo3BDHp0EDN+zCmrJHT56BlxncAtuBNC
	 +dcwWSBffMrGjVBTcxNeZuVYcrPaEWHvVW351fgDTi5FptOZ7PhUgzXQdVl+NWqtKZt1k
	 zFunAT9Z5O6shkIwvDTJtuUIzQYVumwU3ak+FYY3DrAEL1tWoldI75FQl7PAKHyELKC9J
	 grR0Xbe+bUdwM3z36uVp6dZCpahPQ8PiYudjezPE1fRN0TVejvISh2ptSoNGGgG894g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794757418;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l4NLEemGUOy+YBlXDlbjz7M3tyL0nsq1r6J6SOYrX9E=;
	b=y0b66Gri0CeE/QP7S3B7e4cs1GnKciA/M4LrCm/eBHdxDbZMtIW0bZ9xJbJs3e37n64W
	 DgFk73KVssYokpjYFJp4q+V42CyhMJjfiPvYwf7Vff+To0Pm1oTBKPn8ujMErIu1G3mMi
	 Mhun/em/BU7GhqB0V/9DVplBS1ozMxLgn0kjA7euhRW1LpTTx1dvFPfq8d4HaxxbFLD0Y
	 qU0zT2IqQ8dRL9REo8+F1F+JYV8Cn9v10aI+4ullhvSt/D3969PYP9AnGtqhLdbrPt5SH
	 p2lzkvbC+I9bwB0V4/dw27MhFNxoT2UkLbbbrrWi5C1fDr17TwYmkuyMJgLJfo3MrRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABE311F000C4;
	Sun, 15 Nov 2026 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794757418;
	bh=l4NLEemGUOy+YBlXDlbjz7M3tyL0nsq1r6J6SOYrX9E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=l5RObEtlUyyPseOizt/ZEuGNwAw0YlWVr7rQS+obuU/gDFKjOp3vZsKI7DIYK1b/b
	 6gQVAQtkp/jMAV7QJi35MwvLd8c0GySlNwzX050/J04Ke4fMOX/BmmVHQplXjv+zys
	 KXzZgc73GiNq0VmlVZYbDoBmlYye3kglQXA+HCbMj/jotnxa55YkxzG9nnHWrGLi0p
	 TL/tfa/yTOKsyhgO2Z7ay8aX74yK67Feu1Czz6l9lVQ2xP4ltVTzA1n7fBFP8XuWQt
	 GbGF3qf77ie9SEfpPJxjKxMAsCSPD/mzxOZIOJ78gZYnB/i6Wt6CKnxoQ98khQQk/H
	 UGpQuWn5kHxxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0961E4A0F8;
	Sun, 15 Nov 2026 15:43:37 +0000 (UTC)
From: Erwin Springer via B4 Relay <devnull+aot.lerwin.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 16:43:35 +0100
Subject: [PATCH v2] drm/i915/display: Ignore disabled planes in async flip
 checks
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
Message-Id: <20261115-i915-async-planes-v2-1-c5163dfea5b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQqDMBCEX0Vyboobf6g99T2Kh7hZdYsmklipi
 O/eaO+9DHww880mAnmmIO7JJjwtHNjZCOqSCOy17UiyiSxUqkoAKCRXMXRYLcpp0JaCNEWmUFc
 5thmKuJs8tfw5nc/6x+HdvAjnQ3Q0eg6z8+t5usDR++dfQII0kOXVzaRN2dCjGzUPV3SjqPd9/
 wIx7/NoxAAAAA==
X-Change-ID: 20261115-i915-async-planes-d532ca94cf3c
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Erwin Springer <aot.lerwin@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794757416; l=3821;
 i=aot.lerwin@gmail.com; s=20261115; h=from:subject:message-id;
 bh=mp77voJK9qaE913+ZVMfV5BypZtyZmNXVgJbz4MPjx0=;
 b=OA43Y8dQG94I+l83wmcmVvaLNFvJPaCZx/sIKsmc/F8ew3ZhgCYzQ8a1L8XPVE94KkqPcZ8Tw
 0iwCSmNx3ceBBcQQ6Sq7Onj82WLsAhdLD3mLJoVUynF3Lcvgdzm1Cvi
X-Developer-Key: i=aot.lerwin@gmail.com; a=ed25519;
 pk=nbZwBfXFrLeFJg8vZmODCUcYskhldfPhOapnbey95tI=
X-Endpoint-Received: by B4 Relay for aot.lerwin@gmail.com/20261115 with
 auth_id=1534
X-Original-From: Erwin Springer <aot.lerwin@gmail.com>
Reply-To: aot.lerwin@gmail.com
Content-Transfer-Encoding: 7bit

From: Erwin Springer <aot.lerwin@gmail.com>

Atomic async flips may carry properties that don't change, so compositors
tend to send their whole plane state with every commit. KWin for example
adds all planes of the pipe, including the ones that are disabled and stay
disabled (CRTC_ID=0, FB_ID=0).

intel_async_flip_check_uapi() fails the commit as soon as the state
contains any plane of the pipe that can't do async flips:

  [drm:intel_atomic_check [i915]] [PLANE:66:plane 2A] async flip not supported
  [drm:drm_atomic_check_only.cold] atomic driver check for ... failed: -22

So with such a compositor tearing never works on a pipe with sprite or
cursor planes, even though only the FB of the primary plane changes. KWin
silently falls back to vsynced flips, about 60 rejected commits per second.

A plane without a framebuffer before and after the commit takes no part in
the flip. Skip it in both async flip checks.

A plane that is disabled in uapi may still be used by the hardware as the
Y plane of a planar framebuffer on another plane (planar_linked_plane on
ICL+). Don't skip such a plane in the uapi check, so the commit is still
rejected there as before, instead of the linked planes being pulled into
the state later and tripping the drm_WARN_ON() in
intel_async_flip_check_hw().

Tested on Raptor Lake-U (Iris Xe) with the patch applied to the i915 of
Linux 7.3.4, unmodified KWin 6.8.2 and a fullscreen client that requests
tearing through wp_tearing_control_v1. Before, none of about 350 frames per
run was presented without vsync. With the patch 3334 of 3340 frames tear
and the message above is gone. What is still rejected is the first flip
after the modifier or format changed, once per run, as intended.

Signed-off-by: Erwin Springer <aot.lerwin@gmail.com>
---
Changes in v2:
- Don't skip a disabled plane that is in use as the Y plane of a planar
  framebuffer, it would trip the drm_WARN_ON() in
  intel_async_flip_check_hw() (found by the Sashiko review)
  The device test was done with v1, no planar framebuffer was in use
  there. v2 is compile-tested (W=1).
- Link to v1: https://patch.msgid.link/20261115-i915-async-planes-v1-1-d13498d0b6be@gmail.com
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f4d9148ef..9be7596fa 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6281,6 +6281,16 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		if (plane->pipe != crtc->pipe)
 			continue;
 
+		/*
+		 * Userspace may add planes it doesn't change to the commit.
+		 * A plane that is disabled and stays disabled takes no part
+		 * in the async flip, unless it is in use as the Y plane of
+		 * a planar format on another plane.
+		 */
+		if (!old_plane_state->uapi.fb && !new_plane_state->uapi.fb &&
+		    !old_plane_state->planar_linked_plane)
+			continue;
+
 		/*
 		 * TODO: Async flip is only supported through the page flip IOCTL
 		 * as of now. So support currently added for primary plane only.
@@ -6346,6 +6356,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		if (plane->pipe != crtc->pipe)
 			continue;
 
+		/* Disabled planes that stay disabled take no part in the flip. */
+		if (!old_plane_state->hw.fb && !new_plane_state->hw.fb)
+			continue;
+
 		/*
 		 * Only async flip capable planes should be in the state
 		 * if we're really about to ask the hardware to perform

---
base-commit: 419bb0e4cadd214a0847010c02ade95e5fc511f7
change-id: 20261115-i915-async-planes-d532ca94cf3c

Best regards,
--  
Erwin Springer <aot.lerwin@gmail.com>


