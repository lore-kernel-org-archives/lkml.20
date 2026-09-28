Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961CD39E190
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600248; cv=none; b=q0YX/uayaD0qkwrcnbKqm6Adf2sy7AcgyBcEK2B2No8gckWOt5Tf0ecpaxoBUODEt6PNmrsZn6p89XxAJRabFs+U5aghKTobVFvn84tH7xp+r19ZB6B4VW6Kua6jZbFy6pE/ceAf48EuTJoOSyhuETxO1v7jKCzWt42zouygIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600248; c=relaxed/simple;
	bh=Tujj9/oCOYA24JNZuuvvfX9HPowRZb44YW2T11vtCDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShnF0fm7au9YVuby+0TaZMZ4iLfoEOnhdQ705prnL/tjjXoh4Dcl1mrz9+D0qGIBW5SV531W7ffoNLi7mxeTaaIs9+eHXM1Fe/ls60vzx0/e39ZODFp8JdRHx7PdexaXxkRxPamFFfvM67oZ1evllgk0sj1cUQQTDBd3usiU4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=2IpHIdOz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gg54kHQn; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="2IpHIdOz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gg54kHQn"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 8F06CEC01A3;
	Mon, 28 Sep 2026 08:57:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 28 Sep 2026 08:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790600245; x=
	1790686645; bh=ww+csCZOd4YxIU7Uhh2pfMF+NX5VaHEjMUVpSJF4zVc=; b=2
	IpHIdOzvGWoRWb8herkJulDZTkBmnFw9tX6xqg55oTPhbU/yE5wCBBUhaGe1tXjX
	Jt7jHHwlfkKLFV/MotMm5LlYpGEQDRlEr8M7ceyiuxjRyMsxV92du1b9g40Z+Vwt
	27q+LeGIXlu4dvBKsAypXELgSKF+CYR8zdooXzTz5HK2U2ltPmIfPCHZHrIvX5cS
	g5/Z3JVwIxkpKxBfh3qlrFUI7CUZXxb9NHhmsup7nE1Htwfje8spt7ezJY6CV8OQ
	1bejxQUP3QgMIizkqvOXsg3HaoI9foLqNRHs0+5R7OFo91Zq3Hofz6to10r2ow4e
	idrK6OfntnWMjOKYH2MTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790600245; x=1790686645; bh=w
	w+csCZOd4YxIU7Uhh2pfMF+NX5VaHEjMUVpSJF4zVc=; b=gg54kHQnrkg2MB2du
	MaegtlTuath8ZTvjeZ9FQIcbroxKVttn+1p8iAvY1Sgn3zFhtTPFg8RYfEOHezF/
	iBobc8K3MZ+v00aHO4XP7eMAwgLo4cCThCL7BR7T6ET/Xl1Ux+z/n3XZvQ2/YK/3
	dm35bWapNVNHYQS1iScwBbdBRKq+k+Ryd0U5q4xIZS4zRhHtAZzQfn/a+rHhASvv
	Alf+obuitQPUpfmcV0Gs14Yo2D/lK3jSLX69nv8hzGjh8fuv14/QQFc9UYbc1TxX
	J8dmKSpTlsWOUb8PtECzmyQjTHD69oTnPG8Scp0xWLRi1J2beynUDLDP9Imhp3X0
	/9rCQ==
X-ME-Sender: <xms:NWS6aq8mU2E2cSK4pDL86Cs69Uh0nZGchTIyTh_QSlxCny0WPp7AtA>
    <xme:NWS6aor7VrjM_6Aq4Avuz74raPkgn2wOzQUA1aijJVGQ8FV6SmYraqY90_As7AYUy
    r61wq92ed4RnoIl1LgJ_z7SldIWlJvOV-HMrpakHl_WPeGBmXldam7O>
