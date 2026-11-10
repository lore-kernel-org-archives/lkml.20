Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329935;
	b=KC6RtPpeEvBTb7dj4cRZVMMth7z95Y3057bXuzrWtP4fKClJKsqv6kOsIaMwAlziyzvU
	 7IWvrsVV0/voGn0Tz07ifDGBxk3S3gnhTC9H9olkF5DmAWyweg0Nqq9hOVqxwHU63texS
	 oqS4ot0LKGFoY58U5zVwbKCsu/HM/XAUu0kbb6xNw2FeQARjXRUEO4beyIEGQvTgvn6t6
	 7rxZ2RM1H6zuyniQS2bSQeLnbVyl4clP+GRQfuMRQvkmI+0zWd+7XNgmlMZoROtB0oyAH
	 Ot9aYJlv4gFktuCr5cK+7Onp7mIhbTmsH/gIuPrToPRex/xWGvFqp4te6MVKX+Tx0MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cGmjhpqgPuXABcOPakX/g3GsnUA5UpZR8hxGr7WdBrU=;
	b=ur5Pi0lsinEehukCWFvZUNhcF4sHKII4DP6KQdGzO1l086Fxbc+U7s18c+TgKMJcSIHw
	 TrjGsyOvMIFRgAQnROYJh58ypkWsrrBVLT6ihplS13QdoYYkUezWktTURDfZms0eQtefI
	 rAUb1sPL8wsoGbPKyckraMVXVL66mHd7FtLbVhToBTWsgDr64HP+w0qmHs4V92mlxo+Qv
	 W7Ul8hy+UKQVhuT9UHpdWvyxRLbpQOOCCkf0RaKU4B5IX17bSZ+cCMYTz2Y0AWSlH+AWy
	 1PlLGwdFtdLjcORei83yo1NDkc1C9t4pLKBwhcHqEXHzAuXYhNSl9VUKIJwQ8A2H+dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB8T5I5E;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F69606A805
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F69606A805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB8T5I5E
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so2009908b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329934; x=1794934734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGmjhpqgPuXABcOPakX/g3GsnUA5UpZR8hxGr7WdBrU=;
        b=PB8T5I5EjGz0Oxzx4XGEh/kLtXi37ShAQFX1EeMTVSR6GJf/VQGSiKTQE/tuAfnvCw
         ownVd71Ft1BPWF/aWHfSgOMI44nLwYqq5h3EMi21sBA8uxauVSs8HNZD5WSTtZV+NNyB
         0M59SFYCbK5zz6KRlBJqYsOQwWVccn36VW8PL7p1KNevOuJAm6tSHkrz2WbRH8eNngkU
         Cl5V8AEhAbR8k0vz+atXSG1wSyO2L1TzZRvL7h9VXd6eO36C/rRzNaNaYaeqpJHNsTUV
         5g8Fz+IAhSTFSj22rQN4w4iu2FFLQcJcuIYoTyBAQLyDUmIIAVsTsl8PjXSPk8fABTVM
         bBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329934; x=1794934734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGmjhpqgPuXABcOPakX/g3GsnUA5UpZR8hxGr7WdBrU=;
        b=TZ2yRM2H0SHsvQhnwiD70dhQdkME/ZRGntBvmtfarmk5l7cNtM4P9rPE9/CE5VwDfr
         +CDGtfvmCg2UdM2/PwNFL/OA9NM5WGUmC8PESlzlPVWhZb5EMbMa1mrQjr2ESw1smux+
         SmxD1IZpd/NiTlkxrJOT4+qkdx2/Y3sILIK0fJpAOG7LHf8klWhVSMQtRgJePrlm3zQR
         Q2oAVYJn4RMpPraAQOx1ngp3X4asvFkIwrw6IISv+ZlkmE3cWpTKeRfQzL26EsIihZN+
         NzaKoMBFHK/QfVbwxYzg+L9fH3S80a08yEtKrI/KVGaPkjZSavAzzmCoa2bSckeeSFoM
         qpQg==
X-Forwarded-Encrypted: i=1; AL+hErFAQj5uNGLO/urkaTNRkUQu+MrzpQcZ0A+Mhq6Yi0y2Wxw677WfkK57W8c5cJV14A093555xlBEFJYThWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RN1QOo/25Vxx/TgzHM6lK9qPzNgoDRhc+Lblomj17kcomW82j
	bXwvQKWUE4T5r+1PlNa4PDsC19Brhnb6hs+kh9px0KLdp2GP+46gfJwN
