Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498155;
	b=OH+4mj3HX9NF2uur63xhNRlZqOmPhMFx5ZL5VRGkOVt352S1Q620W69SGdSCLLa01nJp
	 SOv7zFrJ+L7WWRvexiPDRV1QDRT6H9wtPzaFqMtRAbCwS1C5AEZhz+u+AKJP02y5Odw16
	 zR8wqtALfEV2yBSHTqKpme0V7/o9f9CVjCHFKK8hu5q4wNvriutVUMs8gNoAjtU+baE4E
	 9tbVufBDVWAlE2PBWVo75b5+po2oq7XYc4nYACZ+ycPFBOBjGKv0Sd5WsYJ7Tg/viR/at
	 oILJJn/Bzgan7OSmnUy1XfTgu8lGpgRClz2VT0JCGVnGEWlOaiyTRkz4uV61ddlD+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQaDZUFARmg0vK0ubYlvR/6wjOF+eKzsBGsqgcT0Th8=;
	b=D+XTNBDU83bb/NuDcmbilR0+3Qyf7jo7LeHRH5Jo1aP18y/ldbvqWbk+mJViZ9PbOgeW
	 XxGmcsbbeH4pQlGjhavrkXSQcCewwXc8V5IB0vYjhmOX64Xx7MCe+c4VmXQTRgfCU9Eei
	 kBSAlc4yUAKrPgeiLZGBsd8pHeFRlfPl8sq9tjUS6OCSVzuk4TMfrIJ2zaPYWK6i+VXjm
	 pd02ogmwhTwWzl8uQ/kGwPCL+MWl6cN3UuD4Bm9r2QTwgfifudqJq8jP0dElvvSs2DkOx
	 FWG0e0913IHiU9gauP4skvDQ/tGzWEInUhhSQSVb9fDf/AWAYGo4BT4/iQ2WL8QHC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+iHftg8;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0455606A8AB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0455606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+iHftg8
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so2218342b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498154; x=1795102954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQaDZUFARmg0vK0ubYlvR/6wjOF+eKzsBGsqgcT0Th8=;
        b=n+iHftg87qCl54RLdix5C2y9fS9IPoE5PdJXVS0FFnroFU/fJxsS6riEEIE8E76793
         FOQTJ0myMYAzrtcqhUA6RbEO+edY7gnnWPV9LLndNCv56DoC8jaWLZTFRTj4S2Ycr7IE
         +8tNKHD9KZ99n3CO6qWPalMn5aJrM71+eIRx6jU1BsL2cOh9rbzD614IE3qc5RObWgQZ
         qreeSSzA5OQkLNgxsNXBzA9QMbEcm0b0U+bbzNzO9Xzvg/mm2xg1hEAS26jK9B+30RAd
         ksBTHM4gpW/jmzELDbhkmt29sNooQzoVhucwm7V2vVT/WUhm2T4mUQtY+6MiMjTOqO0F
         uwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498154; x=1795102954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQaDZUFARmg0vK0ubYlvR/6wjOF+eKzsBGsqgcT0Th8=;
        b=bg8h8+JQ+s+7juHuOnhEZWJtxu4LDn8tW+qRjpfeNIehpJmDJIZQ3FIymnjdWZUeYL
         WqMU1tgr0GSHMzTNIbHejwiYLxJ1AH4D8dKshoDCfTuyW1nwNzc5x4mKD4nO38G2UsmZ
         oiGALU54NYuXqhBm99upnBw9s+MpF4paBDdzyMob5XniXU+pAX0mQ6yOpar00PLWqO3G
         WpGGts8qPlShf/hO1mp+OrtCoGh9SZKrw0RwWfk5iqWzWi/qlBwON+4PUPYwP850gRA9
         DxUkzfmRsEWZMwY5PP4X+nyqSOYeouPP4pr43nruSkSy5P/bUMAMjx+Ej2Bs6DsfgW2+
         GFoA==
X-Forwarded-Encrypted: i=1; AL+hErEZZjP5+0iBgWadm8HrLji0cHomLjRRhlqqH9EskWXCZRHcnyaeY+2TkHAwLLy94xZcrr0e7zmTEBiM2CI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QK72qoucAJBZ7HG/+7Ef+uScjc/cS6YpWAe/7yk5eRxrnqXYd
	DyOG+n6ekE6zqHkcfQg4druUDeDwwTSdaE5XBEz4TaSYpdcp51VQxHIQ
X-Gm-Gg: AYBFou2gZod83un+SSpA7+B5JOK4wGasX6cJJstL681NIOJHnEKaexPGdbJsahdSM6s
	j2UhQLXGh9Q9+eLQF4bkKB/fQWGDVh6vQX1lzt+T+T+rlvq+MnQuR2moYp49c2fPhy3g4UGMMXV
	7LjQDMJclvKyv4jnLrPJ/nJQPlzgdFHr/Y995rxWewsF1n5aA1I4MbX5dCCU9coBEWmYBF2efC3
	LCSePP0qoQwlMdO28YJwcgl6CVH3UOufZOs63/eSfFKxubaaFrWuW2E1RIsg1mpqgq9cMiDc3Az
	ewJR7jRGX/0f30dSLEGnEYWS9/0oYX0R/V/xqciZi/LJybkRTsI1xiVPQtsJ54IVJ4mUoONAt8u
	auTgCFxixN5cE/5zkht/T614aA03F4KJOYqDGHZUov61glADRVmkFSKn+DA3VauCMFmwlmXg7kE
	Ku0w4yh+t7FNhT2rhCNdi7GQAnaeEV1P13OEkaDHAyV6gCF+ic3NtMvDXlRsXLgtF+0xXKVEWwm
	q1yzaH91Xiydp3Usoe+EKVEeeYV8mfQ+skXpradVhRVm8CCsQj91F7aGpaMjZB2hxtue/UXEwfa
	YJQuBhHuva7yz0ALqe6zcW5CJ9wb1tl3zds2AtSUwE4BxGDhluuiC5IteNWsHeiSLH9tbhgutpq
	tVVNr9gDs7bV2HremT0Gpwyu/tkc=
X-Received: by 2002:a05:6a21:d82:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-3f2ff1dcab2mr5672388637.91.1794498154026;
        Thu, 12 Nov 2026 07:42:34 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:21c4:c32f:67c1:d87c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3619sm3790596b3a.5.2026.11.12.07.42.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 07:42:33 -0800 (PST)
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
Subject: [PATCH v6 6/8] ksmbd: use the current command's header for signing in a compound
Date: Thu, 12 Nov 2026 22:41:53 +0700
Message-ID: <20261112154155.20255-7-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112154155.20255-1-mike.michalo@gmail.com>
References: <20261112154155.20255-1-mike.michalo@gmail.com>
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
index ca0c78447f454..32bed8672dd2e 100644
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
 			/*
 			 * A refused binding request is answered with the key
 			 * of the session, which can be of another dialect
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 186a497f83c62..1267114b79379 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -13000,6 +13000,10 @@ bool smb2_is_sign_req(struct ksmbd_work *work, unsigned int command)
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

