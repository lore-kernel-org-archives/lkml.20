Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704524;
	b=m8v34Fy1kfVX1hJLRXfWxdnBXE8Q3yZnHswiJqTCsT+a0GBk+nw8Xpy8jlf/RDwWuAeg
	 nlrDvlx6UNdPfVKn7ta1d3nmT+PWjd2mfYmYxSm0mOa6fAbd1XyHk68cZ4Kt12bEPOn+w
	 fnXHozfLIfUe1mHWqTQt6eazFSXqgY8CvbzeWwEsBtdG/ZeIrF2ySV6lNIr19dj4hRlEh
	 GrxXmuUoZ3966dNyJMFpIHtC24vgZvnf1/KXh2ImhatWiLm02gqpHxF29ZHKIv5K7b4Vr
	 yZDsa/nphnZQnU4TSEe3NmROMXDe/DZ4r/YyWl6e5e3HSQJywoJhKyUkKStEdlMznRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=64eLKIzABCGMRTCPKyoihv0B/ctoU2YSp/wlJpw21Tk=;
	b=TvVro4vwpV6wEG8JNRGvtUWeGkgl1Z0YvcpoEJBvdsqA0xj42/y5ESZd7oWCP/zuKVKn
	 afyq3G4F/91LRMTazO4OClnsiDNuIUL751ZPZkJ7/8ciYfRgnG5ybQPTlv5kYtVZ+uWwD
	 IlDvFw8Z2z+CItZqG3EiFfw3VpgYkNTfQjrpbnKTicpZ3k6bvPCiBdiddrY/QnqHL5eVf
	 hsOQ2MrgxURvzsdKKzX04YpnufPNBvK6klwR0caA0lnpK6U6XKD8LFt6J0DAwA+D7xUee
	 snQjbMnsujaYDcxt6HOykrtJMZIXCNgRoQ5PIMo/N646w3ztgTeHF1/eCSOHJu6np8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpFz8uvc;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E09606B12B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E09606B12B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpFz8uvc
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so6082741a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704522; x=1794309322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64eLKIzABCGMRTCPKyoihv0B/ctoU2YSp/wlJpw21Tk=;
        b=LpFz8uvcVvR+mSx5Gy7n6+AqxUOdbIVxSHJToK5gjRJeb0OidtV9YOx7wAqQS2Wvc0
         G3xgUayx4Q4r9wb/gAqYeduSoiZD0+Uc/2naiO5Rxp7ycR/lS+qc18897hckrywcoB+P
         YoZgexVANBLA/wPr8j8QiOb/U+LGkPX79oPutaxOBPaKzHmQ42SqpaZ48XHl9VHkcfkW
         WkJjgPTuy3LwU0L6Jj5MVIGaa/wqB/5kEn3mcX4FFBeY4N/5Hqxih+EN3JtNbQBRCTps
         HqDykmfrKDgGdNkFjCJpBIYMsDKbjjwuFFDh3y0B6sQPqL6Vv3fFdkuAz+PRVT9vILw6
         jTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704522; x=1794309322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=64eLKIzABCGMRTCPKyoihv0B/ctoU2YSp/wlJpw21Tk=;
        b=X2DHdf9QN0MpdBFCfijRtO9sRYpCwUjzelWM5y6TeY0u8wIpagjorj5xJ1lQTsRxeJ
         y8WZy4tdA1r+yvEh3Ebf2oTWa3g0C0B8ENjJdUDikdxmjeL5c1SsNDT341sbKG8j9Bjd
         f0It2QTufsicdJLk3RAhH2X9ENUJuwkFGCNbRo25Cq75IHSPWnsqRWpvSqAFQJnAlEva
         kAnh+hGXzKFLRNpq7CmWQhtaXc1YxZWZBfhVLxevpH11IGc7h2ve7MviozrJHuUu92wA
         Oj5P6qTyae8RHgWA7Zq8jwf+h1tEywejObIPxDixF1f2tn76ZHgMMCVN3lILJkktAJGx
         0HqA==
X-Forwarded-Encrypted: i=1; AKwUvByV7NL6EGM/tTZyfn6uVN/pSBeH2IoLrFYRcNskKqwKS1Tr4i+3YGR8OP6SK81K8Sj3p4n6HOi/w4fixis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fzQCNL+yKS293tiF21hB8ttCQ+O8b4EyFW2BooAaTbpwguAL4
	VuXhvA5BlpPdvkxItGjmeKbWyuhXzej2O2Mag6rKQeOyNK7calZmX08d
