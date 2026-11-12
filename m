Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458856;
	b=mZOufvj0urLnwCQ7lrbF2oxibXFi5CiSQn3Wh2xNwpJVMaNr5AyiCNBIYOgcBfYFoDDI
	 6z5XzwzedaeDvsbv6b6Gw7brHam1ruosYCRxCMBsvBrLS5VQxAzhMPT5hxUjsZszEpBr+
	 z5PiCrNLAH/U9jK7x0kOjVS2/PnKsyNNppTQObD4oUhqEchdybnir+pj//o7Dr+HXZGTs
	 uChCnjFTGws9Nno0XL5vB1MKS4DnXd9yV9KgtAFHbsVI2Zboir4AgeZccNq3wHO0XZJ52
	 7qjJXzwwp/rvf9Fz4+e68jPLQWWTNWtN99X/YFaYULXaLXC7PZB8tVy3V2sMI+MZfRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cWOiT8mtCGqAbQ2n8g+EV5uWeS59q5JxKnJ7/ECCPaI=;
	b=iMngsUAWQy4sfprsnDxhDWh8fDrrEyEs1HNUm1oC4jmbtdPMvfn/2IsvxxCxqeRkiXso
	 kMZEfoWfSEjqH262O/VrIya/WyCb+1fx1bDaTPWNfYm/VRNsOCmUo9FE9zoqFm3KNohCk
	 kNy1AaNAwJ6aFmHePIhQS/DyLgPITBeCR+A4uGAViuOywQoTjDRZPyI2SObReECVVlpvs
	 wc90/96Jy1lKwZaSoUSpNg0wkpzXgK4haT1jd7AaX+FDMXNn1aUQfFuIc75cd55uYCTra
	 ykIaIYAiSkjFrh9MBsjOqTC0FUpzaMwr9WZhkV/NmSkf/cTWrPyLRLNPzCEwgSHAMfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0lMbfN6L;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A55606A89D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A55606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0lMbfN6L
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso6746544c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458855; x=1795063655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWOiT8mtCGqAbQ2n8g+EV5uWeS59q5JxKnJ7/ECCPaI=;
        b=0lMbfN6L4DIb0xQwGWaz1cHzTL3IEnMHQsPpBDtA0sASNUMaOEE4Er2lnLqCBLSfaQ
         8yCAzgVWOM7x9Eyi/PFNimVngcdKSxLjuNxaJv9ElR5eHeRKaVacUE9sy2d+5lKqyER4
         9polB6A+jgFbL5VAaxHK/i81nsy2vn70BvSetgfnDxz2ULmEvCGwvLFSXukj461dMmVs
         LsqLcxa/eetJBQMzSzATjRoCovQSadcCy3NHDjUJtap+ZZH0EDPgSyz8XM2Z8LHwsUjc
         1CRdzPkhXko3cMw5hDtDQLGelYRlE5+MU1mtV422KCPOf5n9wEKQOb7fpCKVhuG1CJ3u
         zZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458855; x=1795063655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWOiT8mtCGqAbQ2n8g+EV5uWeS59q5JxKnJ7/ECCPaI=;
        b=khLtYNoadbkbxEga4E3Bx6BpPOyS1p+YMyW8Dj5xxBSKDH42Z+Yko9Ngc3eKNPi2+U
         ZO2VpNNs86cwkWZDPX5giZLIQrJlmUybrFqHoOUll45SQroukETbjNyfPkurxFRIjFNd
         Kiohnr0BF4WSu17K73ULKm4mhZFl/yieT9NGmA54VfzqIEmwh51RW2aLJOo5zAOELvuT
         ouu0x1JNrGsV7922v9a+6qlEGWJmeFW2pWB2NVt9j2QcNMTIBydNCVq4DeYMJW2VWpu7
         5KNBNDL3J31UKLzBK98131gLjAGUUt3QkwFu3QN4ivi64vjUksvtV7zcq2FXHh+KsMY3
         doAQ==
X-Forwarded-Encrypted: i=1; AL+hErHuHdPQkQbuxRvv5vOxXeDkxLKiCQNGyrbSK2v4zUj3yOHtBArJLPc2V40RUtiBQ8m4JiMKVKdwkTfEhkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+67e1aeq3UMlznF3945+oRLVSjUXIGA12Ic8AMV54tF75deRLs
	gYk1ivKtMy0B34WUvTRV8TI43XoEpmVCW5fshY913jYp1spsQFxpZ1N9
