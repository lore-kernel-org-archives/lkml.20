Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733171;
	b=Wbl5IZwDFJVrVCsG2124tDohZ1WE7IhGnY5yHwvWpsjClQEZz6lgIa/BqOf+yBHOH5iL
	 31jbroAYo/pZOh/Uq4TX8pJEHRG4mrSu2+t2+hfizccvdEDlIkxamI/G1IHf6YV8KS14g
	 +aZd1JTLMSbtag5hVhV8scFo7iAPxI7KvpHubc19GEylz5UoYdzReqdWdZzmyyCLcvsJ+
	 SNasZffz17fZCTXttV1md9e+Zd+7JK5OQOBB+mDhtEP3q1mBZP0VpIPQvTfSgkxvHjZn2
	 MkDu5E8X/ENPIqO/6HPksrZ9/vsVr8e4d1uziNQ2S4y9LP5fcw+6CD6G4Bh4heMjxdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RetYn0BIqzHeFHXhT42j9H/gxZJ9ddxXCM6J09DUuKI=;
	b=E3qk0a466SxMoFu/tcl2O9jMrHknddbGGaZyDrjDwmBe43MCfNG0AO36igzZzgP+Vyrt
	 ftwLGD1ukgim5j1CpyFHqZeKowJF5jJBFAvbVNacR9uI2HjcsRCSE6QgWbuj2FHRcEBA6
	 r+gkj0sMAT0MT50kKyrC1eB/huJmSVfSpGRa++qmV5/Wwlrq7ln2VkpbIUGfD6JGp8OAW
	 zOtWJzG4BcJddR1aVvGuP6pTOwCfHYsrcI9gffHQe6nqZlbRTgf78xeUr1WFFDa0MWK4G
	 +gKi0CdflSyVlGOBR0tH9N4OjQj8RiLffxhhaOCon5NyKJMcDHdHvFVouDsa4H0E6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i90xKGzE;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C4606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i90xKGzE
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso624673a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733170; x=1795337970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RetYn0BIqzHeFHXhT42j9H/gxZJ9ddxXCM6J09DUuKI=;
        b=i90xKGzE+Tp3hLUZQfiRTmtiGnVbak69A05wCd0MR5g4YSOFoo/9aGCDiFrYikMGuD
         lMBogwWW6V1oVGLg62FWVoooUkgxiPsZApgVtNa94uR66gDwyM8qJlsCFxUizEss9QQk
         4UwUFhT66nYMW7nVdU3EzpHMf6YsjPXp4yhynHqStlVFZq5U43pXyyPy3Qi0qGX4pIGi
         8uHI2kOgGPfOLj2Mctz/wxU9WBmAL7AVJnaYiwtq+NlFpNEheooJY9aDZYaXtAdEexuJ
         6QdVzCrxMg+M+QDsOKyhXcbZlxZmAtNdy/LcDY8h7zZ1DDEQwPi+GVzAfL5GwN4IvxG+
         14xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733170; x=1795337970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RetYn0BIqzHeFHXhT42j9H/gxZJ9ddxXCM6J09DUuKI=;
        b=pbdu0AWk4mWYj7yB7X2tc/1feDCkd6iCgiY3CWXymKGFSa/QNfampTNIAH22bYzvkt
         3i963A9yHN+j9mwfw6YZQkSsW5w43ZWI/Y6Wgseg4kWhHh4tZ5JrviqU7hiWai5cc7Yv
         vzSNekzjxM3cjQUIpfM29k9gVzkVDpl2weIpQr6GkMpFaljpN9DSKG68IfVGDqwVNUFm
         eX5U1hBexrya8dNCqvTbWhf8g0IMuA/iUQxKsXe0ZQkU+kUGbOGUY1tkiAld8GvYJJbF
         0f2kH8vl9+EwAc9F7ArAmcPtTqY3wQmUIMlkW5NuKDW1PEEHlPHYTVVfKWUTp6y9OVEE
         Gw5A==
