Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793734095;
	b=YzbaNQADEzCYFhQbxTAqJsG4nzpU46xAEInxcxvVQvgzMdV+b7Hy+AnpgoCzzU6FeWis
	 JQl4aDfH3+1ulxFDYIsDe1PCJpYYZvkrZiK4tzpWvHW19qSE55loqGtLYJRPjz+HbEt+Z
	 /Ja/uEa/sl6XdLKk278NHxhIWJlSoMbbKxpBMuwvjB+U12PJE/HJrVfHWJBTtHX/ZsMWw
	 dm+GmpQJYokmb8aPi6dfVeIMBSemmd/8POdH0PGJRrOkPQLU6hcGUslZ0Xmvhc8Z5VDTi
	 ODxe+wx07srgt0is2WppBqEc1i5YOC6MxG9nBXj7q2rEfsPbsqCfVDigPMw3AVvbShw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734095;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WJac30W+Zgm/eZyctil4AFCBpQAeJTdsn2sd26VSGS0=;
	b=o/bTVU/JaONJGE+ZeDsDCv25h97ObdCuBHRvr7TBLDMO8q+82UZAeTa/Z/iFLDazdIpF
	 sFvD/gp1BeTp6w1TjmUBveULsSb9yn10kW6XGnJT1LnxXCdlu2x6cXTrrl8Yknwljq6Jv
	 EyvCPfZtXOIa13FA1YRl5X41knT7wHy300jjtlqMelsJwWdA/qked0GJ31UIloHfDjYeI
	 /SCl2lSitzKZ6vEr0Yn0cF1bmMMapi2bJ98Rd2RXNwVO6XFJ6wqNfbn79fEA3QjoRWKLT
	 6Mj7jcsX8Q0oBT3JRDYKYR53/ZAVzLHcQSd0Z6C0JDx4wsyePCP1zQQebt5SN+e0v/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACWgK+DF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB2606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACWgK+DF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793734095;
	b=QBhgSCI2Hq0VS+B8AFy+Bk+X//F2ewkbMVaAIKdtvZ9VlKbLx/PGl9n+4le4xvrWNUyE
	 FXsdeykC0nhJntfPpwi2+yKMtS/qVqOUTaMKWKOaSfxsMeOZP6XMYY8jxdisI9Upm44WV
	 Sz488hDFOu060phiHRqRhAso75X0IZSZpFF1x+TBVr2cwJbESUv6SL+rO1tQN+AJq73TQ
	 io7aYFwYONhkJcce5heSn99wTNkisF6IJjFn0F+msGpJIE/n+TggPI5Y/z0s4SFmsRwIv
	 YmILhsfDNeqr7hbKvBsjTKg3wUEeJtRfGXrlSWuVONvizF+DQks4y4vjC2PYOUooOEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793734095;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WJac30W+Zgm/eZyctil4AFCBpQAeJTdsn2sd26VSGS0=;
	b=RR7QvcC7C7niCqDKfaaGXmopfIwX6DkO4xIvCTFM8vMlB5lCZdG0+UFK8twhd5hAc+88
	 FjY/p3JNsoCu2T94AMCyhVIv8IDmrOMAAMCywgEYjOPB3oaCFGG6KC3x8BTiK0O5x0TUI
	 bjo8iyptpsih2Y+VrU/hOs6jhC67UObEyvlwUZDnkr7N9mRMA+6EDynkDhstj1iGHtSR1
	 Cq2lgC+sOJKfNIGd6ZaBirFid8xe1FEdHsv02BRBQyGjcJztX4X3uBWnUEkVtdwjgF0vU
	 CAIIExFi/y2tmnrE1Jedn2kZoWbsxl7uxY8SsmiFpIhm/UIcwhwqfjUpYg9i/nyR8pg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 742611F00A16;
	Tue,  3 Nov 2026 19:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734094;
	bh=WJac30W+Zgm/eZyctil4AFCBpQAeJTdsn2sd26VSGS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ACWgK+DFSI43P6bcfP9WiqEDfT7y6siosWuGg0YIcQ+iNY6gAE7vb5LHKyfaz8Fxs
	 fSNagBY+jmB8BhyWafVzntwzP3W7mox6CGbNKOpvNmoF3wduHP1jtzW3akt5c2jGKs
	 Xu3yUtE2B0QTs60QfJq0J+HJFddW1Br7ij6laNSL8T58mkdtEQI0Md9OkKEWBUBRl5
	 T6mOP3KLpWx13D1VBufmTnkeIPGrLEE1DGGdL2gbsKRr/KnLDcDbfNdCKhFHl8CS7j
	 uqtoKNZ8kYHLybhIRpptnSaNfjaSzRonD50PcA8bDl5TWiYK1G8sn0XtRKmK0oQnj/
	 y15xIytSCdw/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1390946AD3;
	Tue,  3 Nov 2026 19:28:13 +0000 (UTC)
