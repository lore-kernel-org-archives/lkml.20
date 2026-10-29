Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307306;
	b=ictixEkgS54WTKYqwsinORCs5/DE86wwSSKvXvzi6YZcR+mmRDFTakvwdSxdrF7rG/WD
	 HHro/pAE1tmx4DquymKrzJevq2A9NoRMEcdND0DgwpLy9pGwFgOP3zKgPDj45wzdCPq6d
	 h1yaWP7jwQs11alvCkFBn8ExG51NY8bhX1zYU8HWDykg/6EpJ8pmxI1syGP3WRmMspI6m
	 UdfTeFlxrOZdTrUCj8lYlS4YjTeszrID2mcXFkPdI5clcSyrL2TP7z4QdJq/We8xDy1s/
	 7upxKT/8hEr71hQ491AY0ZG2bkyApHBX95XKUBkdZncErtn5oBsJUSnGvtSBQ9pSCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yn0E6PsawiIQSMWnv5cp9iauDzybQJHQhfdxbkgQhf4=;
	b=dTTjbx1V2jp3Js6FS+m+rdxEoVMOJ1iesK912ieBWpzA3WiApqllnN+8gGFBu5SyR8yq
	 oGhtoYEQ+4KDPETE0TW7wpeXVS5Rl9qv2NYhx0mID2w6tWKXqEeTuDsz34XUn2pWuOtIE
	 eaHIh2ArZAeTiwTgiaMQc0XdTsaLjkcheS08njpnN23ylSX5+OQbt1Z1rTaDBAHRob0dx
	 vsd1yJA+nVROZFlcc40hteD2yzpgknbXHBjcV/x1x7s59CReEOUjgFZvpAO+gdQb1h5E7
	 AI6xz4Ax/WX+LEKLml0BnY3tjGdahy5MXd1VQhjtnoejZr4sNlmBVfpdPLAdO9NTpjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+4DBvya;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E89606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+4DBvya
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso169401eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307305; x=1793912105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yn0E6PsawiIQSMWnv5cp9iauDzybQJHQhfdxbkgQhf4=;
        b=x+4DBvyaqroUy4LfNUqU4OfStZxkx3ttcWS+SVU+ESx7wbqQ7MrQc2PTQx/aXNQtMa
         wbMshrv+GpuagtGtY3iIgTxga/Z0GjraDLi1rJKnTdUsZ3SKxM9jtiYnsHdYXALEEDNv
         Sjkg0+V9o5KzR9AM2mn1jY33AblwXNDykIc2i1w1Ygduyej8GMbAiFORkGRAFekzK4ea
         oTbhfQHPzuJQrYh+ynQAXxPiMHCAI7zT4OvgwqrnawCdU2IYN1YvaBAyXQCwI9ZOHih2
         Hgpc5TAHBUUUnNLpXI3KC9w/C2sZuBTEDS8tJ83q4ahi2bkp7IiqEMjtTA0lKEUTX43Y
         zduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307305; x=1793912105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yn0E6PsawiIQSMWnv5cp9iauDzybQJHQhfdxbkgQhf4=;
        b=MAnXUnpU6pLTmvATzkgEvm3DuvE/UgFZfqL/WPpwrVdnzKuMectr+X0bPcx40PptsB
         5zwvwXZu3+ELx8meCu+f/6SJiyG7P8mSQ65wPxPA6JnIZQ7cOcq73RQ57hGD0zyt8FwI
         meJdgcfHiMEKx+RNeN2bf08FoPMVYUVjUDhwbNko2++JPbRlm1rIMxkh/uCl/eo8yIUv
         hWFufp8lVwVEYpryZBE0Ir7+2QdmnfUubpLQz9NYwJ2uEw+fV4RU6yZ2vTWtS+LnPvaq
         OEHHpDAnJIypRz4il3QtL+4tC+D0gHIVk4CfOd5hCBOZQqs1U1GLY6vI97uOUOJaIIcl
         1IUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwklCYQmcBbv/r1SYVMmm1DQtqwWdAOM8MbYJEDOEI1kNw1iv8Pi9K0+rrX5EDgWkKhchVn0ZZhIasDt6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQIRnM6Na2KqkHkLqiBOK2VwTnR6XcAJ14Ed+jOBfsLncY2gRZ
	bEke6AaP7f6KbzB5S9JGcG+vzGPxHOHAENjDwHw/PbHg/nidtOn6USD9
