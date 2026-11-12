Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509489;
	b=BUP4Si7Er7Q5v6JJGRS9Iu14L4Vf8DoUbAlBICmd+/d6N4QEJhAmose8HELl4cFaEXv/
	 J7Lv8rNwCcZGkdGQzBBmXGWs3sWOb3P2+cTJkv+Cd8M0Gx4gd5ZAQnGq5/IMSavh/dN4D
	 wMPgQVwZYqnV1bF00GQruU9JsMcGzCFolaJxHZuB2Lv+LNSTpCj7W4g6KzN6QAH5wLU7A
	 krJ4oikRkxPbNlKhzsUogM349/4g4+ar1/hbj1HQaxDY+2HXnrIBlG+qDLwdzYMTrOTF+
	 MQfmF0KmMaxX40A7+En9vm5/Joa08XYHlQKGU2upkRnGV96V4Tyg9HWeG+VTrLwewSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rifm85zXsK14WyhtQNorz8auPxtPryGnXCmhJe4oWk4=;
	b=XHGBX8vIvC/3icy08bHB0UsyRxN6ZBEUfJ/4rJqgn8h/zO1ZrEuawoqeQvAvwyfy9g6t
	 wFNHPK2LeUH/9KhyQHEi3PM4F+N8SyYlnTQdlvMMBzWq1oVWsxMl56cCa09LB7rayWEnM
	 kJ3o2KDKpTKkjecN45EZMYiKnvMGUpOHaDyi8NtGVIyuZjpJSmR/QlCN1nbCAg3TIdQA6
	 qG63CLxiBRTSYI9qyZn+DxDxnAzm7h+pgA1hR+YGxjlUAUHCIMHgJGUrrIUI7mxLLOq1F
	 YTjhIq8JaX9RwxQ0oplr9npvd8RdD5/slpthst+fwFI1+yoeo+YPOb15wtlCOsb9H8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iibJF5UJ;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAF960A262D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAF960A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iibJF5UJ
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9d7791b00so1704995ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509488; x=1795114288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rifm85zXsK14WyhtQNorz8auPxtPryGnXCmhJe4oWk4=;
        b=iibJF5UJvV2OoyXjRoihHREeTnwGmlxeJ2Q34cGWWFmdadIaPCglpmy+hk+RoTxGQR
         WJutF2Ust/ptJICamCxZAxhHDT156l9orVmEL7kkcAU1KgAC6Wwa1+aiFHTP9/NXfU8S
         PZLlYIyJZ6/cKVmzs9jTrugwMSl7jdEjL3Uz8bz003OE1qfjQWWswhTC+o76mM6M3dlr
         XgZ5UPu2SUg3hoGFmjrhfC9224e9oKCT/VZJjCdFK9f5F7dUNB8kOGVaa2n6HOkUD/Mg
         6vO2FH8FkevzDMlxnI67nZflPV+dAHehHVQNx2+dvtD5RUfmSMrz7h6FS1OhPakkCbGr
         dDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509488; x=1795114288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rifm85zXsK14WyhtQNorz8auPxtPryGnXCmhJe4oWk4=;
        b=Yn3B5itotWwZmB8dmXyfh04yRwhx8uVqvy6Yk65pvWMuNIHZc9lL8+w8eRFbRk9Jt6
         YRtv8OsJtdept7E2x7z91P0ULVowGF4Ue7DAEkN+EwrxPF9uLGAgPb0Gqd1w8Mg0L14P
         XTvVT50WE9hdWeatHLGACzX6zKEKJEzt4nm21v5w21rZ2eqrEXJ7YIEkeTscDAKRT69L
         CN3qdBJeVoFT7i7zwAB1a+xp2bBwV9CtEmNrlbGZe91vXMD02HZiVhqIdDTRA/Dafj3m
         +EJYxQfUvLsZi9ZxWdjZ6pLhZAh2BGM/xLnUw1LHRknATC+w/YeTxdLZEzzTXvMrxPE7
         XiKQ==
X-Forwarded-Encrypted: i=1; AL+hErFvDFARCmwcYClr0Ymwi8IZ1VGahi0/s8Y9rTs6dQld5Zj2tK4fToHZ61yt1zrW+lwHpMv/gj4LhmWlOdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z++awVYSUuNhDwjC0DbSUwySXY05qNUAjOrq8217fx2UWZdQefm
	xgqbQsqxH7RAJ3c3NlL5La+NuFoJ/87UDffqSCWB8k/vCBgfbQEGFJz0