X-Gm-Gg: AYBFou0/qY41R5g98q3oY1m2CDaNTCSw8V9Tp4+4yMNCqWV4ELyO2Ps88ftT8Ez7EL0
	vIIHDxEiMceI4D+4mC/EHDtzE7G8lYe7GpIx/DabWHB6jXxUZr6XUeu20BM2h8MFeAWbpHli+UM
	/o/WbERAoA5MVCogabwT2B8y6IgJNFq4DxhCApvPE5UHXZ5YsWJAYE6D51aHNGR2hjgL487sA3k
	HyTsr1rP8cWE098OSShsGptf1QNzojBAj7NXIloQjoL0/Q93qQRXLMgiAxqsNTxr01I7xwUdMOw
	yH3JfN3rErgVt4bPKS2CIGjVGaINYWBsbnkd7jefNzDj4oYz7DEfwY+Q1ObIvFtIt2vbm4LAuRE
	mU93lq4piBMq//J+rYxiEb3GYERX3HxUXdmUItuWIgHbJHH32QXedfezib3flDuh03vMFsCROIM
	EXmvERYwkxEYpW97BCJV3t/54hM4NeXuEunIRWtgXLTeTZF2UeUR5LOjKWNQsDKw+FBg1LHz7js
	6xat5+KI10G5tw2xbs6PDIcbeyNyeRn5LUCxYQeyQ7c8NIqm6RuYKYFwa7g4GBK2tEf40Qk+kWU
	C5X8Gc8oFf0JW0DKyWR+F3wkGRaA/SAmkt3RCMGIs/8z3cEVdw3pPh3k+ZrEspRvseD7y38RpOS
	rgZmk8L54FYzjzTcYT3oMfV44+A2nQQSF6usR2coz
X-Received: by 2002:a05:6402:a403:b0:6b1:cee3:9083 with SMTP id 4fb4d7f45d1cf-6b4d4f7119cmr6571862a12.28.1793704521937;
        Tue, 03 Nov 2026 03:15:21 -0800 (PST)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm4349291a12.26.2026.11.03.03.15.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 03:15:21 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Enzo Matsumiya <ematsumiya@suse.de>,
	linux-cifs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ksmbd: add AES-GMAC signing support
Date: Tue,  3 Nov 2026 12:14:53 +0100
Message-ID: <20261103111453.84804-3-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103111453.84804-1-mike.michalo@gmail.com>
References: <20261103111453.84804-1-mike.michalo@gmail.com>
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

SMB 3.1.1 adds AES-GMAC as a signing algorithm that clients can
negotiate in the SMB2_SIGNING_CAPABILITIES context (MS-SMB2 3.1.4.1).
Windows and Samba support it.

Implement it with the AES-GCM library: the message, with its Signature
field zeroed, is authenticated as associated data with nothing
encrypted, and the 16-byte tag is the signature. The 12-byte nonce is
the MessageId followed by a 32-bit value with bit 0 set for messages
from the server and bit 1 set for SMB2 CANCEL.

Also accept AES-GMAC from the client's list of algorithms, and refuse
to bind a channel to a session if only one of them uses AES-GMAC, with
the same status codes as Windows (checked by smbtorture's
smb2.session.bind_negative_smb3sign* tests): STATUS_REQUEST_OUT_OF_SEQUENCE
for an AES-GMAC session and STATUS_NOT_SUPPORTED for an AES-GMAC
channel. These responses keep the SMB2_FLAGS_SIGNED flag like the other
binding errors, as clients reject unsigned responses to signed requests.

Mark the feature as supported in the ksmbd feature status table.

The nonce format follows Enzo Matsumiya's AES-GMAC series for the SMB
client and Samba's implementation.

An AI assistant was used to draft the patch and as an independent
reviewer. Testing is described in the cover letter.

Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 Documentation/filesystems/smb/ksmbd.rst |  2 +-
 fs/smb/server/Kconfig                   |  1 +
 fs/smb/server/auth.c                    | 46 +++++++++++++++++++++++++
 fs/smb/server/smb2pdu.c                 | 35 +++++++++++++++++--
 4 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/smb/ksmbd.rst b/Documentation/filesystems/smb/ksmbd.rst