X-Gm-Gg: AYBFou341hpNxPVzGYYhpK1Yr83VjIoVnU5+f1tnD6az8onZd5lMMjojKzizoDr0R69
	VNV/s2WIRTwPinY0uiYm9B6R0vZn8IELHuC8V6baOtPddKEFo780wYP7qSPeBDW5i57oQ+4ivH/
	i7ABCxI3b1SZUnwtNTqI4CWeiI3elB+WKU8//gQgaHhwY/QSRK9cdKpNJTMfjgcXQUjjXpj6t5B
	CRqJUDlN3K4rtxkbAbbeTujHMFI0nxzYT94ZRKOZDhYcMlaipHoDBmj+wy1TuHl3a4iq8jNAm3V
	xBYqixQuvXldaJhcotZBzuE5Bt/ipD0SmY0oPqam2FUNxoppRoUkle0iZMj/FRfPfbThdy97Jgq
	+i+97GvLigVXYXTTt3RqvGokVT9GlXzQcLT8gjRHEj1oYa/h2GXMFsuXpiZycRfcm61qomXdBH4
	6f/O0qR74b9Ltu9ly6RWNtIMQM9FAm+nilib/tQh5kC39GyDDoIVe62F7XfQT2o8Jn60gGeDV1+
	90c9E0mOWFYpo5euImzrVHq5wBEATmaVU/oJXqlbhjYZPR5ZGGG0ncbV7UgS7eouDOSpda8qCny
	eQtGCgy6YjuVLb70Bis2Jt81/Vtsw30DZh9Jqg70CRg9xzBfiR78EriT2l0ZuaCjHfA=
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr727112eec.38.1793307304487;
        Thu, 29 Oct 2026 13:55:04 -0700 (PDT)
Received: from localhost.localdomain (wood.seclab.cs.ucsb.edu. [128.111.49.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm1274968eec.22.2026.10.29.13.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:55:03 -0700 (PDT)
From: Praneeth Balasubramanian <praneethb2002@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>
Cc: target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praneeth Balasubramanian <praneeth@ucsb.edu>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: target: iscsi: Check for existing sessions only after authentication
Date: Thu, 29 Oct 2026 13:54:56 -0700
Message-Id: <20261029205456.1211532-1-praneethb2002@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Praneeth Balasubramanian <praneeth@ucsb.edu>

In the operational-negotiation path (CSG=1),
iscsi_target_handle_csg_one() calls
iscsi_target_check_for_existing_instances() before
iscsi_conn_authenticated(). An initiator can therefore send a first
Login PDU with CSG=1, TSIH=0 and no CHAP exchange, carrying the
InitiatorName and ISID of an existing session. The target reinstates
that session, which tears down the legitimate initiator's connection.
Only afterwards does it reject the login with AUTH_FAILED.

iscsi_check_for_session_reinstatement() matches on ISID, InitiatorName
and SessionType only. The InitiatorName is not secret, and open-iscsi
ISIDs are a fixed OUI followed by a small session counter. A remote
peer with no credentials can thus repeatedly disconnect a
CHAP-authenticated session and keep its I/O failing.

The comment above iscsi_target_check_for_existing_instances() already
states the intended invariant:

  NOTE: We check for existing sessions or connections AFTER the initiator
  has been successfully authenticated in order to protect against faked
  ISID/TSIH combinations.

The security-negotiation path (CSG=0) honours this, calling the check
only once authentication completes. Move the CSG=1 call below the
authentication check so both paths behave the same. When
authentication is not required, iscsi_conn_authenticated() returns
true and behaviour is unchanged.

Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
Cc: stable@vger.kernel.org
Signed-off-by: Praneeth Balasubramanian <praneeth@ucsb.edu>
---
Found by an LLM-based static analysis that checks kernel code against
the rules stated in its comments, as part of research at UCSB SecLab.
The analysis was done with LLM assistance, and this patch was written
with it. I reviewed the patch and tested it as described below.

Testing: two QEMU VMs on linux-next next-20261023 (20a33c6b6cbe). The
target VM runs LIO with a CHAP-required node ACL (generate_node_acls=0,
authentication=1). The victim VM runs open-iscsi with correct CHAP
credentials and continuous direct I/O. From the victim's network, a
script sent 5 credential-free CSG=1/TSIH=0 Login PDUs with the
victim's InitiatorName and ISID.

  Without this patch: 5/5 logged "Normal iSCSI Session SID N is still
  active ... performing session reinstatement" before "Initiator is
  requesting CSG: 1, has not been successfully authenticated ...
  login failed". The victim recorded 79 failed I/O iterations.

  With this patch: 5/5 were rejected with AUTH_FAILED, there were no
  reinstatements, the victim session stayed up, and 63 I/O iterations
  ran with 0 failures.

The code is unchanged in mainline 9ba46df34488 and the patch applies
there. Legitimate reinstatement after successful CHAP still goes through
the CSG=0 path. I have not tested the TSIH != 0 (connection
reinstatement) branch, which is reached from the same call. The
reproducer is available on request.

 drivers/target/iscsi/iscsi_target_nego.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index b03ed154ca34..ccd468e26fb9 100644
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
@@ -1008,6 +1005,9 @@ static int iscsi_target_handle_csg_one(struct iscsit_conn *conn, struct iscsi_lo
 		return -1;
 	}
 
+	if (iscsi_target_check_for_existing_instances(conn, login) < 0)
+		return -1;
+
 	if (!iscsi_check_negotiated_keys(conn->param_list))
 		if ((login_req->flags & ISCSI_FLAG_LOGIN_NEXT_STAGE3) &&
 		    (login_req->flags & ISCSI_FLAG_LOGIN_TRANSIT))
-- 
2.25.1

