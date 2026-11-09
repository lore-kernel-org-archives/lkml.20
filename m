Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254302;
	b=jgpApzpQIKoEfKeE757GBbs41nh1PkLIvFTa8L0sbA1p2tvWUBMdu4VJmQm+FBnaAh9x
	 BHZTHZxJATlL/9DgaNMqlX62u9lw5Wc1caOJg7RA1QlChgXAbkvcSH+qaAPzjG2fop2eW
	 ZOb/5tPTJMq9DRh/cAbjKqag1k+WJlIeBLY7gPlXFw9D0g+MMkqW6CHLchLACFdkvIxxh
	 zfvVz4c4/hJ+clsee/5SDZJqutJ78+juHEmJnIFK88G0zfwgWSae2pBmMfyvCYKX6c4r/
	 QEmvnpIgSxs/3/lJh758ygM6iy3/XCOidkjGx6/Qmyfvp9AV72BQTJ/ys6Upw2nJWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LjlIdWOtAx4vgBSOIZMhE9Gxzn2GjEyrd7gwD+Ba4Y0=;
	b=Fl58cxKJcwdW6iq2O3YH44LkWqM9c4dNS4/pNJu/x2Ml3yrENj11U931ghkzRafI2RPl
	 pdoqZmjLGZS6e5Q7VTk4U7fOQW4N9sMB+n4DQ0XCFwFp5K1Yo/ttRAWHCTPmahIoJ7sxP
	 x1o3XpsIq0wuCrtXbYR8Kc+OdBkihKD5uDY5BPeDmOVUH48p/vmYNN38SZUxN+6KGzQlQ
	 um8XoczjM91hmVqJnAZ1x0J7YHbdfRkESlfFmTAtUSWl1vnLGoGAA8ScjQdZRUn1jhk31
	 Vj9qUbvxKcZoGDCLa90whLY+T8NYR6umCnb3gwp3Bt7gtDEQ/eCcHu+J6IJuJAricBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R/1WuOAu";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E262606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E262606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R/1WuOAu
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso573538a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254302; x=1794859102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjlIdWOtAx4vgBSOIZMhE9Gxzn2GjEyrd7gwD+Ba4Y0=;
        b=R/1WuOAuCnN/JHW6ktRQlo8KATUbKPdmjv9knkQlezuppBKQ2QFjLENs6otezsL2xP
         eTi11KqJIzewO8F4GEX9Pf6o4wLrfbGRV4H9OSeZy3ikk84qdvC4VMdEMg/MHDhDNLVv
         yv4ssmwMsCkU4txSd9s/sNEluf8Pigwe2x3/j3/gXS/kK2AAnjAD+0PdFvTVfnpnzLh/
         fBvyKMdHhUoSFRmcYglCQljvABVmnVeCkXj1NCgIQil7Gk/POjf49qomsOEd0fN8NByQ
         wbFuKhXBaMycT4NEbjJxj+bT9JfZWmsfDPrZ9S7aOK25smaHJEJaVgMkSFajcl+3hg6B
         jaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254302; x=1794859102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjlIdWOtAx4vgBSOIZMhE9Gxzn2GjEyrd7gwD+Ba4Y0=;
        b=ETBMJbglcuKEeBOKktsIcEXugwEx5j3v0/L1zBpRlfdw4y1pZGEluEl6SK8oaLoEaP
         qB4TQD3TOCBLIuA/O2eyVxwiWG2d2+bLvkN7MUe4uFrSxeAFbzo9arH8w53rMfAvVoov
         Aex+2VglDfgNrbnDhouq0nnRtC91/ErwkrZlsxG/GB3rDgzJ1IfLZtQE/dZVSc5YIqjK
         TZ3y7ZDMxX/rTbXSJNo+cfjkRkAHBKwUeN/fDNYQc554DNj+o0S+uITq6f19eCOc2qLX
         HQG/KmaNEsn5Dew8msj8MxLFEfVC67PznI/bIgRRLU2cSO4h4vKoAbMMFfV1V4Hjwn2N
         fpGw==
