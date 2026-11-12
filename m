Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480481;
	b=nR1RC6Nru4XvNq0O4Pzx4NtO+KErGHLlvRYw/O0/PigsQSp6Vlva7SNX0VAJ4+NE0I/v
	 724RYmes9WDuW4JpDo3972r/ZJQH7VqzGQpJWX1OxFNpv/XgO0TRpGvQmHq3f8Q//tjuY
	 an8cyrzQf9bIqPUv7BWG67XvYbcxEqmgwSQPi8I0jpaCgN4+RkYjUhmdmvIgDOrPXzTSz
	 rr8i80BNFVBn2E9APO7Uz729y2lQKDevumXNWdj1SNlUE18HaH9oHacndq3iobiBqBdgP
	 /05DNR3LW/kYZR/hZ/nLkUdXktMoJyeXbE6DSm0PU/7CalU8Zs7vkRKnVZAdecVRPVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480481;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HI0lbFjaY/6Hi3z+bpQdk80+xCXsHYJtMP2Ovuw7Uq0=;
	b=0lTzeWVtFK5dKurmP1JCcppAGpbKL4aNOmLmGCfOQhlr8DYTf4mzwnKvliRAm6gTwAID
	 O37ES9NhsVVTDlQbnP+uNsbf3JL/9tNjqNtqYJZ3IVpquOpCnbETLzSIpDFi/hdWv81xM
	 6Bl4ZfPKH3rHDhz7GTsjUMRyJhZ4uCUKBSlXuDRWJmg7VzKMBfSzHiKUcRLyhgdUJNHJA
	 FlQOUu30VZXamN6zHtVLFQcYJT95MD7BS7aconB/Qi7rX6wnoPx+o83Rjnw/gsZFeelvl
	 02nVjcU374dCukvPog+IPA6DOTrRselTYmkS5lNMDXYC0iB1QLRC1A7r4CLX3KeDULQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5TMLUy1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921E606A321;
	Thu, 12 Nov 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5TMLUy1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794480481;
	b=DGBsMggxx4ZptZHwWOqWY7gj6Il35TH9Pi60WU/f2l6HGPtJ9TcxALAFXMNEEfFp7/tf
	 q4MsWx/KPF6tb7tLTcIRldHAPRRHgrmXXqAiklOvSjRA+h1XcbdvMZpcR2Ye36rypskGC
	 8U3AwGMB2GfhLkl46ElC3Rr9QIV825fbp4WRQEt56cLMJ8LwBwwUPHaMU8g0V0MAXsolU
	 6WOLCTF/5qxN8ea7gLpwZzH3HzcU1ZpToZdOsE+CJgodIYxRi47MUrxpHkbrQ6uMCBNxI
	 HcFCDLQ7wTgD6H+MPIcdAIdswT1t4zP0TCPm96cBm68geXN+5ce/koeW3vpNFk4mQsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794480481;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=HI0lbFjaY/6Hi3z+bpQdk80+xCXsHYJtMP2Ovuw7Uq0=;
	b=f9GO2/t5oGykj/SHlapU9x4uf20lmWh0d/ZUxgDkvidibwna9Eq+gaRhF5cR4+lWD5Mr
	 +351HRt//5oKwAcPGKiJipJGBWrx2Cq7CeGm+lj2lUZRgu8RZwV6qYMcIkh92Zh7zlfm9
	 QjGCMfI3V1SKMV9aA8Xz6xNrjG0R9c9myhUJPZXsaekgqJ4czO2pqGpK4Xj98kBx0leEP
	 cyxqVKmom30i5pnKJ+xweayvD5O9CtRS11YBAulEivaJ4q65tiRKOGVW0wxFYoJgr9ZOw
	 4Qe6ZKsmcCl8kPioarAZnVejYga09pFirEGC0TCsiSZKZn6o8fAjL7jEVFDKn4jZuFA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AB931F00A05;
	Thu, 12 Nov 2026 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480481;
	bh=HI0lbFjaY/6Hi3z+bpQdk80+xCXsHYJtMP2Ovuw7Uq0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=k5TMLUy1NNs3uASrSObLRHHLlr8M3JRszsjRmlRI2KoZCDpnF0XP95Nlk9U54rPYE
	 vUotJes3R5mNClnWM6HFqjmbIHbRecVTTzOTc8Ea74f8KONIzf1/cbSBJCjdElhQW1
	 D6Qti6N6JlXWqzD0shcTGm20eKX9EYtLAmLuuy/x5eT+Cv+f8jIKGpAX0PCxXEzZFT
	 2nfwUz1KiNXzkkVLV+tVBsJZ5gM1GvsP+D1Lm//nTNSahgTeeGBlj0YzYWN1nrEVKt
	 ou6moraJAqBBfQtnRYAv8bSHaLvnPd+6xkOK6tX2poBTAIwpsx8AqpnFyhXj/1cuhy
	 N7ObVJc1CqUDw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 79C424946D;
	Thu, 12 Nov 2026 10:47:59 +0000 (UTC)
