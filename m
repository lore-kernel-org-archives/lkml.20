Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099507;
	b=C4yFbFjUDzcLlWPt7QabnV8wiciDecf9lU+s8sfolsk0GdzA05dm2KLRvivQxttj3fJv
	 +wMyRkC/QRZ+2ZrLDQqQ3TYzhpJgDQGDJW9lJ6dB8x74r3xmlq8gqZSu9nV0qbi3hcydD
	 WMErLCSK5DiK03Pe9uar4EU4wi0JfupmhKWWkhga7NEKwVedYU3MRpNs/dD5VEEFS8CbN
	 L+ip8zFjC9q/nH5Ke1V1Fk1bgiBoALmWDA7jbcZkWMO/wu63v38jUO8nnHQxiyf8DOvLq
	 n/Vr5mW75LtNNuWkeT0xHDQYPYFTKeh7QhAvhUIIxJnGzyEU01iPNolYlIb9tZNr6mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099507;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ZNZ1PFbAd3WXOSZ79HxKGLz5biQN25VWI9t5QUFhJg=;
	b=4+1v3gVjrmH5+COYN1yp0x1SJ58RPbxE/h7twBkgrHOCsUnKzPPOC/pa3So7VDoWxdOD
	 psgIMGcYb7QoecKpZ3+9Ye6j6AoaxRAVYAtuRVIa/yG/wSxkZVgJymfnIEqUBcQBy7mYR
	 BbbZ8o3Hg9940CYL/TfJhymczsr4xJpiZJdUWZywcEnUO+ANEW9yzn83gyhNccjm2ivsy
	 8Na4F3TYe2dRFfuND+GM7arRGDrBOYsfb5DJ3pN/r/6dyv2CK7VmAEnXl+VlVtCwpj4lZ
	 OU83o0ELofZs7FWjSlMxDoulXBp3UNWph5bkY3E/5xIUOjJexBsYiQZw9v0c0bOpdow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=runtimeverification.com;
	spf=pass smtp.mailfrom=runtimeverification.com;
	dkim=pass header.d=runtimeverification.com header.i=@runtimeverification.com header.a=rsa-sha256 header.s=protonmail header.b=sMMu2Jvb;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runtimeverification.com header.i=@runtimeverification.com header.a=rsa-sha256 header.s=protonmail header.b=sMMu2Jvb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1793099505; x=1793358705;
	bh=3ZNZ1PFbAd3WXOSZ79HxKGLz5biQN25VWI9t5QUFhJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sMMu2Jvb0v2pMl7+RupYxfJmcaPPznrS8ZFLSSnF83vJs19ql8ATvTSzVGb2SJyMV
	 wozXQakD7Eic/Lj3cJAgySi0opZ/QpP2s7kFxmf5gDZiqBFL0OlAb/tCrIVdAF8d/4
	 inNLUD62/sRPkENZq3G9vcitRfTZ+lyks0erh0l402ToaE1i2BBrpgtRic8LtPyxgE
	 Xeo19wWUeijFKHlFh/FJydvkHjSXVH/ajJmAH9gGumWndTMfYfxmlsk5OkKHxXmTS3
	 nceETJtclM4Xn/lrtSp8QArnxoHS+CXDVEb43n7nhaHUATWf0ZZj/Mg6a1kypd8MzO
	 8nZe4UnCAgKFA==
X-Pm-Submission-Id: 4jDSVj05Nlz2ScjB
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: ribalda@chromium.org,
	noambs2999@gmail.com,
	david.laight.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v4 3/3] media: uvcvideo: Skip frame descriptors with a zero computed size
Date: Tue, 27 Oct 2026 14:11:16 +0300
Message-Id: <20261027111116.119182-4-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027111116.119182-1-natalie.klaus@runtimeverification.com>
References: <20261027111116.119182-1-natalie.klaus@runtimeverification.com>
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

For uncompressed formats uvc_parse_frame() recomputes
dwMaxVideoFrameBufferSize from the frame dimensions and the bits per
pixel. All three operands are read straight from the descriptor bytes
with no range check, so the computed size is zero whenever any of them
is zero.

A zero size is not harmless. It is copied into
ctrl->dwMaxVideoFrameSize by uvc_fixup_video_ctrl() and reaches
uvc_queue_setup() as the vb2 plane size, where it trips
WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
drivers/media/common/videobuf2/videobuf2-core.c:951 and fails
VIDIOC_REQBUFS with -EINVAL. On a kernel built with panic_on_warn that
WARN is fatal.

Such a frame can also become the active one without any application
asking for it: when no frame matches the device's default bFrameIndex,
uvc_video_init() falls back to frames[0], so a device that also has
usable frames can come up unusable.

Skip the frame rather than rejecting the descriptor, which would discard
the whole streaming interface and every valid format on it. This follows
commit 81f3affa19d6 ("media: uvcvideo: Don't expose unsupported formats
to userspace"), which drops a format descriptor the driver cannot use
for the same reason: to keep it from reaching userspace and triggering a
WARN_ON.

The zero size case was found with Claude Code, an LLM tool, while
reviewing Noam's overflow patch.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Noam Ben Shimon <noambs2999@gmail.com>
Signed-off-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
---
Changes in v4:
- Changelog says how the zero size case was found.
- Rebased onto d135ab453a74.

Needs 1/3 for -EINVAL to mean "skip" and 2/3 for bufsize.

 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 4d1380c38ec6..c1c05bba7f7f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -308,6 +308,20 @@ static int uvc_parse_frame(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
+		/*
+		 * A zero-sized frame is unusable: it reaches vb2 as a zero
+		 * plane size, and it is reported to userspace as a 0x0 frame
+		 * with a zero sizeimage. Skip the frame descriptor, the
+		 * caller moves on to the next one.
+		 */
+		if (!bufsize) {
+			dev_warn(&streaming->intf->dev,
+				 "UVC non compliance: FRAME %u has zero size (%ux%u, %u bpp), skipping it.\n",
+				 frame->bFrameIndex, frame->wWidth,
+				 frame->wHeight, format->bpp);
+			return -EINVAL;
+		}
+
 		frame->dwMaxVideoFrameBufferSize = bufsize;
 	}
 
-- 
2.34.1

