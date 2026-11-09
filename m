Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253326;
	b=RGmCzL9sdAn53EL10wuG1OR5saMDqyIESlr7Lu0uT9rwgz8YdKkwBzdwey8G27g0jRRi
	 E56roCub0KB7Dwx9TUo8XTJfBv/VfKUQ2oOlYvY8D8taL+WjOU0XTOX2oAr5G5bg0D6or
	 ne7GChdxUneG/xh2E+UlQ+I5GlibAY2ByO27/eBEytP4aYWZwA405F3Bb3m5+hyWoUF+R
	 FrUNPxXZWkZll0QkN/LABImp9Xnqg5UpECdc6ltkQkVnoW2OM7x82ERv0maFl59J93AwH
	 no8P2sPO4+Q1r5mdEzaRdh3JeNPfGk0Xv8ef16D1h1OzDZE/CUWUqpiVRQQbMyuH8xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TgBUS/DQ/xz4w+M5djBfi/qc8Y4BNVRQioLu9MZffZY=;
	b=RPTK112ELd+hGjDUvvMJDBTb8/G0ma8i3O50Nz8KenY9I+mkDsDfazCzthWCsZoS7PUH
	 YJ23wDkFWA1KGL1/3Ah9d2YsLgiYq7DPF4HwFWv9YFlufxEz+rvZTguoY9qWvxpx8FOCX
	 X7IO+rPy5dKMzWldhWjJcfB+6Elee6T0LCCPMSUd2qphgxs8f1F7mSzjkQnQlh/mH2XtT
	 YvqUJgcbEZ/cJBb+fLueykBcQroToRnvhDV2EbMDGdDH92C9cEUT7jiImCq61AQgQCALh
	 jIQPYQpXFyYB2ILmTaqSPFEXel8hPmJ7v13DqyuodEOiVaCVOFOQROe06O7saFBbPdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N95TO9ZW;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A9606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6A9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N95TO9ZW
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso7208535ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253326; x=1794858126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgBUS/DQ/xz4w+M5djBfi/qc8Y4BNVRQioLu9MZffZY=;
        b=N95TO9ZW6w/Ki0cdwvvyuBW9Ql0PqB223WLUwTmK6vCqdpYt2TINSRNYAa8+Z68VYn
         LwFm3rWj+y71CkOJXCMKSDlUsUwKNnzGvDWnFPEWur2Ow6HLxurcKiWG8eqBFyRXF3C/
         7NcwJpCjZyGfCxhFB7MO8/FTS91f3Bq/ucgkYT+R4t2AQREMz6ithJtIN1QRvAtOf1MS
         UlDvOCmumkOXvpzNRQdtQlpddUBsodanqcY+1x8FcU+dJ4jDviAmo5hEGMlVGHLoXpUU
         8SIrLHcpi0nfOn7mk53MrX3prHblUwUNaUrIc1gPpWahNfkDz7Gc0kzipAnQOBMhsD1y
         OtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253326; x=1794858126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgBUS/DQ/xz4w+M5djBfi/qc8Y4BNVRQioLu9MZffZY=;
        b=NELTMD28iqvE9NZIg6ljEup2JGSYjkNGNqbNS/jhsqlVl+5lRrM770pWPFsylkvoQH
         DUf/ZZAnwuLNJ2JYedvrAxmUuv7ftgLe4z7g4bftvmR36VkGJ7lPPDDIF4qtX++AMcJr
         xYSsND/WKxP3PPt6K91BYTPQxms8D6lcOy6Pc4G/GlWbb5NBmTvJtRCR2zzRhkf39ZJD
         49QZ+UYF7MEhuNo1OArkyLnyoUR1RgmhX52kopuNdaZ8arXnYYejxMPM3pcO47ef8Jko
         cl/sd1EnO6hXbs17nNLgbZV+QDOW2nqKkQcX5QEZcfhqxuJfWl47sHfJ6tQyJMYhoIb1
         nXeg==
X-Forwarded-Encrypted: i=1; AL+hErEXG34pOGKqE8p/zZfiGc6qcPop8GhaXjLz5SYgn74WkgEmZhpx1WVtFIVDi/ZVZ5M6gJ+CFDjMZ0GbP6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N7Rx6TjyGQxyXjm19ljYGcIgHdftbhANzAqW3TGTNWz8c9HWk
	yH3IdNT/gddFlr+7GHsp+KrWUWCAfEAUdK9m7RCDhebIv1EIcKQ4KQ2u
