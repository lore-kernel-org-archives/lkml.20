Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498145;
	b=xl3YI13A7Gv38NTh+5G6X7sJ/w1A0k8uFvsjeGvyVJpCI73EllsVa6+FNaKbW4aqmVks
	 GFzAuaWyBE9Tio56wTj/KlrzlLR55b1cuX+mr+8tvfQCsdR1CkRqF4uWY437uDv6WWeum
	 0YSKmQlBK2AVTga4hco7b8H4T9QO1K6VkGPCLeYXk6QxlswjyZo6ooHJ8687u2IE0KWNO
	 bQaJmMcE7d1epKRnjxE81dmV7HFireHk8FfKU4lJqQnrAFX8HfLaUpIWW8llz3eb221T0
	 r7uAKSi7hGomZSDI8jjkVGImdIXCQ5Q5vERRSZS5CblCIGHfPo1HZN5xr2sv1owSGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qPdK+vh8/g3uS3dMRmESD66VYLEkQ0XCEscEZnuHhMY=;
	b=mVfIV2y9mOG9jWvz7D/bJ6TIP83kfvmXHVMKy3vLkd+HaJaQiOUw/ekReSOcm4TgBbpg
	 ZDX1jxW4wbxa+xmVcdvT+es7yN0cBG3di69NfVXBwHyYBZKHgaofQkp0sFa1LjS75ZJoc
	 RBTVXnN2VabbbhDRrH27Sh0Ha10NZdMqgJ8N+GYvAx2ka13j+dkH0HEbDdfbMLMqprqxB
	 4CoTGGBOmT6VgWg5T7YB7jXbgXPNL86yOiBPlSN0M+8L4wF11Bp0/4sdRRUYttMljE7Vd
	 +jvqT2QK748KHLJQQWEdY74E99h2bhgfrSsorFXgk49MreKfULrj2ZprSBoQz5pFFSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNzXi57n;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E1B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E1B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNzXi57n
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so3170453b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498144; x=1795102944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPdK+vh8/g3uS3dMRmESD66VYLEkQ0XCEscEZnuHhMY=;
        b=UNzXi57nIEINpiLTnoJVLHkb3iSpvqvZxAH5zhOTFLYYq3JC2pBwTtCUqR8HLWWJl7
         dvWdgn8wrADdnYvaeFX/6i5X9sWXAY8dacQSJHpex7H2cPFJjHpqvyb162Z/U+flSnTM
         yI0nxbIsMix1Gdwd5Qgg91zBnzU0CsqOFM/glgCb+b3W5ftAKLobixe5X+rPKSDr8jPp
         UNz3vCCdBePGqrOih0FXIwxBvUWNTzJmSOngSzsivXe1+V1R0yO5dm+s24qtTCHIzPY8
         z5D287sbnTS/dZgPYoIlqyguRO95+dC+xkLVtW7x3xdRJg76TcqVosKokof0NIHRmWRk
         +QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498144; x=1795102944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPdK+vh8/g3uS3dMRmESD66VYLEkQ0XCEscEZnuHhMY=;
        b=GxdKi5WAX8j6lcyiodU1OKw0PU0QJFtlOuZe6RAKeEKFvOn83NdmuZKSeJiC4glDxP
         vDQseXD94jwfSLWvb/PZPb/7x1ZtocFmJFt34Sc7UDmNB7P2NUQn8aSBTOOTBUai0Ylr
         BIcaEf4kZO2dxO0vZ6Q9Tforn3w+UWvWXIPzMy3xvQgIDL28Yf+sQONqlEnA3hXSICXI
         SLBRXGrOf66sZnctoeT8iyw16R7eWI3HaVvSbMb8YzlLGcrgIxF3UHZJCRGOPLhzGw//
         fmRGGcOgakbJvImZQn8f7JW172Q/rt/vBTbAbaf95qam6lYAzM6EbmH5rae8japYprK8
         kodg==
