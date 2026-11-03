Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680190;
	b=2FLlDKD2UuCKfhqrQXzl1JKGvJA2ErxYyqOag55oVAzsYgr5LNMvibTK7BvhhWRck86d
	 5+z8qyZEzfh815RCF/uyqay7XnYhI1sh6y+VS2N9E4rRvyinxCguOFRONVtCKvAistwFv
	 d0ywdPaXmPMZ2TyxsRDR5SXTpoAqwSp/i//A07vWTVsvYRUK5AdjJAuBEUK1IIvFTroLl
	 1eWb6IGe3tws4tgwQkZona1lyEs9mbMFzGn5UlZiCLo5Ft9heYQhnog/wnV33gZp8N6ui
	 ETa63wMZ4WY2QoX6I6coRy7y5wAmfxlG/nwe5k3m3YTsbA+mJpoc6Ozy8JPmBNUf80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680190;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=3f8QLKaQyj8Ll8kKS0fMNNgJrDLiW79jCRYrLQxhugo=;
	b=CWCm2sorYE2AIT8ki4DIhFC/PU8JMixx8dxGiI/PSB5EdYi1QiaUsirR/rurKLftWdoz
	 DEyGdcfbhOPI/GVlYfsWp0EWdz0SiHGRcGFhTIs1Q1oG3nnc3w8RmjR5+YvOs95G8RohQ
	 S3e51uhtQkRJK0S9hqDsGRgnnB8+h/Le6ISSjiaBzwDDIs+fxsQ3xKtG2mTJQAoKamf4P
	 6x1MQiJauV16FFfk2WfZxTXTf1bBl5zq0WtDzwlf02i79Aqlc9qrbYfaR2VO3cdVjIZ8T
	 RkFmbdD2gZ0qsPZ73VEtpIGIXQfU0G25jwnH26f2Om9be6JpEhmXE/zirOBz6F94U2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=OoAAz9Vm;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D9633BLr;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112C606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9112C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=OoAAz9Vm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D9633BLr
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EAEAE7A018B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 02 Nov 2026 23:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680188; x=
	1793766588; bh=3f8QLKaQyj8Ll8kKS0fMNNgJrDLiW79jCRYrLQxhugo=; b=O
	oAAz9Vm3qXBcc6ALKG/QgBN1fR9t4x9x/0JPfOCADbUojE0aCiAND4yBwULlgPJn
	VhVh1+UIa7sL6aiszxhV2SutXmDq5H10JVpiQ2hRcHRMC0CV547wkxKsJOL7SaYL
	rSzBFx60aBqVSIz7JtrqSQeIhs/K9b/hq0UCUTy85QrC36OS+waDBtjxYRAp4fiI
	ofQOc2Pu3m20Q2+mWe24viUiY+mAV7DJFljYl0v5FydAqvaJYWO/heWllAX2wfmv
	NpOe5R43o1RyWPJGfhgQGgmj+UcuVgIFUKqFUwzNEtcQpOpG7TAkQzsBCQLTb2IF
	LepxuDiGnL+YE6qsLQ5iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680188; x=1793766588; bh=3
	f8QLKaQyj8Ll8kKS0fMNNgJrDLiW79jCRYrLQxhugo=; b=D9633BLrQfOn7pFDM
	c+6O/pu9SgclwugvJqS/4kEk5y1rypseQofYg/K+Q6gKHDrGE6NpzqYzB+TPhDUg
	tHq5GLbXOtgudG5L+qWbHOvd9uHyCfV55qRS8z0elyQfm8ftgyEbLvhfxjrv0fwW
	dGV6k9faUwlHyfP5NfdPM4ql8AfvHh4XGbrFNO5CYr+jU1VLrNGGIEnCeCotvywo
	Zd2eX2aFowVuR/Q1/e8HCWP+/xR+zR8PDLoZbyoIMDJMZYpGJ+qKJx+Zetq22M64
	fjUPA8pa97nOQpcB8jos0vRDZuUEsW9ZVEg9AuGfo5TnyLKltUL6B+7swN/MYsOG
	8SR2Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680188; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:wuJfR/xNtaxqAHEfNZrbsObMfC0IY63bK3duO+ZtC5EKvvF
	YbdVaM4agfSddWd62b9WA5bwTtUhghW3GjmkS/5yIs+pkNKNCFHAX8k5olEIXHBy
	SVcZPmN0eIA9A+4tCGpyJsUdre5N5sotkuniGYba4hmds4GJIRFp4t4Kwf12pEgp
	mTtym8iiFahaRROSApIEfWrv4llweYN5E9yJ/aKx+aGTczDdalXwphVft+BPpofD
	WNSU6/a7iURj5WML4OIrY5H9hip+NBA9uiU2pJ3YR5p42BCDtpeO8sTkRhRbez93
	5h8YLPIoLQehb07jTsCqLD8Cbwc6w18ZY6/al3A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6Wgir472CP4TTFYJEj+GAjgPnrR4V1+ZbuUkJRZPyG4=:XzaRzpOMzc8AH+mAJRlGhsSN0J5oUCSgUkO+msolWQ0=;
