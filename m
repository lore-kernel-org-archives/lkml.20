Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253333;
	b=GEU8yRaTsZlU9Y6cc46yvQ6U76ZNveUMnVY9SFK3zG218yHqopryqftJ7BWUkRa/90EF
	 o2qwK/0fzjvFle2B60FnXQ+/0+FzKBZ4/V51TC3/pP+7aVkanhADKsX8oBlR3zKFY8Um2
	 JgCGBzsAArRY5PkfqcmsDfYOzu5LNI7o0GCxFBj9FVHyuOQRK9i8nxowV+lq95iYlhle6
	 SvYu2XRnZJn9Fd6vtYDDGKs4rJ6+r+eFxWj30uLTjSkiqJjfAo7M5g22t5m0DCaOdBt5+
	 +ruwmblyFN3owLGY2aWkIii4uYVcsjNzcDRH8R2AE5RnnSDSBE15XYtcRYWJrIYyweg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PUPl+ApB+9u+qzt/i8jIifMeFEhVOmG0DXWj1SviarY=;
	b=4Ux3p4qpgZMwC3wRiFdjt4wtku/RrUCUtTJXRpUx2Et0S+emi/Vky9fIoCB1z2T3wy+M
	 xR9Ri2edX0s2147GObTFSmdKgtxohiIpA5TYq6TWh0kpDXzVhfaBy+NMkLRj62H7gKo6p
	 tURPIiAWmP1AEneyoI3BwVVBFFzkoTe7fwUmSmLFxWCIOV7zAorR86jSV8uEluxW9buAx
	 Y21eB6cH+tRUc/v4zqLFeVvX7N5UToCPvychnEAJN31Il29deIpgNLKQn2SSoU47AeLFe
	 EJqyDAR0N2E11UsQBTZgXShmD/tB258u5k6+HQCH+RjP1yfwQ4RA1KHJBY5QtUy8r6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEVCFL4+;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A29606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEVCFL4+
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b271e573adso480257b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253332; x=1794858132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUPl+ApB+9u+qzt/i8jIifMeFEhVOmG0DXWj1SviarY=;
        b=dEVCFL4+3tO2YlMLJynyvigzSYs/Fb+ZFdqJUQqskUFWU77fPvBBNuXFD2d7DK21Om
         2tkoYd3KpzG5u5LpXm/Khp2jNiJAdaNbqlgaH37U6HQX9fVKc9+lwK05TFZ2revLSdUi
         YPh7AAUE6CW+058Lo31F9YaET89BW2gvWw66mvtl7GIZp4mLVyDWxTU6369CVSb48hrD
         humlF5YQRAtoxbR8oRVOT7dYk7E947eKMWzCZiIaFDOrAEWujiPSqrVD/OKVIOzTGsg1
         7iDtYueD93EjuQcAG6AQ9SMTBTt8uTUMmwCDm1tjaCJMp6n6kkItdUotqV5zlhLIJmGG
         ojiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253332; x=1794858132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUPl+ApB+9u+qzt/i8jIifMeFEhVOmG0DXWj1SviarY=;
        b=OuOuEY4+L9KcsMlOQQ91ULHrXFquTItvdwxmWAlWWikmxIgCHh3eQpTU4IDjVMZ/3r
         1Md88sOtAbX+CtpzO5XVWUhDvblbhR3zI3ZT+QGJdI+vieICOBBIoL9t3pWyBXdIrCDu
         NbmgHjiyU+p728JKMsPWrmvL872Ax/U5Jft46CZv0m3bK2Tcx6Gh2HWnn4t8XX7UOcU8
         i1y2SPc/LdDzst45nUQDDv4Z96h1m+XTFwaBaIik6c25ads3NVsScWlzvM+V6gR0LiNY
         WheSuVdirmkXtFnsWQbUuswlaO3g2oOu3czTtOkZwHsl1tc7o3pPUaGmR2vL0X0LIrsh
         tzyQ==
X-Forwarded-Encrypted: i=1; AL+hErFysFh2Gkxeh1CEGzuRfE8ZBDj0nFnabkw56gkPvwbwdwuTZpUIPOWplg5OlDZ8eIZIrVIhUkJ6/HMcwOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DzPVPENCWn9lAPMlSZESRDYX2aq88QBa4ChJelyemerO4oH/M
	UeqN0h5lS2MTr8JzVLKU+1WbMK4wJMyrWElEZisL+3hZc/dbLqfgwIT86NTdn70GEbj1Pw==