From: "David R. Hedges via B4 Relay" <devnull+linuxdev844.thelittleman.net@kernel.org>
Date: Tue, 03 Nov 2026 13:28:05 -0600
Subject: [PATCH 5/5] drm/nouveau: don't let an IRQ_HPD hide a plug or
 unplug event
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
Message-Id: <20261103-nouveau-dp-fixes-v1-5-892f4bd357cd@thelittleman.net>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
In-Reply-To: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 "David R. Hedges" <linuxdev844@thelittleman.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793734092; l=1736;
 i=linuxdev844@thelittleman.net; s=20261103; h=from:subject:message-id;
 bh=tP85nBIrptt737aDB86qPgSupi2I6nalDmVpTjCbdVo=;
 b=XrppRfVCwBqBGeUwfkz8GLy3LuTrae24FAi6dAaSGrRH9AN/7b/thlU74Ss42oEYKgGLOI7M+
 be1rwk3vWEvCfRM2HKXHOwK6PvMEO1zHF6IZ3apGnLWEA6nS05gtEAi
X-Developer-Key: i=linuxdev844@thelittleman.net; a=ed25519;
 pk=Cynzuei/w0GLdh3LuNJdvH7aaszLrHSxY5UyujS7l+g=
X-Endpoint-Received: by B4 Relay for linuxdev844@thelittleman.net/20261103
 with auth_id=1397
X-Original-From: "David R. Hedges" <linuxdev844@thelittleman.net>
Reply-To: linuxdev844@thelittleman.net
Content-Transfer-Encoding: 7bit

From: "David R. Hedges" <linuxdev844@thelittleman.net>

nouveau_dp_irq() passes an IRQ_HPD to the HPD worker as
NVIF_CONN_EVENT_V0_IRQ, adding NVIF_CONN_EVENT_V0_PLUG when the sink
count has changed, or NVIF_CONN_EVENT_V0_UNPLUG when servicing an MST
hub fails.  A real plug or unplug can also be pending in the same bits
by the time the worker runs.  nouveau_display_hpd_work() skips
connector detection for anything with the IRQ bit set, though, as long
as nouveau_dp_link_check() reports the link as fine, which it does
whenever there's no trained link to look at, so those plug and unplug
events are dropped.

Only take the link check shortcut for an IRQ_HPD on its own.

Fixes: 016dacb60e6d ("drm/nouveau/kms: pass event mask to hpd handler")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: David R. Hedges <linuxdev844@thelittleman.net>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index d71dcfc6ee66..4398cf0fc541 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -462,7 +462,12 @@ nouveau_display_hpd_work(struct work_struct *work)
 			    !!(bits & NVIF_CONN_EVENT_V0_UNPLUG),
 			    !!(bits & NVIF_CONN_EVENT_V0_IRQ));
 
-		if (bits & NVIF_CONN_EVENT_V0_IRQ) {
+		/* A plug or unplug event pending alongside the IRQ, such as a
+		 * sink count change reported by nouveau_dp_irq(), still needs
+		 * connector detection.
+		 */
+		if ((bits & NVIF_CONN_EVENT_V0_IRQ) &&
+		    !(bits & (NVIF_CONN_EVENT_V0_PLUG | NVIF_CONN_EVENT_V0_UNPLUG))) {
 			if (nouveau_dp_link_check(nv_connector))
 				continue;
 		}

-- 
2.55.0


