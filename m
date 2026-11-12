Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509479;
	b=4EgIHSRUo0L1dZ5O4+cg2OKwXPPJ+UVuQzgdhudlrMygVdxOfsFN1X+0vtiWIDih4eur
	 p7OucXq2vqz0o0/jgwlSu06lO9KlrNvbbA9KpAn3WuUaAr8ETQgneFh++e1FpEiexzPQm
	 q9rXPnPUFaP1Kd8gIGQ3oFWnT2ebqj5EsKhIqCmGBguVj+CwAJYp4Knru9Kofn7WbRfjE
	 EvIhX/5gWa1uz6HPbcHBOvesJQpuykcs0SJhoD3kWe3GNaWORXIvLMooLJsbMLiEboLsG
	 JqBcDRyhUKBbgqdrg0vpvexGOXuqbwBEHMVfYaueh1jvLFRJG+jNErDz1TJvbW1ODTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HBLCGcqufQIhkN3sBdqHjkVXfZZ4ZTmimDtIq4+w0iU=;
	b=LtRzEOYAWLn0s5JhJPoJkDpkiJyZNnKhiH7ksPXBebGkKtEXLIhIjP0CpvIU6hNe7xCk
	 JXW+8/NFz+OEHUKO875eA2zwLB1V3+hsd3MWaWgXJ4X0SwAjFmu2SgbQTqcit4Ba+tI/H
	 qzWOk6JtqN6sozS6nNxaXHk9ZQKD3PxkFGJ/tfjMQBZ8SQWDsl0+LMpkByizJpMhkD6p6
	 srwxjdo2gux2/7hI0EPfxv0/3FXCcaOgi+/fIHokeVbGLZ5tnpqcJGxhK7g/te645o4Cs
	 NpSJmaQCN+QsePCN1gEznuztYrAjlRRk8E0djNAFPHcUUhuH7FD0Ht3233PQpdBCc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwY+5RzN;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5725606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5725606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwY+5RzN
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e942864693so1156515ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509478; x=1795114278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBLCGcqufQIhkN3sBdqHjkVXfZZ4ZTmimDtIq4+w0iU=;
        b=hwY+5RzNav+Xc5/KpFV9xLus3XSbeulNc1inwJafWYz6t1MVYNLqq9e/ngVg+8C2Ac
         /Gtrm5PvDOypykO+PIdnHhEQJQGEDU+8ZVs67b/Pdxfxd39qEu9wC19A0P0kgO5lwIl3
         Wquap4g8Yc1wS743xxxBAGvn2pMoU+hPOHECvFpzlmLpBaj69gEa0Khbf6vFCGGCJbpa
         Xe68BwnEsEP04T91N9PiOz/j/La6lJbfkCWd5DeVbtFY9MXir61abyt+LYkpgi6+KqbX
         g/IfldT/1zVA7VltJIkiiEKDvrlDfy8ZsSFzFzDgsD0vItBIFmsrJft0254rz4jbmdoJ
         BqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509478; x=1795114278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBLCGcqufQIhkN3sBdqHjkVXfZZ4ZTmimDtIq4+w0iU=;
        b=lk1qMGAchl2/qJTeMexsBHY11p21pcKbO29tqKLiNDKxDfuUftlBypqzFBzDW+u558
         zc1QAtrp1gd1Pr1aydWqukAyt+odb2smbmt9914TTFqkX0LgZU2nzDyVpYZ/rEKQwTX5
         iPpLVDQp7UGummYBUNHtX0lb5p241ex8C6KWSDgE1a/EsI05zTcnXC9eMo8Cdu/gcpYc
         LSLLIvFO+QAnDD6RJivR3ZzEv4+4DjtNUU4oY3qYo5rCp/ZTldpHJNI/o7zJsu/rSDX1
         n71Z5AwKoQjUseYRy00YknxRGBQXYlZqm72NiTd1mBrq05ProUpf7rjNy7gGeFcr3d8p
         0KBA==
X-Forwarded-Encrypted: i=1; AL+hErGJb5LpB27C9dLLHeSwFTw8sQxG+n40kWUYQJFCy1IbmH6S+EmCJeMEReqa5w2OWdZkk37pED3WK8jOrWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K4K5OhspxQIXVW3yTtyeCzwBhUtUZoSEzntIkUxkEQPCp1v/L
	TfyWvww9LLs6unt3NseD+TomVAWOqRfrsAKfLWzh3m0MtUVZAozpxHnN
