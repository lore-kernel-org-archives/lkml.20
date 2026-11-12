Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498131;
	b=085cDBs6AzHb7v6AJbYOzfoZP45evvjD9Lt2Qr8jRZk1dExCkz+VTKpd3cm3pGiV1EUe
	 iX3FQtDGCQQPECOmmA3YUgsp9YUFNsz84OByyoJqTmPO95WEJ+OdQiEQmDH5+D1HTX2iq
	 zUw+HRAXjB24dYCBHS/wtLHAU2FBIQKgycjZ/RNnDwaqnwMlEcxK283YhttftJ0f4xJ/v
	 yiaaDkfRuIx6yAwOFOriyHbIzwKxKdybgyGlMwDyr2BgSUrKjina5VMBNWHJOQT0yJjdI
	 Ow9Sbg4NCwZgf9s1O9gT8/FQUFS4h4IdTX+sn7FbrAGjHVv+8Lgk6GQt516Qc8vewbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MkF1tFvAQYdf3wIax3BOI2W5BGHe5PO8vgrcEhA+PdU=;
	b=Ce+ApixbNzS76X31kxSgALYcZKc8Bbch/rApgad22gn0B/U2lUS3OfpI6QCOqFYECueG
	 /Bq5PL0r0s04jm9StewhVRAdippH4d6ncQ6+aGBbVPRaBNGjrjTHfVfSnkX/qb8aCImAY
	 xRsqHv0KdSQyGKDcGyAu+NKE58pCRT8+ra+4SVI52QVex82hpLjEbnf6O7napYutsbN4K
	 x+352PDJhPSGqe0x5mY1SwajMffg+wJifPkhQ+U4diJmkvOCRW6EUvAP147EyLA341rFI
	 2OW3qyPzJDw4QiO1qmEvFiTeq7dBaeJ7teBIFwbmEuhZSxqr4lr/bC9xBWQXSRmTMHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vn8K1WaP;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF077606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF077606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vn8K1WaP
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2218083b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498130; x=1795102930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkF1tFvAQYdf3wIax3BOI2W5BGHe5PO8vgrcEhA+PdU=;
        b=Vn8K1WaPpp8FMAVgU+vZUMVwRFFUI4t755AoIKEgrCswUC3ZSP0UUJ/zPnib9IBQGC
         X9+N/KwEb42pnvU1ya1nRRfigI7khI+XunqZhvx0sGCHhGrWGtElHpCrtMRAfS7k6CA9
         daHhRxv3XCzSkLUKLLYbMPZ1HwV3XwHgD7PzxH6zshmG8CBQlMSe8VWWutqB9dcsccLM
         qt+FUCIxqMGbUIG7+vDjsD275Gsnn2Mryl1cBeeEaBTUtwOiTCNvxzbmr4lz9c0m00iP
         Nu3bLQQby7pnsW/aDFlY99cic/DL+Hys4U8GCT0IADOE1JUwqRlToENubpBgSz4jV7OH
         YNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498130; x=1795102930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkF1tFvAQYdf3wIax3BOI2W5BGHe5PO8vgrcEhA+PdU=;
        b=j5R3EHT+LXBNhhyEJQuFIdq7OU27PmZUil84zfs8ULYD2olKiEN1o3/srHvSYnxUPr
         KWFcTTZSLNEZhDp72uRkYOhKu4C2t0BqJ0NPro4SMAtA8Px4Gdj6/qhiBjxVlDUCDcNz
         u/Msk5wCPkNt4+ptzSCEEKTf4tRnXDiQ4tBqzqu2BvHt017oYrUh1pavJR8sA6nMRuWw
         G3OdWyM98ReH8fQrkQUOUOLiht5Me0ulMSk89EKXM6UmCwmdGqfMnIZ1+xz2q7AooFNh
         Z8XT1qHhhEmVQPEQAom2rh41NjlY9qfRLWmd491OcpSznzO0iyD8gsJSuTB7Z3N0hvaO
         tk3g==
X-Forwarded-Encrypted: i=1; AL+hErFcG8N9FuRucBpw+sqHLwQljq9DKZ57E+UBqyn6JFmWnqYqaG0WqxxfbAWtW6947ogWnE1wGsOclCuTOn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DawRDgtlfZJpR5Ap0rpX0Vhm64p3MyUVkrYMcosOYRaluqtB2
	sQmdgmhThwLhfcYTgyjj62JzjjGcCUFGpuanwrTMUf7n68ZcwHudpjuw5Wit5jw43cggCtbw
