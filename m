Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733174;
	b=0OSBLtjD+6LavgGjMoHC6zJu4NNsryv0YZTFL9GvVtsMbsxzwzFN8FIZUWCE0qgFd/7s
	 VquH2LCDVRaDwvqz8G5uksX97sfyJUka6D7Sg7uoSdTz5Uj6cLGQh3SjIydkTXlk9nrjM
	 UM9XotlnBEh8g7gEaceIx9XGVGNOinma7yXNeKEjPJxWCA4aasLBrOBSbo3nU8J/cNIpi
	 BcFD8/qIWSdpj1KVX2ZB29LHihyZZ7S6+Jyub+1GTF02si6Jawk3TzygdHN3hLRQtKvQD
	 m3R17C4RoTK/39A3hmydo19g0z4kpYocd7k46VVA3BTVG32ai1r4+zhfZ1S7d5Y665A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bfgcvzbcu0GB8A+loCRLH2fTP7BpBf7AqSBWg6Ca8TU=;
	b=0cU1BZgQcLOt+bWjlRY8BLdt9XSKRbmwP/VBAvIcLLejnJIYPvqlxe9f6Haatu+DfQZq
	 lUfeP4Xiniu9MW9IQmyAMlnIPZrum0o5MGB+gAuoSDeRRnwJ12VeSXsVbL8LCwzuQ3tWM
	 bJq30y13g3Itgo3KrWJ1grqkJJZgrB9ZhiZ48xOvUFEtfP+cYFcJuzA5ATGCHzxxt8ffD
	 jRlt4xMXugpoeUNnFWJAYduCixSOhy8OifQdiYsTrAGYAfIhkHopQDChA/6guPbEMxpNZ
	 tEBUkKnuKJw7A3eQul0qMDY16cnlRBoB6zvLHi0W+g2tk22ewce/vZM1LCwf6pWnJ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NsnscGB0;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10030606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10030606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NsnscGB0
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1354291a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733173; x=1795337973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfgcvzbcu0GB8A+loCRLH2fTP7BpBf7AqSBWg6Ca8TU=;
        b=NsnscGB06RsAuOm/sNj/84bZQPVJ+3VLasXoa6KyppDCjtdGh0rkP6IPnYq2I4SA9q
         tfniGtsIdp3YG8bYDOB8mTeD1bK13SSuxNaOvpqRJRvMHlOAqYDlp32PLFIe8dM8pyz9
         ONMZ5myb4J//ehiFcMmQDo0yd70sKKStGS4dPm8ltsuICobX1CuVPpbiVsxsPtHVmIt2
         RAaly/cOwcEor9glU+cuZWi9dcWykqlpViMQbFzLXM9IzCaSGmy5idx5rM6vjUTUmhbu
         UwAIoemHRR4Fy9IcZsEWCEdgo75ohHZacPYiWXG1IuRrTAIFkZGsVCW6c27yTrJ3tnvT
         K9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733173; x=1795337973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfgcvzbcu0GB8A+loCRLH2fTP7BpBf7AqSBWg6Ca8TU=;
        b=Lluz6Lq5PY2Fr7ZU1od8gC4hJZZXxJAv/vkEzvSYjKkBAhzzTMlpv8U+PkVz+z3ree
         AkfaD8jSMTcXM31RTI9qQ9yOBpid23yp5We9yxjdpxeABEB73vLqs4kvy+ynqCebeJxY
         2VZ9zPfwqZLHlhbXMIaxB0sneLS6CxolTEfiJDSkk0OjXO5SJeaMmF8dCwjwSj5rh6sx
         PZU/Z2WZYz8xL6BkN0eM5u7nOtBTuaHNeVUh4L0EitrzW00fH7HQbZUIJIjnH4fPTAK8
         es9pozwAWMkQq0T46o1gLIEhMXOjWIV1cutKABVdkDgYat5+s9NI23QgKbuLd4kbQzmh
         lrGA==
X-Forwarded-Encrypted: i=1; AL+hErGN5w/8Lvq9DJfjD2toJ6V+qQNypi8HCqueWaT9gO7Gt2031wIlbCY1VTCZw6+qIRwiwyIqCOnIky6uup8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gXiu3DhAdPTmI4BC17Jt2wYSnlQDRH3ih+8KBxCKGpYO/u63Y
	P6doVkH8FIGeaaUTEKevewswQ6QSsySfu5szetUYCktNamZ6Qnsu8NIH
