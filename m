Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739234;
	b=sowdso5wPOTyZhlCL3ioTxMOsVPW5Xcz7yzjr73As246uQtgCzuu6IdzP/8dxPioi/lN
	 oaVPOTylOOeAKmpwbmbF0HQR/ffGdmXBhRor4t9UlWhksugNGKKeMXGJrYINpxeSSleed
	 9T76TtBzky/ismNUKse9S4tSVhDj5tQnhin7J3E86nQL2jHi9LgPuM6nZ8Gl84I1xxez7
	 H0e0Smsd0NkkugN7HO8FRuYpQk/Hvl6T8ka+1whTQNmNt0GmEPTQOCy+N7YCBVX/pQcnt
	 iTp5zw81sKsdz0bnozYss57dOyDNDdGQOT6g9cZ/YDwvZwSRp99ouTfLEDJHzo3Brfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SexY85KTBkcPpSSz9lzCXLt6aG4hGRBeEAEDC3GPaE4=;
	b=kYrSiEqqUK+wtStQeZtmcgxbhTq7E8j9QDOJj/lxg+L8Ek77+7izBv/rD8PnUrylcxN3
	 cFkFOvzCh1svpI2mPU1CbCyioWaLHFa2P+7fs+ZqAc60hGW3tVEG17/cvMB/bq3aMBqgz
	 E34w5NqNI/nhVXR7fzGdRQGS/7ACSdbv1AcK6YuhT9poAchjMUkro+t+xsMXRKCdeVuHh
	 7qQdz4tsw5k5UUSgoMUDfHSCecmgYjXPhMzCYa0ZyHL/6oZuUt2BE0HJdREt/p1G2zL8a
	 TZxQZWJrMuXI49kObqM3n4+2+w2vGza8XQhzGf57H3gD8cN76knvVc0j670NIna4JRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJz93gn6;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0D606A886
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B0D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJz93gn6
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b37951a397so573841a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739233; x=1795344033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SexY85KTBkcPpSSz9lzCXLt6aG4hGRBeEAEDC3GPaE4=;
        b=aJz93gn60oQrWRhk19r5rrqgl8h5ouq1q2TpxrDF7I6W2npEFiCPrMR0obV/dLg3Dh
         A34f8HBYPYnaBH7KUORMLnYN2Lp9fJO722RkkKVl0Du9O1Ra/Vb9Jh/UGHCvYGoYO8h+
         9P9mVa2mvaSXPAi+kkVW1K4ZvvQ/oec4lA0DehAdTrQB5M6nefO0QGxW5UPCUo1+t/Ae
         /aS2wv3XadJ5jkgluS49wzJGuifg0EkX00tfBSQipRiFTLNAVeItRIG4Dpk5yez0yaDi
         6Xs/Q7tXzW+qfUbCtuE30eGn8Pv+Hj9mPIoVojsvsNsAV3z5uPuFwe7ywT/o1okGjF0e
         psQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739233; x=1795344033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SexY85KTBkcPpSSz9lzCXLt6aG4hGRBeEAEDC3GPaE4=;
        b=KgJQltw1Iq/dE+6MIUo9bI4UAVO5DEVO/+lUym+dzv7e8984XS37X0hE4YuV3gWwyx
         ImKbs+sS/XSwmvB5NFhMsCyIvl0u7wzjZqL8Fa1i/96IdAUqdqx4KnmZ/RJLUUjcN+R3
         d6IenJ/BqVfFToVfM21g8/oXy/c8Y19RKtxHoUpRyLs7muKPSCS/0DvkJVX8E9tjxbt4
         n0hd/Kpl1kwYwGwW74qreBZqC/SDqyo6+X+FsVpklAhjyjd2pl29YsNY7K5iNFX9wYL0
         pJ8NGP/4KMFyQMcNMd5lg7QJOvfynN2lguvTXU+X1S3u9uevcQetvvf6nqrYtMaSZJj8
         ld6Q==
X-Forwarded-Encrypted: i=1; AL+hErGzES473obMOaqElkh+cWDl7/6oznBDSuVjRVV2iDiMszCVQ0v20LvbJzSWiTqqzARoaVSyLhRBPMtJ9Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xxmdT1CEUxfXWrSSEkyFl64SymIDO73sAks8o5oU2IUUwx8ac
	7jllCjAOennSjWAem7aRfRz2Egj9NS7My8n6w4UmDODncTARR/Ej0ZrJ
X-Gm-Gg: AYBFou2GwO1R5ledYC6l+5YNMaKe0u33XMuDi4bBP1UlgDcuqeHu7TPoW6uDsh63luM
	Aaz/JH4CWIS+XPJQCTt+I1YJ8yM9ADbb0eVmbb0JRo9/F22spISBw4jOZcY6sS3oFdB8xLyfkya
	MLqQzu7ory9FxbZFGtqW81TnSm0c8qVC9j4M3oHUWidMeiIdvqFw/GigaFi/TyOC/8T5WeqTkZT
	hZXXe7tbnFf0reElDTSxo07inZVTanFXv1P7YbVzwmC0PlrSRRGu5cuXnvhlYGz1o0IfQlXRiQu
	R7pYv9e+NRXaRnITq+Bkps6L640G7YZzBxOFbq3yATB8a4gkVE2vzpDw1sDKHSjCXWfdu3aOJ0D
	L/Dy5m+TFO/GDozaK5OnC+0xUarAl8pjDE4ZdE0xafuJWYwsQNkGDgXX/AtYW6wnkczjsVCHUIr
	crg1JubQQVDKvN8lt6Ix8dNdRqr2LcpzLH54w1911VmjUln5IzdwzKTsvmBJXUs30Le6Fpo8crs
	kxK3xWFLX/rkNSsZDghCZ+iyth2MQmMyAHFV6s23CYGAE6zw2ouPeloY+IpDRuS4GnBM+BaJSZx
	tF4BXqeN9dS9n83rBPJbHnLERY0yQQbPqlSaiJfmZukSVpIR6NcV9X5wZC0YwwRWYrxLT8/Wy+j
	9meOVVcuZgvuh3/d1mt6UxLwVqmKHc5CCw29tn2LCmMjYXOi6ZYMXbLq9R+yMJdKEzHEc75IADv
	HI+MQLhNcOT1T3t22silHeZYtenBy4Sjm0GJhWPGTgO5f1fUYhnG8eGVLOD31+3eCreyMqqCPAW
	402aRSEY2oLAvoEBmTzsEkvupDSl5Mb6xZdhz+Z0vUMzk+2OM5aRCXKfBVyof85
