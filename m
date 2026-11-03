Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680186;
	b=s0cywZmTKYFy1DXpWUlcwIUo/LJebEKCb+j2q6dQtSxSSxv1r2fQ5uXeugiNTqgVCPEe
	 DRy8lkjqfFNAX5bpCtNUTmr7TIKnSKAN20cQp+8Gi8A5DaaI1k2REV7DxoCoQbEHmcNjw
	 FEoznzkut2sdF4h6OzBDc+p4Tb0kGTX53L2VV3wg+wmh28cagXGrWEGkH04mE4UAoPdgI
	 ZB+KjbX74SEQ9wwBQ07FORX65UUMfo1b0MQtDXXiHZUtA2zQuNYwGFxmLkt3aONJqwAiR
	 nczh4x2Talp5zjPm8vNSbMIrF+UdVVcPF2eddSXR3jLsntU5ktQkMFdl4AohCtO+u7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680186;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Udo1UEnvEfjZ5TPt9lBRr52CPDmZ91ffUR7be1G9K5Y=;
	b=yIdIAqM9HVTeihA2/ByD76uBvTqY/SxnGG2yuXkGQA5eIFy4jd+I2unSpukLtbHKI8qb
	 vN0HIj+a7kGykD/qL7Bu/ph9q08cgs/K/lVpdbDPa/+yqyrBlnEc/a5BIaA+lgF/pt7La
	 BX2oo1837FpCZXvLVfG965rt9vRiQf+hhQtvIsQzW7IG34g2rWhZEbqy+Opyhvhxorra0
	 omcW6qTAWwYJjHrcSOapGrQP2yRJD4AYYm6eT+kyXma4VgYgIeVBln3FI/hkvMbJgmKhX
	 s7YHwVBiWNnLUTbKToKQPsdraV/iM6/5YoweT1I3H/16xvkunpCzgPprPMTBQLx8RUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=Z4n9lwCa;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="ThxTRL/A";
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A000606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A000606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=Z4n9lwCa;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ThxTRL/A
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id CCDE91D00190
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 02 Nov 2026 23:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680185; x=
	1793766585; bh=Udo1UEnvEfjZ5TPt9lBRr52CPDmZ91ffUR7be1G9K5Y=; b=Z
	4n9lwCaUV4xRitmPHKLvepHzt8ydo87fm55HTn7CQNHvv2TRZ8no1FK5UZrVZJ6J
	0lWb6H4wXNL0HuBCWSyVa600K0/YmvHps5O5e/hJvkidil7vANsCKzXtUjdH6gwq
	WWqGbZ5cTyC7y3gizZ/lWwRwsp8IlGpDZPdkFOMCJFLULECdIggcTGNG8jcHngkQ
	OTCpbtYImWgDqv5NCw/NY+Lt9XPPpytw+FWkbSN1mJolj3NyLGAw32SxnSJ4Qpj3
	qverZfr1Wy4lQ/m97B0OgjMroRL2YHMi6ZeR9drJKmImpFX0stTns9nzZ1+QKhLk
	dE46qCk5iGpoT2kIxfoRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680185; x=1793766585; bh=U
	do1UEnvEfjZ5TPt9lBRr52CPDmZ91ffUR7be1G9K5Y=; b=ThxTRL/Axi1Z9tJf3
	1IN+xZrRGgJjAgcn/aSjaKr/BUqRlz84NbW68yt+mL+29QankKM1LTqjwOd3W/AX
	0KgZN8lay8ar+58N9NMYdrpdFF8TDtFVswhUra+Qp/5PtIaWGCUyA8a8uK8dksUr
	zBCXTzO3Oqc6ah92QatUVODKMjVvjKMdQrfv5uEUqBrFANFi0n2qlLoJkNMCRoob
	kQkU6sqmSz2hxhkeELDNaQofLioWowtD99UdMVidIOGuw7yT4cW4atcpL8MLS3Uy
	qXtrgoHytyXIL8HUElJilz0qkpHcQvoQwv6gw0mWW/ayLrd/dBETnCXyMAKVkG2E
	t3SPw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680185; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:s02dsaDIRLzDswIQIzubLzx15LQtqiVMkfkSiE4YOqlVUHr
	GV5Szl3B7UbpDnT94ThY4jdhKINzGDa9d2qfHRLJN8vqU1cV+3VVXe8NfR2jUpn3
	D9eSIBWGPyPuGHSJJ94iJ9BSjAHmAue8O1PhLZ4lwUZ7mjRx04xAUEoWOoo2Y8al
	hsNaAXNmG2Hq7O6o6vMtWXcu+kyhvdkheEHjbUP/RTkSBQuG8i/lbuznBIhh7zCq
	mImvqu5qTZ+DeNsnCZIOu8x0D9XedB2FE+SieSi6UTsgSpITOwYxqOFNookEe6qg
	SM42049oPFV7l8pCmFLC6gDuJQPYlcIOpAMdP8A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uMDtfq+3PmRQ+ikVcGgMoB7gKUK+nE3GK1AoOa27ZMI=:nFYmiBIX8lZIq9kPQjKjxkOmFBhcL65WVAz1eyav8EQ=;
