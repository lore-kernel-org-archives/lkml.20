Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593161;
	b=qhjVDuonWZ07sv/+Hk9VFXFzr3ggD4T+APEFa5hiv8RjxHxNAPM4jU+mX/Z/XlJGj+FX
	 nFeuj/RYU8fnR2p6zR8cGBQ4ng4He5yfQaPB+SzKFawM0JetP3Hcjcp+iJ8Ja+sDlFCUO
	 GDcta2Vsbf1V8K/Kbudm9OP5h4aN4CiS2LaYA/Z75dpzlcBVJMmAQ8gA0bU9H0KlycOP8
	 X74IRBRJ76RjeAVcncudhG7Zt+ejcDuX5xZvok5tBIgwqJRhu6mf8TWfbTrJIkq5jgbfL
	 cRqXx534t1M5cSh/ATCa18D/RahsyhZMeTgMX2ZTAn+XGLrei+cI/RVYpYcqWwoL+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593161;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=nbM3OvuGZ/TRxMFxHZCQoz9N67YE4+VJUa4NYqZeSMA=;
	b=ikT05KAbrXt7XZeCw4e/CTbQBNFozBPssz2Zd8sLo29Nf0zCd9hdU+Zf+TDr0KpqfLFw
	 SRUeRp+4++1DsDn/YCHqIs9n3PoUN+ay3fvpROLY7MQCgXV8aI30g7o9Ff9ZJpVAisfut
	 NoqCN/hrIIsrfk3ahAIYa44cJdRpckx+DY5Th5jQ5y1D9mDpUBnweKjOHokfWfZhfQtJA
	 8wXc0q8k2oIWj9ciXqALQ5LVSQtVAB4ldS3TuhRsI0wcXDgg5sDNF/49aPnhjjuw+XIdB
	 KIk6PrmeMEmCwFXe1gYCBmxTTyNjm3um9K8G5mFZCyBIr8eoUq6l42SHB7tcLdcoKLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=wCQTaSXk;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="q9fs/aAy";
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82221606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82221606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=wCQTaSXk;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=q9fs/aAy
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CD88E7A01D0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 01 Nov 2026 23:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593160; x=
	1793679560; bh=nbM3OvuGZ/TRxMFxHZCQoz9N67YE4+VJUa4NYqZeSMA=; b=w
	CQTaSXkntCfYeK4xFkTiBTuqKjkmBIz7DMgCAD2f4jdLMymziBfmkvwm+L09q3zL
	KrMT0TnDlpCA8iE6IvYmwj8RkMUhIDQllEF5tLT1ub1wgHXAHmFZiosDaYaK5nBH
	asdEDbXgMUCSpLi0C3KbhDQqvtwEcBD0xbmFQsLfZGYnt0YkNcHeRGyTZJSxBUY8
	Xdwz3QLVWuC9nVxbg8n86tU8aJXo7heTKxr56LWWdmHp7XkSc9X3BkrXItTSmGeN
	BndXHYJG5e9wbBBvHquaqFyClqXjng8T7OG/kPnv0ukoEHP/5r9Bjkpz/Ca/HoP4
	e6INIyQAa/R7fQUpAk0KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593160; x=1793679560; bh=n
	bM3OvuGZ/TRxMFxHZCQoz9N67YE4+VJUa4NYqZeSMA=; b=q9fs/aAyVWrtQAXcS
	AZEGaY75KxjTGCLlnS8+x8JGZQzVevZcbl5L6bQPP/p0TwFgi4PLdM3viCydM0a5
	cdnLFsngh7GMPidAqbGnRbO6t104e8M/RgMZtQLakB41L6o8Vwp9jpFVghekM0ZW
	gaicZ9QwevnLWsYX9jWcQ5/34G//DvaQlF27+nHAh4wqmkV/2ci7Zt6VIa8SBLwm
	rEYy9IaYIr9mVxFPBQtDrPDOV7z3IV+trJV5HYfPgO/QAzMxuwLumnLFgGTNkj27
	IcJj7I4MKouyBZdRIafX4uFTS7oXkiMFYgr806hLNsejuxra+vyRTvb669tYYiwo
	SSUDA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593160; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:jO2vY3JKIDd62RSHlwLZ0z6Ua+zKApVZCxkIKCx5ya+d0/L
	+Tn2pVslvYZkpza2m3OtL0K4sjEpYRhoy6+FR7uFaqgSYfJ/BXpN5GwEZvuIDmQ2
	Ji6/CB6S0yC8gkEjynNM9/mBPAxKy0iPEujg+WP/zEcQ6nn/zhnkx0C/aBuV4l4R
	Sz+lgyYtBWzuZkHhQlqRt9k1N2C/u1OBz9OQUOI4Y24d/xIIYxyAg1u4S9T8mn2z
	2T8boDxYRQmD1yQ4BdHCk3rKt0Qf85r7RnX+UM8HQZNViz0VPunEfbwS/DeuiOzc
	dT4NZ0MD7Nn+xJSChjMh7B8c9Qxys69u7Z+WBtA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LO5nT5Chzsf58SJfNaYax/CrEF4gIy2UOxNCqBrzrGI=:ssfhCI19Bn/QD+3YkiWj1k3o6MaoOut2MDntH3kzmUk=;
