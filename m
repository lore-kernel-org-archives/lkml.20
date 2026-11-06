Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992002;
	b=k2ViPzinMd7qiNdCrvCP2EetQ6xZn45Q3z2g43VCie0PH/aQb/jXbVFJqWy5J2GtXKSM
	 GvDtMV597VN9xztHp/Lk7YBME7K4V/GeSzCQ9DYc8O3yHyGopXGopKo35Boa9oaHF4EBy
	 QDBxnBBkYfMJCgEE+s4c2aFKGaqYEx0zz0y0OtjadCbQbR6Y2cSl6Qakqm2xCx1XCgrlo
	 fzA/5ea7uJ098/smBVQH6/gScA4FzAu/3vPNF55tlOWRkb9o8zVVn0CTXxaIVTKIb2uAE
	 YdOJ1o+PPrdEbi5AzDy/pyeGKHGT5alqUtBzmsc+fR8Fj0AKkX+HtPuSnaeJsGcGiEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zf/S7tdQ1qGKN7A52dLSJCwU/JAAKqCo7rxpcX/3Ue4=;
	b=ra4BkIijfQJOP611TKOWq8eCDsOzzY9o/TY6DQjWwtq7m5gMq42BtZmGddWRbHlmx2JB
	 Mt3gI01Rva+y3ffJNGK9VADXW0EeG0k34V00MrnCBxwPthsGqRL0ohnEniaI20j9yg8Hz
	 lbHj3rBV8oypDJeFBJWN85V2BAJXilCVimfHRUPc3lKf8WkooXUNn1zF6OlFib372J+CG
	 zA37EgLCkkFPmWHKlHBv7mRvYcStZ6GdCvcV+rVD4+jmK9rdGvon9ZYgUD7I7JmUD9fxU
	 o80pzfb0+FoG4oUfVI3MuIjJe0NY/kqoI1BuarN3LsXGZYwh3ZAUuzHpw0stML4Kh2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTsZ6YAb;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED57606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED57606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTsZ6YAb
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4910b863b84so1442935f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793992000; x=1794596800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf/S7tdQ1qGKN7A52dLSJCwU/JAAKqCo7rxpcX/3Ue4=;
        b=xTsZ6YAbbUvbLWYiiHtssfb55e1KT6gBMmrYpBPgsqwCzLW4FoVOu3UoomP2K9uoMe
         1AR65SR/Lx/jnhktfRVMis7srF3VyNH83mJ7iGWhhDtfiebC80eX8fx27RAsOEeA3Bp+
         qA6mEtFOJVN7Y1a2SNpqcV9a8IMIwI4SbGr3KcyyaTLoJvICm4yPK3NC/y35Df6Oia5E
         H/ZtGXa1OREEucxrebjz9cwcn1TU7Mm7aLvFzWZbCb1lZFk20fo2tmGA7etTH1tttfuw
         oM8bX5/xCS36qxzsXKMjF96sE80RUQLQ4H1P9ZEdfLQnxlqcZZBXH06eaq3jl8zRgTbg
         dl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992000; x=1794596800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zf/S7tdQ1qGKN7A52dLSJCwU/JAAKqCo7rxpcX/3Ue4=;
        b=aFSQRAFPbWtHW1FRB6mP9NfqxBTsoUJa9s38WByS8VtLn5InwnLF94hWzlHItRAuup
         GagdV+T/xz637Be+lQ3WcGWAimTqPmqHjYnL/yOddfgIMNYZOJ4mt6YYQr9x3lITxJ26
         AChSzfUuMC+zoeVjQ9KPvzVUFah+OexFwGQiapZpPz80PEgqsy3dzMZTRrdJGW1ufY7M
         ir0YmlTLEWq7bfLltv8PVeuMzyCzgL8BGPGSd4SRdwg/ABniV1QejJD3aqvX6UHF2XI/
         4RtridsYVqVp1oHWNZ/QoH8oIgCU2d9YjQmt9NdNRfGCAYS3EjXiqQwv6GNzW6BEHxIb
         ZBvA==
X-Forwarded-Encrypted: i=1; AL+hErHzCXP/hGbJAGwYIJhgGvf5AVuf5dXITePoC/HrNz1nCIlo6LGNdpyNmlERjHHRCKXZVtmA4hY2NPOXhf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/FvxRSpz2eNcKGGoIKjTfZ90cZLOqYzgW/AOjsmpQnKzQ9hlg
	NZGsJa98+zqFmCYtx92p2omFBd0aer+qPFRE7lBZt1ZB6F7AyZagq2Vu
X-Gm-Gg: AYBFou14tNyCRyP2ZAUWbrqR2UyxoIrZ0J4VDBpjKj2XRzErUnKdPVywN/2TUe8a8+7
	g373MKnEUwMHj3QBgYYgIHXhIlD0Z5/wzzbZDt1taMBinRGEVuPLtK8n8sTnlwwzb7jGOQcFexb
	7Rcm3SgyMSK+G+J691Q3APnkO9cHRw0jTjVv8fCNaTSC1m7uzH8Nx9G+iRispOg+wuBKCsqSzRM
	hiUaX6/5oeLcwwsLYBK3LUlZs+ak2YULd0y6AekZUa+idTqdjfV8Ij3dOA/xFUlQSxM91j9Boo4
	kp93V3ynfYXsQ39fE8c2as1fTQGhwuV9ZoaX6baJNGMCz/2YrRSx3jIkjdegxfdmbGCSzAdvi5W
	436WkDEmnZYlLKmqHsKHAaE+8hoGioUg6IH3Fjw3XPSOGGON2utd5k7g8N8K5A0/xUcpwl/oAGu
	qcNf237TbcEof3c5PpFGegsQAxZJ7V+pOqyoR96TAqlz2WdoiLdb3r+vGIyUYBGc4FiEGGZYrXZ
	idtWYLY5jF9zlYVtau1kzDe5kwqXdMNiPI3Gp98APg/QIiq06ldsSgKoIh5BOGdaBySkLd7AzHB
	UMxIivGfuujiyxOHEcp3w/80t2Jh6h8canGPPSQiPguT6I3DngPsIJYYiNZc/DfV92YJZHV4QHO
	/+Q7XrkDQ+i8iu8Q=
X-Received: by 2002:a05:6000:46c6:b0:491:632f:2c8f with SMTP id ffacd0b85a97d-491633e73c5mr8755775f8f.2.1793992000382;
        Fri, 06 Nov 2026 11:06:40 -0800 (PST)
Received: from localhost.localdomain ([74.244.226.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4930a5a91dbsm3960533f8f.35.2026.11.06.11.06.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 11:06:39 -0800 (PST)
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
Subject: [PATCH v2 1/4] ksmbd: verify the signature of session binding requests
Date: Fri,  6 Nov 2026 20:06:19 +0100
Message-ID: <20261106190622.20990-2-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106190622.20990-1-mike.michalo@gmail.com>
References: <20261103171742.18816-1-icb@fastmail.org>
 <20261106190622.20990-1-mike.michalo@gmail.com>
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

The non-multichannel branch already checks the signature before it
rejects the request, so only the multichannel branch changes.

An AI assistant was used to draft the patch and as an independent
reviewer.

Reported-by: Ian Bridges <icb@fastmail.org>
Closes: https://lore.kernel.org/all/20261103171742.18816-1-icb@fastmail.org/
Fixes: f5a544e3bab7 ("ksmbd: add support for SMB3 multichannel")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/smb2pdu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b084cca8813c..211dbcdca8df 100644
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
-- 
2.43.0

