Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280984;
	b=hUELo3A/Nc8DnjmZ/eh49fyuEP3ZbwxPd+BpwJSrFcsU6bmqnfyeObjil9UI9Odut7eZ
	 Q4IAph0Iw7tBTZTwF9kU9UmmgSsEKcyYnmryd3j8ACbNUTrXEwqzRwYmmu6Vn/vsZF8+/
	 4SbHFPLNkxK1j5E3xzHY8xfS2NT/TgVI8EohEFWrhuYqN87yUtpiCQssF5kmMQW6jZo4X
	 64OZEsqoSqKFzNSbZ0TpwlvI4C6ZY9nWHa3oSBQrcC2BPfQmmo2IOj4+BvytVvOVFTDtj
	 xBQW/5xTc60tk68L27lvRjG7NBmcsDFbAORL5Nd8boH6qOWd8YsnFEAzce6hYrNV4dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280984;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=QILDmtc+8nRjK20h4sM+a1liCuVnE6PjgyOAFWW5stY=;
	b=maXRByyeCYl1qCrbVtaaaky3m6ni6UCKBk0fS402XHDJss+LUoQPBr918Ack7UxPRvmO
	 kUYmpEVyE2jHOfNPfRNTwztRPtciePog5gWLC0X5DPjX43NhKt9QGP8bdQMAFmu+wAe81
	 M+mQYHpmtQDwjnL5oF2TUnC8WWx7wLbGL79mSof/K/beyjwdgMJhagwaovN+xo2y9c9Hl
	 rSs3lNDxLb2KBQj8dh6Hz1OPmqKzS5mB7qoqbvC4Du/qT0Rw4ZGqkcPFLpD8TCbhbNwtb
	 CPaJvVTmRbhkBktBclLrqb5aDKrZ/Mp18Xp++3EkQOadodCSkKk+WBtb2NHJo1nDhuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aPBcaMU/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96C60A381A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aPBcaMU/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96401F031E1;
	Thu, 29 Oct 2026 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280983;
	bh=QILDmtc+8nRjK20h4sM+a1liCuVnE6PjgyOAFWW5stY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aPBcaMU/wwLRX0GNiO22rqEM2EdpKXp+KioUQI73hp/O/xDd3ZSBd1QL0c6tG9H2D
	 /sVuhWSH3XcXEB2QB3HraFCkkZ7Jf2UHjI8gvAI3/it9y17+whyYa8OCfWETHMRoyk
	 8wxfIL8iPJoaExXclyw7EHsCtfPo+gHivvZkZejyLPiEyp3qnKrbnvzOKXQj1K7U2/
	 vrPohnI9EYUBemTSLR5vodLuvJqmnwMVUxbPQxgi9KiA0WrQiAISwncEDsHV4Pn1ks
	 Mg4U8XljFNEcmDYuEK7XaHyO12hsTs0P4G8bpbXmpkudG67DBuQ/TnzEj6SaU3hnOn
	 piA8+47/g+3JQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:54 -0500
Subject: [PATCH v4 07/31] accel: ethosu: Limit perfmon counters to UAPI
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-7-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The perfmon creation UAPI has a fixed eight-entry counter array, but
only the hardware counter count limits ncounters. A device reporting more
than eight counters would allow out-of-bounds accesses to the request and
perfmon counter arrays.

Reject counts exceeding the UAPI array bound.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_perfmon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_perfmon.c b/drivers/accel/ethosu/ethosu_perfmon.c
index 0ae2df3ceac8..2a9b3cc1447b 100644
--- a/drivers/accel/ethosu/ethosu_perfmon.c
+++ b/drivers/accel/ethosu/ethosu_perfmon.c
@@ -165,8 +165,9 @@ int ethosu_ioctl_perfmon_create(struct drm_device *dev, void *data,
 	int ret;
 	u32 id;
 
-	/* Number of monitored counters cannot exceed HW limits. */
-	if (req->ncounters > ethosu->npu_info.pmu_counters)
+	/* Number of monitored counters cannot exceed HW or UAPI limits. */
+	if (req->ncounters > ethosu->npu_info.pmu_counters ||
+	    req->ncounters > DRM_ETHOSU_MAX_PERF_EVENT_COUNTERS)
 		return -EINVAL;
 
 	/* Make sure all counters are valid. */

-- 
2.53.0

