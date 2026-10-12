Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9FB184A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791764230; cv=none; b=HHnzsBn6sVbUK6sQQEAwLCa89Ra47s4XTk1a3uMFWKTUxBEA5ImgM4ovjv8C6pPrw7Ftjj0rd+IsyeHIue21r68aEVQw9jU2ec+A5CkSukYHTX7Ak7p4jd4pRILuxAZmbG5P94a2sbOOgeXvz89t/78Bo9P/oVLjms75yPdot/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791764230; c=relaxed/simple;
	bh=WR9ZRx0OG8WB8FU8j6N84odGtF7ArWFkBQwxc0m1e9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oubg3hovIgoIxYKx7TGZHmGRFZjY4V72SP7GomnlLU4r0w7uaUXlQZjX4/9e9l/q5Vk47kcRYgEWNp2c/SeCUpUdXI21mxiJQ0PUhbpdJZISqDDxBR6l3iIKaHBgWfhB2IhOlEXL7ov3eUeHzZBFUUeRI7TDktvka+kwUA4mSOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=YolhH/3e; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="YolhH/3e"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88c72646f03so569661b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791764226; x=1792369026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPB775D8RC545nicueL5zti4cavLO/8DRXwfdsdk1Fk=;
        b=YolhH/3e9/G07Qni4iWC3PYrb4S416WW7z2+GSCpnMvx7USgO+w4qE3Zuh/vSV9SCk
         u5GiX9r97I83jntxX3r5EMDhI/uRpmYv+pCsOe53gznqaRQrw4ogprycbLt9s8O/3NqE
         u5TRXEvC3TWGHjX8DQilYDqWPuIhmnbicEaLUEaAHLH6F1il736YUs5hclRm2mPOEZd0
         5d5h40Jm4VCr9LiMFBp4j8sVtxr7boXlEGUxCXqMo8YOqHL1BABa/607tnKy1fwkmhTp
         A/YxR2iBWKkb9c0ywn/mY5JT/OooE5UyBY9YLZxdQEvJCIZ2THudQ1PgrcIEHjUIcWra
         QUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791764226; x=1792369026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPB775D8RC545nicueL5zti4cavLO/8DRXwfdsdk1Fk=;
        b=D1p6Fu/n+8xoDDdGntGVUoOFvxtDHMC6BgS1z3Sb5qKjvH3NUmFdxHekx4B5BFSG8O
         zt8vFYWT/q3YFRl7hYSkNgw5zL+RKVefIG1eaofkeqlQJ0dlWm45HU9OBqM/VY3+hGna
         vZXp90Gyrzp+1Dae6q+CEaQ/pFDwRUL9kbGDUBIqNnu/X3vpkgY9riVQHLXviBXsQYrh
         xs07dYWs6T6MlZNEN9rEPMlLAQgbyHJ8GLOTvMsWEEjH/wbpUe9IeiHZNzvnsI6/1KI8
         SfoD4IKrfcHKTCHexuIYd9QBtjR7J7u0keM8XvzzbZQVlHwlgzowRaue6CwVw+xUbTTf
         NSEg==
X-Forwarded-Encrypted: i=1; AKwUvBw8yRmr6Jxgfi3V08dWL69zWhqyxt1+/WS3qAr+XmuDhz9r2ldtcSx3a29Sy5J1NrEaXypjHR8z0QB7p4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpYEfpJbvyRp+yUZymyxo4cMA2WpMZ+fZprtl+tMU1KTK21j0U
	UWJNK+Yzu74OHOR+0q476ixZeCYbWBejS4a3de9DVd3B8FQTswVy/Ut0MpBkQHzp+j8=
X-Gm-Gg: AYBFou27Z/AgcSRK47u89nAKRGTkFoXl6KC2exVkEiBlrMmTJ0BagrGuYh0lqh/Qud7
	GP9s8uosUAQ+yA3Gh7rvtZPA0tXMvjdS2Y9PeHlPwpV4/FPoV8mmLYcgG6ctEgsT/C5Ybyl1CuL
	CxpJxg0yRAlQ7lBy+r0pZYNFnHuTJzJLYQwHSFbOCRwMd6VIz/CEf0FEaJPzl1L0bmugrLTXw6+
	tA+u/qCkDCZ/kaosZXRmWlgVUuN59SXpgF2CFp0EC5Lk37cVw/Rz8jgA4V70Uc7BJNq85LTAQmc
	lTQRu/PqbDTyPm3+e3lbvoSMFK0idTDZtD6upXsgcTjQQNvXpcPX2A+uSSVZFFqlrZ57DdgWnPn
	mLGK9/CWaKt/61tpDJ6GakoNDmkSV/PKHxIIG+99ehRcPWZUKzWOV+Z4MXOIvhZrkcWYVBB5PkX
	Kr0/UlxNOEYNWpCJEndVAcbCz/7bAzTVeQcL9R8wb38OqZxjJ0DmD1gyNua1pmtKCjgDnOyrZvp
	odhJA==
