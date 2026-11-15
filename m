Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733166;
	b=F8mcmndY7kWGHOHL3flhEAegmIKaGNrtjO3olz1rYcVMUvOzLS//gu7wAsG91ci9Y5N8
	 AYaS62swfOFQoCJwDFQzsp4YMb6tdsJjIo0/yfdedXNs9ZxC65GEIApv8cEwG6aOHpE5F
	 tpMO64F9S6Q1cu+QD9FS+N/iVw5dESW90rp0va/X5Ipl66byNxracDApQzUCDnjX8z4Lz
	 lx1g61KLMYpKl2u3dihmzI6uFaac4YKBoupvItOkX+nJiW6oS9XVSOUavODlUdKH/LgI0
	 vtA5tE/t/Vhwe7mJieBTvzmwVUSdnz33XSCf3CyMlvlpylZGVzT6A1yaKaLp6mnr4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SexY85KTBkcPpSSz9lzCXLt6aG4hGRBeEAEDC3GPaE4=;
	b=f1+uO5R/mg0vDStjIc6XudUTE/F5GmtFwCvXukrd6u8ZuX5SD13Tp6Z8pkSN+kws2lCq
	 X1GUWH8spyL5eSV0u0fJUt7umnFLkIYaKjHA95CGIGT5urQ+TQfwoe0vMbi2VLQpr1QAW
	 hxQoEFK5f8L14jd3NBDb7AGYZuEYhultrPY1lfNSHH/EJ0G5lsOlPP3qqB5CimU1Ok6sA
	 ntRc/R3pqVavxF6qMtXh1acWn+QfQC+LskKjgQLg6fnzZfCa1HN3egtwfBzhB5eoKWKEN
	 cSuXDO+gNMQQ1c4mtW/IBz9fLfhQjrezLJwPBerbnDoqYCxBIj+uScHEWuv3kdVnpAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ufvbUa/C";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944D606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B944D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufvbUa/C
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2165621a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733165; x=1795337965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SexY85KTBkcPpSSz9lzCXLt6aG4hGRBeEAEDC3GPaE4=;
        b=ufvbUa/CyNW0QD0sqLv86lbibrg8v63JuwXnM1pa1hOYQdWUVenxsUMM2kFXbx79Ny
         OAbopnSnMkUkMKjjWSXq4lqymggXuo01tyM0LiselI0JGGsIHkVmVv1naJpqw1KHf373
         QY2R+TGyz5zqKN/cs74io7f3GEBznRH656w7mE0C17ntInTbvIwwKDTpw2PTdlA9WST5
         TxLT/CmdK3E4/3pWOj0kA0iR0rr67q97i+IYdQtqDq5mKshfQGK1GOdqXEYPO8ASF3AD
         klpE2OffPXghSxNUk6GK9J/WKYdaDyngjV+4KQjgBUKyQGFOXuNBfozb+n7p8ycWsNTe
         y3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733165; x=1795337965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SexY85KTBkcPpSSz9lzCXLt6aG4hGRBeEAEDC3GPaE4=;
        b=Dbh3g1LIw1k3hJAYEIGVVRY5mlht0/lcih3GqFRJypbbUpMzyc2VDrBrIag4nzhdgh
         gsEMu4w21aoCklvFkTiCIZfl14c4gMDHz4r1oQZ2o8LS4z3p4BaElclRzjtDYweGHslM
         evW0wvJWGJ/Gm4PgyVDs2j+aZo0bJYdIN+RPOZzvMumfPz46e5APriGEzll4jnosnymk
         q533gxB3yoqJ2V/NoZBotncC34K6RJ+NlWqlVSS30MStXUvigM+L/6bzMigrN5dTcH+e
         SXlBCHjx6Vh4qQM5Xrgga01MitCj99WsRpG1XBqWb3mZrisRGDvk3EEW1Sg4SAAzW/aF
         8D6w==
X-Forwarded-Encrypted: i=1; AL+hErH0qQHPS2eivEnWtRcfC5/IhXidu5uDcCs2FbT90o10ZUdA02Nw3Wn1yt5DhqT8BTO1ngCgnbuE0Y+AQqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mqBxETF+prBsHflxcFrGZJPR/Ym9OK4VVrMMZ0kTCan4EDDJq
	WO2TYPAcfeATprjzGSp8Iv1FIf/NLaR9alZ4PCCauNr8LMI9+2RAFczB
X-Gm-Gg: AYBFou2zt9Lsfg7VE9wkuUGiGpoSGbx8Lub1h1n9j1R5x7nm5oNnCyfepo4uaP2QbRT
	kp/d5vbF90lJCO/EE0mpXRXqqTRkm4ZLqPpVDADmJ9R8u78nrpkObHABnyQtfI4E3D/Q0XfMlwd
	5v4vZ7CPNVXY+NPNZDg8yFm1jlpEsPwpohGzHGfPwXTbv7DQYFhg8xiWuVkBK6vff4FSO8gboD6
	JVPAgI7PCusdBK+6flmslaDyffOkXfORRpU3eVLhjyqpTHSLfY851NAUbrMA7d3ytdOirqn6IVU
	lf8jKWfXKg2qVMY9D7yT+ReBN5im1pju6aMiVUYQN6aGS78AHyIPHvW/zsZ4rTD8sqEcBQqsmK9
	probzlgkuFZBLz5/x6tc0mvS8Gznc7xz9/Iw08eorLIrENtYHsn1yxVGz9eqFA6Ksgg/QQagSkQ
	+Bp5wigJkB/lFYc7y0PUx1gR/nz0oLyJJC2tyICm9bLKckykEud1Q9NCE0AfLU3JaqG4lCukUMx
	azpp0LaBJ4FImIx5jcx/R8/bebYv4ZZVSmmRn3/0bJat/leBPu20BqKrfA7dCzQs0u5OT9+0hAR
	4yFABsadpRG3sXszwoMi/yYDcg0DHETihsehFZ91yFXYa8ok2m5EsaPRCOCauIOqSe9RaoFN46V
	Eh4rV8/7FN+TdU6OXbflteb3OZ3evZfHZ0Eh3OqzJlYzernnUD8KzSqyXgggJPC+zxdHjKgSks/
	MdaVMcEmJ9FtBoThJna/qCMCfH25bnO1oBN14gA7xQ6WK53jciYukZ+6ser+T2PRqQb02JwMWhX
	xgzXktkzOYvdOejz+7R5Sp2HRrQTOBwxY8vdgJQoRaSYn1LL07cvSJx2aTVCSylZaaiKH8k57MF
	+yAYmIWeQA==
X-Received: by 2002:a17:90b:498e:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b1b0ba0ac4mr7507738a91.24.1794733164961;
        Sun, 15 Nov 2026 00:59:24 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm16770310a91.1.2026.11.15.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:59:24 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] scsi: target: iscsi: factor out iscsit_stop_kthreads()
Date: Sun, 15 Nov 2026 19:27:44 +1030
Message-Id: <e6199ca99e81a80af4c4c8f43885c628377b22d2.1794732723.git.danjwade95@gmail.com>
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

