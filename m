Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512874;
	b=4GXNDznWnmX54crBy8jQ3UWRL4E8BF7FmQzP4dCaQteY1aiZbUDu98WgFlX9S/BO3I1O
	 FMd9GwnXmgtYftCU9ePsfzbBe1mf8AckHmLlm+9jwWQO9MhPC3NSGrVr58pynGsQwlvFJ
	 HqlnFZI/gEerOVEdg31awCW5g9NA6aZOvkiSiTqi0cgtoEkM9hrG8zMJmCg+wAPt68hDP
	 XKXZWkzqtvBY/T31WG0WmuNC3XcarlAgoFNq5b3TnsdjrD9jAjaZSANE0+xRD+NvpXgpn
	 eoGQZ/H6TIBRrCCFFiXBsI78m+F9RKRHO29vgBCBdzxt4k/pbw1BSbd6ChkxNFNyBJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d/WZP9qM01vcu0iQY3R3zS6LO6sreSjN5qCF0e0Ekh4=;
	b=fDlmKzORxwPl7SMnI9oy+L7vP/9SqGdrFh7eqNbi6Af8zPPpOZcQBxuvlYFTTBt5PQJk
	 bfH4QrQn6g/JODlOOuxrnBkjLIBojZMsabZ//+adGGjMURJtOrRNAbj2INldyFH5i4EVo
	 4huypLsA59zbOFlHWRSsIX6AcyK7ZJyYvLr+iNFaAaXlFeGNQe1PVKO1p9QKPkRM17FhU
	 ZeY3pkZRHfbmPf7YGn5lYnwb9bIKeoKZfRDyZyIdR92pToHi/OrBbvwwA3NKhX9MH5UTU
	 OclT879wQQ49H2Vnb3KiC1RyKfJM+uVzfGu8om2QD4dtSoBFSJTH+7kMU8Pp2fsG63A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3bxZrcN;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3C0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3bxZrcN
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso143164a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794512873; x=1795117673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/WZP9qM01vcu0iQY3R3zS6LO6sreSjN5qCF0e0Ekh4=;
        b=y3bxZrcNobyjj6gh4ZbLbGfWGGBHOmGYqRc9kybj3NjnsJYkuynSeg2mi09OqnGtZN
         yDiqHTPSP3UTpC1cyEnIXEM8S6IP65y6FRvTtWh+JGi9+GzyUeDqxqKU7MMMNSTSberR
         qlSUY3f0PpVd/VBih7VjoFCGL/OYpMkPtkNo93MineN8I3NPNF0eIavAUPsv86tM+qFh
         sVPLSHjkWVBXtcMG1nQ7HrIFiKBfWWXj22UCa/MqB3ShqTDCflC9Q5rsCTLxGjkQYBrt
         FfGpoQlYtt36FY7TbKnhh/xUEv0om8e0brg6G/DEQjmm5t46xLEQtzwW9arBwLiq2uQ7
         zvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794512873; x=1795117673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/WZP9qM01vcu0iQY3R3zS6LO6sreSjN5qCF0e0Ekh4=;
        b=kbvqgioEm1AdAfAKDhfUjwWq/aOK952qLGRfWh33lvtCTJ1S78bSBoOcTOegVk2W1U
         V3Pf6Mdoay9yYWR5XbxSZWRRke5RTj4xXzVf9vFpAlLipbnawsnN+2d4C237qM7Mshje
         l+l9Q/bSsDgme/KsSbam8+YZdJjtqf09fo69TfYj0sO5GPHFGB1SGGQAFaMX78PQzpoL
         Jv80r6bcIfwyViprK5Jaq0oYYCejRHyhwgoNR/Bh01GQOKC5CILuOpe24R82XPnW3lm+
         4lLfoTop0mk5l2xY4dbD4DNoHkHt40Y6SEIS+272oI+kZpPlM9HZqGGEgjwkBIp3IaD1
         JtNw==
X-Forwarded-Encrypted: i=1; AL+hErENkrnwap0SkhfySnotHBL+jVBeBNrsAqfYzPxFevTYQesNjceXlB5hJ1P1MM/sbaSGLsMU/9K9Pdzn8d8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x2UwVIbBfZ7DtSPTGcthRLePHWwxXC0xLs5hvvvcSC2gS4LVK
	H2VZwy8zxP/MbKZFHw0tKsQHQ4MA84KIvpnxwXbCP9qmyyUG2H9lHqXI8uoBVJgcVE+y0lb5