X-ME-Sender: <xms:OWPpahKBJkcB0idyYQKo_6YlLDlf6bgChSqNHFTYRRrfJEO2m_5rKQ>
    <xme:OWPparFpzaOly6XeKzh_iu6ZE6xHohmpQ6JN8jrIefRzB2PdIWz0u-soGV7PkxUPe
    b7DxTL5PuEM6CG9SzZPqLZNyOTLEMVZj7paB1hZbBpnmd34TjcO0QsB>
X-ME-Received: <xmr:OWPpahSEXSJNCo0SMkbTPt8NVI6Y0sCmbWoBX3knnrSEsDxdeKZ8x0BnGvKSLAAJerZxe65sf4ArhzRQue8Uw2wwueUoqIWug6ENar0lSgbt>
X-ME-Proxy-Cause: dmFkZTFW70MjVLWzZbbHLAwQl54RRy5yYW8ytyMsOVRlHTtvsFWtLwSy+C0GWMBc5uv7YC
    8nLvYKRLza+rEF+zC3+mV+Al1JHFpkZGypcOTMhRfR6RaWAjfNSujLusOZKhNhIfUsQ9TD
    JMBnBkXox2mIOygxg+vtmKWDEDcI9ck5vtxF7XLwSRslXyYBvd9YLOwEBBla1DF05GnG15
    Qh/Ycu7Nru32uqWqK3c8tiOrG/cjV9s3FR8k7y6YOQYM3dmo919DKaBdHOLNVxd5F1lFBw
    3VzSz85wcU8utGKIcvFD7/o5A0a7hcXWpTlj4cQdSYozydzGjhJirvXAQ9imqZRtSaCOBY
    +sUeM735GC/fwgXuzPIA8yI45423RHRcVpkwWfNsTvosejz/ZIKvCccoTxW4p5s6bQU2pF
    rhKCkMhCx0tE3YkGG4TwRSiGXXUsANo3WkMGKVINXyJgXRNmShZlu78Tjh+PtKp+dfs74X
    L0POaacYJsXTbTBUAhv47wPpiOW8uFsEl5MCJH1/fbkIgNCE0jPszTJsBojlGtU/g4G8rq
    3KU5dLIstvvdoefHKiZym4xKzadMoXANTtCmwwwDCjLlsFLL0nsIetaURb0gRsTi/6hkEK
    DJQl1uQSM6ZVcDvqTesCO4wiW8H4k4TydCoT3TCUEeItHGSwidZhimUUgMrw
X-ME-Proxy: <xmx:OWPpavEfg17Slc2hqMDHOE37vsvgoQD4kjSn1DVuzyq_pJaty1UKog>
    <xmx:OWPpal_SR1gv-zTDJjBQn3Fc0K6SR93PELfrdV6bnyAgc7og0CDFnQ>
    <xmx:OWPpahLk-yDdyjY8of6moZh3ryElHp_gcT9lu4GH1FnfMhagNIRBKA>
    <xmx:OWPpagZQPmurKtlOEfziUIoO5ykKNdS5eSuEvzlTnTjBfCEaL9K-JQ>
    <xmx:OWPpar_zhyl13WX_hew99KPHGf7AaYrOAykgg_sUmIm78vLKRGfQnPG9>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:44 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] firewire: cdev: add context analysis annotations for phy_receiver_list
Date: Tue,  3 Nov 2026 13:29:33 +0900
Message-ID: <20261103042939.1231773-3-o-takashi@sakamocchi.jp>
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

The phy receiver list is protected by a mutex.

Use guard annotations for both list and entry to describe the
synchronization requirements for accessing them.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 76606c37d212..396b2a722e0e 100644
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

