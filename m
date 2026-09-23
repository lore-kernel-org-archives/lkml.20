Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABD34DCE0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184219; cv=none; b=JxTV6VW36h3tk+46YARYDPs549WC9/W0w3rn+sNezsbXpiIkADGDbHaj2N07fkwBkz2BHR5CqZoM2qx9h83LbHUcPN1cbSX3Rdm6eoyRNWLclinL5aolKG0d/1e0BPmgAMwIlGqlouyMDBOlTtIj9oyFQXFF2Oqlcv6H/MbMKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184219; c=relaxed/simple;
	bh=YBpE9eDgNjo1ZUp99xeflRmiOi/EXzcRa9GGfxn8R+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDdbDbwLW6kDTgTKUg0g6ld55PJhiSNVtgEk4I0r0yaoC8Ur5wbzX82BjSpIdHYPCSt7Io0U4etecKuqah0ubafrQHslNz+FFoGAlJsCpp9rXPs6DgO/3MC+IXtyO930HLt9IiGYqXjSBCeFHomOqvGpRUr4N6zzE1NBgfoHvJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=cgBAZokp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JQzaqzty; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="cgBAZokp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JQzaqzty"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1BFF614000B5;
	Wed, 23 Sep 2026 13:23:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 23 Sep 2026 13:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790184216; x=
	1790270616; bh=MqKw34xDYLFZxTEiktBR5Fr1l3oX40GkW3GzSCBHQGc=; b=c
	gBAZokpFptwc5KwScZ3RlYaVQyiV66dyTp9dtk0sybc4m1UYriZY81dsazlgVVRD
	EGKL2R8reYkGx17rCj0jobbUKjNJyimfvpjbsOMl84bKwiB3dAoJA4p40nP/nHxN
	ldJ9zWPE7ypWzJTYkwjM9EzDUkYCsW97qA8qYumQGJIRgLNWx1QGDutp5CYLOEoI
	y9lQX/isXiRhlL2PtDtz1JuTcywjAbcuEIMGpH+58ivdrmsDB3EUvsWR40ZEzK0I
	pnJ+gklBu+bpCsvQoIzAV9fZyU8th87GF8autHSKGdWBaYG3Nec+HCyRE/OrQ3RU
	GxhjD3/c9HhDnL/DCgFhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790184216; x=1790270616; bh=M
	qKw34xDYLFZxTEiktBR5Fr1l3oX40GkW3GzSCBHQGc=; b=JQzaqztyosMcRQuvF
	HQfSEHWpOfFNkIkva8omrDFi8c8ZMF00dwUeqQX9T4wT1U4g5HByBsxXGo3GnVSV
	jcfc6cp0G2R7tKxRWwlpu2PVYmU+ZRTdKhbl0dSxlG9z6QXblmu94WU1jpnFYzFO
	DUQceZI5RY6y8vcbAfBjyLASs8Aj7QpztWSVqyIGkehFxTU1qnnZYqcd+l+9HFHa
	w7l+/QWXDS4UGrEBHeRRawIF1+EyJa57rHPIJ2YGSJcbpZogPMWg52c55kX8unCZ
	fDimTe78uY/Lhlzddl683wzt/1Vt96oZWrcrcWHIrUt4o41zJ1ewKgX8NDcJlNhV
	/xQAg==
X-ME-Sender: <xms:Fwu0ar9dLEUtfxzAvkZmGVGmoSh2Jn4GjNp3R__wNlhQGRYT7cBrmQ>
    <xme:Fwu0avcH_EazywjgDN0Cjl_Tef3WoLugnH4BYMjNZi4kQGpwm8Nj_dbCsuDMWFeQg
    eVmEwCG4zN4eVIgPmdqBhfZ0wdWqPsMjrEjNXe69zzJsfFf6e3Uwn8E>
