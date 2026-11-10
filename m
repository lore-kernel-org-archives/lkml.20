Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329956;
	b=h7Le76+bxNEaaXsgW8wYuIxN5CZ4Ej/ZxawocjmPswn4ohFo+ViB2XxbH11GWmccdnIC
	 W3bA5lufcFkxYKGqGh0KjnYgW0hQD17wqu2R1puxX091NN2KS8S0qeXGFcXlGJcDY76db
	 Sn7zQM0dc90b+yRUvyS5OP0wZEeK3MYRre3nT8W9s0jRDAXkTU4grklqF9657AxArPMQD
	 PESFjL6oIl6SneqAA3/+OdrgQsdHZEqyKCP9Z+0LfjrZfuszmhYto6yIa+wTUHE6qZCt0
	 bQVgqIneYJEhVZE6B/b0u2hLeXYQ/o58MJt4+UuGWbO068IUihdP70wnalU1r1YnUeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9wh50IvgwJbMrkzWwEQjBdL/7srYLJHLHjfrmuIC6sM=;
	b=Qk1Yz5JKc1xLgZUPrwdTIxQQxaPeoGBYcZCtB2nAB7O8346/EGdO05F76YOrpHF/tlSn
	 gHT//ouGNBxttqaH0YqaYS8rAFHGFCqBEyYnKGZ6zaCyI5bC2xEDJ7SkUVzg6kVk/hTNS
	 8oBiAbmH5wqLijbuIq9ly5xocExdFk1fBWtlRi/z5roOBy92eq53Z4hED59rlfSA9L3y7
	 9GWs52xz4HRw4ynrCXQbH8IS6tj++r8QLFxK5BTqjJAzR9Gwiiber2EaqagW2Jd5bHlTH
	 DvhjynKg6RvlZtYhOj1bPHHHx48KRfK5arHuX2/7ig+LB3yP9WNOOZY35hwlv4WC62w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTIXWTeP;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66C606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F66C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YTIXWTeP
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5efadd183so1068343b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329956; x=1794934756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wh50IvgwJbMrkzWwEQjBdL/7srYLJHLHjfrmuIC6sM=;
        b=YTIXWTePtkw3i+wutj1MmTvW7sBAUKZYIRuFN1h843U5ToTaw31jnGd8OXeykrwYgA
         75zpjH8yNvicMUgV17D4V2JWUNOWOylBeAGrqi+i6mh3qlThlh7bvUTafOWc8YudU9ZG
         YBeh6CISViDEIP6KWl2OXWoPwphgQmkz/npAFRoMV1GwP0DdYiCo5itVlF2UjPS5OYrR
         Jmkv+MGoj/mh/2kEsrbk+ffXdvLvEg5UZEO/eT+Bj5RipjZbXcggXC4PRExYRE5gTzpE
         kBzM3nZ5kORhENn3JS6eLl6Sf6HJGXjTYRSoPiSRm9gTU913E8udXvt5oM2S/Ox9VexM
         qCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329956; x=1794934756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wh50IvgwJbMrkzWwEQjBdL/7srYLJHLHjfrmuIC6sM=;
        b=pJxDUr6l7uePn/UmPG0BMh4jEfVPG5UJqbVhUv+Bo9eJlS2ePFpsEDTDX01nybgzNe
         hjbmZPyHItNoSTB5jg6H6Wct1AikZZjvnt1VF/Uu0/dx2+PRZHaM3V9bYMuSojnmpLs4
         1n7L1Ln/qWQqA2VEsMQecuffKipd3Gjnk8FQIPatDVoLMsZpO1aDSea719X9vx4jUjp6
         a6w6cSrMMi6ByKp2uKoGj3Qox1T7TgerJBBZLZ+enddlm/QeVbdvmKhbXNoT4S3NLZ06
         SZSpynBIn11Y9FG6ThcQSe7WuFBJAfDFUuoB6LiI67bQyOnGJzefv6oswmxcbVq4PPWV
         Jjug==
X-Forwarded-Encrypted: i=1; AL+hErG/ODbPcVadlzDmqsJj5M8vkKgQ69EulMk04snQ6/dYhZyYVERWijEH8K6SBe1R8bpWxODpdv08wBWSWEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ij6WVYUfZTJrBqMONmU/GXGT0s04iJ0mEX2OTlY86DWZo7L/z
	mguINlTX1EoJs9fEPPNUAeUm25IcWmG41M2q1cPLAEH60BYzJSWtfpjY
X-Gm-Gg: AYBFou1tjlxZ8QAlTc98txHRC9nv4UxSMzCxfs/1IeV3PwxZHgsHa/SC5TkkQVZ87Kx
	a1m/1z6dIl5IKoWHZL99EM+lWmTBuEsO9nV0xajFM+/yl9DWgj3uu6ouam75E96U48+zuErmQ2B
	3GNE6I/0Eh2KLL1i7JvitqxX/MUhy83FKkcdXtL9sU73UC4tRuEbQ92YY4XLcsrKhcK/2fueTcU
	M6KS0MFrhqTtI5C6iBYvOAH5s+l9DFFKvr5ZXD0sVgyNdiZ8CPehBgz851Ecf9qXb3V+o+o99FU
	JztUzOK24WCfIE1LeVL6oqYWGGQrj+P7bj2kxt28glG/KVmL/tSSj/wTUuvZQxW8mCWTSEgHDfm
	VaOUMvWH8enzXdbL1Oqfykq1zPlBegZMlbpXG6AWswRLXrmjIMD4CtLdV8bv+7jq77HRHgyww8o
	6HHTKtAq3LxAdPwM8qxRb1X4/qp9EJHDkeFhaD0yMJTpHHYbYchYoUM6phhd24gbS2gKpQB1WrV
	TkgzVBn8rRgk/g5mIFRtZx8u7xw9YE4EAWhIjwYUdiUnUiidWfg6a9MpuwIzuLavsudKJZfEsBn
	n4tlX5nnXso9/X3XttFX2usOXVP6b6cgaApgIFNWxepN0NNmlTNVZ1/cvbnbcZxIlx/hdELu5u7
	4+Ho8nZWLSZ81j3TFYdppADb2IwuCl6/jshnvjQDW9YS4x6Kzo/9tjjtp4MtkioRT3BhBIQCMwQ
	7g
