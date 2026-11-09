Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253338;
	b=JUGR9sm8RGvOJwNoC7baDVsU7ooBTa8UzM2pwWw/5aBvRby+g/EoKcPA3UZJgcQe88EB
	 ansShVk1z/QHlyt0aM6ZLorlSPAbAeqPtFzm7GcPTgQhTUe4g/M+a63455oPe/n/q+XOO
	 fTYskabSHHOx+Gel13KpWkfPAz1qfV3d+tRnkzb0fMWia9Bc0espSosa24syCPLm0m1qe
	 MFW/hSs31kRCESNjHDAy7JlHrvBcHCXm4tUzqn6ZLfQwBU/qcZM2lQT/vSPyWTxJzHxe0
	 3kYTJVVPUKuLaGzeh1Uj0QkRySdBVFiw12DnY2W3iRbeeBR2ZHquBRyzrqtbaPAGbag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lIwwhY19T6f0qHtgPzyazjtCz8LaUAMO7sgruWI+rDo=;
	b=4pdQ+276BexN84Y9jsgLIfy8COXonF0qZ/s3BIg+XvY/JMaKPD3xC0WNlMzl+roMXcfg
	 Dqoo4c5sUaUwFgP6Jf2p7OiBYmbOd2gmNrN5WGVZL0WdOZcghc/17qPyw1y5AUoUKrH21
	 SmH67bQ5H1F3vsCxeU5pdCUog1t0K/pjXu0ltnfo16z2rDKqpokei8LnM1yOxyPRCWWKD
	 7/LNIm/dx/lP+iSAOACAzNWuCVHUmQIlJRaPdug+BhHfABGTObav/z3JYk4+MTcFvlGfc
	 zvgkHi0iAodHGu0z6IcFKyrNxrpTjfMlFUfV4+Hhj5eSqksFs01ty69ewGGL+jUxJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvgzSntr;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168F160A260C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168F160A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvgzSntr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so10562945ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253337; x=1794858137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIwwhY19T6f0qHtgPzyazjtCz8LaUAMO7sgruWI+rDo=;
        b=hvgzSntrjv0Eepibl4tNE0CfHPMpPsJpxLAyFyYxacmIqWv/b4NvE18kC2Ro01MgZL
         ocE5YUoEl0/vrDPRWTPCdyX0fYILnlZAnwCTRrPOWCAULCoxGqZNJrO4HRGNTesBTQSH
         GD1wYH0JKpoRvpCwiEstogHvibfTEZU9eCQtTjDnfIlypM3vbzboFs0kZQ1LnjN47s6o
         UWvaj2xwsIOgdGWFc4PapXtdz9bx0M9FphhRD1OP+Yq2JuvlfZtZLRPbU8wrZSwq1iIk
         9VZs1MkkYPTrJX0M5/3965WY6DdK5lSFyBYfo3g01oKM473d4DGLqbL5qNX8RK+7xzYf
         mrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253337; x=1794858137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lIwwhY19T6f0qHtgPzyazjtCz8LaUAMO7sgruWI+rDo=;
        b=YxsO45hFIbFHTUlOmxHUw6ztOPNl3hAAoz41cVHCW4tlg5YS64viFjAmOAOdu1rok8
         V+AfjEQ5zwPqJuljrVkJFVc/5ntrHnqBODvlWo1xFrCEmEoPisUISKQCAoPUq6R6NEn5
         k9yV3p87N5NxT8P3iTSqPm08FTzu79+z2COdmfgt2LSOwmbVXjuemcePA8g0Wle9652G
         57jrmX+nrW0vATUEtSXsYm4oo0RpDKFJgLuEV7M9+f48Gq29RppjCMvojaFhaR+Pfqam
         SP/a5EYcHg2yhVDH+e5mmaboeIans0yjGNYjm80dd84MuDeWyvL7mPZuLuWE/nP2mdWW
         MPyw==
X-Forwarded-Encrypted: i=1; AL+hErEXTwns/MHdjVgJXCmrpIAueBZFyjPiknP1nAi8z4/VWrlGs1HJjIRxOhC97widQcV0JEbrhLqijl8mVIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FWEoVZhqgF9BC4jMMnEi7SjmqRIpSd7Kwg+wLr3IZv2EywRJq
	QiYkes6J6uh8nK20znO3b3ewox7JO3IKfLAFe4d1FEI+5NzexZV7z2r/
