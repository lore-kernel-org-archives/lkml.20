Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329952;
	b=QWWH1lgmYkpMDacgEGciXsqufasMItPOmwjj5fdzLI+ED5iSbx+7p+5WN38vSxvKopBn
	 4vura5/g63dHsid+Ud9tuRJMpyZyMnGQZAJyYDkGi4JnYVLcrJTkmHn3uB1fmKpQRCeYK
	 Zhi2HdKp6mB2K5DZ12UJCyvAJTaZJ9yhOJirQ/vafxSTF77zk1tddwfi9LpdwDF+bmkDI
	 bH/7jr3j6tSAsSWXxX9glexpu8pIqT3GJHzxUejrJo8ESzv6xTm/Nn0xa1RDaQ4dGQvHK
	 FrkNKsKkDd1+6aepi8r/6acI5i2+eg8RdHuu+P8mDJU8cv45qjcLWyfNZp9PJytWMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D45L3fPRhObdeDNJWurd+/N9L/g975IX6M+u32F2JVg=;
	b=QgPUVVScPwzjkCxmvx3DzsqxanihrArYAodpgY+iAdyIltC9rFpJ3qSK8H3QUaAn+wJ3
	 0u2XXpVUMVhKl4s0D/O71bsFayL0b7FkHZc+B/3eqwBnxmKTkSzrKkQud/+CuSyKrh90E
	 9fH6aHBgeh8DhJhpui92ry7r3YPjHTLukgyLRPkB3aKMBTXHVzkfZfAUhAHnWNjr7Rig6
	 hEvaWRBgdPEmZ+IoYGbNHcK/UjmA7yiO0gIh2SjM+hgKRU/3dTglhb2NqYT1XMs+I42XM
	 CKZQZ8ABappPtxJEDOr7T1E048lAk8syRp0wrk8+++Y6R0jilf7Jo03x8YMiYLcMeMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAyoIJWQ;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDD606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFDD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAyoIJWQ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b904d10882so1023890b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329951; x=1794934751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D45L3fPRhObdeDNJWurd+/N9L/g975IX6M+u32F2JVg=;
        b=AAyoIJWQn9m194HohnVrgyQmygSrD2P8CKEjj6TTNjNFgBn80wxvkQiAw2asly+02h
         I+65I6e6wSSrpHMKlFJs5ItvELIQPhOGvJC8u7FZxxnuFYzkhBd8tWmJwCM/0R8UtvyY
         tF+g6Bwk5r2+klsXTahj7DsxxdBa5NfRIkN80i//f6S/zEUDlmvP2T6F31Bxg7NbYQNc
         BhsjjUxiLJXbdsZThvvI62AwOcfYs95PE9FtJ6VwgVto9OqjkHb3xUhf5TpyU7X7uX8n
         atwgZILm/mlFq+50OCGeZl5pa6DfuQnoJcvoZYg5Vc3E7zA1s8ATwTVweaHyYpt5pAon
         JQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329951; x=1794934751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D45L3fPRhObdeDNJWurd+/N9L/g975IX6M+u32F2JVg=;
        b=m+xF3FooN1/cnyZ5r0VKKEJl+i4Bi1E4ZLfstYhW4GQDkJxAnNhnSMsNhdnbZd/Apu
         MJZLjdi792jfa7AsYap+IXa9FTE7WCKnMzievTKWp3iZz0pbTSKaAAxMqADQuIstSFXe
         zSDNjdr4VAFvTDw8bkZEoCUI+pwdKtn0lpNyIzpXtb6NvSM2zsWeo1DxBJy9OhBY1seo
         Do15Wvm14dnJqLIVzWOu9/wwHB0ZFAWExeW/SryZn72v/hb+pPEHLb6dEw0jIgqsURCL
         knBLj2DKQOH7PVETpzLNXwWBE/W6mRfVDRblQZPW97Ott9N1b88vILK7rrXk9jYVRjuj
         iGmg==
X-Forwarded-Encrypted: i=1; AL+hErEWIhCLdJsdDK08awI/aVL6vHzPtdaBwl4EXJxt3qF5551AJtoaOI84b4xD3iWvt0AyihPmebFKHJQGIJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pC0TL5IvQw0uyfPUUGVz+1BGu5+LxbJZS5xwqMgMQY6rF4Oy9
	S/zv3PlQyL/xobPF6eJVrZvAhu5AxqqeemI6P3Ap7q9pX6X57xUnXWG7