X-Received: by 2002:a05:6a00:178f:b0:886:18b2:361c with SMTP id d2e1a72fcca58-897c3ef946cmr6502691b3a.7.1791764226441;
        Sun, 11 Oct 2026 17:17:06 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c49901fesm3378268b3a.57.2026.10.11.17.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:17:05 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org
Cc: michael.christie@oracle.com,
	Roland Dreier <roland@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: target: iscsi: reinstate sessions only after authentication
Date: Mon, 12 Oct 2026 09:16:49 +0900
Message-ID: <20261012001649.2135743-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an initiator starts login directly in the operational stage
(CSG=1), iscsi_target_handle_csg_one() calls
iscsi_target_check_for_existing_instances(), which performs session and
connection reinstatement, before the iscsi_conn_authenticated() gate
that follows it in the same function. The reinstatement matches purely
on values taken from the login PDU: a zero-TSIH login closes the
matching session with iscsit_stop_session(), and a non-zero-TSIH login
reinstates the named connection.

So on a target that enforces authentication, a party able to present a
target initiator's InitiatorName and ISID, both of which travel in clear
in the login PDU, can force that initiator's existing session down
without passing authentication: the teardown has already happened by the
time the gate rejects the login. The impact is on availability; the
failed login gains no access.

The CSG=0 path does not have this ordering. It reaches the same
reinstatement only from the authret == 1 case of
iscsi_target_do_authentication(), that is, after CHAP has succeeded, and
the source states that intent. __iscsi_target_login_thread() notes
before iscsi_login_zero_tsih_s1() that it waits "until after
authentication to check for session reinstatement", and before
iscsi_login_non_zero_tsih_s1() that it waits "until after authentication
to check for connection reinstatement"; the helper called from the
CSG=0 path is named iscsi_login_post_auth_non_zero_tsih().

Move the reinstatement check after the iscsi_conn_authenticated() gate
so CSG=1 follows the same order as CSG=0. Where authentication is not
required the gate is transparent and behaviour is unchanged, and
login->checked_for_existing keeps the relocated call from repeating work
already done on the CSG=0 path.

This was confirmed at runtime: on an affected kernel, an unauthenticated
login that selects CSG=1 and carries another initiator's InitiatorName
and ISID tears down that initiator's authenticated session; with this
change the login is rejected and the existing session is left intact.

Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
Cc: <stable@vger.kernel.org>
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/target/iscsi/iscsi_target_nego.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index b03ed154ca34e..bddbe29da807d 100644
--- a/drivers/target/iscsi/iscsi_target_nego.c
+++ b/drivers/target/iscsi/iscsi_target_nego.c
@@ -982,9 +982,6 @@ static int iscsi_target_handle_csg_one(struct iscsit_conn *conn, struct iscsi_lo
 		if (iscsi_target_check_first_request(conn, login) < 0)
 			return -1;
 
-	if (iscsi_target_check_for_existing_instances(conn, login) < 0)
-		return -1;
-
 	ret = iscsi_encode_text_output(
 			PHASE_OPERATIONAL|PHASE_DECLARATIVE,
 			SENDER_TARGET,
@@ -1008,6 +1005,13 @@ static int iscsi_target_handle_csg_one(struct iscsit_conn *conn, struct iscsi_lo
 		return -1;
 	}
 
+	/*
+	 * Reinstatement tears down a previous login, so run it only after
+	 * authentication, as the CSG=0 path does.
+	 */
+	if (iscsi_target_check_for_existing_instances(conn, login) < 0)
+		return -1;
+
 	if (!iscsi_check_negotiated_keys(conn->param_list))
 		if ((login_req->flags & ISCSI_FLAG_LOGIN_NEXT_STAGE3) &&
 		    (login_req->flags & ISCSI_FLAG_LOGIN_TRANSIT))
-- 
2.43.0

