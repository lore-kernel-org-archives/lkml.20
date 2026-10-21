Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583646;
	b=mUY0iSymcSx1aXG2DYsoIjoNIG2bZ0YsXT5Rdo9CB7ya9M1PKECn6YtZUZN2U9DP+P/o
	 y1a8DwQGsRclIhoNET3IB2iqkhsqwVqpfqi8dMD7W6q4aP1E6kLs3w9VMB3msF2vBLSGP
	 euYnchI9PRt08X9d4qcc6PPbD02o4Sk5d6QnjGI6211JEmUkFqpcoHDpuZkEtIo4lUZ9o
	 0ThFw45DQO+apgPej+N+Y0/AYES78RL+f8Qi2Q11ekYPUznPiN4+0wqGRZfFrwczgy46m
	 XzLL7ZqSoSfuYv5dBf7Xf4gsD8L1dUqdx8ZWDwOfs8H1T6IwQZrQ964UJZsLywL60Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
	b=G0lasJSN5HCmUwg4K/o+b2Eo565YE9+Lb+HHyP1KIqKWGWLUnjjjqwEq0kI4NMuuSIYz
	 hWIFCQkOSHUofIGVx+8c9+AhmxepzpV446kksEAoDzAt70ueYQu9pDak2RB1gRnCGUuXL
	 rugN7Tx4MdgxTSV+gWCpF7neGICqO40ytUBBkoHBIOGJro4Q0aZoCyPnbFu3x10WhnpiE
	 WSc64KkOCeJeE7GHEBgAtChkpbja1eS11d6PESejaWUXfFXjgbNZ9Mq4zWE53kbBqc0qG
	 j+1fL6ONwQtruowchk3Yl/yNBfvuPuwoBBA6LMhUSELAIqv7OT+k5X9pxBUPLPb2NUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fQaHtPW3;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55F606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA55F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fQaHtPW3
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4677aad67bso63162766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583644; x=1793188444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
        b=fQaHtPW35SAPAX1ZgwjLawoatDbVxOsx2Nrww27dOU+l9jUgTNw2h4p0Ee0CHlhmld
         M3g4uY5JL08XETrxU++gX9/QYc9dUU+r/NKHUwTRuwvoBGOwUiRYHFONMNa903UmTl0a
         h2/HGLM1zng7GBtJpaxFGv+lGtmg4GNqeL/u1eY+iEqkaYStQtnJmScUNRl69GmgJaVX
         2CxYjzTOqliW1EE7znJ43U86Xo+rAEOHi2K+a6qXukSxWKvQZeE17k5uhhN9zhcHat7k
         MNckSt/t1InXV4UY87WOPesjJYIlwLwNrbWgMPoPGO66UzZsLu7sndNbfyNKnoXqDd7B
         ViOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583644; x=1793188444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
        b=pg5oZplL8QLtryOTShyebhCP9l1hAw1YbGFUfH9qIcWAXR2C9Y0tR0UPBnhpBCZMhf
         JneKj8g2AqAly/PPmqLQPRbcaI1yauHN5gNc1GCUMp6V2rLuar9YV066thdc2bLMpwlE
         mxAW3/PGlqHGZRYfeDbLzDd0JJGajNy5QCZq71tbHA5AcrMmtNYoE5ar4VGJI8qfpMxW
         1TRcBI/QsNuOT46GPwo8+Vt4gDx9rvNtdsgwNpd23DKAw95FW20k2zdhdCzJt+qrTZdy
         kFfgUqKR83HkYuPYtq/eIptUpl3FrEmBXj9kA54eu+b0P4mvmlu5wuaiGXQTvEq8mz0e
         Lbhg==
X-Forwarded-Encrypted: i=1; AKwUvByaxANNEzOxpQFX8o4RyC5lc1y9NnE7twoDvAGDF00+4cMqIzEF/+32b6mNkm0HjUrWMOfBzx3vXw/S/EM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+qKyaDSJV+kI0/irEeEmIgWXxmOMjLUUWT7RDyk/Hj3ellMa4
	rYmULwHkf1y91JhDDfah1V6uzNGRbZ467oWVpeUvtzHsb9klo2Fitcq+FWMP56190hE=
X-Gm-Gg: AYBFou24y1PocMVFyCVqNcM9JDasZZ02wqOU+WT3Py53tw2LeOQFw4VB2VvxjnJNr7O
	Wgy6G/ODWhX2zaA3CP5FjEzKSAoz9f3NTsZaiCuyOwfPEUJEdzDValAg4CeVEpizrUUlUWSnnvM
	vnisCOpd1c5D/s9w/Ecmb2BDj8j4X2jApxE4L3cd/Rb5GsE5B604I8jC9WNKJdOK8I2VLcl3iLe
	e8+Kpk9pxrc3+wsttE1XonDhrK64FHnPnoU0Utzfay1+5wLdvfavfY2JRdCvGd6N+/BmO18JGjf
	RFqGDt9MkF8IZ9RJjHJlVKOQOJHQnp1tsjHuBC32y4CVeWdnxcHaqu2+/DnizR61lLSKgv8BhuW
	ELTSQKZKLu6W+K/pTZ8PVcTXEmJWhOjb7u/jZU1AhhVtZu+FfOeCfv+pwVfLxRtMxrHl9AkvRa+
	sDqMql+aEeckAj+0hmK0u2h1iZKOQpHPpKzsfXDhZ0LYiDaF61yk4Th+pHbTh4bUPWYHHqgvJ0P
	CKKgbnWzJ5t96YfyyiMrQjli/ThumImpZMDyr+8lEDov1j5OjHh746R1EtskmRNEswwcnVAt9+V
	aDpth7uDTEW7it/vnVUReDgG7Q+CraRNlvweFspDOiWqLZuzdqWC9+cBExwFRcx/Ib1C
