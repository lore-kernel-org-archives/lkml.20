Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458820;
	b=kPyyGpCsKD/3EBr0QUIoAQroJkTqt3ULzcpk4AjxkRKN7/3uQxBr1RjUqzE4nvQ5bLLw
	 t2DUeN7Vj2EpQQFEJA67lHljMonYcdGJqz7xdiaFbUCg4FMoX4kw+AThkwG5tIU8ftzAR
	 CuxPQDVfYj/dU4GLDxyVIsZh249NJHO6kDgl6qlwBTtdsb2eoTAzxsFZMXjmU6nUQDGqO
	 cEC192mmRgIva3QpFDE8mwePgA4fsqxKaNCpnBRowQjSbMVoanzi6i2zy8tII0nYuVzyl
	 5HozTMBr3A3HLw2arsQEF6atiAEVwwGVfbX3MVpyFQAcI5TrawfksEv0iFiLwhXhBSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YDdtkgR2Ax+qh2egno5L47oBgsLaxQbHxm84SkQprk4=;
	b=w8IPa7A2VZFDPW9YbHwL1G7//qXC6kt/Jyikqr1U9cIhAot68CGVJWhklexaEazIqQkO
	 MHjGnguttH8+QQf3TujTd6ZVXOCYfjxQ459FOhFedrZdqxWrGbj8JG+oeBcIwvoquRMTL
	 oWZCvU9CfZ82kg53+1j5y5Vu0kf+DZWI4mBXYeJWJlOQoZ/fmrZp9CM3Js+qEYxUZ41uC
	 U7vNvDb+roA/WursBEBhyUavqu3AzPRS49brkebZomatmmwJEnFNLceSecG4jsS3j5EZZ
	 KetwydWnBK63Xt/E4I7DguCTj4v/+/pqwF9g1XuJVpppjfzwtvpeEgU0AiM8wf8mbLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb0DaDcZ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C77606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C77606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb0DaDcZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37000e7234bso3422913eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458819; x=1795063619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDdtkgR2Ax+qh2egno5L47oBgsLaxQbHxm84SkQprk4=;
        b=pb0DaDcZJk+p6Dxdcd1n034vA+QRxcVhwHL4pTtzynAWvP+KDwvToMa/bBqjQtqQku
         40Y8J62Vmq4jeRJWPb94rV68eG0HnBUvvoabVgI9+bpTHtsAhqHH5Jt7rmrxPKjvafwE
         sblwNifsjJP5cXh+QhbKMgOIAbZL/yubn6FU04nHomAGAJmsBXsvy0MDApeuRqYVcY/B
         aFHRssUaXUvcZHUhobV851pp3FTNNRixrawu0eDIwkwe3eSMQD/9Mzgl4DsjpQUuw27O
         0ToYvvYiVqybXDbwVhiw9EVXIduN7gPgkzMnM0OyqzHmOHk3W/bYE3gMrnLGsDmmskrf
         BZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458819; x=1795063619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDdtkgR2Ax+qh2egno5L47oBgsLaxQbHxm84SkQprk4=;
        b=mIwuOZ2ORHH0U3lR/s6uWxHARROtLUV8zao23zBiAJfIteBEJ3T7+3++zFysHKZyhM
         CmPikt04xlQz6YO3LRWlNwoLnMtffNSefwkLfCMPsyAl3T+dJhF4Obd6pAY9vR0z8ptT
         DeAZB59Nol2LqNpJFGfv0xjHd0IkGZd1K093W4dSd5rMqEl2R2LAmzdwcLqQQDEofxeu
         gjP9GySMv24OWNJF9jq6sS0/ovuigAwNAeVfZC1+f9vMWHvw5PMqh7owIQp8Gooz8Dsh
         DxZj0Y+I1ZGnbETZr880eT6eJyXCQ7/VP7EVhOO2RdtNqixeKFIt1m3n2P7MSiX71iRT
         ceZg==
X-Forwarded-Encrypted: i=1; AL+hErH0b371J7nTG6bZXJDxKugOfKIl+dKqKPUv7ZuUudBgQ+iAiYDR1LzRqtwBn/+PzQez2G11LUxMVBWavbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PkpI4qZ+fd5XXCEWfnUjkQxYmiWDZmcLt4VXJlR7rvM7U3YPP
	aguVuJ8WOI536xEIv8jUaPQjZQ9zd+Emn2riMLcB3zpdLlGWN/wJiLUxuS7+N/H6U6KrLfUq
