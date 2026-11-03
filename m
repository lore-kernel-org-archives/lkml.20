Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680193;
	b=bM+WU5hMfXZQXHudCtB3cIlMF3tysvlrXPcenAkPT5YH2f49yYlf3+XHmJSWg96TU+6s
	 qeZ8mM7bUDal+Oj0hqBViRZaM2R2OPqoXC/QcLq1mda/L7OZxoSUYxi3anS1y2FuJGIjx
	 lqkxXC9jJejWCHKpVqad5u1flwtpLIcsKTY3C8J9mK9QwY3ztGVKy0wooTMZtl/1mj2ha
	 vNQirldz1qYKjZGc7/aGjGYxsbHK5JRuPrkgro9hZ2Hlxv3Q5KMFE/jA7uGsr27+1dl3R
	 FVLuBaWQdTKUW988urdm9Yy8leIF9fVQxYMNuWaE3tTZeMOCtHYaXoXYzQswIIZ2M4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680193;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=lWasohidqJuomnpel9BN34sg5fgh0RF0w6Q0IqYRr3k=;
	b=Mx+NJ4m/vTiWhHV2aD+zUJwgOJwn9TQ4nAtDOK+KNbaqAXDqOuDXc8OJKx0xB80PYkxZ
	 ApZvzAAMkHOskRcawaBxy9X72SnoWJJjNt4mul2Bss6vYg50cxK/J7d6A/rcqYDYnlNJH
	 z6ppNJj5310o3ZGVfJgLGZZpt5frwvgPa34WW6Q+4NNXNTicPrp0o5RLnr2kAm75U4R6d
	 cJ8XGEbVwN0sdtklxl8Z0s2OM1I7uZp2x8D/sR6zF62wBqXqr7LH4M4V82eC6P8vk7ipY
	 xr41nQIW0LMexsc30OVK4dONLtt7n5xTnCZDJOaiCNyn+IxjHVxAiC59WT2le+ZuoRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=GblWnYnk;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="TGckiL/2";
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C50606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C50606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=GblWnYnk;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TGckiL/2
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 0F3711D00134
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 23:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680191; x=
	1793766591; bh=lWasohidqJuomnpel9BN34sg5fgh0RF0w6Q0IqYRr3k=; b=G
	blWnYnkWRM6DaMwXra9F8xQHRVkKWkp6L4KJRwCa6UZL+b68seRsAoQRflaZMmPQ
	L2lEPzZkin+UbDku1klcVVRH5Qf/r/MeYbZXVaHW6OkbP6yee4T2knFN9b8CXDBD
	hUPTSaHk2HUrPHblgK86fo5ZYFI4XqI+orPKXL3lCMrVfgQi8cAZ6211X7DIvSS2
	+ICwx7XF7ZeoLoyPk6NoXyBQ7pEhtczenR6QhIrg9XDpJ8M9HnYHVRgV3xnTgZWL
	ROsxual6oaCnAem4Et1fSaJTDGLUcikUOuz19S15C7HXszAk3pq6m69SEqfwgvev
	V8TQqzLMCaY53YSRZzt4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680191; x=1793766591; bh=l
	WasohidqJuomnpel9BN34sg5fgh0RF0w6Q0IqYRr3k=; b=TGckiL/2/bW7PZ4t3
	pPoJIFKV6TNxDjfigRDJpMVt2u0THR2tZhVVmoHhdewN+TNhSMsYNwqr4VVqtlkf
	Jjn2ki1E4f9Dr2tMLO6xdm0HY40J9h40D8sdX1aV0cg+Di/ILUOXBYK1jD/edjKA
	Z53sPEMZi6zy1xwq5KOEHtbKapoRJLeYKaEW8z5QqHrkzVXPzDaBHEtIqXXSiUBQ
	6HK+X0Qam9AxZcgNZgnfr6ZNPvXZ+8LdnmIdeHcyKJP7DdRcIk01e/SbPNO1F+sQ
	x19JilmYMxbXME4yxuisi3UB+CXve+VdZYadQzKI/MXGn8jr7rMJT+qqXPYfGTP2
	Q+NJQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680191; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:hEgOv6p6yB1exbIWxW8QZJQktHksFJO3MXXi3K2V26wFIid
	jzVk87EmUe5xags3ScIY+vRDAxAfRXNALc82ScXjH7otP8b8j2VYGfBtAHWHltVA
	xN6OWAQh0ex6zi52XRV7R7jJv3wyNQp3ocJBRr8b6LpsOAJENBmAuAs5DmVjwt+v
	JkGIQ6zi7oFknkDW1tVSNxTrw+6ZBATOWmQeG25dCXucRPKEl6FE4MaQoVoPxLyI
	SXY2dGsxI2lSJYJrEgpkZ07aYi3NA3+e6ciCoQYIymtYe6XE01FcZN4bgKk0aq7N
	XSf0MPDLzoE00gZhKJycxejRCfhLV12F50syZFw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:eV2TsEZE2qOl0e+GD6IBpaP4yfWWvcV0QIJtDbUfTm4=:QK8Wq+eY9LQFlIdIUbDkHVj3t4SItt/O7WhRT6MtNRI=;