X-Received: by 2002:a17:907:868c:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c467979bbffmr167724266b.34.1792583643843;
        Wed, 21 Oct 2026 04:54:03 -0700 (PDT)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77ac4sm69316066b.28.2026.10.21.04.54.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 04:54:03 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
Date: Wed, 21 Oct 2026 13:54:00 +0200
Message-ID: <20261021115400.30885-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Commit a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets
expire") added a __u64 session_expiry field to struct
ksmbd_spnego_authen_response, growing it from 156 to 168 bytes.
ipc_validate_msg() requires the response to have exactly that size, so
the 156-byte response of every released ksmbd-tools, up to 3.5.7, is
dropped and Kerberos session setup fails with STATUS_LOGON_FAILURE.
The other way round, kernels without that commit, including the stable
trees, drop the 168-byte response of current ksmbd-tools master, and
ksmbd-tools has no way to tell which layout a kernel expects.

Pass the expiry in the reserved area of the embedded struct
ksmbd_login_response instead. ksmbd-tools releases with that area
(3.4.4 and later) allocate the response zeroed and never write to it,
so they send an expiry of 0, which ksmbd already treats as no expiry.
The response is 156 bytes again, so it works with those releases, and
every kernel also accepts a response that sets the expiry. Use two
__u32 halves, as the reserved area is only 4-byte aligned.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com/
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
The matching ksmbd-tools change (struct layout and mountd/worker.c)
will follow as a pull request.

Tested with a local MIT KDC and smbclient --use-kerberos=required:

                    3.5.7      master     master + tools change
  7.2               login OK   fails      login OK
  7.3               fails      login OK   fails
  7.3 + this patch  login OK   fails      login OK

With this patch and the tools change, smbtorture smb2.session over
Kerberos (including expire1n/1s/1e, expire2s/2e and expire_disconnect)
and the 190 smbtorture tests run by the ksmbd CI over NTLM give the same
results as 7.3 with ksmbd-tools master, with no kernel warnings. NTLM
logins also work with 3.5.7. A test-only mountd that overrides the
expiry (including values above 2^32), the response size and the length
fields found no wrong session expiry and no kernel warnings in 313
logins.

Current ksmbd-tools master needs the tools change to work with this
patch. If you'd rather the kernel also kept accepting the 168-byte
layout, I can add that in a v2. Only tested with smbclient and
smbtorture on x86_64.

 fs/smb/server/auth.c          | 3 ++-
 fs/smb/server/ksmbd_netlink.h | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 1b24eb3f3998..8e5a1b10db6a 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -464,7 +464,8 @@ int ksmbd_krb5_authenticate(struct ksmbd_session *sess, char *in_blob,
 	memcpy(out_blob, resp->payload + resp->session_key_len,
 	       resp->spnego_blob_len);
 	*out_len = resp->spnego_blob_len;
-	sess->kerberos_expiry = resp->session_expiry;
+	sess->kerberos_expiry = (u64)resp->login_response.session_expiry_hi << 32 |
+				resp->login_response.session_expiry_lo;
 	retval = 0;
 out:
 	kvfree_sensitive(resp, sizeof(*resp) + resp->session_key_len +
diff --git a/fs/smb/server/ksmbd_netlink.h b/fs/smb/server/ksmbd_netlink.h
index 2673522c76bc..fc6af757e45e 100644
--- a/fs/smb/server/ksmbd_netlink.h
+++ b/fs/smb/server/ksmbd_netlink.h
@@ -148,7 +148,9 @@ struct ksmbd_login_response {
 	__u16	status;
 	__u16	hash_sz;			/* hash size */
 	__s8	hash[KSMBD_REQ_MAX_HASH_SZ];	/* password hash */
-	__u32	reserved[16];			/* Reserved room */
+	__u32	session_expiry_lo;	/* Kerberos ticket expiry, SPNEGO only */
+	__u32	session_expiry_hi;
+	__u32	reserved[14];			/* Reserved room */
 };
 
 /*
@@ -286,7 +288,6 @@ struct ksmbd_spnego_authen_response {
 				  * stored in SecurityBuffer of SMB2 SESSION
 				  * SETUP response
 				  */
-	__u64	session_expiry;	/* Kerberos ticket expiry time */
 	__u8	payload[]; /* session key + AP_REP */
 };
 
-- 
2.56.0