X-Gm-Gg: AYBFou0traYM2s+WyTZBLcoBIQjppH+uYxfmCYWg70Hf/0Xl8/lRPqIyNdHQd9GA5AU
	V6BzMvQrO91W7+Rt5aTpqAb7qJI6dwiK0uH7jcrVG/7oVjfAUl0n4UYnf7jPiAy94LTC8BTVIY6
	NxHjGSFjDxlB7NK7a8TG4JSWU54mXp36nBT5HrQFsKMq3GMJnDnxobj+E4snH3z+wXDOhU2BehO
	mPKvgRHoIWm8XjO37nDSatbxlPEWPWkYp0VJSZnmCTqGIsKVBN1aKiy+ncC/7erIQpkXqwef03A
	4DkKkOqCQH+ZrYl0xFRHVjcMcHEUSwRc6JNuXjM7N3LY6dxQcbAtubVVH9TrhulRtQpu1+xaP7Z
	tqoAOa1KgTdl55/as9W8SOnE7szQMDcltKziFrIOco3skvnjRzMUTYd92ohKasWUogXolX7Eqyv
	5YEHEb5/cUZVc5PUWTK1V+8vNoH+YT2/6BWiXUPjneA3iOZtI3fOC0/br79hXkTeRff/ee7BwtT
	xCCVGKR7HnfIT5vvKJ/rNDiB6SOw08/E40x2UAviVEUiHTYoTCsk2i2zHBrPsJc6+ID6kLfm4tp
	8nmCOKOlEXE41bGpXseDpdm3vl67l/hKnqmqQkvW6xrB2wDUy5Y8hadqEPCVjehQhcYyc0/p6Ay
	ejka6nZbOSNACmXAJwwyvM4dm6GxOIuRzdfZFWqGzDxK3X/zPK62Q2V4=
X-Received: by 2002:a05:6a00:2e2a:b0:8a0:5d6f:8a9d with SMTP id d2e1a72fcca58-8ba89d27effmr3247039b3a.35.1794329934301;
        Tue, 10 Nov 2026 08:58:54 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fd5c6sm1157154b3a.46.2026.11.10.08.58.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:58:51 -0800 (PST)
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
Subject: [PATCH v4 1/6] ksmbd: verify the signature of session binding requests
Date: Tue, 10 Nov 2026 23:58:29 +0700
Message-ID: <20261110165834.28162-2-mike.michalo@gmail.com>
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
MessageId of their choice. With AES-CMAC this is a signing oracle. With
AES-GMAC the nonce is the MessageId, so it also lets two different
messages be authenticated under the same key and nonce, which reveals
the GHASH key and allows forging signatures for that session.

MS-SMB2 3.3.5.2.4 requires the server to verify a binding request with
Session.SigningKey and to fail it with STATUS_ACCESS_DENIED if that
fails. Do so before the request is processed further. The failure
response is not signed, because work->sess is only set once the
request has been accepted.

smb2_check_sign_req() and smb3_check_sign_req() zero the Signature
field in place to compute the MAC. Restore it in both before they
return, as generate_preauth_hash() later hashes the request as received
into the channel's SMB 3.1.1 preauth integrity hash.

The other binding branch, which rejects a binding request that is not a
valid multichannel bind, verifies the signature as well. A missing
negation on the multichannel flag made that branch unreachable for an
SMB 3.x request when multichannel is disabled: such a request fell
through to the reauthentication path instead and was answered with an
unsigned STATUS_USER_SESSION_DELETED. Correct the condition so the
request is verified and rejected there.

An AI assistant was used to draft the patch and as an independent
reviewer.

Reported-by: Ian Bridges <icb@fastmail.org>
Closes: https://lore.kernel.org/all/20261103171742.18816-1-icb@fastmail.org/
Fixes: f5a544e3bab7 ("ksmbd: add support for SMB3 multichannel")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/smb2pdu.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b084cca8813cc..053f3eb398f5a 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2558,6 +2558,24 @@ static int krb5_authenticate(struct ksmbd_work *work,
 }
 #endif
 
+/*
+ * A binding request must be signed with the signing key of the session it
+ * binds to (MS-SMB2 3.3.5.2.4). Check it before the request is processed
+ * and before any response is signed with that key.
+ */
+static bool smb2_check_binding_sign_req(struct ksmbd_work *work,
+					struct smb2_hdr *hdr,
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
@@ -2640,6 +2658,11 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
+		if (!smb2_check_binding_sign_req(work, &req->hdr, sess)) {
+			rc = -EKEYREJECTED;
+			goto out_err;
+		}
+
 		if (memcmp(conn->ClientGUID, sess->ClientGUID,
 			    SMB2_CLIENT_GUID_SIZE)) {
 			rc = -ENOENT;
@@ -2675,7 +2698,7 @@ int smb2_sess_setup(struct ksmbd_work *work)
 
 		conn->binding = true;
 	} else if ((conn->dialect < SMB30_PROT_ID ||
-		    server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL) &&
+		    !(server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL)) &&
 		   (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING)) {
 		sess = ksmbd_session_lookup_slowpath(le64_to_cpu(req->hdr.SessionId));
 		if (sess) {
@@ -12853,6 +12876,8 @@ int smb2_check_sign_req(struct ksmbd_work *work)
 
 	ksmbd_sign_smb2_pdu(work->conn, work->sess->sess_key, iov, 1,
 			    signature);
+	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
+	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
@@ -12972,6 +12997,8 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	iov[0].iov_len = len;
 
 	ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature);
+	/* Restore the request as received, for the SMB 3.1.1 preauth hash */
+	memcpy(hdr->Signature, signature_req, SMB2_SIGNATURE_SIZE);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
-- 
2.43.0

