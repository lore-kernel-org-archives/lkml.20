Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253320;
	b=MOpCtYLEIbYJ7xxMunipOniR1tV9w6CoWaUFNEJaMNhy5wT4lvA+Hbig7T/7B5/0yWl6
	 gRT4qQ4UXBCV70iY7QBcqIhvGsUN4UbZBrOk17sh7RSq+LKr4djOXQ78hSjGY99lSfVvK
	 9Ynfi9a8wjfw0GqiN6VXuGrb0uOMm3xrqoy1O/StEpgS3GBz7PeF6Fo9X0YMgRSnmyAbS
	 Nc1m0QJNtNnvYyXK01kO6LqY60kFzyHH0xgH53uqNyJAtQ0E+WSsAm3tDKmLVOq3EtL5a
	 8EfEW1T6Mw741QAIdXhpp80jEGALbmCi1nV9kO4l/gTK3ViLhGGm9BGiezkAJj7fohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pm5tgrvS4mxwXIED4+gFl49LnVQMWhYzlp2m+wLFFK4=;
	b=ndqBWLT3X/akEJiuwRjo6r/gALKeyGX5FYxQ7han3e94YWjDsfRUW4MfzTq8jxn/9E0K
	 vT2xEL/xVnBCp3IFHycod0ErMYFwi3g99AEKoyWEdkLkEU6xmhItyARVQrnkjKC0ZsgK6
	 cd7W35jf4KQo6ZFoDrLRvwVp5JY5vi3KRlUtll4oASUxlbPtvWzye6zz0OVg+hrm12VyS
	 ktHyJdln9JNm+fjj3IoKXAzNCqh7YdCaMDG+NH4pk/krSggnnXWxabqXyyhxjfWgcOfrZ
	 p08g7iE25tFq0EpSYVjf2ZY19Kl5Sr58PcRWULxi8ZiujYV21v0sM8ntra+Ez+AOwzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/Rw7ojk";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E2606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 448E2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/Rw7ojk
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e977109392so7214345ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253319; x=1794858119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm5tgrvS4mxwXIED4+gFl49LnVQMWhYzlp2m+wLFFK4=;
        b=x/Rw7ojkBV1ZHNo3L36EabZCWxrpQADkCWB/M5JmAbPgLZxtm0S5+06vl0pU9NoOjH
         Bi+c2Ke0Js8Faq7w9dLkpyg3yDAQwTgODhQzJmfjV8qkC1bo/3527WmjQBp3MlgOyHgt
         5KR9oSUuJnccwagtpOv9qM0hS35N1wM1jLF0jQyXjs+Sfyg/yL2z2CjniMv4RiIn+tpz
         BglCi6tBprvAgu0CIy5FrO+h04UK8XlMagG8aCgdjFLPNVY0EfOE3tbIjLQ4lvA0AD7M
         jzLtJm0eLNU3yN59dQer1w5GOfiyNvB9xsbe3AEiPjGzZ4HX6NzAocDo1rnmHym8bA5w
         CesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253319; x=1794858119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pm5tgrvS4mxwXIED4+gFl49LnVQMWhYzlp2m+wLFFK4=;
        b=qJjj/SbFjn+m2Ug9t10pXckg77d2HBLneUoEnADqKyjKaasIMS8e4a6GKGmZvSjJkq
         EeMM1h2yQJBe0XIATnFMx3EEZlI8SkO/8cmVlG1IYdgmhnwKiOasekVD6WURsQZ7LzSu
         FTDnO2V0xuWMD/oRRCfd/w3gq/v35PL2+kt1WtH19ui8o64qE7lojquDhQ/p6EHgmLgB
         9VOYNdiSFB5isH22mgtbfLDUAcA/RBEU58nU/SBeJxl4uxQwwNxkkPbHZ+OhQuWbuoY0
         uSqd9D3T7aJoTKzmHQIPMu8+Fh6+KiHARdeUA48ea/raOx/LKt+JKldMr4cBiop4GL63
         vjiw==
X-Forwarded-Encrypted: i=1; AL+hErEsIyYxlMBBCw4cpZBVfB/rI8qgCLzplIOLZiJUdzek6DPtB9169aDKndeaiYBc2YXKTH6/GqdLxT2v97E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hlgVVSYxpxGUmMUcmhmBJwOOuNOSHDLzMPvUKPnbFOd1dDXmD
	cDAomd/Ojk6P3F4UmfSQkuWGQ8kHQhS2sibGqioUTkVgxFdEYsM2DpHv