X-Received: by 2002:a17:90b:5107:b0:3ac:9d83:885e with SMTP id 98e67ed59e1d1-3b1b0d06feamr7368179a91.52.1794739233252;
        Sun, 15 Nov 2026 02:40:33 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm26739145ad.57.2026.11.15.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:40:32 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] scsi: target: iscsi: factor out iscsit_stop_kthreads()
Date: Sun, 15 Nov 2026 21:10:05 +1030
Message-Id: <e6199ca99e81a80af4c4c8f43885c628377b22d2.1794739041.git.danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <cover.1794739041.git.danjwade95@gmail.com>
References: <cover.1794739041.git.danjwade95@gmail.com>
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

iscsi_target_do_tx_login_io() stops a connection's RX and TX kthreads
and releases its thread-set bitmap slot inline on its error path. The
next patch needs that same teardown from iscsi_post_login_handler(), so
move it to a helper beside iscsit_start_kthreads().

No functional change.

Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
 drivers/target/iscsi/iscsi_target_login.c | 17 +++++++++++++++++
 drivers/target/iscsi/iscsi_target_login.h |  1 +
 drivers/target/iscsi/iscsi_target_nego.c  | 17 ++---------------
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index c282b6a7029..f4df5518171 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -643,6 +643,23 @@ int iscsit_start_kthreads(struct iscsit_conn *conn)
 	return ret;
 }
 
+void iscsit_stop_kthreads(struct iscsit_conn *conn)
+{
+	if (conn->rx_thread && conn->rx_thread_active) {
+		send_sig(SIGINT, conn->rx_thread, 1);
+		complete(&conn->rx_login_comp);
+		kthread_stop(conn->rx_thread);
+	}
+	if (conn->tx_thread && conn->tx_thread_active) {
+		send_sig(SIGINT, conn->tx_thread, 1);
+		kthread_stop(conn->tx_thread);
+	}
+	spin_lock(&iscsit_global->ts_bitmap_lock);
+	bitmap_release_region(iscsit_global->ts_bitmap, conn->bitmap_id,
+			      get_order(1));
+	spin_unlock(&iscsit_global->ts_bitmap_lock);
+}
+
 void iscsi_post_login_handler(
 	struct iscsi_np *np,
 	struct iscsit_conn *conn,
diff --git a/drivers/target/iscsi/iscsi_target_login.h b/drivers/target/iscsi/iscsi_target_login.h
index 03c7d695d58..02c5f6ecbec 100644
--- a/drivers/target/iscsi/iscsi_target_login.h
+++ b/drivers/target/iscsi/iscsi_target_login.h
@@ -20,6 +20,7 @@ extern int iscsit_get_login_rx(struct iscsit_conn *, struct iscsi_login *);
 extern int iscsit_put_login_tx(struct iscsit_conn *, struct iscsi_login *, u32);
 extern void iscsit_free_conn(struct iscsit_conn *);
 extern int iscsit_start_kthreads(struct iscsit_conn *);
+extern void iscsit_stop_kthreads(struct iscsit_conn *);
 extern void iscsi_post_login_handler(struct iscsi_np *, struct iscsit_conn *, u8);
 extern void iscsi_target_login_sess_out(struct iscsit_conn *, bool, bool);
 extern int iscsi_target_login_thread(void *);
diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index b03ed154ca3..d56b28446d3 100644
--- a/drivers/target/iscsi/iscsi_target_nego.c
+++ b/drivers/target/iscsi/iscsi_target_nego.c
@@ -362,21 +362,8 @@ static int iscsi_target_do_tx_login_io(struct iscsit_conn *conn, struct iscsi_lo
 	return 0;
 
 err:
-	if (login->login_complete) {
-		if (conn->rx_thread && conn->rx_thread_active) {
-			send_sig(SIGINT, conn->rx_thread, 1);
-			complete(&conn->rx_login_comp);
-			kthread_stop(conn->rx_thread);
-		}
-		if (conn->tx_thread && conn->tx_thread_active) {
-			send_sig(SIGINT, conn->tx_thread, 1);
-			kthread_stop(conn->tx_thread);
-		}
-		spin_lock(&iscsit_global->ts_bitmap_lock);
-		bitmap_release_region(iscsit_global->ts_bitmap, conn->bitmap_id,
-				      get_order(1));
-		spin_unlock(&iscsit_global->ts_bitmap_lock);
-	}
+	if (login->login_complete)
+		iscsit_stop_kthreads(conn);
 	return -1;
 }
 
-- 
2.39.0.windows.2

