Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329961;
	b=Q8jWEo2qtYGHJEzsBsgIAKpxlvTBLU6jI1HGwFr2B+rSPtH+oJS7kJ6heHcwIhBga2mO
	 eAklEkyPjCYY6FuVfeIN95Sr9zN49vJMLSbobIjyku9zgOq8Z+HvJRtEaAygtsOS202//
	 5laKwSlWMoBlo1ES68b0jUW96ILFvO0Ae11HjaqUfK0Z7V3vNUCcMLKDT0NUeTTQyuSw9
	 eUCiNdIjtA5k9ZGSw5kfcRNZp9UUVznzakXfd5WfZRhpH5f3F532m9ja82KiqpQnvzZTK
	 KiqJJB8MpHjKgkiPhSh5SRLoQkL5F33c2Yys/7HiTxip5G4sTo2WZjFmZf5RM+hukWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UZ/ExlSldP4/rbOita3JeRaRAyJwH7hKfGTv9i0JcTE=;
	b=UiQbQDLMolRMogcLH11m2CIObgwcxVEC6g5MJnAJ9p6jB9FixRXtH1D0YgKNUbjprpou
	 pSdrD5kfUk4Hkq5/ROkxaTHqH4zR1Rh4tSS1DSRNJvnGW2dcA2bwvEmIySq0BvKauy2YO
	 ghEmeFAI5MsrDbHsH0Fq6VLTESK/0Ji/88RNZUzgK586BbehTkI8eUhM/GBGXnPhwT3en
	 gpQDk7aQR0KeiC029oOOrj9v2EgkEBegcnB3pkEJsmNmFdtXynBfdVY4IB63G6Au5Gnwp
	 W0LNw3dqFYT+t2Zg7zWviRXitqL9+nghkFgaQMOfFnMsheU1gbCh+LhVoXAUdJs2fzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxf7Nh1Z;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F72606A800
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F72606A800
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxf7Nh1Z
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1266404b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329960; x=1794934760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZ/ExlSldP4/rbOita3JeRaRAyJwH7hKfGTv9i0JcTE=;
        b=vxf7Nh1Z24RTvN9FwqKW0jSRILebSLzBbZ6KAEGfd4PmUlkxFBJQCuTnRzp3AXm1Et
         zRHX1slxIq9ysn3jLVyshOndV81B+Qke4y7juBfkv+yZaxJNzuA1OgjyzBuquphAZ2Ro
         nHBMzoVVKK8t3RxnDVfg3eCLakSu9oSJx+yuJV2yOO9twhiCFsEcZZEV+iKJMvf0e07g
         WG45Wb7K3rE3/pIwExDayq4UG3SyzIErBCelC/GQA5z+Z7X2vK4SrGUWG35bsIlzA8Zt
         OveDWV47W/Lr/2az7oRvmoUJGjcA6GpBm7iuphnQp2rTtQDOnteaJFXdepdYrZCmdRr8
         wVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329960; x=1794934760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZ/ExlSldP4/rbOita3JeRaRAyJwH7hKfGTv9i0JcTE=;
        b=vV5lKGu7x5sqtlztBStlB3s4oJoRMOzzivVjC1OI6eD/89a2gdg3mCVTfiS9sZZW4K
         aa6ZCWJKBPQfNMqLmYWzJY26ghLEjov733t7mJQpPrpaiI5KyZFNAxsF/CaGDTR79ffp
         2T2oj9FCfId0p5JWOugCvKjZksBiAMPzB0UhOPzL5iRtxfxD334kJy7wKO5GjJWaRBGa
         ROGgMYZi+G0DurZOk/V5nq2PZEMSxZkXocF8dbH47jxqcvyMMDFS/iJ2bJYOGmhvqSdh
         9rm8InJbsKtJJ+pZQzG9oTg8DK+lI+e5HtvLhG92mtnGcLERSlr3oReOTjSomXrI9QIn
         vZ5g==
X-Forwarded-Encrypted: i=1; AL+hErHybgkJq3MaSmhklbHykAaX0ECIA3OFdFtnjOZo2cyOoHAZJ4CnRkZWBJDdzDy3hzJm2z9tIdfOI0M8H+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9henJhl57fkKByapuDkHK89LXDS817nRHJgwiAd/8UWHp46xEn
	r1BP3BOf7sziUkaAOl1FSZZeuGcw22FQmpVcKdv0SvTAu/P9uKgB66+9