X-Gm-Gg: AYBFou24581jMzDT/eZ00cLJm5ifTGd8Q5zk2VWjmNBM+l2krd4eugB1EnfWesD4elu
	W2NmaC6bc48prZ/L28y4lqQzr++vSbXdTRWU0Re4SGFgl6J9Q+ZdTh3FfbKbJtULxz6wQrsEVZL
	qfx2pc5RDUBxYkklLneqqIrzcjLQlKEHqr0RF54IvQ9XYJl6AQXaItmZiNwhW9s1aKbQM+U4V6F
	DhcN7RkPtKk6+Abry1uVYT2PZcYoz5JthcnSiFC2KTijtsiMujPdC4lrFoapod8sW1EZUcBlT+b
	NIcXz8z4yE7FGqse6Z13xJDv/b444e+EMmGpBST+jtNceyH3ivqwxI4qLnWABnCu04BqwjFYnXn
	NnUz+ah4JRaajR8ksxTMHiKax71PZV94k0TBZn3MN6azrnsKneoFmQVTAbEja+qPm+iiEoMbWq/
	Fcdzc0GcJeYWei6aVfLVR7TwY/Yx6FaaUF26McH+9CsCO+BvSmL143vwPEdEqfSXhJU2dFB2FzN
	SfZnnQGJgmAlzYNr3GjOsKmAHZRfI3RditrGq2KBf1hPKHqD2XiOgKW5rq2ILN7Ts3aFIoQFPZN
	lYEdRWwlC43K+a89I+GCbUMJ+J+i8NcBURKSU6eNT8+UYc2Pex24SIpOVmD2CzTv/7jOIp0EzTt
	u/U+w6ZQsSN+j5fDgZLzadGQDuKqM2fdDp62ltFJOo7+UsRM7CgIjTdQ=
X-Received: by 2002:a17:903:22ce:b0:2df:90d4:7758 with SMTP id d9443c01a7336-2edb9164135mr1348605ad.23.1794253337360;
        Mon, 09 Nov 2026 11:42:17 -0800 (PST)
Received: from localhost.localdomain (mx-ll-183.88.2-201.dynamic.3bb.co.th. [183.88.2.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm1388585ad.13.2026.11.09.11.42.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 11:42:16 -0800 (PST)
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
Subject: [PATCH v3 4/6] ksmbd: check a request before signing STATUS_NETWORK_SESSION_EXPIRED
Date: Tue, 10 Nov 2026 02:41:42 +0700
Message-ID: <20261109194144.22814-5-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194144.22814-1-mike.michalo@gmail.com>
References: <CAKYAXd-Jo-ObBDs-AdGfaM+QmDsot3gj1g0oJiyDKczoUDg2TA@mail.gmail.com>
 <20261109194144.22814-1-mike.michalo@gmail.com>
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

When a session's Kerberos ticket has expired, smb2_check_user_session()
returns -EKEYEXPIRED and __handle_ksmbd_work() signs the
STATUS_NETWORK_SESSION_EXPIRED response if the request has
SMB2_FLAGS_SIGNED set. This happens before __process_request(), which
is where the MessageId and the request signature are checked. So the
response is signed with the session's key for a request whose
signature was never verified, at a MessageId that was never checked.

Anyone who can inject requests into the connection can then get
responses signed with that key at MessageIds of their choice: a
signing oracle. Reauthentication keeps the session's keys, so the effect
lasts for the rest of the session.

MS-SMB2 checks the MessageId (3.3.5.2.3) and the signature (3.3.5.2.4)
before the session (3.3.5.2.9). Do the same: sign the response only if
the request passes both checks, and otherwise answer with an unsigned
STATUS_INVALID_PARAMETER or STATUS_ACCESS_DENIED, as
__process_request() does.

For a later command of a compound, the response that is current at this
point is still the previous one, so the old code re-signed that response
instead. Leave the expired response of such a command unsigned.

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Reported-by: Ian Bridges <icb@fastmail.org>
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/server.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 4430c8d6393e9..bd4db44f06cd2 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -107,6 +107,32 @@ static inline int check_conn_state(struct ksmbd_work *work)
 	return 0;
 }
 
+/*
+ * The keys of a session whose Kerberos ticket has expired are still valid,
+ * so STATUS_NETWORK_SESSION_EXPIRED is signed. Check the MessageId and the
+ * signature first (MS-SMB2 3.3.5.2.3 and 3.3.5.2.4), so that the key never
+ * signs a response to a request it did not sign.
+ */
+static void ksmbd_sign_expired_rsp(struct ksmbd_work *work)
+{
+	struct ksmbd_conn *conn = work->conn;
+
+	/*
+	 * For a later command of a compound, the current response is still
+	 * the previous one here, so signing would corrupt that response.
+	 * Leave this one unsigned.
+	 */
+	if (work->next_smb2_rcv_hdr_off)
+		return;
+
+	if (ksmbd_verify_smb_message(work))
+		conn->ops->set_rsp_status(work, STATUS_INVALID_PARAMETER);
+	else if (!conn->ops->check_sign_req(work))
+		conn->ops->set_rsp_status(work, STATUS_ACCESS_DENIED);
+	else
+		conn->ops->set_sign_rsp(work);
+}
+
 #define SERVER_HANDLER_CONTINUE		0
 #define SERVER_HANDLER_ABORT		1
 
@@ -276,7 +302,7 @@ static void __handle_ksmbd_work(struct ksmbd_work *work,
 					rsp_hdr = ksmbd_resp_buf_curr(work);
 					if (rc == -EKEYEXPIRED && work->sess &&
 					    conn->ops->set_sign_rsp)
-						conn->ops->set_sign_rsp(work);
+						ksmbd_sign_expired_rsp(work);
 					else
 						rsp_hdr->Flags |= SMB2_FLAGS_SIGNED;
 				}
-- 
2.43.0

