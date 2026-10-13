Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96104EB862
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890118; cv=none; b=Xlkq5m2zB5NwJgOKUe9taqybMwhXj5E39kd7iMz32qcs3HEbT4oyjfiSqJRBIouznGbsp9IC8a2NQ+JzBhhCNvpNzfJuDpFGrXrfNmswwUu/Dzod6J2AUHbrl/qw5Hha/Z34TMspyNHpPlJ1+39zGlYvTHPpISkL+L2MV9Z8MKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890118; c=relaxed/simple;
	bh=AfCdl4HJbRmp6Hd7z71SDz1x1fdA9qcvv+vhcAeDCuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kv5kJwKMe8W+a1Z4kSpSHUWkSj36UFr7mtZIrg3MH+vD7YxVVrry7xdrTi4KkBK6paIwt5AS2J018CxC6etAj3Oql3At3FmKRMC6MdxuE2bFTa7QmXkV3MfhDOuOKHRB5eXfB0NdwNzxf0k05bCpea8JV44t+xIdAk5fb99sQmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=HmSHTgZK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EUI5R0jW; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="HmSHTgZK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EUI5R0jW"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C60F2140012F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:15:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 13 Oct 2026 07:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791890115; x=
	1791976515; bh=YCfHQWmq7as0j19SjmeBOl3tCPjCVl6uLezoA/dR4Tg=; b=H
	mSHTgZKIyzZpw46T2aF5ijl153VcbqExSAfc/K3Pqk0Mitj081QodBoUIMAtwbig
	id/xdon4SccZUKp5IZKMb3wY8HH2v9xglJzXd0fP9VNCT9JRX7RS3Y/OR52kyRyF
	PhNKB39mIuImbPXeV3JzXT6WoKiTpqGC854sQ9tNP7OvdzcrCk6F3CRh1j/lysGA
	Foil2q3X4thI/67C/TPeLq6AnRELOh77CrHzNmbZHMpkMEKf4FdTmrrgccf4MCAm
	aw14nCj5WDOfFj+D2Yu74nxPx/A5rBlTPIAlyyym4ni2OBGAvST+7BzZkl6E6NeB
	HYrJVKM1h9/J0NQeX0usA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791890115; x=1791976515; bh=Y
	CfHQWmq7as0j19SjmeBOl3tCPjCVl6uLezoA/dR4Tg=; b=EUI5R0jW5xukCKGD3
	Amr3Tcx3G2x8pcG43s+Kh886AzqyYtblWInA82+v2GSjgBT0Iq679dVgY30XKKnL
	ushO8HE6QCxr35q9V3KjziI2+MOGublrhhAucCNFW6ze8y2hcF+rwYwWJQZmNZBW
	Q46I75mI/yj4C6F+VZ9TowWwk+Rhv5qJwTcqQexVSkuu7bghhwlocWz2juROmXWi
	xOzPPpgpA7I7he4NgNrYpU+GaP5HD03AhX3EfwnpyrPKoUauAxVJI/tyij0m9yad
	9iy86hIIHrSPNUSKaTjehhNA9xrJeGmEWBQ7swnwy9BYkj8i0W52y/WYoNYqp3zI
	dJkzg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791890115; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:dNRJONFVe7vK672lbg3hZEJ5lZty+xWOCJWiljTAbOVBtJt
	TiTwdBZPFN3H52yoVDHIuZVyLdYuU8iYz2c3xjQkcaMG1YiWwKBOrstT8SYIYdF1
	O2ITHK0F1+pvZEeMOkZbniibawhW02yyPZt6ZvK5RFAAl12P2ROlLaorCs0oW0Vs
	dI+ll3XiSW8l4jDHIaxIb6gwiZin481Xlas6Z1FrU9zIPH998zol4y8dsrrZN3s8
	WSdfE9cnZeBfyL54xfp/PVFudjrylzdMU7wppRgI5X6Yb/zoN4wEnWHLHYZYLRri
	hxyKUqY2Bf/j+o4R02K23HbF9mTAhfrO+1oGBpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:iEnPw2Um3a7QhoR+UndaV2fraqI7rd/mREQ5MM7GKD0=:AfCdl4HJbRmp6Hd7z71SDz1x1fdA9qcvv+vhcAeDCuw=;
X-ME-Sender: <xms:wxLOairaOibXY82Yt3kJZCrR4jrDHit8V4O1ZAYKkJpoaUTltx7DSw>
    <xme:wxLOaunootlLtNzbObPowjsKgRVTTKxv5kLGPqyE57T3c0wbqoLzsESUcvsdnOCPy
    lpzYycpuTWGbguMfXvCYr1cSOL_LySdDXZr18SEsOrcTQK76z2jmCrM>