X-ME-Sender: <xms:PGPpanFRhW-6nc9N4U_IUVzqhJUrXTbQCdB3t2opWdxB-WBZw9j7Lg>
    <xme:PGPpaiR89XxySv7tlqJTgy2ZrS1RdpwT8DoFq_lXsGZj2gH5bt_zRpXIoDR0wCvtO
    7oF5XjFyZDLnyBuL5PYmqkx5qOeNlk-VbIjneaYtsCNgY4YdJLYze4>
X-ME-Received: <xmr:PGPpaguxBFXw2bi_zK8VTkU-v59a8NeHpOXJS-UgEdu52zp1uhiz9PtjHQ3u9vbkDQHYebiL3lHkbWJNKpjZpYHAtcGeR2zao7-VmhfMa-X9>
X-ME-Proxy-Cause: dmFkZTFW70MjVLWzZbbHLAwQl54RRy5yYW8ytyMsOVRlHTtvsFWtLwSy+C0GWMBc5uv7YC
    8nLvYKRLza+rEF+zC3+mV+Al1JHFpkZGypcOTMhRfR6RaWAjfNSujLusOZKhNhIfUsQ9TD
    JMBnBkXox2mIOygxg+vtmKWDEDcI9ck5vtxF7XLwSRslXyYBvd9YLOwEBBla1DF05GnG15
    Qh/Ycu7Nru32uqWqK3c8tiOrG/cjV9s3FR8k7y6YOQYM3dmo919DKaBdHOLNVxd5F1lFBw
    3VzSz85wcU8utGKIcvFD7/o5A0a7hcXWpTlj4cQdSYozydzGjhJirvXAQ9imqZRtSaCOFl
    ajKQM1S+zqk9MSTuKyNLX7AZ4DB68KYkl9rwM4rkV/Fwr2LqC3/zONQXkpolAob4O8gv42
    eaQBbBhpYXvVDIIgWgO4ppAgbIUQtSxHXXANqG/wo1geuw2rHUx6qZFUWAKsXMavnMqhtC
    FBc8I6G0S90k31KKRbRXERvkdFnu+GW3knGqRkkQFzd9EFjOmWv6hh4P3yTJtuWP8u6bY6
    FNC42g8CL6iiwVyf1IKJm6PEO8xwlIl9Pv4TlfT5r8AXNab+3wFu3CF6KbP25yZ53U67/d
    AXCKiflFlgS8zRygFf9L4pm30qVbZcKgL8UuD4mkEnNo+1SxUbDuX/L1p89g
X-ME-Proxy: <xmx:PGPpahwvy8eCWdB7QBxHAp482mJh0bORppQ0VVE0W4ivNBGV5uzHfg>
    <xmx:PGPpaq7pOi_J-LVU4nzP9gSmQ6h_J0AydLy4yVI8pdI_tuC70Gz1WQ>
    <xmx:PGPparXKQQyx6YWPFtpBIu5cLFIKV_GC0F8iIgRp6rwO66pew2Tv2A>
    <xmx:PGPpam31e10OIStyw8Tj3qzFP5vzQUcdTsyDtYWIwdbewV32zWI-1A>
    <xmx:PGPpalYM2KXe5Lws4OnGLWqO-vsnBpvKDboN0wHi0A5V9Zk8eRRtCsA7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:47 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] firewire: core: add context analysis annotation to queue_bus_reset_event()
Date: Tue,  3 Nov 2026 13:29:35 +0900
Message-ID: <20261103042939.1231773-5-o-takashi@sakamocchi.jp>
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

The caller of fill_bus_reset_event() must hold the client list mutex. This
requirement is also satisfied when the function is called from
queue_bus_reset_event() via fw_device_cdev_update(), but compiler-based
context analysis reports a warning because queue_bus_reset_event() lacks
the corresponding context annotation.

Add the annotation to queue_bus_reset_event().

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index ebce536ae89f..3236f74feba6 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -443,6 +443,7 @@ static void for_each_client(struct fw_device *device,
 }
 
 static void queue_bus_reset_event(struct client *client)
+__must_hold(&client->device->client_list_mutex)
 {
 	struct bus_reset_event *e;
 	struct client_resource *resource;
-- 
2.53.0

