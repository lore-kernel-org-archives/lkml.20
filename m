Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509474;
	b=KNl+N4bB0nhbvLPhWCB2sdtYmPL2ZGmAvzPNh4jCt0fSFRcZkeGg6kjIXQ5pmRDWzQyP
	 DjYT4HMqVDGSJPxkriUGJ3vIsSVysXZb7/N2reSI8Qgp5Zz/6f5bGau/kktcbQ7s2/Yxp
	 1xfwm6Th5yX/WYnnlvy8IbErxe6FFf79UH1c3E6cJRblTdukvXaZJtSisuUn1rOi/Xub+
	 E4EHoTzMzdhlfZS85wKPczeAqhrqBCg7KZEp5yyI3YPnhxjJh5tnVsZAI0yMQciv3QzCA
	 yt768G5Wf2fCPdpEs1v0LGxLXT5UTKTCYRFqvKTiYcWKZRKiWIofQAOjJJr7haFGFXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gFSI+HHYT4seNa8BU1xKJtAjCfEadHjjO87I98TwLD4=;
	b=dStNSig+t+RgTTmNdHur/KQv4aModwZ3VczYyseRYZOXb+410XEgTK7iwlNJLzpjY9O3
	 8Hy4IqeVFzvFclK2Ogwh0FGmKzm/j9WC3iD5RTkBfmhKGY2UU9dHWi2VTfUcSCoWBs9i6
	 D7Xdu0ixr0OJ6pn6irK/o001WH0oEKRimoT2YivNZdSxLZ6uwnqOlEmkkEPCafSQtU1Si
	 jfvIPNSmU/vp0HDVK/pV59r8VLnkFoRQwN8mTqRyNXnNDCvQUPLYnYALsKcRu8iSWKLi7
	 AviY9tP9j6hbJmTF1+bVw/AtJGchiW3NB+PnLkNGLsPmzC9ZZlrkep90IJyWmYXbtHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGxwyCqo;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64360A2612
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F64360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGxwyCqo
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e987a2ba0cso1026885ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509473; x=1795114273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFSI+HHYT4seNa8BU1xKJtAjCfEadHjjO87I98TwLD4=;
        b=qGxwyCqod/rexmsG9ZsOYcnBQFKqr5u+tQrTqRJDpclqKc0CTeDOjoWjisWvRO1o90
         mMvxdQ6y99AnMT/jEkLgWrm2SLatXYb8/Di9++wMqyJTl9JBFwSurP1QvxXMFX5xBYnI
         bYPaHXa8aRuXEOvar1OOCt7OIeJqrc8zwkQgT51cRYGrbQMux66VLAcpxrg6SDUAfAHn
         uGMeUjQAqvx7WG9MqK6MI9Ua4grYSKr9XmGAPSFxUdIzgw7rJf5klXW2d23P4B0wEth5
         vsmKzsBANTXwvSnX5Ft5No7JEffewoaUmvLbHtE6dfQzcPjNCf4pVRWcIGNtbQCPDXvV
         U3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509473; x=1795114273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFSI+HHYT4seNa8BU1xKJtAjCfEadHjjO87I98TwLD4=;
        b=GnEvEzM/0XjV/BTS+c5OBZp/tC+oE2VFh9jP4XxSmZis4TAhYH5ZM8CpzMsb/NpXMS
         XlJWRxn+dMRG5iUOBSurlBA4XfexgCVMDab3vPfpOn/RrPx3SbpTk/MDs65X2XzF+iKs
         PGqhZKaQyTZLcD+2Uz19Rbr7+McZkm5yPp8ZOqoNIchJLH+3ucNIGtAGWHkUgfHoWt4P
         dJMKkOlTOajgvwnXQJysX9nbNMH5xy08aETj6k9oPTy5yIS4Er2frFIrAIt7giEVPfp5
         Y6ZqMABkOjm107u0+0nmQdSMFSke1X3KtuCfKLhdk8Nt/FheRo64Rzliz8q7qy3DgNKR
         GCmQ==
X-Forwarded-Encrypted: i=1; AL+hErH4oHpwmAaF9RAYeVnBVneSfk8Mcv7nfltI76i/Dc0kQmDAlJX96VPgpQ7KF6elkRqOpKDKhfaYM2cyx1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uOjDPK4flksHA/894X6NaeGSosqwAQEkcLF4UT0Ca31JKbm0I
	XGrDZo8r9VavZYnfvu/8rQcUSZLWcgMlzfY309TGKN9kTmu44TcagMen+ep7D7s4DRFVrwFF
X-Gm-Gg: AYBFou127N9zlqGCAVDC6IW3Q1LQZFGF122f8QuqnesyEw/cJgmEP9GoYQL4gYQpgWv
	eWpzvwzADeS2xrw5gsQyqFxfpwM79CJi0lZc0MqRh6sq8DX/Q/YGVtqq3Rh/mvgaXJoFwX/dGuY
	b9zCL24eu+KJhbCFeLGSJ300I+haKTbHTDbuMQfUjUzKooYiq4kApGOzVFHpMz3TR3oK8HA8JvE
	XY5Yz+yo8WaBVmuGYuHxXfdj2cOjb+N6peDNAHJCyWnOsDaU50jaolmbIelBXBDlD6cbeVafenk
	frKBBiteZg+3LAfubc5cbg/kVbKBn5O90Uj0gp4d2WGdDCzEY88YaOgVOnJJzW5BoZ/uT771G6L
	CNv/sYeffy1mAVu+G9rvKzGE9/pAHQixQJw653GYadWOowSoNKRtQPiR4NO/5INqDLSJO2QMUOb
	cz9S/RLu9Od9j16F6z/ZZACXTciISNGweKNzurt0ZMgBGWxdeGGbBv3KHhbMJEtYBzKV52HIahL
	+CatcNO8eb2lK9wGMhhHTPrmWT4e8IjMc3v9oBW+DzPRo69GXuonJHAJiU3OgGZCFE14WjrYrVC
	wV0nzoKflL5zM19neOuXnuy7cg7qz12w4Zmd675zF5ndPIYYMCM1OnHN4SmUkzjlXJYOF6WXgaq
	dWsRcdh4/Wh80kGYA4LIgCoFMsM7ObiVjv8SJsI+IEFNg33A=
X-Received: by 2002:a17:903:3887:b0:2ed:2810:7cc5 with SMTP id d9443c01a7336-2ee0dcc6d2emr2280895ad.56.1794509473534;
        Thu, 12 Nov 2026 10:51:13 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:cbb:dbe2:bd9d:a035])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7cf7bbsm66205ad.29.2026.11.12.10.51.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 10:51:12 -0800 (PST)
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
Subject: [PATCH v7 4/8] ksmbd: refuse a binding request on a connection that is already a channel
Date: Fri, 13 Nov 2026 01:50:40 +0700
Message-ID: <20261112185044.41571-5-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112185044.41571-1-mike.michalo@gmail.com>
References: <20261112185044.41571-1-mike.michalo@gmail.com>
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
index c6e6cf60b1afa..7790aa618fcbb 100644
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

