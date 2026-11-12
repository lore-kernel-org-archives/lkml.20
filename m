Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509464;
	b=m6ajt+xGLv/CvDJL4L+KCj8ZxXWfeytyU7xtJ5jqDdwu2RwsfFGDGSrDpfHlbBgliaba
	 UzFcAUVRojoxixpzaCnzR0RS4PjP5zAkWljw4Vf7mBDdEkHp02e781LrDw3fUvVJKRBYQ
	 jXEcT90LC8dVV4c9dQDwQ8t7rRuTmZzyqiTUOTHGlB9t2HGZPxmuPqnhDhOjS1vN3/Tu+
	 /kpqxFhuj2KG9+GKT1zbCA64MUaOm0/wZg/dxTxXzK/eewdKeA8fsz4fFsR6wtJlqny3R
	 4FgEbOeKje+qWowhkosui6ZNJAQXLGEBaJ++Mcz+p9z4jtxBocBE9zx4ZGTPfFzbsjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nw0rU2FPZDBAmxecoPkgTAUCcAR/un1WkIa+aTG+JeE=;
	b=RJwZQb0XZuqT2BmADU5YifNTrNldSap9QDDUC1/7SiDa0wLs3J8ohFbedhe09Sjl3BKM
	 ei3efBC/gw3mwCXolbbNDhnXnm4hZC3REDHmCUeHgpaIf3ZJAm5JR6ZGofB9A7wKxiTqY
	 qn5YaFogpQcC/GYsh9OzWVUtW+T5aiu9xIMi5vMDvD392wd9UFWx8+aDVjptzwnv5l43H
	 jJWM5I2hGJRDaLXhXsxnsP7n+kN2lPi3UWT9jNu9iY4xQdHXzV45v6+8DgpaTJ1ziR4Xs
	 aybu1tTzIlYS68jiUi4dZbktxk/nYhLX2xwORisCGNDAXiW1XEkYMpti/ravnp31NZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OJkE/8QB";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96960A2602
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C96960A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJkE/8QB
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9eb579c0eso1217525ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509463; x=1795114263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nw0rU2FPZDBAmxecoPkgTAUCcAR/un1WkIa+aTG+JeE=;
        b=OJkE/8QB3yDjqUAwbfoYxXspuP9Nx8gmGGVaj6wZWuE+um4lJsYPlbtFZWBlBclyRO
         M+5SGqWILNbWfgBPfpgv7HDIsLHTZ9SDGMQG5l/2a7xp7rm//dcl9S+Nv7VvNsZN9XdQ
         LH6p5aTWABw/l042NdbHqqKXFNrYea4VkRisKOpOl/OSZ1Y+VUBdjU+Th9cwATbnwurC
         zItMsqda0FwyAz5cXwFFhkfGUkWAuDP1/VOvRvaczQ4YNfL7rdSqEjcP4dA4z0Jx4bRB
         hOUrxPLnr9odmOnlf27ofAbQTlYQqny/b7aceGYZ+nLQRglo+Tg3kgh6zqdLBqkh/KAm
         m4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509463; x=1795114263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nw0rU2FPZDBAmxecoPkgTAUCcAR/un1WkIa+aTG+JeE=;
        b=P7pG5AGpb6llXl/gFTrsQh6ur1MzHWEBYq3X5PTo4aggvK7GHMkmfmZNtrkh0ICh/u
         Dp2rSMbQDt5m2nU8hDOlCc87PcMqmmwVCTYnPg7bH/2wyTxPisoTob/6UYNlB2/c7+s6
         tfxKdI1yI+tb/ks9z5sY4r6z3gjFnXfgEDNSW4xkiXz4lXpQjP31d8jNZDcpOLwHhi7N
         gApDsldKVobFwj8v37TFDwhKsEdZH6uu/lazLzlZNRq4KEtNJlUyMkSxSMM1pAln+wCL
         gz4JfoHO0+2h30o5/9WPKCmIlXc0CAH+lzRmD4d+E50INDPjD8I2uVoIU6iBDfu8VQFD
         FjUw==