X-Gm-Gg: AYBFou2yDLeP22uNSZgrFeMBCHtISItgoubShDuIsO3L7fL0QqBd/kljrEaKBdDhKPD
	GxzQpLa1k0ASmFxyNkqSjXM7R4SQ24om5+EBNq7tVfXGuhrHkAcNqLz8gTYathgbWY8jmFTLp2h
	DDP21s1a3WMGsrrC+3yenZFhxSK3hgx2ztLApCzbaotsz0eGduzkPpwQr6dSdfwCzIGYhy6NhJP
	mQB8cJll3xX++7/7NLaj66Z28Z9sYEVZcYfBCTmCgl3WeA2cwi7khtP0NNfFZH2/r2/xdhehzJl
	nmQ0KRItKw92Rssxqkg+rwyJiIhYP12AldBGy3IrXKlUQmlzL/kz//KdUNbWpsHHw9PeUcaHPfx
	/or2WpAUWU2+tmZN70HUhvKeHerKsHtDCGyJU5X2hZoJPV0EABxHmHiGA+4XqkC1RfrGCtlPDtc
	cSQwOb8rZ0qEYJiR4gs6dc+amBdnV6G2Wop+8KMCTCldOiQVRxtZV9dQ8dg5nC6Vuc+9lLEUY/k
	PNTXwTqh5cE0BMwiN6QAKXVT82enWr4bhafj+oqEfj/5piBq6CYKNtTq6m2Wq6YQz7Ioi4Fyu8/
	YOjI+lKtXnrH7NqwngZcShfc1Eb9qP+e9Z4Sl7WdEqbooX8RZaC+YNNKHDXW01febp7lMVrRVxh
	skE2VZqvCVd+VY0DHrnlTZMkS
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b3c02f06bdmr3875092c88.9.1794458819457;
        Wed, 11 Nov 2026 20:46:59 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm21024827c88.12.2026.11.11.20.46.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:46:59 -0800 (PST)
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
Subject: [PATCH v5 1/8] ksmbd: verify the signature of session binding requests
Date: Thu, 12 Nov 2026 11:46:38 +0700
Message-ID: <20261112044645.4074-2-mike.michalo@gmail.com>
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

When multichannel is enabled, smb2_sess_setup() accepts a binding
request on a new connection once it finds the session and sees
SMB2_FLAGS_SIGNED, but never checks the signature: SESSION_SETUP is
exempt from the generic check in __process_request(), because
work->sess is not set for it. The request then goes through
authentication, and the response is signed with the session's signing
key, since the request claims to be signed.

So anyone who knows a SessionId and ClientGUID can open a connection
and have the server sign STATUS_MORE_PROCESSING_REQUIRED responses with
another client's session key, each with a fresh NTLM challenge and at a
MessageId of their choice: a signing oracle.

MS-SMB2 3.3.5.2.4 requires the server to verify a binding request with
Session.SigningKey and to fail it with STATUS_ACCESS_DENIED if that
fails. It does so while receiving the message, before the checks of
3.3.5.5, so do it right after the check that the request is signed. The
failure response is not signed, because work->sess is only set once the
request has been accepted.

smb2_check_sign_req() and smb3_check_sign_req() zero the Signature
field in place to compute the MAC. Restore it in both before they
return, as generate_preauth_hash() later hashes the request as received
into the channel's SMB 3.1.1 preauth integrity hash.

A session that is still being set up has no signing key yet: the key is
all zeroes until authentication completes. Refuse a binding request for
it before verifying, in both binding branches, with the
STATUS_REQUEST_NOT_ACCEPTED that 3.3.5.5 gives for such a session
(3.3.5.2.4 would answer STATUS_NOT_SUPPORTED, as the key is NULL), so
that a request is never verified against a missing key. Set
SMB2_SESSION_VALID with smp_store_release() and read the state with
smp_load_acquire(), so that a session seen as valid has its key.

The other binding branch, which rejects a binding request that is not a
valid multichannel bind, verifies the signature as well. A missing
negation on the multichannel flag made that branch unreachable for an
SMB 3.x request when multichannel is disabled: such a request fell
through to the reauthentication path instead and was answered with an
unsigned STATUS_USER_SESSION_DELETED. Correct the condition so the
request is verified and rejected there.

That branch signs its refusal of a verified request with the session's
key. An SMB 3.x connection binding to an SMB 2.x session now gets there
too, and the connection's own handler would sign with the SMB 3.x
signing key, which such a session does not have. Sign that response
with smb2_set_sign_rsp(), as is already done the other way round.

An AI assistant was used to draft the patch and as an independent
reviewer.

Reported-by: Ian Bridges <icb@fastmail.org>
Closes: https://lore.kernel.org/all/20261103171742.18816-1-icb@fastmail.org/
Fixes: f5a544e3bab7 ("ksmbd: add support for SMB3 multichannel")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c  |  9 ++++++
 fs/smb/server/smb2pdu.c | 69 ++++++++++++++++++++++++++++++++---------
 2 files changed, 63 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 064f99427ca6f..51aa981bcef4e 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -322,10 +322,19 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 		if (work->sess &&
 		    (work->sess->sign || smb3_11_final_sess_setup_resp(work) ||
 		     conn->ops->is_sign_req(work, command))) {
+			/*
+			 * A refused binding request is answered with the key
+			 * of the session, which can be of another dialect
+			 * family than this connection.
+			 */
 			if (command == SMB2_SESSION_SETUP_HE &&
 			    work->sess->dialect >= SMB30_PROT_ID &&
 			    conn->dialect < SMB30_PROT_ID)
 				smb3_set_sign_rsp(work);
+			else if (command == SMB2_SESSION_SETUP_HE &&
+				 work->sess->dialect < SMB30_PROT_ID &&
+				 conn->dialect >= SMB30_PROT_ID)
+				smb2_set_sign_rsp(work);
 			else
 				conn->ops->set_sign_rsp(work);
 		}
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b084cca8813cc..3d9b966235dbb 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2558,6 +2558,23 @@ static int krb5_authenticate(struct ksmbd_work *work,
 }
 #endif
 
