Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593169;
	b=MdpVpFwu1F2yuyBFdGF1b89hrdtWSrujvR9pC0LAtKZqZ6J6tMvnJWCFfRHJHYLq2FnA
	 u4ltcM1DXH+TsjVS53svxKrjqF+bVJpmeOI0CQkmgvG/WlmX1mGhGsncWy0ScyJr4zBsi
	 hmMSC52kd2TyihgKsSYbnV1NYcZD60fvUNIX+uKnQImNjDnIanJWfrEC7DRk2ckm9CMbZ
	 KrCRpjd9H+36KchHsx/cCGXzJmxpSpqv1Mf3+t0ygN4epTzhbQzW2Z31ajZWXFHRWkvk/
	 rphCG6Rt7sQuZgU/V6YDr4wzsKB9KoHHnHzVa5/U55qj/ahbcO1PFYe3BayhFrVw28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593169;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Bh9QfzeZ10Qrmrf6uozr1PmDqI93BYwGPqTYWxFYzcA=;
	b=SjtnNK6qd8p4PkHuhLuJ6qiBQSHWEbGECcJVJ522csLAgTfsusfnCm73E+zNC0NY3Kog
	 T55/85W/aKbmvWLmugMowbMyE2di7FJqgN2bGq1SUmmXCRiT+mrFKUtJ35+qaXoEe/wEi
	 E5G1uxDGWC5ZJ153FnGSmtjVjs+PFCAmuuGPlWo7VnszDlse2BCY6zqqUvDi1oDGSMCBR
	 5FFKmsrok+Oi1EESJvc0Xuuwkbq637FrCmbVfv6rtoIlpz8oU9MvLeFsT+ceBNonu8+6q
	 SNUk95vzOjZ/NDH2wNM3kg+d1hhugFvNUnevkOXVvktUflj6+QCg11VaaT3LeRB1iUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=MQzYJc6s;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="ljoW/IZF";
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D1B606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D1B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=MQzYJc6s;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ljoW/IZF
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C01667A01CD
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:19:28 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 01 Nov 2026 23:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793593168; x=
	1793679568; bh=Bh9QfzeZ10Qrmrf6uozr1PmDqI93BYwGPqTYWxFYzcA=; b=M
	QzYJc6sRvG/YvCzp6/jE6E0f/49OG0LrtnrE37iNIcQEJo72wET8fALBzNqsev2Z
	xq4gP1OtDa7HPTVWMmWALEZ459gGatdEVjADRsbvXNHzyYfX+gvDdgxUtQkcCSgS
	6QI3jVWMPu3JjlRCwbnbeHCtX/WHwHz2Xmjzvaa1z3nTHZvh80PYG71SZbUCTqzg
	zUnGdZbUQtIvqLEXgjvghIkUS2Rh+H7V6bvpxaxoHC51THh5JYy1ujObbNSB2ELB
	klPK2yRtgGKgZ4RlXr5ZsrfiBGAv7KQ/n/n5m5+e35lSzfyR4s1ppVTDPbT0qPUM
	lmYb31xsHc4V8l+/0/EmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793593168; x=1793679568; bh=B
	h9QfzeZ10Qrmrf6uozr1PmDqI93BYwGPqTYWxFYzcA=; b=ljoW/IZFHpFv/NMdx
	G8mGy2CvldLvpmoliyWKgKJed23S3aieSWYAFg2Z9diUHc2sb3j7rQ/gBh2thzDs
	GFICKIbMjrV6shx9q5XdbvOSWnCg7IBvOSCJBi6wh72tGvsP3SMkAWdbDW1ommd+
	O1240Up9b+wOZj2fycOQQZX58wxNuKb0X0TqdOa+HWwGCtdW1i+ZezWlc9RuSAeo
	EdORkeKi2cGLLii1j70897aeMgGhhQ32CBKHz9O7GCkZLfDU/LaLynkbfxJ3nYUu
	FT6Yj1nqXwVV7pEcNf4mCTBuwhHg0E0rZqiEbMqvGiFEJXJ8Gwb2AaJJQeqhUase
	x1law==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793593168; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:H0Kr1HC3yD1raKue15U8t+bNFogH0R7TGW6hSvRrNFJdnMe
	ST9Wd4dMYve/8xHM/s1SxQK5x5D6T4nHAUwq/dfvGUoMU+cE2xwSvCEKt6IwFMDs
	9UHxDN8DDl8sUplYc7IQ/KuxT3rIXNO5FWkzquNOmjC7bVgftCbxCyz6JjhdEgb6
	hzWKhTqWhceqzA359SW1dxo5+iSUHZ6bmJmlEsn5aDQ1B09DJbjzLRnYC/ZAtCBp
	P5MFf7ZTuDWbMK8VXDa5BUqzsShks51ySlfWJkLK8/PUW0W0HExP4h9TquGtoMO0
	/0xhMeUZSk60o4sBJXA/rU0Sw1meP8LaL2iQZ/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2iuM7HUaMEOlTh8QKWEB6c2zpAgdb8VKwgOi0GqiXzo=:s4bjoA+ZAtkoUg7Ql/S8GacbmDDuMwNjtglU0rb2Ipk=;
