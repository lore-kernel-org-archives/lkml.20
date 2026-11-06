Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993540;
	b=lrFkhgQ40YuE59Bh07avOttl9xiEX9Kx+570sBUX2nUrH26AiGH8eoh3A/NB55Kndz8Z
	 /KRs2glAG/LWuaHIkwKZqgQo2XgbUxPlS8KOIkIVHR2XSQs8R/I2CU1/MpqFnCtImswE5
	 pPfufNq8SWNsyKpgUPVAMklU+S9rJwrS9v8rKE82lcqidqIdhSLsLQ8ApQXL73Ww6MHo0
	 Wq9195K9Jq7Fp2c9nvSZY0Pvx4AhE2njhpEHmpg1lZnrsfzxId8ik3WM/sFib1ii4Zdbs
	 uOE9ioI3oG6TGQySNmlviyqZ4mhF0XraNoUGOZ/RKh1owoRpi11Zu2sqxPhm3VQyw0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a0RDp/rl6Vk8Phw3anBonrB3Rzcis4iuB7hT2hI6hOI=;
	b=vJUsSN6J33US1JctQEtP1r5G4BOmKlNUHOa91KXVPTxLT/aXtryD9CCvurgIYXSd0Tf+
	 m640Ij1zic7KdNWtsNA6qjG9MxeK6i79nhaR0IAL2fzRPiILccjWaMrmMAoD9jPe7lG2c
	 4Xlki4lFj23L1IGQzAaFOk0CWThX+sbrxi3BNoQgM2ZwI2mjLfkR8bbvbrpJB80Orws4x
	 nTaAsLzyjJ62c0ptycgmgOq9M4hHE9GQ0iwVqcl6W5EpHAw3RVBMWT25L7y2jI1dVUuhK
	 PyZ+AW53KgJiMWrpIeMcey3MCp66oXa1xvKusvfNNCUGUOVrX7cZezH10vNrDyiLwYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="cyyCMpl/";
	arc=none smtp.remote-ip=209.85.210.226
Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B6606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D79B6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=cyyCMpl/
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so533281b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793993538; x=1794598338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0RDp/rl6Vk8Phw3anBonrB3Rzcis4iuB7hT2hI6hOI=;
        b=cyyCMpl/K9YhiSpcklec+E4m9mCwAI22y4dX48lD15x7/Kc1vND/f/x9+hse5q45Iy
         TkcUyPL7i0VGtAh6GKeB077uQOeFu6DbNqt5mwCgJQyBMtIf0dTFE2GAQU6XUl/3aWB3
         cOslvwCLBHEBhRcNM1wVW6hKsBGp0vJZdJ1Kjjm4KF+EJdg1CQTO7jm7bkjsEftfMmuF
         8iymrMYxA8qS8W83hH5SZz1IFHvBskDGMg0SygnpAWa753RcFK++LaKUhhkweZgekpgN
         cLUaoxICxWhoe+krQIn8A8VDTepnm9iLgMSATnwTL0b+3VB1TtyFzSXRvUZ1kEC/AmyS
         G58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993538; x=1794598338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0RDp/rl6Vk8Phw3anBonrB3Rzcis4iuB7hT2hI6hOI=;
        b=F4VwKowT0McJXhlDOrJyTa3efghUtn6LxuSCjtFfHRW7SOo0b/Vqe1NVgfOc1+Gyq9
         NmrMkeF+2cnCfKFFsnYQBMqrOCpA7IrWvNX42V0TQcggLa93Az40U18lJNfvQh7Da0X+
         yngwOBcEXIULvkjLZddNN7QjKC0CLI583DTYm3r+JMa/qtkS/ndbr9dX/V20a8SsBdbn
         GTLr3+x9rqUNkgfQ/8LTWOd1SGZV4XyxEkazQMzzJmbraidKoNInJzkDdJ1kEB2v51Ms
         IU9XluFsYRSO8WijmqAcm8yG41MRM2dQB8i/6Qimjflhe8cr7QLTMk7/iUmo60dTWIy7
         OsuQ==
