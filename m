Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665D52EEE91
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790480632; cv=none; b=CLeiAfn1vz5IBAKx/rZds+9YUTFxGzQFT1nq7OBR+Uq/9MM707kTwCkc1Tu+DnjI+BFuuiBIGv3azOGWWjiDyvM9sMajcczqsDZMdSIa1FNHHINKORY0F/FVJeqeNAI9WZWJIEdBJKX8MmfRoYJVYFHUh+H2yk3MbLbdBGmn4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790480632; c=relaxed/simple;
	bh=kNb+YVmqc+xPSq0+oOs7jFiRjyrj4bZ6t9PzABMCKro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/8oovZtyKUa8Lrfz1G/SQ2KVfIUwQZYq3nT2nGQUgCIZgj83+bpTAmqDgnBdWPQqV5FSWHHQpEl6g5nXY36c3F21iyI+GcJMYeYY8oJIBqlGCy0MmEUs7WG9favUydp7WRWGifizE03kGnI5/G2VepJqWV4P8lex9fWiFpXhY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=NZx/hvug; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b7WfcrfB; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="NZx/hvug";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b7WfcrfB"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A982B7A0086;
	Sat, 26 Sep 2026 23:43:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 26 Sep 2026 23:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790480630; x=
	1790567030; bh=oA22JI7vuUdzkSNj661Ci/Afg8Sp3YULnR9OyiZy8Ro=; b=N
	Zx/hvugHZ39XBk/s1Oaj78NiI1OQ/+ItEyBKv05Qnrc8K7s/x9Pbyq6g9CH6QZfc
	K26vvCq81SbHJIkUAZhgU9Fe7yows6facIIwjdIPro7Msd2Ux2MyScpiMcvmpJsX
	oxhad+thMTy6zpHj4r8MOcoND9ECOGTnaszF6zHL+8oSkGiegHyAMerURDtFsVmF
	VyO/wxDsXsBU4FLDmBuadGoVa0wCs2tEXdEq0/3y7l3MsQFcFhr9h6qm2rECJ0T+
	Thl6VD2ykq9RihnPyUnYFOQ3NBQa40+sfqvfrIPLXOurhqLzaOt2r+17OVzyfBwV
	2spR9KHt5EqJr36hG9mvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790480630; x=1790567030; bh=o
	A22JI7vuUdzkSNj661Ci/Afg8Sp3YULnR9OyiZy8Ro=; b=b7WfcrfBdlSSkAenf
	LVPEVODRn7uGJvR6kZnZ5PBBD1XGVrupvADrKB6NjgwUduO902zbRhH34Cc/mbL+
	sHnwqmBNCG1hzM3S1J112MMxlys82mS4PYxeQX81dStdjmZfh4g96vZ1STbSo7FB
	o0gsfyt1P+OT92JJEsOdeMDMW6U59oZCIuPKShCjugzUQPCSwQpVo7NrI2GtrHGO
	S7Weka51ALAic7HAOa4xKbCBRTtt5t3rUz/Rz8OV4PRElmanXfyp2TQY7wfkzkwW
	VAwDoBChH2+Rr7lxz3IEQPUciyJonLcvBVkKCOvYmy7AorWCDyvZAW5UEo1wflMt
	swKwQ==
X-ME-Sender: <xms:9pC4as30cXIUMQZrCejIZPjJxm2bHCeIvfmbv70o0R4ayqvangpqIg>
    <xme:9pC4alCyS7cj9c2jkSjes_Vje68UreY5d_c6l6vvVfzpST78MBkjgwvTjZ9jteMwi
    3qG82HUiEgzAenA0mQi3zysHC6AHaKRr-fn3vjUbldHTcSiM3lXGFjp>
X-ME-Received: <xmr:9pC4asdJ9bgnaCgBYwmMdMrIJcLHQsEZ47S3C6Fzf69LOzW6BNaU4P-H9qWkkQTR1wu-IpZhHThQSajMvFprUiqgX5W7p86MNlFgH7yPEJGSxA>
X-ME-Proxy-Cause: dmFkZTG4lT+eM/OUaCtoOYl/DyUmH6k9tq2VXzXC6mU+ZYl7CZZM+W0Br08Wif/3GBhDGp
    Em4hgAA9CUxyaNCqjaf/KtpIj1FEra4TRF29/NV/1S/y8EdHxPX88wYIaOiyDaa9NsBS5F
    +kvM1s44usrbRXVosvr7ETxX9g93L4NxUaiU6cXY08Lahq8sSjR6uinvDlZx12z/3pYizG
    V9zoLoiI3hYwl80Vv2me32vNfTt8/rRjnCTmT0nnPtU/WmBF9G8s8gMxryfkaCaDrerzaa
    bG5jinsMyQMBeDmNJGPF/S+Q9VsUgSIiUjYX/kygT771dTS82A003V47AUYrh8PeGKXPQe
    LrXY23UaAJa2hSu+ipSmOLCjd8HWMJjWxUaK/VExS/j9v01RecsDPLU4+SFDEDNfHgq/BM
    VoAWuID2mK++w4W8T2kUb1f+k8Brt7/o9CUp0OMBLQ9OVjUsJFXHn+rKSGIDMDBE801aRX
    I7DzbclwQN2GFl9j6UsKzjoHfUv1AauKUECpmxBnsFzLqSMj8lvXT5J9FNsDggrw2AIF5e
    bLV6+uqbLwLpOrWyba+fKXcX39hHEHg6CgL/uCqLpRybtP/JnLzhPrtqcyQQszMYtfrGaj
    fhT+aJk45NypgOhfV3h00ZR8+g+bxq31cj79Um5MoIFQ+LKN5WUbHCxkmPkw
X-ME-Proxy: <xmx:9pC4aigfxVMLF_A7nJElV57_eqcSxO6x_Cvr4_IlB4Sk8CS8ymI0rA>
    <xmx:9pC4asrmYAn0TM2o8YRIDURlLEbxCiEU6nyZZkEfgP49CWXeTBLG5g>
    <xmx:9pC4aqG3pa3zzpRE_OTdiGULt_T6NBmNajnKchhv-h8lYDMsnCGDew>
    <xmx:9pC4aundc-00bSOv_wSVCKo5By8S4S1ITKGc-5dH6c1pad3RYhJUDA>
    <xmx:9pC4apIHGhXF6xfyXIyUf45akMBkJ0MraMalDHkHCWHllCJPkBpGcmpf>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 23:43:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] firewire: cdev: wake up client from queue_event() only when any event is available
Date: Sun, 27 Sep 2026 12:43:41 +0900
Message-ID: <20260927034343.28076-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
References: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The in_shutdown member of client structure is set only when releasing
file descriptor, thus no need to wake up the client itself.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 5020895c42a0..9a539de9b0a1 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -338,13 +338,14 @@ static void queue_event(struct client *client, struct event *event,
 	event->v[1].size = size1;
 
 	scoped_guard(spinlock_irqsave, &client->lock) {
-		if (client->in_shutdown)
+		if (client->in_shutdown) {
 			kfree(event);
-		else
+		} else {
 			list_add_tail(&event->link, &client->event_list);
-	}
 
-	wake_up_interruptible(&client->wait);
+			wake_up_interruptible(&client->wait);
+		}
+	}
 }
 
 static int dequeue_event(struct client *client,
-- 
2.53.0

