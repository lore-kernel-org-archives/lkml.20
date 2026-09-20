Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DDD33557D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789901274; cv=none; b=czkYo09BEbD6I1SHLJbYLf7GMkoUzNgcEOBcoIbuBP8xqWrG4jtSSBENLMzKgBHwdW3ZAFDZW3mFaCeEenBGdZewrWKtZS0dk41+1CNmpzTEluZJ785+QfpkTvKr8W6Ve/ObLpeYHmo+U5Aj5uETcD4vpl/7jjGewcTImbBykYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789901274; c=relaxed/simple;
	bh=ZQkxMcA/8QQ2u8422ymn5e/N9IPxl3JwHlN4P7R7z44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ze9ICAlekQo/tLojGvr8qIfhM6m2/G9FT6AMsb7pOgNCEIkgbtRkPoBTaff3orAr+MmiG1/GxQdyPmwL/iniTaiGqL2uGrTlHjiUeEu+P1pKMbBNup6gTcUA9Mc5CvVoNoDn071XM6zOJW428y99nX8muhDHPB5SrJshNWuwUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=D5lt5gtO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Smy2vbFj; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="D5lt5gtO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Smy2vbFj"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E543E7A0121;
	Sun, 20 Sep 2026 06:47:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 20 Sep 2026 06:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789901270; x=1789987670; bh=AJAtvAQqMZ
	SriJHc3d/d7Ki3xXuWGV1gEy97i9mcSzk=; b=D5lt5gtOS00mIOBQJmgtCNozd/
	Wa/RX5AeTql17YtUIs+Gt9MsV13jf0ud7oC1BiF1t3dRfZDnjMMqLl+JFdorvllW
	A9Q8h0UoXn7SFj7iAauAJJrngBIDqDROmIiafZzINkkbUGTWLZfa2kYDqdkmFU2o
	ASpT0jeAlpwG1sq65mwu0icP9E/LqUJniJio2l06HqzBU9ORSUEq1p7rb9doKRbz
	48mMhyVjwKzPi47tj1MnUVKhNWnFJpa9ZlGCPJCVC8JlUcwa/Zm/B8qfD8f0HJWw
	XhVX27YWubEeJ82vbx//XcW0tE7iViq2LOZP9xjO2lvOzv+VQGvs+Ojr/y/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789901270; x=1789987670; bh=AJAtvAQqMZSriJHc3d/d7Ki3xXuWGV1gEy9
	7i9mcSzk=; b=Smy2vbFjAjudWT/Y9NSZv9rCT8DowYl7AMreajcuUMPiRYw+hpJ
	CVidzTqjxdgE4pCqYw1C/2hVJ9gtPcfewEaq/H1a7TVj4/OeTevbYXxAkGpk7MHF
	pEfCnpJL2UsFqbDtl/exE92s0eMQ6IP+680Aq8sXRQ64UH/qjynr0WwF4adX0Dq0
	SfcEmOMuVAareQLFoZsXNjqVbzTYwOtzG+TozzHPYSpSd9aMm/ujTDL7UjCEjcuS
	TeUcggohUTgnZb2c1Ww2Qd5uPcxx05G5u4PHIP+Ufg36FOpa2YmWocNxndUuwUoz
	y/mbRlOpllEnFCI+2/t4lP/TvK3DAoNWu5A==
X-ME-Sender: <xms:1rmvauErbwnEeO8CcQ1H5GCrlymPJO3lG2fPsjul-TDIN1CwUGjFNw>
    <xme:1rmvatQdCJ_pOkrIHiXk17joJowhwV8ALSo1ixUPoLVxLo0Al1Q5MKfNjMhYDTupv
    luUItH_-N6U_Lpx-mWXZCVTEzCgp0lqti1QJZCbB60PTi2rpofXhO0L>