index 728cfca1320..59c98c53d78 100644
--- a/Documentation/filesystems/smb/ksmbd.rst
+++ b/Documentation/filesystems/smb/ksmbd.rst
@@ -118,7 +118,7 @@ SMB3.1.1 Compression           Supported.
 SMB3.1.1 over QUIC             Planned for future.
 Signing over RDMA              Under development.
 Encryption over RDMA           Supported.
-SMB3.1.1 GMAC signing support  Planned for future.
+SMB3.1.1 GMAC signing support  Supported.
 ============================== =================================================
 
 
diff --git a/fs/smb/server/Kconfig b/fs/smb/server/Kconfig
index f8b03605db5..30523ca165e 100644
--- a/fs/smb/server/Kconfig
+++ b/fs/smb/server/Kconfig
@@ -8,6 +8,7 @@ config SMB_SERVER
 	select NLS_UCS2_UTILS
 	select CRYPTO
 	select CRYPTO_LIB_AES_CBC_MACS
+	select CRYPTO_LIB_AES_GCM
 	select CRYPTO_LIB_ARC4
 	select CRYPTO_LIB_MD5
 	select CRYPTO_LIB_SHA256
diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 78e35f21746..f650bdd0beb 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -13,6 +13,7 @@
 #include <linux/xattr.h>
 #include <crypto/aead.h>
 #include <crypto/aes-cbc-macs.h>
+#include <crypto/aes-gcm.h>
 #include <crypto/md5.h>
 #include <crypto/sha2.h>
 #include <crypto/utils.h>
@@ -501,6 +502,46 @@ void ksmbd_sign_smb2_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
 	hmac_sha256_final(&ctx, sig);
 }
 
