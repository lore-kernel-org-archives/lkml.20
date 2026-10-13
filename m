Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8474EB863
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890119; cv=none; b=LFWOlCJNMlAPySPoy+M2AP6lruK3NjXyIlS3COyDRKRN4IwnYj9TsUwFGTlI6F3R9csWmeOLJRqCRKyLnpRz/OzgfuB3d88qn3aagVU0DCKyMeUQmAC6RNOhLfuBBPEczPd392iL81Ab6DFXEu72pZe9f1f1H+1qXCpObjTNEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890119; c=relaxed/simple;
	bh=yyJJPsT+5VlKCPf092cxxGFAAuX/xgKooVbGXKMpJZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpDp3lcJUjAia2pfDzwM5kpH7K5KPp1ZNaqhQT89G9xM0oSZEMHgT7TlT/2eV4QEQ9o8l1hZYueaSrTvIlUesP1z6Samw058gYP0yP6SXO8WNRqg9U/bkgjhKIHEqMP7bdxv9kbfx/SA1XouSDEghf50mESf/oqgfCqJj5deHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=RqdjPKSE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BUq96ElU; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="RqdjPKSE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BUq96ElU"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F0F5E1400149
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:15:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 13 Oct 2026 07:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791890116; x=
	1791976516; bh=bVpY3E6vVmT4kiPD8ZOuNxglbgr4P2US6iN9Tm03V94=; b=R
	qdjPKSED90H0i5BPk9YFwRDwzsI40nbfBbZQoNRmmWVmDAdpt0KOtbN7w9aUE2+S
	oRABiQkFffJUrbirTis5lAYeJQBMLyivcHL3n+yyFFW4b6+q53VxEtbta+7lQ0nI
	OkAikKyOcUNc/wjkp40m+HmZVPPV7Qj9zBMPU1qixd0EmKiZuwqcv6nH7mxF41qT
	XyusSE08NYw7aYeSY8RPr0CnizZ9egdYuxC22EXaIJ+xhGViDt2VCMLY2jaby/xn
	JxE1ftOLfaAlieWEZUEP1Kf3vitdGIOQvLeD5dZadDjOn3hPhKWIVt2T8kAJW/5s
	qFKC/kb4Hg2E57v5VgfVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791890116; x=1791976516; bh=b
	VpY3E6vVmT4kiPD8ZOuNxglbgr4P2US6iN9Tm03V94=; b=BUq96ElUrgasL8nYP
	dQIZWeikWfABtClrN1tFHCwC5AzlZm3qItGeVmKEvyXVRIdUlwZFDAh9P0ZIpRvh
	MUbnpkKFXlNvZNLnoM1azjRU4TWGCPaHuES2HtTpDbQ+EUiIQ2TQ13TW5HclWFVF
	gZNJCBumf1c6SQfGDdeMNLrghMtmzlGhi0SYYw6e/paLDJTVwvAQ5B0VfIxOyp73
	7zuuHiCA2kBdyCZm2N8vnWnN8dTieTKrpN6IWGpMsIDRhyArZwBgfnVuNFNq2g4R
	ecZi5nbfQXf49HxUpnpdcbQGsFKETjjMSJIwwGyma9SCVyXupclc2Q0KnkpY5AOY
	TsJmA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791890116; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:SrKDBPg6ficWSso2PX+3COyoZVsLJirMuQWeUDZMV5o9Rqm
	Bq2R0QJXNqFsQg718ronp4w9a2Xz8xcMVVloIqfj5iC7i8b97Eqz3eweQea+yENK
	hHM7+6YrwEjq/AcWpH85lym52QOHxREqqQCU/07JFN0CI419/A9CWgIEQeAtRXan
	/RgSnYftvCst+FyU+u5RoYzq3YbyiBnE3TCBBCfL6iBNIYWubtYBMmHBy214IuUe
	5o07fGDS3CDOoio15V/PWGAVYKEVmPtv2KeSGKv0h8zzgiU6Y2q0466fzmdClyYJ
	k9iQuMJyDtVFNx8KGXzDfbvg9mTsQOiWyqKpA4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SytxJrvlKLHqNuSDoC+k4bcHYTcyuZBRr2dVXYbxXi8=:yyJJPsT+5VlKCPf092cxxGFAAuX/xgKooVbGXKMpJZg=;
X-ME-Sender: <xms:xBLOaqawNcJ3P7LSbP5yQ_2odR-atf3n--XddMS495dXRyxCtH3ESg>
    <xme:xBLOarWjc-LKi2JFzsHg1k3ZT3kXixoy_IPxcxOajFvH2V-tHsXyWH9MDYcXTxtvc
    yMW2-3Sya4qOXuHqsEIAxABLmlwymuohTQthcqoFN63FrnhWI2GYV-wXA>