X-Forwarded-Encrypted: i=1; AL+hErF9EgPEjQ9paUg2YCcIyR1++bWnLPNiviPhnv3pDOpC+r7Yp1cWrhRSyXSDSf3MHA1RM8B2ir0N6kHn/Yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mO+uYrVXYrbQckqhxEk7XVdc1uckFg62rfqJ4J/rGiKybhN6v
	o/hE4UdHx7OGYO6DTLwSCSxcvNn36Xp92peMeOSYUn+yEdIki7tQ+jzz
X-Gm-Gg: AYBFou3gJ+xxDjamFNXNuIqzyDnOSuEkaTPhswg2eUvqU6UbMYS2Gv1HInxsB8wjEA/
	5Wj7R2UfaUi/xFSU9PE8Nr7DdFVLepC8m0BVe9HJTYA4D4crL6Ie9Z7Mm8JuMyYvyGhV6D0KSS8
	7aDq2ybTFqvvG9FjVxCyv8/S8glusyq8tw27InNWvJnSU5FAQn/civVXILnZtQpnlCGO4E87TIX
	EgKPVNdrixoDigK73l4hinYZtb3sC7MKfJUqdBD2jK+F+hK9/rzpocP5Opc5opuv1WL7P7qOWGI
	RaKRk21T8FV29Lz1vM7etjJVqsQBn7YQ6sz0Htz8oBPy8fQVFSEdfD9F4+5qPQURCIAC9L8vwm0
	oklq9TKhvsKy9VlrkP0+vfTTtqvHC8YEoJ1dOhNN4UgdSPQBtd0b4qW2vzoecE+bYw0mV6tm4uC
	5defj19wX7y7kc1ZV9A7MQx+QvWaH4f8+mnGTK/THVcRkbmTNnPs20h+fcqb6ne0Tx6EWT+GMvO
	qTIPX73yxkogHVUeAv+RGlPae6UKBx2Dvf94vZNT9jBSvzNamJsWIEMYhtfGfY/nlYgMqiiK7V0
	fMib1Jb9znd3XG9fJqxvCDPwt3i2sVsW+qH44+AuYN1AGPRA5FDq/jO49Ppdmu/iSNVYeuxFxFK
	NsVAykulRDqZY7ufacBVhJzqqfAliqmB40TboVudJVcQzscMEuyTM7epB1Q/45sErXdlKMovbvh
	nnqIE7DFIthAkusNnP323iWELnqS8hIPM9hBb8F3XfuLDJaHaKfHbnfm0YP3AdfqdxXYEYsRkNL
	BFphYdb6Z2lD1OKejcQxAjt55UupPpQ4ctP9ALipPMMgR7vTLE9Jv+lK9E5OOR7PMfhN1j82YC6
	g9Emf2+9Ag==
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr5779358a91.61.1794733169887;
        Sun, 15 Nov 2026 00:59:29 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm16770310a91.1.2026.11.15.00.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:59:29 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] scsi: target: iscsi: don't attach a connection to a closing session
Date: Sun, 15 Nov 2026 19:27:45 +1030
Message-Id: <3ae0ce68449390d9e3893e5328367c4db3818f96.1794732723.git.danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <cover.1794732723.git.danjwade95@gmail.com>
References: <cover.1794732723.git.danjwade95@gmail.com>
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

iscsi_login_non_zero_tsih_s2() finds a session on tpg_sess_list, skips it
if it is already marked for teardown, and takes a usage count it holds
across the whole login negotiation.  That skip is sampled once, before
the negotiation, and never re-evaluated.

If the session's last connection goes away while the login is still
negotiating, iscsit_close_connection() sees ->nconn reach zero, commits
to the free under ->conn_lock and calls iscsit_close_session(), which
sleeps in iscsit_check_session_usage_count() on the reference the login
holds.  iscsi_post_login_handler() then attaches the new connection,
arms its NOP-In timer and drops that reference, which is what releases the
free.  conn->sess is left dangling and the timer walks the freed session:

  BUG: KASAN: slab-use-after-free in iscsit_allocate_cmd+0x6de/0x780
   iscsit_handle_nopin_timeout <- call_timer_fn <- run_timer_softirq
  Freed by task ...: kfree <- iscsit_close_session
                     <- iscsit_close_connection
                     <- iscsit_take_action_for_connection_exit

