Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089947;
	b=nIwXa/7PNF1Miq/ZoSuaiwuZ9IYW+F54N9c6RNkW2QbpFvLQ/2tCxymSxqCaXNR93kak
	 TEbftRXkBYvAkZ34dgVDM0wdOIVk6VERkrGRBUfazDX0Lu9Nc6hix9BIvLcD/7ixybOgW
	 +PLe3KSBZaFAPdo9qiwCr8T/Gpb+KBlP+HR3CT98Xdd8xQvn1cjXF4HC37cUDvkQstpCI
	 4w4mfoavMBgq81coJIG/oEF9KpspJHfqBwy21gtUs7nLYWnOQzFv4IHY6h5O6Zng6wqqL
	 J1AcAzILuYdvY9+PPmgEmnDcGNIUfDMATYCPY/P/RbwpwvJ4rh48cx4iDmXVUlH3Gww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bBDjCRfYv01l5K9nHrY3/Hd2EiV/PHl9OnpVwXCk3ew=;
	b=0Ti7FQSBVQqeOjz2+yz4NtqGVWeqcGCYxoc5Toj2ZlnGU7jV1OlmnVWPu8uXUQIcnqRM
	 Y/jN4xn2evwPS0HXki4UQvV7X8vsl+o45Ba6E5fOinPRZMzDPFKSf45ODvT5EbUpLZrek
	 KpIauViMBuI+XEA94kTwHnAG5/4JIxWxewQGZyk0G24BziNBX2owf1wAgE5zLEJ2mva9f
	 3IIkXoTqXiiUYaRsKFANWv4lxcIeoftylM7aRZp8b30zcjqZMEc6UDcFsBO5xfOnNAmsw
	 iWpLy7jWdc8JvtwtZHZVk6025LO7Xy27G6gNZQGFzNeZvUbXb/0VlDi+hR+P96TFWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JGPWpZne;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974F3606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974F3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JGPWpZne
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc758830601so2380392a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089946; x=1793694746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBDjCRfYv01l5K9nHrY3/Hd2EiV/PHl9OnpVwXCk3ew=;
        b=JGPWpZnejBl2k0E3x5C6PtwzodNl+Q6b5PjhKtsnInQyZ9bj2wkbTtLyQLZAowYhh+
         5VJM/JanbOo9njybFJ2DtZ28HRUDUyyqMPexFCPDyRFJ05VYZdlPn0g6m92b6zow6/k0
         PlQRpYhg/LeNrmbo0xy3ezH/CSGJ9Qce7+SegQRopKlzGMqP3202+L7N5xweQTOwDB8O
         KQsh54mTMnqvlHdLmMkf9ON9q1xGT8HFNoeYDZ4LOdzLXVYYBrkQoJ/XBZdk5EGkKD9T
         mai0dKeO8Y1pinqQZXi+FkGAN9IwN3Y+Q4kenrHua35qOCJAMYWb4qYP22np3BhqfBwF
         kVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089946; x=1793694746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBDjCRfYv01l5K9nHrY3/Hd2EiV/PHl9OnpVwXCk3ew=;
        b=a0i94gusck91DoJkqjKaFYNT2YiU5Lu7L5qdg96yYWNIF8NlbQrs+oVkEf6TWqYVqE
         3lovbVfab9bczdK0xsmqs150FwSIPF3SeMz6CK8OudgOqwSKoROWviposLp5AyoyT7lA
         mBVObzim0lie9NaUz3RW3pEy+O8EvEUdggkgfLEgag560IuUByDU/itl2BEKnjY20pfm
         M0JVUuTULUE4hAupjunZiT+gPyW4of46VpNoCN0aoQeCgYwrhmayulH2zDq1NyHITYQm
         JNQpe3pwjXHNUFBJEiIcJ7aqlux4/CTgjjrqdT1Y8l3iKfvleypY9Xo6gKZUKBb7xvZu
         n1yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLEl2baZnvhgh1RYVleyprXW/F1GIXZ95fBHyBDQhV0xforeh5/EhZMprTXZC3XpnCQ+RLeFWCHxROo2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Iky6l86OQK2EqztLf3Eqpr8UStP1aeZh2cjF0F/+cOU6fjAT
	bnkcMRYaXtTYa4WQd15K9H/5AFcYb2UxqcLzekhsxagYYByOpSDfgMKN