From: Gopi Chandra Sekhar Reddy Kanala via B4 Relay <devnull+gopi.kanala.oss.qualcomm.com@kernel.org>
Date: Thu, 12 Nov 2026 16:17:42 +0530
Subject: [PATCH] soundwire: qcom: force runtime suspend across system sleep
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
Message-Id: <20261112-qcom-swr-system-sleep-v1-1-a61a83f6475d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE2Z9WoC/x2MSwqDQBAFryK9ToM9DIJeJWRhxqc2+J0OfhDv7
 pBd1aLqIkNUGFXZRRGbms5TEnllFPp66sDaJCeXu0JEHK9hHtn2yHbaDwkHYGF4J943RYnwpdQ
 uEa0e/+/7c98Pjrm7s2cAAAA=
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794480478; l=2222;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=PuQRJiq95loOQNMnfaO3Q8ngHy49cFz9em3LNzvhvDU=;
 b=KOc2VRthYaO2bun1MamwCsbJdgIeg4y9kZf9evD3HS8vfA2KlKz14lKS9JjT8zJmkmkL/h5AG
 CTPp69Lf6QyDFnhROwDofNz8IkKZ20XkJsQscEBSqM5dowRWzaLjHEk
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Endpoint-Received: by B4 Relay for gopi.kanala@oss.qualcomm.com/default
 with auth_id=1499
X-Original-From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Reply-To: gopi.kanala@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

The controller only implements runtime PM callbacks and relies on
runtime suspend to stop the bus clock, gate hclk and arm the wake IRQ.
That is not enough across system suspend: from the prepare phase until
the complete phase the PM core holds a runtime PM usage count on every
device, so a controller that is runtime active at that point stays
active until the system resumes. This happens when suspend is entered
within the 3 second autosuspend delay after bus activity, or when a
peripheral driver resumes its device from its own system suspend
callback, as the SDCA class function driver does to quiesce its
interrupts.

The bus clock then keeps running and hclk stays enabled for the whole
suspend. On Qualcomm platforms the LPASS clock votes behind it are held
as well, which keeps CX and DDR from collapsing in s2idle.

Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
system sleep callbacks, so the runtime suspend path always runs at
system suspend and is undone on resume. Peripherals are children of the
bus, so they are suspended before the controller and resumed after it.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
Tested on Glymur CRD (WSA884x speakers on two controllers) with
next-20261110. When s2idle is entered within the autosuspend delay
after playback, both controllers now stop the bus clock and gate hclk
during suspend, and playback works after resume.
---
 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a4cb62897192..6884ddbe69b3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1902,6 +1902,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops swrm_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
 };
 

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261112-qcom-swr-system-sleep-e42144d69ecb

Best regards,
-- 
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>