X-ME-Received: <xmr:xBLOasjP8xosbkVu4VDayAHC3g1ENSV4vXesfQjhAHZ1S3rhxuSJeshdmT6p9ofb7qJgdg4x-2WOyU8x-ua6D8laogWJGM8HxCXv2fFIKIf6eQ>
X-ME-Proxy-Cause: dmFkZTEa4W56myFAnXGZKqKyHwSuZuijeMhN4PpzkUyH2YEgt6T/QHVb4ojvKJ0iiIbShh
    7ipNRlzatkBU1IMohN9xY47km39/7v3hQUI3K86ijMAXsRxoYLFw5+T7S5Og7TInYGU5ZN
    7rLy6duy7DmU0Oi0KjruBIbvMIzp8rSVmkxJ10D9iqgluyalt9eSwsau07G822DBgDUlSa
    AxlO06fJjVdpu6ZEs7ETxiIW0oyi2OoDllJ0k1kfrm8XcsqwZLzHEU23bibbN0RY2GdXh5
    RfNYx8iOgcztxvReqRbepF9h9ix++g/hS9Ig4WlGZhk7eCPcdaYMsRClLBVltnte1FOTC4
    fyoEh7eLKAE+wkEyv7OzGKWe5gRIboj1pDRxsY0nzXR6RlA1MYUzSoqiXPdrxfrrwsRsmC
    2pQ8AAv49EDgoo22Jy7uSCLwHqjJMTW6WMmpwkTjt1MtCR/cNr3LLU85dWfTSLT+GvPtwJ
    OqFhy5PTQBw7Um5NnaJ7ji54C+EJWCCCXU7xCdymczoiCraq3ja5OqfBhHwNxSruaI6/jx
    /l8wSsUJAozaYepqWpq6nonIBZAlZZWMOy+kO2gsTCO9AUwK9ffqoGLhKp4qvpIN6w9cLx
    Hpp/v+Tf6FzpzXB1r2n7c5Np8mIWIAHkpSO8T48PUAxnCahBhEG+eRIFDCbA
X-ME-Proxy: <xmx:xBLOapUTdSDQ2FIQNa6uwpemTzeL09vWB1KdyLlNeQ4QKe-U3eD8eg>
    <xmx:xBLOajPnYSCgnvTUCfigp_lmxYi3iYhDo6Ydk2WCjcJhYNyMAF3-8g>
    <xmx:xBLOalY6Pc6y0SoTvJHmUZqLiki5CvrrWpDVV1xMAxZb2zqO8f_AZQ>
    <xmx:xBLOavoiQWKo2B-xcMNP7Isa2RspAQKV2VnYq870h0BsgBkJ_eAmuQ>
    <xmx:xBLOavN2wGU9KDFc-QdrMdy5jbLmO5UM5oCh6QMiiqD1TfA-pYkqD-yx>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 07:15:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firewire: core: add kerneldoc for inbound transaction-related symbols
Date: Tue, 13 Oct 2026 20:15:09 +0900
Message-ID: <20261013111509.612518-3-o-takashi@sakamocchi.jp>
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

The core provides helper functions and structures for handling
transaction requests to local address regions.

Add kerneldoc comments for these symbols.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 Documentation/driver-api/firewire.rst |  2 ++
 drivers/firewire/core-transaction.c   | 37 +++++++++++++++------------
 include/linux/firewire.h              | 28 +++++++++++++++++---
 3 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/Documentation/driver-api/firewire.rst b/Documentation/driver-api/firewire.rst
index e1120376a31c..695c5f6db045 100644
--- a/Documentation/driver-api/firewire.rst
+++ b/Documentation/driver-api/firewire.rst
@@ -40,6 +40,8 @@ Firewire core transaction interfaces
 .. kernel-doc:: include/linux/firewire.h
    :identifiers: fw_transaction fw_transaction_callback_t fw_transaction_callback_with_tstamp_t
 		 fw_transaction_callback fw_send_request fw_send_request_with_tstamp