X-ME-Received: <xmr:Fwu0asHJjJxVoPFpkq382GVhzJ8Jr5MMJpbHiHH1n5qcOgYMeVOYEeePDjroeSe07egaTXiA9HqHfAm4EcYfcE6vj-wkZP5366NTUcdM3uTB>
X-ME-Proxy-Cause: dmFkZTG1rixzTnjDSt9qmTYefNr9zvGtygiX4l/5FrcFQVdmDG93rz0+fg5J/N2k3M6sF+
    HyOXn4aYI9wxixzozOdolGq1z1eze2yqXJeNucOj+abiW9wHvAidtRap90rrCjd/Kuej/G
    +lNSGVMc4fqHuW1xqejl7gRxerEXvTePwpHx3F+5g+5sXmHlUBwznze/uWfxU29urcaHDx
    gCnGgyOuziss2RjgXsYqFXdLCTBR2sHWYqbDjzokiEy6hyWIwcnt62GeA7xgx0jeSLU40t
    PZ7698m0LTVEObgI4daLe74wPvcva1XxbuewEFx3GVYQ9QsM7ZA7FG7H35w/Jw6fIa+IF0
    aXe75Y6JH63/p/8n/HlxMenf3k6KoleKZ6wEbrbeuM9CoV9VvtHtP6lLi70tOd+yk0nRYH
    R6sogjHNqnoSwyjeERWaOyMYE1e9CnaEDDtVJ0Ve/87AJYoCGMy66F8X4FNag3Lm9p3qX9
    MvcwB74hVyRqtpjGdhNw80x8DtGy6gASyTxHPc/FiW+CE0t9vZq2tKgohJ+cBAnCNkLRjl
    XKFR7ow6za9v+h/mhDo47UoMvyvrz+7VezI159VtIldYqJO0MEJ7S7674aq+bOG1u7nn2Z
    7zS0OkC3HhZyZdvyPCQyN//gJBoUs/xwYPCNmXfmAuZ/6VjM0S2cvAVLc47g
X-ME-Proxy: <xmx:Fwu0alfOsou6_Dg2tXlfN4_SJl9GrMqojH1LrSlgAOH8HdOwhJBgvg>
    <xmx:Fwu0auEOizir3cFgitvd-ozvCfljxhWHwd4N-obf6UYud_k2npYPBw>
    <xmx:Fwu0amU8Ljta6vg3ahEsuM3LY3PzCOvycESDqoftnfLqKSgfdJssRw>
    <xmx:Fwu0atKC-G226hYYOugg91EhUBfW05J-pCo_R_4L7jSIKHAw3DtzhA>
    <xmx:GAu0avqr_L4sMj1-8GFIWNXQ94sf5QQ9jWCCl40YmGKlDmxidEQbEFch>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Sep 2026 13:23:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: dingiso.kernel@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firewire: cdev: fix client refcount leak in iso_resource_auto_work()
Date: Thu, 24 Sep 2026 02:23:28 +0900
Message-ID: <20260923172328.277232-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923172328.277232-1-o-takashi@sakamocchi.jp>
References: <20260923172328.277232-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The client reference leaks when the pending work is cancelled because an
additional reference was taken when scheduling the work.

The reference held by the fw_iso_resource_auto object already ensures
that the client structure remains valid for the lifetime of the object.
Therefore, the additional reference taken when scheduling the work is
unnecessary.

Remove the additional reference.

Reported-by: Dingisoul <dingiso.kernel@gmail.com>
Link: https://sourceforge.net/p/linux1394/mailman/message/59317811/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 9964c66f2989..a626468b4b0f 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -196,9 +196,7 @@ static int is_outbound_transaction_resource(const struct client_resource *resour
 
 static void schedule_iso_resource_auto(struct iso_resource_auto *r, unsigned long delay)
 {
-	client_get(r->client);
-	if (!queue_delayed_work(fw_workqueue, &r->work, delay))
-		client_put(r->client);
+	queue_delayed_work(fw_workqueue, &r->work, delay);
 }
 
 /*
@@ -1369,13 +1367,13 @@ static void iso_resource_auto_work(struct work_struct *work)
 		// Allow 1000ms grace period for other reallocations.
 		if (time_is_after_jiffies64(reset_jiffies + secs_to_jiffies(1))) {
 			schedule_iso_resource_auto(r, msecs_to_jiffies(333));
-			goto out;
+			return;
 		}
 		break;
 	case ISO_RES_AUTO_REALLOC:
 		// We could be called twice within the same generation.
 		if (resource_generation == current_generation)
-			goto out;
+			return;
 		break;
 	case ISO_RES_AUTO_DEALLOC:
 	default:
@@ -1397,7 +1395,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 		// Is this generation outdated already?  As long as this resource sticks in the
 		// xarray, it will be scheduled again for a newer generation or at shutdown.
 		if (channel == -EAGAIN)
-			goto out;
+			return;
 
 		bool success = channel >= 0 || bandwidth > 0;
 
@@ -1415,7 +1413,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 
 		if (todo == ISO_RES_AUTO_REALLOC) {
 			if (success)
-				goto out;
+				return;
 
 			// Notify the userspace client of the failure through a deallocation event.
 			e = r->e_dealloc;
@@ -1450,8 +1448,6 @@ static void iso_resource_auto_work(struct work_struct *work)
 		// For the incrementation by ioctl_allocate_iso_resource().
 		client_put(client);
 	}
- out:
-	client_put(client);
 }
 
 static void release_iso_resource_auto(struct client *client, struct client_resource *resource)
-- 
2.53.0