X-Gm-Gg: AYBFou3XTegm2I9sdS6FKunzL5Ji0CPli9lyFKWx34K/q3ADmNxAkfz+lK7tvrC9M8K
	HEL08no66YACa+/zIU/EGhNeR9fO5y61WsAZzDm4ovGvesDTRcozptXF6aq5xV503261yh+SLED
	lry/jknJzDWjqpUVEQMRiaKNHZPZNXRYvernEeXeANn7CcYxg0ro++QOnND+drQ6bjprouKVirQ
	tj7uykhIeQwh/5Z7SlZCfPqZgLp+bCWnOt5XASG7dXEykWsjMDJgtdeNz7bDmt0S92Yke0NfxVB
	6pyDwuC33Y4jMCavVMiwmBF6R5FZlhgC9uDSOvktWaEQwcHWw2U07d4epwaOeqlKFnsuoTGtzHc
	Gs8UyrijWx7jxVeSmORMgDjUOBLG80sit7wt6kMtkVOdGcXEJBwLGsz2QxaWBbfl5ixpsXZ3QR/
	yPmbphqYRo1RSZsG6q/kqShjBuB75H4DgVP0pfGjszgULpFXKzwDC9K0VWd3RVRytp8lX6wZ/oy
	c5zQYQU1gTRZc0gOHrmbgh6xSxWiPlohLjYySEf8JbseJ93EANgIrDQoRzLWtwv0Renr2f4vvYA
	VdE7YmVUw3g7y+kFUad+xeaoB8ZPwsBBW5PB0JuVhc29mTCyKSLy9DV+ednWHJkOr9+GSe0b8/n
	c0w8G/R6LIZuuaFHacY96bVtF2g==
X-Received: by 2002:a17:90b:288c:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b182f198c5mr5709983a91.47.1794509488452;
        Thu, 12 Nov 2026 10:51:28 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:cbb:dbe2:bd9d:a035])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7cf7bbsm66205ad.29.2026.11.12.10.51.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 10:51:28 -0800 (PST)
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
Subject: [PATCH v7 7/8] ksmbd: consume the sequence number of a request on a failed session
Date: Fri, 13 Nov 2026 01:50:43 +0700
Message-ID: <20261112185044.41571-8-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112185044.41571-1-mike.michalo@gmail.com>
References: <20261112185044.41571-1-mike.michalo@gmail.com>
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

__handle_ksmbd_work() calls check_user_session() before
__process_request(). When the session is unknown, invalid or expired, it
sets the error status and jumps straight to send, skipping
__process_request() and therefore ksmbd_verify_smb_message(), which is
where smb2_check_sequence_number() consumes the request's MessageId from
the command sequence window and refuses a replay.

Only a signed request on an expired session had its MessageId checked,
by ksmbd_sign_expired_rsp(). Any other failed-session request (unsigned,
encrypted, or on an unknown or invalid session) left its MessageId
unconsumed: conn->seq_low then stays pinned at it while conn->seq_high
advances as credits are granted, until the window of
KSMBD_CMD_SEQ_WINDOW ids is full and the connection stalls. A replayed
MessageId on such a session is not refused either.

The same path answers a request that arrives while the connection is not
in a good state, for which check_user_session() returns -EIO: before
NEGOTIATE, before the first session is set up, after a failed login and
while a previous session is torn down. Such a request now consumes its
MessageId too, so a client that sends one before NEGOTIATE has to give
the NEGOTIATE the next MessageId.

Verify the message once at the start of the failed-session path, as
__process_request() would have, and drop the now redundant check from
ksmbd_sign_expired_rsp(); verifying twice would consume the MessageId
twice and refuse a genuine request.

The commands of a compound that follow the failed one are still neither
answered nor consumed, as after any error that ends a compound, and a
request refused by the tree connect checks that follow has the same
problem as this one; those are separate changes.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: fd8c97d7c1cc ("ksmbd: implement the command sequence window")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 32bed8672dd2e..52eee04e0d93a 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -109,9 +109,10 @@ static inline int check_conn_state(struct ksmbd_work *work)
 
 /*
  * The keys of a session whose Kerberos ticket has expired are still valid,
- * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
- * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
- * signs a response to a request it did not sign.
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. The caller has already
+ * checked the MessageId (MS-SMB2 3.3.5.2.3); check the signature
+ * (3.3.5.2.4) too, so that the key never signs a response to a request it
+ * did not sign.
  */
 static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 {
@@ -125,9 +126,7 @@ static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 	if (work->next_smb2_rcv_hdr_off)
 		return;
 
-	if (ksmbd_verify_smb_message(work))
-		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
-	else if (!conn->ops->check_sign_req(work))
+	if (!conn->ops->check_sign_req(work))
 		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
 	else
 		conn->ops->set_sign_rsp(work);
@@ -277,6 +276,21 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 		if (conn->ops->check_user_session) {
 			rc = conn->ops->check_user_session(work);
 			if (rc < 0) {
+				/*
+				 * The error reply below skips
+				 * __process_request(), so check the message
+				 * and consume its sequence number here, as it
+				 * would. Otherwise a request on an unknown,
+				 * invalid or expired session leaves its
+				 * MessageId unconsumed, which pins the command
+				 * sequence window, and a replayed MessageId
+				 * is not refused.
+				 */
+				if (ksmbd_verify_smb_message(work)) {
+					conn->ops->set_rsp_status(work,
+						STATUS_INVALID_PARAMETER);
+					goto send;
+				}
 				if (rc == -EINVAL)
 					conn->ops->set_rsp_status(work,
 						STATUS_INVALID_PARAMETER);
-- 
2.43.0