X-Forwarded-Encrypted: i=1; AL+hErFexQ21maLDTBvM3v5v4+99Lis5qqsI6W3c2iH6GfdQ2kFRA5xXRHTMXTXQ/mTKMfOYk31S5HpfaFEEbz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P1SKazkujI0oYPFB7SqiDq58ihZqSJQH2wOI/hsvtHZRhovkb
	gzLql5YhDQnJz6T3a6SQgBbhm2osbqTIlSlDSTmzeuaQKOIIf4hsLm8e
X-Gm-Gg: AYBFou1WkAhLdMK7l1j6AW3dQ9UwduQ6K6YuMwxlJdfUTICjIhNU1bTjIWXn+PX9ojJ
	1J05UARBRDhGiVHm5uWbIpDvMKIQp0iM3Yp16xaKHRKPaJGndNpRG13MkD3+0+XcS4isdzr1yB4
	hINR/x2xd0iaMEIvKCgb766WGA2MMnK2hL0nxw6XqxkcTJbMpE1B3tX7wm6A6xEPm4OrKCqb7AY
	VyQuC8yG7+yp0beOq9App4iqPVbBuv5qfjLOCSb7/6GmbjKAlQXHv/q7mL89LSInIUO5wxnZakz
	iWxjve7KygQiYzl4cL5VyntHA7YdJEhCZr9H0fRpdO6+5sT6odXAuwpar2mPb8XN31LwftU+Vup
	hNJnxG7R/2iq8/1q39+UJHkXsBdtHzn3MciHpXwEQtcoRJRS0Mj9JytcVSmb2zYiK4/sCtu9NDz
	JwlqiRhjfJ0/2K9yyTGKiRwkfrTLSQ96bCOxS98m5FCYfoUqfO1OUtnXBHPw5hDLhr6gvHTFG06
	nsdKKPifrjP3gb7jB2YCK62eX13Ao41ZV1xJNAyaET8b9v5CLHg8PcFLDbaCmILnlkf1aOV8qNz
	W2EFpLpZp3eg7W8WchMJyLU3d88iPxIFE1tUCwQgWhLlQspV4rFbFH9toAAWYjRiovU/6hkHGUW
	FTYLiAATQMojBKlwCZMI60MOEFtAPs9KoqPD//EQmfmoKnvo/lXulcro=
X-Received: by 2002:a05:6a21:110:b0:3e2:4e6e:6ca3 with SMTP id adf61e73a8af0-3f18fb8127amr165601637.34.1794254301572;
        Mon, 09 Nov 2026 11:58:21 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a7fbesm61629b3a.11.2026.11.09.11.58.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:58:21 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
	stfrench@microsoft.com
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ksmbd: refuse reauthentication of an expired session as another user
Date: Tue, 10 Nov 2026 02:58:13 +0700
Message-ID: <20261109195813.24238-1-mike.michalo@gmail.com>
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

When a Kerberos session expires, its owner can reauthenticate it. For an
NTLM reauthentication, ntlm_authenticate() only compares the new user with
sess->user when the session is still valid. An expired session is in
SMB2_SESSION_IN_PROGRESS during the reauthentication, so it takes the
other branch and simply sets sess->user to the new user:

- the session's open files, tree connects and other state, created under
  the original user's identity, now belong to whichever user just
  authenticated, and a later Kerberos reauthentication is compared
  against that user rather than the original one;
- the original struct ksmbd_user is overwritten without being freed.

krb5_authenticate() already refuses a different user in this case, and
the valid-session branch of ntlm_authenticate() does too. Do the same for
an expired session: compare with the existing user and refuse a different
one with -EKEYREJECTED, freeing the newly looked-up user either way.

An AI assistant was used to find and fix this and as an independent
reviewer.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/smb2pdu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b084cca8813cc..234439c1526f9 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2365,6 +2365,17 @@ static int ntlm_authenticate(struct ksmbd_work *work,
 			return -EKEYREJECTED;
 		}
 		ksmbd_free_user(user);
+	} else if (sess->user) {
+		/*
+		 * Reauthentication of an expired session: as for a valid
+		 * session, and as krb5_authenticate() does, it must be by the
+		 * same user. Replacing sess->user would also leak the old one.
+		 */
+		if (!ksmbd_compare_user(sess->user, user)) {
+			ksmbd_free_user(user);
+			return -EKEYREJECTED;
+		}
+		ksmbd_free_user(user);
 	} else {
 		sess->user = user;
 	}
-- 
2.43.0