X-Forwarded-Encrypted: i=1; AKwUvBytbOMyPeYN118AWj/ZWKHq/w0AuS+6fx63Equhwi0T2VzeQmXab+/wXPKrRSXLQv9jUF2AzSTZk7H939k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5gEtA6Mzx3XKrHjm0l2Fv2c7V/KeVVbFrzc2K5HOpDsJyaAL1
	LdLKLzcQfo0uTWpO+I84TJ4HYEdNt6ifLDdcF/lBMunwqi3Jnp9GVITP3er3F6dRyK8wG1FlzZM
	s9Gn/pE+hb9AE6EYXnEFiCJZKh8y7N/Y0s+qu
X-Gm-Gg: AYBFou3SmJzsu2qmrCHbSVcQ6sBfjk/sS7w6zCVexYHP2wd4fGXnn/OVe5FmBe2w9ml
	YVmT2/UF+5fT3FrHzMCJiVVrBUMNsY7VW4nrhOh22Ln6Wux67ba7Lr8OeAymyUzVgwjGSwqZ5n5
	d5sMjf2aTZJzBNvWG4YJmfB6yOKmAhduDKNRUIdFOulr/DwfGuhQgQz651hHSNavzsVIe7uEfEI
	bk5AKq8x95fdQfkU+VJiCNWNHwuUZAQkfNHFvUwXKeFTCVlgSaKt2BksBdJZcrqPLHKdza/vo0M
	sYBc/7JWQoaq6I5uZ/9sbuWXx+MGqpPDmU3sF9IiTxMPHMNc6+9kp0cdG09KdeHNfY00euVTTRo
	euG5mmqIeMjL2KOpXFEXvfyI4kS4PKW8G8gk=
X-Received: by 2002:a05:6a00:ac3:b0:874:705d:f659 with SMTP id d2e1a72fcca58-8b37bc5f406mr3255945b3a.39.1793993538079;
        Fri, 06 Nov 2026 11:32:18 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8b357bc29c4sm36071b3a.12.2026.11.06.11.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:32:18 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 6171E40152;
	Fri,  6 Nov 2026 12:32:17 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 5CB4CDCE11C; Fri,  6 Nov 2026 12:32:17 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	syzbot+cca46a9d1276f38af2ae@syzkaller.appspotmail.com,
	Sabrina Dubroca <sd@queasysnail.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vakul Garg <vakul.garg@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] tls: read sk_err once in tls_encrypt_done()
Date: Fri,  6 Nov 2026 12:32:08 -0700
Message-ID: <20261106193210.1152577-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

tls_encrypt_done() runs from the crypto completion, without the socket
lock, and reads sk->sk_err twice. getsockopt(SO_ERROR) and sock_error()
clear sk_err locklessly, so it can go from non-zero to zero between the
two reads. A successful completion (err == 0) then takes the "no error
set on the socket" branch and calls tls_err_abort(sk, 0), which hits
WARN_ON_ONCE(err >= 0) and clears sk_err.

Read sk_err once and use that value for both checks.

Fixes: a42055e8d2c3 ("net/tls: Add support for async encryption of records for performance")
Reported-by: syzbot+cca46a9d1276f38af2ae@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cca46a9d1276f38af2ae
Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_sw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 771e02bff519..b4535139438a 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -473,6 +473,7 @@ static void tls_encrypt_done(void *data, int err)
 	struct scatterlist *sge;
 	struct sk_msg *msg_en;
 	struct sock *sk;
+	int sk_err;
 
 	if (err == -EINPROGRESS) /* see the comment in tls_decrypt_done() */
 		return;
@@ -489,12 +490,13 @@ static void tls_encrypt_done(void *data, int err)
 	sge->length += prot->prepend_size;
 
 	/* Check if error is previously set on socket */
-	if (err || sk->sk_err) {
+	sk_err = READ_ONCE(sk->sk_err);
+	if (err || sk_err) {
 		rec = NULL;
 
 		/* If err is already set on socket, return the same code */
-		if (sk->sk_err) {
-			ctx->async_wait.err = -sk->sk_err;
+		if (sk_err) {
+			ctx->async_wait.err = -sk_err;
 		} else {
 			ctx->async_wait.err = err;
 			tls_err_abort(sk, err);
-- 
2.50.1