+/*
+ * A binding request must be signed with the signing key of the session it
+ * binds to (MS-SMB2 3.3.5.2.4). Check it before the request is processed
+ * and before any response is signed with that key.
+ */
+static bool smb2_check_binding_sign_req(struct ksmbd_work *work,
+					struct ksmbd_session *sess)
+{
+	struct ksmbd_session *prev_sess = work->sess;
+	int ret;
+
+	work->sess = sess;
+	ret = smb3_check_sign_req(work);
+	work->sess = prev_sess;
+	return ret;
+}
+
 int smb2_sess_setup(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
@@ -2635,22 +2652,33 @@ int smb2_sess_setup(struct ksmbd_work *work)
 				goto out_err;
 		}
 
+		/*
+		 * A session that is still being set up has no signing key
+		 * yet, so there is nothing to verify a binding request with.
+		 * Pairs with smp_store_release() in smb2_sess_setup().
+		 */
+		if (smp_load_acquire(&sess->state) == SMB2_SESSION_IN_PROGRESS) {
+			rc = -EACCES;
+			goto out_err;
+		}
+
 		if (!(req->hdr.Flags & SMB2_FLAGS_SIGNED)) {
 			rc = -EINVAL;
 			goto out_err;
 		}
 
+		/* As part of receiving the request (MS-SMB2 3.3.5.2.4) */
+		if (!smb2_check_binding_sign_req(work, sess)) {
+			rc = -EKEYREJECTED;
+			goto out_err;
+		}
+
 		if (memcmp(conn->ClientGUID, sess->ClientGUID,
 			    SMB2_CLIENT_GUID_SIZE)) {
 			rc = -ENOENT;
 			goto out_err;
 		}
 
-		if (sess->state == SMB2_SESSION_IN_PROGRESS) {
-			rc = -EACCES;
-			goto out_err;
-		}
-
 		if (sess->state == SMB2_SESSION_EXPIRED) {
 			rc = -EFAULT;
 			goto out_err;
@@ -2675,21 +2703,23 @@ int smb2_sess_setup(struct ksmbd_work *work)
 
 		conn->binding = true;
 	} else if ((conn->dialect < SMB30_PROT_ID ||
-		    server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL) &&
+		    !(server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL)) &&
 		   (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING)) {
 		sess = ksmbd_session_lookup_slowpath(le64_to_cpu(req->hdr.SessionId));
 		if (sess) {
-			int sign_ret;
+			int sign_ret = 0;
 
 			work->sess = sess;
 			installed = true;
-			if (sess->dialect >= SMB30_PROT_ID)
-				sign_ret = smb3_check_sign_req(work);
-			else
-				sign_ret = smb2_check_sign_req(work);
-			if (sess->state != SMB2_SESSION_VALID ||
-			    !(req->hdr.Flags & SMB2_FLAGS_SIGNED) ||
-			    !sign_ret) {
+			/* Only a valid session has a signing key to check with */
+			if (smp_load_acquire(&sess->state) == SMB2_SESSION_VALID &&
+			    (req->hdr.Flags & SMB2_FLAGS_SIGNED)) {
+				if (sess->dialect >= SMB30_PROT_ID)
+					sign_ret = smb3_check_sign_req(work);
+				else
+					sign_ret = smb2_check_sign_req(work);
+			}
+			if (!sign_ret) {
 				ksmbd_user_session_put(sess);
 				work->sess = NULL;
 				sess = NULL;
@@ -2928,7 +2958,12 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			destroy_previous_session(conn, sess->user, previous_session_id);
 		if (!ksmbd_conn_need_reconnect(conn)) {
 			ksmbd_conn_set_good(conn);
-			sess->state = SMB2_SESSION_VALID;
+			/*
+			 * The session's keys are generated by now. Pairs with
+			 * smp_load_acquire() where a binding request is
+			 * verified with them.
+			 */
+			smp_store_release(&sess->state, SMB2_SESSION_VALID);
 		}
 	}
 
@@ -12853,6 +12888,8 @@ int smb2_check_sign_req(struct ksmbd_work *work)
 
 	ksmbd_sign_smb2_pdu(work->conn, work->sess->sess_key, iov, 1,
 			    signature);
+	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
+	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
@@ -12972,6 +13009,8 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	iov[0].iov_len = len;
 
 	ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature);
+	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
+	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
-- 
2.43.0