X-ME-Received: <xmr:NWS6anmTBRyYprmYDv87q9PpGN5i1mYdoN38DmiEtNW7R019s1jhHWPO9M-uz_C2fdj-ciPYfD05JrcgulH4n7O5QqtaXskBLmmh91QmSW7C2-w>
X-ME-Proxy-Cause: dmFkZTGoXNmXcyDn4kCu49fXz1i0wiXW2A3q5bN9jRPJnLh7wQMIUQ0pzjynxHq4HI6MZh
    G4gd8BLpv22JEvBusQCGhOtHHpF2zI77S4StXRPKA7Dy7Tn1TLhpYkHGF0ZsLZMOqqpYen
    uXTf4WiAemYQ/8u9zVkUwk8Jttv6VkgCDeBnNQ+U4TxL8KI3960Sr7QQpmqB/UimAxtEdf
    LdFWysWM42JJeQnLTHG6I7XEf27Yh6+wmaCUB+MtXZSKPw7kDx6MLRYU6ORVFHQE7U+cpl
    YStzN56iIqNEgsKNOAVJLuRZ7qSIi8oPjxJ+hk3H04C3I8iJcAY+4OdDqFQHLSCshu+8MX
    JQffZtbqW3p0h+SXptsg5XpPSsTmXMXVRSVJz7Wd+aWEmfqZGrcafNOtc3fTdUJHV8FA3V
    SnFnrWo5cgPy2G3VDOoILooUJ1tUwr+yCRUtiXhm5RFujPkWGu0Cwqq1qn+jmUn6QrGxZO
    hvB65jVDCpXvlxhPNdPPvx+qUQXT4uzijyK+wlzi3Ym57vjb8OAEaFNCVD9eKb8CN5bi9U
    ulVuggGfu68eSowm39F3NT2CMR1Fia3u88PF/+NrnLpRw9flx8/z3nHjliZSPTsReNXzfq
    1C+3UPkhnekx4DNXNO1vWZhjiua1FzJgYiSWtWQFQrTyEuM6JQb9ch2osJPA
X-ME-Proxy: <xmx:NWS6avJrAnDDLLv3QwAbSkZ5ZCiLxN2SULESQ-BTOCchJLN4uf1J9Q>
    <xmx:NWS6aswUsBhdBKzCj4ylqQq7dXtWEs2CwravvD2UUuY0unVC9bPqqQ>
    <xmx:NWS6ansainsfIN_pS-mB8phgwSNUpzFwF97lkhNgcN8im65HJodaXQ>
    <xmx:NWS6arvQefXpeZa7YBrjMmeUv7VzxjHe28zADdSyX-ZD2rTLalsc0w>
    <xmx:NWS6agR2ulZhrOSfSG-Vvz2dzmHgNR2WelEyMH6zj26cgJlaVNmSE1s2>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 08:57:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] firewire: cdev: use kzalloc_flex() to allocate structure with quadlet array
Date: Mon, 28 Sep 2026 21:57:16 +0900
Message-ID: <20260928125718.50974-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
References: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some event structures have a trailing flexible array member of quadlets
to store event-specific data. Use kzalloc_flex() to allocate the
structure together with storage for the flexible array member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 9c204bd7af74..caabaaf99cb7 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -683,8 +683,8 @@ static int init_request(struct client *client,
 	    request->length < 4)
 		return -EINVAL;
 
-	e = kmalloc(sizeof(*e) + request->length, GFP_KERNEL);
-	if (e == NULL)
+	e = kzalloc_flex(*e, rsp.with_tstamp.data, DIV_ROUND_UP(request->length, sizeof(u32)));
+	if (!e)
 		return -ENOMEM;
 	e->client = client;
 
@@ -1696,7 +1696,7 @@ static int ioctl_send_phy_packet(struct client *client, union ioctl_arg *arg)
 	if (!client->device->is_local)
 		return -ENOSYS;
 
-	e = kzalloc(sizeof(*e) + sizeof(a->data), GFP_KERNEL);
+	e = kzalloc_flex(*e, phy_packet.with_tstamp.data, ARRAY_SIZE(a->data));
 	if (e == NULL)
 		return -ENOMEM;
 
@@ -1762,7 +1762,8 @@ void fw_cdev_handle_phy_packet(struct fw_card *card, struct fw_packet *p)
 		if (client->device->card != card)
 			continue;
 
-		struct inbound_phy_packet_event *e = kmalloc(sizeof(*e) + 8, GFP_KERNEL);
+		struct inbound_phy_packet_event *e =
+			kzalloc_flex(*e, phy_packet.with_tstamp.data, 2);
 		if (!e)
 			break;
 
-- 
2.53.0