X-ME-Received: <xmr:1rmvavuod0Jt9sS8q2jWXb9kHPvd9cCVkiI5SECb-i3desfzdwREt2S6KiOJ9HTnpX0zPrlLPyM5AU56jy1I4R_AC56Nj_1OGKNv2CUroaTNPg>
X-ME-Proxy-Cause: dmFkZTGBJ9CeRu5u3ABLSPbRblBGCNgKL7gzEgvBv/24xYMs2FEN1flEPnbFsB/f0TAoQB
    cyPH19HRq7HSRCC+tPEz6zAWxizRqbJNAKnQpst2A55g8NwlQjfCpRomeTY4YSA12foaXB
    m6mpNp+LQy7hqt5v903ACtFiTcs36/neApLIDXrNfmDE0j5tK03aEWfaohSzzZOXzH6bS3
    II/j12+ieMrmFjpIa0nP6liXHe2tNQ44HhG24fbYtvvOFzEykmYIBvWFAoiMfM3Btjax0f
    aZvN+hTyUkap1j6QlZ4gkXvX0y4ocWShGIt5Iuu28nxCTyytc+BnO/ScI2gwGISvnlU9R6
    uApwjoHiBHf+UYQk0xkJgPC89k3hUbk7lVpXVwqpwfeI3pL5pI2awSCG6t8nZRiyqVsm/Z
    YZ1W+JusTaLWtAfjnMYAcAyLiVS+9RYVJT5NTTXdi7Q8UlGbnNwiUv6oe9mz3nWe5jKCN6
    +YyeBT4VCD6TfymtIsoWwyBDlhCSVHUS4RnNkQ9wagtFk/r+1idJnjyirs/ym/mShFIhtf
    SZpUOq/hm819ZYnfxjX+gtHJ18AfissymjWjV3nQjUbTL7eJp8MIu46FMEY4b91saw+maL
    sqrtWLLqQJSW23kun1olv9wlAxyVjC8LMqiDUPUGofeKQ7urMRYpV1QccE+A
X-ME-Proxy: <xmx:1rmvakxgwN0SVKqd1LysVjIgX5L7drj65bTjzD5VkN8nd26hRaZ6hw>
    <xmx:1rmvah77Ectj2xz4paMHEQzW_KckjaKn-86Dp8eVZh1gYbSzOuCIaw>
    <xmx:1rmvamXXvtN37yuHh4vGg2QkpBoNY5UfS2r41DTG8ZmaBD44VG1NPQ>
    <xmx:1rmval18YPlAkOx-6yAeKQ5SjijK8jEtpGKZrxDVV1htoLSIy8N1Fw>
    <xmx:1rmvakZuJaA1U_THF_zEKNHcTYnPfksCOcmI3z2VLq3qpvEAqnxYU1Kp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 06:47:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: consolidate lock scopes for event waiting in dequeue function
Date: Sun, 20 Sep 2026 19:47:45 +0900
Message-ID: <20260920104745.212753-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation uses the spinlock in the card structure to
serialize accesses to the event list. The dequeue_event() function yields
the CPU while waiting for the condition to become true, but checks the
list without acquiring the spinlock. It acquires the spinlock when
operating the list, however it assumes that the list has at least one
entry.

This can cause problems when multiple threads execute read(2) system calls
concurrently, since the list can become empty after rescheduling but before
the list operation, depending on the scheduling order of the two threads.

Use a wait_event variant that reacquires the lock after being
rescheduled, before checking the condition.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index e49d8a58be09..54f7376ef1f5 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -356,19 +356,27 @@ static int dequeue_event(struct client *client,
 	size_t size, total;
 	int i, ret;
 
-	ret = wait_event_interruptible(client->wait,
-			!list_empty(&client->event_list) ||
-			fw_device_is_shutdown(client->device));
-	if (ret < 0)
-		return ret;
+	// After the following block, the event pointer above is guaranteed to have a correct value.
+	{
+		spin_lock_irq(&client->lock);
 
-	if (list_empty(&client->event_list) &&
-		       fw_device_is_shutdown(client->device))
-		return -ENODEV;
+		int ret = wait_event_interruptible_lock_irq(client->wait,
+			!list_empty(&client->event_list) || fw_device_is_shutdown(client->device),
+			client->lock);
+		if (ret < 0) {
+			spin_unlock_irq(&client->lock);
+			return ret;
+		}
+
+		if (fw_device_is_shutdown(client->device)) {
+			spin_unlock_irq(&client->lock);
+			return -ENODEV;
+		}
 
-	scoped_guard(spinlock_irq, &client->lock) {
 		event = list_first_entry(&client->event_list, struct event, link);
 		list_del(&event->link);
+
+		spin_unlock_irq(&client->lock);
 	}
 
 	total = 0;
-- 
2.53.0

