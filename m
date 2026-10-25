Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951405;
	b=kYqLPiQTHed53Q6qzqZ6Cfypy2bJ3TMqVsmibpRejiYi2LbM4yfXs13+FLAoDG0g6ZYn
	 AVlPgv6pU5OWdxaJ42iLmDnUcROdKPDf3VbIcb68uk+eocCESHkLgMJWO0GO98OyzTaJI
	 2GbQdiV5e1ksToWGucBJCUcffIjckrZwkNdIQn7nTYkCmzdCWZ7aRcDO6+Tl4qQv/D4ud
	 BtmTrO8Ll0c+7z7d7lbf3j/EFncDXCJnJdBrODldhZmfAmJ1ZrlbLpXCDdx04174KrTpY
	 LfYOfeoM2cEQth588lMtomYeTlPB/eFWCtp55VhElt+YiNhKQLK5cul8eOkz01xT0Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=alY1sQTtn421IOLdBUDG1916B/g2vsPk0ZHvzfJmA3w=;
	b=SdLFhQHvqFD50XBVYAd7D7fhDtY5vobNZAPbG2wu4DbIxYFmymTHiohIJXi1B4jtdLtF
	 rNXDAdb102b+DXUvXaUGx668Oi4nu3rkWjZiixmzk7H7bk5WvMY4HkNlrGx4Cgyp/FU2B
	 LS2K0sxLrK/KxrlIPtHcAijtFZ/WCzZMF1WNRKSdFEKoc1qUtbb/K1aYn1eNV/NKr1+jF
	 2vXMpCMkU5t+Bbz3YyksMD4TgfQ7zJOs0VHSHQCPDoEIQuADFpu4Vklqrm79NeoTxPax2
	 uLzQNFWT/PTvLCnKdk0V7xvnSkFZOrj+SQkPEA8XHsXsE/Q4XFZ3c6UJK3RflHC/d5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmuNUftk;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B5606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmuNUftk
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-16079d54c17so1760386c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951405; x=1793556205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alY1sQTtn421IOLdBUDG1916B/g2vsPk0ZHvzfJmA3w=;
        b=HmuNUftkqguY42QEtPQYxfub2xUmD4KxNusz8g9vGE/57vWyBR7WO3ElEPmnvc5XTm
         YOWUZSQvmev5jk8me+oGckL2tIRGQUXJ54ezpSQ4oYUM7OfdX3WwpbH7kTmTxq1BGHMr
         biSuDr/RhP6O7E7vtPHvyMPL+qMC3iFCNTv1sIXp/UzMdATbgBHInEjH5nMCcK5fqW35
         VbVvKSBnr8T76aFhPFxHujHDcvHFi8PN/B0C3LdqS5OEtQt1dBV6579V9/csALsLT9+l
         81xvAy0UzO24xKBrbcBrVVOIHhk4B7d1AMBIkvpHfjtL+appeOyDwOQQmBmyLS4d53Iq
         MQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951405; x=1793556205;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alY1sQTtn421IOLdBUDG1916B/g2vsPk0ZHvzfJmA3w=;
        b=ukBei058elg5/MOjEPSgMcn0nq1C5Y/zhY46KVPDt+OXpzXfrWLyPcz0RK6vKSt2bl
         JGbQgx1rA4UnsLY/pLaqKBgV4ODIMyT+G84eJSpcxkd8W/p2L3oZNNtiP/6+rPa4ngfa
         TtbEQWfme8nBS3ZmWwa+ASMQ8RZUvagLHrzOsvGai6VjxePf/2bccSLSQhdv95p9TH6g
         SHwCcsPJXiXXFhr1Qn46KDYCdPpi/x/Oduy9T44SygWMkP9gST6S91xyPUe5zyaHkSt7
         1J8s1Z5cdnKXhC2XsXkKxiaLmFgHo2QFUNZX29zjOnUc/D5L3dWBxXpL4sNzIvf96V2e
         nC1A==
X-Forwarded-Encrypted: i=1; AKwUvBzgtZ+LFzfblYqS8MTBhm82qQGOjDApvvJ/oeHSPRA3tLnqTvBqvmUKi4bpfJq8VsGYYI9atFv11zDEFUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJztgU4qheRj34XalLc6qdYpHIxt2fBSQy9cliagEpplOH6Ywcr
	ngoscBe2869wvTaWQ+OV13WNyz5Y+YkCHhg9/Z/eBy0tQCWziXD1gCg1+SC/D0eKQ0k=