X-Gm-Gg: AYBFou2ffedhZURRWmJrwfYzUA2B2NOVovQXFPRlDSYiVtDD3LVZJHcmQLtM+GdAsXC
	u+V3J+P4gyk+kMFktV7O4AU//Yl4PkFCC73OhKcLqg7f8yJRylvqJtYKPnC05QKPravjfsjt+HQ
	G200E2jQouCT93LIblxOaurpgvy46CiEkALaesa6PFx2vVg75V4nDiS+3XCy2ShvIWkmxnwlpzG
	pMQpLJT070/J0Kbl+SDZOPh/104r6Rfq1Jc5UGACS21Nr604Mh5s17ckibLxbD2K8W+Z9Ej4ZJB
	WvSnjufs15QI/v3SR9zRq7mp+1381ffjxOZeNoTv8eYyB2lsL43vGtqJBSjbpJ04P65kWzSTbRH
	liIaPb79qZvbiuLzI7qGMlrksAUzVhSK32KLCPkyj3uZ/17QLAAvhjVixWBYsoqkwN+6iH5SlYJ
	AnSqLAdOc5r2qted6kzKhaODgOEXvQ8KfQt0rrx8rT5peDNVHIbZynZwe9mviqMNndWFJiYa83p
	kS+fxxELSI9jTh0DtspaiXQ0Nxwg1KR3DoGthECkBp+CWGTNljJXMyWm6y6qnopfIna0YBNoHJW
	sJ2S11shxBDCW/5YYcqNLRyiqV5trSMeIYWQIa+4gh2HubxmR1/J7atkODP2W5d9qnk83cFx+Qp
	xzJAuOLpCLnRgPVMWeOixBQAXJDiyoRkaXa0qgUJbprhkyKrrzqYq+L4=
X-Received: by 2002:a17:902:cec1:b0:2ed:18cc:d3b3 with SMTP id d9443c01a7336-2edb8d6f270mr1644585ad.6.1794253331652;
        Mon, 09 Nov 2026 11:42:11 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm1388585ad.13.2026.11.09.11.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:42:11 -0800 (PST)
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
Subject: [PATCH v3 3/6] ksmbd: use the channel signing key for session setup on a bound channel
Date: Tue, 10 Nov 2026 02:41:41 +0700
Message-ID: <20261109194144.22814-4-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194144.22814-1-mike.michalo@gmail.com>
References: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
 <20261109194144.22814-1-mike.michalo@gmail.com>
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

smb3_check_sign_req() and smb3_set_sign_rsp() always use the session
signing key for SESSION_SETUP. That is right for a binding request and
its non-final responses (MS-SMB2 3.3.5.2.4, 3.3.5.5.3), but a
reauthentication sent on a channel that is already bound is then also
verified and signed with the session key instead of that channel's
key.

Use the session key for binding requests, for their non-final
responses, and for SESSION_SETUP on a connection that is not yet a
channel of the session. Use the channel key for everything else on a
channel. Samba does the same. MS-SMB2 is ambiguous here: 3.2.4.1.1
has the client sign any session setup with Session.SigningKey, while
3.3.5.2.4 has the server verify non-binding requests with
Channel.SigningKey.

The signature of a reauthentication was not checked at all, because
SESSION_SETUP is exempt from the check in __process_request(). A
reauthentication of a live session with a forged signature therefore
got STATUS_MORE_PROCESSING_REQUIRED signed with the session key, with or
without multichannel: the same kind of signing oracle as an unverified
binding request. Verify it with the same helper as binding requests.
Also refuse an unsigned reauthentication of a session that requires
signing, as smbtorture's bind_negative tests expect from Windows,
unless the request is encrypted. A session that negotiated encryption
has sess->sign cleared even when the connection required signing, so
take that and enforced encryption into account too; merely having
negotiated encryption is not enough, since clients such as the Linux
one always offer it and then send unsigned, unencrypted requests. Do
not expire the session when a check fails, since the request did not
come from its owner.