X-Forwarded-Encrypted: i=1; AL+hErHV1w2qmh5Zi+Tr/zCV2D7B59Fs5TysG556lSQ19nmum6M1h3BE7llFRt0uNfIB0k5bX4W34T1XDMPXYT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9BOSWXNDlsYroW/pnLKsBGP17eLm/tDoGAG9M3J+i18RYmM5o
	rWBt9S74GwoKD5ITDD/ahKh75AF9FCGmjupArcAydHRl3LTcKpVt/WVm
X-Gm-Gg: AYBFou0LelA/mFVuZUuwxVx816TX2iOlRfkKhy93mWNbqaqL7diihEIYJZETNTG7xwx
	CIt+FWqpoXCrVRYh33BJRK6T8dBZhJ+nL7nXovOTAV+9xCIPJC84kVUTDjPyESNLzaOVatEr1oS
	UHvU3zqJBAjl36auKovD1zEjTgiJs55VJmVIaZecXjha4DS6EvSB9EX2EQL+pKtA8Klucu19xuD
	jbt6rHVtrtqeOP+oYZs3ej0HzU7nKMMZFmTKlHpSmfSFDFZfN88bqJ3YmLw69V2cgALpMoX5gD1
	QLyb7mRQqR/BMmR8rHDSXzEZ5VOz2YdaQzAGs1h6iGuqHRBrOeY/4Sd3b1TGz9K9GSx90oMDZil
	W+w5mz45rW/yGNjbyv9SgPohXzDEa5GKSjt4qOEF+rsovQ/b1DPKeymtukSzBv+ztiv0vph9JiQ
	pEAPWGcFij896oo+gLzsE4T9+9CD/vhjSADviuRG12nc+kGN0kxAqdM4WYmSEBiKNYt/n0lFj+l
	4tMDO85NCO6ezgkMEqOITx9t5XKAfpvC/Iwlf23ymzKRir6l4B7iJGRyibTfTBX/FXwLlm3a2v3
	MqX6ZSmT3E4UcZurb7d+ukQ5m89nSzM+275Dl7ZRFxAjTGteSBVzB0YSqp5lZp7qCDFDtO48pQh
	f8ZVuObskSsuVJtVZvYuPtbnGQQ==
X-Received: by 2002:a17:903:2c7:b0:2ea:7180:3aba with SMTP id d9443c01a7336-2ee0dc052ddmr2608795ad.39.1794509463313;
        Thu, 12 Nov 2026 10:51:03 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:cbb:dbe2:bd9d:a035])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7cf7bbsm66205ad.29.2026.11.12.10.50.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 10:51:02 -0800 (PST)
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
Subject: [PATCH v7 2/8] ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
Date: Fri, 13 Nov 2026 01:50:38 +0700
Message-ID: <20261112185044.41571-3-mike.michalo@gmail.com>
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

decode_sign_cap_ctxt() stores the algorithm picked from the client's
SMB2_SIGNING_CAPABILITIES context in conn->signing_algorithm, but it
runs before init_smb3_11_server(), which then overwrites it with
AES-CMAC. As a result the negotiate response always selects AES-CMAC,
even for a client that only offered HMAC-SHA256, and every SMB 3.1.1
connection is signed with AES-CMAC.

Keep the negotiated algorithm and sign with HMAC-SHA256 when that is
what was negotiated.

Connections of the same session can now have negotiated different
algorithms. MS-SMB2 takes the algorithm from the connection a message
travels on (3.1.4.1, 3.1.5.1), and a client that follows 3.2.4.2.2.2
offers only the already negotiated algorithm on further connections, so
for it nothing differs. A client that offers another list on a new
connection, as the Samba client can, signs the binding request with the
session signing key and the algorithm of the connection that set up the
session. smbd verifies it that way, and smbtorture's
smb2.session.bind_negative_smb3signCtoH and HtoC tests expect such a
bind to succeed. Do the same: store that connection's algorithm in the
session and use it together with the session key, while channel keys
keep using their own connection's algorithm.

An AI assistant was used to draft the patch and as an independent
reviewer. Testing is described in the cover letter.