X-Gm-Gg: AYBFou0kYoZgX0rhLT8/rMs8DVG59OL/PC2Jtj78BdbzesoJTR13C3MWqLJoSkUD7nE
	tpnh7zUZn7m102KAHROrDuxJHM0xZ6WFamuezzB0eCdR5YrRrjw3vIda6SRM/dawrRa40b22i8y
	NfG0tcaM/qd08dONFUIEBkB9b6mNh4kSHSLgb1AWLmdcJpHrOfH4hgj1ivDvPcmRUHX0QhjgqAl
	kBySDIP60Oj6qq4Nb9GBu2zbVH9JMWb+F1nL1ZYciHYRTSi/JRVqCVhTHv7qgrLFfCZloiJqVss
	Jnn0735hkNZt0UMW0EyOFxc5BT1BKZAnJFIIthq/GThIN/oK1YM0X87Uk6XIWaAWeQkfKyZR52d
	/sw/jT0FAvej+bVNTqNnt2jBb1rcHNcRJecuNnSJWJJsdBDrns/TwIz7ZVX4CrpSlHBDZ65TVF3
	OgZbvniicLQ0tFcwV5ASo9MO+4TNI5i7XX6w4+zI/vZ/P/FpGj+zjrCHseeH8eZVjwl/CTKk/eq
	4beG64efatFFSqC/jY+ecDk6cOFYI4gjt9UnHimEC1I2j3xLqa+xLcxp33ydLlIj9L+Mu6R5lT7
	rJYsKZZ8oZVFEkP6K4UUreDyCeaqCua+Rh1tnpxRCK3NiL/wPWpXvSannNs4i3LHwcq+q3AxozC
	uzRQG0xs39HztUS0U7KdCKD6sS15nt9/jy8z1narQNzb1sRhIx5COt1cEIEOv4z7QY2Ys89YVn1
	JOIqN97W4/tuIALjUrxWPBA0F4QTIxTdaNUtIqRYgvEyt8TRg3E+DEK2c/JkME9Kei7zN06r/SR
	jTwc/C3ZAe7Z4Ku4fRDuHdvy6Y5Pt4kEVBad/tMoVthxzYEvkvcrcrya6EgoopR1MruriBw1QOg
	iMVeRRcpzw==
X-Received: by 2002:a17:90b:4e8f:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3b1b0b52e04mr7258091a91.44.1794733173431;
        Sun, 15 Nov 2026 00:59:33 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm16770310a91.1.2026.11.15.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:59:33 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] scsi: target: iscsi: don't re-arm Time2Retain on a closing session
Date: Sun, 15 Nov 2026 19:27:46 +1030
Message-Id: <e43c5b85225ade84c13948ebc6eafb9c583115d5.1794732723.git.danjwade95@gmail.com>
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

iscsi_target_login_sess_out() re-arms the Time2Retain timer of the
session whose login just failed.  In the window closed by the previous
patch that session may already be on its way out: iscsit_close_session()
stops that timer, then sleeps in iscsit_check_session_usage_count() on
the reference this path is about to drop, and frees the session as soon
as it is dropped.  A re-arm therefore lands between the stop and the
free, and leaves an armed timer on freed memory.

->session_close is set before the free is committed to, so test it here
too and skip the re-arm.

Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
 drivers/target/iscsi/iscsi_target_login.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index de0cd95aff0..1f41e5274f2 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -1168,7 +1168,13 @@ void iscsi_target_login_sess_out(struct iscsit_conn *conn,
 	 */
 	if (!zero_tsih && conn->sess) {
 		spin_lock_bh(&conn->sess->conn_lock);
-		if (conn->sess->session_state == TARG_SESS_STATE_FAILED) {
+		/*
+		 * iscsit_close_session() stopped this timer before sleeping on
+		 * the usage count this path drops, so re-arming it would leave
+		 * the timer armed on freed memory.
+		 */
+		if (conn->sess->session_state == TARG_SESS_STATE_FAILED &&
+		    !atomic_read(&conn->sess->session_close)) {
 			struct se_portal_group *se_tpg =
 					&conn->tpg->tpg_se_tpg;
 
-- 
2.39.0.windows.2