For a SESSION_SETUP that is not the first command of a compound,
__process_request() already checks the signature and zeroes the
Signature field, so the new reauthentication check then failed. Restore
the field after that check.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c  |  11 ++++
 fs/smb/server/smb2pdu.c | 115 ++++++++++++++++++++++++++++++----------
 2 files changed, 98 insertions(+), 28 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 064f99427ca6f..4430c8d6393e9 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -150,7 +150,18 @@ static int __process_request(struct ksmbd_work *work, struct ksmbd_conn *conn,
 	}
 
 	if (work->sess && signed_req) {
+		struct smb2_hdr *hdr = ksmbd_req_buf_next(work);
+		char signature[SMB2_SIGNATURE_SIZE];
+
+		/*
+		 * check_sign_req() zeroes the Signature field. Restore it:
+		 * smb2_sess_setup() checks the signature of a SESSION_SETUP
+		 * again and adds the request as received to the preauth
+		 * integrity hash.
+		 */
+		memcpy(signature, hdr->Signature, SMB2_SIGNATURE_SIZE);
 		ret = conn->ops->check_sign_req(work);
+		memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
 		if (!ret) {
 			conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
 			return SERVER_HANDLER_ABORT;
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index af1e7aac4ded1..7d107a61626ad 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2561,15 +2561,17 @@ static int krb5_authenticate(struct ksmbd_work *work,
 #endif
 
 /*
- * A binding request must be signed with the signing key of the session it
- * binds to (MS-SMB2 3.3.5.2.4). Check it before the request is processed
- * and before any response is signed with that key. The Signature field is
- * restored afterwards, because SMB 3.1.1 adds the request as received to
- * the channel's preauth integrity hash.
+ * SESSION_SETUP is not covered by the signature check in __process_request(),
+ * because work->sess is not set for it. A binding request must be signed
+ * with the signing key of the session it binds to (MS-SMB2 3.3.5.2.4), and a
+ * signed reauthentication with the key of the channel it arrives on. Check
+ * them before the request is processed and before any response is signed
+ * with that key. The Signature field is restored afterwards, because SMB
+ * 3.1.1 adds the request as received to the preauth integrity hash.
  */
-static bool smb2_check_binding_sign_req(struct ksmbd_work *work,
-					struct smb2_hdr *hdr,
-					struct ksmbd_session *sess)
+static bool smb2_check_sess_setup_sign_req(struct ksmbd_work *work,
+					   struct smb2_hdr *hdr,
+					   struct ksmbd_session *sess)
 {
 	struct ksmbd_session *prev_sess = work->sess;
 	char signature[SMB2_SIGNATURE_SIZE];
@@ -2577,12 +2579,37 @@ static bool smb2_check_binding_sign_req(struct ksmbd_work *work,
 
 	memcpy(signature, hdr->Signature, SMB2_SIGNATURE_SIZE);
 	work->sess = sess;
-	ret = smb3_check_sign_req(work);
+	/* The key, and so the way it signs, belongs to the session */
+	if (sess->dialect >= SMB30_PROT_ID)
+		ret = smb3_check_sign_req(work);
+	else
+		ret = smb2_check_sign_req(work);
 	work->sess = prev_sess;
 	memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
 	return ret;
 }
 
+/*
+ * Whether a reauthentication of @sess must be signed or encrypted. A session
+ * that negotiated encryption has sess->sign cleared even when signing was
+ * required on the connection, while encryption itself is only enforced when
+ * configured, so check what the session actually requires. Merely having
+ * negotiated encryption does not count: clients such as the Linux one always
+ * offer it, and then legitimately send unsigned, unencrypted requests.
+ */
+static bool smb2_sess_needs_protection(struct ksmbd_conn *conn,
+				       struct ksmbd_session *sess)
+{
+	if (sess->sign)
+		return true;
+	if (!sess->enc)
+		return false;
+	if (server_conf.flags & KSMBD_GLOBAL_FLAG_SMB2_ENCRYPTION)
+		return true;
+	return sess->user && !user_guest(sess->user) &&
+	       (conn->sign || server_conf.enforced_signing);
+}
+
 int smb2_sess_setup(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
@@ -2665,7 +2692,7 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
-		if (!smb2_check_binding_sign_req(work, &req->hdr, sess)) {
+		if (!smb2_check_sess_setup_sign_req(work, &req->hdr, sess)) {
 			rc = -EKEYREJECTED;
 			goto out_err;
 		}
@@ -2759,6 +2786,29 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
+		/*
+		 * A reauthentication of a session that has keys must prove it
+		 * comes from the session's owner: a signed request must verify,
+		 * and a session that requires signing or encryption must not
+		 * accept an unsigned request unless it is encrypted, since
+		 * encryption has already authenticated it. The session has
+		 * keys once this connection is one of its channels, including
+		 * while a reauthentication is in progress. Do not expire the
+		 * session if the check fails: the request did not come from
+		 * its owner.
+		 */
+		if ((READ_ONCE(sess->state) != SMB2_SESSION_IN_PROGRESS ||
+		     lookup_chann_list(sess, conn)) &&
+		    ((req->hdr.Flags & SMB2_FLAGS_SIGNED) ?
+		     !smb2_check_sess_setup_sign_req(work, &req->hdr, sess) :
+		     (!work->encrypted &&
+		      smb2_sess_needs_protection(conn, sess)))) {
+			rc = -EKEYREJECTED;
+			ksmbd_user_session_put(sess);
+			sess = NULL;
+			goto out_err;
+		}
+
 		if (work->session_setup_reauth)
 			WRITE_ONCE(sess->state, SMB2_SESSION_IN_PROGRESS);
 
@@ -12982,22 +13032,24 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	 * A key must be used with the algorithm it was generated for: the
 	 * session key with the one of the connection that created the
 	 * session, which can differ from this connection's when binding.
+	 *
+	 * A binding request, or a SESSION_SETUP on a connection that is not
+	 * yet a channel of the session, is verified with the session key. A
+	 * request on an existing channel, including a reauthentication, is
+	 * verified with that channel's key, so that the session key is not
+	 * used at the MessageIds of another connection.
 	 */
-	if (le16_to_cpu(hdr->Command) == SMB2_SESSION_SETUP_HE) {
+	chann = lookup_chann_list(work->sess, conn);
+	if (le16_to_cpu(hdr->Command) == SMB2_SESSION_SETUP_HE &&
+	    (!chann || (((struct smb2_sess_setup_req *)hdr)->Flags &
+			SMB2_SESSION_REQ_FLAG_BINDING))) {
 		signing_key = work->sess->smb3signingkey;
 		signing_algorithm = work->sess->signing_algorithm;
+	} else if (chann) {
+		signing_key = chann->smb3signingkey;
+		signing_algorithm = conn->signing_algorithm;
 	} else {
-		chann = lookup_chann_list(work->sess, conn);
-		if (!chann) {
-			if (le16_to_cpu(hdr->Command) != SMB2_SESSION_SETUP_HE ||
-			    !(hdr->Flags & SMB2_FLAGS_SIGNED))
-				return 0;
-			signing_key = work->sess->smb3signingkey;
-			signing_algorithm = work->sess->signing_algorithm;
-		} else {
-			signing_key = chann->smb3signingkey;
-			signing_algorithm = conn->signing_algorithm;
-		}
+		return 0;
 	}
 
 	if (!signing_key) {
@@ -13041,17 +13093,24 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 	hdr = ksmbd_resp_buf_curr(work);
 	command = le16_to_cpu(hdr->Command);
 
+	/*
+	 * Responses to binding requests, other than the final one, are signed
+	 * with the session key (MS-SMB2 3.3.5.5.3), as is any SESSION_SETUP
+	 * response on a connection that is not yet a channel. Everything else
+	 * on a channel, including a reauthentication on a secondary channel,
+	 * is signed with that channel's key.
+	 */
+	chann = lookup_chann_list(work->sess, work->conn);
 	if (command == SMB2_SESSION_SETUP_HE &&
-	    (!work->session_setup_binding || hdr->Status != STATUS_SUCCESS)) {
+	    (!chann || (work->session_setup_binding &&
+			hdr->Status != STATUS_SUCCESS))) {
 		signing_key = work->sess->smb3signingkey;
 		signing_algorithm = work->sess->signing_algorithm;
-	} else {
-		chann = lookup_chann_list(work->sess, work->conn);
-		if (!chann) {
-			return;
-		}
+	} else if (chann) {
 		signing_key = chann->smb3signingkey;
 		signing_algorithm = conn->signing_algorithm;
+	} else {
+		return;
 	}
 
 	if (!signing_key)
-- 
2.43.0