X-ME-Sender: <xms:SA_oanBJHAMx2N1YyMKqDO-Ecji0Qv2S7iiSw991ovRtuOt6yQNiMQ>
    <xme:SA_oarctILiGJWG3R_53MLSkZ3wh4fp5wkatZtOaWWugiUe59Zebwm9Kd38gJ_Fc2
    Kyi4fLwylTY0DyN43IBB2_5amXBBSL2h85GAzpa2o-m37ir_FrjR61R6w>
X-ME-Received: <xmr:SA_oaqJeQA_B5PpeGjohuz4oM875S237L07z42W8gWC7FGwf5Cuv0l-xvqrTJZdrIIyofIOapwPoR0i2eg4VKvPOgh5FycLnxd7LnMzSe6-6Qw>
X-ME-Proxy-Cause: dmFkZTEotuZ1ARIQS2kTcKhurtDCyw9TiUsuDsemNcTAuLGe1PjpywOF6RgNOJbbxX9IfF
    qtGUTS0vQql/3jfllbj0ddYECicsswbB+iH1f2JGy0zqoUOwH4WXcgpPGYBas3CfZwiV3i
    R1nZFyGKX5JmOKYl2NiaTvlmf/yS4dMdHOCx8STgt/d09meN3uMrmo+2Z/lZ/klclLOKlZ
    oHUBOSVXiQJHA0LcBXH7gxWxU+p6oRskza7gsjs71k7qhWpngUD+3gTULtJ3IImLnlqz7Q
    q7hz3NUu9qMJGiY5wXjZQTbswetdGR+PaTrNVkd7GTWMTxeD/XZj3VYl35qDeQqGC1m7lr
    av43E7Dwth7F3yJnEu7ZeXRRZGwYxYekbBClRwROYz/ZVZdv8nr6+3ewcHO7ItVaOf8jyo
    YDouqEKXak0Cw/maly019PZdtj74DSTTi/J0y2teS/J93dh4ZIEdyrChuHBdd0V7+C75CB
    qsb/48lLf+pN6tt60z2u8mGUuQ9Jp28JQXpIl1ITZNYvHgcXlzlacGYD2KgtycK+XZo3KX
    /eYGWvRgpAzQCk3o1To8rd87HpKbkVdiMXwDrHjkvArgeFqWrUdqUmL+yL5+pktZtDjqLO
    ghgGJxd3RBEj/StsZnaZexEp9+st5tcmlqK2isxfzhYPZCYuJvMJlW4+zLgA
X-ME-Proxy: <xmx:SA_oamfCXaoBRCsku_fsdQFHHOMnKS4ji59zairL5IGwD8k2XnLDpw>
    <xmx:SA_oap0CHSs8qBIx771sVLJRHAsxyPD5-AOqA97BBHcrAK5dpIvkkg>
    <xmx:SA_oangiQazLsLv2XcVQbpn3-JeMEPdYyEd5CY2lh6uysgBO7m3jhg>
    <xmx:SA_oanSF0edKw9ytbD8JPbVeVGKML0tE2BAKGZeSMeS_tQYn7niipg>
    <xmx:SA_oao2BtkE2VA4eB9aH8GTP--R357tE8uiFJt6HhHi2ndWkvjQXQK63>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:19 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] firewire: cdev: add context analysis annotations for phy_receiver_list
Date: Mon,  2 Nov 2026 13:19:06 +0900
Message-ID: <20261102041913.1187814-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
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

The phy receiver list is protected by a mutex.

Use guard annotations for both list and entry to describe the
synchronization requirements for accessing them.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 87efd65e6b00..512afa589e2e 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -48,7 +48,7 @@
 #define FW_CDEV_VERSION_EVENT_ASYNC_TSTAMP	6
 
 static DEFINE_MUTEX(phy_receiver_list_mutex);
-static LIST_HEAD(phy_receiver_list);
+static LIST_HEAD_GUARDED(phy_receiver_list, phy_receiver_list_mutex);
 
 struct client {
 	u32 version;
@@ -68,7 +68,7 @@ struct client {
 	struct fw_iso_buffer buffer;
 	unsigned long vm_start;
 
-	struct list_head phy_receiver_link;
+	struct list_head phy_receiver_link __guarded_by(phy_receiver_list_mutex);
 	u64 phy_receiver_closure;
 
 	struct list_head link;
@@ -320,7 +320,7 @@ static int fw_device_op_open(struct inode *inode, struct file *file)
 	INIT_LIST_HEAD(&client->event_list);
 	init_waitqueue_head(&client->wait);
 	init_waitqueue_head(&client->tx_flush_wait);
-	INIT_LIST_HEAD(&client->phy_receiver_link);
+	context_unsafe(INIT_LIST_HEAD(&client->phy_receiver_link));
 	INIT_LIST_HEAD(&client->link);
 	kref_init(&client->kref);
 	mutex_init(&client->iso_context_mutex);
-- 
2.53.0

