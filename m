Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794752244;
	b=e4PV80CXhUa3mLqoC/FpDnyl+nDBofOmXMajEtK3vH9AI8Q3nVJtV6Momu9nJQksgQDc
	 mRX+u3ZNBb7Ndnhih7G4KkhZ3ePclfXTtU3YtR9rEXYX8wX8hWV+lCUspm3kcM7G7r69i
	 YSNRI7ieaq33qg5yqy4dUpOjE76U4h1pryi/Xo+jeWrKJ8cyxqsS8EjCgmuewIk2WFMDd
	 8Xy/7MJwHb/fRWQ94p/QLA8PHmFMZkhmxOGnl3EBr9NZDrzEfcaS8kl8D+eiYiRK///Vi
	 Vd3mk6ULh+LsImmMd3ASgJMr675m3bIwUUavpOU9/Qq4Vwy/VDrQcRM2jdR7garTxXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752244;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tuFV+XEN7D66vesPgjSYtko0sLVrset89I2Mvwf/XZ8=;
	b=RUbhML/XE8Inl+vFvqoH3NtgPRNs27hVkxhmqu3JRU2f7v4X2VX4mRREEYwiC/DlfCuW
	 qCO0D75Pn8XrhhmdaamVoCWpgyfF4P8lAY6Gmmo+uOZG2YM7kVScq4GJ5oEO0hEZ+vFrA
	 wew90J8wk5y0ohMHhRroo8drCpt1NmiOzWpE9YUEALZoy6zaigkvvNV/Lqg66GtVWaYne
	 mNIo5dMDmd1Mvt1UL5NiuE7HDQBenUiPfzEENxaB0SVlIPFK2kwYXhLM8JiYdMUU7dI5Q
	 Ay35ZZnVPeoDunNvRwiRvIExh4zXn80FIIEPCGfDy9d7R1smJltkZM/tZAdw9h1X/sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTWvWV4B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7643606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTWvWV4B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794752244;
	b=pxcmhhL5KaPamUMdYacKPcsJkpIkg4BFw1F4UscUGLL8J+Y347gltPfIg78lP47LKM3E
	 gW699Gs1q2HOyIv4RGifybfEhPPCURE+JlnDrTrY44zoOUyFKKv/5b9L3Il+z9/F1WIv5
	 cEYZBc2qpqShBGyqJn1a+cPokwiePsfRN3ICOIBILbP4S+hBoo87EkyoV3Wz/RcF1LALq
	 Oqz7OWaustylZQq159tAFlmIePv5QRPMMTvjXZAAlvwe2DUeF8xUaLZmhyrDJ/rl193IA
	 AsJVk2wMbF3YJsKZojJ8k2MfW95mdFgEqTLbWUHVotx80aJU5DyeSICC2jgXMLcQJUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794752244;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tuFV+XEN7D66vesPgjSYtko0sLVrset89I2Mvwf/XZ8=;
	b=k3gc+1z4hC3fb7UUJe43aPoKiq7VkNetBLsw6QZNodfUpE4HcJYFDOEWAuvcmG1oZBUK
	 RZ8JzoDqbm05+agruG4iRTLCbt+351Amif6OzZL1RaBnAhi3FZIQurVt5MJa8+H/YutLY
	 bPVsFv/URmw6eyg+13yd1hQh9gk1NyePHaxrEemxpUMpv2Gaii9J22T+Egzq3aU97l4sB
	 3Iy1TR0iJhHsM4ZqNbGab72cLm9eFLjymBCpqwbWZDC0lYk0H4BBtDzD2mHfTkmK1ss+t
	 kH+VWPly/xxxk4CYkquAL3vll76y+uDPnRHwCRlZ852CKit983Pz5WgfpDQ9CfgcpyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 062181F000C4;
	Sun, 15 Nov 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752244;
	bh=tuFV+XEN7D66vesPgjSYtko0sLVrset89I2Mvwf/XZ8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NTWvWV4BlqW4ldn1wq8k/vSqNf34ztytm0VVtw0r2R0NE+ye1XO5lyvBLWL/k4Ebx
	 M81ktg0yv3gtF4D+Pc0e7TRhFHlh7eTQkp4hdvRK11NMKLThlKxcXtNjfVfB3BkCEo
	 dRGkp1GmISdPeTUEmWu3J/THbZMKrTV2uS2DAkkOYGDOja5rwABJn0ROowjWdiAkIn
	 ddG3T7dfZvqsOijVaMMkG1IsusEhO0BabKFXXiAnXMTUIo8NaDxEoG/iWOqmY0Hkv8
	 lhAovuoDSonrcNEzI5KQCUhmMyaRadgPX4iEsxuf3gWkOFbow1Ikzamv0MF3/KyIO/
	 dzXUfEeilsY+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 886F64A0CD;
	Sun, 15 Nov 2026 14:17:23 +0000 (UTC)
From: Erwin Springer via B4 Relay <devnull+aot.lerwin.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 15:17:23 +0100
Subject: [PATCH] drm/i915/display: Ignore disabled planes in async flip
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
Message-Id: <20261115-i915-async-planes-v1-1-d13498d0b6be@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NT3UxLIJFYXJmXrFuQk5iXWqybYmpslJxoaZKcZpysBNRXUJSallk
 BNjM6FsIvLk3KSk0uARmkVFsLAPxI58N1AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794752243; l=2902;
 i=aot.lerwin@gmail.com; s=20261115; h=from:subject:message-id;
 bh=zbrZwdXv7Ir3puhwTmXxiOvcf/QUh3Wwkm5UJD4mpNU=;
 b=/Y1rbzSeLH0RL6DqX86DomEbAF3/KtOl6K9zeSeVWCkZ8rAzXDeICQIgXEs3z5M9SMsuHktqz
 xo999STbvl6BkdCYmOKoMeztiIImAzh8bordzpbvnhzAczdZzzPzb9q
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

Tested on Raptor Lake-U (Iris Xe) with the patch applied to the i915 of
Linux 7.3.4, unmodified KWin 6.8.2 and a fullscreen client that requests
tearing through wp_tearing_control_v1. Before, none of about 350 frames per
run was presented without vsync. With the patch 3334 of 3340 frames tear
and the message above is gone. What is still rejected is the first flip
after the modifier or format changed, once per run, as intended.

Signed-off-by: Erwin Springer <aot.lerwin@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f4d9148ef..58f45dd68 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6281,6 +6281,14 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		if (plane->pipe != crtc->pipe)
 			continue;
 
+		/*
+		 * Userspace may add planes it doesn't change to the commit.
+		 * A plane that is disabled and stays disabled takes no part
+		 * in the async flip.
+		 */
+		if (!old_plane_state->uapi.fb && !new_plane_state->uapi.fb)
+			continue;
+
 		/*
 		 * TODO: Async flip is only supported through the page flip IOCTL
 		 * as of now. So support currently added for primary plane only.
@@ -6346,6 +6354,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
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