X-Gm-Gg: AYBFou0YcNDQG+s5ID3jl6XSa7BXh2VXRZbrC3DYMkmg7SuLBnNSMUkQ/H/cDAENCUr
	PvNL1r6IIaQl86w8nAeLJYA5xfd3mJlkr89U5vKIlC/pR/OGzbSEHkG3hmlGSy9prEuCR7XwfrE
	DVWrqObgCwmVfYEOcvKPHZ8Q3UDqKstTcpGyFUPemocHzWGDQLopn+p3jVnkhqJsdz7o6l3+ekO
	YLnN7ZhwPbWL3pLzxgnWUAhB7q9MdizovbVB6YnxTfPuw2sJJLGWt64sjlFREcxpJjYHS45YXB0
	tnl29njErGNDZ3kScM/WZRHO+5Ykio4s3qQsMR15yxgXTXRGerdgW93UZIj3tIM9ksX2EMUJXgb
	sFPQ7M1BG62U8cVXiQX/asfx70gAOWOiRTQOLtNoj5rtGoMN/HEjuX4Tu8F9SrfHA/4niWc5eeI
	ziiWBHQ9nwo2rQkrKxa4rlGr40/San8YnqcKXwPsmMEwAwXe/NUPW0QW2tX52Mf+rt4dxXCzzVG
	0MP0k6javII6MOoJovrLSdX4K0c8Fl67toldsxTNN9hA6dUIDD3tnzWFL8pxwNIqGC4Mo7QyN4X
	TebFLeSJCLaha0ThuTrxf9KCiid4sJcii2gb3oldSEINiDrIdPvcM6JTk4fucYz1ckZAGphnShT
	uPfpvjIoY/s5R5CP2ak/d3HUowBplPpLY/BHnweWfeJMaK5kDPo8PMPQ=
X-Received: by 2002:a05:6a00:430e:b0:8b9:227b:bfc with SMTP id d2e1a72fcca58-8ba9474056bmr2246885b3a.1.1794329960411;
        Tue, 10 Nov 2026 08:59:20 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fd5c6sm1157154b3a.46.2026.11.10.08.59.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:59:19 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
	stfrench@microsoft.com
Cc: icb@fastmail.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	ematsumiya@suse.de,
	lsahlber@redhat.com,
	hyc.lee@gmail.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 6/6] ksmbd: consume the sequence number of a request on a failed session
Date: Tue, 10 Nov 2026 23:58:34 +0700
Message-ID: <20261110165834.28162-7-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110165834.28162-1-mike.michalo@gmail.com>
References: <20261110165834.28162-1-mike.michalo@gmail.com>
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

__handle_ksmbd_work() calls check_user_session() before
__process_request(). When the session is unknown, invalid or expired, it
sets the error status and jumps straight to send, skipping
__process_request() and therefore ksmbd_verify_smb_message(), which is
where smb2_check_sequence_number() consumes the request's MessageId from
the command sequence window and refuses a replay.

Only a signed request on an expired session had its MessageId checked,
by ksmbd_sign_expired_rsp(). Any other failed-session request (unsigned,
encrypted, or on an unknown or invalid session) left its MessageId
unconsumed: conn->seq_low then stays pinned at it while conn->seq_high
advances as credits are granted, until the window of
KSMBD_CMD_SEQ_WINDOW ids is full and the connection stalls. A replayed
MessageId on such a session is not refused either.

Verify the message once at the start of the failed-session path, as
__process_request() would have, and drop the now redundant check from
ksmbd_sign_expired_rsp(); verifying twice would consume the MessageId
twice and refuse a genuine request.

The commands of a compound that follow the failed one are still neither
answered nor consumed, as after any error that ends a compound; that is
a separate problem.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: fd8c97d7c1cc ("ksmbd: implement the command sequence window")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 13341ff38aeeb..e3fe856a8258a 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -109,9 +109,10 @@ static inline int check_conn_state(struct ksmbd_work *work)
 
 /*
  * The keys of a session whose Kerberos ticket has expired are still valid,
- * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
- * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
- * signs a response to a request it did not sign.
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. The caller has already
+ * checked the MessageId (MS-SMB2 3.3.5.2.3); check the signature
+ * (3.3.5.2.4) too, so that the key never signs a response to a request it
+ * did not sign.
  */
 static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 {
@@ -125,9 +126,7 @@ static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 	if (work->next_smb2_rcv_hdr_off)
 		return;
 
-	if (ksmbd_verify_smb_message(work))
-		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
-	else if (!conn->ops->check_sign_req(work))
+	if (!conn->ops->check_sign_req(work))
 		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
 	else
 		conn->ops->set_sign_rsp(work);
@@ -277,6 +276,21 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 		if (conn->ops->check_user_session) {
 			rc = conn->ops->check_user_session(work);
 			if (rc < 0) {
+				/*
+				 * The error reply below skips
+				 * __process_request(), so check the message
+				 * and consume its sequence number here, as it
+				 * would. Otherwise a request on an unknown,
+				 * invalid or expired session leaves its
+				 * MessageId unconsumed, which pins the command
+				 * sequence window, and a replayed MessageId
+				 * is not refused.
+				 */
+				if (ksmbd_verify_smb_message(work)) {
+					conn->ops->set_rsp_status(work,
+						STATUS_INVALID_PARAMETER);
+					goto send;
+				}
 				if (rc == -EINVAL)
 					conn->ops->set_rsp_status(work,
 						STATUS_INVALID_PARAMETER);
-- 
2.43.0