MaxConnections does not prevent this.
iscsi_login_post_auth_non_zero_tsih() tests
(atomic_read(&sess->nconn) + 1) > MaxConnections after the reference is
taken, and ->nconn is 0 here, so (0 + 1) > 1 is false even at the
default of 1.

iscsit_close_connection() tests ->nconn under sess->conn_lock and
iscsi_post_login_handler() attaches under the same lock, so publishing the
close decision in that critical section and re-testing it in the one that
attaches makes the two mutually exclusive.  ->session_close is already
that flag: only ever set, never cleared, and the logout and explicit close
branches already require it.  Set it in the ERL=0 fall-back branch too and
refuse the login when it is set, dropping only the reference the login
took so iscsit_close_session() can finish the free it committed to.

The refused connection is torn down here because its kthreads were started
before the final login response went out.

Tested on mainline with KASAN: unpatched, the reproducer produces the
report above and then a general protection fault; with the series applied
the login is refused and it no longer triggers.

Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
 drivers/target/iscsi/iscsi_target.c       |  6 ++++
 drivers/target/iscsi/iscsi_target_login.c | 41 +++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
index 124ff269b8e..ee7df7f2723 100644
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@ -4431,6 +4431,12 @@ int iscsit_close_connection(
 	 */
 	if (!atomic_read(&sess->session_reinstatement) &&
 	     atomic_read(&sess->session_fall_back_to_erl0)) {
+		/*
+		 * Publish the close decision under ->conn_lock so a non-leading
+		 * login attaching in iscsi_post_login_handler() sees it.  The
+		 * branches below already require ->session_close.
+		 */
+		atomic_set(&sess->session_close, 1);
 		spin_unlock_bh(&sess->conn_lock);
 		complete_all(&sess->session_wait_comp);
 		iscsit_close_session(sess, true);
diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index f4df5518171..de0cd95aff0 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -660,6 +660,33 @@ void iscsit_stop_kthreads(struct iscsit_conn *conn)
 	spin_unlock(&iscsit_global->ts_bitmap_lock);
 }
 
+/*
+ * Drop a connection whose kthreads are already running but that must not enter
+ * full feature phase.  conn->sess must not be touched once this returns.
+ */
+static void iscsi_post_login_fail_conn(struct iscsit_conn *conn)
+{
+	/*
+	 * iscsi_target_tx_thread() only leaves cleanup to this context while
+	 * conn_state is TARG_CONN_STATE_IN_LOGIN; otherwise it would reach
+	 * iscsit_close_connection() and walk the session being refused.
+	 */
+	conn->conn_state = TARG_CONN_STATE_IN_LOGIN;
+	iscsit_stop_kthreads(conn);
+	iscsit_dec_conn_usage_count(conn);
+
+	if (conn->sock) {
+		sock_release(conn->sock);
+		conn->sock = NULL;
+	}
+	if (conn->conn_transport->iscsit_wait_conn)
+		conn->conn_transport->iscsit_wait_conn(conn);
+	if (conn->conn_transport->iscsit_free_conn)
+		conn->conn_transport->iscsit_free_conn(conn);
+
+	iscsit_free_conn(conn);
+}
+
 void iscsi_post_login_handler(
 	struct iscsi_np *np,
 	struct iscsit_conn *conn,
@@ -690,6 +717,20 @@ void iscsi_post_login_handler(
 		conn->param_list = NULL;
 
 		spin_lock_bh(&sess->conn_lock);
+		/*
+		 * The skip filter in iscsi_login_non_zero_tsih_s2() sampled this
+		 * before the negotiation.  Re-test under the lock that serialises
+		 * against the ->nconn test in iscsit_close_connection().
+		 */
+		if (atomic_read(&sess->session_close)) {
+			spin_unlock_bh(&sess->conn_lock);
+			pr_err("iSCSI session is closing, failing login on CID: %u\n",
+			       conn->cid);
+			iscsi_post_login_fail_conn(conn);
+			/* Last access to @sess: this lets close_session() free it. */
+			iscsit_dec_session_usage_count(sess);
+			return;
+		}
 		atomic_set(&sess->session_continuation, 0);
 		if (sess->session_state == TARG_SESS_STATE_FAILED) {
 			pr_debug("Moving to"
-- 
2.39.0.windows.2

