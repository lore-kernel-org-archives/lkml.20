Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739241;
	b=ZNGm1Q4IVwZjMsMcKQuhThdQTiO4LxGve0AK2Z9IQugcPdoU8AYSGIVN/BJv7Xl3c48I
	 E7f1okDZ3CqRPAgbus3TBgZ6aboAal972K9mGus+hnel7L3kLNZWleWWWnHvzLvRaFYUH
	 4SsyKL2YwHgL7Li5jWiV63LmcWcAKYs81UkbfDpzR40tIjKkZFcq5lY2svzrznTruCwpb
	 pIgEuR/PokgzvomE/BwkYVX3tjE8LaKgEtw+x2gTsTSovcVPBTnVgXqwba4MRzXI2qWLw
	 XWOlHrtjsM4J8/e0S12ftezulrMhB9D8d8SlVDb+uCaRRjjLibS6ovgEZDQxeEzPOjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TENXDxvv5jFBPerWep/Z3nZ9UwBvzf2srmB2t0s0Ufk=;
	b=0xLEHq4HqwVRv3cAV2+urRK6kT6HUG1HXFR1VQ1zeh2XvRcS83UXtEWXJipW/vJ7Tarw
	 d8baviiKIC4j6oswRYAoFC6C6BXfaHvF6gEfuPWMrlKA1HLUO+lLDIgqYSO6FTgY2l0r9
	 EF7ZVjkREyOCAgtUzd2UYZjObh6ajZ5WfWzGNF7ZTBQhQr8FV7YVEWHAlK2T+YF0WFxxh
	 KOC19dpI08ZzPLju/X/OzxDdp8c6cLBziM+STMaC8ChvRiuGJc3J9XwawMMzWyPoglhRG
	 Tsg947TlEAfgy19FnRqgD4MpSQtXPi+Z0vtV847x3+33MoywDc8QnAMnu/emHlXsFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEiVyM34;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A353E606A89D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A353E606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEiVyM34
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9995ce866so27052215ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739240; x=1795344040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TENXDxvv5jFBPerWep/Z3nZ9UwBvzf2srmB2t0s0Ufk=;
        b=gEiVyM34NDSCp2pkPQHpI928xWtg0jAwkU/EloJQ/g0yaZba/6kxQadtViGi3+wEah
         XOrg+w2+flKHeBdmIll0ru5ewMNgL4UoLb0RnByBBV7Y446WgYVAdR3Pij0H0+1Xcm6X
         IC+nF9rftvRryg2AavPmqTPIbi8FlSXGWXsGTnC20i//w23MXZI6AevHv4382SPCJsty
         8iww6oTppF0lhO9rBUdEwsxbwRyTR7dUPk21OQLfsTfER8oT5xaSmHn1hdxTqsIVx6NF
         yEBraZpvbudueMgbvLmMMBYU7VhjebE58m50l/7Y/BybISts+0BzEQF6TqXd1SRmwh7U
         5Qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739240; x=1795344040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TENXDxvv5jFBPerWep/Z3nZ9UwBvzf2srmB2t0s0Ufk=;
        b=QSIIXdMVw4ENoW26usi0awB+V7IrQA43NtshFHxMU28AxBqQkUi+jaQvCgKIblWIca
         pvx/DT9ZgV4sf+9hwxtaE8rZVsiDk6Yinb38+6kzFbb+kQpEQM0V+KqmTm4sq5xJ6P1D
         g+U8scnQsNwrxRpc85sUKIXbPfzrVaqCO5VMxzXAB/wsbc1+sPtYCF+zTMnucx5i2Vcj
         +CvB398o9rETNgLMH8aA6/lOlN11Ip6Pf34k7UxX4WecDkWP4MDUHqbK8jWQJim1EO0P
         022TDEn9u3tZAWjfEsvPQVgKFycPv07Q56gCZ8/BlCIdpFzp0bXDW8XnDOGO8QvRqGwN
         y2Tw==