X-Received: by 2002:a05:6a00:181b:b0:8b6:5a07:7761 with SMTP id d2e1a72fcca58-8ba98e399eemr2347530b3a.38.1794329955618;
        Tue, 10 Nov 2026 08:59:15 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fd5c6sm1157154b3a.46.2026.11.10.08.59.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:59:14 -0800 (PST)
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
Subject: [PATCH v4 5/6] ksmbd: use the current command's header for signing in a compound
Date: Tue, 10 Nov 2026 23:58:33 +0700
Message-ID: <20261110165834.28162-6-mike.michalo@gmail.com>
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

Three places in the signing path read the wrong command of a compound
request instead of the command being processed:

- smb2_is_sign_req() always inspects smb_get_msg(work->request_buf)->Flags,
  so the per-command signing decision in __process_request() follows the
  first command's SMB2_FLAGS_SIGNED bit rather than the current one.
  smb2_check_sign_req() already uses ksmbd_req_buf_next() for a chained
  command; do the same here.

- When check_user_session() fails on a chained command,
  set_smb2_rsp_status() writes the error into ksmbd_resp_buf_next(), but
  __handle_ksmbd_work() then set SMB2_FLAGS_SIGNED on
  ksmbd_resp_buf_curr(), i.e. the previous command's response. Flag the
  response that actually holds the error.

- After each command, __handle_ksmbd_work() decides whether to sign its
  response only after is_chained_smb2_message() has moved on to the next
  command, so smb2_is_sign_req() and smb3_11_final_sess_setup_resp()
  would see the next command's request and response. Decide before
  moving on, and still sign afterwards, once NextCommand and the padding
  of the response are final.

When the session does not require signing, this mattered in three ways:
an unsigned command after a signed one was verified anyway and refused
with STATUS_ACCESS_DENIED; a signed command after an unsigned one was
processed without its signature being checked, so a wrong signature
was accepted, contrary to MS-SMB2 3.3.5.2.4; and the response to that
signed command was not signed. When the session requires signing, an
unsigned first command is still refused and every signed command was
and is verified against its own header, so mandatory signing is not
bypassed.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c  | 27 +++++++++++++++++++++++----
 fs/smb/server/smb2pdu.c |  4 ++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 276dbbd986503..13341ff38aeeb 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -213,6 +213,7 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 	u16 command = 0;
 	int rc;
 	bool is_chained = false;
+	bool sign_rsp;
 
 	if (conn->ops->is_transform_hdr &&
 	    conn->ops->is_transform_hdr(work->request_buf)) {
@@ -288,7 +289,15 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 				if (conn->ops->is_sign_req(work, conn->ops->get_cmd_val(work))) {
 					struct smb2_hdr *rsp_hdr;
 
-					rsp_hdr = ksmbd_resp_buf_curr(work);
+					/*
+					 * set_smb2_rsp_status() wrote the error
+					 * into the next response for a chained
+					 * command, so flag that one, not curr.
+					 */
+					if (work->next_smb2_rcv_hdr_off)
+						rsp_hdr = ksmbd_resp_buf_next(work);
+					else
+						rsp_hdr = ksmbd_resp_buf_curr(work);
 					if (rc == -EKEYEXPIRED && work->sess &&
 					    conn->ops->set_sign_rsp)
 						ksmbd_sign_expired_rsp(work);
@@ -343,11 +352,21 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 
 		smb2_complete_request_open(work);
 
+		/*
+		 * Decide now whether to sign this command's response:
+		 * is_chained_smb2_message() moves on to the next command of a
+		 * compound, after which the request and response helpers see
+		 * that command. The response is still signed afterwards, once
+		 * its NextCommand and padding are final.
+		 */
+		sign_rsp = work->sess &&
+			   (work->sess->sign ||
+			    smb3_11_final_sess_setup_resp(work) ||
+			    conn->ops->is_sign_req(work, command));
+
 		is_chained = is_chained_smb2_message(work);
 
-		if (work->sess &&
-		    (work->sess->sign || smb3_11_final_sess_setup_resp(work) ||
-		     conn->ops->is_sign_req(work, command))) {
+		if (sign_rsp) {
 			if (command == SMB2_SESSION_SETUP_HE &&
 			    work->sess->dialect >= SMB30_PROT_ID &&
 			    conn->dialect < SMB30_PROT_ID)
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 293e660265c95..f918744870a8f 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -12888,6 +12888,10 @@ bool smb2_is_sign_req(struct ksmbd_work *work, unsigned int command)
 {
 	struct smb2_hdr *rcv_hdr2 = smb_get_msg(work->request_buf);
 
+	/* In a compound, test the current command, not the first one. */
+	if (work->next_smb2_rcv_hdr_off)
+		rcv_hdr2 = ksmbd_req_buf_next(work);
+
 	if ((rcv_hdr2->Flags & SMB2_FLAGS_SIGNED) &&
 	    command != SMB2_NEGOTIATE_HE)
 		return true;
-- 
2.43.0