X-Gm-Gg: AYBFou07wXFlTV8oomVXeedjmjAamLHDkJGkRzHgtVZhq4o9tq0XYMAcS87lOclCBGo
	q/3qPDWcPgnLmC7p5W3i+uacqTzWFNaBgXLoii3AjXLUczVkbPugtQQHW/PVDtVwN57wD/1PxCl
	rsJioJtrry14A2WEVqhkHVc8VLja3+qBKNLhWAjgzlQgnbc6YGaTIh2N11BoQNaH151JNChzgVD
	bGIiu/G347RSI4IPuLlBdUyTJk265YO2ECb711GGjNCskALI2ftDbQ5qevJVSG7u/jSginY5W14
	eS+x0ouTukLbJQCqnntH5e6WG/4Q8gCMj8yscfg8fuQtKjc6aPyyLtDAEj3/WVJ4JAIBegrIZxk
	9Gq54WCnf+c3WJjEhp0LHAXoBeZ3xlwwo5EAYWrJs5fPWkvni9mgxNZDvX5/k9BwkI0Wd9VFzvs
	JwFFCYsu0B54Q/wK6jINTQr6YFTZjt+KyjYXYo0F4YRklgKyzqDmaPuLGOiVhzf1mp5jhdNihQI
	CnLTZvQI8O60pE6yx+TX+OiW3RmRo8l1+/a3R6Kh1l8WP73SdQpK24JvNZdEHBArPDRFqAntaV3
	jWx8F2exahUct2kzMKg=
X-Received: by 2002:a05:7022:b883:b0:166:af48:a2ba with SMTP id a92af1059eb24-1991b9e5d21mr6638588c88.0.1792951404502;
        Sun, 25 Oct 2026 11:03:24 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm16268355c88.21.2026.10.25.11.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:23 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH] NFS: keep in-flight slots when shrinking the session slot table
Date: Sun, 25 Oct 2026 11:03:17 -0700
Message-Id: <20261025180317.349421-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfs4_reset_slot_table() shrinks the forechannel slot table to the new
session's max_reqs without checking whether any of the slots being
freed are still in use.  The session drain it follows only snapshots
highest_used_slotid once, while nfs4_setup_sequence() and
nfs41_assign_slot() deliberately let privileged RPCs (sa_privileged,
e.g. the DELEGRETURN sent while an inode is being evicted) allocate a
slot after that snapshot.  If such an RPC owns a slot with
slot_nr >= max_reqs, nfs4_shrink_slot_table() kfree()s it and the
reply path (decode_sequence(), nfs41_release_slot(), nfs4_free_slot())
later dereferences the freed slot: a slab-use-after-free.

Clamp the shrink target to highest_used_slotid + 1 when the table is
not empty, so only slots above the highest used slot are freed, and
stop resetting highest_used_slotid: the high-water mark is still needed
to release those slots and to complete a later drain.  max_slotid is
still set to the server's new highest slotid, so new RPCs cannot use
the preserved slots above the new max_reqs.  A server advertising
max_reqs == 0 arrives with server_highest_slotid == NFS4_NO_SLOT; make
that wrap explicit.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/nfs/nfs4session.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4session.c b/fs/nfs/nfs4session.c
index 175390e..869451c 100644
@@ -274,8 +274,25 @@
 		u32 ivalue)
 {
 	struct nfs4_slot **p;
+	u32 newsize = server_highest_slotid + 1;
+	u32 highest_used = tbl->highest_used_slotid;
 
-	nfs4_shrink_slot_table(tbl, server_highest_slotid + 1);
+	/*
+	 * Privileged RPCs are allowed to allocate slots after the session
+	 * drain has taken its snapshot, so slots above the server's new
+	 * highest slotid may still be owned by in-flight RPCs.  Shrink
+	 * only up to the highest slot that is still in use: every slot
+	 * above it is known to be free.
+	 *
+	 * A server advertising max_reqs == 0 arrives here with
+	 * server_highest_slotid == NFS4_NO_SLOT, for which the addition
+	 * above wraps to 0.
+	 */
+	if (server_highest_slotid == NFS4_NO_SLOT)
+		newsize = 0;
+	if (highest_used != NFS4_NO_SLOT && newsize <= highest_used)
+		newsize = highest_used + 1;
+	nfs4_shrink_slot_table(tbl, newsize);
 	p = &tbl->slots;
 	while (*p) {
 		(*p)->seq_nr = ivalue;
@@ -283,7 +300,12 @@
 		(*p)->seq_nr_last_acked = ivalue - 1;
 		p = &(*p)->next;
 	}
-	tbl->highest_used_slotid = NFS4_NO_SLOT;
+	/*
+	 * Leave highest_used_slotid untouched: when it is not
+	 * NFS4_NO_SLOT, the high-water mark belongs to an in-flight
+	 * privileged RPC whose slot survives the shrink, and
+	 * nfs4_free_slot() lowers it once that RPC completes.
+	 */
 	tbl->target_highest_slotid = server_highest_slotid;
 	tbl->server_highest_slotid = server_highest_slotid;
 	tbl->d_target_highest_slotid = 0;
