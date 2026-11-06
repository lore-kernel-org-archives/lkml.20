Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958240;
	b=JAHiVLZZwoUYV19SHdShAjLSuYWr7cj2RKMaQyJZOXIootYXk6x8SVzXP1zOX/Ziuitt
	 f+WAxOkZtkTAOy4xeGp737hwUxV4vbHzdySiVENp0w3E0tWfqPSbSUIrDMog9yKamWoNX
	 hT1jggz/onsKzjJaDf9Lc7TpvJPoD5iSdRJ4XgaDtlXB2HlsCvCKfEyvPQ+CCm/6FdPo4
	 WZxpRQuzAXJ4fJX8OVJY57gmMRqVhx8wPDQ4qtleEFZbKMqydWw/U4k68OLaH3VQDuhJ2
	 kVuyLfu4k43yZX1MAGxGBbZ1gmWPrg7+RZuyzTzsolcDihchNvKahSvlXOpHmEpvEzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V8KIdJeSiPXjrPJq4XRkYB2MpzQG5eF49Zf248QFBnM=;
	b=rOo3jv6H68CU1dK6n7/L2hBackyXtT1GvxMwYpme7WsA53X0jLotas/6UIPEFIxsq/70
	 16Crvwl/3IHYchWmdcIcACbnZcFx9tzisGLy0pTfSJaiUDkys4srw6tIO9bNeb7LJ9up2
	 J4JvDoVNmLsaUiWsyuP4XnfMDyPwTJIF/MVsMjdRDOQwnmlUfOLTgSIFDGwOi9FuPC/7t
	 K6R60havjgwf+D6gTSwdGfKPoJDeRx9z12Gqke70Op2TZCvDA3UIVN9cvnv/IAjWERQP4
	 5Gsmu9SOiT/MrzucFpCMtHzKrrGo4PeK9jCwE8aMYYBtpP9h6U/fawE7ynfC2Erf1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHrHhr9l;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C965E606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C965E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHrHhr9l
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e977109392so2070565ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958239; x=1794563039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8KIdJeSiPXjrPJq4XRkYB2MpzQG5eF49Zf248QFBnM=;
        b=eHrHhr9laGKDYTOyqMjkYBXasyUn01lt33lJKauhlZALQX5/Unk/PLA78XMCTFAAVP
         IuPFV43qG7zoBZqCoQL8B4tHGz1M053IVOP/jcYQIsCDkY9Cw31sk3ZdviEz2AOx73ia
         blOASW8eai0klmpcavpQf9tQLiKoqPiY2+Qd3LGsc3i2jdU5+SjBXWrXlcAM9FUS85J7
         eCBG7heychIX9WtDehdrEehgtWpNTjV8RcPzxlpkd/50Vj0mWLZSfShecPl12ZLhuTHO
         loD54BFf8ta/W46H2QKEvFnL+ZCHS6RUx49CUvpNm10Qw5i2/fS4XA6vOgfwh5rU0FhV
         g8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958239; x=1794563039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8KIdJeSiPXjrPJq4XRkYB2MpzQG5eF49Zf248QFBnM=;
        b=mFE6XGEFCgglZ5vl6UySOiGI8NtHdPjBa7EN1LHGC4lvWraQOqe4Qqgw6I+oZHEJ7w
         aQ2/J/H/oqzCJpU5r5oQOHn+smMWG2oAcFFfMJPVU7KJ1Da2SPy0E6m6b8PgzSBs9p7x
         NPxsQ7X2YJGUPxWO4hB8GpaAzdteQ7QhA4CGIZt1qku2FQRFuj55kaP/32Zi+7JgaF2c
         eff2og3FbXlX1qibggZiV9LGHA7D/YJrjdR6OqOjF+VHDHMtY2TpFTq5JCVuuLoCddcG
         MAeCkFrxniS+6/8FVgHQdJl7UG3uoSdIppff8CIdTiaA+hADrSB5N74XQ5536Rze45/z
         WleQ==