X-ME-Received: <xmr:wxLOauz-MLanoYjnlwKdSiuJeUbaePx34shok0lT96oPQ6ADCQAav_YHro1o4LJtbLcbBL1hvuhuSQiDhODgJnWhFu0jqhintqN1xLYU2We1sA>
X-ME-Proxy-Cause: dmFkZTEa4W56myFAnXGZKqKyHwSuZuijeMhN4PpzkUyH2YEgt6T/QHVb4ojvKJ0iiIbShh
    7ipNRlzatkBU1IMohN9xY47km39/7v3hQUI3K86ijMAXsRxoYLFw5+T7S5Og7TInYGU5ZN
    7rLy6duy7DmU0Oi0KjruBIbvMIzp8rSVmkxJ10D9iqgluyalt9eSwsau07G822DBgDUlSa
    AxlO06fJjVdpu6ZEs7ETxiIW0oyi2OoDllJ0k1kfrm8XcsqwZLzHEU23bibbN0RY2GdXh5
    RfNYx8iOgcztxvReqRbepF9h9ix++g/hS9Ig4WlGZhk7eCPcdaYMsRClLBVltnte1FOTI1
    H7r4y1mLswCCohyzZGV+UMJINHjvnwWSUUVlrZF/BpDGCPq78tzc7vJxVsibJz9hcDw+aB
    yATqHs4/QU9DArBrFEPSFLNsiIAjtA8tomv5T55BNFsDlX9uhGCyh6gcYhZYzFXORZAbpq
    sOIS+AeLxSw+MiCGkFdJjyAaZTE+hSExM69GqJCx8Fi/fcUElwziXHT/Z+enYxWZFHgz+B
    tMygAhLYoJ71DeAyW9AdLBHJToNJi8R//CyJxSGNnaBJgA8Esh7Tyq3SNu1iLysz3UsgsE
    zStWjyIFQO3+aPNV25O+WyokwFQgki0pjKLWsmCv56hn0qZ3ruyjElnN5DRg
X-ME-Proxy: <xmx:wxLOaul9DN8d8SkLhNGUbZRRDROf_-c5HpmJgB5sWIGwDXJ9rxAPmg>
    <xmx:wxLOavek0S23Jbpi7zkxIDHLBtxs6E36HoUaHzSOihsPFFj9f7dctg>
    <xmx:wxLOasoe_9PZgvzWR_uwtfmJfQjh9roOesUO6D7xE2dm2_G-rgspJw>
    <xmx:wxLOal6g_ztxW7bapAg9WDWblYbAGBYm_E7bjvbqJxbEWtl0RfSKGQ>
    <xmx:wxLOapcX6j_ihlaqw9nLrw45K0tT9Itf5oSvCVB6Y5ueE9TpcYDSjrFW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 07:15:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firewire: core: add kerneldoc for outbound transaction-related symbols
Date: Tue, 13 Oct 2026 20:15:08 +0900
Message-ID: <20261013111509.612518-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013111509.612518-1-o-takashi@sakamocchi.jp>
References: <20261013111509.612518-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core provides helper functions and structures for initiating
asynchronous transactions.

Add kerneldoc comments for these symbols.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 Documentation/driver-api/firewire.rst |  3 ++
 drivers/firewire/core-transaction.c   |  2 +
 include/linux/firewire.h              | 61 +++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/Documentation/driver-api/firewire.rst b/Documentation/driver-api/firewire.rst
index 28a32410f7d2..e1120376a31c 100644
--- a/Documentation/driver-api/firewire.rst
+++ b/Documentation/driver-api/firewire.rst
@@ -37,6 +37,9 @@ Firewire device probing and sysfs interfaces
 Firewire core transaction interfaces
 ====================================
 
+.. kernel-doc:: include/linux/firewire.h
+   :identifiers: fw_transaction fw_transaction_callback_t fw_transaction_callback_with_tstamp_t
+		 fw_transaction_callback fw_send_request fw_send_request_with_tstamp
 .. kernel-doc:: drivers/firewire/core-transaction.c
     :export:
 
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 33c4ea48c6c9..22cddb736289 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -396,6 +396,8 @@ __must_hold(&card->transactions.lock)
  * than when the request packet actually hits the wire.  On the other hand,
  * transaction completion and hence execution of @callback may happen even
  * before fw_send_request() returns.