X-Gm-Gg: AYBFou3bHY6BmoEpnWU/l3hscpe9lubRrLm/jEbRQPllMX7XgGlAUm82LBTaVh9sIi9
	GH+dY5TXORyzFsptXrhk6ilNGA7L2buBu1uXYDNoMAh676rZZm93kd1ZYxHpSWOjojjyUzPDUQC
	3r1od3irULYFc2LhvBUHWPo+AdwK9NLh7/5f3Q9SPaCnXTpjmESbkVBwdn82dTwHOKbyjIUV6Et
	P6vOeSjt7uXNtiDounGozcOWcNpk/hXQtTT9AIYW3A1iXWdIPKi9jtNiN3vPKdEd9vwccUal3iv
	WDnIxrVyy0VWBNRudAtOOfOjhMvwEGIvdD5Ifwlt72+8+zQs7exagHRTdwtFzAQ9vs24A70O+Ct
	uyVqVjkFcH0avb8zNVm+/BUW7c2AOboouRdvLuhedJiufPrnbS8rZLAqaQmkRKvnPlVf+UrqJVn
	TaKWnNrsYVO5gTE8GE7q9akBZ+X6AbojOq9i8Fx11swhJlPkbrGuE79kt5FimvpmO7TIb5DVoB7
	itorHZuHCFC56MC/o0jpeYrYMkyafdCtlodZlmQizJYpIdcsU0htalCEyz5lBM7xAAaCiKRHAuK
	gcNFR9pHurz9Kb3zrCu9ouCJsX1BPTHOpNCywI5LdcaeW3qnY2utyHwMDZS6Mu5rC61lyUx6PlX
	/WXGUDs5eYZUDUi7+Lpp4hD2tEw==
X-Received: by 2002:a17:902:f54e:b0:2ed:3f47:9696 with SMTP id d9443c01a7336-2ee0de14c65mr2745765ad.35.1794509478186;
        Thu, 12 Nov 2026 10:51:18 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:cbb:dbe2:bd9d:a035])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7cf7bbsm66205ad.29.2026.11.12.10.51.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 10:51:17 -0800 (PST)
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
Subject: [PATCH v7 5/8] ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
Date: Fri, 13 Nov 2026 01:50:41 +0700
Message-ID: <20261112185044.41571-6-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112185044.41571-1-mike.michalo@gmail.com>
References: <20261112185044.41571-1-mike.michalo@gmail.com>
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

When a session's Kerberos ticket has expired, smb2_check_user_session()
returns -EKEYEXPIRED and __handle_ksmbd_work() signs the
STATUS_NETWORK_SESSION_EXPIRED response if the request has
SMB2_FLAGS_SIGNED set. This happens before __process_request(), which
is where the MessageId and the request signature are checked. So the
response is signed with the session's key for a request whose
signature was never verified, at a MessageId that was never checked.

Anyone who can inject requests into the connection can then get
responses signed with that key at MessageIds of their choice: a
signing oracle. A Kerberos reauthentication keeps the session's keys, so
the effect lasts for the rest of the session.

MS-SMB2 checks the MessageId (3.3.5.2.3) and the signature (3.3.5.2.4)
before the session (3.3.5.2.9). Do the same: sign the response only if
the request passes both checks, and otherwise answer with an unsigned
STATUS_INVALID_PARAMETER or STATUS_ACCESS_DENIED, as
__process_request() does.

For a later command of a compound, the response that is current at this
point is still the previous one, so the old code re-signed that response
instead. Leave the expired response of such a command unsigned.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Reported-by: Ian Bridges <icb@fastmail.org>
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 51aa981bcef4e..ca0c78447f454 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -107,6 +107,32 @@ static inline int check_conn_state(struct ksmbd_work *work)
 	return 0;
 }
 
+/*
+ * The keys of a session whose Kerberos ticket has expired are still valid,
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
+ * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
+ * signs a response to a request it did not sign.
+ */
+static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
+{
+	struct ksmbd_conn *conn = work->conn;
+
+	/*
+	 * For a later command of a compound, the current response is still
+	 * the previous one here, so signing would corrupt that response.
+	 * Leave this one unsigned.
+	 */
+	if (work->next_smb2_rcv_hdr_off)
+		return;
+
+	if (ksmbd_verify_smb_message(work))
+		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
+	else if (!conn->ops->check_sign_req(work))
+		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
+	else
+		conn->ops->set_sign_rsp(work);
+}
+
 #define SERVER_HANDLER_CONTINUE		0
 #define SERVER_HANDLER_ABORT		1
 
@@ -265,7 +291,7 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 					rsp_hdr = ksmbd_resp_buf_curr(work);
 					if (rc == -EKEYEXPIRED && work->sess &&
 					    conn->ops->set_sign_rsp)
-						conn->ops->set_sign_rsp(work);
+						ksmbd_sign_expired_rsp(work);
 					else
 						rsp_hdr->Flags |= SMB2_FLAGS_SIGNED;
 				}
-- 
2.43.0