X-Gm-Gg: AYBFou2eMTeuDDZjaWO9KfAL2Sk8PztdkuxYU1MuKYgYLSew6dmX0OMl87ki/H4NnMP
	DyI9B0hZWsywehLMsq7tUFDsQFL/JW6KTPVzi0p4QJ2z2jkyjbcWs8mO+iy31bhesTVN4wOmBUk
	4isNVfe5glem33faKrFrIC879qFFjYzRvCcmw4PGnTVinqIQ7G0owzKXiMdZiyNFi2GLBs/Y0Bi
	RHKmHWII69/OGEXvI7XLxQEB7GmsDpwfCvj32nIyxLq2LZHtb0Fa3HQ2VTsRZZr7l0s6nWcXl9o
	jBAgfGiwMZ+eab41dPHyOuK+iXypRu2KLucOd5y2lPplEkk5HUgP14QLQcF7PFSF5tMDSg60zhQ
	9MLO0xRw8O0IMUgZO7K9U2tqVSqO8CbFFnCZ/jQiyWW72sYIqa70rVDsx6nUQB+Ur+x8OpL4cQw
	2ErH40MRhsr+LKq6h/Sj3jQEhfqx7Vlw1/VEFrad5A3zCI+Go4s7pcbc2R6rrvql2KzSR4lrvzZ
	S1HBuWnNf3hkQJGlze4rhQfks0CUoAnU2gP4HYG8FE8AafhMHwnPjDLeA3IWhllq4tvaQTLPF4M
	i+hirwY/nKj4k+8L5jbVAPH+QRCyz75NgLqwV19WMy04TgeAvY8oVCgLB/Q97ktN4U1qfdvgNyE
	JQ//T+90PP8df9NbOTKcNz/WuZA4gkuDhlF4h7kEBSDl8nwv/jEvendY=
X-Received: by 2002:a17:903:2f45:b0:2ed:1c15:ffc0 with SMTP id d9443c01a7336-2edb91be092mr1607515ad.30.1794253325888;
        Mon, 09 Nov 2026 11:42:05 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm1388585ad.13.2026.11.09.11.42.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:42:05 -0800 (PST)
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
Subject: [PATCH v3 2/6] ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
Date: Tue, 10 Nov 2026 02:41:40 +0700
Message-ID: <20261109194144.22814-3-mike.michalo@gmail.com>
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

decode_sign_cap_ctxt() stores the algorithm picked from the client's
SMB2_SIGNING_CAPABILITIES context in conn->signing_algorithm, but it
runs before init_smb3_11_server(), which then overwrites it with
AES-CMAC. As a result the negotiate response always selects AES-CMAC,
even for a client that only offered HMAC-SHA256, and every SMB 3.1.1
connection is signed with AES-CMAC.

Keep the negotiated algorithm and sign with HMAC-SHA256 when that is
what was negotiated.

Since connections of the same session can now use different
algorithms, each signing key also has to be used with the algorithm it
was created for. The session signing key belongs to the connection
that set up the session, and MS-SMB2 3.3.5.5 requires a binding
request on a new channel to be verified with it. Store that
connection's algorithm in the session and use it together with the
session key, while channel keys keep using their own connection's
algorithm.

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
index 0c51ca0cb14db..78e35f2174603 100644
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
+		u8 mac[SHA256_DIGEST_SIZE];
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
index 129a4c5c74f44..af1e7aac4ded1 100644
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
@@ -12956,6 +12958,7 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
 	char *signing_key;
+	__le16 signing_algorithm;
 	struct smb2_hdr *hdr;
 	struct channel *chann;
 	char signature_req[SMB2_SIGNATURE_SIZE];
@@ -12975,8 +12978,14 @@ int smb3_check_sign_req(struct ksmbd_work *work)
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
@@ -12984,8 +12993,10 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 			    !(hdr->Flags & SMB2_FLAGS_SIGNED))
 				return 0;
 			signing_key = work->sess->smb3signingkey;
+			signing_algorithm = work->sess->signing_algorithm;
 		} else {
 			signing_key = chann->smb3signingkey;
+			signing_algorithm = conn->signing_algorithm;
 		}
 	}
 
@@ -12999,7 +13010,8 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	iov[0].iov_base = (char *)&hdr->ProtocolId;
 	iov[0].iov_len = len;
 
-	ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature);
+	ksmbd_sign_smb3_pdu(conn, signing_algorithm, signing_key, iov, 1,
+			    signature);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
@@ -13024,6 +13036,7 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 	u16 command;
 	int n_vec;
 	char *signing_key;
+	__le16 signing_algorithm;
 
 	hdr = ksmbd_resp_buf_curr(work);
 	command = le16_to_cpu(hdr->Command);
@@ -13031,12 +13044,14 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
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
@@ -13047,7 +13062,8 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 
 	iov = smb2_get_sign_rsp_iov(work, hdr, &n_vec);
 
-	ksmbd_sign_smb3_pdu(conn, signing_key, iov, n_vec, signature);
+	ksmbd_sign_smb3_pdu(conn, signing_algorithm, signing_key, iov, n_vec,
+			    signature);
 	memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
 }
 
-- 
2.43.0