Fixes: 378087cd17ee ("ksmbd: add support for negotiating signing algorithm")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/auth.c              | 14 ++++++++++++--
 fs/smb/server/auth.h              |  4 ++--
 fs/smb/server/mgmt/user_session.c |  1 +
 fs/smb/server/mgmt/user_session.h |  2 ++
 fs/smb/server/smb2ops.c           |  4 +++-
 fs/smb/server/smb2pdu.c           | 20 ++++++++++++++++++--
 6 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 0c51ca0cb14db..fc6ace49584b1 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -504,19 +504,29 @@ void ksmbd_sign_smb2_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
 /**
  * ksmbd_sign_smb3_pdu() - function to generate packet signing
  * @conn:	connection
+ * @signing_algorithm:	signing algorithm the key was generated for
  * @key:	signing key
  * @iov:        buffer iov array
  * @n_vec:	number of iovecs
  * @sig:	signature value generated for client request packet
  *
  */
-void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
-			 int n_vec, char *sig)
+void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, __le16 signing_algorithm,
+			 char *key, struct kvec *iov, int n_vec, char *sig)
 {
 	struct aes_cmac_key cmac_key __cleanup(aes_cmac_zeroize_key);
 	struct aes_cmac_ctx cmac_ctx;
 	int i;
 
+	if (signing_algorithm == SIGNING_ALG_HMAC_SHA256_LE) {
+		u8 mac[SMB2_HMACSHA256_SIZE];
+
+		ksmbd_sign_smb2_pdu(conn, key, iov, n_vec, mac);
+		memcpy(sig, mac, SMB2_SIGNATURE_SIZE);
+		memzero_explicit(mac, sizeof(mac));
+		return;
+	}
+
 	/* This cannot fail, since we always pass a valid key length. */
 	static_assert(SMB2_CMACAES_SIZE == AES_KEYSIZE_128);
 	aes_cmac_preparekey(&cmac_key, key, SMB2_CMACAES_SIZE);
diff --git a/fs/smb/server/auth.h b/fs/smb/server/auth.h
index 7ce9c42d58f1e..5a10482678ee4 100644
--- a/fs/smb/server/auth.h
+++ b/fs/smb/server/auth.h
@@ -59,8 +59,8 @@ int ksmbd_krb5_authenticate(struct ksmbd_session *sess, char *in_blob,
 			    char *sess_key);
 void ksmbd_sign_smb2_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
 			 int n_vec, char *sig);