X-Forwarded-Encrypted: i=1; AL+hErGjSTEF2egeH3/rFqlDwebWR83pPl4rJvJGU4evR0GqRXr+1/nhCfcV52WDv56Bbt9rX5W7Yv28ifyJxJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gmr2lIHag6dnPOx9aCG96uAbv46iCZVWlnXHEl5WhmUK1X+/U
	56N96z7GYE3MUPXFKwe3P2nhbug4XmTbraFv9XX8eHPzgkR7zH2ry6UDD0Wk/eMZ
X-Gm-Gg: AYBFou1/QaAAGleEf94ENUmpAX9WP1mzIhBNUi2hqHeSXV3RKohX3n7GRPU3yX6IXym
	dCvN5in6j89m2RELeoRsqFvoOencXL/VuMk4HpZs0eL9Rdw/DqtadPOVN4gpdsFYiofsNLXKkSm
	CL9y0O7Iu1FCzh/FGVZ+C64hisndIdKevAH4a1jgdDqaKV/3tp4QoRyE9+H27TXb8F3CMWUT2Q4
	WaQNEpHzBsqnHNqWZQIcNQA+GDrwrzzHsu08eXYWGixVlQ4DpnXoQNhB1vZxF3XSxC+jX7cpBPX
	G3obcdbNAlbv/WiWCi5xEC1F6dHvGVpLK5+7Vi90kAJsgtKb56mEXQDvbWonEuNTl2L3YWD/Z0B
	X1HQaBNh42veSTvowNZjL+vQNETCYmJCn/h4QyCdKWBx406nI31B8NOVDBoclhihy1J4IwtwL7O
	iqAllTaO4TrArl9oRYEg+c5Wq6qZSaRM7ckS/yD+tEgseo1RsaIvqXh6s8aq51b646JNUEld3Hk
	SoLdwfIUNXkqFSOifHImYg7rZWFdP+3QPQPNWVKkgZNh+lQILD6yFpGO0yKTHph3/+umJ4Vv2X0
	Gsq83MLJCeo9vR5WHOJHMx5QTDGacBkIwDh8foU=
X-Received: by 2002:a17:903:2f84:b0:2e9:787c:8e68 with SMTP id d9443c01a7336-2ed4022c338mr26495745ad.0.1793958238920;
        Fri, 06 Nov 2026 01:43:58 -0800 (PST)
Received: from TheRealOne ([2409:40e1:c6:5b93:4213:b798:f74c:177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a9067sm3721385ad.15.2026.11.06.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:43:58 -0800 (PST)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: Chandradhar Kumar <chandradhar.2003@gmail.com>,
	syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com,
	Greg Kroah-Hartman <gregkh@google.com>
Subject: [PATCH] greybus: operation: fix OOB Read in gb_svc_request_handler
Date: Fri,  6 Nov 2026 15:13:00 +0530
Message-ID: <20261106094303.55158-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.0
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

gb_connection_recv() verifies that the received buffer length is at
least sizeof(header) and size >= msg_size but it does not check the
msg_size (from header.size) which can be less than sizeof(header),
that can cause an out-of-bound Read in gb_svc_request_handler().

Check msg_size < sizeof(header) before proceeding with header type.

Fixes: 564c72b1c6f7 ("greybus: operation: fix unaligned memory accesses in receive path")
Reported-by: syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=693652ded53d3eb9cb91
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
 drivers/greybus/operation.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..9afe97731ad8 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1056,6 +1056,12 @@ void gb_connection_recv(struct gb_connection *connection,
 		return;		/* XXX Should still complete operation */
 	}
 
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev, "%s: header size is too short\n",
+				    connection->name);
+		return;
+	}
+
 	if (header.type & GB_MESSAGE_TYPE_RESPONSE) {
 		gb_connection_recv_response(connection,	&header, data,
 					    msg_size);
-- 
2.56.0

