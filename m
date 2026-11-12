Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458841;
	b=tQQvA2jl2dIYI3GjEcEuEWxPHLeD8FvTKJ4IQETP0uIyCZAJx6zFm2figOdO0hI+/n2R
	 fnr1cAc7bcx5woTKofL1F5K0B8xFJ0ssLuvUuKeFkKP/vFn5yUuRQMgk/4OIYypNqL2GC
	 FCnz3vOJ1Mk1EKuSf2oa6+iMhqrCRzBpGHBeNGzld8pmzyy/uNxI6jK7fnWZisVpVxRKO
	 LmXxh6bqv+ZGu/Ko7Gpo6+Vpi115Tbo4bgkTtmcVaPAY9RIJDUyHq1CfageQIKCnBI90Z
	 IMjQE6D12PiKr1yBw1o9ptFxWRGcY/O5Ansok33+kuOVpSqjA1Joh239IDGMD3btz3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HBLCGcqufQIhkN3sBdqHjkVXfZZ4ZTmimDtIq4+w0iU=;
	b=qWUoD0NXEmuh2CT2z1Z2WMRW7EqfyIdEN8UX4hkTgY1Z/qr7+7uxasyEWGWx4q20ZANC
	 N5gT/tm8rfxGJs/8M1rgr2DeAtBATucA+MOM/z3y8NSGlP+TgJcPVP2xwlasv1TKVEgaG
	 BZmA0+I1DdWArBuOJPxxQuRFJzSoXXNpws0OoTtg35sszGDMVNOz8VCaQlh7wXKbvMUxO
	 lXLM9aCE8OgVmyOdma5XLHli1qxULuCKk28fuigQhG6GP/MwwwLx54/EferG71rUGHTyJ
	 n27tyJGC6G5pFzHsWuDaLkoGGVAJSxHZ6NQfcDozdOmravaJBiDkZSdBRAHBy6i/xcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh+OLvCP;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC87606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC87606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh+OLvCP
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so5763830c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458840; x=1795063640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBLCGcqufQIhkN3sBdqHjkVXfZZ4ZTmimDtIq4+w0iU=;
        b=Xh+OLvCPlLgl4eFIfpTLOuY4nuytx/msPDTuB7c6Urj9vS1TSnm/0RxeGI0eGL+u+8
         xgQffiVkq39/OpendSdKiGdPUpReKeb+FIMFzlgw63KuxCqmZ2+NYYy4LOD0TW2dVMBW
         gqNW8LgvpOZYtG1EIAHfUEeWxvWqnvE+Y4KKQ09+Ql9+eBMxqB0O3V6gGqkRHIDMW2+C
         1Iyrb66AZIqjtJWd4vUsAhYk/p19yJIbMKmDLAdJv6uSsV3Z+7apwjZ4wzb9rgzNFqeL
         4mKxbdL+8oJxUp9mjLltQrhZDq0H1y3zM84Eu3OY6ebBVXDJ7Y7diy7um5Rr9TlY9Afx
         jLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458840; x=1795063640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBLCGcqufQIhkN3sBdqHjkVXfZZ4ZTmimDtIq4+w0iU=;
        b=guzZ8E4jg4Horuik5KWE5tPApuJ4l42VihhQnYI+3r82gDvkvqlzSxluIvAnKJFZ3G
         NydetsOQ3rGqi9mFYW/PixAH83JOVEVcdwbT4K9fBML3GLZcDr6FPfh2SAau62RKvdct
         WZP/Awg3Omrb/bIEZP9AL9ICxpa7ymB6RbtA6/UaLZ+G4G8YYm3HReWOZLTcI6YVkn6L
         ZwINTRyJ0bmRwTPrXW0YR0Ju15kzd0gnOeAQD3rm9xXY+5uNDrBnjfYQgL6tYu2oqAgJ
         uccGmIs3N/1FkTM20egVxhyR/GQqlUUi0ibHnOri+Cb/81Z51J/O/7SKrrhaEOkPWu9/
         SD4w==
X-Forwarded-Encrypted: i=1; AL+hErEeyKayPdG3fKvvxcffbtV3uZXyudqF/+qAp3f+76Kr1UOy7bROSiUj2FCxU753xZygN+Qzh1cykgMATpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y9+Fqjsihmp60DRyjZ22eB4nPV0Fsox2ojZ9gestw+KmP0vqs
	o4KTHXxdsnuFpWjxTMPBa5gFQZpHWYXVarXmgdTta2XKxKi8aS5XEfXj
X-Gm-Gg: AYBFou1zy0KfL/QGZnHKygj9BSyspNEAmRQHQzOdkjfVX6WCc4cYHg/LCRGNotZBM5G
	cZU+Gm98NP3YhaWdGI4px/aHH6oT7/n2PFkHXAZdT+Yo4gwSXUh/6jz+rv2pSe8Tn80ozy9s/y9
	4ey9E09x2obpg2A6kOlcJMGjs2tZcnRK2JnfpwzYEJygHKG1K6AiD8hqe5ZoHWCPdooo0Z0aRTu
	pHsCgYzJoHLpthENG+LenjyAeHxpR9yTmZcs4kCd/nULktWLwBHM/wgjq8kasy4v7tLegV6Ajwu
	b8ddQGwsJubtOxWDjorfjX+8NJqupmaKodi2mQxPHISR2TtjXIYfYfZ9zkbjCe4enDyNt0PZ8Ll
	ie1U8wgrUUJc4rVmsPMcIxmCtzqokIW6SFjinHKOH5ZlN4ROiTNi9JCaAPDeVWzdUCUSSLeODIB
	lsMt9adhxdstwMu2RP9BrfDjOXzSbE6HogsBuQ39ajFvepKndBy54DP2TcZKQci1K+er5WTVXNA
	NHNQRCJmcqE1imnnpI9uQuLCvIE1mc+5pTOVFfLeOqgJOx/ikFIGtWVsvN3BnmwiUu4ec/ga5O7
	8PQQb+RSp+EAfFRAAF6j9A8lSonG6xe7R/q0BpfR8hXboOZyGvTDNKAGGc38PYX43+ruMrz5oEJ
	ndf8i5aUo40ZydfffK0Ai+VZT
X-Received: by 2002:a05:7023:c082:b0:188:e51:e86a with SMTP id a92af1059eb24-1b3c023c45fmr3692481c88.2.1794458840206;
        Wed, 11 Nov 2026 20:47:20 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm21024827c88.12.2026.11.11.20.47.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:47:19 -0800 (PST)
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
Subject: [PATCH v5 5/8] ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
Date: Thu, 12 Nov 2026 11:46:42 +0700
Message-ID: <20261112044645.4074-6-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112044645.4074-1-mike.michalo@gmail.com>
References: <20261112044645.4074-1-mike.michalo@gmail.com>
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