X-Gm-Gg: AYBFou1DU5FcA2o9mE/A9N9XFjfKGU4SvAD+5RPl6wkb2JtuFKls1Qw3pNzkpiRuK4R
	6249+kxMCY+PzZoak4oVQBsmtEMw1yx8iPx3YWBHkYlcNqywZL1CEppSrABsM00FoZsGymr1Ux/
	graMKb2VsnhwA6JEj+2r1sq1uaXxxCQmSROra+kVjp11+b366P8Ie6kwxavO05kYzRcxW2JrgY2
	O5Wl+bdh40W7bK3CZLhgZiyde2bsQJRKfsHwimcz4+yssivw2Qwz17wVY/qUw2kEhlUiIk5Wr1v
	y6VcTHEJsX0e50FQMFUfl3tTAE7hTwhRmnbRJaN0UKtlypNJFc2roXsgz3c60ISLyyRNkZ6RYVd
	gF6kEkXBLVkEAVvVgGMv7eNpnK+VnQ1uB20HMH7iu/2Mxq6AVsyKFLmf7C9eZvb1A1Q1w1FlzjI
	0klObYsF4VyN3GD4orWtDveEtxb57uDtc9vtOFeW1YXF8HLPK/ozsmtyVW3hbq6QHsWyuqomNsy
	qYlRzHLFi4eqQ4l42ui6cDnNrROxfokVSGDK67L1gWEnuVNlWCcwlw4EUirTzyVaRl2ws7L0i7E
	QrxPT2mobg5qWv0//oPV8OMjs6QPbgPsEN1RGLQQMb6D+yTaTQZzhTMdO0xiAJNOIdPnNH4//Mr
	L6xdSX+ZfQGZ57bNRILu71UD2hA==
X-Received: by 2002:a05:6a21:8885:b0:3e9:192a:4a7 with SMTP id adf61e73a8af0-3f7a79c5a31mr173095637.48.1794512872891;
        Thu, 12 Nov 2026 11:47:52 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:cbb:dbe2:bd9d:a035])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm839012a91.0.2026.11.12.11.47.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 11:47:52 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: linkinjeon@kernel.org,
	stfrench@microsoft.com
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	icb@fastmail.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Subject: [PATCH] ksmbd: sign the last response of a compound that ends early
Date: Fri, 13 Nov 2026 02:47:44 +0700
Message-ID: <20261112194744.47047-1-mike.michalo@gmail.com>
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

is_chained_smb2_message() ends a compound early when the next command
does not fit in the request, or its response would not fit in the
response buffer. Since commit e2b76ab8b5c9 ("ksmbd: add support for
read compound"), __handle_ksmbd_work() then signs ksmbd_resp_buf_curr(),
which is_chained_smb2_message() only moves to the response of the
command just processed when it chains to the next command or reaches
the last one. On an early end it returns without moving it, so for a
command after the first, the previous command's response was signed
again, over the iovecs of both responses, and the response of this
command was left unsigned. Neither signature verifies at the client.

Handle an early end as the end of the compound: pad the response to 8
bytes and make it the current one. smb2_allocate_rsp_buf() leaves room
for that padding in the response buffer of a compound.

Only a compound whose NextCommand points past the end of the message,
or whose responses fill the response buffer, takes this path. Sashiko
pointed it out in its review of an unrelated series.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: e2b76ab8b5c9 ("ksmbd: add support for read compound")
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
Tested on a KASAN/lockdep UML kernel based on ksmbd-for-next: a signed
compound of two ECHOs whose second NextCommand points past the end of
the message gets two responses whose signatures did not verify before
this patch and verify with it; ordinary compounds and the compound,
encryption and expired-session tests are unchanged, and the Linux cifs
client works.

 fs/smb/server/smb2pdu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 5b046f10e2ce4..438f3d29dc416 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -699,7 +699,7 @@ bool is_chained_smb2_message(struct ksmbd_work *work)
 		    get_rfc1002_len(work->request_buf)) {
 			pr_err("next command(%u) offset exceeds smb msg size\n",
 			       next_cmd);
-			return false;
+			goto last_rsp;
 		}
 
 		/*
@@ -716,16 +716,21 @@ bool is_chained_smb2_message(struct ksmbd_work *work)
 		if ((u64)ALIGN(get_rfc1002_len(work->response_buf), 8) +
 		    next_rsp_sz > work->response_sz) {
 			pr_err("next response offset exceeds response buffer size\n");
-			return false;
+			goto last_rsp;
 		}
 
 		ksmbd_debug(SMB, "got SMB2 chained command\n");
 		init_chained_smb2_rsp(work);
 		return true;
-	} else if (work->next_smb2_rcv_hdr_off) {
+	}
+
+last_rsp:
+	if (work->next_smb2_rcv_hdr_off) {
 		/*
-		 * This is last request in chained command,
-		 * align response to 8 byte
+		 * This is the last response of a compound, also when the
+		 * compound ends early because the next command does not fit.
+		 * Align it to 8 bytes and make it the current response, which
+		 * is the one the caller signs.
 		 */
 		len = ALIGN(get_rfc1002_len(work->response_buf), 8);
 		len = len - get_rfc1002_len(work->response_buf);

base-commit: a4277e7b7682540e23334fc927f201e5bb7df5a3
-- 
2.43.0