X-Gm-Gg: AYBFou2jO1fDRttRdgrRrjVTuODC+YenJSqwCl7IsqvVOn++kHxgouUq3tJhe/esX1N
	3TsGRgxMxo1iRsjt+hFCf4pktAdAaZVnGKLKXwt+hUB/MQ+vl+mDBn7+EIqh1N2i5C76VOa5U6u
	O3oZNDCwJmM278C6RtAnGb7bkJs8myjO4rEn9PpiefyCAvW/MrF/jq3Gz/M55GTgIukVSIg987X
	XjoJF40WWiCCANMgQFRKB8ikB4+QxFG7SixBnubZ/4A3Rq2P7FphWfjWIEiDefD0EcyxXa8zLDG
	AnamuG4RF7WtzIpBFfeQV+m9txR2tyOdkpKwbl5Ta0YAgFPBGAVq5SA5iTQTXWDH/7YA/ERq2pC
	uVlWPqk+qiSaldpSFpbrlmksv9F24kMzyeve1BS7304Oinfl/OyXq9Jq/O4jltnCyM3Of6w0hIJ
	XpdOEjj5i/AzxNb9G4SVYB0yS16U57VQ8VCjrTVGFtIj4DuygJqFEzksw0kXk4DQW0z32CSjciC
	cGMknAl5mHQ0efLYMRaVAPGHBrRFcemP27xH3oeCvPclWvLn0itdiAHG2C+YRX4ZHn2pD1oPpHK
	rncx5os1XL7Uu5yikumRQBwIQUnJAL6X6cEYYLaE0C2jzzHzb98=
X-Received: by 2002:a05:6a21:880e:b0:3e1:c1a4:91f6 with SMTP id adf61e73a8af0-3e7cd4d9db9mr6517172637.13.1793089945941;
        Tue, 27 Oct 2026 01:32:25 -0700 (PDT)
Received: from WIN-L6GHNQALH57 (1-21-119-227.east.dxpn.ucom.ne.jp. [1.21.119.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36b37251fsm2018741b3a.27.2026.10.27.01.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:32:25 -0700 (PDT)
From: Masafumi Suzuki <shengshilingmu97@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masafumi Suzuki <shengshilingmu97@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] sctp: account for chunk padding in sctp_init_cause()
Date: Tue, 27 Oct 2026 17:24:05 +0900
Message-ID: <20261027082405.1297-1-shengshilingmu97@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

sctp_init_cause() accepts a chunk when skb_tailroom() can hold the
cause header and the payload. sctp_addto_chunk() then writes 0-3
bytes of padding before that header so the chunk stays 4-byte
aligned. The check does not include the padding, and the following
skb_put() calls skb_over_panic() from softirq.

Count the padding sctp_addto_chunk() is about to write. The cause
length on the wire stays the header plus the payload.

Fixes: 8914f4bace3f ("sctp: add sctp_make_op_error_limited and reuse inner functions")
Cc: stable@vger.kernel.org
Signed-off-by: Masafumi Suzuki <shengshilingmu97@gmail.com>
---
 net/sctp/sm_make_chunk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 84a4c97d0f75..8933caadcdb6 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -133,20 +133,27 @@ static const struct sctp_paramhdr prsctp_param = {
  * cause codes will be embedded inside an abort chunk.
  */
 int sctp_init_cause(struct sctp_chunk *chunk, __be16 cause_code,
 		    size_t paylen)
 {
 	struct sctp_errhdr err;
+	int chunklen, padlen;
 	__u16 len;
 
 	/* Cause code constants are now defined in network order.  */
 	err.cause = cause_code;
 	len = sizeof(err) + paylen;
 	err.length = htons(len);
 
-	if (skb_tailroom(chunk->skb) < len)
+	/* sctp_addto_chunk() pads the chunk up to a 4-byte boundary before
+	 * appending the cause, so account for that padding here as well.
+	 */
+	chunklen = ntohs(chunk->chunk_hdr->length);
+	padlen = SCTP_PAD4(chunklen) - chunklen;
+
+	if (skb_tailroom(chunk->skb) < padlen + len)
 		return -ENOSPC;
 
 	chunk->subh.err_hdr = sctp_addto_chunk(chunk, sizeof(err), &err);
 
 	return 0;
 }
-- 
2.47.0