X-Forwarded-Encrypted: i=1; AL+hErHuNi6kbpoJmaKWGmLofih3E3iYBKY20gsQR33tOMtr/08s5kdw0N8DoiwROwVPRtkGQ/XtudInsFOD0bc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rCiqXu0w1wK9IijU9JTZVA84wIPliWihSrKXCBNDiiIpgmS0/
	pEkYpPQUAgsyaYMNxDA4X5S972pw2zX93JP/01tvRw+c/tdC99jo3V+4
X-Gm-Gg: AYBFou2DrhlbTmpBvcKPlpYMrzwkUoW6hI34FGFLCLZAPkcqUuUNJNcmX3XawrwIpvU
	RlRckrLN6seynSnzFAtzpVTHee2LCiOTGs8gE17DobCbrHUbssW+z/5D763i8t1UYJbQ0hsoQCE
	OG2vzjfNLz5ZiuN41WCGowSN8NPValTiaHKK4lFSDYNVk1+GLOl/02OkP4uZkO2p2MlnPZXDBlb
	lq4h6x64xkQyo6Extd/U9jToRiNP3aGSrFbCNjt+nO79VVVQN/lz1LP5mqV72BC07eUdO/R5pnh
	3JgmVy0CWGLe990dNNuWiiQIWrn3HxSFueNwqhSp25otBAsCkMqzop4gFMo2SRQEeBKMBOp+35A
	9XW01V3UUWU5E7ppfnFhJHgq8Qillq1E82seOqzUPHYiVpxC3hk1OXT9oK+iIQZdwwP4IkqRQlV
	P2D27LeiVwZ7aS3z+jyAPX7yjXMrp3mTUj46BJ5snazT0AfQwLtvU89mg8xEtYJZU4n7yIGtoBM
	3I5Q7OnH5Ehowq2+ZKkbpzL1D7xexo34/OFT6H4gdd/4MZf+tUqTCYkU0j77ObqUlQqmGfYbuYl
	mE655vDXzm3I9suYySc0FJaGCEJIQnLEV9dOOQ7ikjL3fhQ8ZGyoI3V6drQtk6QMvqKtj0wbHsj
	rNGBbh+nuC2l4/1oHnQu+OhrUj/A=
X-Received: by 2002:a05:6a00:21ca:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8bc195038abmr5834051b3a.7.1794498144019;
        Thu, 12 Nov 2026 07:42:24 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:21c4:c32f:67c1:d87c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3619sm3790596b3a.5.2026.11.12.07.42.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 07:42:23 -0800 (PST)
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
Subject: [PATCH v6 4/8] ksmbd: refuse a binding request on a connection that is already a channel
Date: Thu, 12 Nov 2026 22:41:51 +0700
Message-ID: <20261112154155.20255-5-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112154155.20255-1-mike.michalo@gmail.com>
References: <20261112154155.20255-1-mike.michalo@gmail.com>
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

smb2_sess_setup() refuses a binding request for a session that the
connection already uses, but is_ksmbd_session_in_connection() only
knows the sessions created on the connection, not the ones it was bound
to as a channel. A connection that is already a channel of a session
can therefore bind to it again. The new binding legs are verified and
signed with the session key at that connection's MessageIds, and on
completion generate_signingkey() replaces the channel's signing key,
while register_session_channel() keeps the old channel entry.

Refuse such a request with STATUS_REQUEST_NOT_ACCEPTED, as MS-SMB2
3.3.5.5 does for a session that is already in Connection.SessionTable,
which a binding adds the session to (3.3.5.5.3).

An AI assistant was used to draft the patch and as an independent
reviewer.

Fixes: f5a544e3bab7 ("ksmbd: add support for SMB3 multichannel")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 fs/smb/server/smb2pdu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index a15dd200645bb..186a497f83c62 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2765,7 +2765,9 @@ int smb2_sess_setup(struct ksmbd_work *work)
 			goto out_err;
 		}
 
-		if (is_ksmbd_session_in_connection(conn, sess_id)) {
+		/* This connection must not already be using the session */
+		if (is_ksmbd_session_in_connection(conn, sess_id) ||
+		    lookup_chann_list(sess, conn)) {
 			rc = -EACCES;
 			goto out_err;
 		}
-- 
2.43.0