X-Forwarded-Encrypted: i=1; AL+hErFmJlDWqrbYjRQxvGGz9ws9n5FGPyPDlH7Yp+kP5s4ukrHoZ050CFFsgHBXO9ulVB8/DwZgYA8tRctGjz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v0ntIROwylHQPXfMPonr1RpJgZ7EjCHnL6Pq9NhBJmSOzVuXZ
	c4GD30ELySHPVpFfPdRbcSw0VReY6Dt/M4BYBZ+PgsrVA2Pl6V+3sJ3/
X-Gm-Gg: AYBFou1iywYzzDlQXgfHRoSpmDKKtUH/IdUYjPqCq7TByztp2y9WKx7zKJh1qoQXjDQ
	Bxm/TqJ1hsyh0vbkLwu/tR4snu77B6OzbRc4txicD7FALX5Gur/oaQF77joHWVx7tEnbcUSC5PR
	mjENOUjnv9AgxAYccsdKOjIoaJ0fUWof64n2rQJvltBlH91L0vfiXK170z8ckPK2lzuRjVq2IP5
	dFeiW6PgqRT7lQrlcsWUpW4hhnc2x33KkFkLphDeB9UvJ3LgSIqRoQ3d7aPSH3XqZGUVx4nb7hG
	zIEBzCoMBRVw4QFzw2K5a4QMqzbhDZTQO3vPZY16BA7nGAEtjo7+/56ykLnmlEEVwwjLE/e5ez0
	DrR0eLn7PT+ic3KheRLsUPaVgDDwswdAO8ubYduDsUHHEV+YIfgbT6HjySB0sfKK6rn9wuu45zP
	2p3m4CQDwRZiZFFf7veP8T34kOfF6V6KCXCkEs/thUX/VJBNxIp/tyYWJieEak+Kp1NWq9MdlUH
	09oYsuhETMmq6xNTagEB2TdKPQUk08SJswM9GHAzMZC3Id2GpjmhQ5Gm/EQP/9q/yhE8mXqH6/q
	BLsNLMRAEZCkc9KnhADskc8GGzbOnjlLCsRg6rC3IPBU1d3tShpPXLmpyTihDK/M7ETPadl+sBI
	FXg2f+rzeohOLKdKI6ULFzYQKzK7bc6NbEQ018r9imKC5ZNmYonVKZ4QtG632QIh8cTPHetDoGR
	8Lb7NQP69TlZ6lU7+S8lLDccieW3RdAfWGR/m4VUxz+c2WQN6dDiVVNEZY9dJnn+rjy5h7qd3UY
	7j+Km62PSR8qWtSmW/djLb1RfHMQvuNQMFLobuDVGfSaHBEHJBmEDmx+ZxEfL+5
X-Received: by 2002:a17:902:e88d:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2ee0dad0247mr91339425ad.24.1794739239813;
        Sun, 15 Nov 2026 02:40:39 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm26739145ad.57.2026.11.15.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:40:39 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Maurizio Lombardi <mlombard@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sujal Tuladhar <sujaltuladhar1231@gmail.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] scsi: target: iscsi: don't re-arm Time2Retain on a closing session
Date: Sun, 15 Nov 2026 21:10:07 +1030
Message-Id: <6396b9a2d459b956e4081fa080e194d2df0b2a6a.1794739041.git.danjwade95@gmail.com>
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

iscsi_target_login_sess_out() re-arms the Time2Retain timer of the
session whose login just failed.  In the window closed by the previous
patch that session may already be on its way out: iscsit_close_session()
stops that timer, then sleeps in iscsit_check_session_usage_count() on
the reference this path is about to drop, and frees the session as soon
as it is dropped.  A re-arm therefore lands between the stop and the
free, and leaves an armed timer on freed memory.

->session_close is set before the free is committed to, so test it here
too and skip the re-arm.

Unlike the previous patch this does not need the other teardown flags.
Every iscsit_close_session() that reaches the free is the can_sleep=true
call from iscsit_close_connection() and has ->session_close set, while
iscsit_handle_time2retain_timeout() passes false and re-arms the timer
instead of freeing when a usage count is held.

Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
 drivers/target/iscsi/iscsi_target_login.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index 556ae5d2d50..124c9903fac 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -1177,7 +1177,13 @@ void iscsi_target_login_sess_out(struct iscsit_conn *conn,
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