+		 fw_address_callback_t fw_address_handler fw_address_region
+
 .. kernel-doc:: drivers/firewire/core-transaction.c
     :export:
 
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 22cddb736289..0d577fff1577 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -619,6 +619,12 @@ static struct fw_address_handler *lookup_enclosing_address_handler(
 static DEFINE_SPINLOCK(address_handler_list_lock);
 static LIST_HEAD(address_handler_list);
 
+/**
+ * var fw_high_memory_region - An address range for high memory.
+ *
+ * Represents an address range within the Middle Address Space defined by the 1394 OHCI
+ * specification.
+ */
 const struct fw_address_region fw_high_memory_region =
 	{ .start = FW_MAX_PHYSICAL_RANGE, .end = 0xffffe0000000ULL, };
 EXPORT_SYMBOL(fw_high_memory_region);
@@ -654,21 +660,20 @@ static int put_address_handler(struct fw_address_handler *handler)
 }
 
 /**
- * fw_core_add_address_handler() - register for incoming requests
- * @handler:	callback
- * @region:	region in the IEEE 1212 node space address range
+ * fw_core_add_address_handler() - register a handler for incoming transaction requests to a
+ *				   specific address region.
+ * @handler: The handler including a callback function for an incoming transaction request.
+ * @region: The region in the IEEE 1212 node space address range.
  *
- * region->start, ->end, and handler->length have to be quadlet-aligned.
+ * &fw_address_handler.length, &fw_address_region.start, and &fw_address_region.end are specified
+ * in bytes and must be multiples of a quadlet. &fw_address_handler.offset is available after
+ * successful registration.
  *
  * When a request is received that falls within the specified address range, the specified callback
- * is invoked.  The parameters passed to the callback give the details of the particular request.
- *
- * The start offset of the handler's address region is determined by
- * fw_core_add_address_handler() and is returned in handler->offset.
+ * is invoked. The parameters passed to the callback give the details of the particular request.
  *
  * Address allocations are exclusive, except for the FCP registers.
  *
- * Context: Process context.
  * Returns: 0 on success, non-zero otherwise.
  */
 int fw_core_add_address_handler(struct fw_address_handler *handler,
@@ -710,13 +715,13 @@ int fw_core_add_address_handler(struct fw_address_handler *handler,
 EXPORT_SYMBOL(fw_core_add_address_handler);
 
 /**
- * fw_core_remove_address_handler() - unregister an address handler
- * @handler: callback
+ * fw_core_remove_address_handler() - unregister an address handler for an incoming transaction
+ *				      request.
+ * @handler: The registered handler.
  *
- * To be called in process context.
+ * After this function returns, the handler's callback is guaranteed not to be running on any CPU.
  *
- * When fw_core_remove_address_handler() returns, @handler->callback() is
- * guaranteed to not run on any CPU anymore.
+ * Context: Process context.
  */
 void fw_core_remove_address_handler(struct fw_address_handler *handler)
 {
@@ -951,8 +956,8 @@ __must_not_hold(&card->split_timeout.lock)
  * @request:	firewire request data for the transaction.
  * @rcode:	response code to send.
  *
- * Submit a response packet into the asynchronous response transmission queue. The @request
- * is going to be released when the transmission successfully finishes later.
+ * Submit a response packet into the asynchronous response transmission queue. The contents of
+ * @request are opaque to the caller. The @request is released when the transmission finishes.
  */
 void fw_send_response(struct fw_card *card,
 		      struct fw_request *request, int rcode)
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index f1cb7569eaa0..9c563fbdbbf0 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -348,7 +348,7 @@ union fw_transaction_callback {
 };
 
 /**
- * typedef fw_address_callback_t - Function to handle the request of the asynchronous transaction.
+ * typedef fw_address_callback_t - Function to handle the request of the incoming transaction.
  * @card: the card instance which receives the request
  * @request: the request instance.
  * @tcode: the transaction code
@@ -362,8 +362,9 @@ union fw_transaction_callback {
  *
  * This callback handles an inbound request subaction.
  *
- * The callback is responsible that fw_send_response() is called on the @request, except for FCP
- * registers for which the core takes care of that.
+ * The contents of @request are opaque to the callback. The callback is responsible for calling
+ * fw_send_response() for @request, except for FCP registers, for which the core handles the
+ * response.
  *
  * Context: Process context.
  */
@@ -434,18 +435,37 @@ struct fw_transaction {
 	u32 response_timestamp;
 };
 
+/**
+ * struct fw_address_handler - A handler for incoming transaction requests to a registered address
+ *			       region.
+ * @offset: The registered offset, available after successful registration.
+ * @length: The length of the address region in bytes, a multiple of a quadlet.
+ * @address_callback: Callback invoked when a transaction request is received for the registered
+ *		      address region.
+ * @callback_data: Data passed to @address_callback.
+ *
+ * This structure represents a handler registered to receive incoming asynchronous requests to a
+ * specific region of the address space on the local node.
+ */
 struct fw_address_handler {
 	u64 offset;
 	u64 length;
 	fw_address_callback_t address_callback;
 	void *callback_data;
 
-	// Only for core functions.
+	/* private: */
 	struct list_head link;
 	struct kref kref;
 	struct completion done;
 };
 
+/**
+ * struct fw_address_region - An address range.
+ * @start: The starting offset in bytes, a multiple of a quadlet.
+ * @end: The ending offset in bytes, a multiple of a quadlet.
+ *
+ * Represents a range of addresses in the local node's address space.
+ */
 struct fw_address_region {
 	u64 start;
 	u64 end;
-- 
2.53.0