+/*
+ * AES-GMAC signing (SMB 3.1.1, MS-SMB2 3.1.4.1): AES-128-GCM with the
+ * whole message as associated data and nothing encrypted. The nonce is
+ * the MessageId followed by a 32-bit word whose bit 0 is set for messages
+ * from the server and bit 1 for SMB2 CANCEL.
+ */
+static void ksmbd_sign_smb3_pdu_gmac(char *key, struct kvec *iov, int n_vec,
+				     char *sig)
+{
+	struct smb2_hdr *hdr = iov[0].iov_base;
+	struct aes_gcm_key gcm_key;
+	struct aes_gcm_ctx gcm_ctx;
+	struct {
+		__le64 mid;
+		__le32 flags;
+	} __packed nonce;
+	int i;
+
+	static_assert(sizeof(nonce) == GCM_AES_IV_SIZE);
+	nonce.mid = hdr->MessageId;
+	nonce.flags = 0;
+	if (hdr->Flags & SMB2_FLAGS_SERVER_TO_REDIR)
+		nonce.flags |= cpu_to_le32(BIT(0));
+	if (hdr->Command == SMB2_CANCEL)
+		nonce.flags |= cpu_to_le32(BIT(1));
+
+	/* This cannot fail, since we always pass valid lengths. */
+	if (WARN_ON_ONCE(aes_gcm_preparekey(&gcm_key, key, SMB3_SIGN_KEY_SIZE,
+					    SMB2_SIGNATURE_SIZE))) {
+		memset(sig, 0, SMB2_SIGNATURE_SIZE);
+		return;
+	}
+
+	aes_gcm_init(&gcm_ctx, (const u8 *)&nonce, &gcm_key);
+	for (i = 0; i < n_vec; i++)
+		aes_gcm_auth_update(&gcm_ctx, iov[i].iov_base, iov[i].iov_len);
+	aes_gcm_encrypt_final(&gcm_ctx, sig);
+	memzero_explicit(&gcm_key, sizeof(gcm_key));
+}
+
 /**
  * ksmbd_sign_smb3_pdu() - function to generate packet signing
  * @conn:	connection
@@ -518,6 +559,11 @@ void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, __le16 signing_algorithm,
 	struct aes_cmac_ctx cmac_ctx;
 	int i;
 
+	if (signing_algorithm == SIGNING_ALG_AES_GMAC_LE) {
+		ksmbd_sign_smb3_pdu_gmac(key, iov, n_vec, sig);
+		return;
+	}
+
 	if (signing_algorithm == SIGNING_ALG_HMAC_SHA256_LE) {
 		u8 mac[SHA256_DIGEST_SIZE];
 
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 11994e6b92e..1f977741f30 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -1793,7 +1793,8 @@ static void decode_sign_cap_ctxt(struct ksmbd_conn *conn,
 
 	for (i = 0; i < sign_algo_cnt; i++) {
 		if (pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_HMAC_SHA256_LE ||
-		    pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_AES_CMAC_LE) {
+		    pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_AES_CMAC_LE ||
+		    pneg_ctxt->SigningAlgorithms[i] == SIGNING_ALG_AES_GMAC_LE) {
 			ksmbd_debug(SMB, "Signing Algorithm ID = 0x%x\n",
 				    pneg_ctxt->SigningAlgorithms[i]);
 			conn->signing_negotiated = true;
@@ -2558,6 +2559,23 @@ static int krb5_authenticate(struct ksmbd_work *work,
 }
 #endif
 
+/*
+ * A channel can only be bound to a session signed with AES-GMAC if it
+ * negotiated AES-GMAC too, and the other way round. The status codes are
+ * the ones Windows returns, as checked by smbtorture.
+ */
+static int smb2_check_binding_signing_algorithm(struct ksmbd_conn *conn,
+						struct ksmbd_session *sess)
+{
+	if (sess->signing_algorithm == conn->signing_algorithm)
+		return 0;
+	if (sess->signing_algorithm == SIGNING_ALG_AES_GMAC_LE)
+		return -EPROTO;
+	if (conn->signing_algorithm == SIGNING_ALG_AES_GMAC_LE)
+		return -EOPNOTSUPP;
+	return 0;
+}
+
 int smb2_sess_setup(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
@@ -2615,6 +2633,10 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
+		rc = smb2_check_binding_signing_algorithm(conn, sess);
+		if (rc)
+			goto out_err;
+
 		if (conn->dialect != sess->dialect) {
 			rc = -EINVAL;
 			goto out_err;
@@ -2677,10 +2699,12 @@ int smb2_sess_setup(struct ksmbd_work *work)
 	} else if ((conn->dialect < SMB30_PROT_ID ||
 		    server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL) &&
 		   (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING)) {
+		rc = 0;
 		sess = ksmbd_session_lookup_slowpath(le64_to_cpu(req->hdr.SessionId));
 		if (sess) {
 			int sign_ret;
 
+			rc = smb2_check_binding_signing_algorithm(conn, sess);
 			work->sess = sess;
 			installed = true;
 			if (sess->dialect >= SMB30_PROT_ID)
@@ -2695,7 +2719,8 @@ int smb2_sess_setup(struct ksmbd_work *work)
 				sess = NULL;
 			}
 		}
-		rc = -EACCES;
+		if (!rc)
+			rc = -EACCES;
 		goto out_err;
 	} else {
 		sess = ksmbd_session_lookup(conn,
@@ -2823,12 +2848,16 @@ int smb2_sess_setup(struct ksmbd_work *work)
 		rsp->hdr.Status = STATUS_INSUFFICIENT_RESOURCES;
 	else if (rc == -EOPNOTSUPP)
 		rsp->hdr.Status = STATUS_NOT_SUPPORTED;
+	else if (rc == -EPROTO)
+		rsp->hdr.Status = STATUS_REQUEST_OUT_OF_SEQUENCE;
 	else if (rc == -EKEYREJECTED)
 		rsp->hdr.Status = STATUS_ACCESS_DENIED;
 	else if (rc)
 		rsp->hdr.Status = STATUS_LOGON_FAILURE;
 	if ((rsp->hdr.Status == STATUS_USER_SESSION_DELETED ||
-	     (rsp->hdr.Status == STATUS_INVALID_PARAMETER &&
+	     ((rsp->hdr.Status == STATUS_INVALID_PARAMETER ||
+	       rsp->hdr.Status == STATUS_NOT_SUPPORTED ||
+	       rsp->hdr.Status == STATUS_REQUEST_OUT_OF_SEQUENCE) &&
 	      (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING))) &&
 	    (req->hdr.Flags & SMB2_FLAGS_SIGNED))
 		rsp->hdr.Flags |= SMB2_FLAGS_SIGNED;
-- 
2.43.0