-void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
-			 int n_vec, char *sig);
+void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, __le16 signing_algorithm,
+			 char *key, struct kvec *iov, int n_vec, char *sig);
 int ksmbd_gen_smb30_signingkey(struct ksmbd_session *sess,
 			       struct ksmbd_conn *conn);
 int ksmbd_gen_smb311_signingkey(struct ksmbd_session *sess,
diff --git a/fs/smb/server/mgmt/user_session.c b/fs/smb/server/mgmt/user_session.c
index 15662fd745abb..87aba04a8cbdd 100644
--- a/fs/smb/server/mgmt/user_session.c
+++ b/fs/smb/server/mgmt/user_session.c
@@ -557,6 +557,7 @@ int ksmbd_session_register(struct ksmbd_conn *conn,
 	int ret;
 
 	sess->dialect = conn->dialect;
+	sess->signing_algorithm = conn->signing_algorithm;
 	memcpy(sess->ClientGUID, conn->ClientGUID, SMB2_CLIENT_GUID_SIZE);
 	ret = xa_err(xa_store(&conn->sessions, sess->id, sess,
 			      KSMBD_DEFAULT_GFP));
diff --git a/fs/smb/server/mgmt/user_session.h b/fs/smb/server/mgmt/user_session.h
index 5f0f6276e3168..931ca102b8392 100644
--- a/fs/smb/server/mgmt/user_session.h
+++ b/fs/smb/server/mgmt/user_session.h
@@ -48,6 +48,8 @@ struct ksmbd_session {
 	u64				id;
 
 	__u16				dialect;
+	/* Signing algorithm of the connection that created the session */
+	__le16				signing_algorithm;
 	char				ClientGUID[SMB2_CLIENT_GUID_SIZE];
 
 	struct ksmbd_user		*user;
diff --git a/fs/smb/server/smb2ops.c b/fs/smb/server/smb2ops.c
index 747276b171bd1..c5b3cf34494e7 100644
--- a/fs/smb/server/smb2ops.c
+++ b/fs/smb/server/smb2ops.c
@@ -320,7 +320,9 @@ int init_smb3_11_server(struct ksmbd_conn *conn)
 	conn->ops = &smb3_11_server_ops;
 	conn->cmds = smb2_0_server_cmds;
 	conn->max_cmds = ARRAY_SIZE(smb2_0_server_cmds);
-	conn->signing_algorithm = SIGNING_ALG_AES_CMAC_LE;
+	/* Keep the algorithm chosen from the client's signing capabilities */
+	if (!conn->signing_negotiated)
+		conn->signing_algorithm = SIGNING_ALG_AES_CMAC_LE;
 
 	if (server_conf.flags & KSMBD_GLOBAL_FLAG_SMB2_LEASES)
 		conn->vals->req_capabilities |= SMB2_GLOBAL_CAP_LEASING |
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 7ff001dd33bf9..79c03420d1226 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -1858,6 +1858,8 @@ static __le32 deassemble_neg_contexts(struct ksmbd_conn *conn,
 	bool posix_ctxt_seen = false;
 
 	ksmbd_debug(SMB, "decoding %d negotiate contexts\n", neg_ctxt_cnt);
+	/* A previous, failed NEGOTIATE must not leave its algorithm behind */
+	conn->signing_negotiated = false;
 	if (len_of_smb <= offset) {
 		ksmbd_debug(SMB, "Invalid response: negotiate context offset\n");
 		return status;
@@ -13040,6 +13042,7 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
 	char *signing_key;
+	__le16 signing_algorithm;
 	struct smb2_hdr *hdr;
 	struct channel *chann;
 	char signature_req[SMB2_SIGNATURE_SIZE];
@@ -13059,8 +13062,14 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 		len = get_rfc1002_len(work->request_buf) -
 			work->next_smb2_rcv_hdr_off;
 
+	/*
+	 * A key must be used with the algorithm it was generated for: the
+	 * session key with the one of the connection that created the
+	 * session, which can differ from this connection's when binding.
+	 */
 	if (le16_to_cpu(hdr->Command) == SMB2_SESSION_SETUP_HE) {
 		signing_key = work->sess->smb3signingkey;
+		signing_algorithm = work->sess->signing_algorithm;
 	} else {
 		chann = lookup_chann_list(work->sess, conn);
 		if (!chann) {
@@ -13068,8 +13077,10 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 			    !(hdr->Flags & SMB2_FLAGS_SIGNED))
 				return 0;
 			signing_key = work->sess->smb3signingkey;
+			signing_algorithm = work->sess->signing_algorithm;
 		} else {
 			signing_key = chann->smb3signingkey;
+			signing_algorithm = conn->signing_algorithm;
 		}
 	}
 
@@ -13083,7 +13094,8 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	iov[0].iov_base = (char *)&hdr->ProtocolId;
 	iov[0].iov_len = len;
 
-	ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature);
+	ksmbd_sign_smb3_pdu(conn, signing_algorithm, signing_key, iov, 1,
+			    signature);
 	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
 	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
@@ -13110,6 +13122,7 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 	u16 command;
 	int n_vec;
 	char *signing_key;
+	__le16 signing_algorithm;
 
 	hdr = ksmbd_resp_buf_curr(work);
 	command = le16_to_cpu(hdr->Command);
@@ -13117,12 +13130,14 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 	if (command == SMB2_SESSION_SETUP_HE &&
 	    (!work->session_setup_binding || hdr->Status != STATUS_SUCCESS)) {
 		signing_key = work->sess->smb3signingkey;
+		signing_algorithm = work->sess->signing_algorithm;
 	} else {
 		chann = lookup_chann_list(work->sess, work->conn);
 		if (!chann) {
 			return;
 		}
 		signing_key = chann->smb3signingkey;
+		signing_algorithm = conn->signing_algorithm;
 	}
 
 	if (!signing_key)
@@ -13133,7 +13148,8 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 
 	iov = smb2_get_sign_rsp_iov(work, hdr, &n_vec);
 
-	ksmbd_sign_smb3_pdu(conn, signing_key, iov, n_vec, signature);
+	ksmbd_sign_smb3_pdu(conn, signing_algorithm, signing_key, iov, n_vec,
+			    signature);
 	memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
 }
 
-- 
2.43.0

