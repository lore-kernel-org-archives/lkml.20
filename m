Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458836;
	b=mQBvV+hJVaFfRrSEWKoZAxOPkewFaweCcc5ZFE1oU699wqDPsadxoFghNF1LQo+fEonp
	 XWLyjXFbz0DV9eXmPyhfWsOkAVXjUJ92JeI8k/Qj6m16+K8UpeeThvw1QU9JHf3V3Nkoo
	 zd/i6eOc/6CqW6/p1L+/7Ri1/qXMAOOjPJPx/xBqPcZdCkFAlCac4iswvVXe/6/Y4G3mk
	 EFU1lFf/PRApGjvw55as3cD/r2tRStcep4QSVukc8YRbL6IutASXFMiKUiS3j8yaYUQ2B
	 BH+RzWAE71k3t6djwJ7oLPuyZ/8ctUe/9YvqtrJOz3zrk8ihSJMwy9vbmu0E5G1Nikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WdHqz9JYcfNaHiavdCpKMF9dVXTFBJuVfJ5Q3LygRzA=;
	b=iYdsDlDJWo96fF63So2k4gxyZKsP4BDKWE8DiuUQ4yGMTxXiDK8AXfzZ2yB9QNBt+HLk
	 t8W3nNiGIs4y/rs9jFIkv2zyd057WnYwdaTKOSkWESt5bZX85YYvYtFDMZwmB/MOmJYFn
	 VyDpOZQHbh8bCCt1BCFkqP5vA5lKTK1QrA8p5uVUAXXPY+qFjomgmY2efC3uh1qrZw2YZ
	 1iMfjHV07d2/vjX1myk0/D7PEBGV56pj0/xOe5lzF7/RC/LzWag24xFYf56SCyCbsIBGT
	 tHfmHUh1SYbsb9pgHTNyA/Ht4ZJwXad/mMcH/aUa5XxOlJAFUKmVH36zRWg3vYGRu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnsALIc7;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709ED606A339
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709ED606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnsALIc7
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37628596783so3644613eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458836; x=1795063636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdHqz9JYcfNaHiavdCpKMF9dVXTFBJuVfJ5Q3LygRzA=;
        b=WnsALIc7uEHaLv/PaKieu8CMijvWhaitGQ2AgB5sBvfanVDHj4xdf43QgjfchJzE+I
         2JJTDh1bIDM3gJjTjJxead0gcZcAVdqF8NyauXiS/qWVXYPD//llfdxfd203vFtSD2D4
         Ezojii0AhCYD01c3lteiuUgJejOF3hG0OFRfA1xi2REm6NASrAtY/13WOorO05N9X5bJ
         X4ASlM0ylb5jsbZmPtRcE83ws7eI7ETSkNX8YdjnZyWf9hXqVePll4FiiwCeMnSnAKsL
         yqGyHFFWsvheQeqhwkuYkJbtxckTBy2HlLvZaPR0rTpj/+JrNJA8kPRTrzcsaMb+RlIu
         QyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458836; x=1795063636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdHqz9JYcfNaHiavdCpKMF9dVXTFBJuVfJ5Q3LygRzA=;
        b=eh3IfnmQ/Znq3WU21pE5Z2c+6uY6/m6g7MzJRYi9BvFBkuunA8Z9MoiJtRPSqX8oEc
         8NW6rzneAnREKfAH0RSQ2LoC3fir6T+C7PCp4KEmX2h7YPscz9JrFUgsTpkEl/zvFu4I
         wgxMoQzC1rfmHrWZzuCneoU8oN7ol1sUz8SwSAtVcqSnIKLkIdHIE/OaNNA5vmaVhGFy
         jrjLW8if+TiM6rCzwmxxyG/FjYGHXc9qFfKRBZiOd5vLNDTLMwUBFBxKVdxQfzO/Rwt9
         Gn8m9CI7KOo/zThvPgGiD8Hl7bI5eY6PPKzn4usm/ljFYh4j8tANO8v7eaRusqbqF6MA
         Ct8A==
X-Forwarded-Encrypted: i=1; AL+hErGnL9eWov1wCet/WaCdtnMJUriwzxz8Ieq8odj6w6Rub7HkG0tWG0jkULl0aTxUsnskvFGIlpqrgCXSJQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bpHT4+hbAlWQcBvAbsiNPXmwe+GbhUGrcc/E9LGKfNHUsi626
	dtJFkkY59GS9p/uSmOZaYqqgn3ag56KPJtQGlO11r3KdHO1/RfMn1wp7wU9+GjGEZBp1s7K2
X-Gm-Gg: AYBFou1KTMgfgZt9qDu5vxQ0zmdMiX8Ir0oXG2HgMhZIqhDRWlzTuvCzISBneOAs66y
	9KC/bXHlfHSVPsYqyFnm0a7nrYqkBEszPLCfj4M45t6YAqP07OdkgC9DQ/GHs6l1R88kMbJbUUh
	k2abj3gPpOEvATp65XhTYNMvMkFWkrPD9s1OKceJAsSo3OqPBTVs6ycjDsGtRVSTYwvN094pYnc
	HFEPvKh8NB1POmjRMhs5NNu7EyqudjN3yIxKPgjg3HNrr8+qampR9L/oH/Z4ngcc/rPXVXU+hkI
	KHtaggyAHHDtCLgOoCyvr18cIXhZmdweTxkyyPoLRlEIgfoFxfgNzKUIrT6E6sIjHxBsZowVHH3
	LH/nVm5VtWJ7Pa5nQGpWZ+e4b03bc1iANVSWxyIfKO2aLaoxrHVXCgnxNFISdf735P2H3851Fn7
	VJOJyo2BVSDeqxOu2uCUTlaX2e2CoAiaRy0mminHG62h20KuxeehFzDs6HrglrNJHAyHd+nWhhq
	+qrGctIknMksdvonevGBT0Uz18SXxUjqkdiymslGHk2ahJP1FwYxXx/V7wCpG4RM55hK6UuM2iu
	EpFQmRIu/tOahct70hpuoO3lUerGuHlvj2CbwasoDgv4Xb8V+XVhcOBJSiMStSpd7CWWD+Ymg2N
	BGv36Dz6rWhTT6sBJByNMdAP4
X-Received: by 2002:a05:7022:1409:b0:1b3:a89c:c456 with SMTP id a92af1059eb24-1b3c024a7e9mr3414920c88.6.1794458835535;
        Wed, 11 Nov 2026 20:47:15 -0800 (PST)
Received: from localhost.localdomain ([2405:9800:b901:33ad:5d51:6f:e2db:335d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm21024827c88.12.2026.11.11.20.47.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:47:15 -0800 (PST)
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
Subject: [PATCH v5 4/8] ksmbd: refuse a binding request on a connection that is already a channel
Date: Thu, 12 Nov 2026 11:46:41 +0700
Message-ID: <20261112044645.4074-5-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112044645.4074-1-mike.michalo@gmail.com>
References: <20261112044645.4074-1-mike.michalo@gmail.com>
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
index 7b07108a48c15..0271ee4753236 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -2722,7 +2722,9 @@ int smb2_sess_setup(struct ksmbd_work *work)
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

