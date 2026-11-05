Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886815;
	b=oOddArDeJs8wYgnCTr/7fNJXEkHIwwCEljjPh7n+8xxLM+fnxPJO3lfdNkUo4KO4QU9f
	 5JtB9j4/uWZT5RLysR1GnPEUpmgeoFaEhVa0cu0bN409CBZrkYTK8CZcv1mHSeQ43Tq+I
	 ILAsR3rUZg5UimCluQKVgmKFl/Tz7H9YZ6kA3C72XYaNJBqMDHliI74diqOFDuNXmJ5Sr
	 z1ooHo0h+0PIaG+hgYylscRapfo31IEm6jN+FEV7RbU4IvEqUkp+Yp+UGVA30+qOu72z1
	 VPYQnAVzgxW0dvmCAu9gWx2tkhTRgW/cxbf5hqARAatD9T9QsXMYnHhCLyHsqqRTYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886815;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=pS3g/owqurA2ACDBJAEK/k3nZo7vGLX4OaAYjvkdCRI=;
	b=UYkF7wSLVJL3w3wevqsB2y9B3UEIkW3Y3EXKsNs97/5g7A9Ux4YAqD8JKY7tGK7ncpaQ
	 DbUkRr1xCZ28/yMMoEag4HbRCL5mu5of99vPQF+XprJgphA/U3gcplj4XjPn92uyHfKAd
	 Eno4p71P6yZ2qqLA9hkn1Ep/KtXoQkF0O4+eGFS4iO1rNcUCaZrrMV2uBmwhGTb0En8oM
	 93T0uaPlqSklWbzhEMvpQIAEgJrHtKQSNs+jRXPWuRVHoGuJrfxfUfz/qpbEt6kwxj35T
	 Tl7TCaxQhP9B5jmeEFpe5pJVM0LoijpCXHw/RzW9W0Htjal60tjh9ASfF1N+AGWSblg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0QRmC39;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E431606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E431606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0QRmC39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793886813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pS3g/owqurA2ACDBJAEK/k3nZo7vGLX4OaAYjvkdCRI=;
	b=a0QRmC39x3zu1ZybLQltI30IEnfCiFHB9lmjrhgS5CKSUV5j5YKG5RkZ8IZZ1KMNhEPg9J
	TMf+lufNtLlVEqQCa/kqPv7ZqyfEv24AJAqMlFvPkjPnAHZMIvZagdhwNpMPnVZi4IEeNu
	udKX+kG3Qj1vNBhI7n04jgUVWl4JrYY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-coITQdFjNhWKbyTMHzYTDw-1; Thu,
 05 Nov 2026 08:53:29 -0500
X-MC-Unique: coITQdFjNhWKbyTMHzYTDw-1
X-Mimecast-MFC-AGG-ID: coITQdFjNhWKbyTMHzYTDw_1793886807
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C6B21800581;
	Thu,  5 Nov 2026 13:53:27 +0000 (UTC)
Received: from queeg (unknown [10.43.135.229])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D738018001CA;
	Thu,  5 Nov 2026 13:53:24 +0000 (UTC)
From: Miroslav Lichvar <mlichvar@redhat.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] timekeeping: Initialize TAI offset to 37 seconds
Date: Thu,  5 Nov 2026 14:53:15 +0100
Message-ID: <20261105135316.2465369-1-mlichvar@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

With Resolution 5 of the 28th CGPM (continuous UTC becoming effective on
20 May 2027) [1] and no leap second announced for the last possible
date at the end of the year 2026 [2], no more leap seconds or other
leaps in UTC are expected for at least a few hundred years. The TAI-UTC
offset can be assumed now to be constant (37 seconds).

Set the offset in the timekeeping initialization to the expected value
to not require it to be set in user space via ADJ_TAI. It can still be
changed, and leap seconds can still be set, but nothing should be
expected to do that anymore. Existing applications are expected to
either set the offset to the same value, or not touch it at all if they
see it is not zero.

[1] https://www.bipm.org/en/cgpm-2026/resolution-5
[2] https://datacenter.iers.org/data/16/bulletinc-072.txt

Cc: Richard Cochran <richardcochran@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Miroslav Lichvar <mlichvar@redhat.com>
---
 kernel/time/timekeeping.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcf47f1ffdcf..e76e44b194da 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -34,6 +34,8 @@
 
 #define TK_UPDATE_ALL		(TK_CLEAR_NTP | TK_CLOCK_WAS_SET)
 
+#define TK_INITIAL_TAI_OFFSET	37
+
 enum timekeeping_adv_mode {
 	/* Update timekeeper when a tick has passed */
 	TK_ADV_TICK,
@@ -2091,6 +2093,8 @@ void __init timekeeping_init(void)
 
 	tk_set_wall_to_mono(tks, wall_to_mono);
 
+	__timekeeping_set_tai_offset(tks, TK_INITIAL_TAI_OFFSET);
+
 	/*
 	 * Use TK_UPDATE_ALL so the NTP layer picks up the clocksource's
 	 * cs_tick_adj via ntp_clear(). Clearing NTP here is otherwise
-- 
2.56.0