X-Gm-Gg: AYBFou2dlzj9GtJXwogqZqFk9s8A/20UDXa3RD62Jq8TNQ5TZNLHikUfN+plsNR7eAy
	hCMpAi9lki7cBrp32MtS/QJzfg/9CV3AKYVuBD0X+2cyx5euZkJfwnDqex5z7D0Hu8FhVpcr+60
	TElJH+5d0+Y9tXzyo/qTzQrkP6oE0t5x5WBxkBu9mUvLoM01wOaZrAUhioEA8lGIdGpwGXEtKF5
	G0f4Ttit388QTNOBkvT7598DgyiFCJtkNOPfghp2+vFsGz7jsROP2V4nZQmxqZO+9/WItPQPPs9
	cFwuB8UZi7gpN6kIpmk7ytybPLHVP1itGzSKAJovV6w5d9eESVdC6qXwNB6oihr/2r2OVOUp21D
	0wnOZnSFFhes4ruHe+04ykkOlIT+QrR5W1PAXozstu3YhXJoJ+Tszv06uOgTDcCOFl5obsckfNw
	z8FgVQXefGLDLGohCfCJFd1Fvw8e9VZr/PvzXNMX4NGBieSTqPRsSA+EfJlnrx4OM4H5WSDmZIX
	OZPDadTp2LMA+lmY1HS6k2iD0KOND+ToatBD9SUE1v/+BQqc1xUhqJzU/8Yy5C8cA0L1LJzut3k
	2XuzbxLak0BtXkT0M5CA/p/Bo9xlB0W9MnSX9KTXKS8FKVEu1KBWO/eeQEFVlumXTKKtGJfaHb8
	6le2F09HjML32OYdaOZY3OqQslA==
X-Received: by 2002:a05:7022:7f0b:b0:14d:baf5:c419 with SMTP id a92af1059eb24-1b3c023c195mr3372490c88.6.1794458854757;
        Wed, 11 Nov 2026 20:47:34 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm21024827c88.12.2026.11.11.20.47.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:47:34 -0800 (PST)
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
Subject: [PATCH v5 8/8] ksmbd: account for the credits of a request on a failed session
Date: Thu, 12 Nov 2026 11:46:45 +0700
Message-ID: <20261112044645.4074-9-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112044645.4074-1-mike.michalo@gmail.com>
References: <20261112044645.4074-1-mike.michalo@gmail.com>
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

A request on an unknown, invalid or expired session is answered by
__handle_ksmbd_work() without reaching the code that calls
smb2_set_rsp_credits(). Its credit charge is never taken off
conn->total_credits, and the response grants no credits.

The client has spent those credits all the same. Each such request
leaves ksmbd's count of the client's credits too high by its charge,
which reduces what later responses can grant, and a client that keeps
getting these errors runs out of credits. Since the command sequence
window was added in commit fd8c97d7c1cc ("ksmbd: implement the command
sequence window"), this also ends the connection: after NEGOTIATE, the
second request that names an unknown session is already outside the
window. A client whose session has expired loses a credit with every
request, until it can no longer send the SESSION_SETUP that would
reauthenticate it.

MS-SMB2 has the server consume a credit for every request but CANCEL
(3.3.4.1.2) and put the credits it grants in an error response as in
any other (3.3.4.4). Charge the request's credits and grant the ones it
asks for, as for a request on a valid session, before the response is
signed, except for an SMB2 CANCEL, which consumes no credit. This
response ends the work, so it reports the credits granted for the whole
compound.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 52eee04e0d93a..1522eb560e838 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -132,6 +132,36 @@ static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
 		conn->ops->set_sign_rsp(work);
 }
 
+/*
+ * Charge the credits of a request that is answered without going through
+ * __process_request(), and grant the ones it asked for. This response ends
+ * the work, so it carries the credits granted for the whole compound.
+ */
+static int ksmbd_set_failed_rsp_credits(struct ksmbd_work *work)
+{
+	struct ksmbd_conn *conn = work->conn;
+	struct smb2_hdr *rsp_hdr;
+	int rc;
+
+	/* An SMB2 CANCEL consumes no credit (MS-SMB2 3.3.4.1.2) */
+	if (!conn->ops->set_rsp_credits ||
+	    conn->ops->get_cmd_val(work) == SMB2_CANCEL_HE)
+		return 0;
+
+	spin_lock(&conn->credits_lock);
+	rc = conn->ops->set_rsp_credits(work);
+	spin_unlock(&conn->credits_lock);
+	if (rc < 0)
+		return rc;
+
+	if (work->next_smb2_rcv_hdr_off)
+		rsp_hdr = ksmbd_resp_buf_next(work);
+	else
+		rsp_hdr = ksmbd_resp_buf_curr(work);
+	rsp_hdr->CreditRequest = cpu_to_le16(work->credits_granted);
+	return 0;
+}
+
 #define SERVER_HANDLER_CONTINUE		0
 #define SERVER_HANDLER_ABORT		1
 
@@ -300,6 +330,17 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 				else
 					conn->ops->set_rsp_status(work,
 						STATUS_USER_SESSION_DELETED);
+				/*
+				 * The request has used its credits, so charge
+				 * them and grant new ones in this response, as
+				 * for a request on a valid session, and before
+				 * the response is signed.
+				 */
+				if (ksmbd_set_failed_rsp_credits(work)) {
+					conn->ops->set_rsp_status(work,
+						STATUS_INVALID_PARAMETER);
+					goto send;
+				}
 				if (conn->ops->is_sign_req(work, conn->ops->get_cmd_val(work))) {
 					struct smb2_hdr *rsp_hdr;
 
-- 
2.43.0