X-Gm-Gg: AYBFou2EGC8W1KavV5Stb66S3vFvRGRcla4e/pKbjQDaIx5GR7UQJIKKyrtdhtCQ7dH
	0899+35hJ8T/+asb5EbqsUahNAviQvLiRVQwjxg3XNShKNOOopoZ0fibASPeG/NQahPBfzRYVtp
	menm9vxNVUyonN3da00XwdJLA2EDQnsT7cpA+tp2q7DPisLHAjirNnunxUo8Vm/THNCnpw5E/UT
	joM7z4++FBN43icx+yUuISXYvmtnYFDwmI/8jbF9n6XHXV2tHkieNNa2AFaZOndz7f4K9BrtAGk
	ppeIGL4yL7dN8aU7ISEursLdJ05hGxevfrqbzFSzrA1K5NP/U27uWSObhCjtXfYxM6cG+YpDClB
	kadEJFaOtH0TC6zjmyP+Q0JMdWG6R/6wYsKQGlQM0eG5ByuvIVvYHP5N7YOCl8BpFHoPhLhTB3n
	TZbBNW0JV0BZjbFZUJZTQNQ/SrSQGWDIWCVIBqA8TLsVaBTWG9GyOIME7dwJQIbhR3zB5BKgnFs
	8VHjagiH35AjEPY/TKOjniMiIDUiNyEP5wfB0H12kpYVtCouKFhWMut+kg4WKYCPeUdt8XEbyMU
	ekrFeF4dDmQFcPCvv9qT1es/BoBhZrizDYyb3Do8M4DMyvnLBrV1CxNHeDJWiSyW2MuB0Qhpzr4
	YiJrN6L6lVI4qF+CD23xOm2zIIdXjPgh3oPC2xVCWuZYIcMjEs1eLWMc=
X-Received: by 2002:a17:903:1b6c:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2edb92f56a1mr1330285ad.62.1794253319491;
        Mon, 09 Nov 2026 11:41:59 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm1388585ad.13.2026.11.09.11.41.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:41:59 -0800 (PST)
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
Subject: [PATCH v3 1/6] ksmbd: verify the signature of session binding requests
Date: Tue, 10 Nov 2026 02:41:39 +0700
Message-ID: <20261109194144.22814-2-mike.michalo@gmail.com>
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

smb3_check_sign_req() zeroes the Signature field in place to compute
the MAC. Restore it afterwards, as generate_preauth_hash() later hashes
the request as received into the channel's SMB 3.1.1 preauth integrity
hash.

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
 fs/smb/server/smb2pdu.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b084cca8813cc..129a4c5c74f44 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2558,6 +2558,29 @@ static int krb5_authenticate(struct ksmbd_work *work,
 }
 #endif
 
+/*
+ * A binding request must be signed with the signing key of the session it
+ * binds to (MS-SMB2 3.3.5.2.4). Check it before the request is processed
+ * and before any response is signed with that key. The Signature field is
+ * restored afterwards, because SMB 3.1.1 adds the request as received to
+ * the channel's preauth integrity hash.
+ */
+static bool smb2_check_binding_sign_req(struct ksmbd_work *work,
+					struct smb2_hdr *hdr,
+					struct ksmbd_session *sess)
+{
+	struct ksmbd_session *prev_sess = work->sess;
+	char signature[SMB2_SIGNATURE_SIZE];
+	int ret;
+
+	memcpy(signature, hdr->Signature, SMB2_SIGNATURE_SIZE);
+	work->sess = sess;
+	ret = smb3_check_sign_req(work);
+	work->sess = prev_sess;
+	memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
+	return ret;
+}
+
 int smb2_sess_setup(struct ksmbd_work *work)
 {
 	struct ksmbd_conn *conn = work->conn;
@@ -2640,6 +2663,11 @@ int smb2_sess_setup(struct ksmbd_work *work)
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
@@ -2675,7 +2703,7 @@ int smb2_sess_setup(struct ksmbd_work *work)
 
 		conn->binding = true;
 	} else if ((conn->dialect < SMB30_PROT_ID ||
-		    server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL) &&
+		    !(server_conf.flags & KSMBD_GLOBAL_FLAG_SMB3_MULTICHANNEL)) &&
 		   (req->Flags & SMB2_SESSION_REQ_FLAG_BINDING)) {
 		sess = ksmbd_session_lookup_slowpath(le64_to_cpu(req->hdr.SessionId));
 		if (sess) {
-- 
2.43.0