X-ME-Sender: <xms:P2PpaqZb-pOMyTlHcz044oVrWlEbvDOSTAPhtD--K17dw7SEcWTVjg>
    <xme:P2PparVy0ojr1-yrcxzmbygvJhZjrtlHtBou6jXNBPzqEsTpZ_PMd0ZOkgNm0D6av
    psdGbW4IEpnBIwA0er9l6XlmoJcgTcTf-pLXbGThJJE47fBu0zFTDbE>
X-ME-Received: <xmr:P2PpasjyS_NJrY0rTl9Fxrd2A0WwG1_6AAjumgqJt2oB3mwYgoYBZJnXvNGpuVlmeFFuOlp7_Htas95ceLpxihVWd-uS9ElyuP3TkpK9KfQ8>
X-ME-Proxy-Cause: dmFkZTE2Iir9RTLN8+QEF5l3mK7SQuNkg7PqGKPiXrjn8slDkBxugTaak0SAGwGrkTtxZV
    0rB7DEjjFC0C07lkYqjfTOr2EV+mRIFgwdgg9WVQFY/EyS2CmoHfF0sdJ943pnSWEwp0Ps
    zzq7vXRnQ5LOIAUK6shFGh5FJxBXh1a8vgLEz8eQjKKA9adndBRpHZEMr75mWp0/PX5l8D
    blzevvRBaIKmV3HVBBjqRRL3KEeJra2jU4fMYHk/lEhR3Yq4Oqui7vdjR1BNc7nL47VEsr
    wuwZ4awpM64raBfPqA8uZ5Ku5FGhp/SXWnu0PbnF0QaSJuMp7lZaIcfyNtaIwRWuVg1bW7
    3yigu1E7cXxOIMRlZuh/E6q4dSnj7ks7xnB8G5keX1GKE6j8YMNdD0WZgGAghE3Q2AUefK
    DiCpWuQ4c1eb5oG5XvjE+sajaefjUnwv41g25KVJGH2rMkODtyJnqZDulEjWikKLZMLjpN
    s8akuBcsWlnoC4BSn4lillIEwblV0zLTGaJNEHJMD2VTl8onxysMwelaJQEUapPZ62ecCF
    lMRyCCwi8SXQzBx2YGcnbibVtXdQ12U2sglNAxKLzpE/Q0Uc5w8YmGog8ATv/S0NYtMsP+
    N6TSZD5RkHCJG4heyxnUg8krURBOnqD7bByBsFtfQjaA0tZZl0tf96cAUPpA
X-ME-Proxy: <xmx:P2PpapX6bbEdD6WOqVILohv0zNXa4PEYAkXKY_waTByaDgajOUevVQ>
    <xmx:P2PpajNC5m1LBuNLzkGO7e9BF2rAcVr7rJwjG3iGH4OtyHt5AOe1zg>
    <xmx:P2Ppalb5WZ0aR-6rPkyMaL7AXE8VjfH8qTvxWXi5xq0T7rhXX7A1Bw>
    <xmx:P2Ppavp1GHkAN5pDYQSEvg5TqzQD_Q169Ky4BkM5DVKOpAM_zORg9g>
    <xmx:P2PpavO5QKtP_FfsgCMoxLYU9ueHFYQXmuP8hVF3sxIj5oQWPv1mNne7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:50 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] firewire: cdev: use cleanup function for outbound transaction event allocation
Date: Tue,  3 Nov 2026 13:29:37 +0900
Message-ID: <20261103042939.1231773-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
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

Use a cleanup function to simplify error handling when allocating an
outbound transaction event.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index eabb5213e3e1..feedc2ab863e 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -672,9 +672,8 @@ static int init_request(struct client *client,
 			struct fw_cdev_send_request *request,
 			int destination_id, int speed)
 {
-	struct outbound_transaction_event *e;
+	struct outbound_transaction_event *e __free(kfree) = NULL;
 	void *payload;
-	int ret;
 
 	if (request->tcode != TCODE_STREAM_DATA &&
 	    (request->length > 4096 || request->length > 512 << speed))
@@ -705,24 +704,19 @@ static int init_request(struct client *client,
 		payload = rsp->data;
 	}
 
-	if (request->data && copy_from_user(payload, u64_to_uptr(request->data), request->length)) {
-		ret = -EFAULT;
-		goto failed;
-	}
+	if (request->data && copy_from_user(payload, u64_to_uptr(request->data), request->length))
+		return -EFAULT;
 
-	ret = add_client_resource(client, &e->r.resource, release_transaction);
+	int ret = add_client_resource(client, &e->r.resource, release_transaction);
 	if (ret < 0)
-		goto failed;
+		return ret;
 
 	fw_send_request_with_tstamp(client->device->card, &e->r.transaction, request->tcode,
 				    destination_id, request->generation, speed, request->offset,
 				    payload, request->length, complete_transaction, e);
-	return 0;
-
- failed:
-	kfree(e);
+	retain_and_null_ptr(e);
 
-	return ret;
+	return 0;
 }
 
 static int ioctl_send_request(struct client *client, union ioctl_arg *arg)
-- 
2.53.0