X-ME-Sender: <xms:UA_oajQo3W6K3lNbAonDCiD7utQfyoqADiuxRl9VWQYgyFgoeViauw>
    <xme:UA_oaisfEza9ssJKu1pZMQbxzVmRnG-7DBl8Uv_4Fl97gueuYIzvfs36UjHrj2Ph2
    yylfMy_6y0fiLzhE3cm6CZvE0d83mU6tT84hNfaKLdvHL6VF0cNJ-Rh>
X-ME-Received: <xmr:UA_oagZljyM0Qs3c0DuNrd8xGxRtd-JneAT2p7itD5QrGTDVq8LqkIUY5sex8Fg4KZPQGASBeJC-w8-MkNQiEunxC8vpsteiZEqJCYYA7H8l_g>
X-ME-Proxy-Cause: dmFkZTFU0NiqFTXqPMMSCzMM6f+nBtXXI+chNaobF8s2hIaf7/NPfP9MNEVnZg2HS79okE
    5YzMGdqNMu69CghB1MVoAcO0wSc3CJWGc6TosK7KjPndwv5nz6cddqBEF/TtVQS9LKaK6H
    BXiHKMUMW0XtiMYzrGXUqLC/JcbwXB9TXKRjKgnjE1s3eSYV/cuyoTM5mxSZsMlrfMytub
    XrPHRSVQR2UG+dsmq9LQpua2S5aTZiu1T16GHRRl/HLAxP7NMctEZoUEuq5/7SWLKsp0Lf
    Nwlu1weChlm3TYes1a7ba8J29Xc4Ihg7vdqJbmNoN58A3Ua8Rq4RZwI6JARtzQyoBB1peP
    WjWq1ecgUpmUyoyZdI8YlJXW7z2yxxOnmX2B6Hrrt/+WAMZwPFwV8WilVfwTp7MJGlPlC3
    PrDXYRvKDYdG2p9/9VeqllsWrbj/hSRbuqaH5bptsrWho0+vDzkXu3wnBdF+yc70uYqpm9
    e/fJvLXZZoxcbv2vl/Y5SIkgpkz0yVTT3lljoTs3MdEnu1Z+AeA5onMBXtz4+S1SZI3XaU
    eURLl3/Y3bt0xnljr2id6Wh2DYrFa2vDRO5FYQXoxbZKBp9IMRDJ7gRwAYbmUkyW8qoR+j
    SPU+XPCmZ8u0Zirx4/eeynHMg4wK/6skzdwQBmNiRPCiGr6FmAegexf75ilQ
X-ME-Proxy: <xmx:UA_oavtS8etY5YNsQ4rHoWjXlQPoMUCTUdoZ8-Wtio1V2bbdPKKS_w>
    <xmx:UA_oaqGJRkt1EIL-fBNJ1YQEiQKFKLp_ZreFarWe-i5TEg8QxRSqQA>
    <xmx:UA_oaiw37ZzUMaZxGm-7_Z0JaNoc6egFtk3hpkOMsYY5eh-hCMC_kQ>
    <xmx:UA_oahgOoCkaFDc8YkBzlrCDUqe3eoCEWU0zyxwROoRL4GYdclhGPA>
    <xmx:UA_oanHxe9vLP-nINEtYSnwuIH29elA2C4ayaj0D4SAjfEtxeWMwbGbI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:19:27 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] firewire: cdev: use cleanup function for outbound transaction event allocation
Date: Mon,  2 Nov 2026 13:19:11 +0900
Message-ID: <20261102041913.1187814-8-o-takashi@sakamocchi.jp>
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

Use a cleanup function to simplify error handling when allocating an
outbound transaction event.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index da1c761f8b73..f94b22a608e9 100644
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