X-Gm-Gg: AYBFou19DZ2WVVvLeTGL5FsO/FRqo/ZVXUtu6E/l5OeUhIBwNDSp9qSjunSl6BSYUXu
	saezAmmEKjadh/qvKVFLecRDT6zP9k0F7yQsdQ7jl7Aq19xHhF+bwv1nZRlux/cJEFql4rhoZsY
	0QwhXI9iGwlV2wVCYK6oo7ir5IiNki1TmfnGKEBWnrLoQjFCzD+CN0TqDR5nn4OEdavrdp0VGz5
	2PVGnBllnk+/GIlY9JkAOwUgrXwmg0PBTNfBex0huXe5Y7A8+E54lfl4SBcD3vuRMRc1i5+anDQ
	bq7Ape3+MpHHmS1Ix4saXfJcGAxlXf5QPq9i9Wk2GmERknfjoJ/Qg67miSw77RXGlMYgywg6eod
	4CjF9LoNQfYaSNVR7nqr0/9ZgNhHccd5MoKZejbsCMO4oze7gnzJSZYUzU8PkDQUnjK6y/R4DrE
	T7DyBZhtWXQme6jQoh/HxcP9siia3lr4q9enFTsf9+9xSGPc35lF8HVL4oIUKP5SCukoX/fGQEP
	yRgjsKayjHLQmCrLc430H8vovuIuO323QSGdFR+QIG34/08Xq8lQ12B2b0ar0EVMoFmycabiapL
	TmVeZAVlXAjrcqE6IfNr05jmLsacA3D8Dsc6uDxuoWpQyV9hB5rMVVPBbGtFQ/ZfVuMAOLqpOgp
	eE2Ml/IPw8WGi8TIoNHPh+AD2lwA=
X-Received: by 2002:a05:6a21:7a91:b0:3eb:aeb4:2c39 with SMTP id adf61e73a8af0-3f2fcf9f94dmr5393663637.17.1794498129688;
        Thu, 12 Nov 2026 07:42:09 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:21c4:c32f:67c1:d87c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3619sm3790596b3a.5.2026.11.12.07.42.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 07:42:09 -0800 (PST)
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
Subject: [PATCH v6 1/8] ksmbd: verify the signature of session binding requests
Date: Thu, 12 Nov 2026 22:41:48 +0700
Message-ID: <20261112154155.20255-2-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112154155.20255-1-mike.michalo@gmail.com>
References: <20261112154155.20255-1-mike.michalo@gmail.com>
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

Read the state once for all the checks of the binding branch, so that
they agree. The signature check now sits between the check for a
session in setup and the one for an expired session, and a
reauthentication on another channel can move the session from expired
to in progress in between, so that neither check refused the request.

A guest or anonymous session has no real signing key either: ksmbd
derives it from an all-zero session key, so a binding request signed
with it proves nothing, and the other binding branch would sign its
refusal with it. Refuse a binding request for such a session before
verifying it, with the STATUS_NOT_SUPPORTED of 3.3.5.5, and do not
verify against its key in the other branch.

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
 fs/smb/server/server.c  |  9 ++++
 fs/smb/server/smb2pdu.c | 98 ++++++++++++++++++++++++++++++++---------
 2 files changed, 86 insertions(+), 21 deletions(-)

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
index 5b046f10e2ce4..7ff001dd33bf9 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2569,6 +2569,23 @@ static int krb5_authenticate(struct ksmbd_work *work,
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
@@ -2619,6 +2636,7 @@ int smb2_sess_setup(struct ksmbd_work *work)
 		   (server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL) &&
 		   req->Flags & SMB2_SESSION_REQ_FLAG_BINDING) {
 		u64 sess_id = le64_to_cpu(req->hdr.SessionId);
+		int state;
 
 		sess = ksmbd_session_lookup_slowpath(sess_id);
 		if (!sess) {
@@ -2646,23 +2664,50 @@ int smb2_sess_setup(struct ksmbd_work *work)
 				goto out_err;
 		}
 
+		/*
+		 * Read the state once: a reauthentication on another channel
+		 * can change it while this request is being checked. Pairs
+		 * with smp_store_release() in smb2_sess_setup().
+		 */
+		state = smp_load_acquire(&sess->state);
+
+		/*
+		 * A session that is still being set up has no signing key
+		 * yet, so there is nothing to verify a binding request with.
+		 */
+		if (state == SMB2_SESSION_IN_PROGRESS) {
+			rc = -EACCES;
+			goto out_err;
+		}
+
+		/*
+		 * Nor has a guest or anonymous session: its signing key is
+		 * derived from an all-zero session key. It cannot be bound
+		 * (MS-SMB2 3.3.5.5).
+		 */
+		if (user_guest(sess->user) || ksmbd_anonymous_user(sess->user)) {
+			rc = -EOPNOTSUPP;
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
-		if (sess->state == SMB2_SESSION_EXPIRED) {
+		if (state == SMB2_SESSION_EXPIRED) {
 			rc = -EFAULT;
 			goto out_err;
 		}
@@ -2679,28 +2724,30 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
-		if (user_guest(sess->user)) {
-			rc = -EOPNOTSUPP;
-			goto out_err;
-		}
-
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
+			/*
+			 * Only a valid session that is not a guest or anonymous
+			 * one has a signing key to check with
+			 */
+			if (smp_load_acquire(&sess->state) == SMB2_SESSION_VALID &&
+			    !user_guest(sess->user) &&
+			    !ksmbd_anonymous_user(sess->user) &&
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
@@ -2939,7 +2986,12 @@ out_err:
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
 
@@ -12911,6 +12963,8 @@ int smb2_check_sign_req(struct ksmbd_work *work)
 
 	ksmbd_sign_smb2_pdu(work->conn, work->sess->sess_key, iov, 1,
 			    signature);
+	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
+	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
@@ -13030,6 +13084,8 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	iov[0].iov_len = len;
 
 	ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature);
+	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
+	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
-- 
2.43.0