X-Gm-Gg: AYBFou2AItGJNqYrTtkJlZsot8TB2tgioDKOj0clNNQPg2MCKe016sYn+YtThWJiT/r
	+dk8py8eW04rlhpUMC8FmiKYghQymvEfkaOYZSY/XyysV6/XcbcuJmo/1zlzp3dlwx38MNCYVTN
	9tFptcwPC5eaL2MBjela0DqXh2DhG/tTL3htKoJaZgyI8aGYYWcQ784Uke2saB5J6ol7usFtjig
	Ts9KKhUBuvfoax9etisrCqXgugTGx4RC3DSQNDRFjnIGUkSn5IYT4jzreIUleWkdElrn/oXrvw/
	1SXhlhwlzJk3bC9frcHX3o7yuFwJavsaaTP9gixQDJaFQ7IHnGe18X43hPbUAr96Hhtus68Y/q7
	VyCR0qSMuCeUNalvUYjWZhNyJ3bOTQr6HW1+n8qTlliXf0oapTTkJd7pLE7PPsOKQgTDPrYOeh3
	hk08Mq1c+YqisAAkFCl3niErmH2nQcNCtY0SxbEWTu2uJkpk4f0y7qyp0AJwDkjnGaq2iAU9e/z
	yG15w9ZMkxHpGDyvZRo3pnAYl4BKH9u/8BgdVr1Y5U5i0sBC2ICD1GXj4Cy9QCXd+ODKLyXACxQ
	SpMFiCJ0f7YbppO3AeF78PK6yXSKkqSFRiND6yP+kVnOsyxHqzSx5xFwyPfvrzKPXQDnwYrMZIy
	59Yv9vqNJW2SdSl94reT9DrDuXatvSLQhep9dcQ+n1CA7zleHe3qvpIo=
X-Received: by 2002:a05:6a00:3a1c:b0:8b5:7fc8:866f with SMTP id d2e1a72fcca58-8ba8773de56mr3437547b3a.44.1794329950745;
        Tue, 10 Nov 2026 08:59:10 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fd5c6sm1157154b3a.46.2026.11.10.08.59.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:59:10 -0800 (PST)
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
Subject: [PATCH v4 4/6] ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
Date: Tue, 10 Nov 2026 23:58:32 +0700
Message-ID: <20261110165834.28162-5-mike.michalo@gmail.com>
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

When a session's Kerberos ticket has expired, smb2_check_user_session()
returns -EKEYEXPIRED and __handle_ksmbd_work() signs the
STATUS_NETWORK_SESSION_EXPIRED response if the request has
SMB2_FLAGS_SIGNED set. This happens before __process_request(), which
is where the MessageId and the request signature are checked. So the
response is signed with the session's key for a request whose
signature was never verified, at a MessageId that was never checked.

Anyone who can inject requests into the connection can then get
responses signed with that key at MessageIds of their choice: a
signing oracle. Reauthentication keeps the session's keys, so the effect
lasts for the rest of the session.

MS-SMB2 checks the MessageId (3.3.5.2.3) and the signature (3.3.5.2.4)
before the session (3.3.5.2.9). Do the same: sign the response only if
the request passes both checks, and otherwise answer with an unsigned
STATUS_INVALID_PARAMETER or STATUS_ACCESS_DENIED, as
__process_request() does.

For a later command of a compound, the response that is current at this
point is still the previous one, so the old code re-signed that response
instead. Leave the expired response of such a command unsigned.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Reported-by: Ian Bridges <icb@fastmail.org>
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 064f99427ca6f..276dbbd986503 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -107,6 +107,32 @@ static inline int check_conn_state(struct ksmbd_work *work)
 	return 0;
 }
 
+/*
+ * The keys of a session whose Kerberos ticket has expired are still valid,
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
+ * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
+ * signs a response to a request it did not sign.
+ */
+static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
+{
+	struct ksmbd_conn *conn = work->conn;
+
+	/*
+	 * For a later command of a compound, the current response is still
+	 * the previous one here, so signing would corrupt that response.
+	 * Leave this one unsigned.
+	 */
+	if (work->next_smb2_rcv_hdr_off)
+		return;
+
+	if (ksmbd_verify_smb_message(work))
+		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
+	else if (!conn->ops->check_sign_req(work))
+		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
+	else
+		conn->ops->set_sign_rsp(work);
+}
+
 #define SERVER_HANDLER_CONTINUE		0
 #define SERVER_HANDLER_ABORT		1
 
@@ -265,7 +291,7 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 					rsp_hdr = ksmbd_resp_buf_curr(work);
 					if (rc == -EKEYEXPIRED && work->sess &&
 					    conn->ops->set_sign_rsp)
-						conn->ops->set_sign_rsp(work);
+						ksmbd_sign_expired_rsp(work);
 					else
 						rsp_hdr->Flags |= SMB2_FLAGS_SIGNED;
 				}
-- 
2.43.0