+ *
+ * Context: Process context.
  */
 void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode,
 		int destination_id, int generation, int speed, unsigned long long offset,
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index b55c2fdd739d..f1cb7569eaa0 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -286,13 +286,62 @@ struct fw_request;
 
 typedef void (*fw_packet_callback_t)(struct fw_packet *packet,
 				     struct fw_card *card, int status);
+
+/**
+ * typedef fw_transaction_callback_t - Function to handle the result of outgoing transaction.
+ * @card: the interface to send the request at
+ * @rcode: the response code
+ * @data: the data for the response subaction
+ * @length: the length of data
+ * @callback_data: the data registered with this callback
+ *
+ * This callback is called from a workqueue in process context after the outgoing transaction is
+ * completed successfully or unsuccessfully.
+ *
+ * Among its parameters is the response code which is either one of the rcodes per IEEE 1394 or, in
+ * case of internal errors, the firewire-core specific %RCODE_SEND_ERROR. The other firewire-core
+ * specific rcodes (%RCODE_CANCELLED, %RCODE_BUSY, %RCODE_GENERATION, %RCODE_NO_ACK) denote
+ * transaction timeout, busy responder, stale request generation, or missing ACK respectively.
+ *
+ * Context: Process context.
+ */
 typedef void (*fw_transaction_callback_t)(struct fw_card *card, int rcode,
 					  void *data, size_t length,
 					  void *callback_data);
+
+/**
+ * typedef fw_transaction_callback_with_tstamp_t - Function to handle the result of outgoing
+ *						   transaction with hardware time stamps.
+ * @card: the interface to send the request at
+ * @rcode: the response code
+ * @request_tstamp: the time stamp at which the request subaction finished
+ * @response_tstamp: the time stamp at which the response subaction finished
+ * @data: the data for the response subaction
+ * @length: the length of data
+ * @callback_data: the data registered with this callback
+ *
+ * This callback is called from a workqueue in process context after the outgoing transaction is
+ * completed successfully or unsuccessfully.
+ *
+ * Among its parameters is the response code which is either one of the rcodes per IEEE 1394 or, in
+ * case of internal errors, the firewire-core specific %RCODE_SEND_ERROR. The other firewire-core
+ * specific rcodes (%RCODE_CANCELLED, %RCODE_BUSY, %RCODE_GENERATION, %RCODE_NO_ACK) denote
+ * transaction timeout, busy responder, stale request generation, or missing ACK respectively.
+ *
+ * The timestamp consists of the low order 3 bits of second field and the full 13 bits of count
+ * field of isochronous cycle time register.
+ *
+ * Context: Process context.
+ */
 typedef void (*fw_transaction_callback_with_tstamp_t)(struct fw_card *card, int rcode,
 					u32 request_tstamp, u32 response_tstamp, void *data,
 					size_t length, void *callback_data);
 
+/**
+ * union fw_transaction_callback - A union to store the outgoing transaction callback.
+ * @without_tstamp: Callback without hardware timestamps.
+ * @with_tstamp: Callback with hardware timestamps.
+ */
 union fw_transaction_callback {
 	fw_transaction_callback_t without_tstamp;
 	fw_transaction_callback_with_tstamp_t with_tstamp;
@@ -352,7 +401,15 @@ struct fw_packet {
 	void *driver_data;
 };
 
+/**
+ * struct fw_transaction - A structure to hold outgoing transaction state.
+ *
+ * All structure members are for internal use only. Once passed to __fw_send_request(), this
+ * structure holds the state of an outgoing transaction. It must not be freed until the callback
+ * reports the transaction result.
+ */
 struct fw_transaction {
+	/* private: */
 	int node_id; /* The generation is implied; it is always the current. */
 	int tlabel;
 	struct list_head link;
@@ -429,6 +486,8 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
  *
  * After the transaction is completed successfully or unsuccessfully, the @callback will be called
  * in process context.
+ *
+ * Context: Any context.
  */
 static inline void fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode,
 				   int destination_id, int generation, int speed,
@@ -461,6 +520,8 @@ static inline void fw_send_request(struct fw_card *card, struct fw_transaction *
  *
  * After the transaction is completed successfully or unsuccessfully, the @callback will be called
  * in process context.
+ *
+ * Context: Any context.
  */
 static inline void fw_send_request_with_tstamp(struct fw_card *card, struct fw_transaction *t,
 	int tcode, int destination_id, int generation, int speed, unsigned long long offset,
-- 
2.53.0

